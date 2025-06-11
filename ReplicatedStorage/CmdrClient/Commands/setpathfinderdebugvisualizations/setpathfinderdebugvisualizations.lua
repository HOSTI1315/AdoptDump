--// ReplicatedStorage.CmdrClient.Commands.setpathfinderdebugvisualizations (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v3 = {
    ["Name"] = "setpathfinderdebugvisualizations",
    ["Aliases"] = {},
    ["Description"] = "Toggle pathfinder debug visualizations on/off",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "Enabled",
            ["Description"] = "Whether or not to show debug visualizations"
        }
    },
    ["ClientRun"] = function(_, p2)
        v_u_1("Pathfinder").set_debug_visualizations_enabled(p2)
        return "Debug visualizations " .. (p2 and "enabled" or "disabled")
    end
}
return v3