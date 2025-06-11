--// ReplicatedStorage.SharedModules.ContentPacks.GorillaFairground2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Gold Star",
    ["image"] = "rbxassetid://12556669536",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["model_handle"] = "GorillaFair2023IngredientAstronaut",
    ["tool"] = "ThrowToyTool"
}
v2.gorilla_fair_2023_astronaut_item = v3
local v4 = {
    ["name"] = "Banana Chew Toy",
    ["image"] = "rbxassetid://12519248571",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GorillaFair2023BananaChewToy",
    ["tool"] = "ChewToyTool"
}
v2.gorilla_fair_2023_banana_chew_toy = v4
local v5 = {
    ["name"] = "Banana Leaf Balloon",
    ["image"] = "rbxassetid://12519248741",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GorillaFair2023BananaLeafBalloon",
    ["tool"] = "BalloonTool"
}
v2.gorilla_fair_2023_banana_leaf_balloon = v5
local v6 = {
    ["name"] = "Banana Tree Pogo Stick",
    ["image"] = "rbxassetid://12519248945",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "GorillaFair2023BananaTreePogoStick",
    ["tool"] = "PogoTool"
}
v2.gorilla_fair_2023_banana_tree_pogo = v6
local v7 = {
    ["name"] = "Carousel Propeller",
    ["image"] = "rbxassetid://12519249290",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GorillaFair2023CarouselPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.gorilla_fair_2023_carousel_propeller = v7
local v8 = {
    ["name"] = "Rolling Pin",
    ["image"] = "rbxassetid://12556669308",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["model_handle"] = "GorillaFair2023IngredientChef",
    ["tool"] = "ThrowToyTool"
}
v2.gorilla_fair_2023_chef_item = v8
local v9 = {
    ["name"] = "Golden Goblet",
    ["image"] = "rbxassetid://12556669192",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["model_handle"] = "GorillaFair2023IngredientEmperor",
    ["tool"] = "ThrowToyTool"
}
v2.gorilla_fair_2023_emperor_item = v9
local v10 = {
    ["name"] = "Fairground Pogo",
    ["image"] = "rbxassetid://12725579494",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "GorillaFair2023FairgroundPogoStick",
    ["tool"] = "PogoTool"
}
v2.gorilla_fair_2023_fairground_pogo = v10
local v11 = {
    ["name"] = "Sai",
    ["image"] = "rbxassetid://12556669431",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["model_handle"] = "GorillaFair2023IngredientKarate",
    ["tool"] = "ThrowToyTool"
}
v2.gorilla_fair_2023_karate_item = v11
local v12 = {
    ["name"] = "Toy Drum Flying Disc",
    ["image"] = "rbxassetid://12519322764",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "GorillaFair2023TomTomDrumFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.gorilla_fair_2023_tom_tom_drum_flying_disc = v12
return v1(v2)