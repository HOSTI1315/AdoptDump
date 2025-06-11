--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.MysterySignHelper (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v2("Utilities")
local v_u_4 = v2("AnimationManager")
local v_u_5 = v2("package:Promise")
local v_u_6 = v2("CharacterScale")
local v_u_7 = v2("FormatHelper")
local v_u_8 = v2("InventoryDB")
local v9 = {}
local function v_u_22(p10, p11)
    local v12 = p10.Torso
    local v13 = v12.CFrame
    local v14 = Instance.new("Attachment")
    v14.Parent = v12
    v14.WorldCFrame = v13
    local v15 = Instance.new("Attachment")
    v15.Parent = p11
    v15.WorldCFrame = v13
    local v16 = Instance.new("AlignPosition")
    v16.RigidityEnabled = true
    v16.Attachment0 = v14
    v16.Attachment1 = v15
    v16.Parent = v12
    local v17 = p10.HumanoidRootPart
    local v18 = v17.CFrame
    local v19 = Instance.new("Attachment")
    v19.Parent = v17
    v19.WorldCFrame = v18
    local v20 = Instance.new("Attachment")
    v20.Parent = p11
    v20.WorldCFrame = v18
    local v21 = Instance.new("AlignOrientation")
    v21.RigidityEnabled = true
    v21.Attachment0 = v19
    v21.Attachment1 = v20
    v21.Parent = v17
end
local function v_u_30(p23)
    if not p23:GetAttribute("IsSetUp") then
        p23:SetAttribute("IsSetUp", true)
        for _, v24 in pairs(p23.Banner:GetDescendants()) do
            if v24:IsA("BasePart") then
                v_u_3.weld(p23.Banner.Main, v24)
            end
        end
        for _, v25 in p23:FindFirstChild("Pets"):GetChildren() do
            v_u_22(v25, p23.Banner.Main)
            v_u_6.adjust_scale(v25, {
                ["scale"] = 3
            })
            local v26 = v_u_8.pets[v25.Name]
            local v27
            if v26.anims.flying == v26.anims.running then
                v27 = false
            else
                v27 = v26.anims.flying
            end
            local v28
            if v27 then
                v28 = v26.anims.flying
            else
                v28 = v26.anims.idle
            end
            local v29 = v_u_4.get_track(v28)
            v25:WaitForChild("AnimationController"):LoadAnimation(v29):Play()
        end
    end
end
local function v_u_33(p31, p32)
    if p32.days > 0 then
        return p31 .. " IN:", ("%d %s"):format(p32.days, p32.days > 1 and "DAYS" or "DAY")
    elseif p32.hours > 0 or (p32.minutes > 0 or p32.seconds > 0) then
        return p31 .. " IN:", ("%02d:%02d:%02d"):format(p32.hours, p32.minutes, p32.seconds)
    else
        return p31, "RELEASED!"
    end
end
local function v_u_36(p34, p35)
    if p35.days > 0 then
        return p34 .. " IN:", ("%d %s"):format(p35.days, p35.days > 1 and "DAYS" or "DAY")
    elseif p35.hours > 0 then
        return p34 .. " IN:", ("%d %s"):format(p35.hours, p35.hours > 1 and "HOURS" or "HOUR")
    elseif p35.minutes > 5 then
        return p34 .. " IN:", ("%d %s"):format(p35.minutes, p35.minutes > 1 and "MINUTES" or "MINUTE")
    else
        return p34, "SOON"
    end
end
function v9.start(p_u_37, p38)
    local v39 = p38 or {}
    local v_u_40 = v39.use_discrete_countdown or false
    local v_u_41 = v39.get_countdown_model
    local v_u_42 = v39.get_time_until_release
    local v_u_43 = v39.get_time_until_countdown
    local v_u_44 = v39.get_time_until_removal
    assert(v_u_41, "get_countdown_model is required for MysterySignHelper.start")
    assert(v_u_42, "get_time_until_released is required for MysterySignHelper.start")
    return v_u_5.new(function(p45, _, p46)
        if v_u_43 then
            while not p46() and v_u_43() > 0 do
                task.wait(1)
            end
        end
        p45()
    end):andThen(function()
        local v_u_47 = v_u_41()
        v_u_30(v_u_47)
        local v_u_48 = v_u_47.Banner.SignTitle.SurfaceGui.TextLabel
        local v_u_49 = v_u_47.Banner.SignTime.SurfaceGui.TextLabel
        return v_u_5.new(function(p50, _, p51)
            local v_u_52 = v_u_47:FindFirstChild("Banner"):FindFirstChild("Main")
            local v_u_53 = v_u_52.CFrame
            local v_u_56 = v_u_1.Heartbeat:Connect(function()
                local v54 = os.clock() * 1.5
                local v55 = math.sin(v54) * 1
                v_u_52.CFrame = v_u_53 * CFrame.new(0, v55, 0)
            end)
            p51(function()
                v_u_56:Disconnect()
            end)
            while not p51() do
                if v_u_44() <= 0 then
                    v_u_56:Disconnect()
                    p50()
                    return
                end
                local v57 = v_u_42
                local v58 = math.max(0, v57())
                local v59 = v_u_7.get_time_breakdown(v58)
                local v60, v61
                if v_u_40 then
                    v60, v61 = v_u_36(p_u_37, v59)
                else
                    v60, v61 = v_u_33(p_u_37, v59)
                end
                v_u_48.Text = v60
                v_u_49.Text = v61
                task.wait(1)
            end
        end)
    end)
end
return v9