--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AvatarEditorApp.AvatarEditorNickname (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("ClientData")
local v_u_2 = v1("PlatformM")
local v_u_3 = v1("RouterClient")
v1("XboxSupport")
local v4 = v1("Class")
v1("AvatarClientManager")
v1("AvatarCategoriesDB")
local v_u_5 = v1("CharWrapperClient")
local v_u_6 = v1("InventoryDB")
local v7 = v4("AvatarEditorNickname", v1("UIBaseElement"))
local v_u_8 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v_u_9 = v_u_2.get_platform()
function v7.show(p10)
    p10.instance.Visible = true
end
function v7.hide(p11)
    p11.instance.Visible = false
end
function v7.get_focused_char_rp_name(p12)
    if p12.avatar_editor_app:is_focusing_mannequin() then
        return p12.avatar_editor_app.mannequin_outfit_name
    end
    local v13 = p12.avatar_editor_app:get_focused_char_wrapper()
    return not v13 and "" or (v13.rp_name or v13.char.Name)
end
function v7.start(p_u_14, p15)
    p_u_14.avatar_editor_app = p15
    if v_u_9 == v_u_2.platform.phone then
        p_u_14.instance.Size = p_u_14.instance.Size - UDim2.new(0, 50, 0, 10)
        p_u_14.instance.Position = p_u_14.instance.Position - UDim2.new(0, 0, 0, 20)
    end
    local function v_u_18(p16)
        if p16 == "" or p16 == nil then
            if p_u_14.avatar_editor_app:is_focusing_mannequin() then
                p_u_14.instance.TextLabel.AutoLocalize = true
                p16 = "Outfit"
            else
                local v17 = p_u_14.avatar_editor_app:get_focused_char_wrapper()
                if v17 then
                    p16 = v17.char.Name
                end
                if v17 and v17.is_pet then
                    p_u_14.instance.TextLabel.AutoLocalize = true
                else
                    p_u_14.instance.TextLabel.AutoLocalize = false
                end
            end
        else
            p_u_14.instance.TextLabel.AutoLocalize = false
        end
        p_u_14.instance.TextLabel.Text = p16
    end
    local v23 = {
        ["mouse_button1_down"] = function()
            local v19, v20 = p_u_14.UIManager.apps.DialogApp:paragraph_dialog({
                ["existing_text"] = p_u_14.instance.TextLabel.LocalizedText,
                ["left"] = "Cancel",
                ["right"] = "Save",
                ["max_length"] = 120
            })
            local v21 = p_u_14.avatar_editor_app:get_focused_char_wrapper()
            if v21 then
                if v21.is_pet then
                    local v22 = v_u_6.pets[v21.pet_id].name
                    v20 = v_u_8:Translate(workspace, v22) == v20 and "" or v20
                else
                    v20 = v21.player.Name == v20 and "" or v20
                end
            end
            if v19 == "Save" then
                if p_u_14.avatar_editor_app:is_focusing_player() then
                    v_u_3.get("SettingsAPI/SetSetting"):FireServer("rp_name", v20)
                    return
                end
                if p_u_14.avatar_editor_app:is_focusing_mannequin() then
                    p_u_14.avatar_editor_app.mannequin_outfit_name = v20
                    p_u_14.avatar_editor_app.has_unsaved_changes = true
                    v_u_18(v20)
                    return
                end
                if v21 then
                    v_u_3.get("SettingsAPI/SetPetRoleplayName"):InvokeServer(v21.pet_unique, v20)
                end
            end
        end
    }
    p_u_14.UIManager.wrap(p_u_14.instance, "JaggedButton"):start(v23)
    p_u_14.avatar_editor_app:bind_to_focus_changed(function(_)
        v_u_18(p_u_14:get_focused_char_rp_name())
    end)
    v_u_5.register_property_changed("rp_name", function()
        v_u_18(p_u_14:get_focused_char_rp_name())
    end)
    return p_u_14
end
return v7