--// ReplicatedStorage.CmdrClient.Commands.hidehotairballoontext (ModuleScript)

local v2 = {
    ["Name"] = "hidehotairballoontext",
    ["Aliases"] = {},
    ["Description"] = "Hide hot air balloon text for screenshots.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "State",
            ["Description"] = "Whether to hide text.",
            ["Optional"] = false
        }
    },
    ["ClientRun"] = function(_, p1)
        workspace.StaticMap.Balloon.HotAirBalloon.Lamp:FindFirstChild("BillboardGui", true).Enabled = not p1
        return "Set hidden to " .. tostring(p1) .. "."
    end
}
return v2