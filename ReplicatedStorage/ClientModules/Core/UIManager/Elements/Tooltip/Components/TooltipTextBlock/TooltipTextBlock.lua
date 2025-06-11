--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.TooltipTextBlock (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("new:TextUtil")
local v5 = v1("package:t")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("UIBaseTooltipComponent")
local v_u_8 = v1("ColorThemeManager")
local v9 = v2("TooltipTextBlock", v_u_7)
local v_u_10 = v5.strictInterface({
    ["min_height"] = v5.number,
    ["max_height"] = v5.number,
    ["spacing"] = v5.optional(v5.number),
    ["auto_localize"] = v5.optional(v5.boolean),
    ["paragraphs"] = v5.array(v5.string),
    ["on_click"] = v5.optional(v5.callback),
    ["info_icon"] = v5.optional(v5.boolean)
})
local v_u_11 = {
    ["spacing"] = 6,
    ["auto_localize"] = true
}
function v9._validate_options(_, p12)
    return v_u_10(p12)
end
function v9.start(p13)
    p13.options = {
        ["min_height"] = 0,
        ["max_height"] = (1 / 0),
        ["spacing"] = 6,
        ["auto_localize"] = true,
        ["paragraphs"] = {}
    }
    p13.scroll = p13.instance.Scroll
    p13.list_layout = p13.scroll.UIListLayout
    p13.template = p13.scroll.Template
    p13.template.Visible = false
    p13.paragraphs_maid = v_u_3.new()
end
function v9.set_options(p14, p15)
    v_u_7.set_options(p14, p15)
    p14.options = v_u_6.Dictionary.merge(v_u_11, p15)
end
function v9.update(p16)
    local v_u_17 = p16.options
    local v_u_18 = p16.scroll.ScrollBarThickness + 4
    p16.paragraphs_maid:DoCleaning()
    p16.list_layout.Padding = UDim.new(0, v_u_17.spacing)
    for v19, v_u_20 in ipairs(v_u_17.paragraphs) do
        local v_u_21 = p16.template:Clone()
        v_u_21.Text = v_u_20
        v_u_21.Visible = true
        v_u_21.AutoLocalize = v_u_17.auto_localize
        v_u_4.on_text_bounds({
            ["Instance"] = p16.template,
            ["Text"] = v_u_20:gsub("<[^>]+>", ""),
            ["ContainerWidth"] = p16.scroll.AbsoluteSize.X - v_u_18
        }, function(p22)
            v_u_21.Size = UDim2.new(1, -v_u_18, 0, p22.Y)
        end)
        if v_u_17.on_click then
            v_u_21.Button.Visible = true
            local v23 = v_u_21.Button.MouseButton1Down:Connect(function()
                v_u_17.on_click(v_u_20)
            end)
            p16.paragraphs_maid:GiveTask(v23)
        end
        if v_u_17.info_icon and v19 == 1 then
            v_u_21.InfoIcon.Visible = true
        end
        v_u_21.Parent = p16.scroll
        p16.paragraphs_maid:GiveTask(v_u_21)
    end
    local v24 = p16.list_layout.AbsoluteContentSize.Y
    local v25 = v_u_17.min_height
    local v26 = v_u_17.max_height
    local v27 = math.clamp(v24, v25, v26)
    p16.scroll.CanvasSize = UDim2.new(0, 0, 0, v24)
    p16.scroll.ScrollBarImageColor3 = v_u_8.lookup("saturated")
    p16.instance.Size = UDim2.new(1, 0, 0, v27 + 4)
end
return v9