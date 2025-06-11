--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.TabButtons (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("TabButtons", v1("UIBaseElement"))
local function v_u_5(p3)
    for _, v4 in pairs(p3:GetDescendants()) do
        if v4:IsA("ImageButton") then
            return v4
        end
    end
end
function v2._update_buttons(p6)
    for v7, v8 in p6.depth_buttons do
        if p6.selected_tab == v7 then
            v8:set_state(p6.enabled[v7] and "selected" or "disabled")
        else
            v8:set_state(p6.enabled[v7] and "normal" or "disabled")
        end
    end
end
function v2.set_tab(p9, p10)
    if p9.enabled[p10] then
        p9.selected_tab = p10
        p9:_update_buttons()
        p9.props[p10]()
    end
end
function v2.set_tab_enabled(p11, p12, p13)
    p11.enabled[p12] = p13
    p11:_update_buttons()
end
function v2.start(p_u_14, p15)
    p_u_14.depth_buttons = {}
    p_u_14.selected_tab = nil
    p_u_14.enabled = {}
    p_u_14.props = p15
    for _, v_u_16 in p_u_14.instance:GetChildren() do
        if p15[v_u_16.Name] then
            local v17 = v_u_5(v_u_16)
            assert(v17, "Can\'t find button in button_complex")
            local v18 = p_u_14.UIManager.wrap(v17, "DepthButton")
            p_u_14.depth_buttons[v_u_16.Name] = v18
            p_u_14.enabled[v_u_16.Name] = true
            v18:start({
                ["mouse_button1_down"] = function()
                    p_u_14:set_tab(v_u_16.Name)
                end
            })
        end
    end
    return p_u_14
end
return v2