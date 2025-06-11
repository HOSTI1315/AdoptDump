--// ReplicatedStorage.SharedModules.Game.CharacterScale (ModuleScript)

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = {}
local v_u_3 = {}
local function v_u_15(p4)
    local v5 = {}
    local v6 = p4.Acceleration
    if typeof(v6) == "CFrame" then
        local v7 = p4:FindFirstChild("UnscaledAcceleration")
        if v7 == nil then
            v7 = Instance.new("CFrameValue")
            v7.Name = "UnscaledAcceleration"
            v7.Value = v6
            v7.Parent = p4
        end
        v6 = v7.Value
    else
        local v8 = p4:GetAttribute("UnscaledAcceleration")
        if v8 == nil then
            p4:SetAttribute("UnscaledAcceleration", v6)
        else
            v6 = v8
        end
    end
    v5.acceleration = v6
    local v9 = p4.Size
    if typeof(v9) == "CFrame" then
        local v10 = p4:FindFirstChild("UnscaledSize")
        if v10 == nil then
            v10 = Instance.new("CFrameValue")
            v10.Name = "UnscaledSize"
            v10.Value = v9
            v10.Parent = p4
        end
        v9 = v10.Value
    else
        local v11 = p4:GetAttribute("UnscaledSize")
        if v11 == nil then
            p4:SetAttribute("UnscaledSize", v9)
        else
            v9 = v11
        end
    end
    v5.size = v9
    local v12 = p4.Speed
    if typeof(v12) == "CFrame" then
        local v13 = p4:FindFirstChild("UnscaledSpeed")
        if v13 == nil then
            v13 = Instance.new("CFrameValue")
            v13.Name = "UnscaledSpeed"
            v13.Value = v12
            v13.Parent = p4
        end
        v12 = v13.Value
    else
        local v14 = p4:GetAttribute("UnscaledSpeed")
        if v14 == nil then
            p4:SetAttribute("UnscaledSpeed", v12)
        else
            v12 = v14
        end
    end
    v5.speed = v12
    return v5
end
local function v_u_36(p16)
    local v17 = {}
    local v18 = p16.Width0
    if typeof(v18) == "CFrame" then
        local v19 = p16:FindFirstChild("UnscaledWidth0")
        if v19 == nil then
            v19 = Instance.new("CFrameValue")
            v19.Name = "UnscaledWidth0"
            v19.Value = v18
            v19.Parent = p16
        end
        v18 = v19.Value
    else
        local v20 = p16:GetAttribute("UnscaledWidth0")
        if v20 == nil then
            p16:SetAttribute("UnscaledWidth0", v18)
        else
            v18 = v20
        end
    end
    v17.width_0 = v18
    local v21 = p16.Width1
    if typeof(v21) == "CFrame" then
        local v22 = p16:FindFirstChild("UnscaledWidth1")
        if v22 == nil then
            v22 = Instance.new("CFrameValue")
            v22.Name = "UnscaledWidth1"
            v22.Value = v21
            v22.Parent = p16
        end
        v21 = v22.Value
    else
        local v23 = p16:GetAttribute("UnscaledWidth1")
        if v23 == nil then
            p16:SetAttribute("UnscaledWidth1", v21)
        else
            v21 = v23
        end
    end
    v17.width_1 = v21
    local v24 = p16.CurveSize0
    if typeof(v24) == "CFrame" then
        local v25 = p16:FindFirstChild("UnscaledCurveSize0")
        if v25 == nil then
            v25 = Instance.new("CFrameValue")
            v25.Name = "UnscaledCurveSize0"
            v25.Value = v24
            v25.Parent = p16
        end
        v24 = v25.Value
    else
        local v26 = p16:GetAttribute("UnscaledCurveSize0")
        if v26 == nil then
            p16:SetAttribute("UnscaledCurveSize0", v24)
        else
            v24 = v26
        end
    end
    v17.curve_size_0 = v24
    local v27 = p16.CurveSize1
    if typeof(v27) == "CFrame" then
        local v28 = p16:FindFirstChild("UnscaledCurveSize1")
        if v28 == nil then
            v28 = Instance.new("CFrameValue")
            v28.Name = "UnscaledCurveSize1"
            v28.Value = v27
            v28.Parent = p16
        end
        v27 = v28.Value
    else
        local v29 = p16:GetAttribute("UnscaledCurveSize1")
        if v29 == nil then
            p16:SetAttribute("UnscaledCurveSize1", v27)
        else
            v27 = v29
        end
    end
    v17.curve_size_1 = v27
    local v30 = p16.TextureLength
    if typeof(v30) == "CFrame" then
        local v31 = p16:FindFirstChild("UnscaledTextureLength")
        if v31 == nil then
            v31 = Instance.new("CFrameValue")
            v31.Name = "UnscaledTextureLength"
            v31.Value = v30
            v31.Parent = p16
        end
        v30 = v31.Value
    else
        local v32 = p16:GetAttribute("UnscaledTextureLength")
        if v32 == nil then
            p16:SetAttribute("UnscaledTextureLength", v30)
        else
            v30 = v32
        end
    end
    v17.texture_length = v30
    local v33 = p16.TextureSpeed
    if typeof(v33) == "CFrame" then
        local v34 = p16:FindFirstChild("UnscaledTextureSpeed")
        if v34 == nil then
            v34 = Instance.new("CFrameValue")
            v34.Name = "UnscaledTextureSpeed"
            v34.Value = v33
            v34.Parent = p16
        end
        v33 = v34.Value
    else
        local v35 = p16:GetAttribute("UnscaledTextureSpeed")
        if v35 == nil then
            p16:SetAttribute("UnscaledTextureSpeed", v33)
        else
            v33 = v35
        end
    end
    v17.texture_speed = v33
    return v17
