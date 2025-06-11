--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TesterWatermarkApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Flags")
local v_u_4 = v1("ServerType")
local v_u_5 = v1("new:TestLabConfig")
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("RunService")
local v8, v_u_9 = v2("TesterWatermarkApp", v1("UIBaseApp"))
function v8.__init(p10, ...)
    v_u_9.__init(p10, ...)
    local v11 = Instance.new("ScreenGui")
    v11.Name = "TesterWatermarkApp"
    v11.Enabled = true
    v11.DisplayOrder = 100
    v11.IgnoreGuiInset = true
    p10.instance = v11
    v11.Parent = v_u_6.LocalPlayer.PlayerGui
end
function v8.show(p12)
    p12.watermark:set_visible(true)
end
function v8.hide(p13)
    p13.watermark:set_visible(false)
end
function v8.refresh(p14, _)
    local v15 = false
    if v_u_4.use_test_lab_behavior() then
        v15 = v_u_5.watermark.enabled
    elseif not v_u_4.use_production_behavior() then
        v15 = v_u_3.show_watermark_in_non_testlab_test_servers
    end
    v_u_7:IsStudio()
    p14:set_visibility(p14.forced_visible and true or v15)
end
function v8.start(p16)
    p16.watermark = p16.UIManager.wrap(p16.instance, "Watermark"):start(function(p17)
        return {
            {
                ["name"] = "PlaceName",
                ["text_size"] = 30,
                ["value"] = p17.place_name,
                ["transparency"] = v_u_5.watermark.transparency
            },
            {
                ["name"] = "GameId",
                ["text_size"] = 15,
                ["value"] = p17.game_id,
                ["transparency"] = v_u_5.watermark.transparency
            },
            {
                ["name"] = "UserName",
                ["text_size"] = 30,
                ["value"] = p17.user_name,
                ["transparency"] = v_u_5.watermark.transparency
            },
            {
                ["name"] = "UserId",
                ["text_size"] = 15,
                ["value"] = p17.user_id,
                ["transparency"] = v_u_5.watermark.transparency
            },
            {
                ["name"] = "Date",
                ["text_size"] = 15,
                ["value"] = p17.date,
                ["transparency"] = v_u_5.watermark.transparency
            },
            {
                ["name"] = "DoNotLeak",
                ["text_size"] = 15,
                ["value"] = v_u_5.watermark.bottom_text,
                ["transparency"] = v_u_5.watermark.transparency
            }
        }
    end)
end
return v8