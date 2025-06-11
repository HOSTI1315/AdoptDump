--// ReplicatedStorage.SharedModules.NumberSequenceUtil (ModuleScript)

local v_u_1 = game:GetService("TweenService")
local v_u_22 = {
    ["create_tweenable_transparency_value"] = function(p_u_2, p_u_3, p4)
        local v5 = Instance.new("NumberValue")
        v5.Name = "ProxyTweenValue_Transparency"
        v5.Value = p4 or 0
        v5.Changed:Connect(function(p6)
            local v7 = {}
            for v8, v9 in ipairs(p_u_2.Keypoints) do
                local v10 = v9.Value
                local v11 = v10 + (1 - v10) * p6
                local v12 = math.abs(v11)
                local v13 = v9.Envelope
                local v14 = math.min(v12, v13)
                v7[v8] = NumberSequenceKeypoint.new(v9.Time, v11, v14)
            end
            p_u_3(NumberSequence.new(v7))
        end)
        return v5
    end,
    ["tween_number_sequence_property"] = function(p_u_15, p16, p_u_17, p18, p19)
        local v21 = v_u_22.create_tweenable_transparency_value(p_u_15[p_u_17], function(p20)
            p_u_15[p_u_17] = p20
        end, p18)
        v21.Name = string.format("NumberSequenceTweenProxy(%s)", p_u_17)
        v21.Parent = p_u_15
        return v_u_1:Create(v21, p16, {
            ["Value"] = p19
        })
    end
}
return v_u_22