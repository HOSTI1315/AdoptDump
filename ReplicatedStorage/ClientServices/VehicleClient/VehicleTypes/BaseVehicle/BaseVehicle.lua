--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.BaseVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SettingsHelper")
local v_u_3 = v1("SimpleEvents")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("Signal")
local v6 = v1("Class")
local v_u_7 = v1("Maid")
local v_u_8 = require(script.Parent.Parent.VehicleCamera)
local v_u_9 = game:GetService("CollectionService")
local v_u_10 = game:GetService("Players")
local v_u_11 = require(v_u_10.LocalPlayer.PlayerScripts.PlayerModule):GetControls()
local v12 = v6("BaseVehicle")
function v12.__init(p_u_13, p14, p15, p16)
    p_u_13.vehicle_model = p14
    p_u_13.vehicle_params = p15
    p_u_13.vehicle_db_entry = p16
    p_u_13.vehicle_seat = p14:WaitForChild("VehicleSeat")
    p_u_13.vehicle_seat_camera_configuration_name = "default"
    p_u_13.owner = p14:WaitForChild("VehicleOwner").Value
    p_u_13.model_scale = p14:WaitForChild("model_scale").Value
    p_u_13.occupants = {}
    p_u_13.occupant_changed = v_u_5.new()
    p_u_13.destroyed = false
    p_u_13.on_destroyed = v_u_5.new()
    p_u_13.exit_button_forced_hidden = false
    local v18 = {
        ["priority"] = 1,
        ["text"] = "Exit Vehicle",
        ["mouse_button1_click"] = function()
            if not p_u_13.exit_button_forced_hidden then
                local v17 = v_u_10.LocalPlayer.Character
                if v17 then
                    v17 = v17:FindFirstChild("Humanoid")
                end
                if v17 and (v17:IsA("Humanoid") and p_u_13.vehicle_seat.Occupant == v17) then
                    if p_u_13:is_jump_exiting_disabled() then
                        v17:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                    end
                    v17:ChangeState(Enum.HumanoidStateType.Running)
                end
            end
        end
    }
    p_u_13.exit_button = v_u_4.apps.ExtraButtonsApp:register_button(v18)
    p_u_13.maid = v_u_7.new()
    p_u_13:_init_weights()
end
function v12._init_weights(p19)
    local v20 = {}
    for _, v21 in p19.vehicle_model:GetDescendants() do
        if v_u_9:HasTag(v21, "Vehicle:Weight") and v21:IsA("BasePart") then
            table.insert(v20, v21)
        end
    end
    for _, v_u_22 in v20 do
        local function v29()
            local v23 = v_u_22:GetMass()
            local v24 = v23 / v_u_22.CurrentPhysicalProperties.Density
            local v25 = v_u_22:GetAttribute("TargetMass") or v23
            local v26 = v_u_22
            local v27 = PhysicalProperties.new
            local v28 = v25 / v24
            v26.CustomPhysicalProperties = v27(math.max(v28, 0.01), v_u_22.CurrentPhysicalProperties.Friction, v_u_22.CurrentPhysicalProperties.Elasticity, v_u_22.CurrentPhysicalProperties.FrictionWeight, v_u_22.CurrentPhysicalProperties.ElasticityWeight)
        end
        v29()
        p19.maid:GiveTask(v_u_22:GetAttributeChangedSignal("TargetMass"):Connect(v29))
        p19.maid:GiveTask(v_u_22:GetPropertyChangedSignal("Size"):Connect(v29))
    end
end
function v12._watch_seat_occupant(p30, p_u_31, p_u_32)
    local v_u_33 = p_u_31:GetPropertyChangedSignal("Occupant"):Connect(function()
        p_u_32(p_u_31.Occupant)
    end)
    local v_u_34 = p30.on_destroyed:Connect(function()
        if p_u_31.Occupant then
            p_u_32(nil)
        end
    end)
    if p_u_31.Occupant then
        p_u_32(p_u_31.Occupant)
    end
    return function()
        v_u_33:Disconnect()
        v_u_34:Disconnect()
    end
end
function v12._fire_occupant_changed(p35, p36, p37)
    p35.occupant_changed:Fire(p36, p37, p35:is_occupant(p36))
end
function v12._refresh_exit_button(p38, p39, p40, p41)
    if p38:is_jump_exiting_disabled() and (p38.owner == p39 and p40 == p38.vehicle_seat) then
        local v42 = p39.Character
        if v42 then
            v42 = v42:FindFirstChild("Humanoid")
        end
        if v42 and v42:IsA("Humanoid") then
            local v43 = p38.exit_button.instance
            local v44
            if p41 then
                v44 = not p38.exit_button_forced_hidden
            else
                v44 = p41
            end
            v43.Visible = v44
            v42:SetStateEnabled(Enum.HumanoidStateType.Jumping, not p41)
        end
    end
