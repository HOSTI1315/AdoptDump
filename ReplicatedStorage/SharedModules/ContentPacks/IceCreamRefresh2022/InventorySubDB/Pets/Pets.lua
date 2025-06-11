--// ReplicatedStorage.SharedModules.ContentPacks.IceCreamRefresh2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Diamond King Penguin",
    ["image"] = "rbxassetid://9490243442",
    ["model"] = "IceCreamRefresh2022DiamondKingPenguin",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Ice Cream Refresh",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "KingPenguinBeingHeldDouble",
        ["eating"] = "KingPenguinEat",
        ["hold"] = "KingPenguinBeingHeldSingle",
        ["idle"] = "KingPenguinIdle",
        ["idle_mounted"] = "KingPenguinRideIdle",
        ["running"] = "KingPenguinRun",
        ["running_mounted"] = "KingPenguinRideRun",
        ["sit"] = "KingPenguinSit",
        ["sleep"] = "KingPenguinSleep"
    },
    ["tricks"] = {
        { "Sit", "KingPenguinSit" },
        { "Joyful", "KingPenguinJoyful" },
        { "Beg", "KingPenguinBeg" },
        { "Jump", "KingPenguinJump" },
        { "Trick 1", "KingPenguinTrick1" },
        { "Trick 2", "KingPenguinTrick2" }
    },
    ["neon_parts"] = {
        ["Beak2"] = Color3.fromRGB(105, 150, 216),
        ["LeftFoot"] = Color3.fromRGB(105, 150, 216),
        ["RightFoot"] = Color3.fromRGB(105, 150, 216),
        ["Torso2"] = Color3.fromRGB(105, 150, 216)
    },
    ["eyes"] = { "Eyes" }
}
v2.ice_cream_refresh_2022_diamond_king_penguin = v3
local v4 = {
    ["name"] = "Golden King Penguin",
    ["image"] = "rbxassetid://9490242683",
    ["model"] = "IceCreamRefresh2022GoldenKingPenguin",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Ice Cream Refresh",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "KingPenguinBeingHeldDouble",
        ["eating"] = "KingPenguinEat",
        ["hold"] = "KingPenguinBeingHeldSingle",
        ["idle"] = "KingPenguinIdle",
        ["idle_mounted"] = "KingPenguinRideIdle",
        ["running"] = "KingPenguinRun",
        ["running_mounted"] = "KingPenguinRideRun",
        ["sit"] = "KingPenguinSit",
        ["sleep"] = "KingPenguinSleep"
    },
    ["tricks"] = {
        { "Sit", "KingPenguinSit" },
        { "Joyful", "KingPenguinJoyful" },
        { "Beg", "KingPenguinBeg" },
        { "Jump", "KingPenguinJump" },
        { "Trick 1", "KingPenguinTrick1" },
        { "Trick 2", "KingPenguinTrick2" }
    },
    ["neon_parts"] = {
        ["Beak2"] = Color3.fromRGB(186, 126, 52),
        ["LeftFoot"] = Color3.fromRGB(186, 126, 52),
        ["RightFoot"] = Color3.fromRGB(186, 126, 52),
        ["Torso2"] = Color3.fromRGB(186, 126, 52)
    },
    ["eyes"] = { "Eyes" }
}
v2.ice_cream_refresh_2022_golden_king_penguin = v4
local v5 = {
    ["name"] = "King Penguin",
    ["image"] = "rbxassetid://9482496753",
    ["model"] = "IceCreamRefresh2022KingPenguin",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Ice Cream Refresh",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "KingPenguinBeingHeldDouble",
        ["eating"] = "KingPenguinEat",
        ["hold"] = "KingPenguinBeingHeldSingle",
        ["idle"] = "KingPenguinIdle",
        ["idle_mounted"] = "KingPenguinRideIdle",
        ["running"] = "KingPenguinRun",
        ["running_mounted"] = "KingPenguinRideRun",
        ["sit"] = "KingPenguinSit",
        ["sleep"] = "KingPenguinSleep"
    },
    ["tricks"] = {
        { "Sit", "KingPenguinSit" },
        { "Joyful", "KingPenguinJoyful" },
        { "Beg", "KingPenguinBeg" },
        { "Jump", "KingPenguinJump" },
        { "Trick 1", "KingPenguinTrick1" },
        { "Trick 2", "KingPenguinTrick2" }
    },
    ["neon_parts"] = {
        ["Beak2"] = Color3.fromRGB(108, 158, 185),
        ["LeftFoot"] = Color3.fromRGB(108, 158, 185),
        ["RightFoot"] = Color3.fromRGB(108, 158, 185),
        ["Torso2"] = Color3.fromRGB(108, 158, 185)
    },
    ["eyes"] = { "Eyes" }
}
v2.ice_cream_refresh_2022_king_penguin = v5
return v1(v2)