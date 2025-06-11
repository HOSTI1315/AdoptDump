--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AvatarEditorApp.AvatarEditorOutfits (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("RouterClient")
local v5 = v1("Class")
local v_u_6 = v1("AvatarClientManager")
local v7 = v5("AvatarEditorOutfits", v1("UIBaseElement"))
local v_u_8 = v_u_3.get_platform()
function v7.show(p9)
    p9.instance.Visible = true
end
function v7.hide(p10)
    p10.instance.Visible = false
end
function v7.clear_outfits(p11)
    for _, v12 in pairs(p11.content:GetChildren()) do
        if v12:IsA("ImageButton") then
            v12:Destroy()
        end
    end
end
function v7.refresh_outfits(p_u_13)
    p_u_13:clear_outfits()
    local v_u_14 = p_u_13.avatar_editor_app:get_focused_avatar_type()
    local v_u_15 = p_u_13.avatar_editor_app:get_focused_avatar_rig_type()
    local v16 = v_u_15 == "player" and "outfits" or "pet_outfits"
    local v17 = v_u_2.get(v16) or {}
    table.sort(v17, function(p18, p19)
        return p18.timestamp < p19.timestamp
    end)
    for v20, v21 in pairs(v17) do
        local v22 = v21.name
        local v_u_23 = v21.is_temporary_outfit
        local v_u_24 = p_u_13.template:clone()
        v_u_24.LayoutOrder = 99999 - v20
        v_u_24.OutfitName.Text = v22
        v_u_24.OutfitName.AutoLocalize = v22 == "[Unsaved Outfit]*"
        v_u_24.Parent = p_u_13.content
        v_u_24[v_u_3.mouse_down_or_click()]:connect(function()
            if p_u_13.UIManager.apps.DialogApp:dialog({
                ["text"] = string.format("Put on \"%s\" outfit?", v_u_24.OutfitName.Text),
                ["left"] = "Cancel",
                ["right"] = "Wear"
            }) == "Wear" then
                v_u_4.get("AvatarAPI/WearOutfit"):FireServer(v_u_14, v_u_24.OutfitName.Text, p_u_13:_get_focused_pet_unique())
                v_u_6.submit_analytics_event("outfit_worn")
            end
        end)
        v_u_24.Settings[v_u_3.mouse_down_or_click()]:connect(function()
            local v25, v26 = p_u_13.UIManager.apps.DialogApp:free_response_dialog({
                ["text"] = "Outfit Name:",
                ["existing_text"] = v_u_24.OutfitName.Text,
                ["left"] = "Cancel",
                ["center"] = "Delete",
                ["right"] = not v_u_23 and "Save" or nil,
                ["max_length"] = 45,
                ["is_text_box_editable"] = not v_u_23
            })
            if v25 == "Delete" then
                if p_u_13.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Are you sure you want to delete outfit \"" .. v_u_24.OutfitName.Text .. "\"?",
                    ["left"] = "Cancel",
                    ["right"] = "Delete"
                }) == "Delete" then
                    v_u_4.get("AvatarAPI/DeleteOutfit"):FireServer(v_u_15, v_u_24.OutfitName.Text, p_u_13:_get_focused_pet_unique())
                    return
                end
            elseif v25 == "Save" then
                v_u_4.get("AvatarAPI/RenameOutfit"):FireServer(v_u_15, v_u_24.OutfitName.Text, v26, p_u_13:_get_focused_pet_unique())
            end
        end)
    end
    p_u_13.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, p_u_13.content.UIListLayout.AbsoluteContentSize.Y + 35)
end
function v7._get_focused_pet_unique(p27)
    local v28 = p27.avatar_editor_app.focus_switcher:get_focused_pet_wrapper()
    if v28 then
        v28 = v28.pet_unique
    end
    return v28
end
function v7._refresh_roblox_avatar_button(p29)
    local v30 = p29.avatar_editor_app:get_focused_avatar_rig_type()
    if v30 == "player" then
        p29.instance.Footer.RobloxAvatarButton.ProfileIcon.Visible = true
        p29.instance.Footer.RobloxAvatarButton.TextContainer.Visible = true
        p29.instance.Footer.RobloxAvatarButton.TakeOffEverything.Visible = false
    elseif v30 == "pet" then
        p29.instance.Footer.RobloxAvatarButton.ProfileIcon.Visible = false
        p29.instance.Footer.RobloxAvatarButton.TextContainer.Visible = false
        p29.instance.Footer.RobloxAvatarButton.TakeOffEverything.Visible = true
    end
end
local function v_u_34(p31)
    while true do
        local v32, v33 = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, p31)
        if v33 then
            break
        end
        task.wait(5)
    end
    return v32
end
function v7._prompt_roblox_avatar_controls(p35)
    local v36 = p35.UIManager.apps.DialogApp
    local v37 = {
        ["dialog_type"] = "LargeButtonsListDialog"
    }
    local v38 = {
        ["load_avatar"] = {
            ["text"] = "Load my Roblox Avatar",
            ["icon"] = p35.profile_pic_large and {
                ["image"] = p35.profile_pic_large
            } or nil,
            ["layout_order"] = 1,
            ["weight"] = 1.71
        },
        ["export_avatar"] = {
            ["text"] = "Save to Roblox Avatar",
            ["icon"] = {
                ["image"] = "rbxassetid://14566542982",
                ["size"] = UDim2.new(0, 36, 0, 36)
            },
            ["layout_order"] = 2,
            ["weight"] = 1
        },
        ["close"] = {
            ["text"] = "Close",
            ["layout_order"] = 3,
            ["weight"] = 1,
            ["button_state"] = "cancel"
        }
    }
    v37.buttons = v38
    local v39 = v36:dialog(v37)
    local v40 = p35.avatar_editor_app:get_focused_avatar_type()
    if v39 == "load_avatar" then
        v_u_4.get("AvatarAPI/ResetToRobloxChar"):FireServer(v40)
        v_u_6.submit_analytics_event("roblox_avatar_loaded")
    elseif v39 == "export_avatar" then
        p35.UIManager.apps.ExportAvatarApp.avatar_type = v40
        p35.UIManager.set_app_visibility("ExportAvatarApp", true)
    end
