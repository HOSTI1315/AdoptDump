--// ReplicatedStorage.SharedModules.ContentPacks.StarRewards2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Orca",
    ["image"] = "rbxassetid://10393730410",
    ["model"] = "StarRewards2022Orca",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "OrcaBeingHeldDouble",
        ["eating"] = "OrcaEat",
        ["flying"] = "OrcaRun",
        ["hold"] = "OrcaBeingHeldSingle",
        ["idle"] = "OrcaIdle",
        ["running"] = "OrcaRun",
        ["sit"] = "OrcaSit",
        ["sleep"] = "OrcaSleep"
    },
    ["tricks"] = {
        { "Sit", "OrcaSit" },
        { "Joyful", "OrcaJoyful" },
        { "Beg", "OrcaBeg" },
        { "Jump", "OrcaJump" },
        { "Trick 1", "OrcaTrick1" },
        { "Trick 2", "OrcaTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(186, 159, 113),
        ["TorsoGrey"] = Color3.fromRGB(186, 159, 113)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.star_rewards_2022_orca = v3
local v4 = {
    ["name"] = "Pomeranian",
    ["image"] = "rbxassetid://10614198346",
    ["model"] = "StarRewards2022Pomeranian",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "PomeranianBeingHeldDouble",
        ["eating"] = "PomeranianEat",
        ["flying"] = "PomeranianRun",
        ["hold"] = "PomeranianBeingHeldSingle",
        ["idle"] = "PomeranianIdle",
        ["running"] = "PomeranianRun",
        ["sit"] = "PomeranianSit",
        ["sleep"] = "PomeranianSleep"
    },
    ["tricks"] = {
        { "Sit", "PomeranianSit" },
        { "Joyful", "PomeranianJoyful" },
        { "Beg", "PomeranianBeg" },
        { "Jump", "PomeranianJump" },
        { "Trick 1", "PomeranianTrick1" },
        { "Trick 2", "PomeranianTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(189, 150, 101),
        ["LeftEar2"] = Color3.fromRGB(189, 150, 101),
        ["RightEar"] = Color3.fromRGB(189, 150, 101),
        ["RightEar2"] = Color3.fromRGB(189, 150, 101),
        ["Tail"] = Color3.fromRGB(189, 150, 101),
        ["Tail2"] = Color3.fromRGB(189, 150, 101)
    },
    ["minimum_fly_anim_speed"] = 0.5,
    ["minimum_run_anim_speed"] = 2
}
v2.star_rewards_2022_pomeranian = v4
return v1(v2)