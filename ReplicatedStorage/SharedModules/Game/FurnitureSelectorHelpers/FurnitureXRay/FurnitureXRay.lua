--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureXRay (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("FurnitureModelTracker")
local v_u_3 = v1("InteractionsEngine")
local v_u_4 = v1("FurnitureBounds")
local v5 = v1("Signal")
local v_u_6 = v1("Maid")
local v7 = game:GetService("Players")
local v_u_8 = game:GetService("UserInputService")
local v_u_9 = {}
local v_u_10 = false
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = v5.new()
local v_u_14 = Instance.new("Folder")
v_u_14.Name = "FurnitureXRay"
v_u_14.Parent = v7.LocalPlayer.PlayerGui
local v_u_15 = Instance.new("WorldModel")
v_u_15.Parent = v_u_14
local v_u_16 = Instance.new("Highlight")
v_u_16.FillTransparency = 1
v_u_16.Parent = v_u_14
local v_u_17 = nil
local function v_u_27(p_u_18)
    if not v_u_11[p_u_18] then
        local v_u_19, v_u_20 = v_u_4.get_furniture_selection_cframe_size(p_u_18.PlacementBlock.CFrame, true, { p_u_18 })
        local v21 = v_u_6.new()
        local v_u_22 = Instance.new("BoxHandleAdornment")
        v_u_22.Color3 = Color3.fromRGB(85, 255, 0)
        v_u_22.Transparency = v_u_10 and 0.7 or 1
        v_u_22.Adornee = workspace.Terrain
        v_u_22.AlwaysOnTop = true
        v_u_22.ZIndex = 1
        v_u_22.CFrame = v_u_19
        v_u_22.Size = v_u_20
        v_u_22.Parent = v_u_14
        local v_u_23 = Instance.new("Part")
        v_u_23.Anchored = true
        v_u_23.CFrame = v_u_19
        v_u_23.Size = v_u_20
        v_u_23.Parent = v_u_15
        v21:GiveTask(v_u_22.MouseEnter:Connect(function()
            v_u_13:Fire()
        end))
        v21:GiveTask(v_u_22.MouseLeave:Connect(function()
            v_u_13:Fire()
        end))
        v21:GiveTask(function()
            v_u_12[v_u_23] = nil
            v_u_23:Destroy()
            v_u_22:Destroy()
            v_u_13:Fire()
        end)
        v_u_12[v_u_23] = p_u_18
        v_u_11[p_u_18] = {
            ["maid"] = v21,
            ["box_handle"] = v_u_22,
            ["box_collision"] = v_u_23,
            ["update"] = function()
                local v24 = { p_u_18 }
                local v25, v26 = v_u_4.get_furniture_selection_cframe_size(p_u_18.PlacementBlock.CFrame, true, v24)
                v_u_19 = v25
                v_u_20 = v26
                v_u_23.CFrame = v_u_19
                v_u_23.Size = v_u_20
                v_u_22.CFrame = v_u_19
                v_u_22.Size = v_u_20
            end
        }
    end
end
function v_u_9.update_xray(p28)
    local v29 = v_u_11[p28]
    if v29 then
        v29.update()
    end
end
function v_u_9.is_enabled()
    return v_u_10
end
function v_u_9.set_enabled(p30)
    v_u_10 = p30
    if v_u_10 then
        v_u_3:disable("FurnitureXRay")
    else
        v_u_3:enable("FurnitureXRay")
    end
    v_u_16.Enabled = v_u_10
    if v_u_10 then
        v_u_16.Adornee = v_u_17
    else
        v_u_16.Adornee = nil
    end
    for _, v31 in v_u_11 do
        v31.box_handle.Transparency = v_u_10 and 0.7 or 1
    end
end
function v_u_9.toggle_enabled()
    v_u_9.set_enabled(not v_u_10)
end
function v_u_9.get_collision_box(p32)
    local v33 = v_u_11[p32]
    if v33 then
        return v33.box_collision
    else
        return nil
    end
end
function v_u_9.init()
    for _, v34 in v_u_2.get_furniture_models() do
        v_u_27(v34)
    end
    v_u_2.furniture_changed:Connect(function(p35, p36)
        if p36 then
            v_u_27(p35)
        elseif v_u_11[p35] then
            v_u_11[p35].maid:DoCleaning()
            v_u_11[p35] = nil
        end
    end)
    v_u_13:Connect(function()
        local v37 = v_u_8:GetMouseLocation()
        local v38 = workspace.CurrentCamera:ViewportPointToRay(v37.X, v37.Y)
        local v39 = RaycastParams.new()
        local v40 = v_u_15:Raycast(v38.Origin, v38.Direction.unit * 1000)
        local v41 = {}
        while v40 and not v_u_12[v40.Instance] do
            local v42 = v40.Instance
            table.insert(v41, v42)
            v39.FilterDescendantsInstances = v41
            v40 = v_u_15:Raycast(v38.Origin, v38.Direction.unit * 1000)
        end
        if v40 then
            v40 = v_u_12[v40.Instance]
        end
        v_u_17 = v40
        if v_u_10 then
            v_u_16.Adornee = v_u_17
        end
    end)
    v_u_9.set_enabled(false)
end
return v_u_9