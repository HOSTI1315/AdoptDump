--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TradeApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("RouterClient")
local v4 = v_u_1("Class")
local v_u_5 = v_u_1("XboxSupport")
local v_u_6 = v_u_1("TableUtil")
local v_u_7 = v_u_1("CountdownClock")
local v_u_8 = v_u_1("SharedConstants")
local v_u_9 = v_u_1("ServerType")
local v_u_10 = v_u_1("ItemDB")
local v_u_11 = v_u_1("PolicyHelper")
local v_u_12 = v_u_1("package:Promise")
local v_u_13 = v_u_1("CriticalSection")
local v_u_14 = v_u_1("ColorThemeManager")
local v_u_15 = v_u_1("PlatformM")
local v_u_16 = v_u_1("TweenPromise")
local v_u_17 = v_u_1("SettingsHelper")
local v_u_18 = v_u_1("FriendsClient")
local v_u_19 = v_u_1("GroupRankHelper")
local v_u_20 = v_u_1("package:Sift")
local v_u_21 = v_u_1("Spring")
local v_u_22 = v_u_1("Maid")
local v_u_23 = v_u_1("TradeExcluder")
local v_u_24 = v_u_1("BackpackLockTracker")
local v_u_25 = v_u_1("MuteHandler")
local v_u_26 = v_u_1("TradeLicenseHelper")
local v_u_27 = v_u_1("new:TestLabConfig")
local v_u_28 = v_u_1("KindDB")
local v_u_29 = v_u_1("StringUtil")
local v_u_30 = game:GetService("RunService")
local v_u_31 = game:GetService("GuiService")
local v_u_32 = game:GetService("TextChatService")
local v_u_33 = v_u_32:FindFirstChildOfClass("ChatInputBarConfiguration")
local v_u_34 = v_u_8.negotiation_lock_time
local v_u_35 = v_u_8.confirmation_lock_time_per_item
local v_u_36 = not v_u_32:CanUserChatAsync(game.Players.LocalPlayer.UserId)
local v_u_37 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v38 = v4("TradeApp", v_u_1("UIBaseApp"))
local v_u_39 = v_u_8.trade_spectate_reactions
local v_u_40 = v_u_8.quick_chat_phrases
local v_u_41 = true
for _, v42 in v_u_40 do
    v42.text = v_u_37:Translate(workspace, v42.text)
end
local v_u_43 = {}
local v44 = {
    ["compact"] = {
        ["CellPadding"] = UDim2.new(0, 5, 0, 5),
        ["CellSize"] = UDim2.new(0, 50, 0, 50)
    },
    ["loose"] = {
        ["CellPadding"] = UDim2.new(0, 6, 0, 6),
        ["CellSize"] = UDim2.new(0, 76, 0, 76)
    }
}
v_u_43.SlotsGridLayout = v44
local v45 = {
    ["compact"] = {
        ["PaddingTop"] = UDim.new(0, 5),
        ["PaddingBottom"] = UDim.new(0, 5),
        ["PaddingLeft"] = UDim.new(0, 5),
        ["PaddingRight"] = UDim.new(0, 5)
    },
    ["loose"] = {
        ["PaddingTop"] = UDim.new(0, 6),
        ["PaddingBottom"] = UDim.new(0, 6),
        ["PaddingLeft"] = UDim.new(0, 6),
        ["PaddingRight"] = UDim.new(0, 6)
    }
}
v_u_43.SlotsPadding = v45
v_u_43.TagScale = {
    ["compact"] = 0.6578947368421053,
    ["loose"] = 1
}
local v_u_46 = {}
local v47 = {
    ["compact"] = {
        ["CellPadding"] = UDim2.new(0, 4, 0, 4),
        ["CellSize"] = UDim2.new(0, 40, 0, 40)
    },
    ["loose"] = {
        ["CellPadding"] = UDim2.new(0, 6, 0, 6),
        ["CellSize"] = UDim2.new(0, 58, 0, 58)
    }
}
v_u_46.SlotsGridLayout = v47
local v48 = {
    ["compact"] = {
        ["PaddingTop"] = UDim.new(0, 3),
        ["PaddingBottom"] = UDim.new(0, 3),
        ["PaddingLeft"] = UDim.new(0, 3),
        ["PaddingRight"] = UDim.new(0, 3)
    },
    ["loose"] = {
        ["PaddingTop"] = UDim.new(0, 6),
        ["PaddingBottom"] = UDim.new(0, 6),
        ["PaddingLeft"] = UDim.new(0, 6),
        ["PaddingRight"] = UDim.new(0, 6)
    }
}
v_u_46.SlotsPadding = v48
v_u_46.TagScale = {
    ["compact"] = 0.6896551724137931,
    ["loose"] = 1
}
local v_u_49 = {
    ["common"] = 1,
    ["uncommon"] = 2,
    ["rare"] = 4,
    ["ultra_rare"] = 10,
    ["legendary"] = 26
}
local v_u_50 = {
    ["pets"] = 3,
    ["transport"] = 2,
    ["food"] = 0.25
}
local v_u_51 = {
    ["neon"] = 4,
    ["mega_neon"] = 16,
    ["flyable"] = 2,
    ["rideable"] = 2
}
function v38.promise_get_verified_status(_, p_u_52)
    return v_u_12.new(function(p53, _, _)
        for _, v54 in v_u_2.get_server(p_u_52, "player_tags") or {} do
            if v_u_19.get_icon_from_tag(v54) then
                p53(v54)
            end
        end
        if p_u_52 ~= game.Players.LocalPlayer and v_u_18.promise_get_is_friends_with(p_u_52.UserId):expect() then
            p53("friend")
        end
        p53(nil)
    end)
end
local function v_u_64(p55)
    local v56 = 0
    for _, v57 in ipairs(p55.items) do
        local v58 = v_u_49[v_u_10[v57.category][v57.kind].rarity] or 1
        local v59 = v_u_50[v57.category] or 1
        local v60 = 0
        for v61, v62 in pairs(v_u_51) do
            if v57.properties[v61] then
                v60 = v60 + v62
            end
        end
        local v63 = v60 == 0 and 1 or v60
        v56 = v56 + v58 * v59 * v63
    end
    return v56
end
local v_u_65 = false
function v38._confirm_player_if_suspicious(p66, p67)
    if p67.UserId < 0 then
        return true
    end
    if v_u_18.promise_get_is_friends_with(p67.UserId):expect() then
        return true
    end
    local v68 = v_u_18.get_friends():expect() or {}
    local v69 = p67.Name:lower()
    local v70 = false
    for _, v71 in v68.all do
        if v_u_29.distance_between(v69, v71.username:lower()) < 4 then
            v70 = true
            break
        end
    end
    return not v70 and true or p66.UIManager.apps.DialogApp:dialog({
        ["text"] = ("This player (%*) is not your friend!"):format(v69),
        ["dialog_type"] = "CaptchaDialog",
        ["exit_button"] = true,
        ["allow_retry"] = true
    }) == true
end
function v38._evaluate_trade_fairness(p72)
    local v73 = v_u_64(p72:_get_my_offer())
    local v74 = v_u_64(p72:_get_partner_offer())
    if v_u_9.use_test_lab_behavior() then
        p72:_show_experimental_warning()
    end
    if v73 < 10 and v74 < 10 then
        return
    elseif v74 / v73 > 3 then
        p72:_show_scam_perpetrator_warning()
    elseif v73 / v74 > 3 then
        p72:_show_scam_victim_warning()
    end
end
function v38._confirm_clear_colored_pets(p75)
    local v76 = {}
    for _, v77 in p75:_get_partner_offer().items do
        if v77 and (v77.properties and v77.properties.sealed_colors ~= nil) then
            local v78 = v_u_10[v77.category][v77.kind]
            local v79
            if v78 then
                v79 = v78.name
            else
                v79 = v78.kind
            end
            table.insert(v76, v79)
        end
    end
    if #v76 > 0 then
        for v80, v81 in v76 do
            v76[v80] = v_u_37:Translate(workspace, v81)
        end
        p75.UIManager.apps.DialogApp:dialog({
            ["text"] = ("Permanent Hair Spray for the following will be cleared:\n%s"):format(table.concat(v76, "\n")),
            ["button"] = "I understand",
            ["yields"] = false
        })
    end
end
function v38.is_last_pet(p82, p83, p84)
    if p83.category == "pets" then
        local v85 = p82:_get_local_trade_state() or {}
        local v86
        if game.Players.LocalPlayer == v85.sender then
            v86 = p82:_get_my_offer().items
        else
            v86 = nil
        end
        local v87 = v_u_2.get("inventory") or {}
        local v89 = v_u_20.Dictionary.filter(v87.pets or {}, function(p88)
            return not v_u_28[p88.kind].temporary
        end)
        if v86 then
            for _, v90 in v86 do
                v89[v90.unique] = nil
            end
        end
        if v_u_20.Dictionary.count(v89) <= 1 then
            if p84 then
                p82.UIManager.apps.DialogApp:dialog({
                    ["text"] = "You can\'t trade away your last pet!",
                    ["button"] = "Okay",
                    ["yield"] = false
                })
            end
            return true
        end
    end
    return false
end
function v38._show_experimental_warning(p91)
    local v92 = v_u_27.data_clearing.on and (v_u_27.data_clearing.seconds <= 3600 and " within the next hour" or (v_u_27.data_clearing.seconds <= 86400 and " within the next day" or (v_u_27.data_clearing.seconds <= 604800 and " within the next week" or ""))) or ""
    p91.UIManager.apps.DialogApp:dialog({
        ["text"] = ("This is the Test Lab. Your Test Lab items WILL BE DELETED AUTOMATICALLY%*. DO NOT trade Test Lab items for Adopt Me items; it is a bannable offense."):format(v92),
        ["button"] = "Okay",
        ["yields"] = false
    })
