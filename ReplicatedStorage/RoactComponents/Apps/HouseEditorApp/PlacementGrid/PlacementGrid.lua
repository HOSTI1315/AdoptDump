--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.PlacementGrid (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("FurnitureEditorTelemetry")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("Roact")
local v_u_5 = v1("UI")
local v_u_6 = v1("UIManager")
local v_u_7 = v_u_3.get_platform()
return function(p_u_8)
    local v9 = p_u_8.editor_state
    local v_u_10 = v_u_6.apps.FurnitureSelectorApp
    return v_u_4.createElement(v_u_5.RoundedBacking, {
        ["visible"] = v9 == "Edit",
        ["position"] = v_u_7 == v_u_3.platform.phone and UDim2.new(1, -6, 1, -6) or (v_u_7 == v_u_3.platform.tablet and UDim2.new(0, 13, 1, -8) or UDim2.new(0, 13, 1, -69)),
        ["anchor_point"] = v_u_7 == v_u_3.platform.phone and Vector2.new(1, 1) or Vector2.new(0, 1),
        ["size"] = v_u_7 == v_u_3.platform.phone and UDim2.new(0, 115, 0, 66) or UDim2.new(0, 188, 0, 66),
        ["zindex"] = p_u_8.zindex
    }, {
        ["label"] = v_u_4.createElement("TextLabel", {
            ["Position"] = UDim2.new(0, 12, 0, 4),
            ["Size"] = UDim2.new(1, -24, 0, 21),
            ["BackgroundTransparency"] = 1,
            ["Text"] = v_u_7 == v_u_3.platform.phone and "Grid Size:" or "Placement Grid Size:",
            ["TextColor3"] = Color3.new(0, 0.592156862745098, 1),
            ["TextScaled"] = true,
            ["Font"] = Enum.Font.SourceSansBold
        }),
        ["button"] = v_u_4.createElement(v_u_5.FlatButton, {
            ["position"] = UDim2.new(0.5, 0, 0, 28),
            ["anchor_point"] = Vector2.new(0.5, 0),
            ["size"] = UDim2.new(1, -24, 0, 32),
            ["mouse_button1_down"] = function()
                v_u_2.log_tool_toggled_changes(function()
                    v_u_10:increment_placement_grid_size(-1)
                end)
                p_u_8.force_refresh()
            end
        }, {
            ["text"] = v_u_4.createElement(v_u_5.ButtonText, {
                ["text"] = v_u_10:get_placement_grid_size():gsub("^%l", string.upper)
            })
        })
    })
end