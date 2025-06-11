--// ReplicatedStorage.ClientModules.Core.InteriorsM.InteriorsM (ModuleScript)

local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("Location")
local v4 = v_u_2("CriticalSection")
local v_u_5 = v_u_2("VehicleUtil")
local v_u_6 = v_u_2("RouterClient")
local v7 = v_u_2("Signal")
local v_u_8 = v_u_2("WeatherClient")
local v_u_9 = v_u_2("CollisionsClient")
local v_u_10 = v_u_2("DoorDB")
local v_u_11 = v_u_2("Camera")
local v_u_12 = v_u_2("CharWrapperClient")
local v_u_13 = v_u_2("ClientData")
local v_u_14 = v_u_2("StateManagerClient")
local v_u_15 = v_u_2("PetEntityManager")
local v_u_16 = v_u_2("Debug").create_log()
local v_u_17 = v_u_2("PetFurnitureExit")
local v_u_18 = v_u_2("RoleplayDB")
local v_u_19 = v_u_2("Raycast")
local v_u_20 = v_u_2("MinigameForcedState")
local v_u_21 = v_u_2("new:StreamingPauseState")
local v_u_22 = v_u_2("new:ClientFramerateLog")
local v_u_23 = v_u_2("InteractionsEngine")
local v_u_24 = v_u_2("CloudValues")
local v_u_25 = require(game.ReplicatedFirst.Load.LoadTimers)
local v_u_26 = {}
local v_u_27 = v4.new()
v_u_26.allow_non_character_teleports = true
function v_u_26.set_allow_non_character_teleports(p28)
    v_u_26.allow_non_character_teleports = p28
end
v_u_26.entering = false
v_u_26.on_location_changed = v7.new()
v_u_26.on_location_changing = v7.new()
local v_u_29 = nil
local function v_u_34(p30, p31, p32)
    v_u_26.on_location_changing:Fire(p30, p31)
    v_u_17.exit_furniture_states_if_setting_enabled()
    if v_u_29 then
        v_u_29:exit(p30, p32)
        v_u_22.remove_tag((("interior_%*"):format(v_u_29.full_destination_id)))
    end
    local v33 = v_u_3.new(p30, p31, p32)
    v_u_6.get("LocationAPI/SetLocation"):FireServer(v33.destination_id, v33.house_owner, v33.sub_destination_id)
    v_u_29 = v33
    v_u_22.add_tag((("interior_%*"):format(v33.full_destination_id)))
    v_u_26.on_location_changed:Fire(v33)
    return v33
end
local v_u_35 = 0
local function v_u_43(p36)
    local v37 = game.Players.LocalPlayer.Character:FindFirstChild("Head")
    if v37 then
        local _, v38 = v_u_19.FindPartOnRay(Ray.new(v37.Position, workspace.CurrentCamera.CFrame.Position - v37.Position), { game.Players.LocalPlayer.Character }, nil, {
            ["ignore_transparent"] = true,
            ["ignore_water"] = true,
            ["ignore_non_cancollide"] = false
        })
        if v38 and (v38 - v37.Position).Magnitude < (p36.camera_zoom or 12) - 1 then
            v_u_35 = v_u_35 + 1
            local v_u_39 = v_u_35
            local v_u_40 = workspace:GetPartBoundsInRadius(v38, 1.5)
            for _, v41 in v_u_40 do
                if not v41.CanCollide and v41.Transparency ~= 1 then
                    v41:SetAttribute("UnobscureTicket", v_u_39)
                    v41:SetAttribute("OverrideCollidesWithCamera", true)
                end
            end
            task.delay(10, function()
                for _, v42 in v_u_40 do
                    if not v42 or v42.Parent == nil then
                        return
                    end
                    if v42:GetAttribute("UnobscureTicket") == v_u_39 then
                        v42:SetAttribute("UnobscureTicket", nil)
                        v42:SetAttribute("OverrideCollidesWithCamera", nil)
                    end
                end
            end)
        end
    end
end
local function v_u_49(p44, p45)
    local v46 = p44.camera_zoom
    local v47 = p45 * Vector3.new(0, 2, -2)
    local v48 = p45 * Vector3.new(0, 0, -5)
    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    workspace.CurrentCamera.CFrame = CFrame.new(v47, v48)
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    v_u_11.set_zoom_distance(v46 or 12)
end
local function v_u_50()
    while not game.Players.LocalPlayer.Character do
        game.Players.LocalPlayer:GetPropertyChangedSignal("Character"):Wait()
    end
    return game.Players.LocalPlayer.Character
