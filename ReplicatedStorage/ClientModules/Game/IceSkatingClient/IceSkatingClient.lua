--// ReplicatedStorage.ClientModules.Game.IceSkatingClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ClientToolManager")
local v_u_3 = v1("VehicleClient")
local v_u_4 = v1("StateManagerClient")
local v_u_5 = v1("ClientData")
local v6 = v1("Signal")
local v_u_7 = v1("CollisionsClient")
local v_u_8 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_9 = game:GetService("Debris")
local v_u_10 = game:GetService("Players")
local v_u_11 = game:GetService("RunService")
local v_u_12 = game:GetService("CollectionService")
local v_u_13 = game:GetService("ReplicatedStorage")
local v_u_14 = {}
local v_u_15 = false
local v_u_16 = true
local v_u_17 = {
    ["entered_at"] = nil,
    ["exited_at"] = nil
}
local function v_u_23(p18)
    local v19 = v_u_13.Resources.IceSkating
    local v20 = v19.SpawnPoof
    local v21 = v19.Sounds.SkatesOnPoof
    local v22 = v20:Clone()
    v22.Position = p18
    v22.Parent = workspace
    v22.Clouds1:Emit(20)
    v22.Clouds2:Emit(10)
    v21:Play()
    v_u_9:AddItem(v22, 5)
end
local function v_u_31(p24)
    local v25 = v_u_14.get_skates_vehicle_wrapper()
    if v25 then
        local v26 = p24:FindFirstChild("JumpPower")
        local v27 = (not v26 or (not v26:IsA("ValueBase") or v26:IsA("BinaryStringValue"))) and 0 or v26.Value
        local v28 = v27 * v27 / (2 * workspace.Gravity)
        local v29 = p24:FindFirstChild("Speed")
        local v30
        if v29 and (v29:IsA("ValueBase") and not v29:IsA("BinaryStringValue")) then
            v30 = v29.Value
        else
            v30 = nil
        end
        v25:attempt_jump(v28, v30)
    end
end
local function v_u_40(p32)
    local v33 = v_u_10.LocalPlayer.Character
    local v34
    if v33 then
        v34 = v33:FindFirstChild("Humanoid")
    else
        v34 = v33
    end
    local v35
    if v33 then
        v35 = v33:FindFirstChild("HumanoidRootPart")
    else
        v35 = v33
    end
    if not (v33 and (v34 and v35)) then
        return
    end
    v_u_4.exit_seat_states({
        ["yield"] = true
    })
    if v_u_2.is_equipped(p32) and true or v_u_2.equip(p32) then
        local v36 = os.clock()
        while true do
            if os.clock() - v36 > 5 then
                return
            end
            if v34.SeatPart then
                break
            end
            task.wait()
        end
        v_u_14.skates_entered:Fire()
        local v37 = v_u_23
        local v38 = v35.Position
        local v39 = v34.HipHeight + v35.Size.Y / 2
        v37(v38 - Vector3.new(0, v39, 0))
    end
end
local function v_u_48(p41)
    local v42 = v_u_10.LocalPlayer.Character
    local v43
    if v42 then
        v43 = v42:FindFirstChild("Humanoid")
    else
        v43 = v42
    end
    local v44
    if v42 then
        v44 = v42:FindFirstChild("HumanoidRootPart")
    else
        v44 = v42
    end
    if v42 and (v43 and v44) then
        if not v_u_2.is_equipped(p41) and true or v_u_2.unequip(p41) then
            v_u_14.skates_exited:Fire()
            local v45 = v_u_23
            local v46 = v44.Position
            local v47 = v43.HipHeight + v44.Size.Y / 2
            v45(v46 - Vector3.new(0, v47, 0))
        end
    end
