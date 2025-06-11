--// ReplicatedStorage.RoactComponents.Elements.Backings (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIDB")
local v_u_3 = v1("Roact")
local v4 = {}
local v_u_5 = v_u_3.createElement
function v4.RoundedBacking(p6)
    local v7 = p6.position
    local v8 = p6.size
    local v9 = p6.anchor_point
    local v10 = p6.zindex
    local v11 = p6.visible
    local v12 = p6.sink_input
    local v13 = p6[v_u_3.Children]
    local v14 = p6[v_u_3.Ref]
    return v_u_5("ImageLabel", {
        ["Visible"] = v11,
        ["Active"] = v12,
        ["Image"] = v_u_2.RoundBacking,
        ["ScaleType"] = Enum.ScaleType.Slice,
        ["SliceCenter"] = Rect.new(10, 10, 20, 20),
        ["BackgroundTransparency"] = 1,
        ["Position"] = v7,
        ["Size"] = v8,
        ["AnchorPoint"] = v9,
        ["ZIndex"] = v10,
        [v_u_3.Ref] = v14
    }, v13)
end
return v4