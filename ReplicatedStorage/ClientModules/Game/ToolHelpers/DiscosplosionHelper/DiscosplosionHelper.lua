--// ReplicatedStorage.ClientModules.Game.ToolHelpers.DiscosplosionHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = v1("Raycast")
local v_u_5 = v1("ClientToolManager")
local v_u_6 = v1("RouterClient")
local v_u_7 = v1("CollisionsClient")
local v_u_8 = v1("ClientData")
local v_u_9 = v1("Utilities")
local v_u_10 = v1("UIManager")
local v_u_11 = v1("TagNames")
local v_u_12 = v1("MusicOverride")
local v_u_13 = v1("Maid")
local v_u_14 = {}
local function v_u_19(p15)
    local v16 = {}
    for _, v17 in ipairs(v_u_2:GetTagged(v_u_11.Discosplosion)) do
        local v18 = v17:FindFirstChild("DiscoSound")
        if v18 and (v17 ~= p15 and (v18.IsPlaying and (v17.Position - p15.Position).Magnitude < v18.MaxDistance * 3)) then
            table.insert(v16, v18)
        end
    end
    return v16
end
local function v_u_32(p20)
    local v21 = p20.Character
    if v21 then
        v21 = v21:FindFirstChildOfClass("Tool")
    end
    if v21 then
        local v22 = v21.ModelHandle:Clone():Clone()
        local v23 = {}
        local v24 = nil
        for _, v25 in pairs(v22:GetDescendants()) do
            if v25:IsA("BasePart") then
                local v26 = string.find(v25.Name, "Mount") ~= nil
                if v26 then
                    v25.Transparency = 1
                    v24 = v25
                end
                v25.CanCollide = v26 == false
                v25.Anchored = false
                v25.CustomPhysicalProperties = PhysicalProperties.new(2, 1, 0)
                table.insert(v23, v25)
            end
        end
        local v27 = v_u_9.get_largest_part(v22)
        local v28 = Instance.new("Attachment")
        local v29 = Instance.new("Attachment")
        v28.Position = Vector3.new(0, -0.5, 0)
        v29.Position = Vector3.new(0, 0.5, 0)
        v28.Parent = v27
        v29.Parent = v27
        local v30 = game.ReplicatedStorage.Resources.Effects:FindFirstChild("ProjectileTrail"):Clone()
        v30.Attachment0 = v28
        v30.Attachment1 = v29
        v30.Parent = v22
        for _, v31 in ipairs(v23) do
            v_u_9.weld(v23[1], v31)
        end
        v22.Parent = workspace.PetObjects
        v22.PrimaryPart = v24
        return v22
    end
