--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Backpack.BackpackXboxSelection (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = game:GetService("GuiService")
local v4 = v2("BackpackXboxSelection", v1("UIBaseElement"))
function v4.start(p5, p6)
    p5.BackpackApp = p6
    p5.header_name = nil
    p5.button_name = nil
    p5.category = nil
    p5.index = nil
    return p5
end
function v4.cache(p7)
    local v8 = v_u_3.SelectedObject
    if v8 and v8:IsDescendantOf(p7.BackpackApp.content) then
        if v8:IsA("TextButton") and v8.Name:match("header_") then
            p7.header_name = v8.Name
            return
        end
        p7.button_name = v8.Parent.Name
        p7.category = v8.Parent.Parent.Parent.Name
        p7.index = v8.Parent.LayoutOrder
    else
        p7.button_name = nil
        p7.category = nil
        p7.index = nil
    end
    p7.header_name = nil
end
function v4.select_best(p_u_9, p10)
    if p_u_9.header_name then
        local v11 = p_u_9.BackpackApp.content:FindFirstChild(p_u_9.header_name)
        p_u_9.BackpackApp.watch:select_object(v11)
    else
        local v_u_12 = p10[p_u_9.category]
        if v_u_12 then
            local v_u_13 = v_u_12:get_index_by_name(p_u_9.button_name)
            if not v_u_13 then
                local v14 = p_u_9.index
                local v15 = v_u_12.count
                v_u_13 = math.clamp(v14, 0, v15)
            end
            local function v_u_19()
                local v16 = v_u_12:get_entry(v_u_13)
                if v16 then
                    local v17 = p_u_9.BackpackApp.content:FindFirstChild(v_u_12:get_frame().Name)
                    local v18 = v17 and v17:FindFirstChild(v16.unique, true)
                    if v18 then
                        p_u_9.BackpackApp.watch:select_object(v18.Button)
                    end
                end
            end
            if v_u_12:get_index_visibility(v_u_13, false) then
                v_u_19()
            else
                v_u_12:scroll_to_index(v_u_13, 0.1):andThen(function()
                    v_u_19()
                end)
            end
        end
    end
end
return v4