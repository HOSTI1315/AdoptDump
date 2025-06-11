--// ReplicatedStorage.ClientModules.Game.PetActions (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
v_u_1("new:AilmentsClient")
local v_u_2 = v_u_1("AvatarEditorCamera")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("ClientToolManager")
local v_u_5 = v_u_1("Door")
local v_u_6 = v_u_1("EquippedPets")
local v_u_7 = v_u_1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_8 = v_u_1("InventoryDB")
local v_u_9 = v_u_1("LegacyTutorial")
local v_u_10 = v_u_1("ObbyM")
local v_u_11 = v_u_1("AdoptMeEnums/PetEntities/PetCommandType")
local v_u_12 = v_u_1("PetEntityHelper")
local v_u_13 = v_u_1("PetEntityManager")
local v_u_14 = v_u_1("AdoptMeEnums/PetEntities/PetObjectCreatorType")
local v_u_15 = v_u_1("PetObjectHelper")
local v_u_16 = v_u_1("PetPerformanceName")
local v_u_17 = v_u_1("PetPerformances")
local v_u_18 = v_u_1("PetPotionEffectsDB")
local v_u_19 = v_u_1("PetReactionName")
local v_u_20 = v_u_1("PetReactions")
local v_u_21 = v_u_1("PetWorldState")
local v_u_22 = v_u_1("PickupHelper")
local v_u_23 = v_u_1("RouterClient")
local v_u_24 = v_u_1("StateManagerClient")
local v_u_25 = v_u_1("new:StreamingHelper")
local v_u_26 = v_u_1("ToolDBHelper")
local v_u_27 = v_u_1("ToolHandleHelper")
local v_u_28 = v_u_1("UIManager")
local v_u_29 = v_u_1("KindDB")
local v_u_30 = v_u_1("package:Promise")
local v_u_31 = v_u_1("package:Sift")
local v_u_32 = {}
local function v_u_36(p33)
    for _, v34 in v_u_3.get("inventory") do
        for _, v35 in v34 do
            if v35.id == p33 then
                return v35
            end
        end
    end
    return nil
end
local function v_u_45(p37, p38)
    local v39 = v_u_8.food[p38.id]
    local v40 = v_u_8.pets[p37.pet_id]
    local v41 = v_u_18[p38.id]
    local v42 = v_u_6.get_item_from_wrapper(p37)
    if v41 and not v42 then
        return false, "You can\'t feed a potion to another player\'s pet!"
    elseif v39.ailment_to_boost or v41 then
        if v40.is_doll and v39.cannot_feed_to_doll then
            return false, "This food is not safe for your doll!"
        elseif v40.is_egg and v39.cannot_feed_to_egg then
            return false, "Wait until your egg has hatched before feeding it a potion"
        elseif v40.cannot_feed_potions and v41 then
            return false, "You cannot feed your pet this food!"
        elseif v40.allowed_potions and (v41 and table.find(v40.allowed_potions, v39.kind) == nil) then
            return false, "You cannot feed your pet this food!"
        elseif v40.is_egg or not v39.can_only_feed_to_egg then
            if v41 then
                local v43, v44 = v41.validate(p37, v42)
                if not v43 then
                    return v43, v44
                end
            end
            if v39.player_must_confirm and not v_u_26.confirm_use(v39, {
                ["text"] = "Feed " .. v39.name .. " to pet?",
                ["left"] = "Cancel",
                ["right"] = "Feed Pet"
            }) then
                return false
            else
                return true, nil
            end
        else
            return false, "You can only feed this to an egg!"
        end
    else
        return false, "This food is not safe for your pet!"
    end
end
local v_u_46 = {
    ["BabyOnStroller"] = true,
    ["PetBeingFocused"] = true,
    ["PetOnLeash"] = true
}
function v_u_32.must_set_down_pet(p47)
    local v48 = v_u_3.get("state_manager")
    if not v48 then
        return false
    end
    if not v_u_24.char_is_connected_to_me(v48, p47) then
        return false
    end
    local v49 = v_u_24.get(p47)
    if not v49 then
        return false
    end
    for v50, _ in v_u_46 do
        if v_u_24.has_state(v49, v50) then
            return false
        end
    end
    return true
end
function v_u_32.can_interact_with_pet(p51)
    local v52 = v_u_13.get_pet_entity(p51)
    if v52 then
        local v53 = v52.base.char_wrapper.player
        if v52.modifier_values_from_performances.dont_allow_remote_interaction and (not v52.client_has_control and v53 ~= game.Players.LocalPlayer) then
            return false
        else
            local v54 = v_u_13.get_pet_entity(p51)
            local v55
            if v54 then
                v55 = v_u_12.has_performance(v54, v_u_16.Eat)
            else
                v55 = v54
            end
            if v54 then
                v54 = v_u_12.has_reaction(v54, v_u_19.EatReaction)
            end
            if v55 or (v54 or false) then
                return false
            else
                return v_u_24.get(p51) and true or false
            end
        end
    else
        return false
    end
