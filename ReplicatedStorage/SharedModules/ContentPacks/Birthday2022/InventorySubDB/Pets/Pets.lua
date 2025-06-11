--// ReplicatedStorage.SharedModules.ContentPacks.Birthday2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "2022 Uplift Butterfly",
    ["image"] = "rbxassetid://9993276067",
    ["model"] = "Birthday2022Butterfly",
    ["rarity"] = "uncommon",
    ["cost"] = 1500,
    ["origin_entry"] = {
        ["origin"] = "Birthday",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ButterflyBeingDoubleHeld",
        ["eating"] = "Butterfly2022Eat",
        ["flying"] = "Butterfly2022Idle",
        ["hold"] = "ButterflyBeingHeld",
        ["idle"] = "Butterfly2022Idle",
        ["running"] = "Butterfly2022Run",
        ["sit"] = "Butterfly2022Sit",
        ["sleep"] = "Butterfly2022Sleep"
    },
    ["tricks"] = {
        { "Sit", "Butterfly2022Sit" },
        { "Joyful", "Butterfly2022Joyful" },
        { "Beg", "Butterfly2022Beg" },
        { "Jump", "Butterfly2022Jump" },
        { "Trick 1", "Butterfly2022Trick1" },
        { "Trick 2", "Butterfly2022Trick2" }
    },
    ["neon_parts"] = {
        ["AntennaiL"] = Color3.fromRGB(182, 177, 105),
        ["AntennaiL2"] = Color3.fromRGB(182, 177, 105),
        ["AntennaiL3"] = Color3.fromRGB(182, 177, 105),
        ["AntennaiR"] = Color3.fromRGB(182, 177, 105),
        ["AntennaiR2"] = Color3.fromRGB(182, 177, 105),
        ["AntennaiR3"] = Color3.fromRGB(182, 177, 105),
        ["LWings"] = Color3.fromRGB(182, 177, 105),
        ["LWings10"] = Color3.fromRGB(182, 177, 105),
        ["LWings11"] = Color3.fromRGB(182, 177, 105),
        ["LWings7"] = Color3.fromRGB(182, 177, 105),
        ["LWings8"] = Color3.fromRGB(182, 177, 105),
        ["LWings9"] = Color3.fromRGB(182, 177, 105),
        ["RWings"] = Color3.fromRGB(182, 177, 105),
        ["RWings5"] = Color3.fromRGB(182, 177, 105),
        ["RWings6"] = Color3.fromRGB(182, 177, 105),
        ["RWings7"] = Color3.fromRGB(182, 177, 105),
        ["RWings8"] = Color3.fromRGB(182, 177, 105),
        ["RWings9"] = Color3.fromRGB(182, 177, 105)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 1
}
v2.birthday_2022_uplift_butterfly = v3
return v1(v2)