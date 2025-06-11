--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.TooltipButtonList (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("TableUtil")
local v4 = v1("package:t")
local v5 = v2("TooltipButtonList", (v1("UIBaseTooltipComponent")))
local v_u_6 = v4.strictInterface({
    ["min_height"] = v4.number,
    ["max_height"] = v4.number
})
local v_u_7 = v4.strictInterface({
    ["text"] = v4.string,
    ["callback"] = v4.optional(v4.callback)
})
function v5._validate_options(_, p8)
    return v_u_6(p8)
end
function v5.start(p9)
    p9.options = {
        ["min_height"] = 0,
        ["max_height"] = (1 / 0)
    }
    p9.scroll = p9.instance.Scroll
    p9.list_layout = p9.scroll.UIListLayout
    p9.template = p9.scroll.Template
    p9.template.Parent = nil
    p9.buttons = {}
    p9.button_options = {}
    p9.button_count = 0
end
function v5.get_button_options(p10, p11)
    return v_u_3.deep_copy(p10.button_options[p11])
end
function v5.set_button_options(p12, p13, p14)
    local v15 = v_u_7(p14)
    assert(v15, "Button options validation failed.")
    p12.button_options[p13] = p14
end
function v5.add_button(p_u_16, p_u_17)
    local v18 = p_u_16.template:Clone()
    v18.Name = p_u_17
    v18.Face.TextLabel.Text = p_u_17
    v18.Parent = p_u_16.scroll
    p_u_16.button_options[p_u_17] = {
        ["text"] = p_u_17,
        ["callback"] = function() end
    }
    local v19 = p_u_16.UIManager.wrap(v18, "DepthButton"):start({
        ["is_scroll_button"] = true,
        ["mouse_button1_click"] = function()
            if p_u_16.button_options[p_u_17].callback then
                p_u_16.button_options[p_u_17].callback()
            end
        end
    })
    v19:set_state("normal_blue")
    p_u_16.buttons[p_u_17] = v19
    p_u_16.button_count = p_u_16.button_count + 1
end
function v5.remove_button(p20, p21)
    p20.buttons[p21].instance:Destroy()
    p20.buttons[p21] = nil
    p20.button_options[p21] = nil
    p20.button_count = p20.button_count - 1
end
function v5.clear_buttons(p22)
    for v23, _ in pairs(p22.buttons) do
        p22:remove_button(v23)
    end
end
function v5.get_button_count(p24)
    return p24.button_count
end
function v5.update(p25)
    local v26 = p25.options
    local v27 = p25.list_layout.AbsoluteContentSize.Y
    local v28 = v26.min_height
    local v29 = v26.max_height
    local v30 = math.clamp(v27, v28, v29)
    p25.scroll.CanvasSize = UDim2.new(0, 0, 0, v27)
    p25.instance.Size = UDim2.new(1, 0, 0, v30 + 4)
    local v31 = v26.max_height < v27 and (p25.scroll.ScrollBarThickness or 0) or 0
    for v32, v33 in pairs(p25.buttons) do
        v33.instance.Size = UDim2.new(1, -4 - v31, 0, 36)
        v33.instance.Face.TextLabel.Text = p25.button_options[v32].text
    end
end
return v5