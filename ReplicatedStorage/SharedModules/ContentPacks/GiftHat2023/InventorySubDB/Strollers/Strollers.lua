--// ReplicatedStorage.SharedModules.ContentPacks.GiftHat2023.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["gifthat_2023_coconut_stroller"] = {
        ["name"] = "Coconut Stroller",
        ["image"] = "rbxassetid://13078897326",
        ["rarity"] = "uncommon",
        ["model_handle"] = "GiftHat2023CoconutStroller",
        ["tool"] = "StrollerTool"
    },
    ["gifthat_2023_flip_phone_stroller"] = {
        ["name"] = "Flip Phone Stroller",
        ["image"] = "rbxassetid://13078896881",
        ["rarity"] = "rare",
        ["model_handle"] = "GiftHat2023FlipPhoneStroller",
        ["tool"] = "StrollerTool"
    },
    ["gifthat_2023_ufo_stroller"] = {
        ["name"] = "UFO Stroller",
        ["image"] = "rbxassetid://13078904606",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "GiftHat2023UFOStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)