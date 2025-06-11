--// ReplicatedStorage.ClientModules.Game.CriminalCrusher (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("SoundPlayer")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = game:GetService("Players")
game:GetService("ReplicatedStorage")
local v_u_6 = Random.new()
local v_u_7 = {}
local function v_u_12(p8)
    local v9 = string.split(p8, ",")
    for v10, v11 in pairs(v9) do
        v9[v10] = tonumber(v11) / 255
    end
    return Color3.new(unpack(v9))
end
local function v_u_22(p13)
    local v14 = {}
    for _, v15 in pairs(p13:GetDescendants()) do
        if v15:IsA("BasePart") and v15.Transparency <= 0.9 then
            local v16 = v15.Color
            local v17 = string.format("%d,%d,%d", v16.R * 255, v16.G * 255, v16.B * 255)
            v14[v17] = (v14[v17] or 0) + v15.Size.X * v15.Size.Y * v15.Size.Z
        end
    end
    local v18 = -1
    local v19 = nil
    for v20, v21 in pairs(v14) do
        if v18 < v21 then
            v19 = v20
            v18 = v21
        end
    end
    if v19 then
        return v_u_12(v19)
    else
        return Color3.new(1, 1, 1)
    end
end
local function v_u_34(p23)
    local v24 = p23:GetBoundingBox()
    local v25 = p23.PrimaryPart
    local v26 = Instance.new("Part")
    v26.CFrame = CFrame.new(v24.Position)
    v26.Parent = p23
    p23.PrimaryPart = v26
    local v27, v28 = p23:GetBoundingBox()
    v26:Destroy()
    p23.PrimaryPart = v25
    local v29 = Instance.new("Part")
    v29.Anchored = true
    v29.CanCollide = false
    v29.Color = Color3.new(0.5, 1, 1)
    v29.Transparency = 1
    v29.CFrame = v27
    local v30 = v28.X
    local v31 = v28.Y
    v29.Size = Vector3.new(v30, 1, v31)
    local v32 = Instance.new("ParticleEmitter")
    v32.Name = "Emitter"
    v32.Texture = "rbxasset://textures/particles/smoke_main.dds"
    v32.Color = ColorSequence.new(v_u_22(p23))
    v32.Lifetime = NumberRange.new(2, 2)
    v32.Speed = NumberRange.new(32, 64)
    local v33 = -workspace.Gravity
    v32.Acceleration = Vector3.new(0, v33, 0)
    v32.SpreadAngle = Vector2.new(15, 15)
    v32.Transparency = NumberSequence.new(0, 1)
    v32.Rotation = NumberRange.new(0, 360)
    v32.RotSpeed = NumberRange.new(-720, 720)
    v32.Rate = 64
    v32.Parent = v29
    return v29
end
local v_u_35 = {}
local function v_u_40(p36)
    local v_u_37 = p36.Parent
    if v_u_37 then
        if v_u_4:HasTag(v_u_37, "is_being_crushed") then
            return
        else
            local v38 = v_u_37:GetAttribute("network_owner_name")
            if v38 then
                local v39 = v_u_5:FindFirstChild(v38)
                if v39 then
                    if v39 == v_u_5.LocalPlayer then
                        if v_u_35[v_u_37] == nil then
                            v_u_35[v_u_37] = true
                            task.delay(5, function()
                                v_u_35[v_u_37] = nil
                            end)
                            v_u_2.get("RoleplayAPI/CrushFurniture"):FireServer(v_u_37)
                            v_u_7.furniture_crush_animation(v_u_37)
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        end
    else
        return
    end
end
function v_u_7.furniture_crush_animation(p_u_41)
    local v_u_42 = v_u_34(p_u_41)
    v_u_42.Parent = workspace
    local v43 = CFrame.Angles(v_u_6:NextNumber(-3.141592653589793, 3.141592653589793), v_u_6:NextNumber(-3.141592653589793, 3.141592653589793), v_u_6:NextNumber(-3.141592653589793, 3.141592653589793))
    v_u_3.FX:play("Roleplay/CriminalCrusherCrush", v_u_42)
    local v_u_44 = p_u_41:GetPrimaryPartCFrame()
    local v_u_45 = v_u_44 * v43 + Vector3.new(0, -32, 0)
    local v_u_46 = v_u_42.Position
    local v_u_47 = v_u_42.Position + Vector3.new(0, -32, 0)
    local v_u_48 = 0
    task.spawn(function()
        while v_u_48 < 4 do
            v_u_48 = v_u_48 + task.wait()
            local v49 = v_u_48 / 4
            v_u_42.Position = v_u_46:Lerp(v_u_47, v49)
            p_u_41:SetPrimaryPartCFrame(v_u_44:Lerp(v_u_45, v49))
        end
        v_u_42.Emitter.Enabled = false
        task.wait(v_u_42.Emitter.Lifetime.Max)
        v_u_42:Destroy()
        p_u_41:Destroy()
    end)
end
function v_u_7.set_up_crusher(p50)
    p50.Touched:Connect(v_u_40)
    p50.Loop:Play()
end
function v_u_7.init()
    v_u_2.get("RoleplayAPI/FurnitureCrushed").OnClientEvent:Connect(function(p51)
        v_u_7.furniture_crush_animation(p51)
    end)
end
return v_u_7