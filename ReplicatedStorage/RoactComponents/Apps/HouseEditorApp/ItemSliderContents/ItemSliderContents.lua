--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.ItemSliderContents (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("EggEvent")
local v_u_3 = v1("HouseClient")
local v_u_4 = v1("new:TutorialHelper")
local v_u_5 = v1("Roact")
local v_u_6 = v1("UI")
v1("GamepassDB")
local v_u_7 = v1("ClientGamepassHelper")
local v_u_8 = require(script.Parent.DrawerItem)
return function(p9)
    local v10 = p9.drawer_content
    local v11 = {}
    local v12 = p9.set_drawer
    local v13 = p9.tween_x or 0
    local v14 = p9.xbox_deselect
    local v15 = p9.signal_close
    local v16 = 1
    if v10 then
        local v17 = not v_u_4.is_completed()
        local v18 = v_u_3.get_current_house_owner() == game.Players.LocalPlayer
        for v19, v20 in pairs(v10.contents) do
            if not (v20.hidden or (v_u_2.is_furniture_hidden(v20.id) or v20.contents and v_u_2.is_furnish_category_hidden(v20.name))) and ((not v20.gamepass or (v_u_7.owns_gamepass(v20.gamepass) or not v_u_7.should_hide(v20.gamepass))) and (v20.id ~= "build_with_friends" or v18 and not v17)) then
                local v21 = v20.layout_order or (v20.cost or v16)
                if v10.is_sorted then
                    v21 = v19
                end
                v11[v10.name .. "-" .. v19] = v_u_5.createElement(v_u_8, {
                    ["entry"] = v20,
                    ["set_drawer"] = v12,
                    ["layout_order"] = v21,
                    ["xbox_deselect"] = v14,
                    ["signal_close"] = v15,
                    ["hide_names"] = v10.hide_names,
                    ["tile_preview"] = v10.tile_preview
                })
                v16 = v16 + 1
            end
        end
        v11.ui_list_layout = v_u_5.createElement("UIListLayout", {
            ["Padding"] = UDim.new(0, 6),
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        })
    end
    return v_u_5.createElement(v_u_6.SlidingTween, {
        ["position"] = UDim2.new(0, v13, 0, 0),
        ["size"] = UDim2.new(0, (v16 + 1) * 93, 1, 0),
        ["tween_info"] = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    }, v11)
end