end
function v_u_32.can_focus_pet(p56)
    local v57 = v_u_13.get_pet_entity(p56)
    if v57 then
        local v58 = v57.base
        if v58 then
            v58 = v57.base.char_wrapper
        end
        if v58 then
            local v59 = v_u_3.get("state_manager")
            if v59 then
                if v59.connected_to_char == nil then
                    local v60 = v_u_17[v_u_16.FocusPet].allowed_exclusive_states
                    if v57.base.char_wrapper.player == game.Players.LocalPlayer and v57.exclusive_state == v_u_7.Focused then
                        return true
                    elseif v57.exclusive_state and not v_u_31.List.find(v60, v57.exclusive_state) then
                        return false
                    else
                        local v61 = v_u_24.get(p56)
                        if v61 and not v61.is_sitting then
                            return v_u_32.can_interact_with_pet(p56)
                        else
                            return false
                        end
                    end
                else
                    return false
                end
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
function v_u_32.can_pickup_pet(p62)
    local v63 = v_u_13.get_pet_entity(p62)
    if v63 then
        local v64 = v63.base
        if v64 then
            v64 = v63.base.char_wrapper
        end
        if v64 then
            return v63.base.char_wrapper.player == game.Players.LocalPlayer and v63.exclusive_state == v_u_7.Focused and true or v_u_32.can_interact_with_pet(p62)
        else
            return false
        end
    else
        return false
    end
end
function v_u_32.focus(p65)
    v_u_28.apps.FocusPetApp:capture_focus(p65)
end
function v_u_32.pick_up(p66, p67)
    v_u_22.pickup(p66.char, false, p67)
end
function v_u_32.can_feed_pet(p68)
    local v69 = v_u_13.get_pet_entity(p68.char)
    local v70 = v_u_20.reactions[v_u_19.EatReaction].allowed_exclusive_states
    return v69.exclusive_state == nil and true or v_u_31.List.find(v70, v69.exclusive_state)
end
function v_u_32.feed_pet(p71, p72)
    local v73 = p72 or {}
    if not game.Players.LocalPlayer.Character then
        return false
    end
    local v74 = v_u_13.get_pet_entity(p71.char)
    if not v_u_32.can_feed_pet(p71) then
        local v75 = v_u_12.is_pet_mounted(v74.base.char) and "You can\'t feed your pet while you\'re riding them!" or "You can\'t feed your pet right now!"
        v_u_28.apps.HintApp:hint({
            ["text"] = v75,
            ["overridable"] = true,
            ["length"] = 2.5,
            ["yields"] = false
        })
        return false
    end
    local v76 = (v_u_3.get("equip_manager") or {}).food[1]
    if v73.item then
        v76 = v73.item
    end
    if not v76 then
        v_u_28.apps.BackpackApp:select_category("food")
        local v78 = v_u_28.apps.BackpackApp:pick_item({
            ["visible_backpack_categories"] = { "food" },
            ["allow_callback"] = function(p77)
                return p77.category == "food"
            end
        })
        if not v78 or v78.category ~= "food" then
            return false
        end
        v_u_4.equip(v78)
        local v79 = tick()
        while tick() - v79 < 8 do
            v76 = (v_u_3.get("equip_manager") or {}).food[1]
            if v76 and v_u_27.get_equipped_tool_model_handle() then
                break
            end
            v_u_30.delay(0.1):await()
        end
        v_u_30.delay(0.2):await()
    end
    local v80 = {}
    local v81 = {}
    local v82 = v_u_18[v76.id]
    local v83 = not v82 and 1 or v82.multi_use_count
    if type(v83) == "function" then
        v83 = v83(p71, (v_u_6.get_item_from_wrapper(p71)))
    end
    if v83 and v83 > 1 then
        for _, v84 in v_u_1("ClientData").get("inventory").food do
            if v84.kind == v76.kind and v84.unique ~= v76.unique then
                table.insert(v80, v84)
            end
        end
        local v85 = #v80 + 1
        local v86 = math.min(v85, v83)
        if v86 > 1 then
            local v87 = v_u_29[v76.kind]
            v86 = v_u_28.apps.DialogApp:dialog({
                ["dialog_type"] = "CountDialog",
                ["right"] = function(p88)
                    return ("Use %*"):format(p88)
                end,
                ["left"] = "Cancel",
                ["text"] = "Choose the number of " .. v87.name .. " you would like to use!",
                ["min"] = 1,
                ["max"] = v86
            })
            if v86 == 0 then
                return false
            end
        end
        v80 = {}
        for v89, v90 in v80 do
            if v86 < v89 + 1 then
                break
            end
            table.insert(v80, v90)
            local v91 = v90.unique
            table.insert(v81, v91)
        end
    end
    local v92, v93 = v_u_45(p71, v76)
    if not v92 then
        if v93 ~= nil then
            v_u_28.apps.HintApp:hint({
                ["text"] = v93,
                ["overridable"] = true,
                ["length"] = 2.5,
                ["yields"] = false
            })
        end
        return false
    end
    if not (p71 and (p71.char and p71.char.Parent)) then
        return false
    end
    local v94 = v_u_23.get("PetObjectAPI/CreatePetObject"):InvokeServer(v_u_14.PetFood, {
        ["unique_id"] = v76.unique,
        ["pet_unique"] = p71.pet_unique,
        ["spawn_cframe"] = v73.spawn_cframe,
        ["additional_consume_uniques"] = v81
    })
    local v95 = v_u_25.await(v94, 15)
    if not v95 then
        return false
    end
    local v_u_96 = {}
    local v97 = v_u_28.apps.BackpackApp
    table.insert(v_u_96, v97:client_predict_consume_item(v76))
    for _, v98 in v80 do
        local v99 = v_u_28.apps.BackpackApp
        table.insert(v_u_96, v99:client_predict_consume_item(v98))
    end
    for _, v100 in v_u_4.get_equipped_by_category("food") do
        v_u_4.unequip(v100)
    end
    if v95 and v95.Parent ~= nil then
        v_u_30.fromEvent(v95.AncestryChanged, function(_, p101)
            return p101 == nil
        end):andThen(function()
            for _, v102 in v_u_96 do
                v102()
            end
        end)
    end
    return true, v95
