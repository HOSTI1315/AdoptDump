--// ReplicatedStorage.SharedModules.ContentPacks.Pride2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Caelum Cervi",
    ["image"] = "rbxassetid://13462536955",
    ["model"] = "Pride2023CaelumCervi",
    ["rarity"] = "legendary"
}
local v4 = {
    ["origin"] = "Pride",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 5,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2023
}
v3.origin_entry = v4
v3.anims = {
    ["double_hold"] = "Pride2023CaelumCerviBeingHeldDouble",
    ["eating"] = "Pride2023CaelumCerviEat",
    ["flying"] = "Pride2023CaelumCerviRun",
    ["hold"] = "Pride2023CaelumCerviBeingHeldSingle",
    ["idle"] = "Pride2023CaelumCerviIdle",
    ["running"] = "Pride2023CaelumCerviRun",
    ["sit"] = "Pride2023CaelumCerviSit",
    ["sleep"] = "Pride2023CaelumCerviSleep"
}
v3.tricks = {
    { "Sit", "Pride2023CaelumCerviSit" },
    { "Joyful", "Pride2023CaelumCerviJoyful" },
    { "Beg", "Pride2023CaelumCerviBeg" },
    { "Jump", "Pride2023CaelumCerviJump" },
    { "Trick 1", "Pride2023CaelumCerviTrick1" },
    { "Trick 2", "Pride2023CaelumCerviTrick2" }
}
v3.neon_parts = {
    ["BackLeftFoot"] = Color3.fromRGB(186, 180, 132),
    ["BackRightFoot"] = Color3.fromRGB(186, 180, 132),
    ["FrontLeftFoot"] = Color3.fromRGB(186, 180, 132),
    ["FrontRightFoot"] = Color3.fromRGB(186, 180, 132),
    ["Head2"] = Color3.fromRGB(186, 180, 132),
    ["LeftAntler"] = Color3.fromRGB(186, 180, 132),
    ["LeftEar2"] = Color3.fromRGB(186, 180, 132),
    ["LeftWing2"] = Color3.fromRGB(186, 180, 132),
    ["LeftWing4"] = Color3.fromRGB(186, 180, 132),
    ["RightAntler"] = Color3.fromRGB(186, 180, 132),
    ["RightEar2"] = Color3.fromRGB(186, 180, 132),
    ["RightWing2"] = Color3.fromRGB(186, 180, 132),
    ["RightWing4"] = Color3.fromRGB(186, 180, 132),
    ["Tail"] = Color3.fromRGB(186, 180, 132),
    ["Tail3"] = Color3.fromRGB(186, 180, 132),
    ["Torso2"] = Color3.fromRGB(186, 180, 132),
    ["tail_C_01_JNT"] = Color3.fromRGB(186, 180, 132)
}
v3.already_has_flying_wings = true
v3.generate_npc_furniture_on_runtime = true
v3.minimum_fly_anim_speed = 0.9
v3.minimum_run_anim_speed = 0.75
v2.pride_2023_caelum_cervi = v3
return v1(v2)