end
local function v_u_42(p37, p38)
    local v39 = p37.Keypoints
    for v40, v41 in ipairs(v39) do
        v39[v40] = NumberSequenceKeypoint.new(v41.Time, v41.Value * p38, v41.Envelope * p38)
    end
    return NumberSequence.new(v39)
end
function v_u_2.apply_scale_to_instances(p43, p44)
    for _, v45 in ipairs(p43) do
        if v45:IsA("BasePart") then
            local v46 = v45.Size
            if typeof(v46) == "CFrame" then
                local v47 = v45:FindFirstChild("UnscaledSize")
                if v47 == nil then
                    v47 = Instance.new("CFrameValue")
                    v47.Name = "UnscaledSize"
                    v47.Value = v46
                    v47.Parent = v45
                end
                v46 = v47.Value
            else
                local v48 = v45:GetAttribute("UnscaledSize")
                if v48 == nil then
                    v45:SetAttribute("UnscaledSize", v46)
                else
                    v46 = v48
                end
            end
            v45.Size = v46 * p44
        elseif v45:IsA("Attachment") then
            local v49 = v45.Position
            if typeof(v49) == "CFrame" then
                local v50 = v45:FindFirstChild("UnscaledPosition")
                if v50 == nil then
                    v50 = Instance.new("CFrameValue")
                    v50.Name = "UnscaledPosition"
                    v50.Value = v49
                    v50.Parent = v45
                end
                v49 = v50.Value
            else
                local v51 = v45:GetAttribute("UnscaledPosition")
                if v51 == nil then
                    v45:SetAttribute("UnscaledPosition", v49)
                else
                    v49 = v51
                end
            end
            v45.Position = v49 * p44
        elseif v45:IsA("JointInstance") then
            local v52 = v45.C0
            if typeof(v52) == "CFrame" then
                local v53 = v45:FindFirstChild("UnscaledC0")
                if v53 == nil then
                    v53 = Instance.new("CFrameValue")
                    v53.Name = "UnscaledC0"
                    v53.Value = v52
                    v53.Parent = v45
                end
                v52 = v53.Value
            else
                local v54 = v45:GetAttribute("UnscaledC0")
                if v54 == nil then
                    v45:SetAttribute("UnscaledC0", v52)
                else
                    v52 = v54
                end
            end
            local v55 = v45.C1
            if typeof(v55) == "CFrame" then
                local v56 = v45:FindFirstChild("UnscaledC1")
                if v56 == nil then
                    v56 = Instance.new("CFrameValue")
                    v56.Name = "UnscaledC1"
                    v56.Value = v55
                    v56.Parent = v45
                end
                v55 = v56.Value
            else
                local v57 = v45:GetAttribute("UnscaledC1")
                if v57 == nil then
                    v45:SetAttribute("UnscaledC1", v55)
                else
                    v55 = v57
                end
            end
            v45.C0 = v52 + v52.p * (p44 - 1)
            v45.C1 = v55 + v55.p * (p44 - 1)
        elseif v45:IsA("Humanoid") then
            local v58 = v45.HipHeight
            if typeof(v58) == "CFrame" then
                local v59 = v45:FindFirstChild("UnscaledHipHeight")
                if v59 == nil then
                    v59 = Instance.new("CFrameValue")
                    v59.Name = "UnscaledHipHeight"
                    v59.Value = v58
                    v59.Parent = v45
                end
                v58 = v59.Value
            else
                local v60 = v45:GetAttribute("UnscaledHipHeight")
                if v60 == nil then
                    v45:SetAttribute("UnscaledHipHeight", v58)
                else
                    v58 = v60
                end
            end
            v45.HipHeight = v58 * p44
        elseif v45:IsA("ParticleEmitter") then
            local v61 = v_u_15(v45)
            v45.Acceleration = v61.acceleration * p44
            v45.Size = v_u_42(v61.size, p44)
            local v62 = v61.speed
            v45.Speed = NumberRange.new(v62.Min * p44, v62.Max * p44)
        elseif v45:IsA("Beam") then
            local v63 = v_u_36(v45)
            v45.Width0 = v63.width_0 * p44
            v45.Width1 = v63.width_1 * p44
            v45.CurveSize0 = v63.curve_size_0 * p44
            v45.CurveSize1 = v63.curve_size_1 * p44
            v45.TextureLength = v63.texture_length * p44
            v45.TextureSpeed = v63.texture_speed * p44
        end
    end
