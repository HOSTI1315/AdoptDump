--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.MerchantHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("NPCHelper")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("ItemHider")
local v5 = v_u_1("package:t")
local v_u_6 = v_u_1("package:Sift")
local v_u_7 = {
    ["tag"] = "Trader",
    ["icon"] = "rbxassetid://16798742362",
    ["theme_color"] = true
}
local v8 = v5.strictInterface({
    ["neon"] = v5.optional(v5.boolean),
    ["mega_neon"] = v5.optional(v5.boolean),
    ["flyable"] = v5.optional(v5.boolean),
    ["rideable"] = v5.optional(v5.boolean)
})
local v9 = v5.strictInterface
local v10 = {
    ["requirements"] = v5.array(v5.some(v5.strictInterface({
        ["requirement_type"] = v5.literal("rarity"),
        ["category"] = v5.string,
        ["rarity"] = v5.string,
        ["origin_item"] = v5.optional(v5.string),
        ["amount"] = v5.optional(v5.number),
        ["properties"] = v5.optional(v8)
    }), v5.strictInterface({
        ["requirement_type"] = v5.literal("kind"),
        ["category"] = v5.string,
        ["kind"] = v5.string,
        ["amount"] = v5.optional(v5.number),
        ["properties"] = v5.optional(v8)
    }))),
    ["rewards"] = v5.array(v5.strictInterface({
        ["category"] = v5.string,
        ["kind"] = v5.string,
        ["properties"] = v5.optional(v8)
    }))
}
local v_u_11 = v9(v10)
local v_u_12 = {
    ["flyable"] = "Flyable",
    ["rideable"] = "Rideable"
}
local v_u_13 = {
    ["neon"] = true,
    ["mega_neon"] = true
}
local v14 = {}
local function v_u_19(p15)
    local v16 = 1
    local v17 = {}
    for _, v18 in p15 do
        for _ = 1, v18.amount or 1 do
            v17[v16] = v_u_6.Dictionary.join(v18, {
                ["unique"] = ("r_%i"):format(v16),
                ["amount"] = v_u_6.None
            })
            v16 = v16 + 1
        end
    end
    return v17
end
local function v_u_25(p20)
    local v21 = {}
    for _, v22 in p20 do
        table.insert(v21, v22)
        local v23 = v_u_3[v22.category][v22.kind]
        if v23.category == "pets" and v23.pre_equipped_removable_accessories then
            for _, v24 in v23.pre_equipped_removable_accessories do
                table.insert(v21, {
                    ["kind"] = v24,
                    ["category"] = "pet_accessories"
                })
            end
        end
    end
    return v21
end
local function v_u_34(p_u_26, p27)
    if not p_u_26 then
        return false
    end
    if p_u_26.category ~= p27.category then
        return false
    end
    if p27.properties then
        if not p_u_26.properties then
            return false
        end
        if not v_u_6.Dictionary.every(p27.properties, function(p28, p29)
            return p_u_26.properties[p29] == p28
        end) then
            return false
        end
    end
    if p_u_26.properties then
        for v30, _ in v_u_13 do
            local v31 = p27.properties
            if v31 then
                v31 = p27.properties[v30]
            end
            if p_u_26.properties[v30] and not v31 then
                return false
            end
        end
    end
    if p27.requirement_type == "kind" then
        return p_u_26.kind == p27.kind
    end
    if p27.requirement_type == "rarity" then
        local v32 = v_u_3[p_u_26.category][p_u_26.kind]
        if v32.rarity ~= p27.rarity then
            return false
        end
        if p27.origin_item then
            local v33 = v32.origin_entry and v32.origin_entry.origin_items
            if v33 then
                v33 = v_u_6.List.contains(v32.origin_entry.origin_items, p27.origin_item)
            end
            if not v33 then
                return false
            end
        end
        return true
    end
    error("Requirement type not recognized: " .. p27.requirement_type)
