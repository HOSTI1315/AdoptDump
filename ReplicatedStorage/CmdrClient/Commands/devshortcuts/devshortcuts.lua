--// ReplicatedStorage.CmdrClient.Commands.devshortcuts (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v4 = {
    ["Name"] = "devshortcuts",
    ["Aliases"] = {},
    ["Description"] = "Toggle the development shortcuts app",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "Shown",
            ["Description"] = "Whether to show the app",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(_, p2)
        local v3 = v_u_1("UIManager")
        if p2 == nil then
            p2 = not v3.is_visible("DevelopmentShortcutsApp")
        end
        v3.set_app_visibility("DevelopmentShortcutsApp", p2)
        return "Development shortcuts made " .. (p2 and "visible" or "hidden")
    end
}
return v4