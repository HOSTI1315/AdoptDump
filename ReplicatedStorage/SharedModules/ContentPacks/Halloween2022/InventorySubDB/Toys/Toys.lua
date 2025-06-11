--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Bat Wing Balloon",
    ["image"] = "rbxassetid://10920164099",
    ["rarity"] = "uncommon",
    ["cost"] = 2000,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Halloween2022BatWingsBalloon",
    ["tool"] = "BalloonTool"
}
v2.halloween_2022_bat_wings_balloon = v3
local v4 = {
    ["name"] = "Potion Bottle Balloon",
    ["image"] = "rbxassetid://10920164255",
    ["rarity"] = "common",
    ["cost"] = 1250,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Halloween2022PotionBottleBalloon",
    ["tool"] = "BalloonTool"
}
v2.halloween_2022_potion_bottle_balloon = v4
local v5 = {
    ["name"] = "Pumpkin Basket Plushie",
    ["image"] = "rbxassetid://10920164327",
    ["rarity"] = "uncommon",
    ["cost"] = 3000,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Halloween2022PumpkinBasketPlushie",
    ["tool"] = "GenericTool"
}
v2.halloween_2022_pumpkin_basket_plushie = v5
local v6 = {
    ["name"] = "Skull Propeller",
    ["image"] = "rbxassetid://10920164381",
    ["rarity"] = "rare",
    ["cost"] = 5000,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Halloween2022SkullPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.halloween_2022_skull_propeller = v6
local v7 = {
    ["name"] = "Spider Web Flying Disc",
    ["image"] = "rbxassetid://10920164476",
    ["rarity"] = "common",
    ["cost"] = 700,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Halloween2022SpiderWebFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.halloween_2022_spider_web_disc = v7
local v8 = {
    ["name"] = "Vampire Teeth Grappling Hook",
    ["image"] = "rbxassetid://10920169735",
    ["rarity"] = "legendary",
    ["cost"] = 12000,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Halloween2022VampireGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.halloween_2022_vampire_grappling_hook = v8
local v9 = {
    ["name"] = "Zombie Finger Rattle",
    ["image"] = "rbxassetid://10920169766",
    ["rarity"] = "common",
    ["cost"] = 500,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Halloween2022ZombieFingerRattle",
    ["tool"] = "GenericTool"
}
v2.halloween_2022_zombie_finger_rattle = v9
return v1(v2)