end
function v_u_2.apply_scale_to_instance(p64, p65)
    local v66 = p64:GetDescendants()
    table.insert(v66, p64)
    return v_u_2.apply_scale_to_instances(v66, p65)
end
function v_u_2.get_scale_param(p67, p68, p69)
    if v_u_3[p67] and (v_u_3[p67][p68] and not p69) then
        return v_u_3[p67][p68][1]
    else
        return p67:GetAttribute((("CharacterScaleParams_%*"):format(p68)))
    end
end
function v_u_2.set_scale_param(p70, p71, p72)
    return p70:SetAttribute(("CharacterScaleParams_%*"):format(p71), p72)
end
function v_u_2.cache_scale_param(p_u_73, p_u_74)
    if not (v_u_3[p_u_73] and v_u_3[p_u_73][p_u_74]) then
        if not v_u_3[p_u_73] then
            v_u_3[p_u_73] = {}
            p_u_73.Destroying:Connect(function()
                v_u_3[p_u_73] = nil
            end)
        end
        v_u_3[p_u_73][p_u_74] = { nil }
        local function v75()
            v_u_3[p_u_73][p_u_74][1] = v_u_2.get_scale_param(p_u_73, p_u_74, true)
        end
        v_u_3[p_u_73][p_u_74][1] = v_u_2.get_scale_param(p_u_73, p_u_74, true)
        p_u_73:GetAttributeChangedSignal((("CharacterScaleParams_%*"):format(p_u_74))):Connect(v75)
    end
end
function v_u_2.on_scale_param_changed(p76, p77, p78)
    return p76:GetAttributeChangedSignal((("CharacterScaleParams_%*"):format(p77))):Connect(p78)
end
function v_u_2.adjust_scale(p79, p80)
    local v81 = p80.scale
    local v82 = p80.animation_scale_override or p80.scale
    local v83
    if typeof(v81) == "number" then
        v83 = v81 > 0
    else
        v83 = false
    end
    assert(v83)
    local v84
    if typeof(v82) == "number" then
        v84 = v81 > 0
    else
        v84 = false
    end
    assert(v84)
    local v85 = p79:FindFirstChildWhichIsA("Humanoid") or p79:FindFirstChildWhichIsA("AnimationController")
    assert(v85, "Missing animatable")
    local v86 = v85:FindFirstChild("AnimationScale")
    if v86 then
        v86.Value = v82
    else
        local v87 = Instance.new("NumberValue")
        v87.Value = v82
        v87.Name = "AnimationScale"
        v87.Parent = v85
        v_u_1:AddTag(v87, "AnimationScale")
    end
    v_u_2.set_scale_param(p79, "scale", p80.scale)
    v_u_2.set_scale_param(p79, "animation_scale_override", p80.animation_scale_override)
    local v88 = p79:GetDescendants()
    table.insert(v88, p79)
    v_u_2.apply_scale_to_instances(v88, v81)
