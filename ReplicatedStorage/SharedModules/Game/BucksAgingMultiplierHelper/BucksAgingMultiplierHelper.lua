--// ReplicatedStorage.SharedModules.Game.BucksAgingMultiplierHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ThemedServersHelper")
local v_u_3 = v_u_1("SharedConstants")
local v_u_4 = v_u_1("EquippedPets")
local v_u_5 = v_u_1("CloudValues")
local v_u_6 = v_u_1("SpecialMultipliersDB")
local v_u_7 = v_u_1("package:Sift")
local v_u_8 = v_u_1("TimeZoneHelper")
local v_u_9 = v_u_1("LiveOpsTime")
local v_u_10 = game:GetService("RunService")
local v_u_11 = {}
local function v_u_12()
    if v_u_10:IsServer() then
        return v_u_1("DataM").get_global_store():get("influencer_multipliers_force_enabled")
    else
        return v_u_1("ClientData").get("influencer_multipliers_force_enabled")
    end
end
function v_u_11.get_player_specific_multiplier(p13, p14)
    if v_u_5:getValue("codes2x", "enabled") then
        local v15 = false
        if v_u_10:IsServer() then
            local v16 = v_u_1("DataM").get_store(p13)
            if v16 then
                v16 = v16:get("bucks_aging_multiplier_manager")
            end
            if v16 then
                v15 = v16:is_multiplier_active(p14)
            end
        else
            v15 = v_u_1("UIManager").apps.Code2xMultipliersApp:is_multiplier_active(p14)
        end
        if v15 then
            return 2
        end
    end
    if v_u_5:getValue("friend_multiplier", "enabled") then
        local v17 = v_u_5:getValue("friend_multiplier", "multiplier")
        local v18 = v_u_5:getValue("friend_multiplier", "friend_count_required")
        local v19 = v_u_5:getValue("friend_multiplier", "schedule")
        local v20 = v19.start_time
        local v21 = v19.expiration_time
        local v22 = v_u_8.from_timezone_datetime("PST", v20.year, v20.month, v20.day, v20.hour, v20.minute).UnixTimestamp
        local v23 = v_u_8.from_timezone_datetime("PST", v21.year, v21.month, v21.day, v21.hour, v21.minute).UnixTimestamp
        local v24 = v_u_9.now()
        if v24 >= v22 and v23 >= v24 then
            local v25
            if v_u_10:IsServer() then
                v25 = v_u_1("FriendsServer")
            else
                v25 = v_u_1("FriendsClient")
            end
            local v26 = v25.get_friends(p13):expect().server
            if v18 <= v_u_7.Dictionary.count(v26) then
                if p14 == "bucks" and v_u_10:IsServer() then
                    local v27 = v_u_1("DataM").get_store(p13)
                    local v28 = v27:get("subscription_manager")
                    local v29 = v27:get("bucks_cap_manager")
                    if v28:check_subscription_active("equip_2x_pets"):expect() then
                        v29:set_cap_multiplier("pet_care_friend_multiplier", 1.74375, false)
                    else
                        v29:set_cap_multiplier("friend_multiplier", 1.25, false)
                    end
                end
                return v17[p14] or 1
            end
        end
    end
    return 1
end
function v_u_11.get_server_multipliers(p30)
    local v31
    if v_u_10:IsServer() then
        v31 = v_u_1("new:ServerMultipliers").get_multipliers()
    else
        v31 = v_u_1("ClientData").get("server_multipliers")
    end
    local v32 = v31 == nil and {} or v31
    v32.aging = v32.aging or 1
    v32.bucks = v32.bucks or 1
    if p30 then
        return v32[p30]
    else
        return v32
    end
end
function v_u_11.get_effective_multiplier_for_player(p33, p34)
    return 1 * v_u_11.get_player_specific_multiplier(p33, p34) * v_u_11.get_server_multipliers(p34) + v_u_11.get_influencer_multipliers_for_player(p33, p34)
