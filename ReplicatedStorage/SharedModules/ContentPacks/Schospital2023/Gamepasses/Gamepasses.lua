--// ReplicatedStorage.SharedModules.ContentPacks.Schospital2023.Gamepasses (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("DeveloperProductCallbacks")
local v9 = {
    ["school_hospital_2023_gamepass"] = {
        ["name"] = "School and Hospital Homes",
        ["description"] = "Unlocks the Schoolhouse and Hospital homes!",
        ["layout_order"] = 0,
        ["cost"] = 510,
        ["id"] = 951065968,
        ["multiple_purchase_developer_product_id"] = 1511461476,
        ["obtain_first_time"] = v2.all({ function(p3)
                local v4 = v_u_1("DataM").get_store(p3)
                local v5 = v4:get("house_manager")
                local v6 = v5:add_house({
                    ["building_type"] = "hospital_house"
                })
                local v7 = v5:add_house({
                    ["building_type"] = "school_house"
                })
                local v8 = v4:get("recently_viewed_house_template")
                if v8 == "hospital_house" then
                    v5:spawn_house_in_background(v6.house_id)
                    return
                elseif v8 == "school_house" then
                    v5:spawn_house_in_background(v7.house_id)
                    return
                elseif math.random() > 0.5 then
                    v5:spawn_house_in_background(v6.house_id)
                else
                    v5:spawn_house_in_background(v7.house_id)
                end
            end, v2.new_house_dialog() })
    }
}
return v9