--// ReplicatedStorage.SharedModules.ContentPacks.Ddlm2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Sugar Axolotl",
    ["image"] = "rbxassetid://121496682360324",
    ["model"] = "Ddlm2024SugarAxolotl",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "D\195\173a de los Muertos",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Ddlm2024SugarAxolotlBeingHeldDouble",
        ["eating"] = "Ddlm2024SugarAxolotlEat",
        ["hold"] = "Ddlm2024SugarAxolotlBeingHeldSingle",
        ["idle"] = "Ddlm2024SugarAxolotlIdle",
        ["running"] = "Ddlm2024SugarAxolotlRun",
        ["sit"] = "Ddlm2024SugarAxolotlSit",
        ["sleep"] = "Ddlm2024SugarAxolotlSleep"
    },
    ["tricks"] = {
        { "Sit", "Ddlm2024SugarAxolotlSit" },
        { "Joyful", "Ddlm2024SugarAxolotlJoyful" },
        { "Beg", "Ddlm2024SugarAxolotlBeg" },
        { "Jump", "Ddlm2024SugarAxolotlJump" },
        { "Trick 1", "Ddlm2024SugarAxolotlTrick1" },
        { "Trick 2", "Ddlm2024SugarAxolotlTrick2" }
    },
    ["neon_parts"] = {
        ["Head6"] = Color3.fromRGB(133, 15, 229),
        ["FrontLeftFoot2"] = Color3.fromRGB(165, 15, 229),
        ["Torso3"] = Color3.fromRGB(33, 174, 184),
        ["Torso2"] = Color3.fromRGB(198, 121, 12),
        ["Head4"] = Color3.fromRGB(33, 174, 184),
        ["Head3"] = Color3.fromRGB(198, 121, 12),
        ["BackRightFoot2"] = Color3.fromRGB(165, 15, 229),
        ["FrontRightFoot2"] = Color3.fromRGB(165, 15, 229),
        ["Eyes"] = Color3.fromRGB(33, 174, 184),
        ["MidRightFin2"] = Color3.fromRGB(181, 176, 162),
        ["TopRightFin3"] = Color3.fromRGB(198, 121, 12),
        ["Spine"] = Color3.fromRGB(33, 174, 184),
        ["TopRightFin2"] = Color3.fromRGB(181, 176, 162),
        ["MidRightFin3"] = Color3.fromRGB(198, 121, 12),
        ["BottomRightFin2"] = Color3.fromRGB(181, 176, 162),
        ["BottomRightFin3"] = Color3.fromRGB(198, 121, 12),
        ["Torso4"] = Color3.fromRGB(181, 176, 162),
        ["BottomLeftFin3"] = Color3.fromRGB(198, 121, 12),
        ["BottomLeftFin2"] = Color3.fromRGB(181, 176, 162),
        ["MidLeftFin2"] = Color3.fromRGB(181, 176, 162),
        ["TopLeftFin2"] = Color3.fromRGB(181, 176, 162),
        ["TopLeftFin3"] = Color3.fromRGB(198, 121, 12),
        ["MidLeftFin3"] = Color3.fromRGB(198, 121, 12),
        ["Head2"] = Color3.fromRGB(133, 15, 229),
        ["Head5"] = Color3.fromRGB(181, 176, 162),
        ["BackLeftFoot2"] = Color3.fromRGB(165, 15, 229)
    }
}
local v4 = {
    ["Head6"] = Color3.fromRGB(133, 15, 229),
    ["FrontLeftFoot2"] = Color3.fromRGB(165, 15, 229),
    ["Torso3"] = Color3.fromRGB(33, 174, 184),
    ["Torso2"] = Color3.fromRGB(198, 121, 12),
    ["Head4"] = Color3.fromRGB(33, 174, 184),
    ["Head3"] = {
        ["Material"] = Enum.Material.SmoothPlastic,
        ["Color"] = Color3.fromRGB(17, 17, 17)
    },
    ["BackRightFoot2"] = Color3.fromRGB(165, 15, 229),
    ["FrontRightFoot2"] = Color3.fromRGB(165, 15, 229),
    ["MidRightFin2"] = Color3.fromRGB(181, 176, 162),
    ["TopRightFin3"] = Color3.fromRGB(198, 121, 12),
    ["Spine"] = Color3.fromRGB(33, 174, 184),
    ["TopRightFin2"] = Color3.fromRGB(181, 176, 162),
    ["MidRightFin3"] = Color3.fromRGB(198, 121, 12),
    ["BottomRightFin2"] = Color3.fromRGB(181, 176, 162),
    ["BottomRightFin3"] = Color3.fromRGB(198, 121, 12),
    ["Torso4"] = Color3.fromRGB(181, 176, 162),
    ["BottomLeftFin3"] = Color3.fromRGB(198, 121, 12),
    ["BottomLeftFin2"] = Color3.fromRGB(181, 176, 162),
    ["MidLeftFin2"] = Color3.fromRGB(181, 176, 162),
    ["TopLeftFin2"] = Color3.fromRGB(181, 176, 162),
    ["TopLeftFin3"] = Color3.fromRGB(198, 121, 12),
    ["MidLeftFin3"] = Color3.fromRGB(198, 121, 12),
    ["Head2"] = {
        ["Material"] = Enum.Material.SmoothPlastic,
        ["Color"] = Color3.fromRGB(17, 17, 17)
    },
    ["Head5"] = Color3.fromRGB(181, 176, 162),
    ["BackLeftFoot2"] = Color3.fromRGB(165, 15, 229)
}
v3.mega_neon_parts = v4
v3.mega_neon_colors = {
    Color3.fromRGB(255, 74, 92),
    Color3.fromRGB(255, 96, 93),
    Color3.fromRGB(166, 177, 18),
    Color3.fromRGB(115, 201, 58),
    Color3.fromRGB(51, 179, 58),
    Color3.fromRGB(58, 185, 115),
    Color3.fromRGB(59, 36, 185),
    Color3.fromRGB(137, 88, 211),
    Color3.fromRGB(209, 78, 155),
    Color3.fromRGB(255, 101, 101)
}
v3.already_has_flying_wings = true
v2.ddlm_2024_sugar_axolotl = v3
local v5 = {
    ["name"] = "Golden Jaguar",
    ["image"] = "rbxassetid://83805820117149",
    ["model"] = "Ddlm2024GoldenJaguar",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "D\195\173a de los Muertos",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Ddlm2024GoldenJaguarBeingHeldDouble",
        ["eating"] = "Ddlm2024GoldenJaguarEat",
        ["hold"] = "Ddlm2024GoldenJaguarBeingHeldSingle",
        ["idle"] = "Ddlm2024GoldenJaguarIdle",
        ["running"] = "Ddlm2024GoldenJaguarRun",
        ["sit"] = "Ddlm2024GoldenJaguarSit",
        ["sleep"] = "Ddlm2024GoldenJaguarSleep"
    },
    ["tricks"] = {
        { "Sit", "Ddlm2024GoldenJaguarSit" },
        { "Joyful", "Ddlm2024GoldenJaguarJoyful" },
        { "Beg", "Ddlm2024GoldenJaguarBeg" },
        { "Jump", "Ddlm2024GoldenJaguarJump" },
        { "Trick 1", "Ddlm2024GoldenJaguarTrick1" },
        { "Trick 2", "Ddlm2024GoldenJaguarTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(216, 115, 14),
        ["LeftEar"] = Color3.fromRGB(216, 115, 14),
        ["FrontRightFoot2"] = Color3.fromRGB(222, 98, 10),
        ["BackRightFoot2"] = Color3.fromRGB(222, 98, 10),
        ["FrontLeftFoot2"] = Color3.fromRGB(222, 98, 10),
        ["BackLeftFoot2"] = Color3.fromRGB(222, 98, 10),
        ["RightEar"] = Color3.fromRGB(216, 115, 14),
        ["Head2"] = Color3.fromRGB(216, 115, 14),
        ["Torso2"] = Color3.fromRGB(216, 115, 14)
    },
    ["maximum_run_anim_speed"] = 0.75,
    ["minimum_fly_anim_speed"] = 0.75,
    ["maximum_fly_anim_speed"] = 0.75,
    ["mounted_animation_scale_limit"] = 1
}
v2.ddlm_2024_golden_jaguar = v5
local v6 = {
    ["name"] = "Grave Owl",
    ["image"] = "rbxassetid://74702714943302",
    ["model"] = "Ddlm2024GraveOwl",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "D\195\173a de los Muertos",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Ddlm2024GraveOwlBeingHeldDouble",
        ["eating"] = "Ddlm2024GraveOwlEat",
        ["hold"] = "Ddlm2024GraveOwlBeingHeldSingle",
        ["idle"] = "Ddlm2024GraveOwlIdle",
        ["running"] = "Ddlm2024GraveOwlRun",
        ["sit"] = "Ddlm2024GraveOwlSit",
        ["sleep"] = "Ddlm2024GraveOwlSleep"
    },
    ["tricks"] = {
        { "Sit", "Ddlm2024GraveOwlSit" },
        { "Joyful", "Ddlm2024GraveOwlJoyful" },
        { "Beg", "Ddlm2024GraveOwlBeg" },
        { "Jump", "Ddlm2024GraveOwlJump" },
        { "Trick 1", "Ddlm2024GraveOwlTrick1" },
        { "Trick 2", "Ddlm2024GraveOwlTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(185, 112, 11),
        ["Torso2"] = Color3.fromRGB(181, 176, 162),
        ["Tail2"] = Color3.fromRGB(110, 13, 194),
        ["Torso4"] = Color3.fromRGB(133, 15, 229),
        ["Torso3"] = Color3.fromRGB(198, 121, 12),
        ["FrontRightFoot"] = Color3.fromRGB(133, 15, 229),
        ["FrontLeftFoot"] = Color3.fromRGB(133, 15, 229),
        ["RightWing3"] = Color3.fromRGB(133, 15, 229),
        ["LeftWing3"] = Color3.fromRGB(133, 15, 229),
        ["Head4"] = Color3.fromRGB(181, 176, 162),
        ["Head2"] = Color3.fromRGB(133, 15, 229),
        ["Head3"] = Color3.fromRGB(198, 121, 12),
        ["LeftWing2"] = Color3.fromRGB(181, 176, 162),
        ["RightWing2"] = Color3.fromRGB(181, 176, 162)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_disabled"] = true
}
v2.ddlm_2024_grave_owl = v6
return v1(v2)