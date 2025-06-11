--// ReplicatedStorage.ClientModules.Core.DoorsM.Door (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("InteriorsM")
local v_u_5 = v1("Debug")
local v_u_6 = v1("CollisionsClient")
local v_u_7 = v1("StateManagerClient")
local v_u_8 = v1("Debug").create_log()
local v_u_9 = v1("MouseCursorHider")
local v_u_10 = v1("UIManager")
local v_u_11 = v1("RoleplayDB")
local v_u_12 = v1("FamilyHelper")
local v_u_13 = v1("DoorAnimator")
local v_u_14 = v1("BezierCurve")
local v_u_15 = v1("TweenPromise")
local v_u_16 = v1("new:StreamingPauseState")
local v_u_17 = require(game.ReplicatedStorage.new.modules.Explorer)
local v_u_18 = v1("MinigameForcedState")
local v19 = v1("Signal")
local v_u_20 = v1("package:Sift")
local v_u_21 = {
    ["entering_door"] = false,
    ["entering_door_started"] = v19.new(),
    ["entering_door_finished"] = v19.new()
}
local v_u_22 = false
local v_u_23 = false
local function v_u_31(p24)
    local v25
    if p24.Parent.Parent:FindFirstChild("Buildings") then
        v25 = p24.Parent.Parent.Buildings:FindFirstChild(p24.Name:gsub("/[a-zA-Z0-9]*$", ""))
    else
        v25 = nil
    end
    local v26 = v25 or p24.Parent.Parent
    local v27 = {}
    if v26:FindFirstChild("InTheWay") then
        v_u_8("Dev note: Using InTheWay parts as collision group")
        for _, v28 in v26.InTheWay:GetDescendants() do
            if v28:IsA("BasePart") then
                v27[v28] = true
            end
        end
    else
        v_u_8("Dev warning: Using all building parts as collision group")
        for _, v29 in v26:GetDescendants() do
            if v29:IsA("BasePart") then
                v27[v29] = true
            end
        end
    end
    for _, v30 in p24:GetDescendants() do
        if v30:IsA("BasePart") then
            v27[v30] = true
        end
    end
    return v_u_20.Set.toArray(v27)
end
local function v_u_39(p32, p33)
    if type(p33) == "boolean" then
        local v34 = {}
        for v35, v36 in p32 do
            v34[v35] = v36.CanCollide
            v36.CanCollide = false
        end
        return v34
    end
    for v37, v38 in p32 do
        v38.CanCollide = p33[v37]
    end
end
function v_u_21.new(p_u_40, p41)
    local v42 = {
        ["__index"] = v_u_21
    }
    local v_u_43 = setmetatable({}, v42)
    v_u_43.is_opened_time = 0
    v_u_43.is_open = false
    v_u_43.is_visually_open = false
    v_u_43.entering = false
    v_u_43.door_entering_signal = p41
    v_u_43.can_enter = true
    v_u_43.door_model = p_u_40
    v_u_43.working_parts = p_u_40:WaitForChild("WorkingParts")
    v_u_43.configuration = v_u_43.working_parts:WaitForChild("Configuration")
    v_u_43.working_parts:WaitForChild("TouchToEnter").Touched:connect(function(p44)
        if v_u_43.can_enter then
            if p44.Parent == game.Players.LocalPlayer.Character then
                local v45 = v_u_43.working_parts.TouchToEnter
                local v46 = game.Players.LocalPlayer.Character
                if v46 then
                    v46 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                end
                local v47
                if v46 then
                    v47 = v46.Velocity:Dot(v45.Position - v46.Position) > 0
                else
                    v47 = nil
                end
                if v47 then
                    if v_u_18.can_enter_doors() then
                        if v_u_43.is_open then
                            local v48 = v_u_43:get_config("roleplay_role_requirements")
                            if v48 then
                                local v49 = v_u_2.get("roleplay_role") or {}
                                local v50 = v48:FindFirstChild("building_id")
                                local v51
                                if v50 and v49.building_id ~= v50.Value then
                                    v51 = v_u_11[v50.Value].roles
                                else
                                    v51 = nil
                                end
                                local v52 = v48:FindFirstChild("role_id")
                                if v52 then
                                    v51 = v49.role_id ~= v52.Value and { v_u_11[v50.Value].roles[v52.Value] } or v51
                                end
                                if v51 then
                                    v_u_10.apps.MissingRoleApp:show_missing_roles(v51)
                                    return
                                end
                            end
                            if v_u_4.can_enter(v_u_43:get_config("destination_id")) then
                                if not v_u_22 then
                                    v_u_22 = true
                                    for _, v53 in script:GetChildren() do
                                        if require(v53)(p_u_40) == false then
                                            v_u_22 = false
                                            return
                                        end
                                    end
                                    v_u_43:enter()
                                    wait(0.5)
                                    v_u_22 = false
                                end
                            else
                                return
                            end
                        else
                            local v54 = v_u_43:get_config("house_owner")
                            if v54 then
                                v54 = game.Players:FindFirstChild(v54)
                            end
                            if v54 and (p_u_40:IsDescendantOf(workspace.HouseExteriors) and (not v_u_2.get("dev_watchmode") and (v_u_2.get_server(v54, "door_locked") == true and (not v_u_12.is_my_friend_or_family(v54) and v54 ~= game.Players.LocalPlayer)))) then
                                if v_u_23 then
                                    return
                                end
                                v_u_23 = true
                                task.spawn(function()
                                    v_u_10.apps.HintApp:hint({
                                        ["overridable"] = true,
                                        ["text"] = "This door is locked!",
                                        ["length"] = 4
                                    })
                                    v_u_23 = false
                                end)
                            end
                            return
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    end)
    return v_u_43