end
local function v_u_90(p51)
    local v52 = p51.settings
    local v53 = p51.touch_to_enter
    local v54 = p51.destination_id
    local v55 = p51.current_location
    local v56 = p51.player_about_to_be_unanchored
    local v57 = p51.teleport_completed_callback
    local v58 = v52.spawn_cframe
    if v58 and typeof(v58) == "function" then
        v58 = v58(v55.interior)
    end
    local v59 = v52.player_to_teleport_to
    local v60 = v52.studs_ahead_of_door or 0
    local v61
    if v_u_26.allow_non_character_teleports then
        v61 = game.Players.LocalPlayer.Character
        if not v61 then
            return
        end
    else
        v61 = v_u_50()
    end
    while true do
        if game.Players.LocalPlayer.Character ~= v61 then
            warn("[InteriorsM] Character changed while waiting for Humanoid and HumanoidRootPart. What happened? Conflicting respawn?")
            return
        end
        local v62 = v61:FindFirstChild("Humanoid")
        local v63 = v61:FindFirstChild("HumanoidRootPart")
        if v62 and v63 then
            break
        end
        task.wait()
    end
    while not (v_u_13.get("state_manager") and v_u_13.get("char_wrapper")) do
        if game.Players.LocalPlayer.Character ~= v61 then
            warn("[InteriorsM] Character changed while waiting for state_manager and char_wrapper. What happened? Conflicting respawn?")
            return
        end
        task.wait()
    end
    if v58 and (v_u_13.get("team") == "Babies" and v_u_13.get("state_manager").connected_to_char ~= nil) then
        v58 = nil
    end
    if workspace.StreamingEnabled then
        local v_u_64 = v58 or v53.CFrame
        local v65, v66 = pcall(function()
            game.Players.LocalPlayer:RequestStreamAroundAsync(v_u_64.Position, v_u_24:getValue("streaming", "interiors_tp_request_stream_around_timeout"))
        end)
        if not v65 then
            warn((("RequestStreamAroundAsync failed (continuing anyways): %*"):format(v66)))
        end
    end
    local v67
    if v58 then
        if v62.Sit then
            v62.Sit = false
            v62.Jump = true
            local v68 = v62.SeatPart
            local v69 = v68
            if v69 then
                v69 = v68:FindFirstChild("SeatWeld")
            end
            if v69 then
                v69:Destroy()
            end
            task.wait(0.2)
        end
        if v59 then
            v67 = v_u_6.get("LocationAPI/GetPlayerCFrame"):InvokeServer(v59)
            if not v67 or (v67.p - v58.p).Magnitude >= 1000 then
                v67 = v58
            end
        else
            v67 = v58
        end
        v56()
        v63.Anchored = false
        v63.CFrame = v67
        if v52.camera_cframe then
            workspace.CurrentCamera.CFrame = v52.camera_cframe
        elseif v52.move_camera then
            v_u_49(v52, v67)
        end
        v57()
    else
        game.Players.LocalPlayer.SetControlEnabled:Fire(false)
        v62:Move(v53.CFrame.lookVector)
        task.wait(0.2)
        local v70 = game.Players.LocalPlayer.Character.Humanoid.SeatPart
        if v70 and v70.Name == "VehicleSeat" then
            local v71 = v_u_5.get_vehicle_ground_pos_y(v70.Parent)
            local v72 = v70.Position.Y - v71
            local v73 = v70.CFrame:toObjectSpace(v63.CFrame)
            local v74, v75 = v70.Parent:GetBoundingBox()
            local v76 = v74:ToObjectSpace(v70.CFrame)
            local v77 = v75.z + v76.z
            local v78 = math.clamp(v77, 0, 100)
            local v79 = v53.CFrame * CFrame.new(0, -v53.Size.Y / 2 + v72, -v60 - v78)
            v56()
            v63.Anchored = false
            v70.Parent:SetPrimaryPartCFrame(v79)
            v63.CFrame = v79:toWorldSpace(v73)
            v57()
            if v54 == "MainMap" or v54 == "Neighborhood" then
                v67 = v58
            else
                spawn(function()
                    v_u_6.get("VehicleAPI/DespawnVehicle"):InvokeServer()
                end)
                v67 = v58
            end
        else
            local v80 = v_u_13.get("state_manager")
            local v81 = #v_u_14.get_states_by_id(v80, "PlayerRidingPet") >= 1 and true or #v_u_14.get_states_by_id(v80, "PlayerFlyingPet") >= 1
            for _, v82 in v_u_13.get("pet_state_managers") do
                local v83 = v82.char
                if v81 and (v83 and (v83:FindFirstChild("Humanoid") and v83:FindFirstChild("HumanoidRootPart"))) then
                    local v84 = v53.CFrame * CFrame.new(0, -v53.Size.Y / 2, -v60)
                    local v85 = v83.Humanoid.HipHeight + v83.HumanoidRootPart.Size.Y / 2 + (v63.Position.Y - v83.HumanoidRootPart.Position.Y)
                    v58 = v84 + Vector3.new(0, v85, 0)
                    break
                end
            end
            if v58 then
                v67 = v58
            else
                local v86 = v53.CFrame * CFrame.new(0, -v53.Size.Y / 2, -v60)
                local v87 = v62.HipHeight + v63.Size.Y / 2
                v67 = v86 + Vector3.new(0, v87, 0)
            end
            v56()
            v63.Anchored = false
            v63.CFrame = v67
            v63.Velocity = Vector3.new()
            v57()
        end
        v_u_49(v52, v55.door.WorkingParts.TouchToEnter.CFrame)
        task.wait(0.2)
        v_u_43(v52)
        game.Players.LocalPlayer.SetControlEnabled:Fire(true)
    end
    if v62.Sit and not v67 then
        local v88 = game.Players.LocalPlayer.Character
        local v89 = tick()
        repeat
            task.wait(0.2)
            v_u_16("Position " .. (v63.Position - v53.Position).Magnitude)
        until (v63.Position - v53.Position).Magnitude < 500 or (game.Players.LocalPlayer.Character ~= v88 or tick() - v89 > 12)
    end
