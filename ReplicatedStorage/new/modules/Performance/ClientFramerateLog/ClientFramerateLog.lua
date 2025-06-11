--// ReplicatedStorage.new.modules.Performance.ClientFramerateLog (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = {}
local v_u_4 = false
local v_u_5 = false
local v_u_6 = false
function v_u_3.mutate_settings(p7)
    if p7.enabled ~= nil then
        v_u_4 = p7.enabled
    end
    if p7.mode_detailed ~= nil then
        v_u_5 = p7.mode_detailed
    end
    if p7.mode_tagged ~= nil then
        v_u_6 = p7.mode_tagged
    end
end
local function v_u_8()
    return {
        ["sum_all"] = 0,
        ["sum_nonloading"] = 0,
        ["num_nonloading"] = 0,
        ["frames_delta"] = {},
        ["frames_type"] = {},
        ["frame_count_total"] = 0
    }
end
local function v_u_9()
    return {
        ["roundtrip"] = v_u_8(),
        ["prerender"] = v_u_8(),
        ["preanim"] = v_u_8(),
        ["presim"] = v_u_8(),
        ["postsim"] = v_u_8(),
        ["heartbeat"] = v_u_8()
    }
end
local function v_u_17(p10, p11, p12)
    if #p10.frames_delta >= 300 then
        local v13 = table.remove(p10.frames_delta, 1) or 0
        local v14 = table.remove(p10.frames_type, 1) or 0
        p10.sum_all = p10.sum_all - v13
        if v14 == 0 then
            p10.sum_nonloading = p10.sum_nonloading - v13
            p10.num_nonloading = p10.num_nonloading - 1
        end
    end
    local v15 = p10.frames_delta
    table.insert(v15, p11)
    local v16 = p10.frames_type
    table.insert(v16, p12 and 1 or 0)
    p10.sum_all = p10.sum_all + p11
    if not p12 then
        p10.sum_nonloading = p10.sum_nonloading + p11
        p10.num_nonloading = p10.num_nonloading + 1
    end
    p10.frame_count_total = p10.frame_count_total + 1
end
local v_u_18 = v_u_9()
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = {}
local v_u_22 = nil
local v_u_23 = nil
local function v_u_29()
    v_u_22 = {
        ["count"] = 0,
        ["roundtrip"] = 0,
        ["prerender"] = 0,
        ["preanim"] = 0,
        ["presim"] = 0,
        ["postsim"] = 0,
        ["heartbeat"] = 0
    }
    v_u_23 = {
        ["count"] = 0,
        ["roundtrip"] = 0,
        ["prerender"] = 0,
        ["preanim"] = 0,
        ["presim"] = 0,
        ["postsim"] = 0,
        ["heartbeat"] = 0
    }
    for _, v24 in v_u_21 do
        local v25 = v24.segments
        local v26 = {
            ["loading"] = v_u_23,
            ["nonloading"] = v_u_22
        }
        table.insert(v25, v26)
        if v24.seconds then
            local v27 = 0
            for v28 = #v24.segments, 1, -1 do
                if v24.seconds <= v27 then
                    table.remove(v24.segments, v28)
                end
                v27 = v27 + (v24.segments[v28].loading.roundtrip + v24.segments[v28].nonloading.roundtrip)
            end
        end
    end
end
v_u_29()
function v_u_3.long_recording_start(p30, p31)
    local v32 = {
        ["seconds"] = p31,
        ["segments"] = {
            {
                ["loading"] = v_u_23,
                ["nonloading"] = v_u_22
            }
        }
    }
    v_u_21[p30] = v32
end
function v_u_3.long_recording_end(p33)
    local v34 = v_u_21[p33]
    v_u_21[p33] = nil
    return v34
end
function v_u_3.long_recording_get(p35)
    return v_u_21[p35]
end
function v_u_3.very_long_recording_start(p36)
    v_u_20[p36] = {
        ["count_nonloading"] = 0,
        ["sum_nonloading"] = 0,
        ["count_loading"] = 0,
        ["sum_loading"] = 0
    }
end
function v_u_3.very_long_recording_end(p37)
    local v38 = v_u_20[p37]
    v_u_20[p37] = nil
    return v38
end
function v_u_3.very_long_recording_get(p39)
    return v_u_20[p39]