end
function v38._show_scam_victim_warning(p93)
    p93.UIManager.apps.DialogApp:dialog({
        ["text"] = "This trade seems unbalanced. Be careful - you could be getting scammed.",
        ["button"] = "Next",
        ["yields"] = false
    })
    p93.UIManager.apps.DialogApp:dialog({
        ["text"] = "Any items lost to scams WILL NOT be returned. Be sure before you accept!",
        ["button"] = "I understand",
        ["yields"] = false
    })
end
function v38._show_scam_perpetrator_warning(p94)
    p94.UIManager.apps.DialogApp:dialog({
        ["text"] = "This trade seems unbalanced. Remember, scamming and real world trading are BANNABLE!",
        ["button"] = "Next",
        ["yields"] = false
    })
end
function v38._set_confirmation_arrow_rotating(p_u_95, p96)
    if p96 then
        if not p_u_95.confirmation_arrow_rotation_connection then
            p_u_95.confirmation_arrow_rotation_connection = v_u_30.Heartbeat:connect(function(p97)
                p_u_95.confirmation_frame.TradeIcon.Rotation = p_u_95.confirmation_frame.TradeIcon.Rotation + 220 * p97
            end)
        end
    else
        p_u_95.confirmation_frame.TradeIcon.Rotation = 0
        if p_u_95.confirmation_arrow_rotation_connection then
            p_u_95.confirmation_arrow_rotation_connection:Disconnect()
            p_u_95.confirmation_arrow_rotation_connection = nil
        end
        return
    end
end
function v38._on_confirm_pressed(p98)
    v_u_3.get("TradeAPI/ConfirmTrade"):FireServer()
    local _, v99 = p98:_get_my_offer()
    local v100 = {
        [v99] = {
            ["confirmed"] = true
        }
    }
    p98:_change_local_trade_state(v100)
    p98:refresh_all()
end
function v38._get_trade_total_item_count(p101)
    local v102 = p101:_get_local_trade_state()
    return #v102.sender_offer.items + #v102.recipient_offer.items
end
function v38._get_lock_time(p103)
    if p103:_get_current_trade_stage() == "negotiation" then
        return v_u_34
    end
    local v104 = v_u_35 * p103:_get_trade_total_item_count()
    return math.clamp(v104, 5, 15)
end
function v38._lock_trade_for_appropriate_time(p105)
    p105.lock_countdown:stop()
    p105.lock_countdown:set_duration(p105:_get_lock_time())
    p105.lock_countdown:start()
end
function v38._on_unaccept_pressed(p106)
    v_u_3.get("TradeAPI/UnacceptNegotiation"):FireServer()
    if p106:_get_local_trade_state() then
        local _, v107 = p106:_get_my_offer()
        local v108 = {
            [v107] = {
                ["negotiated"] = false
            }
        }
        p106:_change_local_trade_state(v108)
        p106:refresh_all()
    end
end
function v38._on_accept_pressed(p109)
    v_u_3.get("TradeAPI/AcceptNegotiation"):FireServer()
    if p109:_get_local_trade_state() then
        local _, v110 = p109:_get_my_offer()
        local v111 = {
            [v110] = {
                ["negotiated"] = true
            }
        }
        p109:_change_local_trade_state(v111)
        p109:refresh_all()
    end
end
function v38._get_my_offer(p112)
    local v113 = p112:_get_local_trade_state()
    if p112.spectating or game.Players.LocalPlayer == v113.sender then
        return v113.sender_offer, "sender_offer"
    else
        return v113.recipient_offer, "recipient_offer"
    end
end
function v38._get_partner_offer(p114)
    local v115 = p114:_get_local_trade_state()
    if p114.spectating or game.Players.LocalPlayer == v115.sender then
        return v115.recipient_offer, "recipient_offer"
    else
        return v115.sender_offer, "sender_offer"
    end
end
function v38._get_current_trade_stage(p116)
    local v117 = p116:_get_local_trade_state()
    return v117 and v117.current_stage or nil
end
local function v_u_123(p118, p119)
    for v120, v121 in pairs(p119) do
        if type(v121) == "table" and p118[v120] then
            local v122 = p118[v120]
            if type(v122) ~= "table" then
                goto l4
            end
            v_u_123(p118[v120], p119[v120])
        else
            ::l4::
            p118[v120] = v121
        end
    end
    return p118
end
function v38._change_local_trade_state(p124, p125)
    p124:_overwrite_local_trade_state((v_u_123(p124:_get_local_trade_state(), p125)))
end
function v38._overwrite_local_trade_state(p126, p127)
    local v128 = p126:_get_local_trade_state()
    p126.local_trade_state = v_u_6.deep_copy(p127)
    p126:_on_local_trade_state_changed(v128, p127)
end
function v38._get_local_trade_state(p129)
    return v_u_6.deep_copy(p129.local_trade_state)
end
function v38._get_my_player(p130)
    local v131 = p130:_get_local_trade_state()
    if p130.spectating or game.Players.LocalPlayer == v131.sender then
        return v131.sender
    else
        return v131.recipient
    end
end
function v38._get_partner(p132)
    local v133 = p132:_get_local_trade_state()
    if p132.spectating or game.Players.LocalPlayer == v133.sender then
        return v133.recipient
    else
        return v133.sender
    end
end
function v38._show_intro_message(p134)
    local v135 = v_u_17.get_setting_client({
        ["setting_id"] = "trade_chat"
    })
    local v136
    if v135 == "All" or v135 == "Partner Only" then
        v136 = ("You\'re chatting with %s. This is a public chat that others can see."):format(p134:_get_partner().Name:lower())
    elseif v135 == "None" then
        v136 = "You currently have trade chat and Quick Replies disabled."
    elseif v135 == "Quick Replies" then
        v136 = "You currently have trade chat disabled, but Quick Replies will be displayed."
    else
        if v135 ~= "System Only" then
            warn((("Unexpected trade chat setting %*."):format(v135)))
            return
        end
        v136 = "You currently have messages from trading partners disabled. You will only see system messages."
    end
    p134:_render_message_in_trade_chat(nil, v136, false, true)
    if v135 == "Partner Only" then
        p134:_render_message_in_trade_chat(nil, "You currently have system messages disabled.", false, true)
    end
    p134:_render_message_in_trade_chat(nil, "You can change what trade chat you see in the Settings menu.", false, true)
end
function v38._update_spectator_count(p137, p138)
    local v139 = p138 and p138.subscriber_count or 0
    local v140 = p137.spectate_frame.SpectatorInfo.Count
    v140.Text = v139
    v140.Size = UDim2.fromOffset(v139 < 10 and 22 or 36, v140.Size.Y.Offset)
end
function v38._update_busy_indicators(p141, p142)
    local v143 = p142 and (p142.busy_indicators or {}) or {}
    local v144
    if p142 then
        v144 = p141:_get_partner().UserId
    else
        v144 = p142
    end
    p141.partner_negotiation_offer_pane:display_busy(v143[tostring(v144)])
    if p141.spectating then
        if p142 then
            p142 = p141:_get_my_player().UserId
        end
        p141.my_negotiation_offer_pane:display_busy(v143[tostring(p142)])
    end
end
function v38._on_local_trade_state_changed(p145, p146, p147)
    if p146 == nil or (p147 == nil or p147.trade_id ~= p146.trade_id) then
        p145:_toggle_chat_visibility(false)
        p145:_clear_chat()
        p145:_hide_speech_bubble()
        local v148
        if p147 then
            if p147.sender == game.Players.LocalPlayer then
                v148 = false
            else
                v148 = p147.recipient ~= game.Players.LocalPlayer
            end
        else
            v148 = p147
        end
        p145:_toggle_spectate(v148)
        if p147 then
            for _, v149 in p145.offer_panes do
                v149:reset_shown_items()
            end
            if not p145.spectating then
                p145:_show_intro_message()
            end
            p145.quick_chat_emojis:reset_cooldowns()
        end
    end
    p145:_update_busy_indicators(p147)
    p145:_update_spectator_count(p147)
    if p147 and not p146 then
        local v150 = p145:_get_my_offer()
        local v151 = p145:_get_partner_offer()
        if next(v150.items) or next(v151.items) then
            p145:_lock_trade_for_appropriate_time()
        end
    end
    if p146 ~= nil and (p147 ~= nil and p147.trade_id == p146.trade_id) then
        local v152
        if p146.current_stage == "negotiation" then
            v152 = p147.current_stage == "negotiation"
        else
            v152 = false
        end
        if v152 then
            local v153 = p145:_get_partner()
            local _, v154 = p145:_get_partner_offer()
            local v155 = {}
            for _, v156 in p146[v154].items do
                v155[v156.unique] = v156
            end
            local v157 = {}
            for _, v158 in p147[v154].items do
                v157[v158.unique] = v158
            end
            for v159, v160 in v155 do
                if not v157[v159] then
                    local v161 = nil
                    local v162 = "%* removed %*."
                    local v163 = v153.Name
                    local v164 = v_u_10[v160.category][v160.kind]
                    local v165
                    if v164 then
                        v165 = v164.name
                    else
                        v165 = v164.kind
                    end
                    p145:_render_message_in_trade_chat(v161, v162:format(v163, v165), true)
                end
            end
            for v166, v167 in v157 do
                if not v155[v166] then
                    local v168 = nil
                    local v169 = "%* added %*."
                    local v170 = v153.Name
                    local v171 = v_u_10[v167.category][v167.kind]
                    local v172
                    if v171 then
                        v172 = v171.name
                    else
                        v172 = v171.kind
                    end
                    p145:_render_message_in_trade_chat(v168, v169:format(v170, v172), true)
                end
            end
        end
        local v173
        if p146.offer_version == p147.offer_version then
            if p146.current_stage == "negotiation" then
                v173 = p147.current_stage == "confirmation"
            else
                v173 = false
            end
        else
            v173 = true
        end
        if v173 then
            p145:_lock_trade_for_appropriate_time()
        end
        if not p145.spectating and (p146.current_stage == "negotiation" and p147.current_stage == "confirmation") then
            p145:_evaluate_trade_fairness()
            p145:_confirm_clear_colored_pets()
        end
    end