end
local function v_u_119(p91, p92, p93, p94)
    local v_u_95 = p93 or {}
    local v96
    if v_u_95.skip_set_player_collisions then
        v96 = v_u_95.skip_set_player_collisions
    else
        v96 = false
    end
    local v97
    if v_u_95.skip_set_player_collisions then
        v97 = v_u_95.skip_send_passive_door_request
    else
        v97 = false
    end
    local v98 = v_u_13.get("roleplay_role")
    if v98 then
        local v99 = v_u_18[v98.building_id].roles[v98.role_id]
        if v99 and (not v99.pay_outside_designated_interior and v99.building_entry.destination_id ~= p91) then
            v_u_6.get("RoleplayAPI/AbandonRoleplayRole"):FireServer()
        end
    end
    if p94 then
        task.wait(0.5)
    end
    local v_u_100
    if v_u_26.allow_non_character_teleports then
        v_u_100 = game.Players.LocalPlayer.Character
    else
        v_u_100 = v_u_50()
    end
    if v_u_100 then
        v_u_100 = v_u_100:FindFirstChild("HumanoidRootPart")
    end
    if v_u_100 then
        v_u_100.Anchored = true
    end
    local v_u_101 = {}
    for _, v102 in pairs(v_u_12.get_all_char_wrappers()) do
        local v103 = v_u_14.get(v102.char)
        if v102.is_pet and (v102.controller == game.Players.LocalPlayer and (v103 and not (v_u_14.has_state(v103, "PetBeingFlown") or v_u_14.has_state(v103, "PetBeingRidden")))) then
            table.insert(v_u_101, v102)
            local v104 = v102.char
            if v104 then
                v104 = v102.char:FindFirstChild("HumanoidRootPart")
            end
            if v104 then
                v104.Anchored = true
            end
            local v105 = v_u_15.get_pet_entity(v102.char)
            if v105 ~= nil then
                v_u_15.mark_is_changing_interiors(v105, true)
            end
        end
    end
    if v_u_95.post_character_anchored_wait then
        task.wait(v_u_95.post_character_anchored_wait)
    end
    if not v96 then
        v_u_9.set_collidable(false)
    end
    if not v97 then
        v_u_6.get("AdoptAPI/SendPassiveDoorEnter"):FireServer(p91, p92, v_u_95)
    end
    local v106 = not v_u_95.exiting_door and v_u_29
    if v106 then
        v106 = v_u_29.door
    end
    if v106 and v106.Parent then
        local v107 = v106.WorkingParts.Configuration:FindFirstChild("door_db_entry")
        if v107 and (v_u_10[v107.Value] and v_u_10[v107.Value].on_exit) then
            v_u_10[v107.Value].on_exit()
        end
    end
    local v108 = v_u_34(p91, p92, v_u_95)
    local v109 = v_u_8.get_weather_id(v108)
    v_u_8.remove_lighting(5, true)
    v_u_8.remove_lighting(2, true)
    v_u_8.add_interior_lighting(2, v109, true)
    local v_u_110 = v_u_2("DoorsM").get_door(v108.door)
    if v108.door.WorkingParts.Configuration:FindFirstChild("NoAutoOpen") == nil then
        v_u_110:open()
    end
    local function v_u_113()
        for _, v111 in pairs(v_u_101) do
            if v111.char:FindFirstChild("HumanoidRootPart") then
                v111.char.HumanoidRootPart.Anchored = false
            end
            local v_u_112 = v_u_15.get_pet_entity(v111.char)
            if v_u_112 ~= nil then
                task.defer(function()
                    v_u_15.mark_is_changing_interiors(v_u_112)
                end)
            end
        end
    end
    local function v116()
        for _, v114 in pairs(v_u_101) do
            if v114.char:FindFirstChild("HumanoidRootPart") then
                if v114.char:FindFirstChild("Humanoid") and v114.char.Humanoid.Sit == false then
                    v114.char.HumanoidRootPart.Velocity = Vector3.new()
                    v114.char.HumanoidRootPart.CFrame = v_u_100.CFrame
                end
                local v115 = v_u_15.get_pet_entity(v114.char)
                if v115 ~= nil then
                    v_u_15.mark_for_immediate_teleport(v115)
                end
            end
        end
    end
    v_u_90({
        ["settings"] = v_u_95,
        ["touch_to_enter"] = v108.door.WorkingParts.TouchToEnter,
        ["destination_id"] = p91,
        ["current_location"] = v108,
        ["player_about_to_be_unanchored"] = function()
            if v_u_95.player_about_to_teleport then
                v_u_95.player_about_to_teleport()
            end
            if not v_u_95.spawn_cframe then
                v_u_110:arrive()
            end
            v_u_113()
        end,
        ["teleport_completed_callback"] = v116
    })
    local v117 = v_u_95.player_to_teleport_to
    if v117 then
        v_u_6.get("LocationAPI/PlayerTeleportedToPlayer"):FireServer(v117)
    end
    if not v96 then
        v_u_9.delayed_set_collidable(true, 7)
    end
    local v118 = v108.door.WorkingParts.Configuration:FindFirstChild("door_db_entry")
    if v118 and (v_u_10[v118.Value] and v_u_10[v118.Value].on_enter) then
        v_u_10[v118.Value].on_enter(v108.door, v108.interior)
    end