end
function v_u_21.get_config(p55, p56)
    local v57 = v_u_17.get(p55.door_model, { "WorkingParts", "Configuration", p56 })
    if v57 then
        return v57.Value
    end
end
function v_u_21.create_fall_through_preventer(p58, p_u_59)
    local v_u_60 = Instance.new("Part")
    local v61 = p58.working_parts:FindFirstChild("NonFallthroughFloor") == nil
    assert(v61, "NonFallthroughFloor is no longer supported. It should be deleted since it is no longer necessary. A large fixed-size automated fall through preventer will be generated. It is positioned based on the CFrame and Size.Y of the TouchToEnter part. Effectively, the bottom plane of the TouchToEnter becomes the automatically generated new fall through preventer.")
    local v62 = p58.working_parts:WaitForChild("TouchToEnter")
    v_u_60.Name = "FallThroughPreventer"
    v_u_60.Anchored = true
    v_u_60.Transparency = 1
    v_u_60.Size = Vector3.new(256, 50, 256)
    v_u_60.CFrame = v62.CFrame * CFrame.new(0, -v62.Size.Y / 2 - 25, 0)
    v_u_60.CanCollide = false
    v_u_60.Parent = workspace
    task.spawn(function()
        local v63 = game.Players.LocalPlayer.Character
        if v63 then
            v63 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        end
        if v63 then
            while v_u_60.Parent and v63.Parent do
                local v64 = v_u_60.CFrame * CFrame.new(0, v_u_60.Size.Y / 2, 0)
                local v65 = v63.CFrame
                local v66 = -p_u_59.HipHeight - v63.Size.Y / 2
                if v64:PointToObjectSpace(v65 * Vector3.new(0, v66, 0) + Vector3.new(0, 0.4, 0)).Y > 0 or v63.AssemblyLinearVelocity.Y < -1 then
                    v_u_60.CanCollide = true
                    return
                end
                task.wait()
            end
        end
    end)
    return v_u_60
