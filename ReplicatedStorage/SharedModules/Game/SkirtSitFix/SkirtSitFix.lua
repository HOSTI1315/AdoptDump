--// ReplicatedStorage.SharedModules.Game.SkirtSitFix (ModuleScript)

local v_u_9 = {
    ["track"] = function(p_u_1)
        coroutine.wrap(function()
            local function v3()
                local v2 = p_u_1.Humanoid.SeatPart == nil and p_u_1.Humanoid.Sit
                if v2 then
                    v2 = p_u_1.HumanoidRootPart.Anchored == true
                end
                v_u_9.set_skirt_sitting(p_u_1, v2)
            end
            p_u_1:WaitForChild("Humanoid"):GetPropertyChangedSignal("Sit"):connect(v3)
            p_u_1:WaitForChild("HumanoidRootPart"):GetPropertyChangedSignal("Anchored"):connect(v3)
            p_u_1:WaitForChild("Humanoid"):GetPropertyChangedSignal("SeatPart"):connect(v3)
        end)()
    end,
    ["set_skirt_sitting"] = function(p4, p5)
        local v6 = game:GetService("CollectionService"):GetTagged(p4.Name .. "-skirt")
        for _, v7 in pairs(v6) do
            local v8 = v7:FindFirstChild("sit_orientation") and (v7.sit_orientation.Value or -70) or -70
            v7.Handle.WaistCenterAttachment.Orientation = p5 and Vector3.new(v8, 0, 0) or Vector3.new()
        end
    end
}
return v_u_9