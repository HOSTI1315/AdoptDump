--// ReplicatedStorage.ClientModules.Game.ShopM (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("InventoryDB")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("InteractionsEngine")
local v_u_7 = v1("AltCurrencyData")
v1("package:AB")
local v_u_8 = v1("Debug").create_log()
local v_u_9 = v1("TranslationHelper")
local v_u_10 = v1("FurnitureBlockerHelper")
local v_u_11 = v1("SharedConstants")
local v_u_12 = v1("new:StandardSequencePreviewClient")
local v_u_80 = {
    ["can_afford"] = function(p13, p14)
        local v15 = nil
        if p13 == "money" then
            v15 = v_u_2.get_server(game.Players.LocalPlayer, "money")
        elseif p13 == v_u_7.name then
            v15 = v_u_2.get_server(game.Players.LocalPlayer, v_u_7.name)
        end
        return p14 <= v15
    end,
    ["try_prompt_not_enough_money"] = function(p16, p17)
        local v18 = v_u_80.can_afford(p16, p17)
        if not v18 then
            if p16 == "money" then
                v_u_4.set_app_visibility("BucksPurchaseApp", true)
                return v18
            end
            if p16 == v_u_7.name then
                if v_u_7.purchasable then
                    v_u_4.set_app_visibility("AltCurrencyPurchaseApp", true)
                    return v18
                end
                v_u_4.apps.DialogApp:dialog({
                    ["text"] = "You can\'t afford this.",
                    ["button"] = "Okay"
                })
            end
        end
        return v18
    end,
    ["get_interaction_text"] = function(p19)
        if p19.cost == 0 then
            return "Take " .. p19.name
        end
        if p19.currency_id == nil or p19.currency_id == "money" then
            return v_u_9.format_by_key("ui.buy_item_price", {
                ["item"] = p19.name,
                ["cost"] = p19.cost
            })
        end
        if p19.currency_id == v_u_7.name and v_u_7.buy_icon then
            local v20 = {
                ["display_mode"] = "buy_with_icon",
                ["item_row_text"] = v_u_9.format_by_key("ui.buy_label_item", {
                    ["item"] = p19.name
                }),
                ["item_cost"] = p19.cost,
                ["icon"] = v_u_7.buy_icon
            }
            return v20
        end
        local v21 = string.format("%d <%s>", p19.cost, p19.currency_id)
        if p19.currency_id == v_u_7.name then
            v21 = string.format(v_u_7.interaction_format, p19.cost)
        end
        local v22 = v_u_9.format_by_key("ui.buy_label_item", {
            ["item"] = p19.name
        })
        return string.format("%s (%s)", v22, v21)
    end,
    ["pre_buy"] = function(p_u_23, p24)
        local v25 = p24 or {}
        local v26 = v25.prompt_not_enough_money
        local v27 = v25.prompt_not_enough_money_after_ask
        local v28 = v25.prompt_confirmation
        local v29 = string.format(v25.purchase_confirmation_message or "Buy for $%d?", p_u_23)
        local v30 = v25.pay_button_text or "Buy"
        local v_u_31 = v25.currency_id or "money"
        local v32 = 1
        local v33 = v26 == nil and true or v26
        if v28 == nil then
            v28 = false
        end
        if v33 and not (v27 or v_u_80.try_prompt_not_enough_money(v_u_31, p_u_23)) then
            return false
        else
            if v28 then
                local v34 = v25.entry
                if v34 then
                    v34 = v25.entry.kind
                end
                if v34 then
                    v34 = v25.entry.cost > 0
                end
                if v34 then
                    local v35 = v_u_2.get(v_u_31 or "money")
                    local v_u_36
                    if v_u_31 == v_u_7.name then
                        v_u_36 = v_u_7.human_readable or v_u_31
                    else
                        v_u_36 = v_u_31
                    end
                    local v37 = v_u_4.apps.DialogApp
                    local v38 = {
                        ["dialog_type"] = "CountDialog",
                        ["min"] = 1
                    }
                    local v39 = v35 / p_u_23
                    local v40 = math.floor(v39)
                    local v41 = v_u_11.bulk_purchase_limit
                    v38.max = math.clamp(v40, 1, v41)
                    local v42 = "Buy %* for %* each?"
                    local v43 = v25.purchase_name or v25.entry.name
                    local v44 = v25.entry.cost
                    local v45
                    if v_u_31 == nil or v_u_31 == "money" then
                        v45 = ("$%*"):format(v44)
                    else
                        v45 = ("%* %*"):format(v44, v_u_36)
                    end
                    v38.text = v42:format(v43, v45)
                    function v38.right(p46)
                        local v47 = "Buy (%*)"
                        local v48 = p46 * p_u_23
                        local v49
                        if v_u_31 == nil or v_u_31 == "money" then
                            v49 = ("$%*"):format(v48)
                        else
                            v49 = ("%* %*"):format(v48, v_u_36)
                        end
                        return v47:format(v49)
                    end
                    v32 = v37:dialog(v38)
                elseif v_u_4.apps.DialogApp:dialog({
                    ["left"] = "Cancel",
                    ["right"] = v30,
                    ["text"] = v29
                }) ~= v30 then
                    return false
                end
            end
            if v27 and not v_u_80.try_prompt_not_enough_money(v_u_31, p_u_23) then
                return false
            elseif v32 < 1 then
                return false
            else
                return true, v32
            end
        end
    end,
    ["buy_item"] = function(_, p50)
        v_u_8("Attempting to buy colored")
        local v51 = p50.category
        local v52 = p50.id
        local v53 = v_u_3[v51][v52]
        local v54 = v53.cost
        local v55 = v53.currency_id
        local v56 = p50.purchase_confirmation_message
        local v57 = p50.purchase_confirmation
        local v58 = p50.purchase_name or v53.name
        local v59 = p50.override_display_success_message
        local v60 = 1
        v_u_12.show_initial_purchase_disclosure_async(v52)
        if v57 == nil then
            v57 = v54 > 0
        end
        if not v56 and v58 then
            if v55 == nil or v55 == "money" then
                v56 = string.format("ui.buy_label_item_question_with_bucks [%s] [%d]", v58, v54)
            elseif v55 == v_u_7.name then
                v56 = string.format("ui.buy_label_item_question_with_alt_currency [%s] [%d] [%s]", v58, v54, v_u_7.human_readable)
            else
                v56 = string.format("ui.buy_label_item_question_with_alt_currency [%s] [%d] [%s]", v58, v54, v55)
            end
        end
        local v61 = p50.starter_color
        if v57 then
            local v62
            v62, v60 = v_u_80.pre_buy(v54, {
                ["entry"] = v53,
                ["prompt_confirmation"] = true,
                ["prompt_not_enough_money_after_ask"] = p50.prompt_not_enough_money_after_ask,
                ["purchase_confirmation_message"] = v56,
                ["currency_id"] = v55,
                ["purchase_name"] = v58
            })
            if not v62 then
                return
            end
        end
        local v63
        if v61 then
            v63 = v_u_4.apps.ColorPickerApp:pick_color({
                ["no_cancel"] = true,
                ["no_advanced"] = true,
                ["starter_color"] = v61
            })
            if v60 > 1 and not v_u_2.get("skip_bulk_color_items_confirmation") then
                local v64, v65 = v_u_4.apps.DialogApp:dialog({
                    ["dialog_type"] = "CheckboxDialog",
                    ["checkbox_text"] = "Do not show again this session",
                    ["text"] = "Are you sure? This color will be added to all items!",
                    ["left"] = "No",
                    ["right"] = "Yes"
                })
                if v65 then
                    v_u_2.update("skip_bulk_color_items_confirmation", true)
                end
                if v64 ~= "Yes" then
                    return
                end
            end
        else
            v63 = nil
        end
        local v66 = v_u_5.get("ShopAPI/BuyItem"):InvokeServer(v51, v52, {
            ["chosen_rgb"] = v63,
            ["buy_count"] = v60 or 1
        })
        if v66 == "success" and (v59 or (v51 == "transport" or v51 == "pet_accessories")) then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = "Purchase successful! Your " .. v58 .. " is now in your inventory!",
                ["button"] = "Okay"
            })
            return v66
        elseif v66 == "too many purchased" then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = "You can only get " .. (v_u_3[v51][v52].limit or "N/A") .. " of these!",
                ["button"] = "Okay"
            })
            return v66
        elseif v66 == "not for sale" then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = "This is not for sale.",
                ["button"] = "Okay"
            })
            return v66
        elseif v66 == "too many purchased in server" then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = "You can\'t get any more of these!",
                ["button"] = "Okay"
            })
            return v66
        elseif v66 == "inactive currency" then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = "This can\'t be purchased because the currency needed is no longer active.",
                ["button"] = "Okay"
            })
            return v66
        elseif v66 == "purchase limit reached" then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = "You\'ve reached the limit and can no longer buy this item",
                ["button"] = "Okay"
            })
            return v66
        elseif v66 == "all purchases disabled" then
            v_u_4.apps.DialogApp:dialog({
                ["text"] = "All purchases are temporarily disabled. Try again later!",
                ["button"] = "Okay"
            })
            return v66
        else
            if v66 == "item purchase disabled" then
                v_u_4.apps.DialogApp:dialog({
                    ["text"] = "This item is temporarily off sale. Try again later!",
                    ["button"] = "Okay"
                })
            end
            return v66
        end
    end,
    ["register_interaction"] = function(p_u_67, p68)
        local v_u_69 = (p68 or {}).pre_purchase
        local v70 = p_u_67.category
        assert(v70)
        local v71 = p_u_67.id
        assert(v71)
        v_u_8("shop_item.category is ", p_u_67.category)
        v_u_8("shop_item.id is ", p_u_67.id)
        local v72 = v_u_3[p_u_67.category][p_u_67.id]
        local v73 = p_u_67.id
        local v74 = p_u_67.category
        assert(v72, ("Item %s in category %s does not exist."):format(v73, v74))
        local v75 = v_u_6:register({
            ["text"] = p_u_67.text or v_u_80.get_interaction_text(v72),
            ["tag"] = p_u_67.category .. ":" .. p_u_67.id,
            ["on_selected"] = function()
                if v_u_69 then
                    v_u_69()
                end
                v_u_80.buy_item(p_u_67.part, p_u_67)
            end,
            ["part"] = p_u_67.part,
            ["offset"] = p_u_67.offset,
            ["horizontal_dist"] = p_u_67.horizontal_dist,
            ["is_visible"] = p_u_67.is_visible
        })
        v_u_10.protect_critical_interaction(v75)
        return v75
    end,
    ["register_interactions"] = function(p76)
        local v77 = {}
        for _, v78 in pairs(p76) do
            local v79 = v_u_80.register_interaction(v78)
            table.insert(v77, v79)
        end
        return v77
    end
}
return v_u_80