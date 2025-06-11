--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Grids.JournalItemGrid (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("package:Sift")
local v_u_4 = v1("VerticalGrid")
local v5 = v2("JournalItemGrid", v_u_4)
function v5.render_row(p6, p7, p8)
    local v9 = p6.JournalApp.row_template:Clone()
    v9.Name = "Row" .. p7
    for v10, v11 in ipairs(p8) do
        local v12 = p6.JournalApp:render_entry(v11)
        v12.LayoutOrder = (v10 - 1) * 2
        v12.Parent = v9
    end
    return v9
end
function v5.connect_rows(_, p13, p14)
    local v15 = p13:GetChildren()
    local v17 = v_u_3.List.filter(v15, function(p16)
        return p16:FindFirstChildWhichIsA("ImageButton")
    end)
    local v18 = p14:GetChildren()
    local v20 = v_u_3.List.filter(v18, function(p19)
        return p19:FindFirstChildWhichIsA("ImageButton")
    end)
    local v21 = #v17
    local v22 = #v20
    local v23 = math.max(v21, v22)
    table.sort(v17, function(p24, p25)
        return p24.LayoutOrder < p25.LayoutOrder
    end)
    table.sort(v20, function(p26, p27)
        return p26.LayoutOrder < p27.LayoutOrder
    end)
    for v28 = 1, v23 do
        if v17[v28] then
            v17[v28].Button.NextSelectionDown = v20[math.min(v28, v22)].Button
        end
        if v20[v28] then
            v20[v28].Button.NextSelectionUp = v17[math.min(v28, v21)].Button
        end
    end
end
function v5.start(p29, p30)
    p29.JournalApp = p30
    local v31 = p30.scroll
    local v32 = p30.content
    v_u_4.start(p29, v31, v32, {
        ["row_height"] = 76,
        ["cells_per_row"] = p29.JournalApp.cells_per_row,
        ["padding"] = 10
    })
    return p29
end
return v5