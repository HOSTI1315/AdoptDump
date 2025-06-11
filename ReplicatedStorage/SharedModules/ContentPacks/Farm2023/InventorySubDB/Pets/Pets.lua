--// ReplicatedStorage.SharedModules.ContentPacks.Farm2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Alpaca",
    ["image"] = "rbxassetid://14398823196",
    ["model"] = "Farm2023Alpaca",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Farm",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Farm2023AlpacaBeingHeldDouble",
        ["eating"] = "Farm2023AlpacaEat",
        ["flying"] = "Farm2023AlpacaRun",
        ["hold"] = "Farm2023AlpacaBeingHeldSingle",
        ["idle"] = "Farm2023AlpacaIdle",
        ["running"] = "Farm2023AlpacaRun",
        ["sit"] = "Farm2023AlpacaSit",
        ["sleep"] = "Farm2023AlpacaSleep"
    },
    ["tricks"] = {
        { "Sit", "Farm2023AlpacaSit" },
        { "Joyful", "Farm2023AlpacaJoyful" },
        { "Beg", "Farm2023AlpacaBeg" },
        { "Jump", "Farm2023AlpacaJump" },
        { "Trick 1", "Farm2023AlpacaTrick1" },
        { "Trick 2", "Farm2023AlpacaTrick2" }
    },
    ["neon_parts"] = {
        ["ChestFluff"] = Color3.fromRGB(186, 91, 28),
        ["Head"] = Color3.fromRGB(186, 91, 28),
        ["Head3"] = Color3.fromRGB(186, 91, 28),
        ["Head4"] = Color3.fromRGB(186, 91, 28),
        ["LeftEar"] = Color3.fromRGB(186, 91, 28),
        ["RightEar"] = Color3.fromRGB(186, 91, 28),
        ["Tail"] = Color3.fromRGB(186, 91, 28),
        ["Torso3"] = Color3.fromRGB(186, 91, 28),
        ["Torso4"] = Color3.fromRGB(186, 91, 28)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.farm_2023_alpaca = v3
local v4 = {
    ["name"] = "Canadian Goose",
    ["image"] = "rbxassetid://14639006189",
    ["model"] = "Farm2023CanadaGoose",
    ["rarity"] = "uncommon",
    ["cost"] = 600,
    ["origin_entry"] = {
        ["origin"] = "Farm",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Farm2023CanadaGooseBeingHeldDouble",
        ["eating"] = "Farm2023CanadaGooseEat",
        ["flying"] = "Farm2023CanadaGooseFly",
        ["hold"] = "Farm2023CanadaGooseBeingHeldSingle",
        ["idle"] = "Farm2023CanadaGooseIdle",
        ["running"] = "Farm2023CanadaGooseRun",
        ["sit"] = "Farm2023CanadaGooseSit",
        ["sleep"] = "Farm2023CanadaGooseSleep"
    },
    ["tricks"] = {
        { "Sit", "Farm2023CanadaGooseSit" },
        { "Joyful", "Farm2023CanadaGooseJoyful" },
        { "Beg", "Farm2023CanadaGooseBeg" },
        { "Jump", "Farm2023CanadaGooseJump" },
        { "Trick 1", "Farm2023CanadaGooseTrick1" },
        { "Trick 2", "Farm2023CanadaGooseTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(188, 71, 35),
        ["Head"] = Color3.fromRGB(188, 71, 35),
        ["LeftFoot"] = Color3.fromRGB(188, 71, 35),
        ["LeftWing"] = Color3.fromRGB(188, 71, 35),
        ["LeftWing2"] = Color3.fromRGB(188, 71, 35),
        ["LeftWing3"] = Color3.fromRGB(188, 71, 35),
        ["LeftWing4"] = Color3.fromRGB(188, 71, 35),
        ["RightFoot"] = Color3.fromRGB(188, 71, 35),
        ["RightWing"] = Color3.fromRGB(188, 71, 35),
        ["RightWing2"] = Color3.fromRGB(188, 71, 35),
        ["RightWing3"] = Color3.fromRGB(188, 71, 35),
        ["RightWing4"] = Color3.fromRGB(188, 71, 35),
        ["Tail"] = Color3.fromRGB(188, 71, 35),
        ["Tail2"] = Color3.fromRGB(188, 71, 35),
        ["Torso5"] = Color3.fromRGB(188, 71, 35)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.farm_2023_canada_goose = v4
local v5 = {
    ["name"] = "Caterpillar",
    ["image"] = "rbxassetid://14639007389",
    ["model"] = "Farm2023Caterpillar",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Farm",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Farm2023CaterpillarBeingHeldDouble",
        ["eating"] = "Farm2023CaterpillarEat",
        ["hold"] = "Farm2023CaterpillarBeingHeldSingle",
        ["idle"] = "Farm2023CaterpillarIdle",
        ["running"] = "Farm2023CaterpillarRun",
        ["sit"] = "Farm2023CaterpillarSit",
        ["sleep"] = "Farm2023CaterpillarSleep"
    },
    ["tricks"] = {
        { "Sit", "Farm2023CaterpillarSit" },
        { "Joyful", "Farm2023CaterpillarJoyful" },
        { "Beg", "Farm2023CaterpillarBeg" },
        { "Jump", "Farm2023CaterpillarJump" },
        { "Trick 1", "Farm2023CaterpillarTrick1" },
        { "Trick 2", "Farm2023CaterpillarTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(13, 117, 191),
        ["LeftAntenna2"] = Color3.fromRGB(13, 117, 191),
        ["RightAntenna"] = Color3.fromRGB(13, 117, 191),
        ["RightAntenna2"] = Color3.fromRGB(13, 117, 191),
        ["Torso2"] = Color3.fromRGB(13, 117, 191),
        ["Torso3"] = Color3.fromRGB(13, 117, 191),
        ["Torso5"] = Color3.fromRGB(13, 117, 191),
        ["Torso6"] = Color3.fromRGB(13, 117, 191)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.farm_2023_caterpillar = v5
local v6 = {
    ["name"] = "Longhorn Cow",
    ["image"] = "rbxassetid://14398819258",
    ["model"] = "Farm2023LonghornCow",
    ["rarity"] = "rare",
    ["cost"] = 1200,
    ["origin_entry"] = {
        ["origin"] = "Farm",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Farm2023LonghornCowBeingHeldDouble",
        ["eating"] = "Farm2023LonghornCowEat",
        ["flying"] = "Farm2023LonghornCowRun",
        ["hold"] = "Farm2023LonghornCowBeingHeldSingle",
        ["idle"] = "Farm2023LonghornCowIdle",
        ["running"] = "Farm2023LonghornCowRun",
        ["sit"] = "Farm2023LonghornCowSit",
        ["sleep"] = "Farm2023LonghornCowSleep"
    },
    ["tricks"] = {
        { "Sit", "Farm2023LonghornCowSit" },
        { "Joyful", "Farm2023LonghornCowJoyful" },
        { "Beg", "Farm2023LonghornCowBeg" },
        { "Jump", "Farm2023LonghornCowJump" },
        { "Trick 1", "Farm2023LonghornCowTrick1" },
        { "Trick 2", "Farm2023LonghornCowTrick2" }
    },
    ["neon_parts"] = {
        ["Horns"] = Color3.fromRGB(105, 131, 186),
        ["Nose"] = Color3.fromRGB(105, 131, 186),
        ["Tail"] = Color3.fromRGB(105, 131, 186),
        ["Tail2"] = Color3.fromRGB(105, 131, 186),
        ["Torso"] = Color3.fromRGB(105, 131, 186)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.farm_2023_longhorn_cow = v6
local v7 = {
    ["name"] = "Rooster",
    ["image"] = "rbxassetid://14398816006",
    ["model"] = "Farm2023Rooster",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1750,
    ["origin_entry"] = {
        ["origin"] = "Farm",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Farm2023RoosterBeingHeldDouble",
        ["eating"] = "Farm2023RoosterEat",
        ["flying"] = "Farm2023RoosterRun",
        ["hold"] = "Farm2023RoosterBeingHeldSingle",
        ["idle"] = "Farm2023RoosterIdle",
        ["running"] = "Farm2023RoosterRun",
        ["sit"] = "Farm2023RoosterSit",
        ["sleep"] = "Farm2023RoosterSleep"
    },
    ["tricks"] = {
        { "Sit", "Farm2023RoosterSit" },
        { "Joyful", "Farm2023RoosterJoyful" },
        { "Beg", "Farm2023RoosterBeg" },
        { "Jump", "Farm2023RoosterJump" },
        { "Trick 1", "Farm2023RoosterTrick1" },
        { "Trick 2", "Farm2023RoosterTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(188, 150, 85),
        ["Beak2"] = Color3.fromRGB(188, 150, 85),
        ["Beak3"] = Color3.fromRGB(188, 150, 85),
        ["Beak4"] = Color3.fromRGB(188, 150, 85),
        ["Head2"] = Color3.fromRGB(188, 150, 85),
        ["Head3"] = Color3.fromRGB(188, 150, 85),
        ["Head4"] = Color3.fromRGB(188, 150, 85),
        ["Head5"] = Color3.fromRGB(188, 150, 85),
        ["LeftFoot"] = Color3.fromRGB(188, 150, 85),
        ["LeftWing"] = Color3.fromRGB(188, 150, 85),
        ["LeftWing2"] = Color3.fromRGB(188, 150, 85),
        ["LeftWing3"] = Color3.fromRGB(188, 150, 85),
        ["RightFoot"] = Color3.fromRGB(188, 150, 85),
        ["RightWing"] = Color3.fromRGB(188, 150, 85),
        ["RightWing2"] = Color3.fromRGB(188, 150, 85),
        ["RightWing3"] = Color3.fromRGB(188, 150, 85),
        ["Tail2"] = Color3.fromRGB(188, 150, 85),
        ["Tail2a"] = Color3.fromRGB(188, 150, 85),
        ["Tail2b"] = Color3.fromRGB(188, 150, 85),
        ["Tail3"] = Color3.fromRGB(188, 150, 85),
        ["Tail3a"] = Color3.fromRGB(188, 150, 85),
        ["Tail3b"] = Color3.fromRGB(188, 150, 85),
        ["Tail4"] = Color3.fromRGB(188, 150, 85),
        ["Tail4a"] = Color3.fromRGB(188, 150, 85),
        ["Tail4b"] = Color3.fromRGB(188, 150, 85),
        ["Tail5"] = Color3.fromRGB(188, 150, 85),
        ["Tail5a"] = Color3.fromRGB(188, 150, 85),
        ["Tail5b"] = Color3.fromRGB(188, 150, 85)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.farm_2023_rooster = v7
local v8 = {
    ["name"] = "English Sheepdog",
    ["image"] = "rbxassetid://14639008203",
    ["model"] = "Farm2023Sheepdog",
    ["rarity"] = "rare",
    ["cost"] = 1300,
    ["origin_entry"] = {
        ["origin"] = "Farm",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Farm2023SheepdogBeingHeldDouble",
        ["eating"] = "Farm2023SheepdogEat",
        ["hold"] = "Farm2023SheepdogBeingHeldSingle",
        ["idle"] = "Farm2023SheepdogIdle",
        ["running"] = "Farm2023SheepdogRun",
        ["sit"] = "Farm2023SheepdogSit",
        ["sleep"] = "Farm2023SheepdogSleep"
    },
    ["tricks"] = {
        { "Sit", "Farm2023SheepdogSit" },
        { "Joyful", "Farm2023SheepdogJoyful" },
        { "Beg", "Farm2023SheepdogBeg" },
        { "Jump", "Farm2023SheepdogJump" },
        { "Trick 1", "Farm2023SheepdogTrick1" },
        { "Trick 2", "Farm2023SheepdogTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(87, 184, 45),
        ["Hair_b"] = Color3.fromRGB(87, 184, 45),
        ["Hair_c"] = Color3.fromRGB(87, 184, 45),
        ["Hair_d"] = Color3.fromRGB(87, 184, 45),
        ["Hair_e"] = Color3.fromRGB(87, 184, 45),
        ["Hair_f"] = Color3.fromRGB(87, 184, 45),
        ["Hair_g"] = Color3.fromRGB(87, 184, 45),
        ["Hair_i"] = Color3.fromRGB(87, 184, 45),
        ["Hair_j"] = Color3.fromRGB(87, 184, 45),
        ["Hair_k"] = Color3.fromRGB(87, 184, 45),
        ["Hair_l"] = Color3.fromRGB(87, 184, 45),
        ["Hair_m"] = Color3.fromRGB(87, 184, 45),
        ["Hair_n"] = Color3.fromRGB(87, 184, 45),
        ["Hair_o"] = Color3.fromRGB(87, 184, 45),
        ["Hair_p"] = Color3.fromRGB(87, 184, 45),
        ["Hair_q"] = Color3.fromRGB(87, 184, 45),
        ["LeftBackFoot"] = Color3.fromRGB(87, 184, 45),
        ["LeftFrontFoot"] = Color3.fromRGB(87, 184, 45),
        ["Nose"] = Color3.fromRGB(87, 184, 45),
        ["RightBackFoot"] = Color3.fromRGB(87, 184, 45),
        ["RightFrontFoot"] = Color3.fromRGB(87, 184, 45),
        ["Tail2"] = Color3.fromRGB(87, 184, 45),
        ["Tail3"] = Color3.fromRGB(87, 184, 45),
        ["Tail4"] = Color3.fromRGB(87, 184, 45),
        ["TorsoHair"] = Color3.fromRGB(87, 184, 45),
        ["TorsoHair2"] = Color3.fromRGB(87, 184, 45)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.farm_2023_sheepdog = v8
return v1(v2)