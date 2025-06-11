--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AvatarEditorApp.AvatarEditorFocusSwitcher (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("SimpleEvents")
local v3 = v_u_1("Class")
local v_u_4 = v_u_1("Signal")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = v_u_1("InventoryDB")
local v_u_7 = v_u_1("EquippedPets")
local v_u_8 = v_u_1("AvatarClientManager")
local v9 = v3("AvatarEditorFocusSwitcher", v_u_1("UIBaseElement"))
local v_u_10 = false
function v9.toggle_focus(p11)
    if v_u_10 then
        return
    end
    v_u_10 = true
    if p11.avatar_type_focus == "player" then
        local v14 = v_u_7.choose_equipped(function(p12)
            local v13 = p12.id
            if v13 then
                v13 = v_u_6.pets[p12.id]
            end
            return not v13.is_egg
        end)
        local v15 = v_u_7.get_wrapper_from_item(v14)
        local v16 = nil
        local v17 = nil
        local v18 = nil
        local v19 = nil
        local v20
        if v15 then
            v20 = v15.char
        else
            v20 = v15
        end
        if v20 then
            local v21 = v15.pet_id
            local v22 = v_u_6.pets[v21]
            v16 = v22.is_egg
            v17 = v22.is_doll
            v18 = v22.is_customizable
        end
        local v23 = v_u_5.get("inventory").pets
        local v24
        if next(v23) == nil then
            v24 = false
        else
            v24 = true
            v19 = true
            for _, v25 in pairs(v23) do
                if not v_u_6.pets[v25.id].is_egg then
                    v19 = false
                    break
                end
            end
        end
        if v24 and not v19 then
            if v20 and not v18 then
                if v16 then
                    p11.UIManager.apps.DialogApp:dialog({
                        ["text"] = "You can\'t dress up eggs. Select a different pet!",
                        ["button"] = "Okay"
                    })
                elseif v17 then
                    p11.UIManager.apps.DialogApp:dialog({
                        ["text"] = "You can\'t dress up dolls. Select a different pet!",
                        ["button"] = "Okay"
                    })
                else
                    p11.UIManager.apps.DialogApp:dialog({
                        ["text"] = "You can\'t customize this pet. Select a different pet!",
                        ["button"] = "Okay"
                    })
                end
                local v26 = p11:_pick_pet_from_backpack()
                if v26 then
                    p11:set_focused_pet(v26)
                    p11:focus_pet(true)
                end
            elseif v20 then
                p11:set_focused_pet(v15)
                p11:focus_pet()
            else
                local v27 = p11:_pick_pet_from_backpack()
                if v27 then
                    p11:set_focused_pet(v27)
                    p11:focus_pet(true)
                end
            end
        else
            p11.UIManager.apps.DialogApp:dialog({
                ["text"] = "You need to hatch a pet first!",
                ["button"] = "Okay"
            })
        end
    elseif p11.avatar_type_focus == "pet" then
        p11:focus_player()
    end
    v_u_10 = false
end
function v9._hook_character_added(p_u_28)
    v_u_2.get("MyCharacterAdded"):connect(function(p29)
        p29:WaitForChild("Humanoid")
        p29:WaitForChild("HumanoidRootPart")
        p_u_28:_set_character_for_avatar_type("player", p29)
        p_u_28:focus_player()
    end)
    local v_u_30 = nil
    v_u_5.register_callback_plus_existing("pet_char_wrappers", function(p31, p32, _)
        if p31 ~= game.Players.LocalPlayer then
            return
        end
        if p32 and #p32 > 0 then
            if p_u_28.avatar_type_focus == "pet" then
                local v33 = v_u_30 and v_u_30.char
                if v33 then
                    v33 = v_u_30.char.Parent
                end
                if v33 then
                    return
                end
                local v34 = nil
                for _, v35 in p32 do
                    if v_u_30 and v_u_30.pet_id == v35.pet_id then
                        v34 = v35
                        break
                    end
                    v34 = v34 or v35
                end
                v_u_30 = v34
                local v36 = v_u_30.pet_id
                if v_u_6.pets[v36].is_customizable then
                    p_u_28:set_focused_pet(v_u_30)
                    p_u_28:focus_pet(true)
                else
                    p_u_28:focus_player()
                end
            end
        elseif p_u_28.avatar_type_focus == "pet" then
            p_u_28:focus_player()
        end
    end)
end
function v9.set_focused_avatar_type(p37, p38)
    if p38 == "player" then
        p37:focus_player()
    elseif p38 == "pet" then
        p37:focus_pet()
    end
end
function v9.get_focused_avatar_type(p39)
    return p39.avatar_type_focus
end
function v9.focus_player(p40)
    local v41 = p40:_get_character_for_avatar_type("player")
    if v41 and v41.Parent then
        p40.avatar_type_focus = "player"
        p40.focused_character_changed:Fire(v41, p40.avatar_type_focus)
        p40.instance.ActionText.TextColor3 = Color3.fromRGB(252, 56, 136)
        p40.instance.SubjectText.TextColor3 = Color3.fromRGB(252, 56, 136)
        p40.instance.SubjectText.Text = "PET"
        p40.instance.Icon.Image = "rbxassetid://4684218161"
        p40.instance.Visible = true
        v_u_8.submit_analytics_event("switched_to_player_avatar_editor")
    end
end
function v9.focus_pet(p42, p43)
    local v44 = p42:_get_character_for_avatar_type("pet")
    if v44 and v44.Parent ~= nil then
        p42.avatar_type_focus = "pet"
        p42.focused_character_changed:Fire(v44, p42.avatar_type_focus, p43)
        p42.instance.ActionText.TextColor3 = Color3.fromRGB(159, 91, 248)
        p42.instance.SubjectText.TextColor3 = Color3.fromRGB(159, 91, 248)
        p42.instance.SubjectText.Text = "AVATAR"
        p42.instance.Icon.Image = "rbxassetid://4684218100"
        p42.instance.Visible = true
        v_u_8.submit_analytics_event("switched_to_pet_avatar_editor")
    end
end
function v9.get_focused_pet_wrapper(p45)
    if p45:get_focused_avatar_type() == "pet" then
        return p45.focused_pet_wrapper
    end
end
function v9.set_focused_pet(p46, p47)
    p46.focused_pet_wrapper = p47
    p46:_set_character_for_avatar_type("pet", p47.char)
end
function v9.focus_mannequin(p48, p49)
    p48:_set_character_for_avatar_type("mannequin", p49)
    if p49 and p49.Parent ~= nil then
        p48.avatar_type_focus = "mannequin"
        p48.focused_character_changed:Fire(p49, p48.avatar_type_focus)
        p48.instance.Visible = false
    else
        warn("[AvatarEditorFocusSwitcher] Mannequin did not exist")
    end
end
function v9._pick_pet_from_backpack(p50)
    v_u_1("ClientData")
    local v51 = v_u_1("ClientToolManager")
    p50.UIManager.apps.BackpackApp:select_category("pets")
    local v55 = {
        ["visible_backpack_categories"] = { "favorites", "pets" },
        ["allow_callback"] = function(p52)
            local v53 = v_u_6[p52.category] and v_u_6[p52.category][p52.kind] or {}
            local v54
            if v53.category == "pets" then
                v54 = not v53.is_egg
            else
                v54 = false
            end
            return v54
        end
    }
    local v56 = p50.UIManager.apps.BackpackApp:pick_item(v55)
    if v56 and v56.category == "pets" then
        local v57 = v_u_6.pets[v56.id]
        if v57.is_egg then
            p50.UIManager.apps.DialogApp:dialog({
                ["text"] = "Eggs cannot be dressed up.",
                ["button"] = "Okay"
            })
            return
        elseif v57.is_doll then
            p50.UIManager.apps.DialogApp:dialog({
                ["text"] = "Dolls cannot be dressed up.",
                ["button"] = "Okay"
            })
        else
            if v57.is_customizable then
                local v58 = nil
                if v51.equip(v56) then
                    local v59 = tick()
                    while true do
                        v58 = tick() - v59 >= 8 or v_u_7.get_wrapper_from_item(v56)
                        if v58 then
                            break
                        end
                        wait(0.1)
                    end
                end
                return v58
            end
            p50.UIManager.apps.DialogApp:dialog({
                ["text"] = "This pet cannot be customized.",
                ["button"] = "Okay"
            })
        end
    else
        return
    end
end
function v9._set_character_for_avatar_type(p60, p61, p62)
    p60.avatar_type_to_character_map[p61] = p62
end
function v9._get_character_for_avatar_type(p63, p64)
    return p63.avatar_type_to_character_map[p64]
end
function v9.get_current_character(p65)
    return p65.avatar_type_to_character_map[p65.avatar_type_focus]
end
function v9.start(p_u_66, p67)
    p_u_66.avatar_editor_app = p67
    p_u_66.current_char = nil
    p_u_66.avatar_type_focus = "player"
    p_u_66.avatar_type_to_character_map = {}
    p_u_66.focused_character_changed = v_u_4.new()
    local v68 = {
        ["mouse_button1_down"] = function()
            if v_u_1("MinigameForcedState").can_toggle_edit_avatars() then
                p_u_66:toggle_focus()
            else
                p_u_66.UIManager.apps.HintApp:hint({
                    ["text"] = "You can\'t do that right now!",
                    ["yields"] = false,
                    ["overridable"] = true,
                    ["length"] = 4.5
                })
            end
        end
    }
    p_u_66.UIManager.wrap(p_u_66.instance, "WhiteJaggedButton"):start(v68)
    p_u_66:_hook_character_added()
    return p_u_66
end
return v9