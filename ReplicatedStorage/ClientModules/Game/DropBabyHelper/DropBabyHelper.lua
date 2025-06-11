--// ReplicatedStorage.ClientModules.Game.DropBabyHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("UIManager")
local v_u_4 = v1("Door")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("StateManagerClient")
local v_u_7 = v1("CharWrapperClient")
local v_u_8 = v1("InventoryDB")
local v_u_9 = v1("Debug").create_log()
local v_u_10 = v1("package:Sift")
local v_u_11 = {}
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = false
local function v_u_16()
    if not v_u_4.entering_door then
        local v15 = v_u_6.dequeue_chars_connected_to_me(v_u_2.get("state_manager"))
        if v15 then
            v_u_5.get("AdoptAPI/EjectBaby"):FireServer(v15)
            return true
        end
    end
end
v_u_11.attempt_eject_baby = v_u_16
function v_u_11.init()
    local v17 = {
        ["priority"] = 2,
        ["text"] = "Drop Baby",
        ["mouse_button1_click"] = v_u_16
    }
    v_u_13 = v_u_3.apps.ExtraButtonsApp:register_button(v17)
    local v18 = {
        ["priority"] = 4,
        ["text"] = "Stop Ride",
        ["mouse_button1_click"] = function()
            v_u_6.exit_seat_states()
        end
    }
    local v_u_19 = v_u_3.apps.ExtraButtonsApp:register_button(v18)
    v_u_2.register_callback("state_manager", function(p20, p21)
        if p20 == game.Players.LocalPlayer then
            if p21 == nil then
                return
            else
                local v_u_22 = v_u_6.get_states_by_id(p21, "ParentWalkingPet")[1] or nil
                v_u_12 = v_u_10.List.filter(v_u_6.get_chars_connected_to_me(p21), function(p23)
                    return not v_u_22 and true or v_u_22.baby ~= p23
                end)
                v_u_9("Num chars =", v_u_12 and #v_u_12 or "No chars")
                if v_u_12 ~= nil and #v_u_12 > 0 then
                    local v24 = v_u_12[#v_u_12]
                    local v25 = v_u_7.get(v24)
                    if v25 and v25.pet_id then
                        if v_u_8.pets[v25.pet_id].is_doll then
                            v_u_13.instance.Face.TextLabel.Text = "Drop Doll"
                        elseif v_u_8.pets[v25.pet_id].is_egg then
                            v_u_13.instance.Face.TextLabel.Text = "Drop Egg"
                        else
                            v_u_13.instance.Face.TextLabel.Text = "Drop Pet"
                        end
                    else
                        v_u_13.instance.Face.TextLabel.Text = "Drop Baby"
                    end
                end
                if v_u_6.has_state(p21, "PlayerRidingPet") or v_u_6.has_state(p21, "PlayerFlyingPet") then
                    v_u_19:show()
                else
                    v_u_19:hide()
                end
                if next(v_u_6.get_states_by_id(p21, "SitInVehicle")) ~= nil then
                    v_u_11.unbind_action()
                else
                    v_u_11.bind_action()
                end
                if v_u_14 and (v_u_12 ~= nil and #v_u_12 ~= 0) then
                    v_u_13:show()
                else
                    v_u_13:hide()
                end
            end
        else
            return
        end
    end)
    v_u_11.bind_action()
end
function v_u_11.bind_action()
    game:GetService("ContextActionService"):BindActionAtPriority("r_select", function(_, p26, _)
        if p26 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass
        end
        local v27
        if v_u_4.entering_door then
            v27 = nil
        else
            local v28 = v_u_6.dequeue_chars_connected_to_me(v_u_2.get("state_manager"))
            if v28 then
                v_u_5.get("AdoptAPI/EjectBaby"):FireServer(v28)
                v27 = true
            else
                v27 = nil
            end
        end
        if not v27 then
            return Enum.ContextActionResult.Pass
        end
    end, false, 2000, Enum.KeyCode.R, Enum.KeyCode.ButtonB)
    v_u_14 = true
    if v_u_14 and (v_u_12 ~= nil and #v_u_12 ~= 0) then
        v_u_13:show()
    else
        v_u_13:hide()
    end
end
function v_u_11.unbind_action()
    game:GetService("ContextActionService"):UnbindAction("r_select")
    v_u_14 = false
    if v_u_14 and (v_u_12 ~= nil and #v_u_12 ~= 0) then
        v_u_13:show()
    else
        v_u_13:hide()
    end
end
return v_u_11