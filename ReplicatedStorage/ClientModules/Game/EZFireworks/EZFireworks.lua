--// ReplicatedStorage.ClientModules.Game.EZFireworks (ModuleScript)

local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Resources"):WaitForChild("EZFireworks")
while #v1:GetDescendants() < 41 do
    wait(0.1)
end
local v_u_2 = game:GetService("TweenService")
local v_u_3 = v1:WaitForChild("FireworkStuff")
local v_u_4 = v1:WaitForChild("Configuration")
local v5 = {}
local v_u_6 = v_u_3.Fireworks:GetChildren()
local v_u_7 = false
local function v_u_12(p8)
    for _, v9 in pairs(p8:GetChildren()) do
        if not v9:IsA("Sound") then
            v9:Destroy()
        end
    end
    local v10 = v_u_6[math.random(1, #v_u_6)]:Clone()
    v10.Parent = p8
    p8.Bang.Volume = v_u_4.Sound.Value and 1 or 0
    p8.Bang.PlaybackSpeed = math.random(0.75, 1.95)
    p8.Bang:Play()
    for _, v_u_11 in pairs(v10:GetChildren()) do
        spawn(function()
            v_u_11.Enabled = true
            wait(0.25)
            v_u_11.Enabled = false
        end)
    end
end
local function v_u_23()
    local v13 = workspace:WaitForChild("FireworkLaunchers"):GetChildren()
    local v_u_14 = v_u_3.FWBullet:Clone()
    local v15 = v13[math.random(1, #v13)]
    v_u_14.CFrame = v15.Launcher.CFrame
    v_u_14.Parent = v15
    game:GetService("Debris"):AddItem(v_u_14, 7)
    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            v_u_14.Orientation = v_u_14.Orientation + Vector3.new(0, 5, 0)
        end)
    end)
    local v16 = math.random(2.25, 3.75)
    local v17 = v_u_2
    local v18 = TweenInfo.new(v16, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
    local v19 = {}
    local v20 = v_u_14.CFrame
    local v21 = math.random(v_u_4.MinHeight.Value, v_u_4.MaxHeight.Value)
    v19.Position = v20 * Vector3.new(0, v21, 0)
    local v22 = v17:Create(v_u_14, v18, v19)
    v_u_14.Whistle.Volume = v_u_4.Sound.Value and 1 or 0
    v_u_14.Whistle.PlaybackSpeed = math.random(0.75, 1.95)
    v_u_14.Whistle:Play()
    v22:Play()
    wait(v16)
    v_u_12(v_u_14)
end
local v_u_24 = 0
function v5.FireAmount(_, p25)
    v_u_24 = v_u_24 + p25
    if not v_u_7 then
        v_u_7 = true
        coroutine.wrap(function()
            while v_u_24 > 0 and v_u_7 do
                v_u_24 = v_u_24 - 1
                spawn(v_u_23)
                wait(math.random(1 / v_u_4.Density.Value * 1, 1 / v_u_4.Density.Value * 2 * 1))
            end
            v_u_7 = false
        end)()
    end
end
function v5.FireForSeconds(_, p_u_26)
    spawn(function()
        v_u_7 = true
        local v27 = tick() + p_u_26
        while tick() < v27 and v_u_7 do
            spawn(v_u_23)
            wait(math.random(1 / v_u_4.Density.Value, 1 / v_u_4.Density.Value * 2))
        end
        v_u_7 = false
    end)
end
function v5.Stop(_)
    v_u_7 = false
end
return v5