end
function v_u_21.enter(p_u_67, p68)
    local v_u_69 = p68 or {}
    if v_u_69.is_exit_button == nil then
        v_u_69.is_exit_button = false
    end
    p_u_67.destination_id = p_u_67:get_config("destination_id")
    p_u_67.destination_door_id = p_u_67:get_config("destination_door_id")
    p_u_67.house_owner = game.Players:FindFirstChild(p_u_67:get_config("house_owner") or "")
    local v_u_70 = v_u_69.override_destination_id or p_u_67.destination_id
    local v_u_71 = v_u_69.override_door_id or p_u_67.destination_door_id
    v_u_10.apps.PeopleInsideCountApp:hide_people_count({
        ["door"] = p_u_67.door_model
    })
    local v72 = game.Players.LocalPlayer.Character
    if v_u_21.entering_door == true then
        return
    elseif v72 == nil then
        return
    else
        local v_u_73 = v72:FindFirstChild("Humanoid")
        if v_u_73 == nil then
            return
        elseif v72:FindFirstChild("HumanoidRootPart") == nil then
            return
        else
            local v74 = v72:FindFirstChild("GrapplingHookTool")
            if not (v74 and v74:FindFirstChild("GrappleParts")) then
                local v75 = v_u_2.get("state_manager")
                local v76 = #v_u_7.get_states_by_id(v75, "PlayerRidingPet") >= 1 and true or #v_u_7.get_states_by_id(v75, "PlayerFlyingPet") >= 1
                if not v_u_69.is_exit_button and (v_u_73.Sit == true and not v76) then
                    local v77 = v_u_73.SeatPart
                    if (not v77 or (v77.Name ~= "VehicleSeat" or v_u_70 ~= "Neighborhood" and v_u_70 ~= "MainMap")) and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GliderFlying") == nil then
                        return
                    end
                end
                p_u_67.door_entering_signal:Fire()
                v_u_10.set_app_visibility("GuideArrowApp", false)
                local v_u_78 = nil
                v_u_5.pcall_print_error(function()
                    v_u_21.entering_door = true
                    v_u_21.entering_door_started:Fire(v_u_70, v_u_71)
                    v_u_6.set_collidable(false)
                    local v79 = {
                        ["house_owner"] = p_u_67.house_owner,
                        ["exiting_door"] = p_u_67.door_model,
                        ["skip_send_passive_door_request"] = true,
                        ["skip_set_player_collisions"] = true,
                        ["studs_ahead_of_door"] = p_u_67:get_config("StudsAheadOfDoor")
                    }
                    v_u_3.get("AdoptAPI/SendPassiveDoorEnter"):FireServer(v_u_70, v_u_71, v79)
                    v_u_3.get("AdoptAPI/MarkEnteredDoorTime"):FireServer()
                    v_u_2.update("client_door_entered_time", tick())
                    local v_u_80 = v_u_31(p_u_67.door_model)
                    local v_u_81 = v_u_39(v_u_80, false)
                    local v82 = p_u_67.working_parts
                    local v_u_83 = p_u_67.configuration:FindFirstChild("TransitionColor")
                    if v_u_83 then
                        v_u_83 = p_u_67.configuration.TransitionColor.Value
                    end
                    local v_u_84 = v82:WaitForChild("TouchToEnter")
                    v_u_78 = p_u_67:create_fall_through_preventer(v_u_73)
                    local v85 = nil
                    local v86 = 0
                    if v_u_69.is_exit_button then
                        ::l4::
                        v79.camera_rootpart_cframe_offset = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame:toObjectSpace(workspace.CurrentCamera.CFrame)
                        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                        local v87 = v_u_84.CFrame * CFrame.new(0, 0, v_u_84.Size.Z / 2 - 1)
                        local v88 = v_u_84.CFrame * CFrame.new(0, 0, v_u_84.Size.Z / 2 + 15)
                        local v89 = game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(v86 + 0.8, Enum.EasingStyle.Linear), {
                            ["CFrame"] = CFrame.new(v87.p, v88.p)
                        })
                        v_u_16.enter_loading_screen("Door:enter")
                        local v91 = v82.Destroying:Once(function()
                            local v90 = {
                                ["color"] = v_u_83
                            }
                            v_u_10.apps.TransitionsApp:sudden_fill(v90)
                        end)
                        v89:Play()
                        v89.Completed:wait()
                        v91:Disconnect()
                        v_u_10.apps.TransitionsApp:sudden_fill({
                            ["color"] = v_u_83
                        })
                        local v92 = v_u_9.hide()
                        task.wait(0.1)
                        function v79.player_about_to_teleport()
                            v_u_78:Destroy()
                            v_u_39(v_u_80, v_u_81)
                        end
                        if v85 then
                            v85:cancel()
                        end
                        v_u_4.enter(v_u_70, v_u_71, v79)
                        task.wait(0.1)
                        v_u_16.await_unpaused()
                        v_u_16.exit_loading_screen("Door:enter")
                        v92()
                        v_u_10.apps.TransitionsApp:transition({
                            ["length"] = 0.4,
                            ["start_transparency"] = 0,
                            ["end_transparency"] = 1,
                            ["color"] = v_u_83
                        })
                        v_u_73:SetAttribute("IsEnteringDoor", nil)
                        return
                    else
                        v_u_73:SetAttribute("IsEnteringDoor", true)
                        game.Players.LocalPlayer.SetControlEnabled:Fire(false)
                        local v93 = game.Players.LocalPlayer.Character.HumanoidRootPart
                        local v94 = v93.CFrame
                        local v95 = CFrame.lookAt(v_u_84.Position, v_u_84.Position - v_u_84.CFrame.LookVector)
                        local v96 = v95:ToObjectSpace(v94).Position
                        if not p_u_67:get_config("do_not_center") then
                            local v97 = v96.X
                            if math.abs(v97) + v93.Size.X / 2 > v_u_84.Size.X / 2 then
                                local v_u_98 = v_u_14.new({
                                    v94,
                                    v95 * CFrame.new(v96.X, 0, 0),
                                    v95 * CFrame.new(0, 0, v96.Z),
                                    v95
                                }, {
                                    ["constant_speed"] = true
                                })
                                local v99 = v_u_98:get_length() / v_u_73.WalkSpeed
                                v86 = math.min(1, v99)
                                v85 = v_u_15.callback(0, 1, TweenInfo.new(v86), function(p100)
                                    v_u_73:Move(v_u_98:get_value(p100).LookVector)
                                end):andThen(function()
                                    v_u_73:Move(v_u_84.CFrame.LookVector * -1)
                                end)
                                goto l4
                            end
                        end
                        v_u_73:Move(v_u_84.CFrame.LookVector * -1)
                        goto l4
                    end
                end)
                if v_u_78 then
                    v_u_78:Destroy()
                end
                v_u_6.delayed_set_collidable(true, 7)
                v_u_10.set_app_visibility("GuideArrowApp", true)
                v_u_21.entering_door = false
                v_u_21.entering_door_finished:Fire(v_u_70, v_u_71)
            end
        end
    end