end
function v38._remove_item_from_my_offer(p174, p175)
    if p175.category == "houses" then
        p174.UIManager.apps.HintApp:hint({
            ["text"] = "You can\'t remove this item.",
            ["length"] = 5,
            ["overridable"] = true
        })
    else
        v_u_3.get("TradeAPI/RemoveItemFromOffer"):FireServer(p175.unique)
        local v176, v177 = p174:_get_my_offer()
        local v178 = table.find(v176.items, p175)
        table.remove(v176.items, v178)
        local v179 = {
            [v177] = {
                ["items"] = v176.items
            }
        }
        p174:_change_local_trade_state(v179)
        p174:_lock_trade_for_appropriate_time()
        p174:refresh_all()
    end
end
function v38._local_player_meets_license_requirement_for_item(p180, p181)
    if v_u_26.entry_requires_trade_license(p181) then
        local v182 = p180:_get_local_trade_state()
        local _, v183 = p180:_get_my_offer()
        if v183 == "sender_offer" then
            return v182.sender_has_trade_license
        else
            return v182.recipient_has_trade_license
        end
    else
        return true
    end
end
local v_u_184 = {
    ["success"] = 1,
    ["retry"] = 2,
    ["fail"] = 3
}
function v38._add_item_to_my_offer(p_u_185)
    local v_u_186 = p_u_185.UIManager.apps.BackpackApp
    if not v_u_186:is_picking_item() then
        v_u_3.get("TradeAPI/ToggleBusyIndication"):FireServer({
            ["picking"] = true
        })
        local function v192()
            local v187 = v_u_186:pick_item({
                ["keep_cached_scroll_positions_on_open"] = true,
                ["allow_callback"] = function(_)
                    return true
                end
            })
            if v187 and v187.category == "stickers" then
                for _, v188 in (v_u_2.get("player_profile") or {}).pages or {} do
                    for _, v189 in v188.stickers or {} do
                        if v189.unique == v187.unique and p_u_185.UIManager.apps.DialogApp:dialog({
                            ["text"] = "This sticker is currently in use. Continue?",
                            ["left"] = "No",
                            ["right"] = "Yes"
                        }) ~= "Yes" then
                            return v_u_184.retry
                        end
                    end
                end
            end
            if v187 and not v_u_186:check_if_item_hidden(v187) then
                local v190 = v_u_10[v187.category][v187.kind]
                local v191 = v_u_1("ItemHider").is_item_tradeable(v190, v187)
                if v191 then
                    v191 = not v_u_24.is_locked(v187)
                end
                if v191 then
                    if p_u_185:is_last_pet(v187, true) then
                        return v_u_184.retry
                    else
                        return v_u_184.success, v187, v190
                    end
                else
                    p_u_185.UIManager.apps.DialogApp:dialog({
                        ["text"] = "You can\'t trade that item!",
                        ["button"] = "Okay",
                        ["yield"] = false
                    })
                    return v_u_184.retry
                end
            else
                return v_u_184.fail
            end
        end
        local v193 = nil
        local v194 = nil
        local v195, v196
        repeat
            local v197
            v197, v195, v196 = v192()
        until v197 ~= v_u_184.retry
        if v197 ~= v_u_184.success then
            v196 = v194
            v195 = v193
        end
        v_u_3.get("TradeAPI/ToggleBusyIndication"):FireServer({
            ["picking"] = false
        })
        if v195 and v196 then
            if not p_u_185:_local_player_meets_license_requirement_for_item(v196) then
                p_u_185.UIManager.apps.DialogApp:dialog({
                    ["text"] = v_u_26.FAILURE_MESSAGE,
                    ["button"] = "Okay"
                })
                p_u_185.should_prompt_safety_hub_navigation = true
                return
            end
            local v198
            if v_u_65 or v195.category ~= "pets" then
                v198 = false
            else
                v198 = (v195.properties.friendship_level or 0) > 0
            end
            if v198 then
                if p_u_185.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Note: Friendship Level will be reset to 0 when trading a pet away.",
                    ["left"] = "Cancel",
                    ["right"] = "Continue"
                }) == "Cancel" then
                    return
                end
                v_u_65 = true
            end
            v_u_3.get("TradeAPI/AddItemToOffer"):FireServer(v195.unique)
            local v199, v200 = p_u_185:_get_my_offer()
            local v201 = v_u_6.deep_copy(v199.items)
            table.insert(v201, v195)
            p_u_185:_change_local_trade_state({
                [v200] = {
                    ["items"] = v201
                }
            })
            p_u_185:_lock_trade_for_appropriate_time()
            p_u_185:refresh_all()
        end
    end
end
function v38._decline_trade(p202, p203)
    if not p203 then
        v_u_3.get("TradeAPI/DeclineTrade"):FireServer()
    end
    p202.lock_countdown:stop()
    p202:_overwrite_local_trade_state(nil)
    p202.UIManager.set_app_visibility(p202.ClassName, false)
end
function v38.prompt_safety_hub_navigation(p204)
    p204.should_prompt_safety_hub_navigation = false
    if p204.UIManager.apps.DialogApp:dialog({
        ["left"] = "Cancel",
        ["right"] = "Go!",
        ["text"] = "Travel to the Safety Hub to get your Trading License?"
    }) == "Go!" then
        p204.UIManager.apps.GuideArrowApp:navigate("TradeLicenseZone", nil, nil, false)
    end
end
function v38.check_and_warn_if_trading_restricted(p205)
    local v206, v207 = v_u_11.is_trading_prohibited(game.Players.LocalPlayer)
    if v206 then
        p205.UIManager.apps.DialogApp:dialog({
            ["text"] = v207,
            ["button"] = "Okay"
        })
    end
    if v_u_9.use_test_lab_behavior() and not v_u_27.allow_trading then
        p205.UIManager.apps.DialogApp:dialog({
            ["text"] = "Trading has been turned off for this Test Lab session.",
            ["button"] = "Okay"
        })
        v206 = true
    end
    return v206
end
function v38.show_scam_warning(p208)
    if v_u_41 then
        v_u_41 = false
        p208.UIManager.apps.DialogApp:dialog({
            ["text"] = "Be careful when trading - never trade items for Bucks or Robux! Only use the Trade menu to trade items, or you may get scammed. Stay safe!",
            ["button"] = "Okay"
        })
    end
end
function v38.show(p209)
    p209.UIManager.set_app_visibility("PlayerProfileApp", false)
    p209.instance.Frame.Visible = true
    p209:refresh_all()
    p209:_listen_for_typing(true)
    if not p209.spectating and v_u_9.use_test_lab_behavior() then
        p209:_show_experimental_warning()
    end
end
function v38.hide(p_u_210)
    p_u_210.instance.Frame.Visible = false
    p_u_210:_listen_for_typing(false)
    p_u_210:_cancel_infinite_confirmation_detection()
    p_u_210:_set_confirmation_arrow_rotating(false)
    p_u_210.UIManager.apps.BackpackApp:reset_hidden_item_tag(p_u_210.ClassName)
    if p_u_210.should_prompt_safety_hub_navigation == true then
        v_u_12.try(function()
            p_u_210:prompt_safety_hub_navigation()
        end)
    end
    p_u_210.my_negotiation_offer_pane:set_items({})
    p_u_210.my_confirmation_offer_pane:set_items({})
    p_u_210.partner_negotiation_offer_pane:set_items({})
    p_u_210.partner_confirmation_offer_pane:set_items({})
    p_u_210.negotiation_chat.InputFrame.TextboxGroup.TextBox:ReleaseFocus()
    p_u_210:_decline_trade()
    p_u_210:_show_friendship_border(false)
end
function v38._move_xbox_selection_between_negotiation_and_confirmation(p211)
    if v_u_31.SelectedObject then
        if p211.negotiation_frame.Visible == false and v_u_31.SelectedObject:IsDescendantOf(p211.negotiation_frame) then
            p211.watch:select_object(p211.confirmation_frame.Accept)
        elseif p211.confirmation_frame.Visible == false and v_u_31.SelectedObject:IsDescendantOf(p211.confirmation_frame) then
            p211.watch:select_object(p211.negotiation_body.Accept)
        end
    else
        return
    end
end
function v38._is_trade_empty(p212)
    local v213 = p212:_get_my_offer()
    local v214 = p212:_get_partner_offer()
    return 0 + #v213.items + #v214.items == 0
end
function v38._refresh_lock_related_ui(p215)
    if p215.lock_countdown:is_going() then
        local v216 = p215.lock_countdown:get_remaining_time()
        local v217 = math.ceil(v216)
        p215.negotiation_accept_button_label.Text = ("Accept (%d)"):format(v217)
        p215.negotiation_accept_button:set_state("unpressable")
        p215.confirmation_accept_button:set_state("unpressable")
        p215.confirmation_frame.TradeIcon.Countdown.Visible = true
        p215.confirmation_frame.LockIcon.Visible = not p215.spectating
        p215.negotiation_frame.Body.LockIcon.Visible = not p215.spectating
        p215.confirmation_frame.TradeIcon.Countdown.Text = tostring(v217)
        p215.confirmation_frame.TradeIcon.ImageTransparency = 0.7
        return
    elseif p215:_get_local_trade_state() then
        local v218 = p215:_get_my_offer()
        if not v218.negotiated then
            if p215:_is_trade_empty() then
                p215.negotiation_accept_button_label.Text = "Accept"
                p215.negotiation_accept_button:set_state("unpressable")
            else
                p215.negotiation_accept_button_label.Text = "Accept"
                p215.negotiation_accept_button:set_state("normal")
            end
        end
        if v218.confirmed then
            p215.confirmation_accept_button:set_state("unpressable")
        else
            p215.confirmation_accept_button:set_state("normal")
        end
        p215.confirmation_frame.TradeIcon.Countdown.Visible = false
        p215.confirmation_frame.LockIcon.Visible = false
        p215.negotiation_frame.Body.LockIcon.Visible = false
        p215.confirmation_frame.TradeIcon.ImageTransparency = 0
    end
