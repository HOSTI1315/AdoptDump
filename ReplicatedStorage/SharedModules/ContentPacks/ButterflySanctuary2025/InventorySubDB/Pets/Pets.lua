--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.InventorySubDB.Pets (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.SharedPackages.Sift)
local v3 = require(v1.ClientDB.Inventory.EntryHelper)
local v_u_4 = {
    ["anims"] = {
        ["double_hold"] = "Butterfly2025ButterflyBeingHeldDouble",
        ["eating"] = "Butterfly2025ButterflyEat",
        ["hold"] = "Butterfly2025ButterflyBeingHeldSingle",
        ["idle"] = "Butterfly2025ButterflyIdle",
        ["running"] = "Butterfly2025ButterflyRun",
        ["sit"] = "Butterfly2025ButterflySit",
        ["sleep"] = "Butterfly2025ButterflySleep"
    },
    ["tricks"] = {
        { "Sit", "Butterfly2025ButterflySit" },
        { "Joyful", "Butterfly2025ButterflyJoyful" },
        { "Beg", "Butterfly2025ButterflyBeg" },
        { "Jump", "Butterfly2025ButterflyJump" },
        { "Trick 1", "Butterfly2025ButterflyTrick1" },
        { "Trick 2", "Butterfly2025ButterflyTrick2" }
    },
    ["already_has_flying_wings"] = true
}
local v_u_5 = {
    ["SPECIAL"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "butterfly_2025_snapdragon_flower" },
        ["year"] = 2025
    },
    ["NORMAL"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "butterfly_2025_bluebell_flower", "butterfly_2025_snapdragon_flower" },
        ["year"] = 2025
    },
    ["ROBUX"] = {
        ["origin"] = "Butterfly Sanctuary",
        ["origin_items"] = { "butterfly_2025_goldenrod_flower" },
        ["year"] = 2025
    }
}
local v6 = {}
local v7 = {}
local v8 = {
    ["name"] = "Prismatic Butterfly",
    ["image"] = "rbxassetid://116463571924920",
    ["model"] = "Butterfly2025PrismaticButterfly",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["double_hold"] = "Butterfly2025PrismaticButterflyBeingHeldDouble",
        ["eating"] = "Butterfly2025PrismaticButterflyEat",
        ["hold"] = "Butterfly2025PrismaticButterflyBeingHeldSingle",
        ["idle"] = "Butterfly2025PrismaticButterflyIdle",
        ["running"] = "Butterfly2025PrismaticButterflyRun",
        ["sit"] = "Butterfly2025PrismaticButterflySit",
        ["sleep"] = "Butterfly2025PrismaticButterflySleep"
    },
    ["tricks"] = {
        { "Sit", "Butterfly2025PrismaticButterflySit" },
        { "Joyful", "Butterfly2025PrismaticButterflyJoyful" },
        { "Beg", "Butterfly2025PrismaticButterflyBeg" },
        { "Jump", "Butterfly2025PrismaticButterflyJump" },
        { "Trick 1", "Butterfly2025PrismaticButterflyTrick1" },
        { "Trick 2", "Butterfly2025PrismaticButterflyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWIng3"] = Color3.fromRGB(255, 234, 74),
        ["Torso4"] = Color3.fromRGB(40, 127, 71),
        ["RightAntenna"] = Color3.fromRGB(75, 217, 9),
        ["RightWing9"] = Color3.fromRGB(184, 184, 184),
        ["RightWing5"] = Color3.fromRGB(109, 195, 155),
        ["RightWing2"] = Color3.fromRGB(244, 151, 151),
        ["LeftWIng4"] = Color3.fromRGB(220, 247, 121),
        ["LeftWIng6"] = Color3.fromRGB(10, 165, 232),
        ["LeftWIng2"] = Color3.fromRGB(244, 151, 151),
        ["LeftWIng7"] = Color3.fromRGB(230, 170, 255),
        ["LeftWIng9"] = Color3.fromRGB(184, 184, 184),
        ["RightWing7"] = Color3.fromRGB(230, 170, 255),
        ["RightWing6"] = Color3.fromRGB(10, 165, 232),
        ["LeftAntenna"] = Color3.fromRGB(75, 217, 9),
        ["LeftWIng5"] = Color3.fromRGB(109, 195, 155),
        ["RightWing3"] = Color3.fromRGB(255, 234, 74),
        ["RightWing4"] = Color3.fromRGB(220, 247, 121)
    }
}
v7.butterfly_2025_prismatic_butterfly = v8
v6.SPECIAL = v7
local v9 = {}
local v10 = {
    ["name"] = "Blue Butterfly",
    ["image"] = "rbxassetid://84089584046947",
    ["model"] = "Butterfly2025BlueButterfly",
    ["rarity"] = "common",
    ["neon_parts"] = {
        ["LeftAntenna_Geo"] = Color3.fromRGB(22, 75, 144),
        ["LeftWing3_Geo"] = Color3.fromRGB(2, 86, 243),
        ["LeftWing6_Geo"] = Color3.fromRGB(2, 86, 243),
        ["RightAntenna_Geo"] = Color3.fromRGB(22, 75, 144),
        ["RightWing3_Geo"] = Color3.fromRGB(2, 86, 243),
        ["RightWing6_Geo"] = Color3.fromRGB(2, 86, 243)
    }
}
v9.butterfly_2025_blue_butterfly = v10
local v11 = {
    ["name"] = "Amber Butterfly",
    ["image"] = "rbxassetid://121639546210522",
    ["model"] = "Butterfly2025YellowButterfly",
    ["rarity"] = "rare",
    ["neon_parts"] = {
        ["LeftAntenna_Geo"] = Color3.fromRGB(84, 8, 9),
        ["LeftWing3_Geo"] = Color3.fromRGB(238, 255, 47),
        ["LeftWing6_Geo"] = Color3.fromRGB(238, 255, 47),
        ["RightAntenna_Geo"] = Color3.fromRGB(84, 8, 9),
        ["RightWing3_Geo"] = Color3.fromRGB(238, 255, 47),
        ["RightWing6_Geo"] = Color3.fromRGB(238, 255, 47)
    }
}
v9.butterfly_2025_amber_butterfly = v11
local v12 = {
    ["name"] = "Seafoam Butterfly",
    ["image"] = "rbxassetid://99042906016947",
    ["model"] = "Butterfly2025GreenButterfly",
    ["rarity"] = "ultra_rare",
    ["neon_parts"] = {
        ["LeftAntenna_Geo"] = Color3.fromRGB(30, 35, 31),
        ["LeftWing3_Geo"] = Color3.fromRGB(0, 165, 190),
        ["LeftWing6_Geo"] = Color3.fromRGB(0, 165, 190),
        ["RightAntenna_Geo"] = Color3.fromRGB(30, 35, 31),
        ["RightWing3_Geo"] = Color3.fromRGB(0, 165, 190),
        ["RightWing6_Geo"] = Color3.fromRGB(0, 165, 190)
    }
}
v9.butterfly_2025_seafoam_butterfly = v12
v6.NORMAL = v9
local v13 = {}
local v14 = {
    ["name"] = "Vermilion Butterfly",
    ["image"] = "rbxassetid://138841259551372",
    ["model"] = "Butterfly2025RedButterfly",
    ["rarity"] = "ultra_rare",
    ["neon_parts"] = {
        ["LeftAntenna_Geo"] = Color3.fromRGB(173, 76, 7),
        ["LeftWing3_Geo"] = Color3.fromRGB(243, 136, 5),
        ["LeftWing6_Geo"] = Color3.fromRGB(243, 136, 5),
        ["RightAntenna_Geo"] = Color3.fromRGB(173, 76, 7),
        ["RightWing3_Geo"] = Color3.fromRGB(243, 136, 5),
        ["RightWing6_Geo"] = Color3.fromRGB(243, 136, 5)
    }
}
v13.butterfly_2025_vermilion_butterfly = v14
local v15 = {
    ["name"] = "Violet Butterfly",
    ["image"] = "rbxassetid://119640582603552",
    ["model"] = "Butterfly2025PurpleButterfly",
    ["rarity"] = "legendary",
    ["neon_parts"] = {
        ["LeftAntenna_Geo"] = Color3.fromRGB(80, 42, 84),
        ["LeftWing3_Geo"] = Color3.fromRGB(196, 124, 255),
        ["LeftWing6_Geo"] = Color3.fromRGB(196, 124, 255),
        ["RightAntenna_Geo"] = Color3.fromRGB(80, 42, 84),
        ["RightWing3_Geo"] = Color3.fromRGB(196, 124, 255),
        ["RightWing6_Geo"] = Color3.fromRGB(196, 124, 255)
    }
}
v13.butterfly_2025_violet_butterfly = v15
local v16 = {
    ["name"] = "Orchid Butterfly",
    ["image"] = "rbxassetid://84468510887759",
    ["model"] = "Butterfly2025PinkButterfly",
    ["rarity"] = "legendary",
    ["neon_parts"] = {
        ["LeftAntenna_Geo"] = Color3.fromRGB(153, 61, 118),
        ["LeftWing3_Geo"] = Color3.fromRGB(255, 39, 115),
        ["LeftWing6_Geo"] = Color3.fromRGB(255, 39, 115),
        ["RightAntenna_Geo"] = Color3.fromRGB(153, 61, 118),
        ["RightWing3_Geo"] = Color3.fromRGB(255, 39, 115),
        ["RightWing6_Geo"] = Color3.fromRGB(255, 39, 115)
    }
}
v13.butterfly_2025_orchid_butterfly = v16
v6.ROBUX = v13
return v3.pets(v_u_2.Dictionary.flatten(v_u_2.Dictionary.map(v6, function(p17, p18)
    local v_u_19 = v_u_5[p18]
    return v_u_2.Dictionary.map(p17, function(p20, _)
        local v21 = {
            ["origin_entry"] = v_u_19
        }
        return v_u_2.Dictionary.merge(v_u_4, v21, p20)
    end)
end), 1))