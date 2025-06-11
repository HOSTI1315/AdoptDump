--// ReplicatedStorage.SharedModules.ContentPacks.BabyShopRefresh.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["hover_stroller"] = {
        ["name"] = "Hover Stroller",
        ["image"] = "rbxassetid://6967530077",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1150,
        ["model_handle"] = "HoverStroller",
        ["tool"] = "StrollerTool"
    },
    ["magic_carpet_stroller"] = {
        ["name"] = "Magic Carpet Stroller",
        ["image"] = "rbxassetid://6936630605",
        ["rarity"] = "uncommon",
        ["cost"] = 400,
        ["model_handle"] = "MagicCarpetStroller",
        ["tool"] = "StrollerTool"
    },
    ["magic_moon_stroller"] = {
        ["name"] = "Magic Moon Stroller",
        ["image"] = "rbxassetid://6936629525",
        ["rarity"] = "uncommon",
        ["cost"] = 550,
        ["model_handle"] = "MagicMoonStroller",
        ["tool"] = "StrollerTool"
    },
    ["pelican_stroller"] = {
        ["name"] = "Pelican Stroller",
        ["image"] = "rbxassetid://6936631399",
        ["rarity"] = "rare",
        ["cost"] = 800,
        ["model_handle"] = "PelicanStroller",
        ["tool"] = "StrollerTool"
    },
    ["princess_stroller"] = {
        ["name"] = "Princess Stroller",
        ["image"] = "rbxassetid://6936628317",
        ["rarity"] = "rare",
        ["cost"] = 650,
        ["model_handle"] = "PrincessStroller",
        ["tool"] = "StrollerTool"
    },
    ["teacup_stroller"] = {
        ["name"] = "Teacup Stroller",
        ["image"] = "rbxassetid://6936628967",
        ["rarity"] = "legendary",
        ["cost"] = 1450,
        ["model_handle"] = "TeacupStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)