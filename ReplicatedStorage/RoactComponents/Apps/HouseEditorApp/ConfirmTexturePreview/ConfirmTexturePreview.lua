--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.ConfirmTexturePreview (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("ClientStore")
local v_u_4 = v1("new:FurnitureEntryHelper")
local v_u_5 = v1("HouseEditorHelper")
local v_u_6 = v1("PlatformM")
local v_u_7 = v1("Roact")
local v_u_8 = v1("RouterClient")
local v_u_9 = v1("TexturesDB")
local v_u_10 = v1("UIManager")
local v_u_11 = v1("UI")
local v_u_12 = v1("UIDB")
local v13 = v_u_7.PureComponent:extend("ConfirmTexturePreview")
function v13.didUpdate(p14)
    local v15 = p14.props
    local v16 = v15.texture_preview
    local v17 = v15.hide_confirmation_menu
    if v_u_6.is_using_gamepad() then
        if v16 ~= nil and v17 == false then
            if v15.xbox_support_watch:is_active() then
                p14.last_selected_obj = game:GetService("GuiService").SelectedObject
                p14.was_visible = true
                v15.xbox_support_watch:select_object(p14.confirm_button)
            end
        end
        if p14.was_visible then
            p14.was_visible = false
            v15.xbox_support_watch:select_object(p14.last_selected_obj)
        end
    end
end
function v13.render(p_u_18)
    local v19 = p_u_18.props
    local v_u_20 = v19.texture_preview
    local v21 = v19.hide_confirmation_menu
    local v22 = v_u_7.createElement
    local v23 = v_u_11.RoundedBacking
    local v24 = {}
    local v25
    if v_u_20 == nil then
        v25 = false
    else
        v25 = v21 == false
    end
    v24.visible = v25
    v24.position = UDim2.new(0.5, 0.5, 1, -6)
    v24.anchor_point = Vector2.new(0.5, 1)
    v24.size = UDim2.new(0, 250, 0, 90)
    v24[v_u_7.Ref] = function(p26)
        local v27 = v_u_2.get("tutorial_data") or {}
        v27.confirm_texture = p26
        v_u_2.update("tutorial_data", v27)
    end
    return v22(v23, v24, v_u_20 and {
        ["text"] = v_u_7.createElement("TextLabel", {
            ["Size"] = UDim2.new(1, 0, 0, 36),
            ["BackgroundTransparency"] = 1,
            ["Text"] = "Keep " .. (v_u_20.texture_type == "floors" and "Floor" or "Wallpaper") .. "?",
            ["TextColor3"] = Color3.fromRGB(0, 126, 255),
            ["Font"] = Enum.Font.SourceSansBold,
            ["TextSize"] = 28
        }),
        ["confirm"] = v_u_7.createElement(v_u_11.IconButton, {
            ["image"] = v_u_12.AcceptSymbol,
            ["initial_color"] = Color3.fromRGB(134, 255, 145),
            ["active_color"] = Color3.fromRGB(0, 221, 21),
            ["size"] = UDim2.new(0, 46, 0, 36),
            ["position"] = UDim2.new(0, 129, 0, 40),
            ["mouse_button1_down"] = function()
                v_u_3.store:dispatch({
                    ["type"] = "set_texture_preview",
                    ["hide_confirmation_menu"] = true
                })
                local v28 = v_u_9[v_u_20.texture_type][v_u_20.texture_id]
                local v29 = v_u_4.get_cost(v28)
                if (v29 < 1000 and true or v_u_10.apps.DialogApp:dialog({
                    ["text"] = ("Would you like to purchase %* for $%*"):format(v28.name, v29),
                    ["left"] = "Cancel",
                    ["right"] = "Yes"
                }) == "Yes") and v_u_5.pre_buy_auto(v29) then
                    v_u_8.get("HousingAPI/BuyTexture"):FireServer(v_u_20.room_id, v_u_20.texture_type, v_u_20.texture_id)
                    v_u_5.set_tutorial_data("texture_purchase_successful", true)
                else
                    v_u_3.store:dispatch({
                        ["type"] = "set_texture_preview",
                        ["value"] = "NONE"
                    })
                end
            end,
            [v_u_7.Ref] = function(p30)
                p_u_18.confirm_button = p30
            end
        }),
        ["decline"] = v_u_7.createElement(v_u_11.IconButton, {
            ["image"] = v_u_12.DeclineSymbol,
            ["initial_color"] = Color3.fromRGB(255, 76, 76),
            ["active_color"] = Color3.fromRGB(255, 0, 0),
            ["size"] = UDim2.new(0, 35, 0, 36),
            ["position"] = UDim2.new(0, 79, 0, 40),
            ["mouse_button1_down"] = function()
                v_u_3.store:dispatch({
                    ["type"] = "set_texture_preview",
                    ["value"] = "NONE"
                })
            end
        })
    } or v_u_20)
end
return v13