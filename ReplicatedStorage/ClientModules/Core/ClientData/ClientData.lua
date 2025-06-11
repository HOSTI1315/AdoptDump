--// ReplicatedStorage.ClientModules.Core.ClientData (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v2("RouterClient")
local v4 = v2("Signal")
local v_u_5 = v2("TableUtil")
local v_u_6 = v2("Debug").create_log()
local v_u_7 = v2("package:Promise")
local v_u_8 = v2("new:StreamingHelper")
local v_u_9 = require(game.ReplicatedFirst.Load.LoadTimers)
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = nil
local v_u_13 = {}
local v_u_14 = nil
local v_u_15 = false
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local v_u_21 = {
    ["vehicle"] = function(p19)
        local v20 = v_u_8.await(p19)
        if v20 and v20:GetAttribute("DescendantCount") ~= nil then
            v_u_8.await_matching_descendant_count(v20)
        end
        return v20
    end
}
v_u_10.DataChangedEvent = v4.new()
local function v_u_27(p22, p23, p24)
    local v25 = os.clock()
    local v26 = v_u_21[p23](p24)
    if v_u_12[p22] == nil or v_u_13[p22] and (v_u_13[p22][p23] and v25 < v_u_13[p22][p23]) then
        return false, nil
    end
    if v_u_13[p22] == nil then
        v_u_13[p22] = {}
    end
    v_u_13[p22][p23] = v25
    return true, v26
end
local function v_u_36()
    local v28, v29 = v_u_3.get_event("DataAPI/ReplicateInitData").OnClientEvent:Wait()
    v_u_12 = v28
    v_u_14 = v29
    for v_u_30, v_u_31 in v_u_12 do
        for v_u_32, v_u_33 in v_u_31 do
            if v_u_21[v_u_32] then
                v_u_31[v_u_32] = nil
                task.spawn(function()
                    local v34, v35 = v_u_27(v_u_30, v_u_32, v_u_33)
                    if v34 then
                        v_u_31[v_u_32] = v35
                    end
                end)
            end
        end
    end
    v_u_15 = true
end
local function v_u_44(p37, p38)
    local v39 = v_u_10.get(p37)
    if v39 ~= p38 then
        local v40 = {}
        if v_u_17[p37] then
            for _, v41 in pairs(v_u_17[p37]) do
                local v42 = v_u_7.promisify(v41)(game.Players.LocalPlayer, v39, p38)
                local v43 = warn
                table.insert(v40, v42:catch(v43))
            end
        end
        v_u_7.allSettled(v40):expect()
        v_u_10.DataChangedEvent:Fire(p37, v39)
    end
end
function v_u_10.predict(p45, p46)
    local v47 = v_u_10.get(p45)
    v_u_18[p45] = p46
    v_u_44(p45, v47)
end
function v_u_10.rollback_prediction(p48)
    local v49 = v_u_10.get(p48)
    v_u_18[p48] = nil
    v_u_44(p48, v49)
end
function v_u_10.update(p50, p51)
    DataChanged(game.Players.LocalPlayer.Name, p50, p51)
end
function v_u_10.update_server(p52, p53, p54)
    DataChanged(p52.Name, p53, p54)
end
function v_u_10.get(p55)
    return v_u_10.get_server(game.Players.LocalPlayer, p55)
end
function v_u_10.get_data()
    return v_u_12
end
function v_u_10.get_server(p56, p57)
    if not v_u_15 then
        repeat
            task.wait()
        until v_u_15
    end
    if v_u_18[p57] and p56 == game.Players.LocalPlayer then
        return v_u_18[p57]
    elseif v_u_12[p56.Name] then
        return v_u_12[p56.Name][p57]
    else
        return nil
    end
end
function v_u_10.predict_update_server(p_u_58, p_u_59, p60, p61)
    local v62 = p61 == nil and true or p61
    v_u_12[p_u_58.Name][p_u_59] = p60
    if v62 then
        spawn(function()
            v_u_12[p_u_58.Name][p_u_59] = v_u_10.get_server_latest(p_u_58, p_u_59)
        end)
    end
end
function v_u_10.server_dequeue(p63)
    if not v_u_15 then
        repeat
            wait(0.1)
        until v_u_15
    end
    local v64 = v_u_12[game.Players.LocalPlayer.Name].queue[p63]
    if not v64 then
        return nil
    end
    v_u_16[p63] = v_u_16[p63] or 1
    if not v64[v_u_16[p63]] then
        return nil
    end
    local v65 = v64[v_u_16[p63]]
    v_u_16[p63] = v_u_16[p63] + 1
    return v65
end
function v_u_10.get_server_latest(p66, p67)
    if not v_u_15 then
        repeat
            wait(0.1)
        until v_u_15
    end
    return v_u_3.get("DataAPI/GetServerLatest"):InvokeServer(p66, p67)
end
function v_u_10.get_server_constant(p68)
    return v_u_10.get(p68)
end
local v_u_69 = 0
function v_u_10.register_server_on_change_hook(p_u_70, p_u_71, p72)
    assert(p72, "No callback specified to register_server_on_change_hook. Args are as follows: key, hook_id, callback")
    v_u_17[p_u_70] = v_u_17[p_u_70] or {}
    v_u_69 = v_u_69 + 1
    if not p_u_71 then
        local v73 = v_u_69
        p_u_71 = tostring(v73)
    end
    v_u_17[p_u_70][p_u_71] = p72
    return function()
        v_u_17[p_u_70][p_u_71] = nil
    end
end
function v_u_10.register_callback(p74, p75)
    return v_u_10.register_server_on_change_hook(p74, nil, p75)