end
function v_u_26.can_enter(p120)
    if v_u_20.is_enabled() then
        for _, v121 in v_u_2("MinigameClientManager").get_all() do
            if v121.is_participating and (not v121.instanced_minigame and p120 ~= v121.minigame_destination_id) then
                return false, ("Attempted to join Interior %s while in minigame %s"):format(p120, v121.static_minigame_id)
            end
        end
    end
    if v_u_26.entering then
        return false, "Already entering an Interior"
    else
        return true, nil
    end
end
function v_u_26.enter(p_u_122, p_u_123, p_u_124, p_u_125)
    v_u_25.remove_session("interiorsm_enter_last")
    v_u_25.create_session("interiorsm_enter_last")
    local v126 = v_u_25.start_misc_timer("090_interiorsm_enter_total")
    local v_u_127, v128 = v_u_25.new_misc_consecutive_timers()
    v_u_127("090_interiorsm_critical_wait")
    v_u_27:wait()
    v_u_127("090_interiorsm_can_enter")
    local v129, v130 = v_u_26.can_enter(p_u_122)
    if v129 then
        v_u_26.entering = true
        v_u_23:disable("entering_interior")
        local v_u_131 = ("entering_interior_%*"):format((v_u_1:GenerateGUID()))
        v_u_22.loading_section_start(v_u_131)
        local v_u_132 = debug.traceback()
        local v_u_133 = nil
        local v_u_134 = nil
        task.spawn(function()
            local v_u_135 = coroutine.running()
            task.spawn(function()
                while coroutine.status(v_u_135) ~= "dead" do
                    task.wait(0.1)
                end
                if not v_u_133 then
                    warn("enter_core_async died without completing, did it exhaust allowed execution time?\n" .. "Traceback:\n" .. debug.traceback(v_u_135) .. "... from ...\n" .. v_u_132)
                    v_u_133 = true
                end
            end)
            v_u_127("090_interiorsm_enter_core_async")
            v_u_134 = v_u_25.track_thread_misc("091_interiorsm_eca", true)
            v_u_119(p_u_122, p_u_123, p_u_124, p_u_125)
            v_u_133 = true
        end)
        local v136 = v_u_134
        while not v_u_133 do
            task.wait()
        end
        if v136 then
            v136()
        end
        v_u_127("090_interiorsm_enter_misc_late")
        task.delay(10, function()
            v_u_22.loading_section_end(v_u_131)
        end)
        game.Players.LocalPlayer.SetControlEnabled:Fire(true)
        local v137 = game.Players.LocalPlayer.Character
        if v137 then
            v137 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        end
        if v137 then
            v137.Anchored = false
        end
        v_u_26.entering = false
        v_u_23:enable("entering_interior")
        v_u_27:signal()
        v128()
        v126()
        v_u_25.pause_session("interiorsm_enter_last")
    else
        warn(v130)
        v_u_27:signal()
    end
