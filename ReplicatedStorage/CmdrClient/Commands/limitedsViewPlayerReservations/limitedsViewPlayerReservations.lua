--// ReplicatedStorage.CmdrClient.Commands.limitedsViewPlayerReservations (ModuleScript)

local v1 = {
    ["Name"] = "limitedsViewPlayerReservations",
    ["Aliases"] = {},
    ["Description"] = "Views reservations held in a player\'s data",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to view reservations for.",
            ["Optional"] = true
        }
    }
}
return v1