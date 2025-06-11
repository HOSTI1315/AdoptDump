--// ReplicatedStorage.SharedModules.EffectsToggleHelper (ModuleScript)

local v_u_1 = {}
local v_u_2 = { "Beam", "ParticleEmitter", "Light" }
function v_u_1.is_valid_visual_effect_class(p3)
    for _, v4 in ipairs(v_u_2) do
        if p3:IsA(v4) then
            return true
        end
    end
    return false
end
function v_u_1.toggle_visual_effect_classes(p5, p6)
    local v7 = p5 ~= nil
    assert(v7, "Missing parameter instances.")
    local v8 = p6 ~= nil
    assert(v8, "Missing parameter enabled.")
    for _, v9 in ipairs(p5) do
        if v_u_1.is_valid_visual_effect_class(v9) then
            v9.Enabled = p6
        end
    end
end
function v_u_1.toggle_audio_classes(p10, p11)
    local v12 = p10 ~= nil
    assert(v12, "Missing parameter instances.")
    local v13 = p11 ~= nil
    assert(v13, "Missing parameter enabled.")
    for _, v14 in ipairs(p10) do
        if v14:IsA("Sound") and v14.Looped then
            if p11 then
                v14:Play()
            else
                v14:Stop()
            end
        end
    end
end
function v_u_1.toggle_effects(p15, p16)
    v_u_1.toggle_visual_effect_classes(p15, p16)
    v_u_1.toggle_audio_classes(p15, p16)
end
return v_u_1