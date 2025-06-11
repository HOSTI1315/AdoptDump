--// ReplicatedStorage.SharedModules.ContentPacks.Easter2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Carrot Friend Plushie",
    ["image"] = "rbxassetid://9290810408",
    ["rarity"] = "common",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Easter2022CarrotFriendPlushie",
    ["tool"] = "GenericTool"
}
v2.easter_2022_carrot_friend_plushie = v3
local v4 = {
    ["name"] = "Carrot Pogo Stick",
    ["image"] = "rbxassetid://9296569046",
    ["rarity"] = "rare",
    ["cost"] = 1850,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "Easter2022CarrotPogoStick",
    ["tool"] = "PogoTool"
}
v2.easter_2022_carrot_pogo_stick = v4
local v5 = {
    ["name"] = "Spring Bunny Leash",
    ["image"] = "rbxassetid://9358907116",
    ["rarity"] = "uncommon",
    ["cost"] = 900,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["leash_style"] = "UnicornLeash",
    ["model_handle"] = "Easter2022SpringBunnyLeash",
    ["tool"] = "PetLeash"
}
v2.easter_2022_spring_bunny_leash = v5
return v1(v2)