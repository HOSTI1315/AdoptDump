--// ReplicatedStorage.SharedModules.ContentPacks.Camping2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Muskrat",
    ["image"] = "rbxassetid://114034119324343",
    ["model"] = "Camping2025Muskrat",
    ["rarity"] = "uncommon",
    ["cost"] = 950,
    ["origin_entry"] = {
        ["origin"] = "Camping Shop Refresh",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Camping2025MuskratBeingHeldDouble",
        ["eating"] = "Camping2025MuskratEat",
        ["hold"] = "Camping2025MuskratBeingHeldSingle",
        ["idle"] = "Camping2025MuskratIdle",
        ["running"] = "Camping2025MuskratRun",
        ["sit"] = "Camping2025MuskratSit",
        ["sleep"] = "Camping2025MuskratSleep"
    },
    ["tricks"] = {
        { "Sit", "Camping2025MuskratSit" },
        { "Joyful", "Camping2025MuskratJoyful" },
        { "Beg", "Camping2025MuskratBeg" },
        { "Jump", "Camping2025MuskratJump" },
        { "Trick 1", "Camping2025MuskratTrick1" },
        { "Trick 2", "Camping2025MuskratTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar_Geo"] = Color3.fromRGB(218, 134, 122),
        ["LeftFoot_Geo"] = Color3.fromRGB(218, 134, 122),
        ["RightEar_Geo"] = Color3.fromRGB(218, 134, 122),
        ["RightFoot_Geo"] = Color3.fromRGB(218, 134, 122),
        ["Tail_Geo"] = Color3.fromRGB(218, 134, 122)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.camping_2025_muskrat = v3
local v4 = {
    ["name"] = "Papa Moose",
    ["image"] = "rbxassetid://92775688228060",
    ["model"] = "Camping2025PapaMoose",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Camping Shop Refresh",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Camping2025PapaMooseBeingHeldDouble",
        ["eating"] = "Camping2025PapaMooseEat",
        ["hold"] = "Camping2025PapaMooseBeingHeldSingle",
        ["idle"] = "Camping2025PapaMooseIdle",
        ["running"] = "Camping2025PapaMooseRun",
        ["sit"] = "Camping2025PapaMooseSit",
        ["sleep"] = "Camping2025PapaMooseSleep"
    },
    ["tricks"] = {
        { "Sit", "Camping2025PapaMooseSit" },
        { "Joyful", "Camping2025PapaMooseJoyful" },
        { "Beg", "Camping2025PapaMooseBeg" },
        { "Jump", "Camping2025PapaMooseJump" },
        { "Trick 1", "Camping2025PapaMooseTrick1" },
        { "Trick 2", "Camping2025PapaMooseTrick2" }
    },
    ["neon_parts"] = {
        ["Head3_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Head4_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Torso2_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Tail_Geo"] = Color3.fromRGB(184, 129, 107)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.camping_2025_papa_moose = v4
local v5 = {
    ["name"] = "Momma Moose",
    ["image"] = "rbxassetid://111661922676557",
    ["model"] = "Camping2025MamaMoose",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Camping Shop Refresh",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Camping2025MamaMooseBeingHeldDouble",
        ["eating"] = "Camping2025MamaMooseEat",
        ["hold"] = "Camping2025MamaMooseBeingHeldSingle",
        ["idle"] = "Camping2025MamaMooseIdle",
        ["running"] = "Camping2025MamaMooseRun",
        ["sit"] = "Camping2025MamaMooseSit",
        ["sleep"] = "Camping2025MamaMooseSleep"
    },
    ["tricks"] = {
        { "Sit", "Camping2025MamaMooseSit" },
        { "Joyful", "Camping2025MamaMooseJoyful" },
        { "Beg", "Camping2025MamaMooseBeg" },
        { "Jump", "Camping2025MamaMooseJump" },
        { "Trick 1", "Camping2025MamaMooseTrick1" },
        { "Trick 2", "Camping2025MamaMooseTrick2" }
    },
    ["neon_parts"] = {
        ["Head3_Geo"] = Color3.fromRGB(184, 129, 107),
        ["LeftEar2_Geo"] = Color3.fromRGB(184, 129, 107),
        ["RightEar2_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Torso2_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Torso3_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Tail_Geo"] = Color3.fromRGB(184, 129, 107)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.camping_2025_mama_moose = v5
local v6 = {
    ["name"] = "Moose Calf",
    ["image"] = "rbxassetid://102300026415493",
    ["model"] = "Camping2025MooseCalf",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Camping Shop Refresh",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Camping2025MooseCalfBeingHeldDouble",
        ["eating"] = "Camping2025MooseCalfEat",
        ["hold"] = "Camping2025MooseCalfBeingHeldSingle",
        ["idle"] = "Camping2025MooseCalfIdle",
        ["running"] = "Camping2025MooseCalfRun",
        ["sit"] = "Camping2025MooseCalfSit",
        ["sleep"] = "Camping2025MooseCalfSleep"
    },
    ["tricks"] = {
        { "Sit", "Camping2025MooseCalfSit" },
        { "Joyful", "Camping2025MooseCalfJoyful" },
        { "Beg", "Camping2025MooseCalfBeg" },
        { "Jump", "Camping2025MooseCalfJump" },
        { "Trick 1", "Camping2025MooseCalfTrick1" },
        { "Trick 2", "Camping2025MooseCalfTrick2" }
    },
    ["neon_parts"] = {
        ["Head3_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Head4_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Torso2_Geo"] = Color3.fromRGB(184, 129, 107),
        ["Tail_Geo"] = Color3.fromRGB(184, 129, 107)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.camping_2025_moose_calf = v6
return v1(v2)