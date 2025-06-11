--// ReplicatedStorage.ClientDB.TaskBoard.QuestsDBHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("QuestFrameStyleDB")
local v_u_3 = v_u_1("InventoryDB")
v_u_1("AltCurrencyData")
local v4 = v_u_1("package:t")
local v_u_5 = v_u_1("package:Sift")
local v_u_6 = {}
local v7 = v4.strictInterface
local v8 = {
    ["entry_name"] = v4.string,
    ["name"] = v4.string,
    ["category"] = v4.string,
    ["rich_text"] = v4.optional(v4.boolean),
    ["plaintext_name"] = v4.optional(v4.string),
    ["frame_info"] = v4.interface({
        ["template"] = v4.string,
        ["style"] = v4.table
    }),
    ["step_type"] = v4.string,
    ["total_steps"] = v4.number,
    ["can_reroll"] = v4.boolean,
    ["can_step_time_quest"] = v4.optional(v4.callback),
    ["can_step_quest"] = v4.optional(v4.callback),
    ["contributes_to_quest_limit"] = v4.optional(v4.boolean),
    ["reward"] = v4.interface({
        ["quantity"] = v4.optional(v4.number),
        ["text"] = v4.optional(v4.string),
        ["text_color"] = v4.optional(v4.Color3),
        ["claim_text"] = v4.optional(v4.string),
        ["image"] = v4.optional(v4.union(v4.callback, v4.string)),
        ["image_size"] = v4.optional(v4.union(v4.callback, v4.UDim2)),
        ["is_clientside"] = v4.optional(v4.boolean),
        ["claimable_override"] = v4.optional(v4.callback),
        ["disable_reward_fanfare"] = v4.optional(v4.boolean),
        ["close_app_on_claim"] = v4.optional(v4.boolean),
        ["callback"] = v4.callback,
        ["is_alt_currency"] = v4.optional(v4.boolean)
    }),
    ["can_spawn_quest"] = v4.callback,
    ["quest_help_entry"] = v4.optional(v4.string),
    ["on_ui_step"] = v4.optional(v4.callback),
    ["is_visible"] = v4.optional(v4.callback),
    ["sort_override"] = v4.optional(v4.number),
    ["tags"] = v4.optional(v4.array(v4.string))
}
local v_u_9 = v7(v8)
function v_u_6.quest_entry_with_defaults(p10, p11)
    return v_u_5.Dictionary.merge({
        ["category"] = p10,
        ["step_type"] = "incremental",
        ["total_steps"] = 1,
        ["can_reroll"] = p10 ~= "tutorial_quests",
        ["contributes_to_quest_limit"] = true,
        ["can_spawn_quest"] = function(_)
            return true
        end,
        ["sort_override"] = 0
    }, p11, {
        ["frame_info"] = v_u_5.Dictionary.merge({
            ["style"] = v_u_2.daily_misc,
            ["template"] = "QuestTemplate"
        }, p11.frame_info)
    })
end
function v_u_6.assert_pretty(p12, p13)
    local v14, v15 = unpack(p12)
    local v16 = tostring(v15)
    return assert(v14, p13:gsub("{CAUSE}", v16))
end
function v_u_6.add_quests(p17, p18)
    local v19 = p17 ~= "all_quests"
    assert(v19, "Cannot use all_quests as a category (reserved name)")
    local v20 = v_u_1("QuestsDBEntries")
    for v21, v22 in pairs(p18) do
        local v23 = v20.all_quests[v21] == nil
        local v24 = "There are two or more quests named " .. v21
        assert(v23, v24)
        local v25 = v_u_6.quest_entry_with_defaults(p17, v22)
        v25.entry_name = v21
        v_u_6.assert_pretty({ v_u_9(v25) }, "Validation failed for " .. v21 .. " because: {CAUSE}")
        v20.all_quests[v21] = v25
        if v20[p17] == nil then
            v20[p17] = {}
        end
        v20[p17][v21] = v25
    end
end
function v_u_6.is_event(p_u_26)
    return function(p27)
        return p27.name == p_u_26
    end
end
function v_u_6.is_event_options(p_u_28, p_u_29)
    return function(p30)
        if p30.name ~= p_u_28 then
            return false
        end
        for v31, v32 in pairs(p_u_29) do
            if p30.options[v31] ~= v32 then
                return false
            end
        end
        return true
    end
end
function v_u_6.is_event_filter(p_u_33, p_u_34)
    return function(p35)
        if p35.name == p_u_33 then
            return p_u_34(p35) and true or false
        else
            return false
        end
    end
end
function v_u_6.is_any_event(p_u_36)
    return function(p37)
        for _, v38 in p_u_36 do
            if p37.name == v38 then
                return true
            end
        end
        return false
    end
end
function v_u_6.is_any_event_filter(p_u_39, p_u_40)
    return function(p41)
        for _, v42 in p_u_39 do
            if p41.name == v42 and p_u_40(p41) then
                return true
            end
        end
        return false
    end
end
function v_u_6.get_data(p43, p44)
    return v_u_1("DataM").get_store(p43):get(p44)
end
function v_u_6.try_to_equip(p45, p46)
    local v47 = v_u_6.get_data(p45, "inventory")
    local v48 = v_u_6.get_data(p45, "equip_manager")
    local v49 = nil
    for _ = 1, 10 do
        v49 = v47:get_item(p46)
        if v49 then
            break
        end
        task.wait(0.5)
    end
    if v49 then
        v48:equip(v49)
    end
end
function v_u_6.combine_rewards(p_u_50)
    return v_u_5.Dictionary.join(p_u_50[1], {
        ["callback"] = function(...)
            for _, v51 in p_u_50 do
                v51.callback(...)
            end
        end
    })
