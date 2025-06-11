--// ReplicatedStorage.SharedModules.ContentPacks.StarRewards2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Big Log Throw Toy",
    ["image"] = "rbxassetid://10203332419",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "StarRewards2022LogThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.star_rewards_2022_log_throw_toy = v3
local v4 = {
    ["name"] = "Magician\'s Wand Grappling Hook",
    ["image"] = "rbxassetid://10393625885",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "StarRewards2022MagicianWandGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.star_rewards_2022_magicicians_wand_grappling_hook = v4
local v5 = {
    ["name"] = "Mermaid Propeller",
    ["image"] = "rbxassetid://10202932352",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "StarRewards2022MermaidPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.star_rewards_2022_mermaid_propeller = v5
local v6 = {
    ["name"] = "Red Panda Cupcake Chew Toy",
    ["image"] = "rbxassetid://10202932595",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "StarRewards2022RedPandaCupcake",
    ["tool"] = "ChewToyTool"
}
v2.star_rewards_2022_red_panda_cupcake = v6
return v1(v2)