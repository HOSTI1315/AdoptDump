--// ReplicatedStorage.SharedModules.ContentPacks.PiB2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Wishing Star",
    ["image"] = "rbxassetid://10967650830",
    ["rarity"] = "rare",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["custom_tooltip_description"] = "Alas, the Wishing Stars\' light will not last for long, so don\226\128\153t hold onto them until it\226\128\153s too late!",
    ["displayed_rarity"] = "event",
    ["model_handle"] = "PiB2022WishingStar",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true,
    ["tool"] = "GenericTool"
}
v2.pib_2022_wishing_star = v3
return v1(v2)