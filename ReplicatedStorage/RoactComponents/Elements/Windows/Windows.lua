--// ReplicatedStorage.RoactComponents.Elements.Windows (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Roact")
local v3 = v1("RoactRodux")
local v_u_4 = v1("UI")
v1("UIDB")
v1("WindowDB")
local v_u_5 = v1("TableUtil")
local v6 = {}
local v_u_7 = v_u_2.createElement
v6.PureContentWrapper = v_u_2.PureComponent:extend("PureContentWrapper")
function v6.PureContentWrapper.render(p8)
    local v9 = p8.props
    local v10 = v9.position
    local v11 = v9.layout_order
    return v_u_2.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["Position"] = v10,
        ["LayoutOrder"] = v11
    }, v_u_5.merge({ v9.content }, v9[v_u_2.Children] or {}))
end
local v12 = v_u_2.PureComponent:extend("WindowVisibilityWrapper")
function v12.shouldUpdate(p13, p14, _)
    local v15 = p13.props.window_visibility or {}
    return (p14.window_visibility or {})[p14.window_name] ~= v15[p13.props.window_name]
end
function v12.didUpdate(p16)
    local v17 = p16.props.visibility_changed
    local v18 = p16.props.window_visibility or {}
    local v19 = p16.props.window_name or ""
    if v17 then
        v17(v18[v19] or false)
    end
end
function v12.render(p20)
    local v21 = p20.props
    local v22 = (v21.window_visibility or {})[v21.window_name or ""] or false
    local v23 = v21[v_u_2.Children]
    local v24 = v_u_7(v_u_4.PureContentWrapper, {}, v23)
    return v_u_7("Frame", {
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BackgroundTransparency"] = 1,
        ["Visible"] = v22
    }, { v24 })
end
local v_u_26 = v3.connect(function(p25)
    return {
        ["window_visibility"] = p25:getState().window_visibility
    }
end)(v12)
function v6.Window(p27)
    local v28 = p27.window_name
    local v29 = p27.display_order
    local v30 = p27[v_u_2.Children]
    local v31 = v_u_7(v_u_26, {
        ["window_name"] = v28,
        ["visibility_changed"] = p27.visibility_changed
    }, v30)
    return v_u_7("ScreenGui", {
        ["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = v29 or 2,
        ["IgnoreGuiInset"] = true
    }, {
        ["visibility_wrapper"] = v31
    })
end
return v6