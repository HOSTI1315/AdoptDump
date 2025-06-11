--// ReplicatedStorage.SharedModules.ContentPacks.Celestial2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["celestial_2024_galactic_hoverboard"] = {
        ["name"] = "Galactic Hoverboard",
        ["image"] = "rbxassetid://136879670342885",
        ["rarity"] = "rare"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)