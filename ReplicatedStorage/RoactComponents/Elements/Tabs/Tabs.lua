--// ReplicatedStorage.RoactComponents.Elements.Tabs (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("UIDB")
local v_u_2 = v1("Roact")
local v_u_3 = v1("UI")
local v4 = {}
local v_u_5 = v_u_2.createElement
function v4.UpperTabs(p6)
    local v7 = p6.size or UDim2.new()
    local v8 = p6.position or UDim2.new()
    local v9 = p6.selected_index or 1
    local v_u_10 = p6.on_tab_switched
    local v11 = p6.selected_color3 or Color3.new(0, 0.8274509803921568, 0)
    local v12 = p6.selectable
    local v13 = p6.ref
    local v14 = p6.tabs or { "not", "implemented" }
    local v15 = {}
    for v_u_16, v17 in pairs(v14) do
        v15["tab-" .. v_u_16] = v_u_5(v_u_3.FlatButton, {
            ["style"] = "FLAT",
            ["size"] = UDim2.new(1 / #v14, 0, 1, 0),
            ["position"] = UDim2.new(1 / #v14 * (v_u_16 - 1), 0, 0.5, 0),
            ["anchor_point"] = Vector2.new(0, 0.5),
            ["imagecolor3"] = v_u_16 == v9 and v11 and v11 or Color3.new(0.7, 0.7, 0.7),
            ["hover_scale_offset"] = 0,
            ["scale_button_only"] = true,
            ["effect"] = "COLOR",
            ["selectable"] = v12,
            [v_u_2.Ref] = v13,
            ["mouse_button1_click"] = function()
                v_u_10(v_u_16)
            end
        }, {
            ["text"] = v_u_5(v_u_3.ButtonText, {
                ["text"] = v17
            })
        })
    end
    return v_u_5("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = v7 - UDim2.new(0, 2, 0, 2),
        ["Position"] = v8 + UDim2.new(0, 1, 0, 1)
    }, v15)
end
return v4