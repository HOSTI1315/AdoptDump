--// ReplicatedStorage.ClientModules.Game.ToolHelpers.FireworkLauncherHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = require(game.ReplicatedStorage.new.modules.Explorer)
local v_u_3 = v1("SoundPlayer")
local v_u_4 = v1("ProjectileHelper")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("package:Promise")
local v_u_7 = game:GetService("Debris")
local v_u_8 = game:GetService("RunService")
local v9 = {}
local v_u_10 = Random.new()
local v_u_11 = false
local function v_u_16(p12)
    local v13 = p12:FindFirstChild("Dots")
    local v14 = p12:FindFirstChild("Clouds")
    local v15
    if v13 and v14 then
        v15 = v13
    else
        v15 = game.ReplicatedStorage:FindFirstChild("Resources")
        if v15 then
            v15 = game.ReplicatedStorage.Resources:FindFirstChild("Particles")
        end
        if v15 then
            v15 = v15:FindFirstChild("FireworkLauncher")
        end
        if not v14 then
            if v15 then
                v14 = v15:FindFirstChild("Clouds"):Clone()
            else
                v14 = v15
            end
            v14.Parent = p12
        end
        if v13 then
            v15 = v13
        else
            if v15 then
                v15 = v15:FindFirstChild("Dots"):Clone()
            end
            v15.Parent = p12
        end
    end
    v14:Emit(9)
    v15:Emit(4)
end
local function v_u_23(p17)
    local v18 = p17:FindFirstChild("ExplosionTimeMin")
    local v19 = p17:FindFirstChild("ExplosionTimeMax")
    local v20 = p17:FindFirstChild("LaunchSpeed")
    local v21 = p17:FindFirstChild("SpinAngle")
    local v22 = p17:FindFirstChild("Gravity")
    return {
        ["explosion_time_min"] = v18 and v18.Value or 1,
        ["explosion_time_max"] = v19 and v19.Value or 1,
        ["launch_speed"] = v20 and v20.Value or 50,
        ["spin_angle"] = v21 and v21.Value or 0,
        ["gravity"] = v22 and v22.Value or 1
    }
end
local function v_u_31(p24, p25)
    local v26 = p24:FindFirstChild("Visibility")
    if v26 then
        for _, v27 in p24:GetDescendants() do
            if v27:IsA("BasePart") then
                local v28 = v27:FindFirstChild("Transparency")
                if v28 then
                    v27.Transparency = p25 and v28.Value or 1
                end
            end
        end
        local v29 = p24:FindFirstChild("Fuse")
        if v29 then
            for _, v30 in v29:GetChildren() do
                if v30:IsA("ParticleEmitter") or v30:IsA("Trail") then
                    v30.Enabled = p25
                end
            end
        end
        v26.Value = p25
    end
end
local function v_u_39(p32, p33)
    local v34 = v_u_2.get(p32, { "Character", "HumanoidRootPart" })
    local v35 = v_u_2.get(p32, { "Character", p33.tool, "ModelHandle" })
    if v34 and v35 then
        local v36 = v35:FindFirstChild("Projectile")
        if v36 then
            v_u_31(v36, true)
            v_u_16(v35.Nozzle)
            local v37 = v36.Handle.CFrame
            local v38 = Instance.new("Part")
            v38.Transparency = 1
            v38.CanCollide = false
            v38.Anchored = true
            v38.CFrame = v37
            v38.Parent = game.Workspace
            v_u_3.FX:play(p33.model_handle .. "Reload", v38)
            v_u_7:AddItem(v38, 3)
        end
    else
        return
    end
