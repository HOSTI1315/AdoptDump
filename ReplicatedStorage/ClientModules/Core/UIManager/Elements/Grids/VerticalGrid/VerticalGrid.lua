--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Grids.VerticalGrid (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v3 = v1("Class")
local v_u_4 = v1("TweenPromise")
local v5 = v1("package:t")
local v_u_6 = v1("package:Sift")
v1("package:Promise")
local v7 = v3("VerticalGrid", v1("UIBaseElement"))
local v_u_8 = v5.strictInterface({
    ["row_height"] = v5.integer,
    ["cells_per_row"] = v5.integer,
    ["padding"] = v5.optional(v5.integer)
})
function v7.get_frame(p9)
    return p9.frame
end
function v7.get_entry(p10, p11)
    return p10.entries[p11]
end
function v7.get_index_by_name(p12, p13)
    return p12.index_by_name[p13]
end
function v7.get_total_rows(p14)
    local v15 = p14.count / p14.options.cells_per_row
    return math.ceil(v15)
end
function v7.get_height(p16)
    return p16:get_total_rows() * (p16.options.row_height + p16.options.padding) - p16.options.padding
end
function v7.get_row(p17, p18)
    local v19 = (p18 - 1) / p17.options.cells_per_row
    return math.floor(v19)
end
function v7.get_index_visibility(p20, p21, p22)
    local v23 = p20.frame.AbsolutePosition.Y - p20.content.AbsolutePosition.Y + p20:get_row(p21) * p20.options.row_height
    local v24 = v23 + p20.options.row_height
    local v25 = p20.scroll.CanvasPosition.Y
    local v26 = v25 + p20.scroll.AbsoluteWindowSize.Y
    if not p22 then
        return v24 > v25 and v26 > v23
    end
    local v27
    if v25 <= v23 then
        v27 = v24 <= v26
    else
        v27 = false
    end
    return v27
end
local v_u_28 = v5.tuple(v5.number, v5.number)
function v7.scroll_to_height(p29, p30, p31)
    local v32 = v_u_28
    assert(v32(p30, p31))
    return v_u_4.new(p29.scroll, TweenInfo.new(p31), {
        ["CanvasPosition"] = Vector2.new(0, p30)
    })
end
function v7.scroll_to_row(p33, p34, p35)
    local v36 = p33.frame.AbsolutePosition.Y - p33.content.AbsolutePosition.Y + p34 * p33.options.row_height
    local v37 = p34 - 1
    return p33:scroll_to_height(v36 + math.max(v37, 0) * p33.options.padding, p35)
end
function v7.scroll_to_index(p38, p39, p40)
    return p38:scroll_to_row(p38:get_row(p39), p40)
end
function v7.add(p41, p42, p43)
    p41.count = p41.count + 1
    p41.entries[p41.count] = p43
    if p41.index_by_name[p42] then
        local v44 = error
        local v45 = string.format
        local v46 = p43.name
        v44(v45("Duplicate entry.name \'%s\'. Entry names must be unique for console/gamepad selection.", (tostring(v46))))
    end
    p41.index_by_name[p42] = p41.count
end
function v7.connect_rows(_, _, _) end
function v7.connect_selectable_last_rows(p47)
    local v48 = p47:get_total_rows()
    local v49 = p47.rows[v48 - 1]
    local v50 = p47.rows[v48 - 2]
    if v49 and v50 then
        p47:connect_rows(v50, v49)
    end
end
function v7.connect_selectable(p51, p52)
    local v53 = p52.rows[0]
    local v54 = p51.rows[p51:get_total_rows() - 1]
    if v54 and v53 then
        p51:connect_rows(v54, v53)
    end
end
function v7.render_row(_, _, _)
    error("Not implemented")
end
function v7.render(p55)
    local v56 = p55:get_total_rows()
    local v57 = v56 * (p55.options.row_height + p55.options.padding) - p55.options.padding
    local v58 = p55.options.row_height + p55.options.padding
    local v59 = p55.frame.AbsolutePosition.Y - p55.content.AbsolutePosition.Y
    local v60 = v59 + v57
    local v61 = p55.scroll.CanvasPosition.Y
    local v62 = v61 + p55.scroll.AbsoluteWindowSize.Y
    local v63 = (v61 - v59) / v58
    local v64 = math.floor(v63) - 1
    local v65 = math.max(v64, 0)
    local v66 = (v62 - v59) / v58
    local v67 = math.ceil(v66) + 1 - v65
    if v60 <= v61 or v62 <= v59 then
        v65 = v62 < v59 and 0 or v56 - 1
        v67 = 1
    elseif v61 < v59 then
        local v68 = (v62 - v59) / v58
        v67 = math.ceil(v68) + 1
    end
    for v69, v70 in pairs(p55.rows) do
        if v69 < v65 or v65 + v67 - 1 < v69 then
            v70:Destroy()
            p55.rows[v69] = nil
        end
    end
    for v71 = v65, v65 + v67 - 1 do
        if v56 < v71 + 1 then
            break
        end
        local v72 = 1 + v71 * p55.options.cells_per_row
        local v73 = v72 + p55.options.cells_per_row - 1
        local v74 = p55.count
        local v75 = math.min(v73, v74)
        local v76 = v_u_6.List.slice(p55.entries, v72, v75)
        if not p55.rows[v71] then
            local v77 = p55:render_row(v71, v76)
            v77.Size = UDim2.new(1, 0, 0, p55.options.row_height)
            v77.Position = UDim2.new(0, 0, 0, v71 * (p55.options.row_height + p55.options.padding))
            v77.Parent = p55.frame
            p55.rows[v71] = v77
        end
    end
end
function v7.destroy(p78)
    p78.maid:DoCleaning()
end
function v7.start(p79, p80, p81, p82)
    local v83 = v_u_8(p82)
    assert(v83, "Invalid options passed.")
    p79.options = {
        ["row_height"] = p82.row_height,
        ["cells_per_row"] = p82.cells_per_row,
        ["padding"] = p82.padding or 0
    }
    p79.scroll = p80
    p79.content = p81
    p79.frame = Instance.new("Frame")
    p79.frame.Name = "GridFrame"
    p79.frame.BackgroundTransparency = 1
    p79.frame.Size = UDim2.new(0, 0, 1, 0)
    p79.frame.Parent = p81
    p79.count = 0
    p79.rows = {}
    p79.entries = {}
    p79.index_by_name = {}
    p79.maid = v_u_2.new()
    p79.maid:GiveTask(p79.frame)
    return p79
end
return v7