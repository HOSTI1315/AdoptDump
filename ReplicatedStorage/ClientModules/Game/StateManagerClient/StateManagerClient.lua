--// ReplicatedStorage.ClientModules.Game.StateManagerClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("TableUtil")
local v5 = v1("Signal")
local v_u_6 = v1("CharWrapperClient")
local v_u_7 = v1("Debug").create_log()
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = v5.new()
function v_u_8.exit_seat_states(p12)
    local v13 = p12 or {}
    local v14 = v13.yield or false
    local v15 = game.Players.LocalPlayer.Character
    local v16 = v_u_8.get(v15)
    if v16 then
        if v16.is_sitting then
            local v17 = v15:FindFirstChild("StateConnection")
            if v17 then
                v17:Destroy()
            elseif v13.break_if_no_connection then
                return
            end
            v15.Humanoid.PlatformStand = false
            v15.Humanoid.Sit = false
            v15.HumanoidRootPart.Anchored = false
            if v14 then
                v_u_2.get("AdoptAPI/ExitSeatStatesYield"):InvokeServer()
            else
                v_u_2.get("AdoptAPI/ExitSeatStates"):FireServer()
            end
        else
            return
        end
    else
        return
    end
end
function v_u_8.get(p18)
    return v_u_9[p18]
end
function v_u_8.get_states_by_id(p19, p20)
    local v21 = {}
    for _, v22 in p19.states do
        if v22.id == p20 then
            table.insert(v21, v22)
        end
    end
    return v21
end
function v_u_8.has_state(p23, p24)
    return #v_u_8.get_states_by_id(p23, p24) >= 1
end
function v_u_8.get_chars_connected_to_me(p25)
    return (p25 or {}).chars_connected_to_me
end
function v_u_8.char_is_connected_to_me(p26, p27)
    local v28 = (p26 or {}).chars_connected_to_me or {}
    return v_u_4.is_member(v28, p27)
end
function v_u_8.client_prediction_add_to_connected_to_me_list(p29, p30)
    local v31 = (p29 or {}).chars_connected_to_me or {}
    if not v_u_4.is_member(v31, p30) then
        table.insert(v31, p30)
    end
end
function v_u_8.get_team(p32)
    if p32.char == p32.player.Character then
        return v_u_3.get_server(p32.player, "team")
    else
        return v_u_6.get_team(p32.char)
    end
end
function v_u_8.dequeue_chars_connected_to_me(p33)
    local v34 = p33 or {}
    local v35 = v34.chars_connected_to_me
    if v35 ~= nil then
        if #v35 ~= 0 then
            local v36 = v35[#v35]
            table.remove(v35, #v35)
            v_u_3.predict_update_server(v34.player, v34.store_key, v34, false)
            return v36
        end
    end
end
function v_u_8.get_all_state_managers()
    local v37 = {}
    for _, v38 in pairs(v_u_9) do
        table.insert(v37, v38)
    end
    return v37
end
function v_u_8.get_changed_signal()
    return v_u_11
end
function v_u_8.init()
    game:GetService("UserInputService").JumpRequest:connect(function()
        local v39 = v_u_3.get("state_manager")
        if #v_u_8.get_states_by_id(v39, "PlayerRidingPet") < 1 and #v_u_8.get_states_by_id(v39, "PlayerFlyingPet") < 1 then
            local v40 = v39.char
            if v40 then
                v40 = v39.char:FindFirstChild("Humanoid")
            end
            if v40:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
                v_u_8.exit_seat_states()
            end
        end
    end)
    local function v_u_45(p_u_41, p_u_42, p_u_43)
        if p_u_42 ~= nil then
            if not p_u_42.char:IsDescendantOf(workspace) then
                warn("StateManager: char is not in workspace", p_u_42.char)
            end
            v_u_9[p_u_42.char] = p_u_42
            if v_u_10[p_u_42.char] then
                v_u_10[p_u_42.char]:Disconnect()
                v_u_10[p_u_42.char] = nil
            end
            v_u_10[p_u_42.char] = p_u_42.char.AncestryChanged:connect(function(_, p44)
                if p44 == nil then
                    v_u_7("Removing state_manager entry on client for", p_u_41.Name, p_u_43)
                    v_u_9[p_u_42.char] = nil
                    if v_u_10[p_u_42.char] then
                        v_u_10[p_u_42.char]:Disconnect()
                        v_u_10[p_u_42.char] = nil
                    end
                end
            end)
        end
    end
    v_u_3.register_callback_plus_existing("state_manager", function(p46, p47)
        v_u_45(p46, p47, "state_manager")
        v_u_11:Fire()
    end)
    v_u_3.register_callback_plus_existing("pet_state_managers", function(p48, p49)
        if p49 then
            for _, v50 in p49 do
                v_u_45(p48, v50, "pet_state_managers")
            end
            v_u_11:Fire()
        end
    end)
end
return v_u_8