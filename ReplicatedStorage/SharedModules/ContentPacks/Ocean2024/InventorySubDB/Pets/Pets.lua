--// ReplicatedStorage.SharedModules.ContentPacks.Ocean2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Lionfish",
    ["model"] = "Ocean2024Lionfish",
    ["image"] = "rbxassetid://94550121082603",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Ocean",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Ocean2024LionfishSleep",
        ["running"] = "Ocean2024LionfishRun",
        ["idle"] = "Ocean2024LionfishIdle",
        ["eating"] = "Ocean2024LionfishEat",
        ["sit"] = "Ocean2024LionfishSit",
        ["flying"] = "Ocean2024LionfishRun",
        ["hold"] = "Ocean2024LionfishBeingHeldSingle",
        ["double_hold"] = "Ocean2024LionfishBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Ocean2024LionfishSit" },
        { "Joyful", "Ocean2024LionfishJoyful" },
        { "Beg", "Ocean2024LionfishBeg" },
        { "Jump", "Ocean2024LionfishJump" },
        { "Trick 1", "Ocean2024LionfishTrick1" },
        { "Trick 2", "Ocean2024LionfishTrick2" }
    },
    ["neon_parts"] = {
        ["Tail2"] = Color3.fromRGB(186, 173, 139),
        ["RightFrills2"] = Color3.fromRGB(186, 173, 139),
        ["RightFin2"] = Color3.fromRGB(186, 173, 139),
        ["LowerFin2"] = Color3.fromRGB(186, 173, 139),
        ["RightFin3"] = Color3.fromRGB(255, 236, 128),
        ["LeftFrills2"] = Color3.fromRGB(186, 173, 139),
        ["LeftFin2"] = Color3.fromRGB(186, 173, 139),
        ["TopFin2"] = Color3.fromRGB(186, 173, 139),
        ["LeftFin3"] = Color3.fromRGB(255, 236, 128),
        ["Head"] = Color3.fromRGB(186, 173, 139)
    },
    ["already_has_flying_wings"] = true
}
v2.ocean_2024_lionfish = v3
local v4 = {
    ["name"] = "Kraken",
    ["model"] = "Ocean2024Kraken",
    ["image"] = "rbxassetid://88817325500927",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Ocean",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Ocean2024KrakenSleep",
        ["running"] = "Ocean2024KrakenRun",
        ["idle"] = "Ocean2024KrakenIdle",
        ["eating"] = "Ocean2024KrakenEat",
        ["sit"] = "Ocean2024KrakenSit",
        ["flying"] = "Ocean2024KrakenRun",
        ["hold"] = "Ocean2024KrakenBeingHeldSingle",
        ["double_hold"] = "Ocean2024KrakenBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Ocean2024KrakenSit" },
        { "Joyful", "Ocean2024KrakenJoyful" },
        { "Beg", "Ocean2024KrakenBeg" },
        { "Jump", "Ocean2024KrakenJump" },
        { "Trick 1", "Ocean2024KrakenTrick1" },
        { "Trick 2", "Ocean2024KrakenTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["BackLeftTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["BackRightTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["BackRightTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["BackTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["BackTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["FrontLeftTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["FrontLeftTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["FrontRightTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["FrontRightTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["FrontTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["FrontTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["Head2"] = Color3.fromRGB(189, 160, 85),
        ["LeftMidTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["LeftMidTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["RightMidTentacle2"] = Color3.fromRGB(184, 114, 44),
        ["RightMidTentacle3"] = Color3.fromRGB(189, 160, 85),
        ["Head"] = Color3.fromRGB(189, 160, 85),
        ["BackTentacle4"] = Color3.fromRGB(189, 160, 85),
        ["HeadTop"] = Color3.fromRGB(189, 160, 85),
        ["LeftMidTentacle4"] = Color3.fromRGB(189, 160, 85),
        ["RightMidTentacle4"] = Color3.fromRGB(189, 160, 85),
        ["BackLeftTentacle4"] = Color3.fromRGB(189, 160, 85),
        ["BackRightTentacle4"] = Color3.fromRGB(189, 160, 85)
    },
    ["already_has_flying_wings"] = true
}
v2.ocean_2024_kraken = v4
local v5 = {
    ["name"] = "Urchin",
    ["model"] = "Ocean2024Urchin",
    ["image"] = "rbxassetid://99694153348188",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Ocean",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Ocean2024UrchinSleep",
        ["running"] = "Ocean2024UrchinRun",
        ["idle"] = "Ocean2024UrchinIdle",
        ["eating"] = "Ocean2024UrchinEat",
        ["sit"] = "Ocean2024UrchinSit",
        ["flying"] = "Ocean2024UrchinRun",
        ["hold"] = "Ocean2024UrchinBeingHeldSingle",
        ["double_hold"] = "Ocean2024UrchinBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Ocean2024UrchinSit" },
        { "Joyful", "Ocean2024UrchinJoyful" },
        { "Beg", "Ocean2024UrchinBeg" },
        { "Jump", "Ocean2024UrchinJump" },
        { "Trick 1", "Ocean2024UrchinTrick1" },
        { "Trick 2", "Ocean2024UrchinTrick2" }
    },
    ["neon_parts"] = {
        ["Spikes"] = Color3.fromRGB(212, 212, 212)
    },
    ["head_rotator_disabled"] = true
}
v2.ocean_2024_urchin = v5
local v6 = {
    ["name"] = "Dracula Fish",
    ["model"] = "Ocean2024DraculaFish",
    ["image"] = "rbxassetid://82170828935980",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Ocean",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Ocean2024DraculaFishSleep",
        ["running"] = "Ocean2024DraculaFishRun",
        ["idle"] = "Ocean2024DraculaFishIdle",
        ["eating"] = "Ocean2024DraculaFishEat",
        ["sit"] = "Ocean2024DraculaFishSit",
        ["flying"] = "Ocean2024DraculaFishRun",
        ["hold"] = "Ocean2024DraculaFishBeingHeldSingle",
        ["double_hold"] = "Ocean2024DraculaFishBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Ocean2024DraculaFishSit" },
        { "Joyful", "Ocean2024DraculaFishJoyful" },
        { "Beg", "Ocean2024DraculaFishBeg" },
        { "Jump", "Ocean2024DraculaFishJump" },
        { "Trick 1", "Ocean2024DraculaFishTrick1" },
        { "Trick 2", "Ocean2024DraculaFishTrick2" }
    },
    ["neon_parts"] = {
        ["Tail2"] = Color3.fromRGB(48, 94, 205),
        ["DorsalFin2"] = Color3.fromRGB(48, 94, 205),
        ["Torso3"] = Color3.fromRGB(48, 94, 205),
        ["Torso2"] = Color3.fromRGB(48, 94, 205),
        ["LeftFin"] = Color3.fromRGB(48, 94, 205),
        ["RightFin"] = Color3.fromRGB(48, 94, 205),
        ["Eyes"] = Color3.fromRGB(48, 94, 205),
        ["Teeth"] = Color3.fromRGB(48, 94, 205),
        ["Mouth"] = Color3.fromRGB(48, 94, 205),
        ["TopFin4"] = Color3.fromRGB(48, 94, 205)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_disabled"] = true
}
v2.ocean_2024_dracula_fish = v6
local v7 = {
    ["name"] = "Sea Angel",
    ["model"] = "Ocean2024SeaAngel",
    ["image"] = "rbxassetid://92626539723202",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Ocean",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Ocean2024SeaAngelSleep",
        ["running"] = "Ocean2024SeaAngelRun",
        ["idle"] = "Ocean2024SeaAngelIdle",
        ["eating"] = "Ocean2024SeaAngelEat",
        ["sit"] = "Ocean2024SeaAngelSit",
        ["flying"] = "Ocean2024SeaAngelRun",
        ["hold"] = "Ocean2024SeaAngelBeingHeldSingle",
        ["double_hold"] = "Ocean2024SeaAngelBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Ocean2024SeaAngelSit" },
        { "Joyful", "Ocean2024SeaAngelJoyful" },
        { "Beg", "Ocean2024SeaAngelBeg" },
        { "Jump", "Ocean2024SeaAngelJump" },
        { "Trick 1", "Ocean2024SeaAngelTrick1" },
        { "Trick 2", "Ocean2024SeaAngelTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(189, 189, 189),
        ["Torso"] = Color3.fromRGB(66, 178, 190)
    },
    ["already_has_flying_wings"] = true
}
v2.ocean_2024_sea_angel = v7
return v1(v2)