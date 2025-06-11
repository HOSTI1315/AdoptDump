--// ReplicatedStorage.CmdrClient.Commands.equipexclusiveassets (ModuleScript)

local v1 = {
    ["Name"] = "equipexclusiveassets",
    ["Description"] = "Equip items from the Adopt Me catalog blacklist.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "exclusiveAssets",
            ["Name"] = "Exclusive Assets",
            ["Description"] = "The exclusive assets to equip."
        }
    }
}
return v1