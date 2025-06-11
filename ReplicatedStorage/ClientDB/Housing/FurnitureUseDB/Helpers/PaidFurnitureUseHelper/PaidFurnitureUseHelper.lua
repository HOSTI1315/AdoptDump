--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.PaidFurnitureUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("PolicyHelper")
local v_u_3 = v_u_1("package:Promise")
local v4 = v_u_1("package:t")
local v_u_5 = v4.strictInterface({
    ["min_price"] = v4.optional(v4.number),
    ["max_price"] = v4.optional(v4.number),
    ["max_time"] = v4.optional(v4.number),
    ["on_purchase"] = v4.optional(v4.callback),
    ["pre_buy_options"] = v4.map(v4.string, v4.any),
    ["purchase_failed_message_key"] = v4.optional(v4.string)
})
local v_u_6 = {
    ["stand"] = "The stand has too many orders right now, come back later!",
    ["register"] = "This register seems overloaded right now! Try again later."
}
return {
    ["PAID_FURNITURE"] = function(p7, p8)
        local v_u_9 = p8 or {}
        local v10 = v_u_5
        assert(v10(v_u_9))
        local v_u_11 = v_u_9.min_price or 0
        local v_u_12 = v_u_9.max_price or 100
        local v_u_13 = v_u_9.max_time or nil
        local v_u_14 = v_u_9.pre_buy_options or {
            ["prompt_confirmation"] = true
        }
        local v_u_15 = p7.init
        local v_u_16 = p7.client_get_data_for_server_use
        local v_u_17 = p7.server_use
        local v_u_18 = p7.use_text
        p7.team_whitelist = { "Parents", "Pets" }
        p7.force_player = true
        function p7.get_additional_choices(p_u_19, p20)
            local v21 = {}
            if game.Players.LocalPlayer == p20 then
                table.insert(v21, {
                    ["text"] = "Set Price",
                    ["on_selected"] = function()
                        return p_u_19("set_price")
                    end
                })
            end
            return v21
        end
        function p7.use_text(p22, _, _, p23)
            return p22.price ~= 0 and game.Players.LocalPlayer ~= p23:get_house_owner() and {
                ["display_mode"] = "buy_with_icon",
                ["item_row_text"] = v_u_18,
                ["item_cost"] = ("$%*"):format(p22.price),
                ["icon"] = "rbxassetid://3577407233"
            } or v_u_18
        end
        function p7.init(p24, p25, p26, p27)
            if v_u_15 then
                v_u_15(p24, p25, p26, p27)
            end
            p24.price = p24.price or v_u_11
            if v_u_12 < p24.price then
                p24.price = v_u_12
            elseif p24.price < v_u_11 then
                p24.price = v_u_11
            end
        end
        function p7.client_get_data_for_server_use(p28, p29, p30, p31, p32, p33, p34)
            local v35 = v_u_1("UIManager")
            local v36 = v_u_1("ShopM")
            local v37 = p28.price
            if game.Players.LocalPlayer == p31 then
                if p34 == "set_price" then
                    local v38, v39 = v_u_1("PolicyHelper").is_trading_prohibited(game.Players.LocalPlayer)
                    if v39 then
                        v35.apps.DialogApp:dialog({
                            ["text"] = v39,
                            ["button"] = "Okay"
                        })
                    end
                    if v38 then
                        return nil
                    end
                    local v40, v41 = v35.apps.DialogApp:free_response_dialog({
                        ["text"] = ("Enter price (limit is $%*)"):format(v_u_12),
                        ["left"] = "Cancel",
                        ["right"] = "Set"
                    })
                    local v42 = tonumber(v41)
                    if v40 == "Set" then
                        if v42 then
                            return {
                                ["set_price"] = true,
                                ["price"] = v42
                            }
                        end
                        v35.apps.HintApp:hint({
                            ["text"] = "You can\'t set the price to that"
                        })
                    end
                    return nil
                end
            elseif v37 > 0 and not v36.pre_buy(v37, v_u_14) then
                return nil
            end
            local v43 = not v_u_16 and {} or v_u_16(p28, p29, p30, p31, p32, p33, p34)
            v43.expected_price = v37
            return v43
        end
        function p7.server_use(p44, p45, p46, p47, p48, p_u_49, p50, p51)
            local v_u_52 = v_u_1("CharacterWrapper")
            local v53 = v_u_1("MsgBridge")
            if p47 then
                local v54
                if p45.placeable then
                    v54 = p45.player
                else
                    v54 = p48
                end
                if p44 == v54 and p47.set_price then
                    local v55 = p47.price
                    local v56 = v_u_11
                    local v57 = v_u_12
                    local v58 = math.clamp(v55, v56, v57)
                    if v58 == p47.price then
                        p45.price = v58
                        p46()
                        v53.hint(p44, {
                            ["text"] = ("Price was set to $%*!"):format(v58)
                        })
                    else
                        v53.hint(p44, {
                            ["text"] = "You can\'t set the price to that"
                        })
                    end
                else
                    p45.occupied = p45.occupied or {}
                    if not p45.occupied[p50] then
                        if p44 ~= v54 and p45.price > 0 then
                            if p47.expected_price ~= p45.price then
                                v53.dialog(p44, {
                                    ["text"] = "The price at the stand has changed, try again!",
                                    ["button"] = "Okay"
                                })
                                return
                            end
                            local v59, v60 = v_u_2.is_trading_prohibited_between_players(p44, v54)
                            if v60 then
                                v53.dialog(p44, {
                                    ["text"] = v60,
                                    ["button"] = "Okay"
                                })
                            end
                            if v59 then
                                return
                            end
                            local v61 = v_u_1("PlayerToPlayerTransaction")
                            if not v61.player_can_make_transaction_with_owner(p44, v54) then
                                local v62 = {
                                    ["text"] = v_u_6[v_u_9.purchase_failed_message_key or "stand"],
                                    ["button"] = "Okay"
                                }
                                v53.dialog(p44, v62)
                                return
                            end
                            if not v61.pay_player(p44, v54, p45.price, "furniture_vendor", p45.id) then
                                return
                            end
                        end
                        if v_u_9.on_purchase then
                            v_u_9.on_purchase(p44, v54, p_u_49, p45)
                        end
                        local v63
                        if v_u_13 then
                            v63 = v_u_3.delay(v_u_13):andThen(function()
                                v_u_52.get(p_u_49).state_manager:exit_all_states("UseFurniture")
                            end)
                        else
                            v63 = nil
                        end
                        if v_u_17 then
                            v_u_17(p44, p45, p46, p47, p48, p_u_49, p50, p51)
                        end
                        if v63 then
                            v63:cancel()
                        end
                    end
                end
            else
                return
            end
        end
        return p7
    end
}