end
function v38._start_infinite_confirmation_detection(p_u_219)
    if not p_u_219._debug_infinite_confirmation_promise then
        local v_u_220 = v_u_12.delay(30):andThen(function()
            v_u_3.get("ErrorReportAPI/TradeDebugStashInfiniteConfirmation"):FireServer()
        end)
        p_u_219._debug_infinite_confirmation_promise = v_u_220
        v_u_220:finally(function()
            if p_u_219._debug_infinite_confirmation_promise == v_u_220 then
                p_u_219._debug_infinite_confirmation_promise = nil
            end
        end)
    end
end
function v38._cancel_infinite_confirmation_detection(p221)
    if p221._debug_infinite_confirmation_promise then
        p221._debug_infinite_confirmation_promise:cancel()
    end
end
function v38._show_friendship_border(p222, p223)
    p222.instance.Frame.NegotiationFrame.FriendHighlight.Visible = p223
    p222.instance.Frame.NegotiationFrame.FriendBorder.Visible = p223
    local v224 = p222.instance.Frame.NegotiationFrame.Header.PartnerFrame
    v224.NameLabel.FriendLabel.Visible = p223
    local v225 = v_u_14.lookup(p223 and "background" or "saturated")
    v224.ProfileIcon.ImageColor3 = v225
    v224.NameLabel.TextColor3 = v225
end
function v38.refresh_all(p_u_226)
    if p_u_226:_get_local_trade_state() then
        local v227 = v_u_5.attempt_preserve_selection_on_recreation()
        local v228 = v_u_31.SelectedObject
        local v229 = p_u_226:_get_my_offer()
        local v230 = p_u_226:_get_partner_offer()
        local v_u_231 = p_u_226:_get_current_trade_stage()
        if v_u_231 == "negotiation" then
            p_u_226.negotiation_my_profile_icon.Visible = p_u_226.spectating
            p_u_226.negotiation_partner_profile_icon.Visible = true
            p_u_226.my_profile_button.instance.Visible = p_u_226.spectating
            p_u_226.instance.Frame.NegotiationFrame.Visible = true
            p_u_226.instance.Frame.ConfirmationFrame.Visible = false
            p_u_226.spectate_frame.Parent = p_u_226.negotiation_frame
            p_u_226.my_negotiation_offer_pane:set_items(v229.items)
            p_u_226.partner_negotiation_offer_pane:set_items(v230.items)
            if v229.negotiated then
                p_u_226.my_negotiation_offer_pane:set_accepted(true)
                p_u_226.negotiation_accept_button:set_state("selected")
                p_u_226.negotiation_accept_button_label.Text = "Unaccept"
            else
                p_u_226.my_negotiation_offer_pane:set_accepted(false)
                p_u_226.negotiation_accept_button:set_state("normal")
                p_u_226.negotiation_accept_button_label.Text = "Accept"
            end
            if v230.negotiated then
                p_u_226.partner_negotiation_offer_pane:set_accepted(true)
            else
                p_u_226.partner_negotiation_offer_pane:set_accepted(false)
            end
        elseif v_u_231 == "confirmation" then
            p_u_226.instance.Frame.NegotiationFrame.Visible = false
            p_u_226.instance.Frame.ConfirmationFrame.Visible = true
            p_u_226.spectate_frame.Parent = p_u_226.confirmation_frame
            p_u_226.my_confirmation_offer_pane:set_items(v229.items)
            p_u_226.partner_confirmation_offer_pane:set_items(v230.items)
            if v229.confirmed then
                p_u_226.my_confirmation_offer_pane:set_accepted(true)
                p_u_226.confirmation_accept_button:set_state("unpressable")
                p_u_226.confirmation_accept_button.instance.Face.TextLabel.Text = "Confirmed!"
            else
                p_u_226.my_confirmation_offer_pane:set_accepted(false)
                p_u_226.confirmation_accept_button.instance.Face.TextLabel.Text = "Confirm"
                p_u_226.confirmation_accept_button:set_state("normal")
            end
            if v230.confirmed then
                p_u_226.partner_confirmation_offer_pane:set_accepted(true)
            else
                p_u_226.partner_confirmation_offer_pane:set_accepted(false)
            end
        end
        if v229.confirmed and v230.confirmed then
            p_u_226:_set_confirmation_arrow_rotating(true)
            p_u_226.confirmation_decline_button:set_state("unpressable")
            p_u_226:_start_infinite_confirmation_detection()
        else
            p_u_226.confirmation_decline_button:set_state("cancel")
            p_u_226:_set_confirmation_arrow_rotating(false)
            p_u_226:_cancel_infinite_confirmation_detection()
        end
        p_u_226:_refresh_lock_related_ui()
        p_u_226.update_partner_icons_promise:cancel()
        p_u_226.update_my_icons_promise:cancel()
        local v232
        if v_u_15.get_platform() == v_u_15.platform.phone then
            v232 = p_u_226.spectating and 125 or 140
        else
            v232 = p_u_226.spectating and 195 or 220
        end
        if v230 then
            local v233 = v230.player_name
            p_u_226.negotiation_partner_name_label.Text = v233:lower()
            p_u_226.confirmation_partner_name_label.Text = v233:lower()
            p_u_226.negotiation_partner_name_label.Size = UDim2.new(0, v232, 1, 0)
            local v234 = p_u_226.negotiation_partner_name_label
            local v235 = UDim2.new
            local v236 = p_u_226.negotiation_partner_name_label.TextBounds.X
            v234.Size = v235(0, math.min(v232, v236), 1, 0)
            p_u_226.confirmation_partner_icon.Image = ""
            p_u_226.negotiation_partner_icon.Image = ""
            p_u_226.update_partner_icons_promise = p_u_226:promise_get_verified_status(p_u_226:_get_partner()):andThen(function(p237)
                local v238 = p237 and v_u_19.get_icon_from_tag(p237) or ""
                p_u_226.confirmation_partner_icon.Image = v238
                p_u_226.negotiation_partner_icon.Image = v238
                return v_u_18.promise_get_is_friends_with(p_u_226:_get_partner().UserId):andThen(function(p239)
                    local v240 = p_u_226
                    if p239 then
                        if v_u_231 == "negotiation" then
                            p239 = not p_u_226.spectating
                        else
                            p239 = false
                        end
                    end
                    v240:_show_friendship_border(p239)
                end)
            end)
        end
        local v241 = v229.player_name
        p_u_226.confirmation_my_name_label.Text = v241:lower()
        p_u_226.negotiation_my_name_label.Text = v241:lower()
        p_u_226.negotiation_my_name_label.Size = UDim2.new(0, v232, 1, 0)
        local v242 = p_u_226.negotiation_my_name_label
        local v243 = UDim2.new
        local v244 = p_u_226.negotiation_my_name_label.TextBounds.X
        v242.Size = v243(0, math.min(v232, v244), 1, 0)
        p_u_226.confirmation_my_icon.Image = ""
        p_u_226.negotiation_my_icon.Image = ""
        p_u_226.update_my_icons_promise = p_u_226:promise_get_verified_status(p_u_226:_get_my_player()):andThen(function(p245)
            local v246 = p245 and v_u_19.get_icon_from_tag(p245) or ""
            p_u_226.confirmation_my_icon.Image = v246
            p_u_226.negotiation_my_icon.Image = v246
        end)
        p_u_226.UIManager.apps.BackpackApp:reset_hidden_item_tag(p_u_226.ClassName)
        for _, v247 in ipairs(v229.items) do
            p_u_226.UIManager.apps.BackpackApp:set_item_unique_hidden(v247.unique, p_u_226.ClassName)
        end
        v227()
        local v248 = v228 and v228.Name == "AddItem" and p_u_226.my_negotiation_offer_pane:get_add_item_button_if_exists()
        if v248 then
            p_u_226.watch:select_object(v248)
        end
        p_u_226:_move_xbox_selection_between_negotiation_and_confirmation()
    else
        p_u_226:_cancel_infinite_confirmation_detection()
    end
end
function v38.get_negotiation_frame(p249)
    return p249.negotiation_frame
end
function v38.get_chat_message_template(p250)
    return p250.chat_message_template
end
function v38._send_chat_message_from_trade_chat(p251)
    local v252 = p251.negotiation_chat.InputFrame.TextboxGroup.TextBox
    if v252.Text ~= "" then
        local v253 = v252.Text
        if not v_u_36 then
            local v254 = v_u_32:FindFirstChild("TextChannels")
            if v254 then
                v254 = v254:FindFirstChild("RBXGeneral")
            end
            if v254 then
                v254:SendAsync(v253)
            end
        end
        v252.Text = ""
    end
end
function v38._set_unread_messages_count(p255, p256)
    local v257 = typeof(p256) == "number"
    assert(v257, "Count must be a number")
    if p256 > 99 then
        p255.negotiation_body.ChatToggle.UnreadCounter.TextLabel.Text = "99+"
    else
        p255.negotiation_body.ChatToggle.UnreadCounter.TextLabel.Text = p256
    end
    p255.negotiation_body.ChatToggle.UnreadCounter.Visible = p256 > 0
    p255.unread_chat_count = p256
end
function v38._toggle_chat_visibility(p258, p259)
    if p259 == nil then
        p259 = not p258.negotiation_chat.Visible
    end
    if p258.instance.Frame.Visible then
        if p259 then
            p258.watch:select_object(p258.negotiation_chat.InputFrame.TextboxGroup.TextBox)
        else
            p258.watch:select_object(p258.negotiation_body.ChatToggle)
        end
    end
    p258.negotiation_chat.InputFrame.QuickChatGroup.ChatFrame.Visible = false
    p258.negotiation_chat.Visible = p259
    if p259 then
        p258:_set_unread_messages_count(0)
        p258:_hide_speech_bubble()
    end
