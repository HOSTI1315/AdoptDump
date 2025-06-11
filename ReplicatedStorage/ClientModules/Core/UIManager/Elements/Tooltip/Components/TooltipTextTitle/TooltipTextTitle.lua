--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.TooltipTextTitle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("package:t")
local v_u_4 = v1("package:Sift")
local v_u_5 = v1("UIBaseTooltipComponent")
local v6 = v2("TooltipTextTitle", v_u_5)
local v_u_7 = v3.strictInterface({
    ["header_text"] = v3.string,
    ["sub_header_text"] = v3.string,
    ["header_auto_localize"] = v3.optional(v3.boolean),
    ["sub_header_auto_localize"] = v3.optional(v3.boolean)
})
local v_u_8 = {
    ["header_auto_localize"] = true,
    ["sub_header_auto_localize"] = true
}
function v6._validate_options(_, p9)
    return v_u_7(p9)
end
function v6.start(p10)
    p10.options = {
        ["header_text"] = "",
        ["sub_header_text"] = "",
        ["header_auto_localize"] = true,
        ["sub_header_auto_localize"] = true
    }
    p10.header = p10.instance.Header
    p10.sub_header = p10.instance.SubHeader
end
function v6.set_options(p11, p12)
    v_u_5.set_options(p11, p12)
    p11.options = v_u_4.Dictionary.merge(v_u_8, p12)
end
function v6.update(p13)
    local v14 = p13.options
    p13.header.Text = v14.header_text
    p13.sub_header.Text = v14.sub_header_text
    p13.header.AutoLocalize = v14.header_auto_localize
    p13.sub_header.AutoLocalize = v14.sub_header_auto_localize
end
return v6