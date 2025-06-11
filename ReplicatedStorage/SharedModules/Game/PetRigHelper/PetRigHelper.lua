--// ReplicatedStorage.SharedModules.Game.PetRigHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("new:PetRigs")
return {
    ["rig_pet_model_to_char"] = function(p2, p3, p4)
        for _, v5 in pairs(p3:GetChildren()) do
            if v5:IsA("BasePart") then
                v5.Transparency = 1
            end
        end
        local v6 = p2:GetAttribute("HipHeight")
        p2.Name = "PetModel"
        local v7 = p2:FindFirstChild("MockParts")
        for _, v8 in pairs(p2:GetChildren()) do
            if v8:IsA("BasePart") then
                if v7 then
                    v8.CanQuery = v8:IsDescendantOf(v7)
                    v8.Anchored = v8:IsDescendantOf(v7)
                else
                    v8.Anchored = false
                end
                v8.CanCollide = false
                v8.Massless = true
            end
        end
        for _, v9 in pairs(p3:GetDescendants()) do
            if v9:IsA("BasePart") then
                v9.CustomPhysicalProperties = PhysicalProperties.new(1, 1, 0)
                v9.CollisionGroup = "pets"
            end
        end
        local v10 = -(p3.HumanoidRootPart.Size.Y / 2 + p3.Humanoid.HipHeight) + (p2.HumanoidRootPart.Size.Y / 2 + v6)
        local v11 = Instance.new("Part")
        v11.Size = Vector3.new(1, 1, 1)
        v11.Massless = true
        v11.CanCollide = false
        v11.Transparency = 1
        v11.Name = "OuterToInnerJoint"
        v11.CFrame = p3.HumanoidRootPart.CFrame
        v11.Parent = p3
        local v12 = Instance.new("Motor6D")
        v12.C0 = CFrame.new(0, v10, 0)
        v12.Part0 = p3.HumanoidRootPart
        v12.Part1 = v11
        v12.Name = "OuterToInnerMotor"
        v12.Parent = p3.HumanoidRootPart
        local v13 = Instance.new("Weld")
        v13.Part0 = v11
        v13.Part1 = p2.HumanoidRootPart
        v13.Parent = p2.HumanoidRootPart
        p2.Parent = p3
        p3.Humanoid.UseJumpPower = false
        p3.Humanoid.JumpHeight = 7.159
        p3.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        p3.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        p3.Name = p4.name
        if not p3.Humanoid:FindFirstChild("Animator") then
            Instance.new("Animator").Parent = p3.Humanoid
        end
        p3.PrimaryPart = p3.HumanoidRootPart
        if p4.unpaintable_parts then
            for _, v14 in p4.unpaintable_parts do
                local v15 = v_u_1.get(p2).get_geo_part(p2, v14)
                if v15 and v15:IsA("BasePart") then
                    v15:SetAttribute("IsUnpaintable", true)
                end
            end
        end
        if p4.is_food_grabber then
            local v16 = Instance.new("Part")
            v16.Name = "RightMount"
            v16.Size = Vector3.new(0.4, 0.4, 0.4)
            v16.Transparency = 1
            v16.CanCollide = false
            v16.Massless = true
            v16.Parent = p2
            local v17 = Instance.new("Motor6D")
            v17.Name = "HandToRightMount"
            v17.Part0 = p2.RightHand
            v17.Part1 = v16
            v17.C0 = CFrame.new(0.060139973933333334, -0.15243260066666667, -0.025132497133333334, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            v17.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            v17.Parent = p2.RightHand
        end
        return p3
    end
}