end
function v38._reset_chat_log_canvas_size(p260)
    p260.chat_scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, 10)
end
function v38._clear_chat(p261)
    p261:_reset_chat_log_canvas_size()
    for _, v262 in ipairs(p261.chat_scrolling_frame.Content:GetChildren()) do
        if v262:IsA("TextLabel") then
            v262:Destroy()
        end
    end
    p261:_set_unread_messages_count(0)
    p261.negotiation_chat.InputFrame.TextboxGroup.TextBox.Text = ""
end
function v38._fade_in_speech_bubble(p263, p264, p265)
    if p265 == nil then
        p265 = false
    end
    p263.speech_bubble.Size = UDim2.new(0, p263.speech_bubble_original_length, 0, p263.speech_bubble.Size.Y.Offset)
    p263.speech_bubble.Body.TextLabel.Text = p264
    p263.speech_bubble.Body.TextLabel.TextTransparency = 1
    p263.speech_bubble.ImageTransparency = 1
    p263.speech_bubble_system_message_marker.ImageTransparency = 1
    p263.speech_bubble.ClickToDismiss.Active = false
    p263.speech_bubble.Parent = p263.negotiation_body
    local v266 = p263.speech_bubble_text_original_length - p263.speech_bubble.Body.TextLabel.TextBounds.X
    p263.speech_bubble.Size = p263.speech_bubble.Size - UDim2.new(0, v266, 0, 0)
    if p265 then
        local v267 = UDim2.fromOffset(10, 0)
        local v268 = p263.speech_bubble
        v268.Size = v268.Size + v267
    end
    local v269 = TweenInfo.new(0.5)
    local v270 = v_u_12.all
    local v271 = {}
    local v272 = v_u_16.new(p263.speech_bubble, v269, {
        ["ImageTransparency"] = 0.1
    })
    local v273 = v_u_16.new(p263.speech_bubble.Body.TextLabel, v269, {
        ["TextTransparency"] = 0
    })
    local v274
    if p265 then
        v274 = v_u_16.new(p263.speech_bubble_system_message_marker, v269, {
            ["ImageTransparency"] = 0
        })
    else
        v274 = nil
    end
    __set_list(v271, 1, {v272, v273, v274})
    v270(v271):expect()
    p263.speech_bubble.ClickToDismiss.Active = true
end
function v38._fade_out_speech_bubble(p275)
    p275.speech_bubble.ClickToDismiss.Active = false
    local v276 = TweenInfo.new(0.5)
    v_u_12.all({ v_u_16.new(p275.speech_bubble, v276, {
            ["ImageTransparency"] = 1
        }), v_u_16.new(p275.speech_bubble.Body.TextLabel, v276, {
            ["TextTransparency"] = 1
        }), v_u_16.new(p275.speech_bubble_system_message_marker, v276, {
            ["ImageTransparency"] = 1
        }) }):expect()
    p275.speech_bubble.Parent = nil
end
function v38._create_speech_bubble(p_u_277, p_u_278, p_u_279)
    if not p_u_277.negotiation_chat.Visible then
        p_u_277.current_bubble_message = p_u_278
        task.spawn(function()
            p_u_277.speech_bubble_critical_section:run(function()
                if p_u_278 == p_u_277.current_bubble_message then
                    p_u_277:_fade_in_speech_bubble(p_u_278, p_u_279)
                    local v280 = os.clock()
                    while os.clock() - v280 < 6 and p_u_278 == p_u_277.current_bubble_message do
                        v_u_30.Heartbeat:wait()
                    end
                    p_u_277:_fade_out_speech_bubble()
                end
            end)
        end)
    end
end
function v38._hide_speech_bubble(p281)
    p281.current_bubble_message = nil
end
function v38._render_message_in_trade_chat(p282, p283, p284, p285, p286, p287)
    if not p282.spectating then
        p282:_destroy_typing_indicator()
        if p285 == nil then
            p285 = false
        end
        if p286 == nil then
            p286 = false
        end
        local v288 = p282.chat_scrolling_frame.CanvasSize.Y.Offset - p282.chat_scrolling_frame.AbsoluteSize.Y - p282.chat_scrolling_frame.CanvasPosition.Y
        local v289 = math.abs(v288) < 40
        local v290 = p283 == nil
        local v291 = not v290
        if v291 then
            v291 = p283 ~= game.Players.LocalPlayer
        end
        if not p286 then
            local v292 = v_u_17.get_setting_client({
                ["setting_id"] = "trade_chat"
            })
            if v292 == "None" then
                return
            end
            if v292 == "Quick Replies" then
                if not v290 and (v291 and not p287) then
                    return
                end
            elseif v292 == "System Only" then
                if v291 then
                    return
                end
            elseif v292 == "Partner Only" then
                if v290 then
                    return
                end
            elseif v292 ~= "All" then
                warn((("Unexpected trade chat setting %*."):format(v292)))
            end
        end
        local v293 = p282.chat_message_template:Clone()
        v293.Name = "ChatMessage"
        if v290 then
            local v294 = v_u_37:Translate(v293, p284)
            v293.Text = string.format("<i>%s</i>", v294)
            v293.AutoLocalize = false
        else
            v293.Text = string.format("<b>%s</b>: %s", p283.Name:lower(), p284)
            v293.AutoLocalize = false
        end
        if p283 == game.Players.LocalPlayer then
            v293.TextColor3 = Color3.fromRGB(106, 106, 106)
        end
        v293.Parent = p282.chat_scrolling_frame.Content
        local v295 = v293.TextBounds.Y
        v293.Size = UDim2.new(1, 0, 0, v295)
        p282.chat_scrolling_frame.CanvasSize = p282.chat_scrolling_frame.CanvasSize + UDim2.new(0, 0, 0, v295)
        if v289 then
            p282.chat_scrolling_frame.CanvasPosition = Vector2.new(0, p282.chat_scrolling_frame.CanvasSize.Y.Offset - p282.chat_scrolling_frame.AbsoluteSize.Y)
        end
        if p285 or v291 then
            p282:_create_speech_bubble(p284, v290)
            if not p282.negotiation_chat.Visible then
                p282:_set_unread_messages_count(p282.unread_chat_count + 1)
            end
        end
    end
end
function v38._listen_to_global_chat(p_u_296)
    v_u_32.MessageReceived:Connect(function(p297)
        local v298 = p297.TextSource
        if v298 then
            v298 = game.Players:GetPlayerByUserId(p297.TextSource.UserId)
        end
        local v299
        if v298 then
            if p297.Text:gsub("%s+", "") == "" then
                v299 = false
            else
                v299 = p_u_296:_get_local_trade_state()
            end
        else
            v299 = v298
        end
        if v299 and p297.TextSource.CanSend then
            if v298 == v299.sender then
                p_u_296:_render_message_in_trade_chat(v299.sender, p297.Text)
                return
            end
            if v298 == v299.recipient then
                p_u_296:_render_message_in_trade_chat(v299.recipient, p297.Text)
            end
        end
    end)
