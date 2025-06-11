--// ReplicatedStorage.ClientModules.Game.Interiors.CastleHouseInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("package:Promise")
local v_u_3 = v_u_1("Maid")
local function v_u_9(p4, p5)
    if p4:GetAttribute("HasBeenWelded") then
        return p4
    end
    for _, v6 in p4:GetDescendants() do
        if v6:IsA("BasePart") then
            local v7
            if p5 then
                v7 = v6 == p5 and true or v6:IsDescendantOf(p5)
            else
                v7 = p5
            end
            if not v7 then
                if not p4.PrimaryPart then
                    p4.PrimaryPart = v6
                end
                if v6 ~= p4.PrimaryPart then
                    local v8 = Instance.new("Weld")
                    v8.Part0 = p4.PrimaryPart
                    v8.Part1 = v6
                    v8.C0 = p4.PrimaryPart.CFrame:inverse() * v6.CFrame
                    v8.Parent = v6
                    v6.Anchored = false
                end
            end
        end
    end
    p4:SetAttribute("HasBeenWelded", true)
    return p4
end
local function v_u_17(p10)
    if p10:IsA("Model") then
        if p10:GetAttribute("LiftWheelHasBeenSetup") then
            return {
                ["mover"] = p10:FindFirstChild("AlignOrientation", true),
                ["ratio"] = p10:GetAttribute("RotationRatio") or 1
            }
        end
        local v11 = v_u_9(p10)
        local v12 = v11.PrimaryPart:Clone()
        v12:ClearAllChildren()
        v12.Transparency = 1
        v12.CanCollide = false
        v12.Parent = v11.Parent
        local v13 = Instance.new("Attachment")
        v13.Parent = v12
        local v14 = v11.PrimaryPart:FindFirstChildWhichIsA("Attachment")
        if not v14 then
            v14 = Instance.new("Attachment")
            v14.Parent = v11.PrimaryPart
        end
        local v15 = v14:FindFirstChild("AlignOrientation")
        if not v15 then
            v15 = Instance.new("AlignOrientation")
            v15.MaxTorque = (1 / 0)
            v15.Responsiveness = 10
            v15.Parent = v14
        end
        v15.Attachment0 = v14
        v15.Attachment1 = v13
        v15.MaxAngularVelocity = 85
        local v16 = v14:FindFirstChild("AlignPosition")
        if not v16 then
            v16 = Instance.new("AlignPosition")
            v16.RigidityEnabled = true
            v16.Parent = v14
        end
        v16.Attachment0 = v14
        v16.Attachment1 = v13
        v11.PrimaryPart.Anchored = false
        v11:SetAttribute("LiftWheelHasBeenSetup", true)
        return {
            ["mover"] = v15,
            ["ratio"] = v11:GetAttribute("RotationRatio") or 1
        }
    end
end
local function v_u_25(p18)
    if p18:IsA("Model") then
        local v19 = v_u_9(p18, p18.Anchor)
        local v20 = v19.Anchor:FindFirstChild("Attachment") or Instance.new("Attachment")
        v20.CFrame = CFrame.Angles(0, 0, 1.5707963267948966)
        v20.Parent = v19.Anchor
        local v21 = v19.PrimaryPart:FindFirstChild("Attachment") or Instance.new("Attachment")
        v21.CFrame = v20.CFrame
        v21.Parent = v19.PrimaryPart
        local v22 = v21:FindFirstChild("PrismaticConstraint")
        if not v22 then
            v22 = Instance.new("PrismaticConstraint")
            v22.ActuatorType = Enum.ActuatorType.Servo
            v22.LinearResponsiveness = 5
            v22.ServoMaxForce = (1 / 0)
            v22.Speed = 22
            v22.Parent = v21
        end
        v22.Attachment0 = v21
        v22.Attachment1 = v20
        local v23 = {}
        for v24 = 1, #v19.Anchor:GetChildren() - 1 do
            v23[v24] = v19.Anchor:FindFirstChild("Stop" .. v24)
        end
        v19.PrimaryPart.Anchored = false
        return {
            ["mover"] = v22,
            ["anchor"] = v19.Anchor,
            ["stops"] = v23
        }
    end
end
return {
    ["interactions"] = function(p26)
        return v_u_1("InteriorsDB").housing.interactions(p26)
    end,
    ["render"] = function(p27, p28)
        v_u_1("InteriorsDB").housing.render(p27, p28)
        p28.render_maid = v_u_3.new()
        for _, v29 in p27:FindFirstChild("LiftModels"):GetChildren() do
            local v30 = v29.Lifts
            local v31 = v29.Wheels
            if not (v30 and v31) then
                return
            end
            local v_u_32 = {}
            for _, v33 in v30:GetChildren() do
                v_u_32[v33] = v_u_25(v33)
            end
            local v34 = v_u_32[v30.Main]
            local v35 = v31.MainWheel:GetExtentsSize()
            local v_u_36 = #v34.stops
            local v37 = v35.X
            local v38 = v35.Y
            local v39 = v35.Z
            local v40 = 3.141592653589793 * math.max(v37, v38, v39)
            local v_u_41 = {}
            for v42, v43 in v34.stops do
                if v42 == 1 then
                    v_u_41[v42] = 0
                else
                    local v44 = (v34.stops[v42 - 1].Position - v43.Position).Magnitude
                    v_u_41[v42] = v_u_41[v42 - 1] + 360 * v44 / v40
                    v_u_41[v_u_36 * 2 - v42] = v_u_41[v42]
                end
            end
            local v_u_45 = {}
            for _, v46 in v31:GetChildren() do
                v_u_45[v46] = v_u_17(v46)
            end
            if v_u_36 then
                v_u_36 = v_u_2.new(function(_, _, p47)
                    while not p47() do
                        local v48 = workspace:GetServerTimeNow()
                        local v49 = v48 / 12 % v_u_36
                        local v50 = math.floor(v49) + 1
                        local v51 = v48 / 12 % 1 * 12
                        for _, v52 in v_u_32 do
                            local v53 = v52.anchor.Position - v52.stops[v50].WorldPosition
                            v52.mover.TargetPosition = v53.Y
                        end
                        local v54 = (v50 - 2) % v_u_36 + 1
                        local v55 = v_u_41[v50] - v_u_41[v54]
                        local v56 = math.abs(v55)
                        local v57 = v_u_41[v54]
                        local v58 = v_u_41[v50]
                        local v59 = v51 * 85 * 1.1 / v56
                        local v60 = math.min(1, v59)
                        local v61 = -(v57 + (v58 - v57) * v60)
                        for _, v62 in v_u_45 do
                            local v63 = v62.mover.Attachment0
                            local v64 = v61 * v62.ratio
                            v63.Orientation = Vector3.new(v64, 0, 0)
                        end
                        task.wait(0.1)
                    end
                end)
            end
            if v_u_36 then
                p28.render_maid:GiveTask(function()
                    v_u_36:cancel()
                end)
            end
        end
    end,
    ["cleanup"] = function(p65, p66)
        p66.render_maid:DoCleaning()
        v_u_1("InteriorsDB").housing.cleanup(p65, p66)
    end
}