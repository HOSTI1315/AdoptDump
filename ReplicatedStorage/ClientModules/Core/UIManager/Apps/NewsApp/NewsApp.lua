--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.NewsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("Flags")
local v_u_4 = v_u_1("GamepassDB")
local v_u_5 = v_u_1("Maid")
local v_u_6 = v_u_1("NewsAppDetailsClient")
local v_u_7 = v_u_1("PatchNotesHelper")
local v_u_8 = v_u_1("PolicyHelper")
local v_u_9 = v_u_1("ProductImages")
local v_u_10 = v_u_1("RouterClient")
local v_u_11 = v_u_1("ScriptUtil")
local v_u_12 = v_u_1("ServerType")
local v13 = v_u_1("ShopApp")
local v_u_14 = v_u_1("SoundPlayer")
local v_u_15 = v_u_1("new:SubscriptionsDB")
local v_u_16 = v_u_1("XboxSupport")
local v_u_17 = v_u_1("package:Sift")
local v_u_18 = game:GetService("Players")
local v_u_19 = {
    ["FeaturedItemKey"] = v13.get_featured_item_kind(),
    ["ThumbnailImage"] = "rbxthumb://type=GameThumbnail&id=920587237&w=768&h=432",
    ["ThumbnailTextMain"] = "",
    ["ThumbnailTextMainTextXAlignment"] = Enum.TextXAlignment.Left,
    ["ThumbnailTextAdditional"] = "",
    ["Hashcode"] = 0
}
local v20 = v2("NewsApp", v_u_1("UIBaseApp"))
function v20.show(p21)
    p21.instance.Enabled = true
    p21:refresh_news()
end
function v20.hide(p22)
    p22.instance.Enabled = false
    p22.cont.continue()
    p22.cont = v_u_11.create_continue()
end
function v20.get_details(_)
    local v23 = v_u_6.get_details()
    return v23 and v_u_17.Dictionary.join(v_u_19, v23) or nil
end
function v20.refresh_news(p_u_24)
    local v25 = p_u_24:get_details()
    if v25 then
        p_u_24.page_maid:DoCleaning()
        if not p_u_24.viewed_news then
            p_u_24.viewed_news = true
            v_u_10.get("MainMenuAPI/ViewedNews"):FireServer()
        end
        p_u_24.contents.ThumbnailFrame.ThumbnailImage.Image = v25.ThumbnailImage
        p_u_24.contents.ThumbnailFrame.ThumbnailImage.ThumbnailTextMain.Text = v25.ThumbnailTextMain
        p_u_24.contents.ThumbnailFrame.ThumbnailImage.ThumbnailTextAdditional.Text = v25.ThumbnailTextAdditional
        p_u_24.contents.NewsTextTitle.Text = v25.NewsTextTitle
        p_u_24.contents.ThumbnailFrame.ThumbnailImage.ThumbnailTextMain.TextXAlignment = v25.ThumbnailTextMainTextXAlignment
        p_u_24.contents.NewsTextBody.Text = v25.NewsTextBody
        p_u_24.contents.Visible = true
        p_u_24.patch_notes.Visible = false
        p_u_24.patch_notes_button.instance.Face.Open.Visible = true
        p_u_24.patch_notes_button.instance.Face.Back.Visible = false
        p_u_24.instance.EnclosingFrame.RightCards.Notecard.ImageButton.Image = ""
        local v26 = v25.FeaturedItemKey
        v_u_9.get(v26, {
            ["use_large_image_id"] = true
        }):andThen(function(p27)
            p_u_24.instance.EnclosingFrame.RightCards.Notecard.ImageButton.Image = p27
            p_u_24.instance.EnclosingFrame.RightCards.Notecard.Visible = true
        end)
    end
end
function v20.refresh_patch_notes(p_u_28)
    p_u_28.page_maid:DoCleaning()
    if not p_u_28.viewed_patch_notes then
        p_u_28.viewed_patch_notes = true
        v_u_10.get("MainMenuAPI/ViewedPatchNotes"):FireServer(p_u_28.patch_notes_helper:get_latest_id())
    end
    p_u_28.patch_notes_helper:render_patch_notes()
    p_u_28.page_maid:GiveTask(function()
        p_u_28.patch_notes_helper:cleanup()
    end)
    p_u_28.contents.Visible = false
    p_u_28.patch_notes.Visible = true
    p_u_28.patch_notes_button.instance.Face.Back.Visible = true
    p_u_28.patch_notes_button.instance.Face.Open.Visible = false
    p_u_28.patch_notes_button.instance.Notification.Visible = false
end
function v20.show_news(p29)
    v_u_1("UIManager").set_app_visibility("NewsApp", true)
    return p29.cont.yield()
end
function v20.refresh_patch_notes_notification(p30)
    local v31 = p30.patch_notes_helper:get_latest_id() ~= p30.patch_notes_helper:get_latest_viewed_id()
    p30.patch_notes_button.instance.Notification.Visible = v31