end
function v_u_6.make_bucks_reward(p_u_52)
    return {
        ["quantity"] = p_u_52,
        ["text_color"] = Color3.fromRGB(34, 181, 115),
        ["callback"] = function(_, p53, _)
            p53:addBucks(p_u_52):expect()
        end
    }
end
function v_u_6.make_alt_currency_reward(p_u_54)
    return {
        ["is_alt_currency"] = true,
        ["quantity"] = p_u_54,
        ["callback"] = function(_, p55, _)
            p55:addAltCurrency(p_u_54):expect()
        end
    }
end
function v_u_6.make_item_reward(p56)
    local v_u_57 = p56.kind or "smallgift"
    local v_u_58 = p56.category or "gifts"
    local v_u_59 = p56.quantity or 1
    local v60 = v_u_3[v_u_58][v_u_57]
    local v61 = "[" .. v_u_58 .. "][" .. v_u_57 .. "] does not exist"
    assert(v60, v61)
    return {
        ["image"] = v60.image,
        ["quantity"] = v_u_59,
        ["callback"] = function(p62, p63, _)
            if v_u_59 >= 1 then
                local v64 = nil
                for _ = 1, v_u_59 do
                    v64 = p63.inventory:addItem(v_u_58, v_u_57, {}):expect()
                end
                task.spawn(v_u_6.try_to_equip, p62, v64)
            end
        end
    }
end
function v_u_6.make_bucks_and_quest_reward(p65, p_u_66)
    local v67 = v_u_6.combine_rewards
    local v68 = {}
    local v74 = {
        ["callback"] = function(p69, p70, _)
            local v71 = v_u_6.get_data(p69, "quest_manager")
            if v71 then
                local v72 = p_u_66
                if typeof(v72) == "function" then
                    p_u_66 = p_u_66(p69)
                end
                for _, v73 in ipairs(p_u_66) do
                    v71:add_quest({
                        ["entry_name"] = v73,
                        ["save"] = p70,
                        ["source"] = "Quest"
                    })
                end
            end
        end
    }
    __set_list(v68, 1, {v_u_6.make_bucks_reward(p65), v74})
    return v67(v68)
end
function v_u_6.make_teleport_reward(p_u_75)
    return {
        ["claim_text"] = "Teleport",
        ["is_clientside"] = true,
        ["callback"] = function()
            local v76 = p_u_75
            v_u_1("InteriorsM").enter_smooth(unpack(v76))
        end
    }
end
function v_u_6.make_navigation_reward(p_u_77)
    return {
        ["claim_text"] = "Go!",
        ["is_clientside"] = true,
        ["callback"] = function()
            local v78 = p_u_77
            v_u_1("UIManager").apps.GuideArrowApp:navigate(unpack(v78))
        end
    }
end
function v_u_6.has_quest(p79, p_u_80)
    return v_u_5.Dictionary.some(p79:getQuests():expect(), function(p81)
        return p81.entry_name == p_u_80
    end)
end
function v_u_6.has_collected_item(p82, p83, p84)
    local v85 = v_u_6.get_data(p82, "journal_collection")
    if v85 then
        v85 = v85[p83]
    end
    if v85 then
        v85 = v85[p84]
    end
    return v85 ~= nil
end
function v_u_6.has_collected_item_category_with_condition(p86, p87, p88)
    local v89 = v_u_6.get_data(p86, "journal_collection")
    local v90 = v89 and v89[p87] or {}
    return v_u_5.Dictionary.some(v90, p88)
end
function v_u_6.get_journal_quantity(p91)
    local v92 = v_u_6.get_data(p91, "journal_collection") or {}
    local v93 = v_u_5.Dictionary.values(v92)
    return v_u_5.List.reduce(v93, function(p94, p95)
        return p94 + v_u_5.Dictionary.count(p95)
    end, 0)
end
function v_u_6.get_journal_category_quantity(p96, p_u_97, p_u_98)
    local v99 = (v_u_6.get_data(p96, "journal_collection") or {})[p_u_97] or {}
    return v_u_5.Dictionary.count(v99, function(_, p100)
        local v101 = v_u_3[p_u_97][p100]
        if v101 == nil then
            return false
        elseif p_u_98.rarity and v101.rarity ~= p_u_98.rarity then
            return false
        else
            return not (p_u_98.exclude_eggs and v101.is_egg)
        end
    end)
end
function v_u_6.has_all_items_in_category_and_rarities(p102, p103, p104)
    local v105 = v_u_3[p103]
    local v106 = "category " .. p103 .. " does not exist in InventoryDB"
    assert(v105, v106)
    for _, v_u_107 in ipairs(p104) do
        if v_u_6.get_journal_category_quantity(p102, p103, {
            ["rarity"] = v_u_107
        }) < v_u_5.Dictionary.count(v105, function(p108)
            local v109 = p108.rarity == v_u_107 and not p108.temporary
            if v109 then
                v109 = not p108.hide_from_collectors_sign
            end
            return v109
        end) then
            return false
        end
    end
    return true
end
function v_u_6.item_is_rarity(p110, p111)
    return v_u_3[p110.category][p110.id].rarity == p111
end
function v_u_6.trade_contains_item_of_rarity(p112, p_u_113)
    return v_u_5.List.some(p112.options.you_received, function(p114)
        return v_u_6.item_is_rarity(p114, p_u_113)
    end) or v_u_5.List.some(p112.options.they_received, function(p115)
        return v_u_6.item_is_rarity(p115, p_u_113)
    end)
end
return v_u_6