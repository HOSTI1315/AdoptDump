--// ReplicatedStorage.SharedModules.ContentPacks.Subscriptions2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Hummingbird",
    ["image"] = "rbxassetid://127067345833475",
    ["model"] = "Subscription2024Hummingbird",
    ["rarity"] = "ultra_rare",
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5,
    ["origin_entry"] = {
        ["origin"] = "Subscriptions",
        ["origin_items"] = { "subscription_2024_golden_flower" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Subscription2024HummingbirdBeingHeldDouble",
        ["eating"] = "Subscription2024HummingbirdEat",
        ["flying"] = "Subscription2024HummingbirdIdle",
        ["hold"] = "Subscription2024HummingbirdBeingHeldSingle",
        ["idle"] = "Subscription2024HummingbirdIdle",
        ["running"] = "Subscription2024HummingbirdRun",
        ["sit"] = "Subscription2024HummingbirdSit",
        ["sleep"] = "Subscription2024HummingbirdSleep"
    },
    ["tricks"] = {
        { "Sit", "Subscription2024HummingbirdSit" },
        { "Joyful", "Subscription2024HummingbirdJoyful" },
        { "Beg", "Subscription2024HummingbirdBeg" },
        { "Jump", "Subscription2024HummingbirdJump" },
        { "Trick 1", "Subscription2024HummingbirdTrick1" },
        { "Trick 2", "Subscription2024HummingbirdTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(109, 184, 86),
        ["RightFoot"] = Color3.fromRGB(109, 184, 86),
        ["RightWing2"] = Color3.fromRGB(109, 184, 86),
        ["LeftWing2"] = Color3.fromRGB(109, 184, 86),
        ["Head2"] = Color3.fromRGB(109, 184, 86),
        ["Head"] = Color3.fromRGB(109, 184, 86),
        ["Torso3"] = Color3.fromRGB(109, 184, 86),
        ["Tail"] = Color3.fromRGB(109, 184, 86)
    }
}
v2.subscription_2024_hummingbird = v3
local v4 = {
    ["name"] = "Diamond Hummingbird",
    ["model"] = "Subscription2024DiamondHummingbird",
    ["image"] = "rbxassetid://95213400890066",
    ["rarity"] = "legendary",
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5,
    ["origin_entry"] = {
        ["origin"] = "Subscriptions",
        ["origin_items"] = { "subscription_2024_golden_flower" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Subscription2024HummingbirdSleep",
        ["running"] = "Subscription2024HummingbirdRun",
        ["idle"] = "Subscription2024HummingbirdIdle",
        ["eating"] = "Subscription2024HummingbirdEat",
        ["sit"] = "Subscription2024HummingbirdSit",
        ["flying"] = "Subscription2024HummingbirdRun",
        ["hold"] = "Subscription2024HummingbirdBeingHeldSingle",
        ["double_hold"] = "Subscription2024HummingbirdBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Subscription2024HummingbirdSit" },
        { "Joyful", "Subscription2024HummingbirdJoyful" },
        { "Beg", "Subscription2024HummingbirdBeg" },
        { "Jump", "Subscription2024HummingbirdJump" },
        { "Trick 1", "Subscription2024HummingbirdTrick1" },
        { "Trick 2", "Subscription2024HummingbirdTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(185, 163, 101),
        ["Beak"] = Color3.fromRGB(185, 163, 101),
        ["Torso3"] = Color3.fromRGB(185, 163, 101),
        ["RightWing2"] = Color3.fromRGB(185, 163, 101),
        ["LeftWing2"] = Color3.fromRGB(185, 163, 101),
        ["RightFoot"] = Color3.fromRGB(185, 163, 101),
        ["LeftFoot"] = Color3.fromRGB(185, 163, 101)
    }
}
v2.subscription_2024_diamond_hummingbird = v4
local v5 = {
    ["name"] = "Golden Hummingbird",
    ["model"] = "Subscription2024GoldHummingbird",
    ["image"] = "rbxassetid://75106733244906",
    ["rarity"] = "legendary",
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5,
    ["origin_entry"] = {
        ["origin"] = "Subscriptions",
        ["origin_items"] = { "subscription_2024_golden_flower" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Subscription2024HummingbirdSleep",
        ["running"] = "Subscription2024HummingbirdRun",
        ["idle"] = "Subscription2024HummingbirdIdle",
        ["eating"] = "Subscription2024HummingbirdEat",
        ["sit"] = "Subscription2024HummingbirdSit",
        ["flying"] = "Subscription2024HummingbirdRun",
        ["hold"] = "Subscription2024HummingbirdBeingHeldSingle",
        ["double_hold"] = "Subscription2024HummingbirdBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Subscription2024HummingbirdSit" },
        { "Joyful", "Subscription2024HummingbirdJoyful" },
        { "Beg", "Subscription2024HummingbirdBeg" },
        { "Jump", "Subscription2024HummingbirdJump" },
        { "Trick 1", "Subscription2024HummingbirdTrick1" },
        { "Trick 2", "Subscription2024HummingbirdTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(186, 103, 58),
        ["RightFoot"] = Color3.fromRGB(186, 103, 58),
        ["Head"] = Color3.fromRGB(186, 103, 58),
        ["Beak"] = Color3.fromRGB(186, 103, 58),
        ["RightWing2"] = Color3.fromRGB(186, 103, 58),
        ["LeftWing2"] = Color3.fromRGB(186, 103, 58),
        ["Torso3"] = Color3.fromRGB(186, 103, 58)
    }
}
v2.subscription_2024_gold_hummingbird = v5
return v1(v2)