--// ReplicatedStorage.SharedModules.ContentPacks.Easter2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Candyfloss Chick",
    ["image"] = "rbxassetid://16659215347",
    ["model"] = "Easter2024CandyflossChick",
    ["rarity"] = "legendary",
    ["generate_npc_furniture_on_runtime"] = true,
    ["already_has_flying_wings"] = true,
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["year"] = 2024,
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Easter2024CandyflossChickSleep",
        ["running"] = "Easter2024CandyflossChickRun",
        ["idle"] = "Easter2024CandyflossChickIdle",
        ["eating"] = "Easter2024CandyflossChickEat",
        ["sit"] = "Easter2024CandyflossChickSit",
        ["flying"] = "Easter2024CandyflossChickRun",
        ["hold"] = "Easter2024CandyflossChickBeingHeldSingle",
        ["double_hold"] = "Easter2024CandyflossChickBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Easter2024CandyflossChickSit" },
        { "Joyful", "Easter2024CandyflossChickJoyful" },
        { "Beg", "Easter2024CandyflossChickBeg" },
        { "Jump", "Easter2024CandyflossChickJump" },
        { "Trick 1", "Easter2024CandyflossChickTrick1" },
        { "Trick 2", "Easter2024CandyflossChickTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(185, 44, 74),
        ["RightFoot"] = Color3.fromRGB(185, 44, 74),
        ["Beak"] = Color3.fromRGB(185, 44, 74),
        ["Head"] = Color3.fromRGB(185, 44, 74),
        ["Tail"] = Color3.fromRGB(185, 44, 74),
        ["RightWing2"] = Color3.fromRGB(185, 44, 74),
        ["LeftWing2"] = Color3.fromRGB(185, 44, 74),
        ["BeakLow"] = Color3.fromRGB(185, 44, 74),
        ["Poof"] = Color3.fromRGB(185, 44, 74),
        ["Poof2"] = Color3.fromRGB(185, 44, 74),
        ["Poof3"] = Color3.fromRGB(185, 44, 74),
        ["Swirl"] = Color3.fromRGB(185, 44, 74),
        ["Swirl2"] = Color3.fromRGB(185, 44, 74),
        ["Swirl3"] = Color3.fromRGB(185, 44, 74)
    },
    ["head_rotator_uses_torso_instead"] = true
}
v2.easter_2024_candyfloss_chick = v3
local v4 = {
    ["name"] = "Dotted Eggy",
    ["image"] = "rbxassetid://16722908853",
    ["model"] = "Easter2024DottedEggy",
    ["rarity"] = "rare",
    ["generate_npc_furniture_on_runtime"] = true,
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["year"] = 2024,
        ["origin_items"] = { "easter_2024_eggy_box" }
    },
    ["anims"] = {
        ["sleep"] = "Easter2024EggySleep",
        ["running"] = "Easter2024EggyRun",
        ["idle"] = "Easter2024EggyIdle",
        ["eating"] = "Easter2024EggyEat",
        ["sit"] = "Easter2024EggySit",
        ["flying"] = "Easter2024EggyRun",
        ["hold"] = "Easter2024EggyBeingHeldSingle",
        ["double_hold"] = "Easter2024EggyBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Easter2024EggySit" },
        { "Joyful", "Easter2024EggyJoyful" },
        { "Beg", "Easter2024EggyBeg" },
        { "Jump", "Easter2024EggyJump" },
        { "Trick 1", "Easter2024EggyTrick1" },
        { "Trick 2", "Easter2024EggyTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(92, 184, 101)
    },
    ["no_eyes"] = true
}
v2.easter_2024_dotted_eggy = v4
local v5 = {
    ["name"] = "Floral Eggy",
    ["image"] = "rbxassetid://16722909218",
    ["model"] = "Easter2024FloralEggy",
    ["rarity"] = "ultra_rare",
    ["generate_npc_furniture_on_runtime"] = true,
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["year"] = 2024,
        ["origin_items"] = { "easter_2024_eggy_box" }
    },
    ["anims"] = {
        ["sleep"] = "Easter2024EggySleep",
        ["running"] = "Easter2024EggyRun",
        ["idle"] = "Easter2024EggyIdle",
        ["eating"] = "Easter2024EggyEat",
        ["sit"] = "Easter2024EggySit",
        ["flying"] = "Easter2024EggyRun",
        ["hold"] = "Easter2024EggyBeingHeldSingle",
        ["double_hold"] = "Easter2024EggyBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Easter2024EggySit" },
        { "Joyful", "Easter2024EggyJoyful" },
        { "Beg", "Easter2024EggyBeg" },
        { "Jump", "Easter2024EggyJump" },
        { "Trick 1", "Easter2024EggyTrick1" },
        { "Trick 2", "Easter2024EggyTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(75, 153, 186)
    },
    ["no_eyes"] = true
}
v2.easter_2024_floral_eggy = v5
local v6 = {
    ["name"] = "Striped Eggy",
    ["image"] = "rbxassetid://16722909609",
    ["model"] = "Easter2024StripedEggy",
    ["rarity"] = "legendary",
    ["generate_npc_furniture_on_runtime"] = true,
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["year"] = 2024,
        ["origin_items"] = { "easter_2024_eggy_box" }
    },
    ["anims"] = {
        ["sleep"] = "Easter2024EggySleep",
        ["running"] = "Easter2024EggyRun",
        ["idle"] = "Easter2024EggyIdle",
        ["eating"] = "Easter2024EggyEat",
        ["sit"] = "Easter2024EggySit",
        ["flying"] = "Easter2024EggyRun",
        ["hold"] = "Easter2024EggyBeingHeldSingle",
        ["double_hold"] = "Easter2024EggyBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Easter2024EggySit" },
        { "Joyful", "Easter2024EggyJoyful" },
        { "Beg", "Easter2024EggyBeg" },
        { "Jump", "Easter2024EggyJump" },
        { "Trick 1", "Easter2024EggyTrick1" },
        { "Trick 2", "Easter2024EggyTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(200, 127, 0)
    },
    ["no_eyes"] = true
}
v2.easter_2024_striped_eggy = v6
local v7 = {
    ["name"] = "Candy Cane Snail",
    ["image"] = "rbxassetid://16736753854",
    ["model"] = "Easter2024CandyCaneSnail",
    ["rarity"] = "ultra_rare",
    ["cost"] = 50000,
    ["currency_id"] = "eggs_2024",
    ["generate_npc_furniture_on_runtime"] = true,
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Easter2024CandyCaneSnailSleep",
        ["running"] = "Easter2024CandyCaneSnailRun",
        ["idle"] = "Easter2024CandyCaneSnailIdle",
        ["eating"] = "Easter2024CandyCaneSnailEat",
        ["sit"] = "Easter2024CandyCaneSnailSit",
        ["flying"] = "Easter2024CandyCaneSnailRun",
        ["hold"] = "Easter2024CandyCaneSnailBeingHeldSingle",
        ["double_hold"] = "Easter2024CandyCaneSnailBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Easter2024CandyCaneSnailSit" },
        { "Joyful", "Easter2024CandyCaneSnailJoyful" },
        { "Beg", "Easter2024CandyCaneSnailBeg" },
        { "Jump", "Easter2024CandyCaneSnailJump" },
        { "Trick 1", "Easter2024CandyCaneSnailTrick1" },
        { "Trick 2", "Easter2024CandyCaneSnailTrick2" }
    },
    ["neon_parts"] = {
        ["Slime"] = Color3.fromRGB(144, 108, 199),
        ["Shell"] = Color3.fromRGB(144, 108, 199)
    }
}
v2.easter_2024_candy_cane_snail = v7
return v1(v2)