end
function v7.start(p_u_41, p42)
    p_u_41.avatar_editor_app = p42
    if v_u_8 == v_u_3.platform.phone then
        p_u_41.instance.Size = UDim2.new(0.333, 0, p_u_41.instance.Size.Y.Scale, p_u_41.instance.Size.Y.Offset)
        p_u_41.instance.Body.Size = UDim2.new(1, 0, 1, -111)
        p_u_41.instance.Footer.Size = UDim2.new(1, -6, 0, 57)
        p_u_41.instance.Footer.RobloxAvatarButton.Size = UDim2.new(1, -8, 0, 51)
        p_u_41.instance.Footer.RobloxAvatarButton.ProfileIcon.Size = UDim2.new(0, 42, 0, 42)
        p_u_41.instance.Footer.RobloxAvatarButton.ProfileIcon.Position = UDim2.new(0, 30, 0.5, 0)
    end
    task.spawn(function()
        p_u_41.instance.Footer.RobloxAvatarButton.ProfileIcon.Image = ""
        p_u_41.profile_pic_small = v_u_34(Enum.ThumbnailSize.Size48x48)
        p_u_41.instance.Footer.RobloxAvatarButton.ProfileIcon.Image = p_u_41.profile_pic_small
    end)
    task.spawn(function()
        p_u_41.profile_pic_large = v_u_34(Enum.ThumbnailSize.Size100x100)
    end)
    p_u_41.body = p_u_41.instance.Body
    p_u_41.scrolling_frame = p_u_41.body.ScrollComplex.ScrollingFrame
    p_u_41.content = p_u_41.scrolling_frame.Content
    p_u_41.template = p_u_41.content.EntryTemplate
    p_u_41.template.Parent = nil
    p_u_41:refresh_outfits()
    v_u_2.register_callback("outfits", function()
        if p_u_41.avatar_editor_app:is_focusing_player() or p_u_41.avatar_editor_app:is_focusing_mannequin() then
            p_u_41:refresh_outfits()
        end
    end)
    v_u_2.register_callback("pet_outfits", function()
        if p_u_41.avatar_editor_app:is_focusing_pet() then
            p_u_41:refresh_outfits()
        end
    end)
    p_u_41.avatar_editor_app:bind_to_focus_changed(function(_, _)
        p_u_41:refresh_outfits()
        p_u_41:_refresh_roblox_avatar_button()
    end)
    local v_u_43 = nil
    p_u_41.UIManager.wrap(p_u_41.instance.Header.SaveOutfit, "BasicButton"):start({
        [(v_u_8 == v_u_3.platform.phone or v_u_8 == v_u_3.platform.tablet) and "mouse_button1_click" or "mouse_button1_down"] = function()
            if not v_u_43 then
                v_u_43 = true
                local v44 = p_u_41.avatar_editor_app:get_focused_avatar_type()
                local v45, v46 = p_u_41.UIManager.apps.DialogApp:free_response_dialog({
                    ["text"] = "Outfit Name:",
                    ["left"] = "Cancel",
                    ["right"] = "Save",
                    ["max_length"] = 45
                })
                if v45 == "Save" then
                    local v47 = v46 == "" and "Unnamed" or v46
                    v_u_4.get("AvatarAPI/SaveOutfit"):FireServer(v44, v47, p_u_41:_get_focused_pet_unique())
                    v_u_6.submit_analytics_event("outfit_saved")
                end
                v_u_43 = false
            end
        end
    })
    p_u_41.UIManager.wrap(p_u_41.instance.Header.ExitButton, "BasicButton"):start({
        [(v_u_8 == v_u_3.platform.phone or v_u_8 == v_u_3.platform.tablet) and "mouse_button1_click" or "mouse_button1_down"] = function()
            if p_u_41.avatar_editor_app:is_focusing_mannequin() and p_u_41.avatar_editor_app.has_unsaved_changes then
                local v48 = p_u_41.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Save this outfit to the mannequin?",
                    ["left"] = "Exit",
                    ["right"] = "Save",
                    ["exit_button"] = true
                })
                if not v48 then
                    return
                end
                if v48 == "Exit" and p_u_41.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Are you sure you want to exit without saving?",
                    ["left"] = "No",
                    ["right"] = "Yes",
                    ["exit_button"] = true
                }) ~= "Yes" then
                    return
                end
                p_u_41.avatar_editor_app.did_save_mannequin = v48 == "Save"
            end
            p_u_41.UIManager.set_app_visibility("AvatarEditorApp", false)
        end
    })
    p_u_41.UIManager.wrap(p_u_41.instance.Footer.RobloxAvatarButton, "JaggedButton"):start({
        [(v_u_8 == v_u_3.platform.phone or v_u_8 == v_u_3.platform.tablet) and "mouse_button1_click" or "mouse_button1_down"] = function()
            if p_u_41.avatar_editor_app:get_focused_avatar_rig_type() == "pet" then
                if p_u_41.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Take everything off your pet?",
                    ["left"] = "No",
                    ["right"] = "Yes"
                }) == "Yes" then
                    v_u_4.get("AvatarAPI/TakeOffEverything"):InvokeServer("pet", p_u_41:_get_focused_pet_unique())
                    return
                end
            else
                p_u_41:_prompt_roblox_avatar_controls()
            end
        end
    })
    return p_u_41
end
return v7