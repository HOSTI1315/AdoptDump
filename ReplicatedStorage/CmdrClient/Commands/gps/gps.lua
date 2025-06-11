--// ReplicatedStorage.CmdrClient.Commands.gps (ModuleScript)

local v2 = {
    ["Name"] = "gps",
    ["Aliases"] = {},
    ["Description"] = "Use the GPSHelper.cast_spell on an interior",
    ["Group"] = "DeveloperDebug",
    ["Args"] = {
        {
            ["Type"] = "interior",
            ["Name"] = "Interior",
            ["Description"] = "The interior to navigate to"
        }
    },
    ["ClientRun"] = function(_, p1)
        require(game.ReplicatedStorage.Fsys).load("UIManager").apps.GuideArrowApp:navigate(p1, nil, nil, false)
        return "Navigating!"
    end
}
return v2