--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Watermark (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("GitInfo")
local v3 = v1("Signal")
local v4 = v1("Class")
local v_u_5 = v1("Maid")
local v_u_6 = v1("package:Promise")
local v7 = game:GetService("Players")
local v8 = game:GetService("RunService")
local v_u_9 = game:GetService("MarketplaceService")
local v_u_10 = newproxy(true)
local v_u_11 = not v8:IsStudio()
local v_u_12 = {
    ["place_name"] = v_u_10,
    ["game_id"] = game.GameId,
    ["game_version"] = v2.get().commit_hash_short,
    ["user_name"] = v7.LocalPlayer.Name,
    ["user_id"] = v7.LocalPlayer.UserId,
    ["date"] = DateTime.now():FormatUniversalTime("YYYY-MM-DD", "en-us")
}
local v_u_13 = v3.new()
local v14 = v4("Watermark", v1("UIBaseElement"))
function v14._update_tile(p15, p16)
    for _, v17 in p16:GetChildren() do
        if v17:IsA("TextLabel") then
            local v18 = v17.LayoutOrder
            local v19 = p15.label_infos[v18]
            if v19 then
                local v20 = v19.value
                v17.Text = tostring(v20)
                v17.TextTransparency = v19.transparency or 0.8
            end
        end
    end
end
function v14._make_template_tile(p21)
    local v22 = Instance.new("Frame")
    v22.BackgroundTransparency = 1
    v22.Size = UDim2.fromOffset(165, 195)
    local v23 = Instance.new("UIPadding")
    v23.Parent = v22
    v23.PaddingTop = UDim.new(0, 5)
    v23.PaddingBottom = UDim.new(0, 5)
    v23.PaddingLeft = UDim.new(0, 5)
    v23.PaddingRight = UDim.new(0, 5)
    local v24 = Instance.new("UIListLayout")
    v24.Parent = v22
    v24.Padding = UDim.new(0, 0)
    v24.FillDirection = Enum.FillDirection.Vertical
    v24.HorizontalAlignment = Enum.HorizontalAlignment.Center
    v24.VerticalAlignment = Enum.VerticalAlignment.Center
    v24.SortOrder = Enum.SortOrder.LayoutOrder
    local v25 = Instance.new("TextLabel")
    v25.BackgroundTransparency = 1
    v25.Font = Enum.Font.GothamMedium
    v25.TextColor3 = Color3.fromRGB(255, 255, 255)
    v25.TextTransparency = 0.8
    v25.TextScaled = true
    v25.Size = UDim2.new(1, 0, 0, 30)
    local v26 = Instance.new("UITextSizeConstraint")
    v26.Parent = v25
    v26.MaxTextSize = 30
    for v27, v28 in p21.label_infos do
        v25.Name = v28.name
        v25.LayoutOrder = v27
        v25.Size = UDim2.new(1, 0, 0, v28.text_size * 1.5)
        v25.Font = v28.text_size < 45 and Enum.Font.GothamBold or Enum.Font.GothamMedium
        v26.MaxTextSize = v28.text_size * 1.5
        v25:Clone().Parent = v22
    end
    p21:_update_tile(v22)
    return v22
end
function v14._make_grid(p29, p30)
    local v31 = Instance.new("Frame")
    v31.Name = "Grid"
    v31.BackgroundTransparency = 1
    v31.Parent = p29.frame
    local v32 = Instance.new("UIGridLayout")
    v32.Parent = v31
    v32.CellSize = p30
    v32.CellPadding = UDim2.fromOffset(0, 0)
    v32.HorizontalAlignment = Enum.HorizontalAlignment.Center
    v32.VerticalAlignment = Enum.VerticalAlignment.Top
    return v31
end
function v14._update(p33)
    p33:_update_tile(p33.template_tile)
    for _, v34 in p33.tiles do
        p33:_update_tile(v34)
    end
    local v35 = p33.template_tile.AbsoluteSize
    local v36 = p33.instance.AbsoluteSize.x / v35.x
    local v37 = math.ceil(v36)
    local v38 = p33.instance.AbsoluteSize.y / v35.y
    local v39 = v37 * math.ceil(v38) + 1
    local v40 = p33.grid_frame
    local v41 = UDim2.fromOffset
    local v42 = p33.instance.AbsoluteSize.x / v35.x
    local v43 = math.ceil(v42) * v35.x + 2
    local v44 = p33.instance.AbsoluteSize.y / v35.y
    v40.Size = v41(v43, math.ceil(v44) * v35.y + 2)
    if #p33.tiles < v39 then
        for v45 = #p33.tiles + 1, v39 do
            local v46 = p33.template_tile:Clone()
            v46.Name = string.format("TileFrame %d", v45)
            v46.Parent = p33.grid_frame
            local v47 = p33.tiles
            table.insert(v47, v46)
        end
    else
        while v39 < #p33.tiles do
            table.remove(p33.tiles):Destroy()
        end
    end
end
function v14.is_visible(p48)
    return p48.frame.Visible
end
function v14.set_visible(p49, p50)
    p49.frame.Visible = p50
end
function v14.start(p_u_51, p52)
    p_u_51.maid = v_u_5.new()
    p_u_51.label_infos = p52(v_u_12)
    p_u_51.frame = Instance.new("Frame")
    p_u_51.frame.Name = "Watermark"
    p_u_51.frame.Size = UDim2.fromScale(1, 1)
    p_u_51.frame.BackgroundTransparency = 1
    p_u_51.frame.Visible = false
    p_u_51.frame.Parent = p_u_51.instance
    p_u_51.template_tile = p_u_51:_make_template_tile()
    p_u_51.grid_frame = p_u_51:_make_grid(p_u_51.template_tile.Size)
    p_u_51.tiles = {}
    p_u_51:_update()
    p_u_51.maid:GiveTask(p_u_51.instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_51:_update()
    end))
    p_u_51.maid:GiveTask(v_u_13:Connect(function()
        p_u_51:_update()
    end))
    p_u_51.maid:GiveTask(p_u_51.template_tile)
    p_u_51.maid:GiveTask(p_u_51.grid_frame)
    p_u_51.maid:GiveTask(p_u_51.frame)
    p_u_51.maid:GiveTask(function()
        for _, v53 in p_u_51.tiles do
            v53:Destroy()
        end
    end)
    return p_u_51
end
function v14.destroy(p54)
    p54.maid:DoCleaning()
end
(function()
    local v_u_55 = "(Unknown)"
    local v56 = v_u_10
    getmetatable(v56).__tostring = function()
        return v_u_55
    end
    v_u_6.try(function()
        if game.PlaceId == 0 then
            v_u_55 = "Local file"
        else
            v_u_55 = v_u_6.retry(function()
                local v57, v58 = pcall(function()
                    return v_u_9:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
                end)
                if v57 then
                    return v_u_6.resolve(v58)
                end
                if v_u_11 then
                    warn(v58)
                end
                task.wait(300)
                return v_u_6.reject()
            end, (1 / 0)):expect().Name
        end
    end):andThen(function()
        v_u_13:Fire()
    end)
end)()
return v14