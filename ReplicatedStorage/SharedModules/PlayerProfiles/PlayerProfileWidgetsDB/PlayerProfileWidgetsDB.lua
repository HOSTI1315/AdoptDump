--// ReplicatedStorage.SharedModules.PlayerProfiles.PlayerProfileWidgetsDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("DisplayWidgetBackgrounds")
local v_u_3 = v_u_1("SharedConstants")
local v_u_4 = v_u_1("InventoryDB")
local v_u_5 = v_u_1("package:t")
local v_u_6 = v_u_1("package:Sift")
local v8 = v_u_5.map(v_u_5.keyOf(v_u_3.player_profiles.valid_pet_properties), function(p7)
    return p7 == true
end)
local v9 = v_u_5.strictInterface({
    ["kind"] = v_u_5.string,
    ["category"] = v_u_5.string,
    ["unique"] = v_u_5.string,
    ["properties"] = v_u_5.optional(v8)
})
local v10 = v_u_5.intersection
local v11 = v_u_5.array
local v12 = v_u_5.strictInterface
local v13 = {
    ["kind"] = v_u_5.string,
    ["category"] = v_u_5.string,
    ["properties"] = v_u_5.optional(v_u_5.strictInterface({
        ["flyable"] = v_u_5.optional(v_u_5.boolean),
        ["rideable"] = v_u_5.optional(v_u_5.boolean),
        ["neon"] = v_u_5.optional(v_u_5.boolean),
        ["mega_neon"] = v_u_5.optional(v_u_5.boolean),
        ["age"] = v_u_5.optional(v_u_5.integer)
    }))
}
local v15 = v10(v11(v12(v13)), function(p14)
    return #p14 <= 18
end)
local function v18(p_u_16)
    return v_u_5.optional(v_u_5.intersection(v_u_5.string, function(p17)
        return string.len(p17) <= p_u_16
    end))
end
local v19 = {}
local v20 = {
    ["display_name"] = "About Me",
    ["template_name"] = "AboutMe",
    ["expandable"] = false,
    ["layout_order"] = 1,
    ["validate_properties"] = v_u_5.strictInterface({
        ["title"] = v_u_5.optional(v18(24)),
        ["body"] = v_u_5.optional(v18(160))
    })
}
local v_u_21 = { "title", "body" }
function v20.server_modifier(p22, p23, p24)
    if not p24 then
        return p22
    end
    if p22 ~= nil then
        for _, v25 in v_u_21 do
            local v26 = p22[v25]
            if v26 then
                local v27 = p22[v25]
                if v27 then
                    v26 = v_u_1("new:TextFilterHelperServer").filter_for_public_display(v27, p23)
                else
                    v26 = nil
                end
            end
            p22[v25] = v26
        end
        return p22
    end
end
v19.about_me = v20
local v28 = {
    ["display_name"] = "Wishlist",
    ["template_name"] = "Wishlist",
    ["expandable"] = true,
    ["layout_order"] = 2
}
local v29 = v_u_5.strictInterface
local v31 = {
    ["title"] = v_u_5.optional(v18(24)),
    ["items"] = v_u_5.optional(v_u_5.intersection(v_u_5.array(v_u_5.strictInterface({
        ["kind"] = v_u_5.string,
        ["category"] = v_u_5.string,
        ["properties"] = v_u_5.optional(v8)
    })), function(p30)
        return #p30 <= v_u_3.player_profiles.max_collection_items
    end))
}
v28.validate_properties = v29(v31)
function v28.server_modifier(p32, p33, p34)
    if p32 == nil or p32.items == nil then
        return p32
    end
    for v35, v36 in p32.items do
        if not v_u_4[v36.category][v36.kind] then
            table.remove(p32.items, v35)
        end
    end
    local v_u_37 = { "title" }
    return (function(p38, p39, p40)
        if not p40 then
            return p38
        end
        if p38 ~= nil then
            for _, v41 in v_u_37 do
                local v42 = p38[v41]
                if v42 then
                    local v43 = p38[v41]
                    if v43 then
                        v42 = v_u_1("new:TextFilterHelperServer").filter_for_public_display(v43, p39)
                    else
                        v42 = nil
                    end
                end
                p38[v41] = v42
            end
            return p38
        end
    end)(p32, p33, p34)
