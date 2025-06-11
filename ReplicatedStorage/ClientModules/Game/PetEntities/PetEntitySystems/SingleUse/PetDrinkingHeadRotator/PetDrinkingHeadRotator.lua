--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.SingleUse.PetDrinkingHeadRotator (ModuleScript)

return {
    ["optimization_run_only_for"] = "near",
    ["step"] = function(p1)
        if p1.modifier_values_from_performances.is_drinking then
            if not p1.base.entry.head_rotator_disabled then
                local v2 = p1.base.char.PetModel
                local v3
                if v2:GetAttribute("RigType") == "Custom" then
                    v3 = v2.HumanoidRootPart:FindFirstChild("Head", true)
                elseif p1.base.entry.head_rotator_uses_torso_instead then
                    v3 = p1.base.char.PetModel:FindFirstChild("HumanoidRootPart")
                    if v3 then
                        v3 = v3:FindFirstChild("HumanoidRootPart \240\159\161\170 Torso")
                    end
                else
                    local v4 = p1.base.char.PetModel:FindFirstChild("Torso")
                    v3 = not v4 or v4:FindFirstChild("Torso \240\159\161\170 Head") or (v4:FindFirstChild("Head") or v4:FindFirstChild("Neck"))
                end
                if v3 then
                    v3.Transform = v3.Transform * CFrame.Angles(1.0471975511965976, 0, 0)
                end
            end
        else
            return
        end
    end
}