end
function v_u_2.scale_pet(p89, p90, p91)
    local v92 = p89:FindFirstChild("HumanoidRootPart")
    if v92 then
        local v93 = p89:FindFirstChild("Humanoid")
        if v93 then
            local v94 = v92.Position
            local v95 = v93.HipHeight + v92.Size.Y / 2
            local v96 = v94 - Vector3.new(0, v95, 0)
            v_u_2.adjust_scale(p89, {
                ["scale"] = p90,
                ["animation_scale_override"] = p91
            })
            local v97 = v92.CFrame - v92.Position + v96
            local v98 = v92.Size.Y + v93.HipHeight
            p89:SetPrimaryPartCFrame(v97 + Vector3.new(0, v98, 0))
        end
    else
        return
    end
end
function v_u_2.get_scale_params(p99)
    return {
        ["scale"] = v_u_2.get_scale_param(p99, "scale"),
        ["animation_scale_override"] = v_u_2.get_scale_param(p99, "animation_scale_override")
    }
end
function v_u_2.register_prescaled_instance(p100, p101)
    local v102 = typeof(p101) == "number"
    local v103 = "Scale must be a number (got " .. typeof(p101) .. ")"
    assert(v102, v103)
    local v104 = p100:GetDescendants()
    table.insert(v104, p100)
    for _, v105 in ipairs(v104) do
        if v105:IsA("BasePart") then
            local v106 = v105.Size / p101
            if typeof(v106) == "CFrame" then
                local v107 = v105:FindFirstChild("UnscaledSize")
                if v107 == nil then
                    v107 = Instance.new("CFrameValue")
                    v107.Name = "UnscaledSize"
                    v107.Value = v106
                    v107.Parent = v105
                end
                local _ = v107.Value
            elseif v105:GetAttribute("UnscaledSize") == nil then
                v105:SetAttribute("UnscaledSize", v106)
            end
        elseif v105:IsA("Attachment") then
            local v108 = v105.Position / p101
            if typeof(v108) == "CFrame" then
                local v109 = v105:FindFirstChild("UnscaledPosition")
                if v109 == nil then
                    v109 = Instance.new("CFrameValue")
                    v109.Name = "UnscaledPosition"
                    v109.Value = v108
                    v109.Parent = v105
                end
                local _ = v109.Value
            elseif v105:GetAttribute("UnscaledPosition") == nil then
                v105:SetAttribute("UnscaledPosition", v108)
            end
        elseif v105:IsA("JointInstance") then
            local v110 = v105.C0 - v105.C0.p + v105.C0.p / p101
            if typeof(v110) == "CFrame" then
                local v111 = v105:FindFirstChild("UnscaledC0")
                if v111 == nil then
                    v111 = Instance.new("CFrameValue")
                    v111.Name = "UnscaledC0"
                    v111.Value = v110
                    v111.Parent = v105
                end
                local _ = v111.Value
            elseif v105:GetAttribute("UnscaledC0") == nil then
                v105:SetAttribute("UnscaledC0", v110)
            end
            local v112 = v105.C1 - v105.C1.p + v105.C1.p / p101
            if typeof(v112) == "CFrame" then
                local v113 = v105:FindFirstChild("UnscaledC1")
                if v113 == nil then
                    v113 = Instance.new("CFrameValue")
                    v113.Name = "UnscaledC1"
                    v113.Value = v112
                    v113.Parent = v105
                end
                local _ = v113.Value
            elseif v105:GetAttribute("UnscaledC1") == nil then
                v105:SetAttribute("UnscaledC1", v112)
            end
        elseif v105:IsA("Humanoid") then
            local v114 = v105.HipHeight / p101
            if typeof(v114) == "CFrame" then
                local v115 = v105:FindFirstChild("UnscaledHipHeight")
                if v115 == nil then
                    v115 = Instance.new("CFrameValue")
                    v115.Name = "UnscaledHipHeight"
                    v115.Value = v114
                    v115.Parent = v105
                end
                local _ = v115.Value
            elseif v105:GetAttribute("UnscaledHipHeight") == nil then
                v105:SetAttribute("UnscaledHipHeight", v114)
            end
        elseif v105:IsA("ParticleEmitter") then
            local v116 = v105.Acceleration / p101
            if typeof(v116) == "CFrame" then
                local v117 = v105:FindFirstChild("UnscaledAcceleration")
                if v117 == nil then
                    v117 = Instance.new("CFrameValue")
                    v117.Name = "UnscaledAcceleration"
                    v117.Value = v116
                    v117.Parent = v105
                end
                local _ = v117.Value
            elseif v105:GetAttribute("UnscaledAcceleration") == nil then
                v105:SetAttribute("UnscaledAcceleration", v116)
            end
            local v118 = v_u_42(v105.Size, 1 / p101)
            if typeof(v118) == "CFrame" then
                local v119 = v105:FindFirstChild("UnscaledSize")
                if v119 == nil then
                    v119 = Instance.new("CFrameValue")
                    v119.Name = "UnscaledSize"
                    v119.Value = v118
                    v119.Parent = v105
                end
                local _ = v119.Value
            elseif v105:GetAttribute("UnscaledSize") == nil then
                v105:SetAttribute("UnscaledSize", v118)
            end
            local v120 = v105.Speed
            local v121 = 1 / p101
            local v122 = NumberRange.new(v120.Min * v121, v120.Max * v121)
            if typeof(v122) == "CFrame" then
                local v123 = v105:FindFirstChild("UnscaledSpeed")
                if v123 == nil then
                    v123 = Instance.new("CFrameValue")
                    v123.Name = "UnscaledSpeed"
                    v123.Value = v122
                    v123.Parent = v105
                end
                local _ = v123.Value
            elseif v105:GetAttribute("UnscaledSpeed") == nil then
                v105:SetAttribute("UnscaledSpeed", v122)
            end
        elseif v105:IsA("Beam") then
            local v124 = v105.Width0 / p101
            if typeof(v124) == "CFrame" then
                local v125 = v105:FindFirstChild("UnscaledWidth0")
                if v125 == nil then
                    v125 = Instance.new("CFrameValue")
                    v125.Name = "UnscaledWidth0"
                    v125.Value = v124
                    v125.Parent = v105
                end
                local _ = v125.Value
            elseif v105:GetAttribute("UnscaledWidth0") == nil then
                v105:SetAttribute("UnscaledWidth0", v124)
            end
            local v126 = v105.Width1 / p101
            if typeof(v126) == "CFrame" then
                local v127 = v105:FindFirstChild("UnscaledWidth1")
                if v127 == nil then
                    v127 = Instance.new("CFrameValue")
                    v127.Name = "UnscaledWidth1"
                    v127.Value = v126
                    v127.Parent = v105
                end
                local _ = v127.Value
            elseif v105:GetAttribute("UnscaledWidth1") == nil then
                v105:SetAttribute("UnscaledWidth1", v126)
            end
            local v128 = v105.CurveSize0 / p101
            if typeof(v128) == "CFrame" then
                local v129 = v105:FindFirstChild("UnscaledCurveSize0")
                if v129 == nil then
                    v129 = Instance.new("CFrameValue")
                    v129.Name = "UnscaledCurveSize0"
                    v129.Value = v128
                    v129.Parent = v105
                end
                local _ = v129.Value
            elseif v105:GetAttribute("UnscaledCurveSize0") == nil then
                v105:SetAttribute("UnscaledCurveSize0", v128)
            end
            local v130 = v105.CurveSize1 / p101
            if typeof(v130) == "CFrame" then
                local v131 = v105:FindFirstChild("UnscaledCurveSize1")
                if v131 == nil then
                    v131 = Instance.new("CFrameValue")
                    v131.Name = "UnscaledCurveSize1"
                    v131.Value = v130
                    v131.Parent = v105
                end
                local _ = v131.Value
            elseif v105:GetAttribute("UnscaledCurveSize1") == nil then
                v105:SetAttribute("UnscaledCurveSize1", v130)
            end
            local v132 = v105.TextureLength / p101
            if typeof(v132) == "CFrame" then
                local v133 = v105:FindFirstChild("UnscaledTextureLength")
                if v133 == nil then
                    v133 = Instance.new("CFrameValue")
                    v133.Name = "UnscaledTextureLength"
                    v133.Value = v132
                    v133.Parent = v105
                end
                local _ = v133.Value
            elseif v105:GetAttribute("UnscaledTextureLength") == nil then
                v105:SetAttribute("UnscaledTextureLength", v132)
            end
            local v134 = v105.TextureSpeed / p101
            if typeof(v134) == "CFrame" then
                local v135 = v105:FindFirstChild("UnscaledTextureSpeed")
                if v135 == nil then
                    v135 = Instance.new("CFrameValue")
                    v135.Name = "UnscaledTextureSpeed"
                    v135.Value = v134
                    v135.Parent = v105
                end
                local _ = v135.Value
            elseif v105:GetAttribute("UnscaledTextureSpeed") == nil then
                v105:SetAttribute("UnscaledTextureSpeed", v134)
            end
        end
    end
end
return v_u_2