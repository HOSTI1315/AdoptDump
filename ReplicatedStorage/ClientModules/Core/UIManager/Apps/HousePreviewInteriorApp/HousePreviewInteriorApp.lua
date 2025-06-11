--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HousePreviewInteriorApp (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1:WaitForChild("Fsys")).load
local v3 = v_u_2("Class")
local v_u_4 = v_u_2("package:Promise")
local v_u_5 = v_u_2("TweenPromise")
local v6 = v3("HousePreviewInteriorApp", v_u_2("UIBaseApp"))
function v6._show_exit_preview_button(p7)
    local v8 = p7.exit_preview_button
    if not v8 then
        local v9 = {
            ["priority"] = 1,
            ["text"] = "Exit Preview",
            ["mouse_button1_click"] = function()
                v_u_2("InteriorsM").enter_smooth("exit_housing_preview", "MainDoor")
            end
        }
        v8 = p7.UIManager.apps.ExtraButtonsApp:register_button(v9)
    end
    p7.exit_preview_button = v8
    p7.exit_preview_button:show()
end
function v6._hide_exit_preview_button(p10)
    if p10.exit_preview_button then
        p10.exit_preview_button:hide()
    end
end
function v6.set_addon_area_visibility(p11, p12)
    p11.instance.Body.Middle.Visible = p12
end
function v6.set_addon_area_text(p13, p14)
    local v15 = p13.addon_title.Text
    local v16 = string.upper(p14)
    if v15 ~= v16 then
        p13.addon_title.Text = v16
        local v_u_17 = p13.addon_title.UIScale
        p13.area_text_size_tween:cancel()
        p13.area_text_size_tween = v_u_5.new(v_u_17, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            ["Scale"] = 1.5
        }):andThen(function()
            return v_u_5.new(v_u_17, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ["Scale"] = 1
            })
        end)
    end
end
function v6.start(p18)
    p18.addon_title = p18.instance.Body.Middle.Container.TitleLabel
    p18.area_text_size_tween = v_u_4.resolve()
end
function v6.show(p19)
    p19.instance.Body.Visible = true
    p19:_show_exit_preview_button()
end
function v6.hide(p20)
    p20.instance.Body.Visible = false
    p20:_hide_exit_preview_button()
end
function v6.refresh(p21, p22)
    local v23 = p21.UIManager.is_closed({
        "MainMenuApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "TradePreviewApp",
        "TradeHistoryApp",
        "PlayerSpectateApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp"
    })
    if not p22[p21.ClassName] then
        v23 = false
    end
    if p21.UIManager.apps.HouseEditorWrapperApp.editor_open and p21.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v23 = false
    end
    p21:set_visibility(v23)
end
return v6