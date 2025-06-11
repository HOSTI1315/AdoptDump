--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Tooltip (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = game:GetService("ReplicatedStorage").Resources.UI_Resources.Templates.Tooltips
local v_u_5 = v_u_4.Components
local v6 = v2("Tooltip", v1("UIBaseElement"))
function v6.start(p_u_7, p8, p9, p10)
    p_u_7.components = {}
    p_u_7.component_count = 0
    p_u_7.container = v_u_4.Tooltip:Clone()
    p_u_7.container.AnchorPoint = p9
    p_u_7.container.Position = p10
    p_u_7.container.Visible = false
    p_u_7.container.Parent = p_u_7.instance
    p_u_7.list = p_u_7.container.List
    p_u_7.list_layout = p_u_7.list.UIListLayout
    p_u_7.on_refresh_signal = v_u_3.new()
    p_u_7:set_exit_visible(false)
    function p_u_7.exit_callback() end
    p_u_7.UIManager.wrap(p_u_7.container.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_7.exit_callback then
                p_u_7.exit_callback()
            end
        end
    })
    p_u_7.UIManager.wrap(p_u_7.container.ExitButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonB,
        ["on_update"] = function(p11, p12)
            for _, v13 in p11.instance:GetChildren() do
                v13.Visible = not p12
            end
        end
    })
    p_u_7.hover = p_u_7.UIManager.wrap(p8, "TooltipHover")
    p_u_7.hover:start(p_u_7)
end
function v6.refresh(p14)
    for _, v15 in pairs(p14.components) do
        v15:update()
    end
    p14.container.Size = UDim2.new(0, v_u_4.Tooltip.Size.X.Offset, 0, p14.list_layout.AbsoluteContentSize.Y)
    p14.on_refresh_signal:Fire()
end
function v6.add_component(p16, p17, p18, p19)
    p16.component_count = p16.component_count + 1
    local v20 = v_u_5:FindFirstChild(p18):Clone()
    v20.Name = p17
    v20.LayoutOrder = p16.component_count
    v20.Parent = p19 or p16.list
    local v21 = p16.UIManager.get_class("Tooltip" .. p18).new(p16.UIManager, v20, p16)
    p16.components[p17] = v21
    p16.components[p17]:start()
    return v21
end
function v6.remove_component(p22, p23)
    p22.components[p23]:destroy()
    p22.components[p23] = nil
end
function v6.get_component(p24, p25)
    return p24.components[p25]
end
function v6.set_visible(p26, p27)
    p26.container.Visible = p27
end
function v6.is_visible(p28)
    return p28.container.Visible
end
function v6.get_container(p29)
    return p29.container
end
function v6.get_hover(p30)
    return p30.hover
end
function v6.set_exit_visible(p31, p32)
    p31.container.ExitButton.Visible = p32
end
function v6.set_exit_callback(p33, p34)
    p33.exit_callback = p34
end
function v6.get_refresh_signal(p35)
    return p35.on_refresh_signal
end
return v6