end
function v_u_11.get_multiplier_for_pet(p35, p36, p37)
    if p37 == nil then
        return {
            ["bucks"] = v_u_11.get_multiplier_for_pet(p35, p36, "bucks"),
            ["aging"] = v_u_11.get_multiplier_for_pet(p35, p36, "aging")
        }
    end
    local v38 = 1
    if not (p36 and (p36.char_wrapper or p36.item)) then
        return v38
    end
    local v39
    if p36.item == nil then
        v39 = v_u_4.get_item_from_wrapper(p36.char_wrapper)
    else
        v39 = p36.item or nil
    end
    local v40
    if p36.char_wrapper == nil then
        v40 = v_u_4.get_wrapper_from_item(p36.item)
    else
        v40 = p36.char_wrapper or nil
    end
    if not v39 or v39.category ~= "pets" then
        return v38
    end
    local v41 = v38 * v_u_11.get_timed_multipliers_for_pet(v39, p37)
    local v42 = v_u_6[p37]
    if v42 then
        v42 = v_u_6[p37][v39.kind]
    end
    if v42 then
        v41 = v41 * v42(p35, v39, v40)
    end
    return v41
end
function v_u_11.get_influencer_multipliers_for_player(p43, p44)
    if v_u_2.is_afk_place() then
        return 0
    end
    local v45
    if v_u_12() then
        v45 = true
    elseif v_u_10:IsServer() then
        v45 = v_u_1("TagM").has_tag(p43, "influencer")
    else
        local v46 = v_u_1("ClientData").get_server(p43, "player_tags") or {}
        v45 = table.find(v46, p43) ~= nil
    end
    return not v45 and 0 or (p44 and (v_u_3.additive_influencer_multipliers[p44] or 0) or v_u_3.additive_influencer_multipliers)
end
function v_u_11.get_timed_multipliers_for_pet(p47, p48)
    local v49 = 1
    local v50 = p47.properties.timed_flags
    local v51 = v50 and v50.pet_multipliers
    if v51 then
        v51 = v50.pet_multipliers.value
    end
    if not v51 then
        return v49
    end
    local v52 = DateTime.now().UnixTimestamp
    for v53, v54 in v51[p48] do
        if v54 >= v52 then
            v49 = math.max(v49, v53)
        end
    end
    return v49
end
function v_u_11.apply_multiplier(p55, p56, p57)
    local v58 = p56 * v_u_11.get_effective_multiplier_for_player(p55, p57)
    return math.floor(v58)
end
function v_u_11.apply_multiplier_for_pet(p59, p60, p61, p62)
    local v63 = v_u_11.apply_multiplier(p59, p61, p62)
    local v64 = v_u_11.get_multiplier_for_pet(p59, {
        ["char_wrapper"] = p60
    }, p62)
    if v64 then
        return v63 * v64
    else
        return v63
    end
end
function v_u_11.get_bucks_multiplier_for_pet(p65, p66)
    return v_u_11.get_multiplier_for_pet(p65, p66, "bucks")
end
function v_u_11.apply_bucks_multiplier(p67, p68)
    return v_u_11.apply_multiplier(p67, p68, "bucks")
end
function v_u_11.apply_bucks_multiplier_for_pet(p69, p70, p71)
    return v_u_11.apply_multiplier_for_pet(p69, p70, p71, "bucks")
end
function v_u_11.get_aging_multiplier_for_pet(p72, p73)
    return v_u_11.get_multiplier_for_pet(p72, p73, "aging")
end
function v_u_11.apply_aging_multiplier(p74, p75)
    return v_u_11.apply_multiplier(p74, p75, "aging")
end
function v_u_11.apply_aging_multiplier_for_pet(p76, p77, p78)
    return v_u_11.apply_multiplier_for_pet(p76, p77, p78, "aging")
end
return v_u_11