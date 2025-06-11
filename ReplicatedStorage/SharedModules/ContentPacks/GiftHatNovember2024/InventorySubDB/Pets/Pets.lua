--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatNovember2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Hippogriff",
    ["image"] = "rbxassetid://76198828333546",
    ["model"] = "GiftHatNov2024Hippogriff",
    ["rarity"] = "legendary",
    ["generate_npc_furniture_on_runtime"] = true,
    ["origin_entry"] = {
        ["origin"] = "Hippogriff",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "GiftHatNov2024HippogriffBeingHeldDouble",
        ["eating"] = "GiftHatNov2024HippogriffEat",
        ["hold"] = "GiftHatNov2024HippogriffBeingHeldSingle",
        ["idle"] = "GiftHatNov2024HippogriffIdle",
        ["running"] = "GiftHatNov2024HippogriffRun",
        ["sit"] = "GiftHatNov2024HippogriffSit",
        ["sleep"] = "GiftHatNov2024HippogriffSleep"
    },
    ["tricks"] = {
        { "Sit", "GiftHatNov2024HippogriffSit" },
        { "Joyful", "GiftHatNov2024HippogriffJoyful" },
        { "Beg", "GiftHatNov2024HippogriffBeg" },
        { "Jump", "GiftHatNov2024HippogriffJump" },
        { "Trick 1", "GiftHatNov2024HippogriffTrick1" },
        { "Trick 2", "GiftHatNov2024HippogriffTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot2"] = Color3.fromRGB(190, 120, 86),
        ["Head2"] = Color3.fromRGB(190, 120, 86),
        ["Head3"] = Color3.fromRGB(190, 120, 86),
        ["Tail"] = Color3.fromRGB(190, 120, 86),
        ["FrontRightFoot2"] = Color3.fromRGB(190, 120, 86),
        ["Head5"] = Color3.fromRGB(190, 120, 86),
        ["RightWing2"] = Color3.fromRGB(190, 120, 86),
        ["LeftWing2"] = Color3.fromRGB(190, 120, 86)
    },
    ["already_has_flying_wings"] = true,
    ["maximum_run_anim_speed"] = 0.75,
    ["minimum_fly_anim_speed"] = 0.75,
    ["maximum_fly_anim_speed"] = 0.75
}
v2.gifthat_november_2024_hippogriff = v3
return v1(v2)