end
function v12._set_camera_configuration(p45, p46)
    if p45.vehicle_seat_camera_configuration_name ~= p46 then
        v_u_8.validate_configuration_name(p46)
        p45.vehicle_seat_camera_configuration_name = p46
        local v47 = v_u_10.LocalPlayer.Character
        if v47 then
            v47 = v47:FindFirstChild("Humanoid")
        end
        if v47 and p45.vehicle_seat.Occupant == v47 then
            v_u_8.apply_configuration(p46)
        end
    end
end
function v12.hook_seat_listeners(p_u_48, p_u_49)
    p_u_48.maid:GiveTask(p_u_48.occupant_changed:Connect(function(p50, p51, p52)
        p_u_48:_refresh_exit_button(p50, p51, p52)
        if p51 == p_u_48.vehicle_seat and p50 == p_u_48.owner then
            p_u_48:on_driver_changed(p50, p51, p52)
        elseif p51 ~= p_u_48.vehicle_seat then
            p_u_48:on_occupant_changed(p50, p51, p52)
        end
        if p52 then
            v_u_8.apply_configuration(p_u_48.vehicle_seat_camera_configuration_name)
            p_u_49.on_enter(p50, p51)
        else
            v_u_8.reset_configuration()
            p_u_49.on_exit(p50, p51)
        end
    end))
    p_u_48.maid:GiveTask(p_u_48:_watch_seat_occupant(p_u_48.vehicle_seat, function(p53)
        if p53 then
            p_u_48.occupants[v_u_10.LocalPlayer.Name] = v_u_10.LocalPlayer.UserId
        else
            p_u_48.occupants[v_u_10.LocalPlayer.Name] = nil
        end
        p_u_48:_fire_occupant_changed(v_u_10.LocalPlayer, p_u_48.vehicle_seat)
    end))
    local v54 = p_u_48.vehicle_model:FindFirstChild("PassengerSeats")
    if v54 then
        p_u_48.maid:GiveTask(v_u_3.foreach_child_including_new(v54, function(p_u_55)
            local v_u_56 = nil
            local v_u_57 = nil
            p_u_48.maid:GiveTask(p_u_48:_watch_seat_occupant(p_u_55, function(p58)
                if p58 then
                    p58 = p58.Parent
                end
                if p58 then
                    p58 = v_u_10:GetPlayerFromCharacter(p58)
                end
                if p58 == v_u_10.LocalPlayer then
                    return
                elseif p58 then
                    v_u_56 = p58
                    v_u_57 = p58.Name
                    p_u_48.occupants[p58.Name] = p58.UserId
                    p_u_48:_fire_occupant_changed(p58, p_u_55)
                elseif p_u_48.occupants[v_u_57] then
                    p_u_48.occupants[v_u_57] = nil
                    if v_u_56 then
                        p_u_48:_fire_occupant_changed(v_u_56, p_u_55)
                    end
                end
            end))
        end))
    end
end
function v12.is_jump_exiting_disabled(_)
    return false
end
function v12.set_exit_button_forced_hidden(p59, p60)
    p59.exit_button_forced_hidden = p60
    p59:_refresh_exit_button(v_u_10.LocalPlayer, p59.vehicle_seat, p59.vehicle_seat.Occupant and true or false)
end
function v12.get_camera_configuration(p61)
    local v62 = p61.vehicle_db_entry.uses_follow_camera
    if v62 == nil then
        v62 = v_u_2.get_setting_client({
            ["setting_id"] = "vehicle_camera_follows",
            ["use_default"] = true,
            ["use_transform"] = true
        })
    end
    return v62 and "default" or "freecam"
end
function v12.on_occupant_changed(_, _, _, _) end
function v12.on_driver_changed(_, _, _, _) end
function v12.is_destroyed(p63)
    return p63.destroyed
end
function v12.is_owner(p64, p65)
    return p65 == p64.owner
end
function v12.is_occupant(p66, p67)
    return p66.occupants[p67.Name] and true or false
end
function v12.get_occupant_players(p68)
    local v69 = {}
    for _, v70 in p68.occupants do
        local v71 = v_u_10:GetPlayerByUserId(v70)
        if v71 then
            table.insert(v69, v71)
        end
    end
    return v69
end
function v12.get_control_vector(p72)
    local v73 = v_u_10.LocalPlayer.Character
    if v73 then
        v73 = v73:FindFirstChild("Humanoid")
    end
    return (not v73 or p72.vehicle_seat.Occupant ~= v73) and Vector3.new(0, 0, 0) or v_u_11:GetMoveVector()
end
function v12.update(p74, _)
    p74:_set_camera_configuration(p74:get_camera_configuration())
end
function v12.destroy(p75)
    p75.destroyed = true
    p75.on_destroyed:Fire()
    if p75.exit_button then
        v_u_4.apps.ExtraButtonsApp:unregister_button(p75.exit_button)
    end
    p75.maid:DoCleaning()
end
return v12