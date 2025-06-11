--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatMay2024.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["gifthat_may_2024_toilet_stroller"] = {
        ["name"] = "Toilet Stroller",
        ["image"] = "rbxassetid://17356033804",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "GiftHat2024ToiletStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)