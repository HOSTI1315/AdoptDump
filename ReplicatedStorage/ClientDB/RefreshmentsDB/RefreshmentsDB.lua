--// ReplicatedStorage.ClientDB.RefreshmentsDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("InventoryDB")
local v3 = v1("ContentPackHelper")
local v4 = {
    ["lemonade_stand"] = {
        ["default_price"] = 10,
        ["max_price"] = 20,
        ["model_name"] = "LemonadeStand",
        ["refreshment_name"] = "Lemonade",
        ["refreshment_item"] = v2.food.lemonade
    },
    ["hotdog_stand"] = {
        ["default_price"] = 20,
        ["max_price"] = 50,
        ["model_name"] = "HotdogStand",
        ["refreshment_name"] = "Hotdog",
        ["refreshment_name_plural"] = "Hotdogs",
        ["refreshment_item"] = v2.food.hotdog
    },
    ["cotton_candy_stand"] = {
        ["default_price"] = 10,
        ["max_price"] = 20,
        ["model_name"] = "CottonCandyStand",
        ["refreshment_name"] = "Cotton Candy",
        ["refreshment_item"] = v2.food.cotton_candy_stick
    }
}
v3.merge("RefreshmentStands", v4)
for v5, v6 in v4 do
    v6.id = v5
end
return v4