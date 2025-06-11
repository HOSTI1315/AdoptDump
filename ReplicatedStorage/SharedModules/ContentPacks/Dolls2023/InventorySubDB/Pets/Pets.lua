--// ReplicatedStorage.SharedModules.ContentPacks.Dolls2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Dylan",
    ["image"] = "rbxassetid://13936753561",
    ["model"] = "Dolls2023Dylan",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Dolls",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_doll"] = true,
    ["is_customizable"] = false,
    ["is_proper_name"] = true,
    ["anims"] = {
        ["double_hold"] = "DollBeingDoubleHeld",
        ["drinking"] = "DollDrinking",
        ["eating"] = "DollEating",
        ["hold"] = "DollBeingHeld",
        ["idle"] = "DollIdle",
        ["running"] = "DollRunning",
        ["sit"] = "DollSit",
        ["sleep"] = "DollSleep"
    },
    ["eyes"] = { "Eyes" },
    ["unpaintable_parts"] = {
        "RightLowerArm",
        "LeftLowerArm",
        "RightHand",
        "LeftHand",
        "Head"
    }
}
v2.dolls_2023_dylan = v3
local v4 = {
    ["name"] = "Pistachio",
    ["image"] = "rbxassetid://13936754497",
    ["model"] = "Dolls2023Pinocchio",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Dolls",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_doll"] = true,
    ["is_customizable"] = false,
    ["is_proper_name"] = true,
    ["anims"] = {
        ["double_hold"] = "DollBeingDoubleHeld",
        ["drinking"] = "DollDrinking",
        ["eating"] = "DollEating",
        ["hold"] = "DollBeingHeld",
        ["idle"] = "DollIdle",
        ["running"] = "DollRunning",
        ["sit"] = "DollSit",
        ["sleep"] = "DollSleep"
    },
    ["eyes"] = { "Head3" },
    ["unpaintable_parts"] = {
        "LeftLowerArm",
        "Head",
        "RightLowerArm",
        "Head2",
        "LeftLowerLeg",
        "RightLowerLeg"
    }
}
v2.dolls_2023_pinocchio = v4
local v5 = {
    ["name"] = "River",
    ["image"] = "rbxassetid://13936750528",
    ["model"] = "Dolls2023River",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Dolls",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_doll"] = true,
    ["is_customizable"] = false,
    ["is_proper_name"] = true,
    ["anims"] = {
        ["double_hold"] = "DollBeingDoubleHeld",
        ["drinking"] = "DollDrinking",
        ["eating"] = "DollEating",
        ["hold"] = "DollBeingHeld",
        ["idle"] = "DollIdle",
        ["running"] = "DollRunning",
        ["sit"] = "DollSit",
        ["sleep"] = "DollSleep"
    },
    ["eyes"] = { "Eyes" },
    ["unpaintable_parts"] = {
        "RightLowerArm",
        "LeftLowerArm",
        "Head",
        "LeftHand",
        "RightHand"
    }
}
v2.dolls_2023_river = v5
local v6 = {
    ["name"] = "Wrapped Doll",
    ["image"] = "rbxassetid://13936755787",
    ["model"] = "Dolls2023WrappedDoll",
    ["rarity"] = "legendary",
    ["cost"] = 900,
    ["origin_entry"] = {
        ["origin"] = "Dolls",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_egg"] = true,
    ["is_doll"] = true,
    ["is_customizable"] = false,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6,
    ["hold_double_offset"] = CFrame.new(0, 0, 0.5),
    ["hold_offset"] = CFrame.new(0, -0.5, 0)
}
v2.dolls_2023_wrapped_doll = v6
return v1(v2)