end
local function v_u_55(p33, p34)
    local v35 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local v36 = { "rbxassetid://1835974969", "rbxassetid://1839331222", "rbxassetid://1835725761" }
    local v_u_37 = Instance.new("Part")
    v_u_37.Transparency = 1
    v_u_37.CanCollide = false
    v_u_37.Size = Vector3.new()
    v_u_37.CFrame = CFrame.new(p33)
    v_u_37.Massless = true
    v_u_37.Anchored = true
    v_u_37.Parent = workspace
    local v38 = game.ReplicatedStorage.Resources.Effects.DiscoBall:Clone()
    v38.PrimaryPart = v38.Base
    v38.Parent = workspace
    v38:SetPrimaryPartCFrame(CFrame.new(p34.Position))
    local v_u_39 = v38.PrimaryPart
    v_u_2:AddTag(v_u_39, v_u_11.Discosplosion)
    local v40 = Instance.new("Attachment", v_u_37)
    local v41 = Instance.new("Attachment", v_u_39)
    local v42 = Instance.new("RopeConstraint", v_u_37)
    v42.Attachment0 = v40
    v42.Attachment1 = v41
    v42.Restitution = 0.5
    v42.Length = (v40.WorldPosition - v41.WorldPosition).Magnitude
    local v43 = v_u_13.new()
    local v44 = tick() + 30
    local v_u_45 = Instance.new("Sound", v_u_39)
    v_u_45.SoundId = v36[math.random(1, #v36)]
    v_u_45.MaxDistance = 50
    v_u_45.Looped = true
    v_u_45.Name = "DiscoSound"
    v_u_12.register_sound(v_u_45)
    local v46 = Ray.new(v_u_39.Position, Vector3.new(0, 100, 0))
    local v47, v48 = v_u_4.FindPartOnRay(v46, { v38 }, nil, {
        ["ignore_transparent"] = true,
        ["ignore_non_cancollide"] = true
    })
    local v49 = v_u_3:Create(v42, v35, {
        ["Length"] = not v47 and 6 or (v_u_37.Position - v48).Magnitude + v_u_39.Size.Y / 2 + 0.5
    })
    v49.Completed:connect(function()
        v_u_39.Attachment.Music1:Emit(15)
        v_u_39.Attachment.Music2:Emit(15)
        local v50 = v_u_19(v_u_37)
        if #v50 > 0 then
            local v51 = #v50 / 3
            local v52 = 0.5 / math.ceil(v51)
            for _, v53 in ipairs(v50) do
                v53.Volume = v52
            end
            v_u_45.Volume = v52
            v_u_45.SoundId = v50[1].SoundId
            v_u_45.TimePosition = v50[1].TimePosition
            v50[1].TimePosition = v_u_45.TimePosition
        end
        v_u_45:Play()
    end)
    v49:Play()
    v43:GiveTask(v38)
    v43:GiveTask(v_u_37)
    while tick() < v44 do
        wait(1.5)
        local v54 = game.Players.LocalPlayer.Character
        if v54 then
            v54 = v54.PrimaryPart
        end
        if v54 and (v54.Position - v_u_37.Position).Magnitude < 25 then
            v_u_6.get("EmotesAPI/PlayEmote"):FireServer("dance4")
        end
    end
    v43:DoCleaning()
end
local v_u_82 = {
    ["connect_dance_countdown"] = function(p56)
        local v57 = 0.5
        for _ = 1, 9 do
            for _, v58 in ipairs(p56:GetChildren()) do
                if v58:IsA("BasePart") then
                    v58.Size = v58.Size * 1.16
                end
            end
            p56.Base.Tick:Play()
            p56.Base.Tick.PlaybackSpeed = p56.Base.Tick.PlaybackSpeed + 0.05
            local v59 = v57 - 0.06
            v57 = math.max(0.15, v59)
            wait(v57)
        end
        local v60 = game.ReplicatedStorage.Resources.Effects.DiscoSplosion:Clone()
        v60.Parent = workspace
        v60.CFrame = CFrame.new(p56.PrimaryPart.Position)
        v60.MagicExplosion:Play()
        for _, v61 in pairs(v60:GetChildren()) do
            if v61:IsA("ParticleEmitter") then
                v61:Emit(15)
            end
        end
        game:GetService("Debris"):AddItem(v60, 5)
        local v62 = p56.PrimaryPart.Position + Vector3.new(0, 22, 0)
        local v63 = p56.PrimaryPart.CFrame
        p56:Destroy()
        v_u_55(v62, v63)
    end,
    ["create_and_launch_discosplosion"] = function(p64, p65)
        local v_u_66 = v_u_32(p64)
        if v_u_66 then
            local v67 = v_u_66:FindFirstChild("ServerMount", true)
            if v67 then
                v67:Destroy()
            end
            local v68 = v_u_9.get_largest_part(v_u_66)
            v_u_7.set_model_collision_group(v_u_66, "noncollide")
            local v69 = math.random(-5, 5)
            v_u_66:SetPrimaryPartCFrame(v_u_66:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(v69), 0))
            v68.Velocity = p65
            if p65.Magnitude > 0.01 then
                local v70 = math.random()
                local v71 = math.random()
                local v72 = math.random
                v68.RotVelocity = Vector3.new(v70, v71, v72()) * 12
            end
            coroutine.wrap(function()
                v_u_82.connect_dance_countdown(v_u_66)
            end)()
        end
    end,
    ["use"] = function(_, p73)
        local v74 = (v_u_8.get("equip_manager") or {}).toys[1]
        local v_u_75 = v74.unique
        if v_u_14[v_u_75] then
            local v76 = v_u_14[v_u_75] - tick()
            local v77 = math.ceil(v76)
            v_u_10.apps.HintApp:hint({
                ["text"] = "You must wait " .. v77 .. " seconds to use this item",
                ["overridable"] = true,
                ["yields"] = false
            })
        else
            v_u_14[v_u_75] = tick() + 10
            delay(10, function()
                v_u_14[v_u_75] = nil
            end)
            local _, v78 = v_u_4.mousecast(nil, nil, nil, nil, {
                ["ignore_non_cancollide"] = true,
                ["ignore_transparent"] = true
            })
            local v79 = game.Players.LocalPlayer.Character
            if v79 then
                v79 = game.Players.LocalPlayer.Character.PrimaryPart
            end
            if v79 then
                local v80 = Vector3.new()
                local v81 = CFrame.new(v79.Position, v78)
                if p73 ~= "UIButton" then
                    v80 = v81.LookVector * 90 + Vector3.new(0, 20, 0)
                end
                v_u_82.create_and_launch_discosplosion(game.Players.LocalPlayer, v80)
                v_u_6.get("ToolAPI/ThrowDiscosplosion"):FireServer(v_u_75, v80)
            end
            v_u_5.unequip(v74)
        end
    end
}
return v_u_82