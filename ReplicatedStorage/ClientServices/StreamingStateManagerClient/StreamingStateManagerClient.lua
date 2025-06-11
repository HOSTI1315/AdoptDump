--// ReplicatedStorage.ClientServices.StreamingStateManagerClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("new:StreamingHelper")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("package:Sift")
local v5 = {}
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = nil
local function v_u_53(p9, p_u_10)
    local v_u_11 = v_u_4.Dictionary.copyDeep(p9)
    local v_u_12 = false
    local v_u_13 = false
    local function v14()
        if v_u_12 then
            return
        elseif v_u_11.char == nil or v_u_11.player == nil then
            if not v_u_13 then
                v_u_13 = true
                p_u_10(nil)
            end
        else
            v_u_13 = false
            p_u_10(v_u_11)
            return
        end
    end
    local v_u_15 = {}
    local v16 = v_u_11.char
    if v16 then
        local v_u_17 = "char"
        v_u_2.on_item_streamed(v16, function(p18)
            v_u_11[v_u_17] = p18
            if v_u_12 then
                return
            elseif v_u_11.char == nil or v_u_11.player == nil then
                if not v_u_13 then
                    v_u_13 = true
                    p_u_10(nil)
                end
            else
                v_u_13 = false
                p_u_10(v_u_11)
                return
            end
        end, v_u_15)
        v_u_11.char = v_u_2.get_instance_by_id(v16)
    end
    local v19 = v_u_11.player
    if v19 then
        local v_u_20 = "player"
        v_u_2.on_item_streamed(v19, function(p21)
            v_u_11[v_u_20] = p21
            if v_u_12 then
                return
            elseif v_u_11.char == nil or v_u_11.player == nil then
                if not v_u_13 then
                    v_u_13 = true
                    p_u_10(nil)
                end
            else
                v_u_13 = false
                p_u_10(v_u_11)
                return
            end
        end, v_u_15)
        v_u_11.player = v_u_2.get_instance_by_id(v19)
    end
    local v22 = v_u_11.connected_to_char
    if v22 then
        local v_u_23 = "connected_to_char"
        v_u_2.on_item_streamed(v22, function(p24)
            v_u_11[v_u_23] = p24
            if v_u_12 then
                return
            elseif v_u_11.char == nil or v_u_11.player == nil then
                if not v_u_13 then
                    v_u_13 = true
                    p_u_10(nil)
                end
            else
                v_u_13 = false
                p_u_10(v_u_11)
                return
            end
        end, v_u_15)
        v_u_11.connected_to_char = v_u_2.get_instance_by_id(v22)
    end
    local function v38(p25, p26, p_u_27)
        local v_u_28 = false
        local v_u_29 = #p25
        local v_u_30 = {}
        local function v_u_34()
            local v31 = {}
            for v32 = 1, v_u_29 do
                local v33 = v_u_30[v32]
                if v33 ~= nil then
                    table.insert(v31, v33)
                end
            end
            p_u_27(v31, v_u_28)
        end
        local v_u_35 = v_u_28
        for v_u_36 = 1, v_u_29 do
            p26(p25[v_u_36], function(p37)
                v_u_30[v_u_36] = p37
                if v_u_35 then
                    v_u_34()
                end
            end)
        end
        v_u_34()
        v_u_28 = true
    end
    v38(v_u_11.chars_connected_to_me, function(p39, p40)
        v_u_2.on_item_streamed(p39, p40, v_u_15)
        p40(v_u_2.get_instance_by_id(p39))
    end, function(p41, p42)
        v_u_11.chars_connected_to_me = p41
        if p42 then
            if v_u_12 then
                return
            end
            if v_u_11.char == nil or v_u_11.player == nil then
                if not v_u_13 then
                    v_u_13 = true
                    p_u_10(nil)
                end
            end
            v_u_13 = false
            p_u_10(v_u_11)
        end
    end)
    v38(v_u_11.states, function(p_u_43, p_u_44)
        local v_u_45 = false
        local function v_u_48()
            local v46 = table.clone(p_u_43)
            v46.parent = v_u_2.nil_on_missing_descenants(v_u_2.get_instance_by_id(v46.parent))
            v46.baby = v_u_2.nil_on_missing_descenants(v_u_2.get_instance_by_id(v46.baby))
            v46.baby2 = v_u_2.nil_on_missing_descenants(v_u_2.get_instance_by_id(v46.baby2))
            local v47 = (not p_u_43.parent or v46.parent) and ((not p_u_43.baby or v46.baby) and (not p_u_43.baby2 or v46.baby2)) and true or false
            if v_u_45 ~= v47 then
                v_u_45 = v47
                p_u_44(v46)
            end
        end
        for _, v49 in { p_u_43.parent, p_u_43.baby, p_u_43.baby2 } do
            v_u_2.on_item_streamed(v49, function()
                v_u_48()
            end, v_u_15)
        end
        v_u_48()
    end, function(p50, p51)
        v_u_11.states = p50
        if p51 then
            if v_u_12 then
                return
            end
            if v_u_11.char == nil or v_u_11.player == nil then
                if not v_u_13 then
                    v_u_13 = true
                    p_u_10(nil)
                end
            end
            v_u_13 = false
            p_u_10(v_u_11)
        end
    end)
    return v14, function()
        v_u_12 = true
        for _, v52 in v_u_15 do
            v52:Disconnect()
        end
    end
