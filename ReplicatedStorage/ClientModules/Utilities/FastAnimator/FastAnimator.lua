--// ReplicatedStorage.ClientModules.Utilities.FastAnimator (ModuleScript)

local v_u_1 = game:GetService("KeyframeSequenceProvider")
local v_u_39 = {
    ["_init"] = function()
        v_u_39._keyframe_sequences = {}
    end,
    ["load_keyframe_sequence"] = function(p_u_2)
        task.spawn(function()
            local v3 = v_u_1:GetKeyframeSequenceAsync(p_u_2)
            v_u_39._keyframe_sequences[p_u_2] = v3
        end)
    end,
    ["_fake_time_position"] = function(p4, p5, p6)
        local v7 = (1 / 0)
        local v8 = nil
        for _, v9 in pairs(p5:GetChildren()) do
            if p6 >= v9.Time then
                local v10 = p6 - v9.Time
                if v10 < v7 then
                    v8 = v9
                    v7 = v10
                end
            end
        end
        local v_u_11 = p4.Parent
        local v_u_12 = v_u_11:FindFirstChildWhichIsA("Bone", true)
        local v_u_13 = v_u_12 ~= nil
        local function v_u_19(p14, p15)
            for _, v16 in pairs(v_u_11:GetDescendants()) do
                if v16:IsA("Motor6D") then
                    local v17 = v16.Part0
                    if v17 then
                        v17 = v16.Part0.Name == p14
                    end
                    local v18 = v16.Part1
                    if v18 then
                        v18 = v16.Part1.Name == p15
                    end
                    if v17 and v18 then
                        return v16
                    end
                end
            end
            return nil
        end
        local function v_u_24(p_u_20, p21)
            local v_u_22 = p_u_20.C0
            local v_u_23 = p_u_20.C1
            p_u_20.C1 = CFrame.new()
            p_u_20.C0 = v_u_22 * v_u_23:Inverse() * p21
            task.spawn(function()
                task.wait()
                p_u_20.C0 = v_u_22
                p_u_20.C1 = v_u_23
            end)
        end
        local function v_u_31(p25, p26)
            if p25 ~= nil then
                local v27 = p25.Name
                local v28 = p26.Name
                local v29 = v_u_13 and v_u_12:FindFirstChild(v28, true) or v_u_19(v27, v28)
                if v29 then
                    if v29:IsA("Motor6D") then
                        v_u_24(v29, p26.CFrame)
                    elseif v29:IsA("Bone") then
                        v29.Transform = p26.CFrame
                    end
                end
            end
            for _, v30 in pairs(p26:GetChildren()) do
                v_u_31(p26, v30)
            end
        end
        for _, v32 in pairs(v8:GetChildren()) do
            v_u_31(nil, v32)
        end
    end,
    ["fast_play"] = function(p33, p34, p35, ...)
        local v36 = p34.AnimationId
        local v37 = v_u_39._keyframe_sequences[v36]
        if v37 then
            v_u_39._fake_time_position(p33, v37, p35)
        else
            v_u_39.load_keyframe_sequence(v36)
        end
        local v38 = p33:LoadAnimation(p34)
        v38:Play(0, ...)
        v38.TimePosition = p35
        return v38
    end
}
v_u_39._init()
return v_u_39