end
function v_u_10.register_callback_plus_existing(p76, p77)
    local v78 = v_u_10.register_server_on_change_hook(p76, nil, p77)
    for v79, _ in v_u_12 do
        local v80 = game.Players:FindFirstChild(v79)
        if v80 then
            local v81 = v_u_10.get_server(v80, p76)
            if v81 then
                v_u_7.promisify(p77)(v80, v81):catch(warn)
            end
        end
    end
    return v78
end
function v_u_10.register_server_constant_on_change_hook(p82, p83, p84)
    v_u_11[p82] = v_u_11[p82] or {}
    v_u_69 = v_u_69 + 1
    local v85 = v_u_11[p82]
    if not p83 then
        local v86 = v_u_69
        p83 = tostring(v86)
    end
    v85[p83] = p84
end
function DataChanged(p87, p88, p89, p90)
    v_u_6("Data Changed on Client:", p87, "| key:", p88, " | value:", p89)
    if not v_u_15 then
        repeat
            wait(0.1)
        until v_u_15
    end
    if p90 and p90 < v_u_14 then
        return
    else
        if p87 == "_ Global Store _" then
            p87 = game.Players.LocalPlayer.Name
        end
        local v91 = game.Players:FindFirstChild(p87)
        if v91 == nil then
            warn(("player_instance for player %s not found\n%s"):format(p87, debug.traceback()))
        else
            if v_u_12[p87] == nil then
                v_u_12[p87] = {}
            end
            if v_u_21[p88] then
                local v92
                v92, p89 = v_u_27(p87, p88, p89)
                if not v92 then
                    return
                end
            end
            local v93
            if p87 == game.Players.LocalPlayer.Name and v_u_18[p88] then
                v93 = v_u_18[p88]
                v_u_18[p88] = nil
            else
                v93 = v_u_12[p87][p88]
            end
            v_u_12[p87][p88] = p89
            local v94 = {}
            if v_u_17[p88] then
                for _, v95 in pairs(v_u_17[p88]) do
                    local v96 = v_u_7.promisify(v95)(v91, p89, v93)
                    local v97 = warn
                    table.insert(v94, v96:catch(v97))
                end
            end
            v_u_7.allSettled(v94):expect()
            if p87 == game.Players.LocalPlayer.Name then
                v_u_10.DataChangedEvent:Fire(p88, p89)
            end
        end
    end
end
local function v_u_104(p98, p99, p100)
    local v101 = v_u_12[p98]
    for v102, v103 in pairs(p99) do
        if v102 == #p99 then
            v101[v103] = p100
        else
            v101[v103] = v_u_5.shallow_copy(v101[v103])
            v101 = v101[v103]
        end
    end
end
local function v_u_115(p105, p106, p107, p108)
    if not v_u_15 then
        repeat
            wait(0.1)
        until v_u_15
    end
    if p108 < v_u_14 then
        v_u_6("Download time discrepency", p108, v_u_14)
    else
        if p105 == "_ Global Store _" then
            p105 = game.Players.LocalPlayer.Name
        end
        if v_u_12[p105] == nil then
            v_u_12[p105] = {}
        end
        local v109
        if p105 == game.Players.LocalPlayer.Name and v_u_18[p106[1]] then
            v109 = v_u_18[p106[1]]
            v_u_18[p106[1]] = nil
        else
            v109 = v_u_12[p105][p106[1]]
        end
        v_u_104(p105, p106, p107)
        local v110 = v_u_12[p105][p106[1]]
        if v_u_17[p106[1]] then
            local v111 = {}
            for _, v112 in pairs(v_u_17[p106[1]]) do
                local v113 = v_u_7.promisify(v112)(game.Players:FindFirstChild(p105), v110, v109)
                local v114 = warn
                table.insert(v111, v113:catch(v114))
            end
            v_u_7.allSettled(v111):expect()
        end
        if p105 == game.Players.LocalPlayer.Name then
            v_u_10.DataChangedEvent:Fire(p106[1], v110)
        end
    end
end
local function v_u_123(p116)
    if v_u_12[p116.Name] then
        for v117, v118 in pairs(v_u_12[p116.Name]) do
            if v_u_17[v117] then
                local v119 = {}
                for _, v120 in pairs(v_u_17[v117]) do
                    local v121 = v_u_7.promisify(v120)(p116, nil, v118)
                    local v122 = warn
                    table.insert(v119, v121:catch(v122))
                end
                v_u_7.allSettled(v119):expect()
            end
        end
        v_u_12[p116.Name] = nil
        v_u_13[p116.Name] = nil
    end
end
local function v_u_127()
    local v124, v125 = v_u_9.new_misc_consecutive_timers()
    v124("081_client_data_await_file_load")
    v_u_6("Waiting for load status to be \'done\'")
    while true do
        local v126 = v_u_1.LocalPlayer:GetAttribute("file_load_status")
        v_u_1.LocalPlayer:GetAttribute("file_load_status_retry")
        if v126 == "done" then
            break
        end
        task.wait()
    end
    v_u_6("Load status is \'done\'")
    v124("081_client_data_download_all_server_data")
    v_u_6("Downloading all server data")
    v_u_36()
    v_u_6("Server data downloaded")
    v124("081_client_data_late")
    v_u_3.get_event("DataAPI/DataChanged").OnClientEvent:connect(DataChanged)
    v_u_3.get_event("DataAPI/DataPartiallyChanged").OnClientEvent:connect(v_u_115)
    game.Players.PlayerRemoving:Connect(v_u_123)
    v125()
end
function v_u_10.init()
    v_u_127()
    v_u_3.get("DebugAPI/DebugClient").OnClientInvoke = function(p128, p129)
        if p128 == "get_client_data" then
            return v_u_10.get(p129)
        else
            return nil
        end
    end
end
return v_u_10