end
function v_u_26.enter_smooth(p138, p139, p140, ...)
    local v141 = v_u_2("UIManager")
    local v142 = p140 or {}
    local v143 = v142.anchor_char_immediately
    v_u_21.enter_loading_screen("InteriorsM.enter_smooth")
    if v142.start_transparency == nil then
        v142.start_transparency = 1
    elseif v142.start_transparency == -1 then
        v142.start_transparency = nil
    end
    v141.apps.TransitionsApp:transition({
        ["length"] = v142.fade_in_length or 0.5,
        ["color"] = v142.fade_color,
        ["start_transparency"] = v142.start_transparency,
        ["end_transparency"] = 0,
        ["yields"] = not v143
    })
    if v143 then
        v142.post_character_anchored_wait = 0.5
    end
    local v144
    if v_u_26.allow_non_character_teleports then
        v144 = game.Players.LocalPlayer.Character
    else
        v144 = v_u_50()
    end
    if v144 then
        v_u_2("IceSkatingClient").set_enabled(false)
    end
    local v145
    if v144 then
        v145 = v144:FindFirstChild("Humanoid")
    else
        v145 = v144
    end
    if v145 then
        local v146 = v145.SeatPart
        if v146 then
            v146 = v146:FindFirstChild("SeatWeld")
        end
        if v146 or v145.Sit then
            if v146 then
                v146:Destroy()
                v145.Jump = true
                v145.Sit = false
            elseif v145.Sit then
                v145.Jump = true
                v145.Sit = false
            end
            task.wait(0.2)
        end
    end
    v_u_26.enter(p138, p139, v142, ...)
    task.wait(0.1)
    v_u_21.await_unpaused()
    v_u_21.exit_loading_screen("InteriorsM.enter_smooth")
    v141.apps.TransitionsApp:transition({
        ["length"] = v142.fade_out_length or 0.4,
        ["color"] = v142.fade_color,
        ["start_transparency"] = 0,
        ["end_transparency"] = 1
    })
    if v144 then
        v_u_2("IceSkatingClient").set_enabled(true)
    end
end
function v_u_26.get_current_location()
    return v_u_29
end
function v_u_26.get_door_to_location(p147)
    for _, v148 in pairs(workspace.Interiors:GetChildren()) do
        if v148:FindFirstChild("Doors") then
            for _, v149 in pairs(v148.Doors:GetChildren()) do
                if v149.WorkingParts.Configuration.destination_id.Value == p147 then
                    return v149
                end
            end
        end
    end
    if p147 == "MainMap" or p147 == "Neighborhood" then
        local v150 = workspace.Interiors:GetChildren()[1]
        if v150 and (v150:FindFirstChild("Doors") and v150.Name ~= p147) then
            return v150.Doors.MainDoor
        end
    end
    for _, v151 in pairs(workspace.Interiors:GetChildren()) do
        if v151:FindFirstChild("Buildings") and v151.Buildings:FindFirstChild(p147) then
            return v151.Buildings[p147].Doors.MainDoor
        end
    end
    if p147 == "housing" then
        for _, v152 in pairs(workspace.HouseExteriors:GetChildren()) do
            if v152:GetChildren()[1] and v152:GetChildren()[1].Doors.MainDoor.WorkingParts.Configuration.house_owner.Value == game.Players.LocalPlayer.Name then
                return v152:GetChildren()[1].Doors.MainDoor
            end
        end
    end
end
return v_u_26