end
function v_u_32.ride_pet(p103)
    if v_u_5.entering_door then
        return
    elseif v_u_10.is_in_obby() then
        return
    elseif v_u_1("MinigameForcedState").can_mount_pet() then
        if v_u_3.get("inventory").pets[p103.pet_unique].properties.rideable then
            local v104 = v_u_13.get_pet_entity(p103)
            if v104 and v104.modifier_values_from_performances.dont_allow_mount_states then
                v_u_28.apps.HintApp:hint({
                    ["text"] = "You can\'t ride your pet right now!",
                    ["yields"] = false
                })
            else
                v_u_28.apps.FocusPetApp:release_focus()
                v_u_23.get("AdoptAPI/RidePet"):InvokeServer(p103)
            end
        else
            local v105 = v_u_36("pet_riding_potion")
            if v105 then
                if v_u_28.apps.FocusPetApp.char_wrapper == p103 then
                    v_u_28.apps.FocusPetApp:feed_pet(v105)
                else
                    v_u_32.feed_pet(p103, {
                        ["item"] = v105
                    })
                end
            else
                v_u_28.apps.FocusPetApp:release_focus()
                v_u_28.apps.DialogApp:dialog({
                    ["product_id"] = "pet_riding_potion",
                    ["dialog_type"] = "RobuxProductDialog"
                })
                return
            end
        end
    else
        return
    end
end
function v_u_32.fly_pet(p106)
    if v_u_5.entering_door then
        return
    elseif v_u_10.is_in_obby() then
        return
    elseif v_u_1("MinigameForcedState").can_mount_pet() then
        if v_u_3.get("inventory").pets[p106.pet_unique].properties.flyable then
            local v107 = v_u_13.get_pet_entity(p106)
            if v107 and v107.modifier_values_from_performances.dont_allow_mount_states then
                v_u_28.apps.HintApp:hint({
                    ["text"] = "You can\'t fly your pet right now!",
                    ["yields"] = false
                })
            else
                v_u_28.apps.FocusPetApp:release_focus()
                v_u_23.get("AdoptAPI/FlyPet"):InvokeServer(p106)
            end
        else
            local v108 = v_u_36("pet_flying_potion")
            if v108 then
                if v_u_28.apps.FocusPetApp.char_wrapper == p106 then
                    v_u_28.apps.FocusPetApp:feed_pet(v108)
                else
                    v_u_32.feed_pet(p106, {
                        ["item"] = v108
                    })
                end
            else
                v_u_28.apps.FocusPetApp:release_focus()
                v_u_28.apps.DialogApp:dialog({
                    ["product_id"] = "pet_flying_potion",
                    ["dialog_type"] = "RobuxProductDialog"
                })
                return
            end
        end
    else
        return
    end
