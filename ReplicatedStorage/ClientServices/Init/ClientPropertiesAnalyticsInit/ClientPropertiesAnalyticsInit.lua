--// ReplicatedStorage.ClientServices.Init.ClientPropertiesAnalyticsInit (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("TranslationHelper")
local v_u_5 = game:GetService("LocalizationService")
game:GetService("Players")
return {
    ["init"] = function()
        local v6 = v_u_5.RobloxLocaleId
        local v7 = v_u_3.get_platform()
        local v8 = v_u_4.format_by_key("ui.buy_label_item", {
            ["item"] = "test"
        }):find("ui.buy_label_item") ~= nil
        v_u_2.get("AnalyticsAPI/SetClientProperties"):FireServer({
            ["roblox_locale_id"] = v6,
            ["platform"] = v7,
            ["format_by_key_failed"] = v8
        })
    end
}