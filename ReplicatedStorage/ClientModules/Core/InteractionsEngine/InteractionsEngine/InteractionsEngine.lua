--// ReplicatedStorage.ClientModules.Core.InteractionsEngine.InteractionsEngine (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("Interaction")
local v_u_3 = v1("Set")
local v4 = v1("Class")
local v_u_5 = v1("new:ChunkedLookup")
local v_u_6 = v1("package:Sift")
local v_u_7 = game:GetService("HttpService")
local v_u_8 = v4("InteractionsEngine")
function v_u_8.__init(p9)
    p9.interactions = v_u_3.new()
    p9.disable_table = {}
    p9.exclusive_tags = {}
    p9.chunked_lookup = v_u_5.new({
        ["chunk_size"] = 10
    })
    p9.unoptimized_interactions = v_u_3.new()
    p9.previously_visible = v_u_3.new()
end
function v_u_8.register(p10, p11)
    local v12 = v_u_2.new(p10, p11)
    p10.interactions:add(v12)
    v12:update_registration()
    return v12
end
function v_u_8.get_interactions(p13)
    return p13.interactions:tolist()
end
function v_u_8.get_closest_interaction(p14, p15)
    local v16 = (1 / 0)
    local v17 = (1 / 0)
    local v18 = nil
    for v19, _ in pairs(p14.interactions) do
        if v19:get_visibility() and not v19:is_hidden() then
            local v20 = v19:get_closeness_priority()
            local v21 = v19:get_distance_squared(p15, true)
            if v20 < v16 or v20 == v16 and v21 < v17 then
                v18 = v19
                v17 = v21
                v16 = v20
            end
        end
    end
    return v18
end
function v_u_8.is_interaction_running(p22)
    return p22.interaction_running
end
function v_u_8.__deregister(p23, p24)
    p23.interactions:remove(p24)
    p23.unoptimized_interactions:remove(p24)
    p23.chunked_lookup:remove_item(p24)
end
function v_u_8.set_tag_exclusive(p25, p26, p27)
    local v28
    if p26 then
        v28 = typeof(p26) == "string"
    else
        v28 = p26
    end
    assert(v28, "Must provide a string for a tag in InteractionsEngine:set_tag_enabled.")
    p25.exclusive_tags[p26] = p27 and true or nil
    p25:refresh()
end
function v_u_8.can_render_tag(p29, p30)
    if typeof(p30) == "function" then
        p30 = p30()
    end
    return not next(p29.exclusive_tags) and true or p29.exclusive_tags[p30] ~= nil
end
function v_u_8.disable_handle_exists(p31, p32)
    return p31.disable_table[p32] ~= nil
end
function v_u_8.disable(p33, p34)
    local v35
    if p34 then
        v35 = typeof(p34) == "string"
    else
        v35 = p34
    end
    assert(v35, "Must provide a string handle to InteractionsEngine:disable.")
    local v36 = p34 ~= v_u_8
    assert(v36, "InteractionsEngine:disable is called with a colon, not a period.")
    p33.disable_table[p34] = true
    p33:refresh()
end
function v_u_8.enable(p37, p38)
    local v39
    if p38 then
        v39 = typeof(p38) == "string"
    else
        v39 = p38
    end
    assert(v39, "Must provide a string handle to InteractionsEngine:enable.")
    local v40 = p38 ~= v_u_8
    assert(v40, "InteractionsEngine:enable is called with a colon, not a period.")
    p37.disable_table[p38] = nil
    p37:refresh()
end
function v_u_8.generate_handle(_)
    return v_u_7:GenerateGUID()
end
function v_u_8.is_enabled(p41)
    return next(p41.disable_table) == nil
end
function v_u_8._get_player_position(_)
    local v42 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if v42 then
        v42 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
    return v42
end
function v_u_8._get_optimized_nearby_interactions(p43)
    local v44 = p43:_get_player_position()
    return not v44 and {} or p43.chunked_lookup:get_items_at_position_flattened(v44)
end
function v_u_8.refresh(p_u_45)
    if not p_u_45.ongoing_refresh or coroutine.status(p_u_45.ongoing_refresh) == "dead" then
        local v_u_46 = "InteractionsEngine:refresh"
        local v_u_47 = os.clock()
        local v_u_48 = 0
        local function v_u_50(p49)
            if p49 then
                v_u_48 = v_u_48 + p49
            end
            if v_u_48 > 0.1 and os.clock() - v_u_47 > 0.002 then
                debug.profileend()
                task.wait()
                v_u_47 = os.clock()
                debug.profilebegin(v_u_46)
            end
        end
        p_u_45.ongoing_refresh = task.spawn(function()
            debug.profilebegin("InteractionsEngine:refresh")
            local v51 = p_u_45.previously_visible
            local v52 = v_u_3.new()
            local v53 = p_u_45:_get_optimized_nearby_interactions()
            local v54 = v51:len() + p_u_45.unoptimized_interactions:len() + v_u_6.Set.count(v53)
            local v55 = 0
            local v56 = 0
            local v57 = 0
            debug.profileend()
            v_u_46 = "InteractionsEngine:refresh.optimized"
            debug.profilebegin("InteractionsEngine:refresh.optimized")
            for v58, _ in v53 do
                if not v51[v58] then
                    v55 = v55 + 1
                    if v58:step() then
                        v52[v58] = true
                    end
                    v_u_50(1 / v54)
                end
            end
            debug.profileend()
            v_u_46 = "InteractionsEngine:refresh.prev_visible"
            debug.profilebegin("InteractionsEngine:refresh.prev_visible")
            for v59, _ in v51 do
                v57 = v57 + 1
                if v59:step() then
                    v52[v59] = true
                end
                v_u_50(1 / v54)
            end
            debug.profileend()
            v_u_46 = "InteractionsEngine:refresh.unoptimized"
            debug.profilebegin("InteractionsEngine:refresh.unoptimized")
            for v60, _ in p_u_45.unoptimized_interactions do
                v56 = v56 + 1
                v60:step()
                v_u_50(1 / v54)
            end
            p_u_45.previously_visible = v52
            p_u_45.ongoing_refresh = nil
            debug.profileend()
        end)
    end
end
function v_u_8.run_main_loop(p61)
    if p61.main_loop_running then
        return
    else
        p61.main_loop_running = true
        while true do
            p61:refresh()
            task.wait(0.1)
        end
    end
end
function v_u_8.get_gui_callback(p62, p63)
    local v64 = p62.gui_callbacks
    assert(v64)
    local v65 = p62.gui_callbacks[p63]
    local v66 = "Cannot find gui callback " .. (p63 or "Not specified")
    assert(v65, v66)
    return p62.gui_callbacks[p63]
end
function v_u_8.register_gui_callbacks(p_u_67, p68)
    p_u_67.gui_callbacks = p68
    coroutine.wrap(function()
        p_u_67:run_main_loop()
    end)()
end
return v_u_8.new()