--// ReplicatedStorage.SharedModules.ContentPacks.RandomPetsMay2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Eel",
    ["image"] = "rbxassetid://13077767764",
    ["model"] = "RandomPetsSept2023Eel",
    ["rarity"] = "uncommon",
    ["cost"] = 1000
}
local v4 = {
    ["origin"] = "Random Pets",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 7,
        ["offset"] = CFrame.identity
    },
    ["year"] = 2023
}
v3.origin_entry = v4
v3.anims = {
    ["double_hold"] = "RandomPetsSept2023EelBeingHeldDouble",
    ["eating"] = "RandomPetsSept2023EelEat",
    ["hold"] = "RandomPetsSept2023EelBeingHeldSingle",
    ["idle"] = "RandomPetsSept2023EelIdle",
    ["running"] = "RandomPetsSept2023EelRun",
    ["sit"] = "RandomPetsSept2023EelSit",
    ["sleep"] = "RandomPetsSept2023EelSleep"
}
v3.tricks = {
    { "Sit", "RandomPetsSept2023EelSit" },
    { "Joyful", "RandomPetsSept2023EelJoyful" },
    { "Beg", "RandomPetsSept2023EelBeg" },
    { "Jump", "RandomPetsSept2023EelJump" },
    { "Trick 1", "RandomPetsSept2023EelTrick1" },
    { "Trick 2", "RandomPetsSept2023EelTrick2" }
}
v3.neon_parts = {
    ["BackFin"] = Color3.fromRGB(90, 193, 66),
    ["LeftFin"] = Color3.fromRGB(90, 193, 66),
    ["RightFin"] = Color3.fromRGB(90, 193, 66),
    ["Torso10"] = Color3.fromRGB(90, 193, 66),
    ["Torso11"] = Color3.fromRGB(90, 193, 66),
    ["Torso3"] = Color3.fromRGB(90, 193, 66),
    ["Torso7"] = Color3.fromRGB(90, 193, 66),
    ["Torso8"] = Color3.fromRGB(90, 193, 66),
    ["Torso9"] = Color3.fromRGB(90, 193, 66)
}
v3.already_has_flying_wings = true
v3.generate_npc_furniture_on_runtime = true
v3.minimum_fly_anim_speed = 0.5
v3.stabilizer_part_override = "Head"
v2.random_pets_sept_2023_eel = v3
local v5 = {
    ["name"] = "Pelican",
    ["image"] = "rbxassetid://13077769577",
    ["model"] = "RandomPetsSept2023Pelican",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Random Pets",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "RandomPetsSept2023PelicanBeingHeldDouble",
        ["eating"] = "RandomPetsSept2023PelicanEat",
        ["hold"] = "RandomPetsSept2023PelicanBeingHeldSingle",
        ["idle"] = "RandomPetsSept2023PelicanIdle",
        ["running"] = "RandomPetsSept2023PelicanRun",
        ["sit"] = "RandomPetsSept2023PelicanSit",
        ["sleep"] = "RandomPetsSept2023PelicanSleep"
    },
    ["tricks"] = {
        { "Sit", "RandomPetsSept2023PelicanSit" },
        { "Joyful", "RandomPetsSept2023PelicanJoyful" },
        { "Beg", "RandomPetsSept2023PelicanBeg" },
        { "Jump", "RandomPetsSept2023PelicanJump" },
        { "Trick 1", "RandomPetsSept2023PelicanTrick1" },
        { "Trick 2", "RandomPetsSept2023PelicanTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing2"] = Color3.fromRGB(84, 103, 198),
        ["RightWing2"] = Color3.fromRGB(84, 103, 198),
        ["Tail2"] = Color3.fromRGB(84, 103, 198),
        ["Torso2"] = Color3.fromRGB(84, 103, 198),
        ["Torso3"] = Color3.fromRGB(84, 103, 198)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true,
    ["head_part_for_reactions"] = "HeadVolume"
}
v2.random_pets_sept_2023_pelican = v5
return v1(v2)