end
local function v_u_55(p54)
    if typeof(p54) == "table" then
        return v_u_4.Dictionary.copyDeep(p54)
    else
        return p54
    end
end
local function v_u_62(p56)
    local v57 = v_u_6[p56]
    local v58 = {}
    if v57 then
        for _, v59 in v57 do
            if v59.value then
                local v60 = v_u_55
                local v61 = v59.value
                table.insert(v58, v60(v61))
            end
        end
    else
        v58 = {}
    end
    v_u_3.update_server(p56, "pet_state_managers", v58)
end
function v5.init()
    v_u_3.register_callback_plus_existing("pet_state_managers_raw", function(p_u_63, p64)
        local v_u_65 = coroutine.running()
        v_u_8 = v_u_65
        local function v66()
            if v_u_65 == v_u_8 then
                v_u_8 = nil
            end
        end
        if not v_u_6[p_u_63] then
            v_u_6[p_u_63] = {}
        end
        local v67 = v_u_6[p_u_63]
        for v68, v69 in v67 do
            if not (p64 and p64[v68]) then
                v67[v68] = nil
                v69.disconnect_watcher()
            end
        end
        if p64 then
            for v_u_70, v71 in p64 do
                if v67[v_u_70] then
                    v67[v_u_70].disconnect_watcher()
                end
                local v76, v77 = v_u_53(v71, function(p72)
                    local v73 = p_u_63
                    local v74 = v_u_70
                    if v_u_6[v73] then
                        if not v_u_6[v73][v74] then
                            return
                        end
                        v_u_6[v73][v74].value = p72
                        local v75
                        if v_u_8 == nil then
                            v75 = false
                        else
                            v75 = coroutine.status(v_u_8) ~= "dead"
                        end
                        if not v75 then
                            v_u_62(v73)
                        end
                    end
                end)
                v67[v_u_70] = {
                    ["char_id"] = v_u_70,
                    ["value"] = nil,
                    ["disconnect_watcher"] = v77
                }
                v76()
            end
            v_u_62(p_u_63)
            v66()
        else
            v_u_6[p_u_63] = nil
            v66()
        end
    end)
    v_u_3.register_callback_plus_existing("state_manager_raw", function(p_u_78, p79)
        local v_u_80 = coroutine.running()
        v_u_8 = v_u_80
        local function v81()
            if v_u_80 == v_u_8 then
                v_u_8 = nil
            end
        end
        if v_u_7[p_u_78] then
            v_u_7[p_u_78].disconnect_watcher()
            v_u_7[p_u_78] = nil
        end
        if p79 then
            local v86, v87 = v_u_53(p79, function(p82)
                local v83 = p_u_78
                if v_u_7[v83] then
                    v_u_7[v83].value = p82
                    local v84
                    if v_u_8 == nil then
                        v84 = false
                    else
                        v84 = coroutine.status(v_u_8) ~= "dead"
                    end
                    if not v84 then
                        local v85
                        if v_u_7[v83] then
                            v85 = v_u_7[v83].value or nil
                        else
                            v85 = nil
                        end
                        v_u_3.update_server(v83, "state_manager", v_u_55(v85))
                    end
                end
            end)
            v_u_7[p_u_78] = {
                ["char_id"] = p_u_78.Name,
                ["value"] = nil,
                ["disconnect_watcher"] = v87
            }
            v86()
            local v88
            if v_u_7[p_u_78] then
                v88 = v_u_7[p_u_78].value or nil
            else
                v88 = nil
            end
            v_u_3.update_server(p_u_78, "state_manager", v_u_55(v88))
            v81()
        else
            v81()
        end
    end)
end
return v5