end
local v_u_40 = {}
function v_u_3.loading_section_start(p41)
    v_u_40[p41] = true
end
function v_u_3.loading_section_end(p42)
    v_u_40[p42] = nil
end
function v_u_3.is_in_loading_section()
    return next(v_u_40) ~= nil
end
local v_u_43 = {}
function v_u_3.add_tag(p44)
    if not v_u_19[p44] then
        v_u_19[p44] = v_u_9()
    end
    v_u_43[p44] = v_u_19[p44]
end
function v_u_3.remove_tag(p45)
    v_u_43[p45] = nil
end
local function v_u_52(p46, p47)
    local v48 = next(v_u_40) ~= nil
    v_u_17(v_u_18[p47], p46, v48)
    if v_u_6 then
        for _, v49 in v_u_43 do
            v_u_17(v49[p47], p46, v48)
        end
    end
    local v50
    if v48 then
        v50 = v_u_23
    else
        v50 = v_u_22
    end
    v50[p47] = v50[p47] + p46
    if p47 == "roundtrip" then
        v50.count = v50.count + 1
        if v_u_23.count + v_u_22.count >= 300 then
            v_u_29()
        end
        for _, v51 in v_u_20 do
            if v48 then
                v51.count_loading = v51.count_loading + 1
                v51.sum_loading = v51.sum_loading + p46
            else
                v51.count_nonloading = v51.count_nonloading + 1
                v51.sum_nonloading = v51.sum_nonloading + p46
            end
        end
    end
end
function v_u_3.get_frametimes()
    return {
        ["global"] = v_u_18,
        ["tagged"] = v_u_19
    }
end
function v_u_3.get_global_frametime_nonloading()
    if v_u_18.roundtrip.sum_nonloading == 0 then
        return nil
    else
        return v_u_18.roundtrip.sum_nonloading / v_u_18.roundtrip.num_nonloading
    end
end
function v_u_3.get_global_framerate_nonloading()
    local v53 = v_u_3.get_global_frametime_nonloading()
    if v53 then
        return 1 / v53
    else
        return nil
    end
end
function v_u_3.start()
    task.spawn(function()
        local v_u_54 = os.clock()
        v_u_1.PostSimulation:Wait()
        local v_u_55 = os.clock()
        v_u_1.PreRender:Connect(function()
            task.defer(coroutine.running())
            coroutine.yield()
            if v_u_4 and v_u_5 then
                v_u_52(os.clock() - v_u_55, "prerender")
            end
            v_u_55 = os.clock()
        end)
        v_u_1.PreAnimation:Connect(function()
            task.defer(coroutine.running())
            coroutine.yield()
            if v_u_4 and v_u_5 then
                v_u_52(os.clock() - v_u_55, "preanim")
            end
            v_u_55 = os.clock()
        end)
        v_u_1.PreSimulation:Connect(function()
            task.defer(coroutine.running())
            coroutine.yield()
            if v_u_4 and v_u_5 then
                v_u_52(os.clock() - v_u_55, "presim")
            end
            v_u_55 = os.clock()
        end)
        v_u_1.Heartbeat:Connect(function()
            if v_u_4 and v_u_5 then
                v_u_52(os.clock() - v_u_55, "heartbeat")
            end
            v_u_55 = os.clock()
        end)
        v_u_1.PostSimulation:Connect(function()
            task.defer(coroutine.running())
            coroutine.yield()
            if v_u_4 and v_u_5 then
                v_u_52(os.clock() - v_u_55, "postsim")
            end
            v_u_55 = os.clock()
            if v_u_4 then
                v_u_52(os.clock() - v_u_54, "roundtrip")
            end
            v_u_54 = os.clock()
        end)
    end)
    local v_u_56 = 0
    v_u_2.InputEnded:Connect(function(p57, _)
        if p57.UserInputType == Enum.UserInputType.Focus then
            v_u_56 = os.clock()
            v_u_3.loading_section_start("unfocused")
        end
    end)
    v_u_2.InputBegan:Connect(function(p58, _)
        if p58.UserInputType == Enum.UserInputType.Focus then
            v_u_56 = os.clock()
            local v59 = v_u_56
            task.wait(1)
            if v_u_56 == v59 then
                v_u_3.loading_section_end("unfocused")
            end
        end
    end)
end
return v_u_3