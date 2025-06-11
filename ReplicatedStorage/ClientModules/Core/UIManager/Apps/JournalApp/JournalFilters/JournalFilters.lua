--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.JournalApp.JournalFilters (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("JournalCollectionData")
local v_u_3 = v_u_1("TranslationHelper")
local v_u_4 = v_u_1("InventoryDB")
local v_u_5 = v_u_1("TableUtil")
local v_u_6 = v_u_1("RarityDB")
local v_u_7 = v_u_1("package:Sift")
local v8 = {}
local function v_u_20(p9, p10)
    local v11 = {}
    local v12
    if p10.search then
        v12 = p10.search:lower()
    else
        v12 = nil
    end
    for _, v13 in p9 do
        for _, v14 in pairs(v_u_4[v13]) do
            local v15 = v_u_3.translate(workspace, v14.name):lower()
            if (not v12 or string.find(v15, v12)) and (not p10.additional_filter_callback or p10.additional_filter_callback(v14)) then
                local v16 = string.split(p10.group_by_path, "/")
                local v17 = v_u_5.get_from_path(v14, v16)
                if v17 and not (v14.temporary or (v14.unreleased or (v14.permanently_delete_all_copies_of_this_item_from_the_game or v14.permanently_delete_all_copies_of_this_item_when_db_entry_is_nil))) then
                    local v18 = v_u_1("ItemHider").is_item_tradeable(v14)
                    if v14.force_journal_visibility or (v18 or v_u_2.entry_is_in_collection(v14)) then
                        if not v11[v17] then
                            v11[v17] = {}
                        end
                        local v19 = v11[v17]
                        table.insert(v19, v14)
                    end
                end
            end
        end
    end
    return v11
end
local function v_u_25(p21)
    local v22 = {}
    for v23, v24 in pairs(p21) do
        table.insert(v22, {
            ["name"] = v23,
            ["entries"] = v24
        })
    end
    return v22
end
local function v_u_31(p26)
    for _, v27 in ipairs(p26) do
        if v27.entries then
            table.sort(v27.entries, function(p28, p29)
                local v30 = v_u_2.entry_is_in_collection(p28)
                if v30 == v_u_2.entry_is_in_collection(p29) then
                    if p28.category == "pets" and p28.is_egg ~= p29.is_egg then
                        return p29.is_egg
                    else
                        return p28.kind < p29.kind
                    end
                else
                    return v30
                end
            end)
        end
    end
end
function v8.get_filter_choices(p32)
    local v33 = { "Rarity", "Collected" }
    if p32 == "pets" then
        table.insert(v33, "Origin")
    end
    return v33
end
v8.rarity = {
    ["name"] = "Rarity",
    ["get_groups"] = function(p34, p35, p36)
        local v37 = v_u_20(p34, {
            ["search"] = p35,
            ["group_by_path"] = "rarity",
            ["additional_filter_callback"] = p36
        })
        local v38 = {}
        for _, v39 in pairs(v_u_6) do
            v38[v39.value] = {
                ["name"] = v39.name,
                ["entries"] = {}
            }
        end
        for v40, v41 in pairs(v37) do
            local v42 = v_u_6[v40]
            v38[v42.value] = {
                ["name"] = v42.name,
                ["entries"] = v41
            }
        end
        v_u_31(v38)
        return v38
    end
}
v8.origin = {
    ["name"] = "Origin",
    ["get_groups"] = function(p43, p44, p45)
        if table.find(p43, "pets") == nil then
            return {}
        end
        local v46 = v_u_25((v_u_20(p43, {
            ["search"] = p44,
            ["group_by_path"] = "origin_entry/full_origin",
            ["additional_filter_callback"] = p45
        })))
        table.sort(v46, function(p47, p48)
            return p47.name < p48.name
        end)
        v_u_31(v46)
        return v46
    end
}
v8.collected = {
    ["name"] = "Collected",
    ["get_groups"] = function(p49, p50, p51)
        local v52 = v_u_20(p49, {
            ["search"] = p50,
            ["group_by_path"] = "category",
            ["additional_filter_callback"] = p51
        })
        local v53 = v_u_25({
            ["Collected"] = v_u_7.Dictionary.flatten(v52, 1)
        })
        table.sort(v53, function(p54, p55)
            return p54.name < p55.name
        end)
        v_u_31(v53)
        return v53
    end
}
return v8