end
function v20.start(p_u_32)
    local v_u_33 = v_u_1("RouterClient")
    p_u_32.contents = p_u_32.instance.EnclosingFrame.MainFrame.Contents
    p_u_32.patch_notes = p_u_32.instance.EnclosingFrame.MainFrame.PatchNotes
    p_u_32.buttons = p_u_32.instance.EnclosingFrame.MainFrame.Buttons
    p_u_32.viewed_news = false
    p_u_32.viewed_patch_notes = false
    p_u_32.UIManager.wrap(p_u_32.patch_notes, "ScrollingFrameGradients"):start()
    p_u_32.page_maid = v_u_5.new()
    p_u_32.block_index = 0
    local v34 = {}
    for _, v35 in p_u_32.patch_notes.ScrollingFrame:GetChildren() do
        if v35:IsA("GuiObject") then
            v34[v35.Name] = v35
            v35.Parent = nil
        end
    end
    p_u_32.patch_notes_helper = v_u_7.new(p_u_32.patch_notes.ScrollingFrame, v34)
    p_u_32.buttons.PatchNotesButton.Visible = v_u_7:has_patch_notes()
    if not v_u_8.is_external_link_allowed(game.Players.LocalPlayer, "YouTube") then
        p_u_32.instance.EnclosingFrame.PostItNote1.Visible = false
    end
    p_u_32.cont = v_u_11.create_continue()
    local v36 = {
        ["mouse_button1_click"] = function()
            v_u_14.FX:play("BambooButton")
            p_u_32.UIManager.set_app_visibility(p_u_32.ClassName, false)
        end
    }
    p_u_32.UIManager.wrap(p_u_32.buttons.PlayButton, "DepthButton"):start(v36)
    p_u_32.patch_notes_button = p_u_32.UIManager.wrap(p_u_32.buttons.PatchNotesButton, "DepthButton")
    local v37 = {
        ["state"] = "selected",
        ["mouse_button1_click"] = function()
            v_u_14.FX:play("BambooButton")
            if p_u_32.contents.Visible then
                p_u_32:refresh_patch_notes()
            else
                p_u_32:refresh_news()
            end
        end
    }
    p_u_32.patch_notes_button:start(v37)
    p_u_32:refresh_patch_notes_notification()
    p_u_32.instance.EnclosingFrame.RightCards.PolicyInfo.Visible = v_u_8.get_policy_info(v_u_18.LocalPlayer).ArePaidRandomItemsRestricted
    local v38 = not v_u_12.use_production_behavior()
    if v38 then
        v38 = v_u_3.force_prompt_test_lab_teleport
    end
    if v38 then
        p_u_32.instance.EnclosingFrame.RightCards.Notecard.Visible = false
        p_u_32.instance.EnclosingFrame.RightCards.JoinExperimentalNotecard.Visible = true
        local v40 = {
            ["mouse_button1_click"] = function()
                local v39 = v_u_1("UIManager")
                if v39.apps.DialogApp:dialog({
                    ["text"] = "Teleport to the Adopt Me Test Lab?",
                    ["left"] = "No",
                    ["right"] = "Yes"
                }) == "Yes" then
                    v_u_33.get("TeleportAPI/TeleportToExperimental"):FireServer()
                    v39.apps.ExperimentalNewsApp.instance.Enabled = false
                    v39.apps.DialogApp:dialog({
                        ["text"] = "Teleporting you to the Adopt Me Test Lab, this may take a moment..."
                    })
                end
            end
        }
        p_u_32.UIManager.wrap(p_u_32.instance.EnclosingFrame.JoinExperimentalNotecard.DepthButton, "DepthButton"):start(v40)
    else
        p_u_32.instance.EnclosingFrame.RightCards.Notecard.Visible = true
        p_u_32.instance.EnclosingFrame.RightCards.JoinExperimentalNotecard.Visible = false
        local v45 = {
            ["mouse_button1_click"] = function()
                local v41 = p_u_32:get_details()
                if v41 then
                    local v42 = v41.FeaturedItemKey
                    local v43 = v_u_4[v42] ~= nil
                    local v44 = v_u_15[v42] ~= nil
                    if v43 then
                        v_u_33.get("ProductsAPI/PromptGamepassPurchase"):FireServer(v42)
                        return
                    elseif v44 then
                        p_u_32.UIManager.apps.SubscriptionConfirmationApp:display_subscription(v42)
                    else
                        v_u_33.get("ProductsAPI/PromptProductPurchase"):FireServer(v42)
                    end
                else
                    return
                end
            end
        }
        p_u_32.UIManager.wrap(p_u_32.instance.EnclosingFrame.RightCards.Notecard.DepthButton, "DepthButton"):start(v45)
    end
    v_u_16.quick_watch({
        ["selection_parent"] = p_u_32.instance.EnclosingFrame,
        ["open_close_instance"] = p_u_32.instance,
        ["default_selection"] = p_u_32.buttons.PlayButton,
        ["app_name"] = p_u_32.ClassName
    })
    v_u_6.get_details_changed_signal():Connect(function()
        if p_u_32.contents.Visible then
            p_u_32:refresh_news()
        end
    end)
end
return v20