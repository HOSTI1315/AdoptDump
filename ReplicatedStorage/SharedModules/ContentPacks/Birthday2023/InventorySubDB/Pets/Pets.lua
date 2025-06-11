--// ReplicatedStorage.SharedModules.ContentPacks.Birthday2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Birthday Butterfly 2023",
    ["image"] = "rbxassetid://14353536658",
    ["model"] = "Birthday2023BirthdayButterfly",
    ["rarity"] = "uncommon",
    ["cost"] = 1500,
    ["origin_entry"] = {
        ["origin"] = "Birthday",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Butterfly2023BeingHeldDouble",
        ["eating"] = "Butterfly2023Eat",
        ["flying"] = "Butterfly2023Idle",
        ["hold"] = "Butterfly2023BeingHeldSingle",
        ["idle"] = "Butterfly2023Idle",
        ["running"] = "Butterfly2023Run",
        ["sit"] = "Butterfly2023Sit",
        ["sleep"] = "Butterfly2023Sleep"
    },
    ["tricks"] = {
        { "Sit", "Butterfly2023Sit" },
        { "Joyful", "Butterfly2023Joyful" },
        { "Beg", "Butterfly2023Beg" },
        { "Jump", "Butterfly2023Jump" },
        { "Trick 1", "Butterfly2023Trick1" },
        { "Trick 2", "Butterfly2023Trick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(8, 126, 189),
        ["LeftAntenna2"] = Color3.fromRGB(8, 126, 189),
        ["LeftAntenna3"] = Color3.fromRGB(8, 126, 189),
        ["LeftAntenna4"] = Color3.fromRGB(8, 126, 189),
        ["LeftWing"] = Color3.fromRGB(8, 126, 189),
        ["LeftWing4"] = Color3.fromRGB(8, 126, 189),
        ["LeftWingBot"] = Color3.fromRGB(8, 126, 189),
        ["LeftWingBot3"] = Color3.fromRGB(8, 126, 189),
        ["RightAntenna"] = Color3.fromRGB(8, 126, 189),
        ["RightAntenna2"] = Color3.fromRGB(8, 126, 189),
        ["RightAntenna3"] = Color3.fromRGB(8, 126, 189),
        ["RightAntenna4"] = Color3.fromRGB(8, 126, 189),
        ["RightWing"] = Color3.fromRGB(8, 126, 189),
        ["RightWing4"] = Color3.fromRGB(8, 126, 189),
        ["RightWingBot"] = Color3.fromRGB(8, 126, 189),
        ["RightWingBot3"] = Color3.fromRGB(8, 126, 189)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.75
}
v2.birthday_2023_birthday_butterfly = v3
return v1(v2)