end
local function v_u_76(p40, p_u_41, p42)
    local v43 = v_u_2.get(p40, { "Character", "HumanoidRootPart" })
    local v44 = v_u_2.get(p40, { "Character", p_u_41.tool, "ModelHandle" })
    if v43 and v44 then
        local v45 = v44:FindFirstChild("Nozzle")
        local v46 = v44:FindFirstChild("Projectile")
        if v45 and v46 then
            local v_u_47 = v46:Clone()
            local v_u_48 = v_u_23(v46)
            v_u_47.Parent = game.Workspace
            local v_u_49 = v_u_47:FindFirstChild("Explosions")
            if v_u_49 then
                local v_u_50 = v_u_47.Handle
                v_u_50.CFrame = CFrame.lookAlong(v_u_50.Position, p42)
                local v51 = Instance.new("BodyForce")
                local v52 = workspace.Gravity - v_u_48.gravity
                v51.Force = Vector3.new(0, v52, 0) * v_u_50.AssemblyMass + p42 * v_u_48.launch_speed * v_u_50.AssemblyMass
                v51.Parent = v_u_50
                v_u_31(v46, false)
                local v53 = v_u_50.CFrame
                local v54 = Instance.new("Part")
                v54.Transparency = 1
                v54.CanCollide = false
                v54.Anchored = true
                v54.CFrame = v53
                v54.Parent = game.Workspace
                v_u_3.FX:play(p_u_41.model_handle .. "Launch", v54)
                v_u_7:AddItem(v54, 3)
                local v55 = v_u_47:FindFirstChild("Trail")
                if v55 then
                    for _, v56 in v55:GetChildren() do
                        if v56:IsA("ParticleEmitter") or v56:IsA("Trail") then
                            v56.Enabled = true
                        end
                    end
                end
                local v_u_61 = v_u_8.Heartbeat:Connect(function(p57)
                    local v58 = CFrame.Angles
                    local v59 = v_u_48.spin_angle * p57 * 60
                    local v60 = v58(0, 0, (math.rad(v59)))
                    v_u_50.CFrame = v_u_50.CFrame:ToWorldSpace(v60)
                end)
                v_u_6.delay(0.1):andThen(function()
                    local v62 = v_u_48.explosion_time_min
                    local v63 = v_u_48.explosion_time_max
                    local v64 = v_u_10:NextNumber()
                    local v65 = v62 + (v63 - v62) * v64 - 0.1
                    local v66 = math.max(v65, 0.1)
                    v_u_50.CanCollide = true
                    return v_u_6.delay(v66)
                end):andThen(function()
                    for _, v67 in v_u_49:GetChildren() do
                        local v68 = v67:FindFirstChild("EmitAmount")
                        local v69 = v67:FindFirstChild("SustainTime")
                        local v70 = v68 and v68.Value or 50
                        local v71 = v69 and v69.Value or 5
                        v67.Parent = game.Workspace
                        v67.Anchored = true
                        v67.ParticleEmitter:Emit(v70)
                        v_u_7:AddItem(v67, v71)
                    end
                    local v72 = p_u_41
                    local v73 = v_u_50.CFrame
                    local v74 = Instance.new("Part")
                    v74.Transparency = 1
                    v74.CanCollide = false
                    v74.Anchored = true
                    v74.CFrame = v73
                    v74.Parent = game.Workspace
                    v_u_3.FX:play(v72.model_handle .. "Explode", v74)
                    v_u_7:AddItem(v74, 3)
                    local v75 = v_u_47:FindFirstChild("Trail")
                    if v75 then
                        v75.Parent = game.Workspace
                        v75.Anchored = true
                        v75.Transparency = 1
                        v_u_7:AddItem(v75, 3)
                    end
                    v_u_47:Destroy()
                    v_u_61:Disconnect()
                end)
            end
        else
            return
        end
    else
        return
    end
end
function v9.equipped(p77)
    local v78 = v_u_2.get(game.Players.LocalPlayer, { "Character", p77.tool, "ModelHandle" }):FindFirstChild("Projectile")
    for _, v79 in v78:GetDescendants() do
        if v79:IsA("BasePart") then
            local v80 = Instance.new("NumberValue")
            v80.Value = v79.Transparency
            v80.Name = "Transparency"
            v80.Parent = v79
            v79.Transparency = 1
        elseif v79:IsA("ParticleEmitter") or v79:IsA("Trail") then
            v79.Enabled = false
        end
    end
    local v81 = Instance.new("BoolValue")
    v81.Name = "Visibility"
    v81.Value = false
    v81.Parent = v78
end
function v9.client_use(p82, p83)
    if v_u_11 then
        return
    else
        v_u_11 = true
        local v84 = v_u_2.get(game.Players.LocalPlayer, { "Character", p82.tool, "ModelHandle" })
        if v84 then
            local v85 = v84:FindFirstChild("Projectile")
            if v85 then
                local v86 = v85:FindFirstChild("Visibility")
                local v87
                if v86 then
                    v87 = v86.Value
                else
                    v87 = nil
                end
                local v88 = v87 == true
                if v88 == true then
                    local v89 = v85:FindFirstChild("Handle")
                    local v90 = v89.CFrame.LookVector
                    local v91 = v89.Position + v90
                    local v92 = v_u_23(v85)
                    if p83 == "WorldTap" then
                        v90 = v_u_4.get_aim_direction(v91, v92.gravity, v92.launch_speed)
                    end
                    v_u_5.get("ToolAPI/LaunchFirework"):InvokeServer(p82, v90)
                    v_u_76(game.Players.LocalPlayer, p82, v90)
                elseif v88 == false then
                    v_u_5.get("ToolAPI/LoadFirework"):InvokeServer(p82)
                    v_u_39(game.Players.LocalPlayer, p82)
                end
                v_u_6.delay(v88 and 0.8 or 0.2):andThen(function()
                    v_u_11 = false
                end)
            end
        else
            return
        end
    end
end
function v9.replicate_loaded_firework(p93, p94)
    v_u_39(p93, p94)
end
function v9.replicate_launched_firework(p95, p96, p97)
    v_u_76(p95, p96, p97)
end
return v9