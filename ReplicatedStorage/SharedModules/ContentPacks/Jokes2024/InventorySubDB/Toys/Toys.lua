--// ReplicatedStorage.SharedModules.ContentPacks.Jokes2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Whoopee Cushion",
    ["image"] = "rbxassetid://18527638720",
    ["rarity"] = "legendary",
    ["model_handle"] = "Jokes2024WhoopeeCushion",
    ["placeable_type"] = "server_collidable",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["tool"] = "PlaceableTool"
}
v2.jokes_2024_whoopee_cushion = v3
v2.jokes_2024_homeing_rocket = {
    ["name"] = "Homeing Rocket",
    ["image"] = "rbxassetid://18527640766",
    ["rarity"] = "ultra_rare",
    ["model_handle"] = "Jokes2024HomeingRocket",
    ["placeable_type"] = "homeing_rocket",
    ["tool"] = "PlaceableTool"
}
local v4 = {
    ["name"] = "Chattering Teeth Toy",
    ["image"] = "rbxassetid://18527640612",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Jokes2024ChatteringTeeth",
    ["tool"] = "SimpleThrowToyTool",
    ["lifetime_after_use"] = 10
}
v2.jokes_2024_chattering_teeth = v4
local v5 = {
    ["name"] = "Firecrackers",
    ["image"] = "rbxassetid://18527640698",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Jokes2024Firecrackers",
    ["tool"] = "SimpleThrowToyTool",
    ["lifetime_after_use"] = 10
}
v2.jokes_2024_firecrackers = v5
local v6 = {
    ["name"] = "Squirty Flower",
    ["image"] = "rbxassetid://18527640828",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Jokes2024SquirtyFlower",
    ["tool"] = "ParticleEmitterTool"
}
v2.jokes_2024_squirty_flower = v6
return v1(v2)