end
function v_u_21.arrive(p101)
    local v_u_102 = v_u_31(p101.door_model)
    local v_u_103 = v_u_39(v_u_102, false)
    local v104 = game.Players.LocalPlayer.Character
    local v105
    if v104 then
        v105 = v104:FindFirstChild("Humanoid")
    else
        v105 = nil
    end
    if v105 then
        local v_u_106 = p101:create_fall_through_preventer(v105)
        task.delay(0.2, function()
            v_u_39(v_u_102, v_u_103)
            v_u_106:Destroy()
        end)
    end
end
function v_u_21.visually_open(p107)
    if p107.is_visually_open then
        return
    else
        p107.is_visually_open = true
        if p107.door_model:IsDescendantOf(workspace) then
            v_u_13.open(p107)
        end
    end
end
function v_u_21.visually_close(p108)
    if p108.is_visually_open then
        p108.is_visually_open = false
        if p108.door_model:IsDescendantOf(workspace) then
            v_u_13.close(p108)
        end
    else
        return
    end
end
function v_u_21.open(p_u_109)
    if p_u_109.is_open then
        p_u_109.is_opened_time = tick()
    else
        p_u_109.is_opened_time = tick()
        p_u_109.is_open = true
        local v110 = p_u_109:get_config("destination_id")
        local v111 = p_u_109:get_config("destination_door_id")
        local v112 = game.Players:FindFirstChild(p_u_109:get_config("house_owner") or "")
        if not p_u_109:get_config("do_not_show_people_inside_count") then
            v_u_10.apps.PeopleInsideCountApp:show_people_count({
                ["door"] = p_u_109.door_model,
                ["destination_id"] = v110,
                ["destination_door_id"] = v111,
                ["house_owner"] = v112
            })
        end
        local v_u_113 = p_u_109:get_config("door_close_time") or 0.5
        task.spawn(function()
            p_u_109:visually_open()
            repeat
                task.wait(0.1)
            until v_u_113 < tick() - p_u_109.is_opened_time
            v_u_10.apps.PeopleInsideCountApp:hide_people_count({
                ["door"] = p_u_109.door_model
            })
            p_u_109:visually_close()
            p_u_109.is_open = false
        end)
    end
end
return v_u_21