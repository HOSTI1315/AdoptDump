--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Brachiosaurus Fossil",
    ["image"] = "rbxassetid://16893714483",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Fossil2024BrachiosaurusFossil",
    ["tool"] = "GenericTool"
}
v2.fossil_2024_brachiosaurus_fossil = v3
local v4 = {
    ["name"] = "Velociraptor Fossil",
    ["image"] = "rbxassetid://16893714798",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["model_handle"] = "Fossil2024VelociraptorFossil",
    ["tool"] = "GenericTool"
}
v2.fossil_2024_velociraptor_fossil = v4
local v5 = {
    ["name"] = "Ankylosaurus Fossil",
    ["image"] = "rbxassetid://16893714379",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["model_handle"] = "Fossil2024AnkylosaurusFossil",
    ["tool"] = "GenericTool"
}
v2.fossil_2024_ankylosaurus_fossil = v5
local v6 = {
    ["name"] = "Elasmosaurus Fossil",
    ["image"] = "rbxassetid://16893714694",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Fossil2024ElasmosaurusFossil",
    ["tool"] = "GenericTool"
}
v2.fossil_2024_elasmosaurus_fossil = v6
local v7 = {
    ["name"] = "Dimorphodon Fossil",
    ["image"] = "rbxassetid://16893714563",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Fossil2024DimorphodonFossil",
    ["tool"] = "GenericTool"
}
v2.fossil_2024_dimorphodon_fossil = v7
return v1(v2)