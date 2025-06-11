--// ReplicatedStorage.ClientServices.Interactions.CharInteractions.PetCharInteractions (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("new:AilmentsClient")
local v_u_3 = v1("CharWrapperClient")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("InventoryDB")
local v_u_6 = v1("PetActions")
local v_u_7 = v1("PetEntityManager")
local v_u_8 = v1("PickupHelper")
local v_u_9 = v1("StateManagerClient")
local v_u_10 = v1("UIManager")
local v_u_45 = {
    ["should_be_visible"] = function(p11)
        if v_u_10.is_visible("AvatarEditorApp") then
            return false
        elseif v_u_10.is_visible("TradeApp") then
            return false
        else
            local v12 = v_u_7.get_pet_entity(p11)
            if v12 then
                if v12.base.char_wrapper then
                    if v_u_4.get("state_manager") then
                        return not v_u_6.must_set_down_pet(p11)
                    else
                        return false
                    end
                else
                    return false
                end
            else
                return false
            end
        end
    end,
    ["is_relevant_pet"] = function(p13)
        local v14 = v_u_7.get_pet_entity(p13)
        if not v14 then
            return false
        end
        local v15 = v14.base.char_wrapper.player
        if v15 then
            v15 = v_u_2.is_relevant_to_local_ailments(v15)
        end
        return v15
    end,
    ["build_interaction_text_callback"] = function(p_u_16, p_u_17)
        return function()
            local v18 = v_u_3.get(p_u_17)
            if not v18 then
                return p_u_16.Name
            end
            local v19
            if v18 then
                v19 = v18.grabbed_pet_object
            else
                v19 = v18
            end
            if v19 then
                return "Pick up item"
            end
            local v20 = v_u_5.pets[v18.pet_id]
            return p_u_16 ~= game.Players.LocalPlayer and {
                ["display_mode"] = "buy_with_icon",
                ["item_row_text"] = v20.name,
                ["item_cost"] = p_u_16.Name,
                ["icon"] = ("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(p_u_16.UserId)
            } or v20.name
        end
    end,
    ["cant_interact_hint"] = function(p21)
        local v22 = v_u_3.get(p21)
        local v23 = v22 and v22.pet_id
        if v23 then
            v23 = v_u_5.pets[v22.pet_id]
        end
        local v24 = v23 and v23.name or "pet"
        v_u_10.apps.HintApp:hint({
            ["text"] = ("You can\'t interact with this %s right now."):format(v24),
            ["length"] = 5,
            ["overridable"] = true,
            ["yields"] = false
        })
    end,
    ["build_on_selected_callback"] = function(p_u_25, p_u_26)
        return function()
            local v27 = nil
            local v28 = p_u_25 == game.Players.LocalPlayer
            local v29 = v_u_10.apps.SettingsApp:get_setting("pet_radial_menu")
            if v_u_6.can_interact_with_pet(p_u_26) then
                local v_u_30 = v_u_3.get(p_u_26)
                if v_u_30 then
                    local v31 = v_u_9.get(v_u_30.char)
                    local v32 = v_u_30.grabbed_pet_object
                    local v33 = v29 or (v_u_9.has_state(v31, "PetBeingRidden") or v_u_9.has_state(v31, "PetBeingFlown"))
                    if v_u_45.is_relevant_pet(p_u_26) then
                        if v32 then
                            v27 = function()
                                v_u_6.take_chewtoy(v_u_30)
                            end
                        elseif v33 then
                            local v34 = v_u_5.pets[v_u_30.pet_id]
                            v27 = {}
                            local v35 = {
                                ["text"] = "Pick Up",
                                ["on_selected"] = function()
                                    if v_u_6.can_pickup_pet(p_u_26) then
                                        v_u_8.pickup(p_u_26)
                                    else
                                        v_u_45.cant_interact_hint(p_u_26)
                                    end
                                end
                            }
                            table.insert(v27, v35)
                            if v28 and not (v34.is_egg or v34.is_doll) then
                                if not v_u_9.has_state(v31, "PetBeingRidden") then
                                    local v36 = {
                                        ["text"] = "Ride",
                                        ["on_selected"] = function()
                                            v_u_6.ride_pet(v_u_30)
                                        end
                                    }
                                    table.insert(v27, v36)
                                end
                                if not v_u_9.has_state(v31, "PetBeingFlown") then
                                    local v37 = {
                                        ["text"] = "Fly",
                                        ["on_selected"] = function()
                                            v_u_6.fly_pet(v_u_30)
                                        end
                                    }
                                    table.insert(v27, v37)
                                end
                            end
                            if v_u_6.can_feed_pet(v_u_30) then
                                local v38 = {
                                    ["text"] = "Feed",
                                    ["on_selected"] = function()
                                        v_u_6.feed_pet(v_u_30)
                                    end
                                }
                                table.insert(v27, v38)
                            end
                            if v_u_6.can_focus_pet(p_u_26) then
                                local v39 = {
                                    ["text"] = "Needs",
                                    ["on_selected"] = function()
                                        if v_u_6.can_focus_pet(p_u_26) then
                                            v_u_6.focus(v_u_30)
                                        else
                                            v_u_45.cant_interact_hint(p_u_26)
                                        end
                                    end
                                }
                                table.insert(v27, v39)
                            end
                            if v28 and (not v34.is_egg and (not v34.is_doll and v_u_6.can_do_trick(v_u_30))) then
                                local v40 = {
                                    ["text"] = "Tricks",
                                    ["on_selected"] = function()
                                        v_u_6.do_trick(v_u_30)
                                    end
                                }
                                table.insert(v27, v40)
                            end
                        elseif v_u_6.can_focus_pet(v_u_30.char) then
                            v27 = function()
                                v_u_6.focus(v_u_30)
                            end
                        else
                            v27 = function()
                                v_u_8.pickup(v_u_30.char)
                            end
                        end
                    else
                        local v41 = require(script.Parent.PlayerCharInteractions)
                        local v_u_42 = v_u_5.pets[v_u_30.pet_id]
                        v27 = {}
                        local v43 = {
                            ["text"] = v_u_30.player.name,
                            ["on_selected"] = v41.build_on_selected_callback(v_u_30.player, v_u_30.player.Character)
                        }
                        table.insert(v27, v43)
                        local v44 = {
                            ["text"] = v_u_42.name,
                            ["on_selected"] = function()
                                v_u_10.set_app_visibility("JournalApp", true)
                                v_u_10.apps.JournalApp:open_popup(v_u_42, "Origin", (("%* %*"):format(v_u_42.origin_entry.origin, v_u_42.origin_entry.year)))
                            end
                        }
                        table.insert(v27, v44)
                    end
                end
            end
            return v27 or function()
                v_u_45.cant_interact_hint(p_u_26)
            end
        end
    end
}
return v_u_45