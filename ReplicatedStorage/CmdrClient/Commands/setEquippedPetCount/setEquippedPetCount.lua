--// ReplicatedStorage.CmdrClient.Commands.setEquippedPetCount (ModuleScript)

local v1 = {
    ["Name"] = "setEquippedPetCount",
    ["Aliases"] = {},
    ["Description"] = "Sets a player\'s equipped pet count to a specific value.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player to set."
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Equip Count",
            ["Description"] = "Amount of pets a player can."
        }
    }
}
return v1