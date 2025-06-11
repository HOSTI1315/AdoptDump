--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.Gamepasses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks")
local v2 = {
    ["fossil_isle_bundle_gamepass"] = {
        ["name"] = "Fossil Isle Returns Bundle",
        ["description"] = "Unlocks the Fossil Isle Returns Bundle!",
        ["layout_order"] = 0,
        ["cost"] = 800,
        ["id"] = 951441773,
        ["multiple_purchase_developer_product_id"] = 1809478887,
        ["obtain_first_time"] = v1.all({
            v1.add_item("transport", "fossil_2024_dinocar"),
            v1.add_house("dino_house"),
            v1.dialog("The Prehistoric Car is now in your inventory!"),
            v1.new_house_dialog()
        })
    }
}
return v2