--// ReplicatedStorage.ClientServices.SinglePurpose.PetCollectorsSign (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("RarityDB")
local v_u_4 = v1("ColorThemeManager")
local v_u_5 = v1("Set")
local v_u_6 = v1("ClientData")
local v_u_7 = v1("TableUtil")
local v_u_8 = v1("EggEvent")
local v_u_9 = v1("ItemHider")
local v10 = {}
local function v_u_14()
    local v11 = v_u_5.new()
    local v12 = v_u_6.get("inventory")
    for _, v13 in pairs(v12.pets) do
        v11:add(v13.id)
    end
    return v11
end
local v_u_15 = nil
local v_u_16 = nil
local function v_u_31()
    local v17 = workspace:WaitForChild("Interiors"):FindFirstChild("Nursery")
    if v17 then
        local v18 = v17.CollectorsSign.Main.SurfaceGui.Frame.Body.ScrollComplex
        local v19 = v18.ScrollingFrame.Content
        v18.ScrollbarBacking.ImageColor3 = v_u_4.lookup("saturated")
        v17.CollectorsSign.Main.SurfaceGui.Frame.Foreground.ImageColor3 = v_u_4.lookup("background")
        if v_u_15 == nil then
            v_u_15 = v19.ItemTemplate
            v_u_15.Parent = nil
        end
        for _, v20 in pairs(v19:GetChildren()) do
            if v20:IsA("ImageButton") then
                v20:Destroy()
            end
        end
        local v21 = {}
        for _, v22 in pairs(v_u_2.pets) do
            if not (v_u_9.is_item_hidden(v22) or (v22.is_egg or (v22.hide_from_collectors_sign or v22.permanently_delete_all_copies_of_this_item_from_the_game))) then
                table.insert(v21, v22)
            end
        end
        table.sort(v21, function(p23, p24)
            local v25 = v_u_3[p23.rarity].value
            local v26 = v_u_3[p24.rarity].value
            if v25 == v26 then
                return p23.name < p24.name
            else
                return v25 < v26
            end
        end)
        local v27 = v_u_14()
        v_u_16 = v27
        for v28, v29 in pairs(v21) do
            local v30 = v_u_15:clone()
            v30.LayoutOrder = v28
            v30.ItemImage.Image = v29.image
            if v27:has(v29.id) then
                v30.ClaimedFill:Destroy()
            else
                v30.ClaimedFill.ImageColor3 = v_u_3[v29.rarity].color
            end
            v30.Parent = v19
        end
        v18.ScrollingFrame.CanvasSize = UDim2.new(1, 0, 0, v19.UIGridLayout.AbsoluteContentSize.Y + 35)
    end
end
function v10.init()
    workspace:WaitForChild("Interiors").ChildAdded:connect(function(p32)
        if p32.Name == "Nursery" then
            v_u_31()
        end
    end)
    v_u_6.register_callback("inventory", function()
        local v33 = v_u_14()
        if not v_u_7.shallow_equal(v_u_16 or {}, v33) then
            v_u_31()
        end
    end)
    v_u_8.delay_until_release():andThen(function()
        v_u_31()
    end)
end
return v10