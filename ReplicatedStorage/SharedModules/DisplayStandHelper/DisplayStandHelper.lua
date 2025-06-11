--// ReplicatedStorage.SharedModules.DisplayStandHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v3 = v1("package:Sift")
local v_u_4 = game:GetService("RunService")
local v_u_13 = {
    ["pet"] = function(p5)
        return p5.category == "pets"
    end,
    ["pet_accessory"] = function(p6)
        return p6.category == "pet_accessories"
    end,
    ["stroller"] = function(p7)
        return p7.category == "strollers"
    end,
    ["holdable"] = function(p8)
        local v9 = v_u_2[p8.category][p8.kind]
        return (p8.category == "food" or p8.category == "toys" and v9.tool ~= "PlaceableTool") and true or p8.category == "gifts"
    end,
    ["vehicle"] = function(p10)
        local v11 = v_u_2[p10.category][p10.kind]
        local v12
        if p10.category == "transport" then
            v12 = not v11.is_roller_skates
        else
            v12 = false
        end
        return v12
    end
}
return {
    ["valid_display_types"] = v3.Dictionary.keys(v_u_13),
    ["is_item_valid_for_display_type"] = function(p14, p15)
        if p15.category == nil or p15.kind == nil then
            return false
        else
            local v16 = v_u_2[p15.category][p15.kind]
            if v16.temporary or v16.is_roleplay_item then
                return false
            elseif v_u_13[p14] then
                return v_u_13[p14](p15)
            else
                return false
            end
        end
    end,
    ["mapping_set_furniture_to_display_item"] = function(p17, p18, p19)
        local v20 = v_u_4
        assert(v20:IsServer())
        local v21 = p17:get("furniture_to_display_item_unique_map") or {}
        v21[p18] = p19
        p17:set("furniture_to_display_item_unique_map", v21)
    end,
    ["mapping_get_display_item_from_furniture"] = function(p22, p23)
        local v24 = v_u_4
        assert(v24:IsServer())
        local v25 = p22:get("furniture_to_display_item_unique_map")
        if v25 then
            return v25[p23]
        else
            return nil
        end
    end,
    ["mapping_remove_display_item_from_all_furniture"] = function(p26, p27)
        local v28 = v_u_4
        assert(v28:IsServer())
        local v29 = p26:get("furniture_to_display_item_unique_map")
        if v29 then
            for v30, v31 in pairs(v29) do
                if v31 == p27 then
                    v29[v30] = nil
                end
            end
            p26:set("furniture_to_display_item_unique_map", v29)
        end
    end,
    ["get_item_paths"] = function(p32, p33, p34)
        local v35 = {}
        if p32 == "pets" then
            table.insert(v35, { "Pets", p33 })
            return v35
        elseif p32 == "pet_accessories" then
            local v36 = { "PetAvatarResources", p34.model_handle }
            table.insert(v35, v36)
            return v35
        elseif p32 == "strollers" or (p32 == "food" or (p32 == "toys" or p32 == "gifts")) then
            local v37 = p34.model_handle
            if typeof(v37) ~= "string" then
                for _, v38 in p34.model_handle do
                    table.insert(v35, { "Holdables", v38 })
                end
                return v35
            end
            local v39 = { "Holdables", p34.model_handle }
            table.insert(v35, v39)
            return v35
        elseif p32 == "transport" then
            table.insert(v35, { "Vehicles", p33 })
            return v35
        else
            if p32 == "stickers" then
                table.insert(v35, { "Stickers", p33 })
            end
            return v35
        end
    end
}