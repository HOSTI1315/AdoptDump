--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ExperimentalNewsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("XboxSupport")
local v_u_4 = v_u_1("ScriptUtil")
local v_u_5 = v_u_1("PolicyHelper")
local v_u_6 = v_u_1("SoundPlayer")
local v7 = v2("ExperimentalNewsApp", v_u_1("UIBaseApp"))
local v_u_10 = {
    ["ThumbnailImage"] = "rbxassetid://6942178396",
    ["ThumbnailTextMain"] = "",
    ["ThumbnailTextMainTextXAlignment"] = Enum.TextXAlignment.Left,
    ["ThumbnailTextAdditional"] = "",
    ["NewsTextTitle"] = "TEST LAB!",
    ["NewsTextBody"] = "\240\159\145\169\240\159\143\189\226\128\141\240\159\148\172 Welcome to the Adopt Me Test Lab!\n\240\159\167\170We\'ll be trying out experimental changes here",
    ["PurchaseFunction"] = function()
        local v8 = v_u_1("UIManager")
        local v9 = v_u_1("RouterClient")
        if v8.apps.DialogApp:dialog({
            ["text"] = "Teleport back to the main version of Adopt Me?",
            ["left"] = "No",
            ["right"] = "Yes"
        }) == "Yes" then
            v9.get("TeleportAPI/TeleportToMain"):FireServer()
            v8.apps.ExperimentalNewsApp.instance.Enabled = false
            v8.apps.DialogApp:dialog({
                ["text"] = "Teleporting you back to Adopt Me, this may take a moment..."
            })
        end
    end
}
function v7.show(p11)
    p11.instance.Enabled = true
end
function v7.hide(p12)
    p12.instance.Enabled = false
    p12.cont.continue()
    p12.cont = v_u_4.create_continue()
end
function v7.update_news(p13)
    p13.instance.EnclosingFrame.MainFrame.ThumbnailFrame.ThumbnailImage.Image = v_u_10.ThumbnailImage
    p13.instance.EnclosingFrame.MainFrame.ThumbnailFrame.ThumbnailImage.ThumbnailTextMain.Text = v_u_10.ThumbnailTextMain
    p13.instance.EnclosingFrame.MainFrame.ThumbnailFrame.ThumbnailImage.ThumbnailTextAdditional.Text = v_u_10.ThumbnailTextAdditional
    p13.instance.EnclosingFrame.MainFrame.Contents.NewsTextTitle.Text = v_u_10.NewsTextTitle
    p13.instance.EnclosingFrame.MainFrame.ThumbnailFrame.ThumbnailImage.ThumbnailTextMain.TextXAlignment = v_u_10.ThumbnailTextMainTextXAlignment
    p13.instance.EnclosingFrame.MainFrame.Contents.NewsTextBody.Text = v_u_10.NewsTextBody
end
function v7.show_news(p14)
    local v15 = v_u_1("UIManager")
    local v16 = v_u_1("RouterClient")
    if v15.apps.DialogApp:dialog({
        ["text"] = "You\'re entering the Adopt Me Test Lab. Your data will be different from the main game and will reset often. Would you like to continue?",
        ["left"] = "No",
        ["right"] = "Yes"
    }) == "No" then
        v16.get("TeleportAPI/TeleportToMain"):FireServer()
        v15.apps.DialogApp:dialog({
            ["text"] = "Teleporting you back to Adopt Me, this may take a moment..."
        })
    else
        v15.set_app_visibility("ExperimentalNewsApp", true)
    end
    return p14.cont.yield()
end
function v7.start(p_u_17)
    p_u_17:update_news()
    if not v_u_5.is_external_link_allowed(game.Players.LocalPlayer, "Twitter") then
        p_u_17.instance.EnclosingFrame.PostItNote1.Visible = false
    end
    if not v_u_5.is_external_link_allowed(game.Players.LocalPlayer, "YouTube") then
        p_u_17.instance.EnclosingFrame.PostItNote2.Visible = false
    end
    p_u_17.cont = v_u_4.create_continue()
    local v18 = {
        ["mouse_button1_click"] = function()
            v_u_6.FX:play("BambooButton")
            p_u_17.UIManager.set_app_visibility(p_u_17.ClassName, false)
        end
    }
    p_u_17.UIManager.wrap(p_u_17.instance.EnclosingFrame.MainFrame.Contents.PlayButton, "DepthButton"):start(v18)
    p_u_17.UIManager.wrap(p_u_17.instance.EnclosingFrame.Notecard.DepthButton, "DepthButton"):start({
        ["mouse_button1_click"] = v_u_10.PurchaseFunction
    })
    v_u_3.quick_watch({
        ["selection_parent"] = p_u_17.instance.EnclosingFrame,
        ["open_close_instance"] = p_u_17.instance,
        ["default_selection"] = p_u_17.instance.EnclosingFrame.MainFrame.Contents.PlayButton,
        ["app_name"] = p_u_17.ClassName
    })
end
return v7