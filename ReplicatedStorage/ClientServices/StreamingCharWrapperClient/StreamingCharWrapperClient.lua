--// ReplicatedStorage.ClientServices.StreamingCharWrapperClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("new:StreamingHelper")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("package:Sift")
local v5 = {}
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = nil
local function v_u_24(p9, p_u_10)
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
    local v15 = { v_u_11 }
    local v_u_16 = v_u_13
    local v_u_17 = v_u_12
    local v_u_18 = {}
    for _, v_u_19 in v15 do
        for v_u_20, v21 in v_u_19 do
            if v_u_2.is_streaming_id(v21) then
                v_u_2.on_item_streamed(v21, function(p22)
                    v_u_19[v_u_20] = p22
                    if v_u_17 then
                        return
                    elseif v_u_11.char == nil or v_u_11.player == nil then
                        if not v_u_16 then
                            v_u_16 = true
                            p_u_10(nil)
                        end
                    else
                        v_u_16 = false
                        p_u_10(v_u_11)
                        return
                    end
                end)
                v_u_19[v_u_20] = v_u_2.get_instance_by_id(v21)
            elseif typeof(v21) == "table" then
                table.insert(v15, v21)
            end
        end
    end
    return v14, function()
        v_u_17 = true
        for _, v23 in v_u_18 do
            v23:Disconnect()
        end
    end
end
local function v_u_26(p25)
    if typeof(p25) == "table" then
        return v_u_4.Dictionary.copyDeep(p25)
    else
        return p25
    end
end
local function v_u_35(p27)
    local v28 = v_u_6[p27]
    local v29 = {}
    if v28 then
        for _, v30 in v28 do
            if v30.value then
                local v31 = v_u_26
                local v32 = v30.value
                table.insert(v29, v31(v32))
            end
        end
        table.sort(v29, function(p33, p34)
            return p33.index < p34.index
        end)
    else
        v29 = {}
    end
    v_u_3.update_server(p27, "pet_char_wrappers", v29)
end
function v5.init()
    v_u_3.register_callback_plus_existing("pet_char_wrappers_raw", function(p_u_36, p37)
        local v_u_38 = coroutine.running()
        v_u_8 = v_u_38
        local function v39()
            if v_u_38 == v_u_8 then
                v_u_8 = nil
            end
        end
        if not v_u_6[p_u_36] then
            v_u_6[p_u_36] = {}
        end
        local v40 = v_u_6[p_u_36]
        for v41, v42 in v40 do
            if not (p37 and p37[v41]) then
                v40[v41] = nil
                v42.disconnect_watcher()
            end
        end
        if p37 then
            for v_u_43, v44 in p37 do
                if v40[v_u_43] then
                    v40[v_u_43].disconnect_watcher()
                end
                local v49, v50 = v_u_24(v44, function(p45)
                    local v46 = p_u_36
                    local v47 = v_u_43
                    if v_u_6[v46] then
                        if not v_u_6[v46][v47] then
                            return
                        end
                        v_u_6[v46][v47].value = p45
                        local v48
                        if v_u_8 == nil then
                            v48 = false
                        else
                            v48 = coroutine.status(v_u_8) ~= "dead"
                        end
                        if not v48 then
                            v_u_35(v46)
                        end
                    end
                end)
                v40[v_u_43] = {
                    ["char_id"] = v_u_43,
                    ["value"] = nil,
                    ["disconnect_watcher"] = v50
                }
                v49()
            end
            v_u_35(p_u_36)
            v39()
        else
            v_u_6[p_u_36] = nil
            v39()
        end
    end)
    v_u_3.register_callback_plus_existing("char_wrapper_raw", function(p_u_51, p52)
        local v_u_53 = coroutine.running()
        v_u_8 = v_u_53
        local function v54()
            if v_u_53 == v_u_8 then
                v_u_8 = nil
            end
        end
        if v_u_7[p_u_51] then
            v_u_7[p_u_51].disconnect_watcher()
            v_u_7[p_u_51] = nil
        end
        if p52 then
            local v59, v60 = v_u_24(p52, function(p55)
                local v56 = p_u_51
                if v_u_7[v56] then
                    v_u_7[v56].value = p55
                    local v57
                    if v_u_8 == nil then
                        v57 = false
                    else
                        v57 = coroutine.status(v_u_8) ~= "dead"
                    end
                    if not v57 then
                        local v58
                        if v_u_7[v56] then
                            v58 = v_u_7[v56].value or nil
                        else
                            v58 = nil
                        end
                        v_u_3.update_server(v56, "char_wrapper", v_u_26(v58))
                    end
                end
            end)
            v_u_7[p_u_51] = {
                ["char_id"] = p_u_51.Name,
                ["value"] = nil,
                ["disconnect_watcher"] = v60
            }
            v59()
            local v61
            if v_u_7[p_u_51] then
                v61 = v_u_7[p_u_51].value or nil
            else
                v61 = nil
            end
            v_u_3.update_server(p_u_51, "char_wrapper", v_u_26(v61))
            v54()
        else
            v54()
        end
    end)
end
return v5