end
function v38._initialize_quick_chat(p_u_300)
    local v_u_301 = {}
    local v_u_302 = p_u_300.negotiation_chat.InputFrame.QuickChatGroup
    local v_u_303 = v_u_302.ChatFrame
    local v304 = v_u_36 and p_u_300.negotiation_chat.ChatDisabledQuickChatContainer or v_u_303.ButtonContainer
    local function v_u_306(p_u_305)
        if p_u_305 then
            v_u_303.Visible = true
        end
        return v_u_16.new(v_u_303.UIScale, TweenInfo.new(0.1), {
            ["Scale"] = p_u_305 and 1 or 0
        }):andThen(function()
            if not p_u_305 then
                v_u_303.Visible = false
            end
        end)
    end
    local function v311(p_u_307, p_u_308)
        p_u_307.Frame.ImageLabel.Rotation = 8
        if v_u_15.is_using_gamepad() then
            if not v_u_36 then
                game:GetService("ContextActionService"):BindAction("TradeQuickChatClose" .. p_u_308, function(_, p309)
                    if p309 == Enum.UserInputState.Begin then
                        v_u_306(not v_u_303.Visible)
                        p_u_300.watch:select_object(v_u_302.QuickChatOpen)
                    end
                end, false, Enum.KeyCode.ButtonB)
            end
            local v_u_310 = nil
            v_u_310 = v_u_31:GetPropertyChangedSignal("SelectedObject"):Connect(function()
                if v_u_31.SelectedObject ~= p_u_307 then
                    v_u_310:Disconnect()
                    p_u_307.Frame.ImageLabel.Rotation = 0
                    if not v_u_36 then
                        game:GetService("ContextActionService"):UnbindAction("TradeQuickChatClose" .. p_u_308)
                        if not table.find(v_u_301, v_u_31.SelectedObject) then
                            v_u_306(false)
                        end
                    end
                end
            end)
        end
    end
    v304.Visible = true
    p_u_300.negotiation_chat.InputFrame.Visible = not v_u_36
    local v_u_312 = (-1 / 0)
    local v313 = p_u_300.UIManager.wrap(v304, "EmojiGrid")
    local v318 = {
        ["icons"] = v_u_20.Dictionary.map(v_u_40, function(p314)
            return v_u_36 and p314.icon_large or p314.icon_small
        end),
        ["on_hover"] = v311,
        ["on_hover_end"] = function(p315)
            p315.Frame.ImageLabel.Rotation = 0
        end,
        ["mouse_button1_down"] = function(_, p316)
            if v_u_40[p316] then
                local v317 = v_u_17.get_setting_client({
                    ["setting_id"] = "trade_chat"
                })
                if v317 == "None" or v317 == "System Only" then
                    if tick() - v_u_312 > 4 then
                        v_u_312 = tick()
                        p_u_300:_render_message_in_trade_chat(nil, "You currently have Quick Replies disabled.", nil, true)
                    end
                else
                    v_u_3.get("TradeAPI/SendQuickChat"):FireServer(p_u_300:_get_partner(), p316)
                    p_u_300:_render_message_in_trade_chat(game.Players.LocalPlayer, v_u_40[p316].text, nil, nil, true)
                end
            else
                return false
            end
        end
    }
    local v319 = {
        ["up"] = p_u_300.negotiation_chat.ChatLog.ScrollComplex.ScrollingFrame
    }
    local v320
    if v_u_36 then
        v320 = nil
    else
        v320 = v_u_302.QuickChatOpen
    end
    v319.down = v320
    v319.left = nil
    v319.right = nil
    v318.next_selections = v319
    v318.cooldown_progression = v_u_8.trade_quick_chat_cooldown_progression
    p_u_300.quick_chat_emojis = v313:start(v318)
    local v_u_321 = p_u_300.quick_chat_emojis:get_emoji_buttons()
    if not v_u_36 then
        v_u_303:GetPropertyChangedSignal("Visible"):connect(function()
            if v_u_15.is_using_gamepad() then
                if v_u_303.Visible then
                    if v_u_321[1] then
                        v_u_302.QuickChatOpen.NextSelectionUp = v_u_321[1]
                        p_u_300.watch:select_object(v_u_321[1])
                        return
                    end
                else
                    v_u_302.QuickChatOpen.NextSelectionUp = p_u_300.negotiation_chat.ChatLog.ScrollComplex.ScrollingFrame
                end
            end
        end)
    end
    p_u_300.negotiation_chat:GetPropertyChangedSignal("Visible"):connect(function()
        if v_u_36 then
            p_u_300.negotiation_body.Accept.Visible = not p_u_300.negotiation_chat.Visible
            p_u_300.negotiation_body.Decline.Visible = not p_u_300.negotiation_chat.Visible
            if v_u_15.is_using_gamepad() and (p_u_300.negotiation_chat.Visible and v_u_321[1]) then
                p_u_300.watch:select_object(v_u_321[1])
            end
        end
        v_u_303.Visible = false
        v_u_303.UIScale.Scale = 0
    end)
    if not v_u_36 then
        v_u_302.QuickChatOpen.MouseButton1Down:Connect(function()
            v_u_306(not v_u_303.Visible)
        end)
        v_u_303.Size = UDim2.fromOffset(#v_u_40 * 45 + 35, v_u_303.AbsoluteSize.Y)
        p_u_300.negotiation_chat.InputFrame.TextboxGroup.TextBox.Focused:Connect(function()
            v_u_306(false)
        end)
    end
    v_u_303.Visible = false
    v_u_3.get("TradeAPI/QuickChatReceived").OnClientEvent:connect(function(p322, p323)
        if p_u_300:_get_partner() == p322 then
            p_u_300:_render_message_in_trade_chat(p322, v_u_40[p323].text, nil, nil, true)
        end
    end)
    p_u_300.chat_scrolling_frame.InputBegan:Connect(function(p324)
        if p324.UserInputType == Enum.UserInputType.MouseButton1 or p324.UserInputType == Enum.UserInputType.Touch then
            v_u_306(false)
        end
    end)
end
function v38._initialize_spectate(p_u_325)
    p_u_325:_toggle_spectate(false)
    local v326 = v_u_15.get_platform()
    if v326 == v_u_15.platform.phone or v326 == v_u_15.platform.tablet then
        p_u_325.spectate_frame.EmojiFrame.Size = UDim2.fromOffset(#v_u_39 * 35 + 5, 40)
    else
        p_u_325.spectate_frame.EmojiFrame.Size = UDim2.fromOffset(#v_u_39 * 48 + 8, 47)
    end
    local v_u_327 = {}
    local v_u_328 = p_u_325.spectate_frame.ReactionFrame
    local v_u_329 = v_u_328.ReactionTemplate
    v_u_329.Parent = nil
    v_u_328.Visible = true
    local function v_u_344(p330)
        if v_u_39[p330] then
            local v_u_331 = v_u_329:Clone()
            v_u_331.Image = v_u_39[p330]
            v_u_331.Parent = v_u_328
            v_u_331.ImageTransparency = 1
            v_u_331.Size = UDim2.fromScale(0, 0)
            v_u_16.new(v_u_331, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 0,
                ["Size"] = v_u_329.Size
            })
            local v332 = Random.new()
            local v_u_333 = v332:NextNumber(2, 3.5)
            local v_u_334 = v332:NextNumber(0.23, 0.29)
            local v_u_335 = v_u_333 * v332:NextNumber(0.65, 0.8)
            local v336 = v332:NextNumber(0.35, 0.45)
            local v337 = v332:NextNumber(1.1, 1.25)
            local v_u_338 = v_u_21.new(v336, v337, -0.5)
            v_u_338:set_goal(v332:NextNumber(0.1, 0.9))
            local v_u_339 = tick()
            v_u_327[v_u_331] = v_u_12.fromEvent(v_u_30.Heartbeat, function(p340)
                local v341 = tick() - v_u_339
                if v_u_333 <= v341 then
                    return true
                end
                v_u_338:update(p340)
                local v342 = v_u_331.Position.Y.Scale - v_u_334 * p340
                local v343 = v_u_338:get_position()
                v_u_331.Position = UDim2.fromScale(v343, v342)
                if v_u_335 <= v341 then
                    v_u_331.ImageTransparency = (v341 - v_u_335) / (v_u_333 - v_u_335)
                end
                return false
            end):finally(function()
                v_u_327[v_u_331] = nil
                v_u_331:Destroy()
            end)
        end
    end
    local v_u_348 = p_u_325.UIManager.wrap(p_u_325.spectate_frame.EmojiFrame.EmojiContainer, "EmojiGrid"):start({
        ["icons"] = v_u_39,
        ["on_hover"] = function(p345)
            p345.Frame.ImageLabel.Rotation = 8
        end,
        ["on_hover_end"] = function(p346)
            p346.Frame.ImageLabel.Rotation = 0
        end,
        ["mouse_button1_down"] = function(_, p347)
            v_u_344(p347)
            v_u_3.get("TradeAPI/ReactToTrade"):FireServer(p347)
        end,
        ["next_selections"] = {
            ["up"] = nil,
            ["down"] = p_u_325.spectate_frame.Close,
            ["left"] = p_u_325.spectate_frame.Close,
            ["right"] = nil
        },
        ["cooldown_progression"] = { 0.45 }
    })
    p_u_325.spectate_frame:GetPropertyChangedSignal("Visible"):connect(function()
        if v_u_15.is_using_gamepad() and p_u_325.spectate_frame.Visible then
            local v349 = v_u_348:get_emoji_buttons()
            if v349[1] and v349[1]:IsDescendantOf(game.Players.LocalPlayer.PlayerGui) then
                p_u_325.watch:select_object(v349[1])
            end
        end
        for _, v350 in v_u_327 do
            v350:cancel()
        end
    end)
    p_u_325.UIManager.wrap(p_u_325.spectate_frame.Close, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_325:_overwrite_local_trade_state(nil)
            p_u_325.UIManager.set_app_visibility(p_u_325.ClassName, false)
        end
    })
    v_u_3.get("TradeAPI/TradeReactedTo").OnClientEvent:connect(function(p351, p352)
        local v353 = p_u_325:_get_local_trade_state()
        if v353 and v353.trade_id == p351 then
            v_u_344(p352)
        end
    end)
    p_u_325.spectate_frame.Visible = true
end
function v38._toggle_spectate(p354, p355)
    if p354.spectating and not p355 then
        v_u_3.get("TradeAPI/SpectateTrade"):FireServer(false)
    end
    p354.spectating = p355
    p354.my_negotiation_offer_pane:toggle_ability_to_add_and_remove_items(not p354.spectating)
    p354.negotiation_body.Accept.Visible = not p354.spectating
    p354.negotiation_body.Decline.Visible = not p354.spectating
    local v356 = p354.negotiation_body.ChatToggle
    local v357 = not p354.spectating
    if v357 then
        v357 = v_u_15.get_platform() ~= v_u_15.platform.console
    end
    v356.Visible = v357
    p354.confirmation_frame.Accept.Visible = not p354.spectating
    p354.confirmation_frame.Decline.Visible = not p354.spectating
    p354.spectate_frame.Close.Visible = p354.spectating
    p354.spectate_frame.EmojiFrame.Visible = p354.spectating
    p354.speech_bubble.Parent = nil
end
function v38._listen_for_typing(p358, p359)
    if p358.typing_listener_maid then
        p358.typing_listener_maid:Destroy()
    end
    if p359 then
        local v_u_360 = false
        p358.typing_listener_maid = v_u_22.new()
        p358.typing_listener_maid:GiveTask(function()
            if v_u_360 ~= false then
                v_u_360 = false
                v_u_3.get("TradeAPI/ToggleTyping"):FireServer(v_u_360)
            end
        end)
        local v_u_361 = p358.negotiation_chat.InputFrame.TextboxGroup.TextBox
        p358.typing_listener_maid:GiveTask(v_u_361.Focused:Connect(function()
            local v362 = v_u_361.Text ~= ""
            if v_u_360 ~= v362 then
                v_u_360 = v362
                v_u_3.get("TradeAPI/ToggleTyping"):FireServer(v_u_360)
            end
        end))
        p358.typing_listener_maid:GiveTask(v_u_361:GetPropertyChangedSignal("Text"):Connect(function()
            local v363 = v_u_361.Text ~= ""
            if v_u_360 ~= v363 then
                v_u_360 = v363
                v_u_3.get("TradeAPI/ToggleTyping"):FireServer(v_u_360)
            end
        end))
        p358.typing_listener_maid:GiveTask(v_u_361.FocusLost:Connect(function()
            if v_u_360 ~= false then
                v_u_360 = false
                v_u_3.get("TradeAPI/ToggleTyping"):FireServer(v_u_360)
            end
        end))
        p358.typing_listener_maid:GiveTask(v_u_33:GetPropertyChangedSignal("IsFocused"):Connect(function()
            task.wait(0.1)
            local v364 = v_u_33.IsFocused
            if v_u_360 ~= v364 then
                v_u_360 = v364
                v_u_3.get("TradeAPI/ToggleTyping"):FireServer(v_u_360)
            end
        end))
    end
end
function v38._destroy_typing_indicator(p365)
    if p365.typing_indicator_label then
        local v366 = p365.typing_indicator_label.Size.Y.Offset
        p365.typing_indicator_label:Destroy()
        p365.typing_indicator_label = nil
        p365.chat_scrolling_frame.CanvasSize = p365.chat_scrolling_frame.CanvasSize - UDim2.new(0, 0, 0, v366)
    end
end
function v38._initialize_typing_indicator(p_u_367)
    local v368 = v_u_17.get_setting_client({
        ["setting_id"] = "trade_chat"
    })
    local v_u_369 = v368 == "All" and true or v368 == "Partner Only"
    v_u_17.promise_setting_changed_signal("trade_chat"):andThen(function(p370)
        p370:Connect(function(p371)
            v_u_369 = p371 == "All" and true or p371 == "Partner Only"
        end)
    end)
    local function v_u_376(p372, p373)
        local v374 = string.format("<b>%s</b> is typing", p372.Name:lower())
        local v375 = v_u_37:Translate(workspace, v374)
        for _ = 1, p373 do
            v375 = v375 .. "."
        end
        return string.format("<i>%s</i>", v375)
    end
    local function v_u_382(p377)
        local v378 = p_u_367.chat_scrolling_frame.CanvasSize.Y.Offset - p_u_367.chat_scrolling_frame.AbsoluteSize.Y - p_u_367.chat_scrolling_frame.CanvasPosition.Y
        local v379 = math.abs(v378) < 40
        local v380 = p_u_367.chat_message_template:Clone()
        v380.Name = "TypingMessage"
        v380.Text = v_u_376(p377, 0)
        v380.TextColor3 = Color3.fromRGB(150, 150, 150)
        v380.TextSize = 22
        v380.TextTransparency = 1
        v380.LayoutOrder = 1
        v380.Parent = p_u_367.chat_scrolling_frame.Content
        local v381 = v380.TextBounds.Y
        v380.Size = UDim2.new(1, 0, 0, v381)
        p_u_367.chat_scrolling_frame.CanvasSize = p_u_367.chat_scrolling_frame.CanvasSize + UDim2.new(0, 0, 0, v381)
        if v379 then
            p_u_367.chat_scrolling_frame.CanvasPosition = Vector2.new(0, p_u_367.chat_scrolling_frame.CanvasSize.Y.Offset - p_u_367.chat_scrolling_frame.AbsoluteSize.Y)
        end
        return v380
    end
    local v_u_383 = v_u_12.resolve()
    local v_u_384 = v_u_12.resolve()
    local v_u_385 = v_u_12.resolve()
    local v_u_386 = false
    v_u_3.get("TradeAPI/TypingToggled").OnClientEvent:connect(function(p_u_387, p388)
        if v_u_25.is_muted(p_u_387) then
            p388 = false
        end
        if v_u_386 == p388 then
            return
        else
            v_u_386 = p388
            if p388 and (v_u_369 and not v_u_36) then
                if not p_u_367.typing_indicator_label then
                    p_u_367.typing_indicator_label = v_u_382(p_u_387)
                    v_u_384 = v_u_12.new(function(_, _, p389)
                        local v390 = 0
                        while p_u_367.typing_indicator_label and not p389() do
                            v390 = v390 % 3 + 1
                            p_u_367.typing_indicator_label.Text = v_u_376(p_u_387, v390)
                            task.wait(0.8)
                        end
                    end)
                end
                if v_u_385:getStatus() ~= v_u_12.Status.Started then
                    v_u_385 = v_u_12.new(function(_, _, p391)
                        while true do
                            for v392 = 1, 3 do
                                local v393 = p_u_367.negotiation_body.ChatToggle.TypingIndicator:FindFirstChild(v392)
                                v_u_16.new(v393, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
                                    ["Size"] = UDim2.fromOffset(6, 6)
                                }):await()
                                task.wait(0.1)
                                if p391() then
                                    return
                                end
                            end
                        end
                    end)
                end
                local v_u_394 = p_u_367.typing_indicator_label
                local v395 = v_u_394.TextTransparency
                v_u_383:cancel()
                v_u_394.TextTransparency = v395
                local v_u_396 = 0
                v_u_383 = v_u_12.delay(0.15):andThen(function()
                    local v397 = {
                        ["TextTransparency"] = v_u_396
                    }
                    return v_u_16.new(v_u_394, TweenInfo.new(0.3), v397)
                end)
                return
            elseif p_u_367.typing_indicator_label then
                local v_u_398 = p_u_367.typing_indicator_label
                local v399 = v_u_398.TextTransparency
                v_u_383:cancel()
                v_u_398.TextTransparency = v399
                local v_u_400 = 1
                v_u_383 = v_u_12.delay(1):andThen(function()
                    local v401 = {
                        ["TextTransparency"] = v_u_400
                    }
                    return v_u_16.new(v_u_398, TweenInfo.new(0.3), v401)
                end)
                v_u_383:andThen(function()
                    v_u_384:cancel()
                    v_u_385:cancel()
                    p_u_367:_destroy_typing_indicator()
                end)
            else
                v_u_385:cancel()
            end
        end
    end)
