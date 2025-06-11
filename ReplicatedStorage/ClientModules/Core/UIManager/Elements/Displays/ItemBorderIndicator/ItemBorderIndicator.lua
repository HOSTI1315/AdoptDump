--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.ItemBorderIndicator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ColorThemeManager")
local v_u_4 = game:GetService("ReplicatedStorage").Resources.UI_Resources.Templates
local v5 = v2("ItemBorderIndicator", v1("UIBaseElement"))
function v5._refresh(p6)
    local v7 = p6.style
    local v8 = true
    local v9 = nil
    local v10 = nil
    local v11 = nil
    local v12 = nil
    local v13 = nil
    if v7 == "equipped" then
        v9 = Color3.fromRGB(74, 198, 85)
        if v_u_3.get_theme_color() == "green" then
            v9 = v_u_3.lookup_specific_color("yellow", "saturated")
        end
        v11 = true
        v10 = "rbxassetid://4737143398"
    elseif v7 == "worn_by_pet" then
        v9 = Color3.fromRGB(100, 100, 100)
        v11 = true
        v10 = "rbxassetid://4710556318"
    elseif v7 == "placeable_item_placed" then
        v9 = Color3.fromRGB(100, 100, 100)
        v11 = true
        v10 = "rbxassetid://9110936426"
    elseif v7 == "hidden" then
        v11 = false
    elseif v7 == "pinned" then
        v9 = v_u_3.lookup("saturated")
        v11 = true
        v10 = ""
        v8 = false
    elseif v7 == "pinned_equipped" then
        v9 = v_u_3.lookup("saturated")
        v11 = true
        v10 = "rbxassetid://4737143398"
    elseif v7 == "friend" or v7 == "friend_small" then
        v11 = true
        v12 = true
        v8 = false
        if v7 == "friend_small" then
            p6.indicator_frame.FriendshipBorder.SliceScale = 0.6
            p6.indicator_frame.FriendshipIcon.Size = UDim2.fromOffset(7, 6)
            p6.indicator_frame.FriendshipIcon.Position = UDim2.new(0.5, 0, 0, 1)
        end
    elseif v7 == "unowned_export_item" then
        v9 = Color3.fromRGB(200, 62, 66)
        v13 = {
            ["Image"] = "rbxassetid://14617981312",
            ["Size"] = UDim2.new(0, 24, 0, 24),
            ["Position"] = UDim2.new(1, -4, 0, 4),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["ImageColor3"] = Color3.fromRGB(200, 62, 66)
        }
        v11 = true
        v8 = false
    elseif v7 == "owned_export_item" then
        v9 = Color3.fromRGB(74, 198, 85)
        v13 = {
            ["Image"] = "rbxassetid://14617981190",
            ["Size"] = UDim2.new(0, 24, 0, 24),
            ["Position"] = UDim2.new(1, -4, 0, 4),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["ImageColor3"] = Color3.fromRGB(74, 198, 85)
        }
        v11 = true
        v8 = false
    else
        warn("Invalid style passed into item border indicator")
    end
    if v11 then
        p6.indicator_frame.ImageColor3 = v9 or p6.indicator_frame.ImageColor3
        p6.corner.ImageColor3 = v9 or p6.corner.ImageColor3
        p6.pip.Image = v10 or p6.pip.Image
        p6.corner.Visible = v8
        p6.pip.Visible = v8
        p6.pip.ZIndex = 2
        p6.indicator_frame.Visible = true
        p6.indicator_frame.FriendshipBorder.Visible = v12
        p6.indicator_frame.FriendshipIcon.Visible = v12
        p6.indicator_frame.ImageTransparency = v12 and 1 or 0
        if v13 then
            local v14 = p6.indicator_frame:FindFirstChild("CustomIcon") or Instance.new("ImageLabel")
            v14.Name = "CustomIcon"
            v14.BackgroundTransparency = 1
            for v15, v16 in v13 do
                v14[v15] = v16
            end
            v14.Parent = p6.indicator_frame
        elseif p6.indicator_frame:FindFirstChild("CustomIcon") then
            p6.indicator_frame.CustomIcon:Destroy()
        end
    else
        p6.indicator_frame.Visible = false
        return
    end
end
function v5.update_style(p17, p18)
    if p17.style ~= p18 then
        p17.style = p18
        p17:_refresh()
    end
end
function v5.start(p_u_19, p20)
    local v21 = v_u_4.ItemBorderIndicatorTemplate:Clone()
    v21.Parent = p_u_19.instance
    p_u_19.indicator_frame = v21
    p_u_19.corner = v21.Corner
    p_u_19.pip = v21.Pip
    p_u_19:update_style(p20.style)
    p_u_19.theme_connection = v_u_3.get_theme_changed_signal():Connect(function()
        p_u_19:_refresh()
    end)
    p_u_19.destroying_connection = p_u_19.indicator_frame.Destroying:Once(function()
        p_u_19.theme_connection:Disconnect()
        p_u_19.theme_connection = nil
    end)
    return p_u_19
end
function v5.destroy(p22)
    p22.indicator_frame:Destroy()
    p22.destroying_connection:Disconnect()
end
return v5