end
function v_u_32.insta_hatch(p109)
    local v110 = true
    if v_u_9.is_nursery_tutorial_running() then
        v_u_28.apps.DialogApp:dialog({
            ["text"] = "Your egg will hatch by itself if you take good care of it",
            ["button"] = "Next"
        })
        if v_u_28.apps.DialogApp:dialog({
            ["text"] = "Or you can hatch it NOW with Robux",
            ["left"] = "No",
            ["right"] = "Hatch Now!"
        }) ~= "Hatch Now!" then
            v110 = false
        end
    end
    if v110 then
        if not v_u_6.get_item_from_wrapper(p109) then
            return
        end
        v_u_23.get("ProductsAPI/PromptProductPurchase"):FireServer("instant_hatch", p109.pet_unique)
    end
end
function v_u_32.prompt_unlock_trick(p_u_111)
    local v_u_112 = v_u_1("UIManager")
    v_u_112.apps.DialogApp:dialog({
        ["text"] = "To unlock this trick, visit the Pet Trainer at the School",
        ["button"] = "Next"
    })
    if v_u_112.apps.DialogApp:dialog({
        ["text"] = "Go to School?",
        ["right"] = "Yes",
        ["left"] = "No"
    }) ~= "Yes" then
        return false
    end
    task.spawn(function()
        v_u_112.apps.GuideArrowApp:navigate_from_options({
            ["pet_unique"] = p_u_111.pet_unique,
            ["final_destination"] = "School",
            ["custom_position_or_method"] = function()
                if workspace.Interiors:FindFirstChild("School") then
                    return workspace.Interiors.School.PetTrainerPos.Position
                else
                    return nil
                end
            end
        })
    end)
    return true
end
function v_u_32.can_do_trick(p113)
    local v114 = v_u_13.get_pet_entity(p113.char)
    local v115 = v_u_20.reactions[v_u_19.DoTrickReaction].allowed_exclusive_states
    return v114.exclusive_state == nil and true or v_u_31.List.find(v115, v114.exclusive_state)
end
function v_u_32.do_trick(p_u_116)
    local v117 = v_u_8.pets[p_u_116.pet_id]
    local v118 = {}
    for v119, v120 in v117.tricks do
        if p_u_116.pet_trick_level < v119 then
            v118[v119] = {
                ["layout_order"] = v119,
                ["text"] = "???",
                ["button_state"] = "inactive"
            }
        else
            v118[v119] = {
                ["layout_order"] = v119,
                ["text"] = v120[1]
            }
        end
    end
    local v121 = v_u_28.apps.DialogApp:dialog({
        ["dialog_type"] = "ScrollingButtonsDialog",
        ["header"] = "SELECT TRICK",
        ["buttons"] = v118,
        ["exit_button"] = true,
        ["cells_per_row"] = 2,
        ["padding"] = 10
    })
    if v121 and v121 ~= "cancel" then
        if p_u_116.pet_trick_level < v121 then
            if v_u_32.prompt_unlock_trick(p_u_116) then
                v_u_28.apps.FocusPetApp:release_focus()
            end
            return
        end
        v_u_28.apps.FocusPetApp:release_focus()
        local v_u_122 = v117.tricks[v121][1]
        v_u_23.get("PetAPI/SayPetTrickMessage"):FireServer(v_u_122, p_u_116.pet_unique)
        v_u_30.delay(0.4):andThen(function()
            if v_u_24.get(p_u_116.char) then
                local v123 = {
                    ["trick_name"] = v_u_122
                }
                v_u_21.buffer_command(p_u_116.char, v_u_11.DoTrick, v123)
            end
        end)
    end
end
function v_u_32.take_chewtoy(p124)
    local v125 = p124.grabbed_pet_object
    if v125 then
        v_u_23.get("PetObjectAPI/DropPetObject"):FireServer(p124.char)
        v_u_15.equip_item_from_pet_object(v125)
        v125:Destroy()
    end
end
function v_u_32.dress_up(p126)
    v_u_28.apps.AvatarEditorApp.focus_switcher:set_focused_pet(p126)
    v_u_28.apps.AvatarEditorApp:set_focused_avatar_type("pet")
    v_u_2.queue_instant_update()
    v_u_28.set_app_visibility("AvatarEditorApp", true)
end
function v_u_32.can_pet_eat_equipped_item(p127)
    if p127 then
        local v128 = v_u_3.get("equip_manager") or {}
        local v129 = v128.pets
        local v130 = v128.food[1]
        if p127 and (v129 and v130) then
            return v_u_45(p127, v130)
        else
            return false
        end
    else
        return false
    end
end
return v_u_32