end
local function v_u_74(p49)
    if not v_u_15 then
        local v50 = v_u_10.LocalPlayer.Character
        local v51
        if v50 then
            v51 = v50:FindFirstChild("Humanoid")
        else
            v51 = v50
        end
        local v_u_52
        if v50 then
            v_u_52 = v50:FindFirstChild("HumanoidRootPart")
        else
            v_u_52 = v50
        end
        if v50 and (v51 and (v_u_52 and v50:IsDescendantOf(workspace))) then
            local v53 = v_u_14.is_skating()
            if v53 then
                v_u_4.exit_seat_states({
                    ["break_if_no_connection"] = true,
                    ["yield"] = true
                })
            end
            local v54
            if v_u_16 and (not v53 or v51.SeatPart) then
                local v55 = v_u_14.get_skates_vehicle_wrapper()
                local v56
                if v55 then
                    v56 = v55:is_jumping()
                else
                    v56 = false
                end
                local v57 = v_u_3.get_current_vehicle_wrapper()
                if v57 then
                    v57 = v57.vehicle_model
                end
                local v58 = v_u_8.cast_ray
                local v59 = {}
                local v60 = v_u_52.Position
                local v61 = 1 - (v_u_52.Size.Y / 2 + v51.HipHeight)
                v59.origin = v60 + Vector3.new(0, v61, 0)
                local v62 = -(v56 and 30 or 10)
                v59.direction = Vector3.new(0, v62, 0)
                v59.filter_type = Enum.RaycastFilterType.Exclude
                v59.instances = { workspace.Terrain, v50, v57 }
                function v59.callback(p63)
                    local v64 = p63.Instance
                    local v65 = not v64:CanCollideWith(v_u_52)
                    if v65 then
                        v65 = not v_u_12:HasTag(v64, "IceSkatingPart")
                    end
                    return not v65
                end
                local v66 = v58(v59)
                local v67 = os.clock()
                local v68
                if v66 then
                    v68 = v_u_12:HasTag(v66.Instance, "IceSkatingPart")
                else
                    v68 = v66
                end
                if not (v56 or v55) then
                    local v69 = v51.HipHeight + v_u_52.Size.Y / 2
                    if v68 then
                        if v66 then
                            v68 = v66.Distance <= v69 + 0.4
                        else
                            v68 = v66
                        end
                    end
                end
                if v68 and not v_u_17.entered_at then
                    v_u_17.entered_at = v67
                elseif not v68 then
                    v_u_17.entered_at = nil
                end
                local v70 = not v68
                if v70 then
                    if v66 then
                        v70 = not v_u_12:HasTag(v66.Instance, "IceSkatingPart")
                    else
                        v70 = v66
                    end
                end
                if v70 and not v_u_17.exited_at then
                    v_u_17.exited_at = v67
                elseif not v70 then
                    v_u_17.exited_at = nil
                end
                if v68 and (v_u_17.entered_at and (v67 - v_u_17.entered_at > 0.4 and not v53)) then
                    v54 = true
                elseif v70 and (v_u_17.exited_at and (v67 - v_u_17.exited_at > 0.1 and v53)) then
                    v54 = false
                elseif v53 and (v66 and v66.Instance.Name == "JumpPad") then
                    local v71 = v66.Instance
                    local v72 = v_u_52.AssemblyLinearVelocity
                    local v73 = (v72 * Vector3.new(1, 0, 1)).Magnitude
                    if v71.CFrame:VectorToObjectSpace(v72).Z < 0 and v73 > 8 then
                        v_u_31(v71)
                        v54 = v53
                    else
                        v54 = v53
                    end
                else
                    v54 = v53
                end
            else
                v54 = false
            end
            if v53 ~= v54 then
                v_u_15 = true
                if v54 then
                    v_u_40(p49)
                    v_u_7.disable_player_on_collision("ice_skating")
                else
                    v_u_48(p49)
                    v_u_7.enable_player_on_collision("ice_skating")
                end
                v_u_15 = false
            end
        end
    end
end
v_u_14.skates_entered = v6.new()
v_u_14.skates_exited = v6.new()
function v_u_14.is_skating()
    local v75 = v_u_2.get_equipped_by_category("transport")[1]
    return v75 and v75.kind == "ice_skates" and true or false
end
function v_u_14.set_enabled(p76)
    v_u_16 = p76
end
function v_u_14.make_stumble(p77)
    local v78 = v_u_14.get_skates_vehicle_wrapper()
    if v_u_14.is_skating() and v78 then
        v78:make_stumble(p77)
    end
end
function v_u_14.get_skates_vehicle_wrapper()
    local v79 = nil
    local v80 = v_u_3.get_current_vehicle_wrapper()
    if v80 then
        if v80.vehicle_db_entry.kind ~= "ice_skates" then
            v80 = v79
        end
    else
        v80 = v79
    end
    return v80
end
function v_u_14.init()
    v_u_11:IsStudio()
    task.spawn(function()
        local v_u_81 = nil
        for _, v82 in v_u_5.get("inventory").transport do
            if v82.kind == "ice_skates" then
                v_u_81 = v82
            end
        end
        v_u_11.PostSimulation:Connect(function()
            v_u_74(v_u_81)
        end)
    end)
end
return v_u_14