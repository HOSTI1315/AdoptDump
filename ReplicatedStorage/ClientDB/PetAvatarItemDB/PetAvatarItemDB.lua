--// ReplicatedStorage.ClientDB.PetAvatarItemDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("package:Sift")
local v_u_4 = {}
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = {
    ["common"] = {},
    ["uncommon"] = {},
    ["rare"] = {},
    ["ultra_rare"] = {},
    ["legendary"] = {}
}
function v_u_4.get_entry_by_id(p9)
    return v_u_6[p9]
end
function v_u_4.get_category_by_id(p10)
    return v_u_7[p10]
end
function v_u_4.get_all_accessories_of_rarity(p11)
    return v_u_8[p11] or {}
end
function v_u_4.find_accessory_kinds_with_tags(p12)
    local v13 = {}
    for v14, v15 in v_u_6 do
        local v16 = v15.tags or {}
        local v17 = true
        for _, v18 in p12 do
            if not table.find(v16, v18) then
                v17 = false
                break
            end
        end
        if v17 then
            table.insert(v13, v14)
        end
    end
    return v13
end
function v_u_4.find_accessory_entries_with_tags(p19)
    local v20 = v_u_4.find_accessory_kinds_with_tags(p19)
    return v_u_3.Dictionary.map(v20, function(p21)
        return v_u_6[p21], p21
    end)
end
function v_u_4.init()
    for v22, v23 in pairs(v_u_2.pet_accessories) do
        if not v_u_5[v23.accessory_type] then
            v_u_5[v23.accessory_type] = {}
        end
        if not v_u_5[v23.accessory_type][v23.sort_group] then
            v_u_5[v23.accessory_type][v23.sort_group] = {}
        end
        v_u_5[v23.accessory_type][v23.sort_group][v22] = v23
        v_u_6[v22] = v23
        v_u_7[v22] = v23.accessory_type
        local v24 = v_u_8[v23.rarity]
        table.insert(v24, v22)
    end
end
v_u_4.items = v_u_5
v_u_4.items_by_kind = v_u_6
return v_u_4