--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Grids.BackpackItemGrid (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("VerticalGrid")
local v4 = v2("BackpackItemGrid", v_u_3)
function v4._create_cell(p5, p6, p7, p8)
    local v9 = p5.backpack_app.button_creator
    local v10 = v9[p8.type](v9, p8)
    v10.Size = UDim2.new(0, 80, 0, 80)
    v10.Position = UDim2.new(0, (p6 - 1) * 80, 0, 0)
    v10.LayoutOrder = p7
    return v10
end
function v4.render_row(p11, p12, p13)
    local v14 = Instance.new("Frame")
    v14.Name = "Row" .. p12
    v14.BackgroundTransparency = 1
    v14.Size = UDim2.new(1, 0, 0, 80)
    local v15 = p12 * 4
    for v16, v17 in ipairs(p13) do
        p11:_create_cell(v16, v15 + v16, v17).Parent = v14
    end
    return v14
end
function v4.connect_rows(_, p18, p19)
    local v20 = p18:GetChildren()
    local v21 = p19:GetChildren()
    local v22 = #v20
    local v23 = #v21
    local v24 = math.max(v22, v23)
    table.sort(v20, function(p25, p26)
        return p25.LayoutOrder < p26.LayoutOrder
    end)
    table.sort(v21, function(p27, p28)
        return p27.LayoutOrder < p28.LayoutOrder
    end)
    for v29 = 1, v24 do
        if v20[v29] then
            v20[v29].Button.NextSelectionDown = v21[math.min(v29, v23)].Button
        end
        if v21[v29] then
            v21[v29].Button.NextSelectionUp = v20[math.min(v29, v22)].Button
        end
    end
end
function v4.start(p30, p31)
    p30.backpack_app = p31
    local v32 = p31.scroll
    local v33 = p31.content
    v_u_3.start(p30, v32, v33, {
        ["row_height"] = 80,
        ["cells_per_row"] = 4,
        ["padding"] = 0
    })
    return p30
end
return v4