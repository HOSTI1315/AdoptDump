--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.TooltipImageTitle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("package:t")
local v_u_4 = v1("package:Sift")
local v_u_5 = v1("FlipbookLabel")
local v_u_6 = v1("UIBaseTooltipComponent")
local v7 = v2("TooltipImageTitle", v_u_6)
local v_u_8 = v3.strictInterface({
    ["image"] = v3.string,
    ["header_text"] = v3.string,
    ["sub_header_text"] = v3.string,
    ["flipbook_properties"] = v3.optional(v3.any),
    ["header_auto_localize"] = v3.optional(v3.boolean),
    ["sub_header_auto_localize"] = v3.optional(v3.boolean),
    ["header_text_scaled"] = v3.optional(v3.boolean),
    ["sub_header_text_scaled"] = v3.optional(v3.boolean),
    ["exit_button_space"] = v3.optional(v3.boolean),
    ["favorite_background"] = v3.optional(v3.boolean),
    ["image_scale_type"] = v3.optional(v3.enum(Enum.ScaleType))
})
local v_u_9 = {
    ["header_auto_localize"] = true,
    ["sub_header_auto_localize"] = true,
    ["header_text_scaled"] = true,
    ["sub_header_text_scaled"] = false,
    ["exit_button_space"] = false,
    ["favorite_background"] = false,
    ["image_scale_type"] = Enum.ScaleType.Stretch
}
function v7._validate_options(_, p10)
    return v_u_8(p10)
end
function v7.start(p11)
    p11.options = {
        ["image"] = "",
        ["image_scale_type"] = Enum.ScaleType.Stretch,
        ["header_text"] = "",
        ["sub_header_text"] = "",
        ["header_auto_localize"] = true,
        ["sub_header_auto_localize"] = true,
        ["header_text_scaled"] = true,
        ["sub_header_text_scaled"] = false,
        ["exit_button_space"] = false,
        ["favorite_background"] = false
    }
    p11.icon = p11.instance.ImageContainer.Icon
    p11.favorite_background = p11.instance.ImageContainer.Favorited
    p11.header = p11.instance.Titles.Header
    p11.sub_header = p11.instance.Titles.SubHeader
end
function v7.set_options(p12, p13)
    v_u_6.set_options(p12, p13)
    p12.options = v_u_4.Dictionary.merge(v_u_9, p13)
end
function v7.update(p14)
    local v15 = p14.options
    if v15.flipbook_properties then
        p14.flipbook = p14.UIManager.wrap(p14.icon, "FlipbookLabel"):start(v15.flipbook_properties, "tooltip", "icon")
    else
        if v_u_5.from_identifier("tooltip") then
            v_u_5.from_identifier("tooltip"):destroy()
        end
        p14.flipbook = nil
        p14.icon.Image = v15.image
    end
    p14.icon.ScaleType = v15.image_scale_type
    p14.header.Text = v15.header_text
    p14.sub_header.Text = v15.sub_header_text
    p14.header.AutoLocalize = v15.header_auto_localize
    p14.sub_header.AutoLocalize = v15.sub_header_auto_localize
    p14.header.TextScaled = v15.header_text_scaled
    p14.sub_header.TextScaled = v15.sub_header_text_scaled
    p14.favorite_background.Visible = v15.favorite_background
    if v15.exit_button_space then
        p14.header.Size = UDim2.new(1, -38, 0, 40)
    else
        p14.header.Size = UDim2.new(1, 0, 0, 40)
    end
end
return v7