end
function v38._create_system_message_marker(p402)
    local v403 = Instance.new("ImageLabel")
    v403.Name = "SystemMessageMarker"
    v403.BackgroundTransparency = 1
    v403.ImageTransparency = 1
    v403.BorderSizePixel = 0
    v403.Image = "rbxassetid://12198175963"
    v403.Size = UDim2.new(0, 40, 0, 40)
    v403.Position = UDim2.new(0, 8, 0, 8)
    v403.AnchorPoint = Vector2.new(0.5, 0.5)
    v403.Parent = p402.speech_bubble
    return v403
end
function v38.refresh(p404, p405)
    local v406 = p404.UIManager.is_closed({ "StickerRewardsApp" })
    if not p405[p404.ClassName] then
        v406 = false
    end
    p404:set_visibility(v406)
end
function v38.start(p_u_407)
    p_u_407.spectating = false
    p_u_407.confirmation_frame = p_u_407.instance.Frame.ConfirmationFrame
    p_u_407.negotiation_frame = p_u_407.instance.Frame.NegotiationFrame
    p_u_407.spectate_frame = p_u_407.instance.Frame.SpectateFrame
    p_u_407.negotiation_body = p_u_407.negotiation_frame.Body
    p_u_407.negotiation_chat = p_u_407.negotiation_frame.ChatFrame
    p_u_407.chat_scrolling_frame = p_u_407.negotiation_chat.ChatLog.ScrollComplex.ScrollingFrame
    p_u_407:_reset_chat_log_canvas_size()
    p_u_407.chat_message_template = p_u_407.chat_scrolling_frame.Content.MessageTemplate
    p_u_407.chat_message_template.Parent = nil
    p_u_407.speech_bubble = p_u_407.negotiation_body.SpeechBubble
    p_u_407.speech_bubble.Parent = nil
    p_u_407.speech_bubble_original_length = p_u_407.speech_bubble.Size.X.Offset
    p_u_407.speech_bubble_text_original_length = p_u_407.speech_bubble.Body.TextLabel.AbsoluteSize.X
    p_u_407.update_partner_icons_promise = v_u_12.resolve()
    p_u_407.update_my_icons_promise = v_u_12.resolve()
    local v408 = p_u_407.speech_bubble.Body
    v408.AnchorPoint = Vector2.new(1, 0)
    v408.Position = UDim2.new(1, -8, 0, 2)
    v408.TextLabel.TextXAlignment = Enum.TextXAlignment.Right
    p_u_407.speech_bubble_system_message_marker = p_u_407:_create_system_message_marker()
    p_u_407:_set_unread_messages_count(0)
    p_u_407.speech_bubble_critical_section = v_u_13.new()
    p_u_407.negotiation_partner_name_label = p_u_407.negotiation_frame.Header.PartnerFrame.NameLabel
    p_u_407.negotiation_my_name_label = p_u_407.negotiation_frame.Header.YouFrame.NameLabel
    p_u_407.negotiation_partner_icon = p_u_407.negotiation_frame.Header.PartnerFrame.Icon
    p_u_407.negotiation_my_icon = p_u_407.negotiation_frame.Header.YouFrame.Icon
    p_u_407.negotiation_my_profile_icon = p_u_407.negotiation_frame.Header.YouFrame.ProfileIcon
    p_u_407.negotiation_partner_profile_icon = p_u_407.negotiation_frame.Header.PartnerFrame.ProfileIcon
    p_u_407.my_profile_button = p_u_407.UIManager.wrap(p_u_407.negotiation_frame.Header.ProfileButtonMe, "CustomButton")
    p_u_407.my_profile_button:start({
        ["mouse_button1_click"] = function()
            local v409 = p_u_407:_get_my_player()
            if v409 then
                p_u_407.UIManager.apps.PlayerProfileApp:open_player_profile_for_user_id(v409.UserId)
            end
        end
    })
    p_u_407.partner_profile_button = p_u_407.UIManager.wrap(p_u_407.negotiation_frame.Header.ProfileButtonPartner, "CustomButton")
    p_u_407.partner_profile_button:start({
        ["mouse_button1_click"] = function()
            local v410 = p_u_407:_get_partner()
            if v410 then
                p_u_407.UIManager.apps.PlayerProfileApp:open_player_profile_for_user_id(v410.UserId)
            end
        end
    })
    p_u_407.confirmation_partner_name_label = p_u_407.confirmation_frame.PartnerLabel
    p_u_407.confirmation_my_name_label = p_u_407.confirmation_frame.YouLabel
    p_u_407.confirmation_partner_icon = p_u_407.confirmation_frame.PartnerIcon
    p_u_407.confirmation_my_icon = p_u_407.confirmation_frame.YouIcon
    p_u_407.negotiation_accept_button_label = p_u_407.negotiation_body.Accept.Face.TextLabel
    p_u_407.negotiation_trade_icon = p_u_407.negotiation_body.TradeIcon
    p_u_407.my_negotiation_offer_pane = p_u_407.UIManager.wrap(p_u_407.negotiation_body.MyOffer, "OfferPane"):start({
        ["num_condensed_slots"] = 4,
        ["num_slots"] = 18,
        ["should_tween_mobile_layout"] = true,
        ["mobile_layout_properties"] = v_u_43,
        ["can_add_and_remove_items"] = true,
        ["app"] = p_u_407,
        ["optional_xbox_tablet_parent_override"] = p_u_407.instance.Frame,
        ["force_display_post_trade_values"] = false
    })
    p_u_407.partner_negotiation_offer_pane = p_u_407.UIManager.wrap(p_u_407.negotiation_body.PartnerOffer, "OfferPane"):start({
        ["num_condensed_slots"] = 4,
        ["num_slots"] = 18,
        ["should_tween_mobile_layout"] = true,
        ["mobile_layout_properties"] = v_u_43,
        ["can_add_and_remove_items"] = false,
        ["app"] = p_u_407,
        ["optional_xbox_tablet_parent_override"] = p_u_407.instance.Frame,
        ["force_display_post_trade_values"] = true
    })
    p_u_407.my_confirmation_offer_pane = p_u_407.UIManager.wrap(p_u_407.confirmation_frame.MyOffer, "OfferPane"):start({
        ["num_condensed_slots"] = 4,
        ["num_slots"] = 18,
        ["should_tween_mobile_layout"] = false,
        ["mobile_layout_properties"] = v_u_46,
        ["can_add_and_remove_items"] = false,
        ["app"] = p_u_407,
        ["optional_xbox_tablet_parent_override"] = p_u_407.instance.Frame,
        ["force_display_post_trade_values"] = false
    })
    p_u_407.partner_confirmation_offer_pane = p_u_407.UIManager.wrap(p_u_407.confirmation_frame.PartnerOffer, "OfferPane"):start({
        ["num_condensed_slots"] = 4,
        ["num_slots"] = 18,
        ["should_tween_mobile_layout"] = false,
        ["mobile_layout_properties"] = v_u_46,
        ["can_add_and_remove_items"] = false,
        ["app"] = p_u_407,
        ["optional_xbox_tablet_parent_override"] = p_u_407.instance.Frame,
        ["force_display_post_trade_values"] = true
    })
    p_u_407.offer_panes = {
        p_u_407.my_negotiation_offer_pane,
        p_u_407.partner_negotiation_offer_pane,
        p_u_407.my_confirmation_offer_pane,
        p_u_407.partner_confirmation_offer_pane
    }
    p_u_407.my_negotiation_offer_pane:register_add_item_pressed_callback(function()
        p_u_407:_add_item_to_my_offer()
    end)
    p_u_407.my_negotiation_offer_pane:register_remove_item_pressed_callback(function(p411)
        p_u_407:_remove_item_from_my_offer(p411)
    end)
    p_u_407.negotiation_accept_button = p_u_407.UIManager.wrap(p_u_407.negotiation_body.Accept, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_407:_get_local_trade_state() then
                if p_u_407:_get_my_offer().negotiated then
                    p_u_407:_on_unaccept_pressed()
                else
                    p_u_407:_on_accept_pressed()
                end
            else
                return
            end
        end
    })
    p_u_407.confirmation_accept_button = p_u_407.UIManager.wrap(p_u_407.confirmation_frame.Accept, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_407:_on_confirm_pressed()
        end
    })
    local v412 = {
        ["mouse_button1_click"] = function()
            p_u_407:_decline_trade()
        end
    }
    p_u_407.negotiation_decline_button = p_u_407.UIManager.wrap(p_u_407.negotiation_body.Decline, "DepthButton"):start(v412)
    p_u_407.confirmation_decline_button = p_u_407.UIManager.wrap(p_u_407.confirmation_frame.Decline, "DepthButton"):start(v412)
    local v416 = {
        ["hover_render"] = function(p413)
            p413.Back.ImageColor3 = v_u_14.lookup("medium_light")
            p413.Front.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end,
        ["up_render"] = function(p414)
            p414.Back.ImageColor3 = v_u_14.lookup("saturated")
            p414.Front.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end,
        ["down_render"] = function(p415)
            p415.Back.ImageColor3 = v_u_14.lookup("background_light")
            p415.Front.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end,
        ["mouse_button1_click"] = function()
            p_u_407:_toggle_chat_visibility()
        end
    }
    p_u_407.UIManager.wrap(p_u_407.negotiation_body.ChatToggle, "CustomButton"):start(v416)
    p_u_407.UIManager.wrap(p_u_407.negotiation_chat.Header.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_407:_toggle_chat_visibility(false)
        end
    })
    p_u_407.negotiation_chat.InputFrame.TextboxGroup.TextBox.FocusLost:Connect(function(p417)
        if p417 then
            p_u_407:_send_chat_message_from_trade_chat()
            if v_u_15.get_platform() == v_u_15.platform.desktop then
                v_u_30.Heartbeat:Wait()
                p_u_407.negotiation_chat.InputFrame.TextboxGroup.TextBox:CaptureFocus()
            end
        end
    end)
    local v418 = {
        ["mouse_button1_click"] = function()
            p_u_407:_send_chat_message_from_trade_chat()
            if v_u_15.get_platform() == v_u_15.platform.desktop then
                p_u_407.negotiation_chat.InputFrame.TextboxGroup.TextBox:CaptureFocus()
            end
        end
    }
    p_u_407.UIManager.wrap(p_u_407.negotiation_chat.InputFrame.SubmitButton, "DepthButton"):start(v418)
    p_u_407:_listen_to_global_chat()
    p_u_407.speech_bubble.ClickToDismiss.MouseButton1Down:Connect(function()
        p_u_407:_hide_speech_bubble()
    end)
    p_u_407.lock_countdown = v_u_7.new()
    p_u_407.lock_countdown:on_tick(function()
        p_u_407:_refresh_lock_related_ui()
    end)
    p_u_407.lock_countdown:on_stopped(function()
        p_u_407:_refresh_lock_related_ui()
    end)
    v_u_2.register_callback_plus_existing("trade", function(_, p419, p420)
        if p419 == nil then
            p_u_407:_decline_trade(true)
        else
            p_u_407:_overwrite_local_trade_state(p419)
            p_u_407.UIManager.set_app_visibility(p_u_407.ClassName, true)
            p_u_407:refresh_all()
            if p_u_407.spectating and p420 == nil then
                p_u_407:_update_busy_indicators(p419)
            end
        end
    end)
    v_u_3.get_event("TradeAPI/TradeRequestReceived").OnClientEvent:connect(function(p421)
        if v_u_23.is_player_excluded(p421) then
            v_u_3.get("TradeAPI/AcceptOrDeclineTradeRequest"):InvokeServer(p421, false)
        else
            local v422 = p_u_407:promise_get_verified_status(p421):expect()
            local v423 = p_u_407.UIManager.apps.DialogApp
            local v424 = {
                ["text"] = string.format("%s sent you a trade request", p421.Name),
                ["left"] = "Decline",
                ["right"] = "Accept",
                ["center"] = v_u_23.is_player_exclusion_candidate(p421) and "Block" or nil,
                ["handle"] = "trade_request",
                ["dialog_type"] = v422 and "HeaderDialog"
            }
            local v425
            if v422 then
                v425 = "Verified " .. v422:sub(1, 1):upper() .. v422:sub(2)
            else
                v425 = v422
            end
            v424.header = v425
            if v422 then
                v422 = v_u_19.get_icon_from_tag(v422)
            end
            v424.header_icon = v422
            local v426 = v423:dialog(v424)
            local v427 = v426 == "Accept"
            if v427 then
                v427 = p_u_407:_confirm_player_if_suspicious(p421)
            elseif v426 == "Block" then
                v_u_23.confirm_and_exclude_player(p421)
            else
                v_u_23.trade_was_declined(p421)
            end
            if v427 and not p_u_407:check_and_warn_if_trading_restricted() then
                p_u_407:show_scam_warning()
            end
            v_u_3.get("TradeAPI/AcceptOrDeclineTradeRequest"):InvokeServer(p421, v427)
        end
    end)
    p_u_407:_initialize_quick_chat()
    p_u_407:_initialize_spectate()
    task.spawn(function()
        p_u_407:_initialize_typing_indicator()
    end)
    p_u_407.watch = v_u_5.quick_watch({
        ["selection_parent"] = p_u_407.instance.Frame,
        ["default_selection"] = function()
            local v428 = p_u_407:_get_current_trade_stage()
            if v428 and v428 ~= "confirmation" then
                if p_u_407.negotiation_chat.Visible then
                    return p_u_407.negotiation_chat.InputFrame.TextboxGroup.TextBox
                else
                    return p_u_407.my_negotiation_offer_pane:get_add_item_button_if_exists() or p_u_407.negotiation_body.Accept
                end
            else
                return p_u_407.confirmation_frame.Accept
            end
        end,
        ["app_name"] = p_u_407.ClassName,
        ["exit_buttons"] = { p_u_407.negotiation_chat.Header.ExitButton },
        ["close_override"] = function()
            if p_u_407:_get_current_trade_stage() ~= "negotiation" or not p_u_407.negotiation_chat.Visible then
                return true
            end
            p_u_407:_toggle_chat_visibility(false)
            return false
        end
    })
end
return v38