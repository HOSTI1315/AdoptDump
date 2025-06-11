--// ReplicatedStorage.ClientModules.Game.CharWrapperClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("TableUtil")
local v_u_4 = v1("Debug")
local v_u_5 = v1("LocationUtil")
local v_u_6 = v1("InventoryDB")
local v_u_7 = {}
local v_u_8 = {}
function v_u_7.get(p9)
    return v_u_8[p9]
end
local function v_u_14(p10, p11)
    if p11 then
        for _, v12 in p11 do
            if v12 ~= nil then
                v_u_8[v12.char] = nil
            end
        end
    end
    if p10 then
        for _, v13 in p10 do
            if v13 ~= nil then
                v_u_8[v13.char] = v13
            end
        end
    end
end
function v_u_7.register_player_wrapper_char_changed(p_u_15)
    v_u_2.register_callback_plus_existing("char_wrapper", function(p16, p17, p18)
        if p18 ~= nil then
            v_u_8[p18.char] = nil
        end
        if p17 ~= nil then
            v_u_8[p17.char] = p17
        end
        local v19
        if p17 then
            v19 = p17.char
        else
            v19 = p17
        end
        local v20
        if p18 then
            v20 = p18.char
        else
            v20 = p18
        end
        if v19 ~= v20 then
            p_u_15(p16, p17, p18)
        end
    end)
end
function v_u_7.register_pet_wrapper_char_changed(p_u_21)
    v_u_2.register_callback_plus_existing("pet_char_wrappers", function(p22, p23, p24)
        v_u_14(p23, p24)
        local v25 = p23 or {}
        local v26 = p24 or {}
        if #v25 == #v26 then
            local v27 = false
            for v28, v29 in v25 do
                if v26[v28].pet_unique ~= v29.pet_unique then
                    v27 = true
                    break
                end
            end
            if not v27 then
                return
            end
        end
        p_u_21(p22, v25 or {}, v26 or {})
    end)
end
function v_u_7.register_property_changed(p_u_30, p_u_31)
    v_u_2.register_callback_plus_existing("char_wrapper", function(_, p32, p33)
        local v34 = p32
        local v35 = p33
        if v35 ~= nil then
            v_u_8[v35.char] = nil
        end
        if v34 ~= nil then
            v_u_8[v34.char] = v34
        end
        if p32 then
            if not (p32.char:IsDescendantOf(workspace) or p32.char:IsDescendantOf(game.Lighting)) then
                warn("CharWrapper: char is not in workspace or lighting", p32.char)
            end
            local v_u_36 = p32 or {}
            local v_u_37 = p33 or {}
            local v38 = v_u_36[p_u_30]
            local v39 = v_u_37[p_u_30]
            local v40
            if typeof(v38) == "table" and (typeof(v39) == "table" and (v38.version and v39.version)) then
                v40 = v38.version == v39.version
            else
                v40 = v_u_3.shallow_equal(v38, v39)
            end
            local v41 = not v40
            local v_u_42 = v_u_36.unique ~= v_u_37.unique
            if v41 or v_u_42 then
                coroutine.wrap(function()
                    v_u_4.pcall_warn_error(function()
                        if v_u_42 then
                            p_u_31(v_u_36.char, v_u_36[p_u_30], nil, v_u_36)
                        else
                            p_u_31(v_u_36.char, v_u_36[p_u_30], v_u_37[p_u_30], v_u_36)
                        end
                    end)
                end)()
            end
        end
    end)
    v_u_2.register_callback_plus_existing("pet_char_wrappers", function(_, p43, p44)
        v_u_14(p43, p44)
        local v45 = {}
        if p44 then
            for _, v46 in p44 do
                v45[v46.pet_unique] = v46
            end
        end
        if not p43 then
            ::l7::
            return
        end
        for _, v_u_47 in p43 do
            if not (v_u_47.char:IsDescendantOf(workspace) or v_u_47.char:IsDescendantOf(game.Lighting)) then
                warn("CharWrapper: pet char is not in workspace or lighting", v_u_47.char)
            end
            local v_u_48 = v45[v_u_47.pet_unique]
            if v_u_48 then
                v_u_48 = v_u_48[p_u_30]
            end
            v45[v_u_47.pet_unique] = nil
            if v_u_48 == nil then
                ::l16::
                coroutine.wrap(function()
                    v_u_4.pcall_warn_error(function()
                        p_u_31(v_u_47.char, v_u_47[p_u_30], v_u_48, v_u_47)
                    end)
                end)()
            else
                local v49 = v_u_47[p_u_30]
                local v50
                if typeof(v49) == "table" and (typeof(v_u_48) == "table" and (v49.version and v_u_48.version)) then
                    v50 = v49.version == v_u_48.version
                else
                    v50 = v_u_3.shallow_equal(v49, v_u_48)
                end
                if not v50 then
                    goto l16
                end
            end
        end
        goto l7
    end)
end
function v_u_7.get_team(p51)
    local v52 = game.Players:GetPlayerFromCharacter(p51)
    if v52 then
        return v_u_2.get_server(v52, "team")
    end
    local v53 = v_u_8[p51].pet_id
    return v53 and (v_u_6.pets[v53].is_doll and "Dolls" or "Pets") or nil
end
function v_u_7.is_in_same_location(p54, p55)
    if not (p54 and p55) then
        return false
    end
    local v56 = p54.location or {}
    local v57 = p55.location or {}
    return v_u_5.is_same_location(v56, v57)
end
function v_u_7.is_non_player(p58)
    local v59 = v_u_7.get_team(p58)
    return v59 == "Pets" and true or v59 == "Dolls"
end
function v_u_7.is_doll(p60)
    return v_u_7.get_team(p60) == "Dolls"
end
function v_u_7.get_all_char_wrappers()
    local v61 = {}
    for _, v62 in pairs(v_u_8) do
        table.insert(v61, v62)
    end
    return v61
end
function v_u_7.init()
    v_u_2.register_callback_plus_existing("char_wrapper", function(_, p63, p64)
        if p64 ~= nil then
            v_u_8[p64.char] = nil
        end
        if p63 ~= nil then
            v_u_8[p63.char] = p63
        end
    end)
    v_u_2.register_callback_plus_existing("pet_char_wrappers", function(_, p65, p66)
        v_u_14(p65, p66)
    end)
end
return v_u_7