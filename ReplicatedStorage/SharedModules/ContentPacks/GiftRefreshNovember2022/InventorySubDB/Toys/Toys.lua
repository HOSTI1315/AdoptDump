--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Anvil Balloon",
    ["image"] = "rbxassetid://10905686244",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2022AnvilBalloon",
    ["tool"] = "BalloonTool"
}
v2.gift_refresh_2022_anvil_balloon = v3
local v4 = {
    ["name"] = "Bouncy Ball Pogo",
    ["image"] = "rbxassetid://10905773039",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["model_handle"] = "GiftRefreshNovember2022BouncyBallPogo",
    ["tool"] = "PogoTool"
}
v2.gift_refresh_2022_bouncy_ball_pogo = v4
local v5 = {
    ["name"] = "CD Throwing Disc",
    ["image"] = "rbxassetid://10905757011",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftRefreshNovember2022CDThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.gift_refresh_2022_cd_throwing_disc = v5
local v6 = {
    ["name"] = "Chainsaw Rattle",
    ["image"] = "rbxassetid://10905699969",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "GiftRefreshNovember2022ChainsawRattle",
    ["tool"] = "GenericTool"
}
v2.gift_refresh_2022_chainsaw_rattle = v6
local v7 = {
    ["name"] = "Fishing Tackle Grappling Hook",
    ["image"] = "rbxassetid://10912981368",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2022FishingTackleGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.gift_refresh_2022_fishing_tackle_grappling_hook = v7
local v8 = {
    ["name"] = "Futuristic Turbine Propeller",
    ["image"] = "rbxassetid://10912970511",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2022FuturisticTurbinePropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.gift_refresh_2022_futuristic_turbine_propeller = v8
local v9 = {
    ["name"] = "Hang Glider Balloon",
    ["image"] = "rbxassetid://10919823379",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2022HangGliderBalloon",
    ["tool"] = "BalloonTool"
}
v2.gift_refresh_2022_hang_glider_balloon = v9
local v10 = {
    ["name"] = "Meaty Chew Toy",
    ["image"] = "rbxassetid://10905891437",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "GiftRefreshNovember2022MeatyChewToy",
    ["tool"] = "ChewToyTool"
}
v2.gift_refresh_2022_meaty_chew_toy = v10
local v11 = {
    ["name"] = "Paper Plane Launcher Grappling Hook",
    ["image"] = "rbxassetid://10912981562",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "GiftRefreshNovember2022PaperPlaneLauncherGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.gift_refresh_2022_paper_plane_launcher_grappling_hook = v11
local v12 = {
    ["name"] = "Robo Plush 3000",
    ["image"] = "rbxassetid://10905822390",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "GiftRefreshNovember2022RoboPlush3000",
    ["tool"] = "GenericTool"
}
v2.gift_refresh_2022_robo_plush_3000 = v12
return v1(v2)