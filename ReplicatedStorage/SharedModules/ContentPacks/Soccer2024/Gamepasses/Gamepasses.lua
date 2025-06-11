--// ReplicatedStorage.SharedModules.ContentPacks.Soccer2024.Gamepasses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks")
local v2 = {
    ["soccer_2024_soccer_house_gamepass"] = {
        ["name"] = "Soccer Stadium",
        ["description"] = "Unlocks the Soccer Stadium house!",
        ["layout_order"] = 0,
        ["cost"] = 550,
        ["id"] = 951395729,
        ["multiple_purchase_developer_product_id"] = 1865210793,
        ["obtain_first_time"] = v1.all({ v1.add_house("soccer_house"), v1.new_house_dialog() })
    }
}
return v2