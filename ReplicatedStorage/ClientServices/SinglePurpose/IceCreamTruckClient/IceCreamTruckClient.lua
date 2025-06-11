--// ReplicatedStorage.ClientServices.SinglePurpose.IceCreamTruckClient (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v2("RouterClient")
local v_u_4 = v2("SoundPlayer")
local v_u_5 = v2("MusicOverride")
local v_u_6 = v2("new:StreamingHelper")
local v_u_7 = v2("package:Promise")
local v8 = {}
local function v_u_17(p9, p10)
    local v11 = Color3.new
    local v12 = 3.141592653589793 * (p9 + 0)
    local v13 = math.sin(v12) ^ 2 * p10
    local v14 = 3.141592653589793 * (p9 + 0.3333333333333333)
    local v15 = math.sin(v14) ^ 2 * p10
    local v16 = 3.141592653589793 * (p9 + 0.6666666666666666)
    return v11(v13, v15, math.sin(v16) ^ 2 * p10)
end
local function v_u_39(p_u_18)
    local v_u_19 = v_u_4.FX:play("IceCreamTruckMusic")
    v_u_19.MaxDistance = 65
    v_u_19.Parent = p_u_18.IceCreamTruckHorn
    v_u_5.register_sound(v_u_19)
    local v20 = {}
    for _, v21 in ipairs(p_u_18.Particles:GetDescendants()) do
        if v21:IsA("ParticleEmitter") or v21:IsA("Beam") then
            v21.Enabled = true
            table.insert(v20, v21)
        end
    end
    local v_u_22 = p_u_18.IceCreamTruckHorns.Mesh
    local v23 = p_u_18.IceCreamConeTop.Color
    p_u_18.IceCreamConeTop.Material = Enum.Material.Neon
    p_u_18.Particles.BottomLight.PointLight.Enabled = true
    local v_u_24 = 0
    local v36 = v_u_1.Heartbeat:Connect(function(p25)
        if p_u_18:IsDescendantOf(workspace) then
            v_u_24 = v_u_24 + p25
            local v26 = (tick() * 0.75 + 0.05) % 0.30000000000000004
            local v27 = v26 - 0.05
            local v28
            if v26 <= 0.1 then
                local v29 = 3.141592653589793 * v27 / 0.1
                v28 = math.sin(v29) + 1
            else
                local v30 = 3.141592653589793 * (v27 - -0.05) / 0.2
                v28 = math.sin(v30) + 1
            end
            local v31 = math.abs(v28) * 0.5
            local v32 = v_u_22
            local v33 = v31 + 1
            v32.Scale = Vector3.new(1, 1, v33)
            local v34 = v_u_22
            local v35 = -v31 / 2
            v34.Offset = Vector3.new(0, 0, v35)
            p_u_18.IceCreamConeTop.Color = v_u_17(v_u_24 * 0.2, 0.9)
        end
    end)
    v_u_7.async(function(p37, _)
        v_u_19.Ended:Wait()
        p37()
    end):timeout(35):await()
    v36:Disconnect()
    v_u_19:Destroy()
    for _, v38 in ipairs(v20) do
        v38.Enabled = false
    end
    p_u_18.IceCreamConeTop.Color = v23
    p_u_18.IceCreamConeTop.Material = Enum.Material.SmoothPlastic
    v_u_22.Scale = Vector3.new(1, 1, 1)
    v_u_22.Offset = Vector3.new(0, 0, 0)
    p_u_18.Particles.BottomLight.PointLight.Enabled = false
end
function v8.init()
    v_u_3.get_event("VehicleAPI/IceCreamTruckHornStarted").OnClientEvent:connect(function(p40)
        local v41 = v_u_6.await(p40, 5)
        if v41 then
            pcall(v_u_39, v41)
            local v42 = v41:FindFirstChild("IceCreamTruckHorn")
            if v42 then
                v42 = v42:FindFirstChildOfClass("Sound")
            end
            if v42 then
                v42:Destroy()
            end
        end
    end)
end
return v8