end
local function v_u_40(p_u_35)
    local v36 = v_u_1("UIManager")
    local v38 = v36.apps.BackpackApp:pick_item({
        ["visible_backpack_categories"] = { p_u_35.category },
        ["allow_callback"] = function(p37)
            return v_u_34(p37, p_u_35)
        end,
        ["no_results_text"] = "You do not have the requested items."
    })
    if not v38 then
        return nil
    end
    local v39 = v_u_3[v38.category][v38.kind]
    if v_u_4.is_item_tradeable(v39, v38) then
        return v38
    end
    v36.apps.HintApp:hint({
        ["text"] = "This item is not tradeable.",
        ["length"] = 5,
        ["overridable"] = true
    })
    return nil
end
local function v_u_45(p41, p42)
    local v43 = v_u_1("UIManager")
    local v44 = v_u_12[p42]
    return v43.apps.DialogApp:dialog({
        ["dialog_type"] = "ItemPreviewDialog",
        ["item"] = p41,
        ["text"] = ("Add this %s pet to the offer?"):format(v44),
        ["right"] = "Add",
        ["left"] = "Cancel"
    }) ~= "Cancel"
end
function v14.MERCHANT(p46, p_u_47, p48)
    local v49 = v_u_11
    assert(v49(p_u_47))
    local v50 = next(p_u_47.requirements)
    assert(v50, "The merchant\'s trade must have at least one requirement.")
    local v51 = v_u_2.NPC_SIMPLE(p46, v_u_6.Dictionary.join(v_u_7, p48))
    local v_u_52 = v51.client_use
    v51.client_use = nil
    v51.dont_automatically_mark_furniture_change_after_use = true
    function v51.client_get_data_for_server_use()
        local v_u_53 = v_u_1("UIManager")
        local v_u_54 = v_u_1("ClientData")
        local v_u_55 = v_u_53.apps.MerchantApp
        v_u_52()
        if v_u_1("UIManager").apps.DialogApp:dialog({
            ["text"] = "Do you wish to trade?",
            ["left"] = "No",
            ["right"] = "Yes"
        }) == "Yes" then
            local v_u_56 = {}
            local v_u_57 = v_u_19(p_u_47.requirements)
            local v75 = v_u_55:display({
                ["rewards"] = v_u_25(p_u_47.rewards),
                ["requirements"] = v_u_57,
                ["pick_item"] = function(p58)
                    local v59 = v_u_40(p58)
                    if v59 then
                        for v60, _ in v_u_12 do
                            local v61 = v59.properties
                            if v61 then
                                v61 = v59.properties[v60]
                            end
                            local v62 = p58.properties
                            if v62 then
                                v62 = p58.properties[v60]
                            end
                            if v61 and not v62 then
                                if not v_u_45(v59, v60) then
                                    return
                                end
                                break
                            end
                        end
                        v_u_53.apps.BackpackApp:set_item_unique_hidden(v59.unique, "merchant")
                        v_u_56[p58.unique] = v59.unique
                        v_u_55:update_item_list(v_u_56)
                        local v_u_63 = v_u_56
                        local v64 = v_u_57
                        local function v_u_67(p65, p66)
                            return ((v_u_54.get("inventory") or {})[p66] or {})[p65]
                        end
                        local v_u_68 = {}
                        v_u_55:update_meets_requirements((v_u_6.Dictionary.every(v64, function(p69)
                            local v70 = v_u_63[p69.unique]
                            if v70 then
                                if v_u_68[v70] then
                                    return false
                                else
                                    v_u_68[v70] = true
                                    local v71 = v_u_67(v70, p69.category)
                                    if v71 then
                                        local v72 = v_u_3[v71.category][v71.kind]
                                        if v_u_4.is_item_tradeable(v72, v71) then
                                            return v_u_34(v71, p69)
                                        else
                                            return false
                                        end
                                    else
                                        return false
                                    end
                                end
                            else
                                return false
                            end
                        end)))
                    end
                end,
                ["remove_item"] = function(p73)
                    local v74 = v_u_56[p73.unique]
                    v_u_53.apps.BackpackApp:remove_item_unique_hidden(v74, "merchant")
                    v_u_56[p73.unique] = nil
                    v_u_55:update_item_list(v_u_56)
                    v_u_55:update_meets_requirements(false)
                end
            })
            v75:finally(function()
                v_u_53.apps.BackpackApp:reset_hidden_item_tag("merchant")
            end)
            if v75:expect() then
                return v_u_56
            else
                return nil
            end
        else
            return nil
        end
    end
    function v51.server_use(p_u_76, _, _, p_u_77)
        local v78 = v_u_1("DataM")
        local v79 = v_u_1("MsgBridge")
        local v_u_80 = v_u_1("SaveHelper")
        local v81 = v78.get_store(p_u_76)
        local v_u_82 = v81:get("inventory_manager")
        local v_u_83 = p_u_47.rewards
        local v84 = v_u_19(p_u_47.requirements)
        local function v_u_86(p85)
            return v_u_82:on_staged():get_item_copy(p85)
        end
        local v_u_87 = {}
        if v_u_6.Dictionary.every(v84, function(p88)
            local v89 = p_u_77[p88.unique]
            if v89 then
                if v_u_87[v89] then
                    return false
                else
                    v_u_87[v89] = true
                    local v90 = v_u_86(v89, p88.category)
                    if v90 then
                        local v91 = v_u_3[v90.category][v90.kind]
                        if v_u_4.is_item_tradeable(v91, v90) then
                            return v_u_34(v90, p88)
                        else
                            return false
                        end
                    else
                        return false
                    end
                end
            else
                return false
            end
        end) then
            local v_u_92 = {}
            local v_u_93 = {}
            local v105, v106 = pcall(function()
                local v104 = {
                    ["stage"] = function(_)
                        for _, v94 in p_u_77 do
                            v_u_82:on_staged():remove_item(v94)
                        end
                        for _, v95 in v_u_83 do
                            local v96 = v_u_82:on_staged():add_item({
                                ["category"] = v95.category,
                                ["kind"] = v95.kind,
                                ["properties"] = v95.properties or {}
                            })
                            local v97 = v_u_92
                            table.insert(v97, v96)
                            local v98 = v_u_3[v95.category][v95.kind]
                            if v98 and (v98.category == "pets" and v98.pre_equipped_removable_accessories) then
                                local v99 = {}
                                v_u_93[v96] = v99
                                for _, v100 in v98.pre_equipped_removable_accessories do
                                    local v101 = v_u_3.pet_accessories[v100].accessory_type
                                    v99[v101] = v99[v101] or {}
                                    local v102 = v99[v101]
                                    local v103 = v_u_82:on_staged()
                                    table.insert(v102, v103:add_item({
                                        ["category"] = "pet_accessories",
                                        ["kind"] = v100,
                                        ["properties"] = {}
                                    }))
                                end
                            end
                        end
                    end,
                    ["commit"] = function()
                        v_u_82:commit_staged()
                    end,
                    ["rollback"] = function()
                        v_u_82:rollback_staged()
                    end
                }
                v_u_80.transact({ v_u_80.main_file(p_u_76) }, v104)
            end)
            if v105 then
                v79.hint(p_u_76, {
                    ["text"] = "The trade was successful!",
                    ["length"] = 4
                })
                local v_u_107 = v81:get("equip_manager")
                local v108 = v81:get("inventory")
                local v_u_109 = v81:get("pet_saved_worn_items")
                local v110 = {}
                for _, v111 in v_u_92 do
                    local v112 = v108:get_item(v111)
                    if v112 then
                        table.insert(v110, v112)
                    end
                end
                for _, v_u_113 in v110 do
                    pcall(function()
                        if v_u_93[v_u_113.unique] then
                            local v114 = v_u_93[v_u_113.unique]
                            v_u_109:update_pet_worn_items(v_u_113.unique_id, v114)
                        end
                        v_u_107:equip(v_u_113)
                    end)
                end
            else
                v79.hint(p_u_76, {
                    ["text"] = "The trade unexpectedly failed",
                    ["length"] = 4
                })
                warn("Merchant Trade failed:", v106)
            end
        else
            v79.hint(p_u_76, {
                ["text"] = "The trade unexpectedly failed",
                ["length"] = 4
            })
            return false
        end
    end
    return v51
end
return v14