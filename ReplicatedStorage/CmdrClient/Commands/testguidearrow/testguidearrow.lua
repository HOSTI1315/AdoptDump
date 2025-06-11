--// ReplicatedStorage.CmdrClient.Commands.testguidearrow (ModuleScript)

local v5 = {
    ["Name"] = "testguidearrow",
    ["Aliases"] = {},
    ["Description"] = "Starts a navigation to a location to test GuideArrowApp",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "location",
            ["Name"] = "Location",
            ["Description"] = "The location to navigate to."
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Non-overrideable",
            ["Description"] = "If true, this navigation cannot be overridden and must be completed.",
            ["Optional"] = true
        },
        {
            ["Type"] = "player",
            ["Name"] = "Player House",
            ["Description"] = "The owner of the destination house, if the destination is a house.",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(_, p1, p2, p3)
        local v4 = require(game.ReplicatedStorage.Fsys).load("UIManager")
        if p1.Name == "House" and p3 == nil then
            return "You must provide the owner of the House as the third argument."
        end
        v4.apps.GuideArrowApp:navigate({
            ["destination_id"] = p1.Area,
            ["destination_house_owner"] = p3
        }, p1.CFrame and p1.CFrame.Position or nil, nil, p2)
        return "Test navigation started"
    end
}
return v5