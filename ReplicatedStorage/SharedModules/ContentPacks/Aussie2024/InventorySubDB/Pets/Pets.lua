--// ReplicatedStorage.SharedModules.ContentPacks.Aussie2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Kookaburra",
    ["image"] = "rbxassetid://15698960105",
    ["model"] = "Aussie2024Kookaburra",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Aussie Update",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Aussie2024KookaburraBeingHeldDouble",
        ["eating"] = "Aussie2024KookaburraEat",
        ["flying"] = "Aussie2024KookaburraRun",
        ["hold"] = "Aussie2024KookaburraBeingHeldSingle",
        ["idle"] = "Aussie2024KookaburraIdle",
        ["running"] = "Aussie2024KookaburraRun",
        ["sit"] = "Aussie2024KookaburraSit",
        ["sleep"] = "Aussie2024KookaburraSleep"
    },
    ["tricks"] = {
        { "Sit", "Aussie2024KookaburraSit" },
        { "Joyful", "Aussie2024KookaburraJoyful" },
        { "Beg", "Aussie2024KookaburraBeg" },
        { "Jump", "Aussie2024KookaburraJump" },
        { "Trick 1", "Aussie2024KookaburraTrick1" },
        { "Trick 2", "Aussie2024KookaburraTrick2" }
    },
    ["neon_parts"] = {
        ["Beak2"] = Color3.fromRGB(131, 93, 188),
        ["Feather2"] = Color3.fromRGB(131, 93, 188),
        ["Feather3"] = Color3.fromRGB(131, 93, 188),
        ["Head2"] = Color3.fromRGB(131, 93, 188),
        ["LeftFoot"] = Color3.fromRGB(179, 74, 188),
        ["LeftWing"] = Color3.fromRGB(92, 79, 188),
        ["LeftWing2"] = Color3.fromRGB(179, 74, 188),
        ["LeftWing3"] = Color3.fromRGB(131, 93, 188),
        ["LeftWing4"] = Color3.fromRGB(131, 93, 188),
        ["RightFoot"] = Color3.fromRGB(179, 74, 188),
        ["RightWing"] = Color3.fromRGB(92, 79, 188),
        ["RightWing2"] = Color3.fromRGB(179, 74, 188),
        ["RightWing3"] = Color3.fromRGB(131, 93, 188),
        ["RightWing4"] = Color3.fromRGB(131, 93, 188),
        ["Tail"] = Color3.fromRGB(92, 79, 188),
        ["Tail2"] = Color3.fromRGB(179, 74, 188),
        ["Tail3"] = Color3.fromRGB(131, 93, 188)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.aussie_2024_kookaburra = v3
local v4 = {
    ["name"] = "Quokka",
    ["image"] = "rbxassetid://15684947715",
    ["model"] = "Aussie2024Quokka",
    ["rarity"] = "uncommon",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Aussie Update",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Aussie2024QuokkaBeingHeldDouble",
        ["eating"] = "Aussie2024QuokkaEat",
        ["flying"] = "Aussie2024QuokkaRun",
        ["hold"] = "Aussie2024QuokkaBeingHeldSingle",
        ["idle"] = "Aussie2024QuokkaIdle",
        ["running"] = "Aussie2024QuokkaRun",
        ["sit"] = "Aussie2024QuokkaSit",
        ["sleep"] = "Aussie2024QuokkaSleep"
    },
    ["tricks"] = {
        { "Sit", "Aussie2024QuokkaSit" },
        { "Joyful", "Aussie2024QuokkaJoyful" },
        { "Beg", "Aussie2024QuokkaBeg" },
        { "Jump", "Aussie2024QuokkaJump" },
        { "Trick 1", "Aussie2024QuokkaTrick1" },
        { "Trick 2", "Aussie2024QuokkaTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(51, 184, 113),
        ["BackRightFoot"] = Color3.fromRGB(51, 184, 113),
        ["FrontLeftFoot"] = Color3.fromRGB(51, 184, 113),
        ["FrontRightFoot"] = Color3.fromRGB(51, 184, 113),
        ["LeftEar2"] = Color3.fromRGB(51, 184, 113),
        ["Nose"] = Color3.fromRGB(51, 184, 113),
        ["RightEar2"] = Color3.fromRGB(51, 184, 113),
        ["Tail"] = Color3.fromRGB(51, 184, 113),
        ["Tail2"] = Color3.fromRGB(51, 184, 113),
        ["Tail3"] = Color3.fromRGB(51, 184, 113)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.aussie_2024_quokka = v4
local v5 = {
    ["name"] = "Tasmanian Devil",
    ["image"] = "rbxassetid://15685468962",
    ["model"] = "Aussie2024TasmanianDevil",
    ["rarity"] = "rare",
    ["cost"] = 1450,
    ["origin_entry"] = {
        ["origin"] = "Aussie Update",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Aussie2024TasmanianDevilBeingHeldDouble",
        ["eating"] = "Aussie2024TasmanianDevilEat",
        ["flying"] = "Aussie2024TasmanianDevilRun",
        ["hold"] = "Aussie2024TasmanianDevilBeingHeldSingle",
        ["idle"] = "Aussie2024TasmanianDevilIdle",
        ["running"] = "Aussie2024TasmanianDevilRun",
        ["sit"] = "Aussie2024TasmanianDevilSit",
        ["sleep"] = "Aussie2024TasmanianDevilSleep"
    },
    ["tricks"] = {
        { "Sit", "Aussie2024TasmanianDevilSit" },
        { "Joyful", "Aussie2024TasmanianDevilJoyful" },
        { "Beg", "Aussie2024TasmanianDevilBeg" },
        { "Jump", "Aussie2024TasmanianDevilJump" },
        { "Trick 1", "Aussie2024TasmanianDevilTrick1" },
        { "Trick 2", "Aussie2024TasmanianDevilTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(188, 98, 100),
        ["LeftEar2"] = Color3.fromRGB(188, 98, 100),
        ["RightEar2"] = Color3.fromRGB(188, 98, 100),
        ["Tail2"] = Color3.fromRGB(188, 98, 100),
        ["Torso2"] = Color3.fromRGB(188, 98, 100)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.aussie_2024_tasmanian_devil = v5
return v1(v2)