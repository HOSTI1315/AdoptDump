--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.TooltipDivider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("package:t")
local v4 = v2("TooltipDivider", (v1("UIBaseTooltipComponent")))
local v_u_5 = v3.strictInterface({
    ["line_visible"] = v3.boolean,
    ["padding_top"] = v3.number,
    ["padding_bottom"] = v3.number,
    ["padding_left"] = v3.number,
    ["padding_right"] = v3.number
})
function v4._validate_options(_, p6)
    return v_u_5(p6)
end
function v4.start(p7)
    p7.options = {
        ["line_visible"] = true,
        ["padding_top"] = 3,
        ["padding_bottom"] = 3,
        ["padding_left"] = 5,
        ["padding_right"] = 5
    }
    p7.line = p7.instance.Line
    p7.ui_padding = p7.instance.UIPadding
end
function v4.update(p8)
    local v9 = p8.options
    p8.line.Visible = v9.line_visible
    p8.ui_padding.PaddingTop = UDim.new(0, v9.padding_top)
    p8.ui_padding.PaddingBottom = UDim.new(0, v9.padding_bottom)
    p8.ui_padding.PaddingLeft = UDim.new(0, v9.padding_left)
    p8.ui_padding.PaddingRight = UDim.new(0, v9.padding_right)
    p8.instance.Size = UDim2.new(1, 0, 0, 2 + v9.padding_top + v9.padding_bottom)
end
return v4