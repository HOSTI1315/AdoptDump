--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.BasicButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("UIHelpers")
local v3 = v2("BasicButton", v1("UIBaseElement"))
function v3.hide(p4)
    p4.button:up()
    p4.instance.Visible = false
end
function v3.show(p5)
    p5.instance.Visible = true
end
function v3.start(p_u_6, p7)
    p_u_6.props = p7 or {}
    p_u_6.button = p_u_6.UIManager.wrap(p_u_6.instance, "CustomButton"):start({
        ["hover_render"] = function(_)
            if not p_u_6.highlight then
                p_u_6.highlight = Instance.new("ImageLabel")
                p_u_6.highlight.Name = "Highlight"
                p_u_6.highlight.Image = p_u_6.instance.Image
                p_u_6.highlight.ImageTransparency = 0.85
                p_u_6.highlight.ImageColor3 = Color3.new(1, 1, 1)
                p_u_6.highlight.ScaleType = Enum.ScaleType.Slice
                p_u_6.highlight.SliceCenter = p_u_6.instance.SliceCenter
                p_u_6.highlight.Size = UDim2.new(1, 0, 1, 0)
                p_u_6.highlight.ZIndex = -1
                p_u_6.highlight.BackgroundTransparency = 1
                p_u_6.highlight.Parent = p_u_6.instance
            end
        end,
        ["up_render"] = function(_)
            if p_u_6.highlight then
                p_u_6.highlight:Destroy()
                p_u_6.highlight = nil
            end
        end,
        ["mouse_button1_down"] = p_u_6.props.mouse_button1_down,
        ["mouse_button1_click"] = p_u_6.props.mouse_button1_click
    })
    return p_u_6
end
return v3