end
v19.wishlist = v28
local v61 = {
    ["display_name"] = "Collection",
    ["template_name"] = "Collection",
    ["expandable"] = true,
    ["layout_order"] = 3,
    ["validate_properties"] = v_u_5.strictInterface({
        ["title"] = v_u_5.optional(v18(24)),
        ["items"] = v_u_5.optional(v_u_5.intersection(v_u_5.array(v9), function(p44)
            return #p44 <= v_u_3.player_profiles.max_collection_items
        end))
    }),
    ["server_modifier"] = function(p45, p46, p47)
        if p45 == nil or p45.items == nil then
            return p45
        end
        local v48 = v_u_1("DataM").get_store(p46):get("inventory")
        local v49 = {}
        for v50, v51 in p45.items do
            if v49[v51.unique] then
                table.remove(p45.items, v50)
            else
                local v52 = v48:get_item(v51.unique)
                if v52 then
                    for v53, _ in v_u_3.player_profiles.valid_pet_properties do
                        v51.properties[v53] = v52.properties[v53] == true and true or nil
                    end
                    v49[v51.unique] = true
                else
                    table.remove(p45.items, v50)
                end
            end
        end
        local v_u_54 = { "title" }
        return (function(p55, p56, p57)
            if not p57 then
                return p55
            end
            if p55 ~= nil then
                for _, v58 in v_u_54 do
                    local v59 = p55[v58]
                    if v59 then
                        local v60 = p55[v58]
                        if v60 then
                            v59 = v_u_1("new:TextFilterHelperServer").filter_for_public_display(v60, p56)
                        else
                            v59 = nil
                        end
                    end
                    p55[v58] = v59
                end
                return p55
            end
        end)(p45, p46, p47)
    end
}
v19.collection = v61
local v62 = {
    ["display_name"] = "Display",
    ["template_name"] = "Display",
    ["colorable"] = true,
    ["expandable"] = false,
    ["layout_order"] = 4
}
local v63 = v_u_5.strictInterface
local v66 = {
    ["color"] = v_u_5.optional(v_u_5.string),
    ["background"] = v_u_5.optional(v_u_5.intersection(v_u_5.string, function(p64)
        return v_u_2.get_background_info_from_name(p64) ~= nil
    end)),
    ["pets"] = v_u_5.optional(v_u_5.intersection(v_u_5.array(v_u_5.strictInterface({
        ["i"] = v_u_5.number,
        ["item"] = v9
    })), function(p65)
        return #p65 <= 1
    end))
}
v62.validate_properties = v63(v66)
function v62.server_modifier(p67, p68, _)
    if p67 == nil or p67.pets == nil then
        return p67
    end
    local v69 = v_u_1("DataM").get_store(p68):get("inventory")
    local v70 = {}
    for v71, v72 in p67.pets do
        local v73 = v72.item
        if v70[v73.unique] then
            table.remove(p67.pets, v71)
        else
            local v74 = v69:get_item(v73.unique)
            if v74 then
                for v75, _ in v_u_3.player_profiles.valid_pet_properties do
                    v73.properties[v75] = v74.properties[v75] == true and true or nil
                end
                v70[v73.unique] = true
            else
                table.remove(p67.pets, v71)
            end
        end
    end
    return p67
end
v19.display = v62
local v76 = {
    ["display_name"] = "Player Stats",
    ["template_name"] = "Stats",
    ["expandable"] = true,
    ["layout_order"] = 5
}
local v77 = v_u_5.strictInterface
local v78 = {
    ["title"] = v_u_5.optional(v18(24)),
    ["stats"] = v_u_5.array(v_u_5.strictInterface({
        ["kind"] = v_u_5.string,
        ["index"] = v_u_5.integer,
        ["value"] = v_u_5.optional(v_u_5.union(v_u_5.string, v_u_5.number))
    }))
}
v76.validate_properties = v77(v78)
function v76.server_modifier(p79, p80, _)
    local v81 = v_u_1("StatsWidgetDB")
    local v82 = {}
    for v83, v84 in p79 and (p79.stats or {}) or {} do
        local v85 = v81[v84.kind]
        if v85 then
            v84.value = v85.get_value(p80)
            table.insert(v82, v84)
            if v83 > 8 then
                break
            end
        end
    end
    p79.stats = v82
    return p79
end
v19.stats = v76
local v86 = {
    ["display_name"] = "Trade History",
    ["template_name"] = "TradeHistory",
    ["expandable"] = false,
    ["layout_order"] = 6
}
local v87 = v_u_5.strictInterface
local v89 = {
    ["title"] = v_u_5.optional(v18(24)),
    ["trades"] = v_u_5.optional(v_u_5.intersection(v_u_5.array(v_u_5.strictInterface({
        ["trade_id"] = v_u_5.string,
        ["sender_items"] = v15,
        ["recipient_items"] = v15,
        ["voters"] = v_u_5.optional(v_u_5.map(v_u_5.string, v_u_5.valueOf({ "W", "F", "L" }))),
        ["votes"] = v_u_5.optional(v_u_5.map(v_u_5.valueOf({ "W", "F", "L" }), v_u_5.integer)),
        ["can_vote"] = v_u_5.optional(v_u_5.boolean),
        ["recipient_name"] = v_u_5.optional(v_u_5.string),
        ["sender_name"] = v_u_5.optional(v_u_5.string)
    })), function(p88)
        return #p88 <= v_u_3.player_profiles.max_trades_per_widget
    end))
}
v86.validate_properties = v87(v89)
function v86.server_modifier(p90, p91, _, p92)
    local v93 = {}
    for _, v94 in p92 and p92.trades or {} do
        v93[v94.trade_id] = v94
    end
    if p90.trades then
        local v95 = v_u_1("TradeHistoryController").get_records(p91)
        local v96 = {}
        local v97 = {}
        for _, v98 in p90.trades do
            if not v96[v98.trade_id] then
                v96[v98.trade_id] = true
                local v99 = nil
                local v100 = v93[v98.trade_id]
                if v100 then
                    if v_u_6.Dictionary.equalsDeep(v100, v98) then
                        v99 = v98
                    end
                end
                if not v99 then
                    for _, v101 in v95 do
                        if v101.trade_id == v98.trade_id then
                            v99 = v_u_1("PlayerProfileHelper").trim_trade_record(v101, p91)
                            break
                        end
                    end
                end
                if v99 then
                    local v102 = v100 or v99
                    v99.can_vote = v102.can_vote
                    v99.voters = v102.voters
                    v99.votes = v102.votes
                    if v99.voters and v_u_6.Dictionary.count(v99.voters) >= v_u_3.player_profiles.max_trade_votes then
                        v99.can_vote = false
                    end
                    if v99.can_vote == false then
                        v99.voters = nil
                    end
                    table.insert(v97, v99)
                end
            end
        end
        p90.trades = v97
    end
    return p90
end
v19.trade_history = v86
for v103, v104 in v19 do
    v104.kind = v103
end
return v19