--// ReplicatedStorage.ClientDB.DeveloperProductCallbacks (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_67 = {
    ["registered_items_tracebacks"] = {},
    ["developer_product_only_items_sets"] = {
        ["pets"] = {}
    },
    ["BREAK"] = newproxy(),
    ["currency"] = function(p2, p3, p4, p5)
        local v6 = v_u_1("DataM")
        local v7 = v_u_1("ServerRouter")
        local v8 = v6.get_store(p2)
        v_u_67.award_currency(p3.reward_type, p3.reward_amount)(p2)
        v8:set("currency_ready_to_sprout", (p4 >= 700 or v8:get("currency_ready_to_sprout") == "large") and "large" or "medium")
        v7.get("ProductsAPI/CurrencyPurchaseComplete"):FireClient(p2, p5)
    end,
    ["award_currency"] = function(p_u_9, p_u_10)
        return function(p11)
            local v12 = v_u_1("AltCurrencyData")
            local v13 = v_u_1("new:CurrencyServer")
            if p_u_9 == "bucks" then
                local v14 = p_u_10
                v13.modify_bucks(p11, p_u_10, "DevProduct", tostring(v14) .. "Bucks")
            elseif p_u_9 == v12.name then
                local v15 = p_u_10
                v13.modify(v12.name, p11, p_u_10, "DevProduct", tostring(v15) .. v12.human_readable)
            end
        end
    end,
    ["dialog"] = function(p_u_16)
        return function(p17)
            if not game:GetService("RunService"):IsStudio() then
                local v18 = {
                    ["text"] = p_u_16,
                    ["button"] = "Awesome!"
                }
                v_u_1("MsgBridge").dialog(p17, v18)
            end
        end
    end,
    ["new_items_dialog"] = function()
        return v_u_67.dialog("Your new items are now in your inventory")
    end,
    ["new_house_dialog"] = function()
        return v_u_67.dialog("Your house has been upgraded!")
    end,
    ["add_item"] = function(p_u_19, p_u_20, p_u_21, p22)
        local v23 = p22 or {}
        if not v_u_67.registered_items_tracebacks[p_u_19] then
            v_u_67.registered_items_tracebacks[p_u_19] = {}
        end
        v_u_67.registered_items_tracebacks[p_u_19][p_u_20] = debug.traceback(nil, 2)
        if not v23.is_available_for_bucks and v_u_67.developer_product_only_items_sets[p_u_19] then
            v_u_67.developer_product_only_items_sets[p_u_19][p_u_20] = true
        end
        return function(p24)
            local v25 = v_u_1("DataM")
            local v26 = v_u_1("InventoryDB")
            local v27 = v25.get_store(p24)
            local v28 = v27:get("inventory")
            local v_u_29 = v27:get("equip_manager")
            local v30 = v_u_1("ShopServer")
            local v31 = v_u_1("new:PurchaseContext")
            local v32 = {
                ["serial_number"] = v31.get(p24, "serial_number"),
                ["limiteds_campaign"] = v31.get(p24, "limiteds_campaign")
            }
            local v33 = v26[p_u_19][p_u_20]
            local v_u_34 = v28:add_item(v33, v32)
            v30.equip_pre_equipped_pet_accessories(p24, v_u_34)
            if p_u_21 then
                local v35, v36 = pcall(function()
                    v_u_29:equip(v_u_34)
                end)
                if not v35 then
                    warn((("Failed to equip item %* during purchase because: %*"):format(p_u_20, v36)))
                    v_u_1("MsgBridge").dialog(p24, {
                        ["text"] = ("You purchased a %*, but you can\'t equip it right now! It\'s safely stored in your inventory for later."):format(v33.name),
                        ["button"] = "Okay"
                    })
                end
            end
            local v37 = {
                ["name"] = "item_purchased_with_robux",
                ["player"] = p24,
                ["options"] = {
                    ["item_kind"] = p_u_20,
                    ["item_category"] = p_u_19
                }
            }
            v_u_1("NotificationManager").indicate_event(v37)
            return v_u_34
        end
    end,
    ["add_many_items"] = function(p_u_38, p_u_39, p_u_40, p_u_41)
        return function(p42)
            local v43 = v_u_1("DataM")
            local v44 = v_u_1("InventoryDB")
            local v45 = v43.get_store(p42)
            local v46 = v45:get("inventory")
            local v_u_47 = v45:get("equip_manager")
            local v48 = v_u_1("ShopServer")
            local v49 = v_u_1("new:PurchaseContext")
            local v50 = {
                ["serial_number"] = v49.get(p42, "serial_number"),
                ["limiteds_campaign"] = v49.get(p42, "limiteds_campaign")
            }
            local v51 = v44[p_u_38][p_u_39]
            local v_u_52 = nil
            for _ = 1, p_u_40 do
                v_u_52 = v46:add_item(v51, v50)
                v48.equip_pre_equipped_pet_accessories(p42, v_u_52)
            end
            if p_u_41 then
                local v53, v54 = pcall(function()
                    v_u_47:equip(v_u_52)
                end)
                if not v53 then
                    warn((("Failed to equip item %* during purchase because: %*"):format(p_u_39, v54)))
                    v_u_1("MsgBridge").dialog(p42, {
                        ["text"] = ("You purchased a %*, but you can\'t equip it right now! It\'s safely stored in your inventory for later."):format(v51.name),
                        ["button"] = "Okay"
                    })
                end
            end
            local v55 = {
                ["name"] = "item_purchased_with_robux",
                ["player"] = p42,
                ["options"] = {
                    ["item_kind"] = p_u_39,
                    ["item_category"] = p_u_38
                }
            }
            v_u_1("NotificationManager").indicate_event(v55)
            return v_u_52
        end
    end,
    ["add_potion"] = function(p_u_56, p_u_57, p_u_58)
        return function(p59)
            local v60 = v_u_67.add_item(p_u_56, p_u_57, p_u_58)(p59)
            local v61 = v_u_1("PotionTracker")
            v61.potion_gained(p59, v60.entry.kind, v60.unique_id, v61.SOURCES.PURCHASED)
        end
    end,
    ["add_house"] = function(p_u_62)
        return function(p63)
            local v64 = v_u_1("DataM").get_store(p63):get("house_manager")
            v64:spawn_house_in_background(v64:add_house({
                ["building_type"] = p_u_62
            }).house_id)
        end
    end,
    ["all"] = function(p_u_65)
        return function(...)
            for _, v66 in p_u_65 do
                if v66(...) == v_u_67.BREAK then
                    break
                end
            end
        end
    end
}
return v_u_67