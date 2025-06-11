--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Bubble Wand",
    ["image"] = "rbxassetid://105171369454842",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "RattleHold"
    },
    ["model_handle"] = "Gibbon2025BubbleWand",
    ["tool"] = "GenericTool"
}
v2.gibbon_2025_bubble_wand = v3
local v4 = {
    ["name"] = "Bunting Leash",
    ["image"] = "rbxassetid://126371428383256",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["leash_style"] = "BuntingLeash",
    ["model_handle"] = "Gibbon2025BuntingLeash",
    ["tool"] = "PetLeash"
}
v2.gibbon_2025_bunting_leash = v4
local v5 = {
    ["name"] = "Circus Tent Propeller",
    ["image"] = "rbxassetid://110956965811189",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Gibbon2025CircusTentPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "BoneConstraintPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.gibbon_2025_circus_tent_propeller = v5
local v6 = {
    ["name"] = "Paper Plane Throw Toy",
    ["image"] = "rbxassetid://88309152882528",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Gibbon2025PaperPlaneThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.gibbon_2025_paper_plane_throw_toy = v6
local v7 = {
    ["name"] = "Ring of Fire Throwing Disc",
    ["image"] = "rbxassetid://113824061557146",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Gibbon2025RingOfFireThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.gibbon_2025_ring_of_fire_throwing_disc = v7
local v8 = {
    ["name"] = "Pluboneium Chew Toy",
    ["image"] = "rbxassetid://78466416428012",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Gibbon2025PluboneiumChewToy",
    ["tool"] = "ChewToyTool"
}
v2.gibbon_2025_pluboneium_chew_toy = v8
return v1(v2)