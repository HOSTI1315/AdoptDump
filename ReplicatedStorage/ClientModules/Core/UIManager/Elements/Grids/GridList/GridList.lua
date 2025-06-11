--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Grids.GridList (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v3 = v1("Class")
local v_u_4 = v1("PlatformM")
local v_u_5 = game:GetService("GuiService")
local v6 = v3("GridList", v1("UIBaseElement"))
function v6._init_console_scroll(p_u_7)
    local v_u_8 = nil
    p_u_7.maid:GiveTask(v_u_5:GetPropertyChangedSignal("SelectedObject"):Connect(function()
        if not v_u_4.is_using_gamepad() then
            return
        end
        local v9 = #p_u_7.grids
        local v10 = v_u_5.SelectedObject
        if not v10 then
            return
        end
        for v11, v12 in pairs(p_u_7.grids) do
            if v10:IsDescendantOf((v12:get_frame())) then
                local v13 = v12:get_index_by_name(v10.Parent.Name)
                if v13 then
                    local v14 = v12:get_total_rows()
                    local v15 = v12:get_row(v13)
                    if v_u_8 then
                        v_u_8:cancel()
                        v_u_8 = nil
                    end
                    if v11 == 1 and v15 == 0 then
                        v_u_8 = v12:scroll_to_height(0, 0)
                        return
                    end
                    if v11 == v9 and v15 == v14 - 1 then
                        v_u_8 = v12:scroll_to_row(v15, 0)
                        return
                    end
                end
                break
            end
        end
    end))
end
function v6.add(p16, p17)
    local v18 = p16.grids
    table.insert(v18, p17)
    table.sort(p16.grids, function(p19, p20)
        local v21 = p19:get_frame()
        local v22 = p20:get_frame()
        return v21.LayoutOrder < v22.LayoutOrder
    end)
    p16.maid:GiveTask(p17)
end
function v6.get_count(p23)
    return #p23.grids
end
function v6.get_grids(p24)
    return p24.grids
end
function v6.render(p25)
    for _, v26 in pairs(p25.grids) do
        v26:get_frame().Size = UDim2.new(1, 0, 0, v26:get_height())
    end
    for _, v27 in pairs(p25.grids) do
        v27:render()
        v27:connect_selectable_last_rows()
    end
    for v28 = 1, #p25.grids - 1 do
        p25.grids[v28]:connect_selectable(p25.grids[v28 + 1])
    end
end
function v6.destroy(p29)
    p29.maid:DoCleaning()
end
function v6.start(p_u_30)
    p_u_30.grids = {}
    p_u_30.maid = v_u_2.new()
    p_u_30.maid:GiveTask(p_u_30.instance:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        p_u_30:render()
    end))
    p_u_30:_init_console_scroll()
    return p_u_30
end
return v6