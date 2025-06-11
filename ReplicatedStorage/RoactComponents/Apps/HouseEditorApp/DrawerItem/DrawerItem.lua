--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.DrawerItem (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientGamepassHelper")
local v_u_3 = v1("ClientStore")
local v_u_4 = v1("new:FurnitureEntryHelper")
local v_u_5 = v1("HouseDB")
local v_u_6 = v1("HouseEditorHelper")
local v_u_7 = v1("HouseRenderHelper")
local v_u_8 = v1("GamepassDB")
local v_u_9 = v1("Roact")
local v_u_10 = v1("UI")
local v_u_11 = v1("UIDB")
local v_u_12 = v1("UIManager")
local v_u_13 = v1("Debug").create_log()
local v_u_14 = utf8.char(57346)
local v_u_15 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v16 = v_u_9.PureComponent:extend("DrawerItem")
v16.defaultProps = {
    ["hide_names"] = false,
    ["tile_preview"] = false,
    ["tile_params"] = {}
}
function v16.render(p17)
    local v18 = p17.props
    local v_u_19 = v18.entry
    local v_u_20 = v_u_19.contents ~= nil
    local v_u_21 = v18.set_drawer
    local v22 = v18.layout_order
    local v_u_23 = v18.xbox_deselect
    local v24 = v18.hide_names
    local v25 = v18.tile_preview
    local v26 = {}
    local v27 = v_u_15:Translate(game.Players.LocalPlayer.PlayerGui, v_u_19.name)
    local v28 = v_u_4.get_cost(v_u_19)
    if v_u_20 then
        v26.item_name = v_u_9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0.9, 0, 0.9, 0),
            ["Position"] = UDim2.new(0.05, 0, 0.05, 0),
            ["Text"] = string.gsub(v27, " ", "\n"),
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["TextStrokeColor3"] = Color3.new(0, 0, 0),
            ["TextStrokeTransparency"] = v_u_19.folder_color == "YELLOW" and 0.7 or 1,
            ["Font"] = Enum.Font.SourceSansBold,
            ["AutoLocalize"] = false
        }, {
            ["ui_text_constraint"] = v_u_9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 21
            })
        })
    else
        if not v24 then
            v26.item_name = v_u_9.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, -12, 0.5, -6),
                ["Position"] = UDim2.new(0, 6, 0.5, 0),
                ["Text"] = v27,
                ["TextWrapped"] = true,
                ["TextSize"] = 15,
                ["TextColor3"] = Color3.fromRGB(0, 126, 255),
                ["TextStrokeTransparency"] = 0,
                ["TextStrokeColor3"] = Color3.new(1, 1, 1),
                ["TextYAlignment"] = Enum.TextYAlignment.Bottom,
                ["Font"] = Enum.Font.SourceSansBold,
                ["ZIndex"] = 3,
                ["AutoLocalize"] = false
            })
        end
        local v29
        if v_u_19.gamepass then
            v29 = v_u_14 .. (v_u_2.owns_gamepass(v_u_19.gamepass) and "Owned" or v_u_8[v_u_19.gamepass].cost)
        else
            v29 = not v28 and "$N/A" or (v28 <= 0 and "FREE" or ("$%*"):format(v28))
        end
        v26.price = v_u_9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, -12, 0.2, 0),
            ["Position"] = UDim2.new(0, 6, 0, 6),
            ["Text"] = v29,
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.fromRGB(0, 126, 255),
            ["TextStrokeTransparency"] = 0,
            ["TextStrokeColor3"] = Color3.new(1, 1, 1),
            ["TextYAlignment"] = Enum.TextYAlignment.Top,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Font"] = Enum.Font.SourceSansBold,
            ["ZIndex"] = 2
        })
        if v25 then
            local v30 = v_u_19.preview_tile_params
            local v31 = v30.tile_width
            local v32 = v30.tile_height
            local v33 = 79 / v31
            local v34 = math.ceil(v33)
            local v35 = math.max(3, v34)
            if v35 % 2 == 0 then
                v35 = v35 + 1
            end
            local v36 = 108 / v32
            local v37 = math.ceil(v36)
            local v38 = math.max(3, v37)
            if v38 % 2 == 0 then
                v38 = v38 + 1
            end
            v26.Clipper = v_u_9.createElement("Frame", {
                ["ClipsDescendants"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(0, 79, 0, 108),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
            }, {
                ["Image"] = v_u_9.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = v_u_19.image_id,
                    ["ScaleType"] = Enum.ScaleType.Tile,
                    ["TileSize"] = UDim2.new(0, v31, 0, v32),
                    ["ImageColor3"] = v_u_19.color3 or Color3.new(1, 1, 1),
                    ["Size"] = UDim2.new(0, v35 * v31, 0, v38 * v32),
                    ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                })
            })
        else
            v26.image = v_u_9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = v_u_19.image_id,
                ["Size"] = UDim2.new(0, v_u_19.image_size_x or 79, 0, v_u_19.image_size_y or 108),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                ["ImageColor3"] = v_u_19.color3 or Color3.new(1, 1, 1)
            })
        end
    end
    v26.entry_id = v_u_9.createElement("StringValue", {
        ["Value"] = v_u_19.id
    })
    return v_u_9.createElement(v_u_10.IconButton, {
        ["size"] = UDim2.new(0, 87, 0, 116),
        ["image"] = v_u_20 and (v_u_19.folder_color == "YELLOW" and v_u_11.FurnitureFolderYellow or v_u_11.FurnitureFolder) or v_u_11.FurnitureBorder,
        ["initial_color"] = v_u_19.folder_color == "YELLOW" and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(199, 199, 255),
        ["active_color"] = v_u_19.folder_color == "YELLOW" and Color3.fromRGB(255, 234, 0) or Color3.fromRGB(255, 255, 255),
        ["layout_order"] = v22,
        ["mouse_button1_down"] = function()
            if v_u_20 then
                v_u_21(v_u_19)
            elseif v_u_19.type == "furniture" then
                local v39 = {
                    ["xbox_deselect"] = v_u_23,
                    ["set_drawer"] = v_u_21
                }
                v_u_6.select_furniture_drawer_item(v_u_19, v39)
            elseif v_u_19.type == "walls" or v_u_19.type == "floors" then
                local v40 = v_u_3.store:getState()
                local v41 = v40.house_interior
                local v42 = v_u_5[v41.building_type] or {}
                if v_u_19.type == "walls" and v42.disable_setting_wall_textures or v_u_19.type == "floors" and v42.disable_setting_floor_textures then
                    v_u_12.apps.HintApp:hint({
                        ["text"] = ("You can\'t set %s in this house"):format(v_u_19.type),
                        ["overridable"] = true,
                        ["length"] = 5,
                        ["yields"] = false
                    })
                    return
                end
                local v43 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
                local v44 = workspace.HouseInteriors.blueprint:GetChildren()[1]
                local v45 = v_u_7.get_nearest_floor(v44, v43, v_u_19.type == "walls")
                if v45 then
                    v45 = v45.room_id
                end
                if v45 then
                    if v41 then
                        v41 = v41.textures
                    end
                    if v41 then
                        v41 = v41[v45]
                    end
                    if v41 then
                        v41 = v41[v_u_19.type]
                    end
                    if v41 == v_u_19.id then
                        v_u_13("Aborting texture change - already USING this texture")
                        return
                    end
                    local v46 = v40.texture_preview or {}
                    if v46.room_id == v45 and (v46.texture_type == v_u_19.type and v46.texture_id == v_u_19.id) then
                        v_u_13("Aborting texture change - already PREVIEWING this texture")
                        return
                    end
                    v_u_3.store:dispatch({
                        ["type"] = "set_texture_preview",
                        ["value"] = {
                            ["room_id"] = v45,
                            ["texture_type"] = v_u_19.type,
                            ["texture_id"] = v_u_19.id
                        }
                    })
                end
            end
            v_u_12.apps.HouseEditorWrapperApp.drawer_clicked:Fire(v_u_19)
        end
    }, v26)
end
return v16