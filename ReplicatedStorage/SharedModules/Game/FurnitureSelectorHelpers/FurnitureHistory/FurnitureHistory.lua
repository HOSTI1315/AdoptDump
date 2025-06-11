--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureHistory (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("DepreciationCalculator")
local v_u_3 = v_u_1("FurnitureDB")
local v_u_4 = v_u_1("HouseClient")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = v_u_1("Signal")
local v7 = v_u_1("Class")
v_u_1("package:Promise")
local v_u_8 = game:GetService("Players")
local v_u_9 = game:GetService("HttpService")
local v_u_10 = {
    ["mutate"] = true,
    ["sell"] = true,
    ["buy"] = true
}
local function v_u_11()
    return nil
end
local v12 = v7("FurnitureHistory")
function v12.__init(p13, p14, p15)
    p13.max_commits = p14
    p13.is_coop_active = true
    p13.processing = false
    p13.commits = {}
    p13.commit_index_lookup = {}
    p13.changed = v_u_6.new()
    if p15 then
        p13:_init_listeners()
    end
end
local v_u_16 = {}
local function v_u_25(p17, p18)
    local v19 = v_u_1("UIManager")
    local v20 = v_u_1("FurnitureModelTracker")
    v19.apps.FurnitureSelectorApp:deselect_all()
    for _, v21 in p18.actions do
        local v22 = p17:_get_furniture_data_by_unique(v21.unique)
        local v23 = v20.get_furniture_by_unique(v21.unique)
        if v22 and v23 then
            v19.apps.FurnitureSelectorApp:force_select_furniture(v23, v22)
        end
    end
    local v24 = v19.apps.FurnitureSelectorApp:get_selected_furnitures()
    v19.apps.FurnitureSelectorApp:deselect_all()
    return v24
end
function v_u_16.mutate(p26, p27)
    local v28 = v_u_1("UIManager")
    local v29 = v_u_25(p26, p27)
    local v30 = {}
    for _, v31 in p27.actions do
        v30[v31.unique] = v31
    end
    for _, v32 in v29 do
        local v33 = v30[v32.data.unique]
        if v33 then
            v32.data.cframe = v33.cframe
            v32.data.colors = v33.colors
            v32.data.scale = v33.scale
            v32.data.mutated = true
        end
    end
    v28.apps.FurnitureSelectorApp:push_furniture_changes(v29):expect()
    return true
end
function v_u_16.buy(p34, p35)
    local v36 = v_u_1("UIManager")
    local v37 = v_u_25(p34, p35)
    return v36.apps.FurnitureSelectorApp:sell_furniture(v37)
end
function v_u_16.sell(p38, p_u_39)
    local v_u_40 = v_u_1("new:FurnitureEntryHelper")
    local v_u_41 = v_u_1("UIManager")
    local v42 = {}
    for _, v43 in p_u_39.actions do
        local v44 = {
            ["kind"] = v43.kind,
            ["properties"] = {
                ["cframe"] = v43.cframe,
                ["colors"] = v43.colors,
                ["scale"] = v43.scale
            }
        }
        table.insert(v42, v44)
    end
    local function v48()
        local v45 = 0
        for _, v46 in p_u_39.actions do
            local v47 = v_u_3[v46.kind]
            v45 = v45 + v_u_40.get_cost(v47)
        end
        return v45
    end
    local function v50(p49)
        if p49 <= 0 then
            return true
        end
        if (v_u_5.get("money") or 0) >= p49 then
            return v_u_41.apps.DialogApp:dialog({
                ["text"] = ("Undoing the last action will cost $%d"):format(p49),
                ["left"] = "Cancel",
                ["right"] = "Confirm"
            }) == "Confirm"
        end
        v_u_41.apps.DialogApp:dialog({
            ["text"] = ("Undoing the last action is too expensive and would cost $%d"):format(p49),
            ["button"] = "Okay"
        })
        return false
    end
    local v51 = v48()
    while v50(v51) do
        local v52 = v48()
        if v52 == v51 then
            local v53, v54 = v_u_41.apps.FurnitureSelectorApp:buy_new_furnitures(false, v42)
            local v55 = v53 and (v54 and v54.success)
            if v55 then
                v55 = v54.results
            end
            if v55 then
                local v56 = {}
                for v57, v58 in p_u_39.actions do
                    local v59 = v55[v57]
                    v56[v58.unique] = v59.unique
                end
                p38:_remap_commits(p_u_39, v56)
            end
            return v55 and true or false
        end
        v51 = v52
    end
    return false
end
function v12._init_listeners(p_u_60)
    local v_u_61 = nil
    v_u_5.register_callback("house_interior", function()
        local v62 = v_u_4.get_current_house_owner()
        local v63
        if v62 == v_u_61 then
            v63 = false
        else
            v_u_61 = v62
            v63 = true
        end
        local v64 = p_u_60.is_coop_active
        local v65 = p_u_60
        local v66 = v_u_5.get("house_interior")
        local v67 = v_u_5.get_server(v_u_8.LocalPlayer, "housing_coop")
        local v68
        if v66 and (v66.player == v_u_8.LocalPlayer and v67) then
            local v69 = not v67.locked
            local v70 = #v67.players > 0
            v68 = v66.allows_coop_building and true or false
            if v69 then
                if not v70 then
                    v68 = v70
                end
            else
                v68 = v69
            end
        else
            v68 = false
        end
        v65.is_coop_active = v68
        if v64 ~= p_u_60.is_coop_active and true or v63 then
            p_u_60:_clear()
        end
    end)
    v_u_4.housing_coop_changed:Connect(function(p71)
        if p71 == v_u_8.LocalPlayer then
            local v72 = p_u_60.is_coop_active
            local v73 = p_u_60
            local v74 = v_u_5.get("house_interior")
            local v75 = v_u_5.get_server(v_u_8.LocalPlayer, "housing_coop")
            local v76
            if v74 and (v74.player == v_u_8.LocalPlayer and v75) then
                local v77 = not v75.locked
                local v78 = #v75.players > 0
                v76 = v74.allows_coop_building and true or false
                if v77 then
                    if not v78 then
                        v76 = v78
                    end
                else
                    v76 = v77
                end
            else
                v76 = false
            end
            v73.is_coop_active = v76
            if v72 ~= p_u_60.is_coop_active then
                p_u_60:_clear()
            end
        end
    end)
end
function v12._get_furniture_data_by_unique(_, p79)
    local v80 = v_u_5.get("house_interior")
    return (v80 and v80.furniture or {})[p79]
end
function v12._get_commit_furniture_datas(p81, p82)
    local v83 = {}
    for _, v84 in p82.actions do
        local v85 = p81:_get_furniture_data_by_unique(v84.unique)
        if v85 then
            table.insert(v83, v85)
        end
    end
    return v83
end
function v12._get_index_by_commit(p86, p87)
    return p86.commit_index_lookup[p87.unique]
end
function v12._remap_commits(p88, p89, p90)
    local v91 = p88:_get_index_by_commit(p89)
    if v91 then
        for v92 = v91, 1, -1 do
            for _, v93 in p88.commits[v92].actions do
                while p90[v93.unique] do
                    v93.unique = p90[v93.unique]
                end
            end
        end
    end
end
function v12._remove_commit(p94, p95)
    local v96 = p94:_get_index_by_commit(p95)
    local v97
    if v96 then
        v97 = table.remove(p94.commits, v96)
    else
        v97 = v96
    end
    if v97 then
        for v98, v99 in p94.commit_index_lookup do
            if v96 < v99 then
                p94.commit_index_lookup[v98] = v99 - 1
            end
        end
        p94.commit_index_lookup[v97.unique] = nil
        p94.changed:Fire()
    end
end
function v12._clear(p100)
    p100.commits = {}
    p100.commit_index_lookup = {}
    p100.changed:Fire()
end
function v12.is_processing(p101)
    return p101.processing
end
function v12.has_commits(p102)
    return #p102.commits > 0
end
function v12.is_active(p103)
    local v104 = v_u_4.get_current_house_owner()
    local v105 = not p103.is_coop_active
    if v105 then
        v105 = v104 == v_u_8.LocalPlayer
    end
    return v105
end
function v12.get_top_commit(p106)
    return p106.commits[#p106.commits]
end
function v12.insert_commit(p107, p108)
    local v109 = p107.commits
    table.insert(v109, p108)
    table.sort(p107.commits, function(p110, p111)
        return p110.timestamp < p111.timestamp
    end)
    p107.changed:Fire()
end
function v12.waypoint(p_u_112, p113, p114, p115, p116)
    local v117 = v_u_10[p114]
    assert(v117, "Invalid action type")
    if p116 or p_u_112:is_active() then
        local v118 = #p_u_112.commits + 1
        if p_u_112.max_commits < v118 then
            local v119 = p_u_112.commits[1]
            if v119 then
                p_u_112:_remove_commit(v119)
                v118 = v118 - 1
            end
        end
        local v_u_120 = {
            ["user_id"] = p113.UserId,
            ["timestamp"] = workspace:GetServerTimeNow(),
            ["unique"] = v_u_9:GenerateGUID(false),
            ["action_type"] = p114,
            ["actions"] = {}
        }
        p115(function(p121, p122)
            if not p_u_112.processing then
                local v123 = v_u_120.actions
                local v124 = {
                    ["unique"] = p121,
                    ["kind"] = p122.id,
                    ["cframe"] = p122.cframe,
                    ["colors"] = p122.colors,
                    ["scale"] = p122.scale
                }
                table.insert(v123, v124)
            end
        end)
        if #v_u_120.actions > 0 then
            local v125 = p_u_112.commits
            table.insert(v125, v_u_120)
            p_u_112.commit_index_lookup[v_u_120.unique] = v118
            p_u_112.changed:Fire()
        end
    else
        p115(v_u_11)
    end
end
function v12.get_commit_currency_delta(p126, p127, p128)
    local v129 = 0
    if not p128 then
        for _, v130 in p127.actions do
            v129 = v129 + v_u_3[v130.kind].cost
        end
        return v129
    end
    local v131 = v_u_4.get_current_house_owner()
    for _, v132 in p126:_get_commit_furniture_datas(p127) do
        v129 = v129 - v_u_2.calculate_furniture_depreciation(v131, v132)
    end
    return v129
end
function v12.can_undo_commit(p133, p134)
    if v_u_16[p134.action_type] and true or false then
        if p134.action_type == "sell" or #p133:_get_commit_furniture_datas(p134) == #p134.actions then
            return p134.action_type == "mutate" or p133:get_commit_currency_delta(p134, p134.action_type == "buy") <= (1 / 0)
        else
            return false
        end
    else
        return false
    end
end
function v12.undo(p135, p136)
    p135.processing = true
    local v137 = p135.commit_index_lookup[p136] or #p135.commits
    local v138 = p135.commits[v137]
    local v139 = v138 and p135:can_undo_commit(v138) and v_u_16[v138.action_type](p135, v138)
    if v139 then
        p135:_remove_commit(v138)
    end
    p135.processing = false
    return v139
end
return v12