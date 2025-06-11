--// ReplicatedStorage.ClientDB.GamepassDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("ContentPackHelper")
local v2 = {
    ["vip"] = {
        ["name"] = "VIP",
        ["description"] = "+ VIP Room Access\n+ Exclusive Limo\n+ Exclusive House\n+ Golden Bone\n+ VIP Chat Tag\n+ 100 Bucks",
        ["layout_order"] = 2,
        ["cost"] = 750,
        ["id"] = 3196348
    },
    ["glider"] = {
        ["name"] = "Glider",
        ["description"] = "Fly into the skies with your very own Glider!",
        ["layout_order"] = 3,
        ["cost"] = 399,
        ["id"] = 3745845,
        ["hidden"] = true
    },
    ["starterpack"] = {
        ["name"] = "Starter Pack",
        ["description"] = "+ Family Home\n+ 200 Bucks\n+ Multi-Bike",
        ["detailed_description"] = "+ Family Home\n+ 200 Bucks\n+ Multi-Bike\n+ Only 99 Robux! (items worth 560 Robux)",
        ["layout_order"] = 1,
        ["cost"] = 99,
        ["id"] = 4785795,
        ["hidden"] = true
    },
    ["dj"] = {
        ["name"] = "DJ",
        ["description"] = "Play custom music at home using a Radio",
        ["layout_order"] = 6,
        ["cost"] = 350,
        ["id"] = 4796463,
        ["hidden"] = true
    },
    ["candy_cannon"] = {
        ["name"] = "Candy Cannon",
        ["description"] = "Launch free candy at friends",
        ["layout_order"] = 7,
        ["hidden"] = true,
        ["cost"] = 2000,
        ["id"] = 5246776
    },
    ["premium_plots"] = {
        ["name"] = "Premium Plots",
        ["description"] = "Move your home to any glowing space near the Nursery",
        ["layout_order"] = 5,
        ["cost"] = 449,
        ["id"] = 5300198
    },
    ["premium_faces"] = {
        ["name"] = "Premium Faces",
        ["description"] = "Use any premium face in Dress Up",
        ["layout_order"] = 8,
        ["cost"] = 199,
        ["id"] = 5704158,
        ["hidden"] = true
    },
    ["supercars_pack"] = {
        ["name"] = "Supercars Pack",
        ["description"] = "Unlocks 3 Legendary Supercars",
        ["layout_order"] = 4,
        ["cost"] = 1000,
        ["id"] = 5785139,
        ["hidden"] = true
    },
    ["millionaire"] = {
        ["name"] = "Millionaire Pack",
        ["description"] = "+ Millionaire Mansion\n+ Luxury Car",
        ["layout_order"] = -2,
        ["cost"] = 1250,
        ["id"] = 6040696,
        ["multiple_purchase_developer_product_id"] = 1206738654
    },
    ["celebrity"] = {
        ["name"] = "Celebrity Mansion",
        ["description"] = "+ Celebrity Mansion\n+ SUV",
        ["layout_order"] = -3,
        ["cost"] = 800,
        ["id"] = 6408694,
        ["multiple_purchase_developer_product_id"] = 1206739783
    },
    ["horse"] = {
        ["name"] = "Pet Horse",
        ["description"] = "Unlocks Pet Horse",
        ["layout_order"] = -5,
        ["cost"] = 300,
        ["id"] = 6558811,
        ["hidden"] = true
    },
    ["griffin"] = {
        ["name"] = "Legendary Pet Griffin",
        ["description"] = "Unlocks Legendary Pet Griffin",
        ["layout_order"] = -6,
        ["cost"] = 600,
        ["id"] = 6558813,
        ["hidden"] = true
    },
    ["modern_mansion"] = {
        ["name"] = "Modern Mansion",
        ["description"] = "Unlocks Modern Mansion",
        ["layout_order"] = -7,
        ["cost"] = 350,
        ["id"] = 6965379,
        ["multiple_purchase_developer_product_id"] = 1206741280
    },
    ["hotdog_stand"] = {
        ["name"] = "Hotdog Stand",
        ["description"] = "Sell Hotdogs to your friends to earn Bucks!",
        ["layout_order"] = -8,
        ["cost"] = 95,
        ["id"] = 7124470,
        ["multiple_purchase_developer_product_id"] = 723949993
    },
    ["lures_2023_cozy_home_lure"] = {
        ["name"] = "Cozy Home Lure",
        ["description"] = "Permanently unlocks a second lure for all of your houses.",
        ["layout_order"] = 0,
        ["cost"] = 1200,
        ["id"] = 189425850,
        ["unavailable_for_policy"] = {
            ["ArePaidRandomItemsRestricted"] = true
        }
    }
}
local v3 = {}
local v4 = {}
v1.merge("Gamepasses", v2)
v2.sale_data = nil
v2.original_prices = nil
v1.merge("Gamepasses", {
    ["sale_data"] = v3,
    ["original_prices"] = v4
}, true)
for v5, v6 in v3 do
    local v7 = v2[v5]
    assert(v7, ("Gamepass for sale %s does not exist."):format(v5))
    v7.original_cost = v4[v5] or v7.cost
    v7.cost = v6.cost
    v7.is_last_chance = v6.is_last_chance
end
for v8, v9 in v2 do
    v9.key = v8
end
return v2