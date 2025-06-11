--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.PetSoundPlayer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = v1("package:Sift")
local v_u_4 = {}
local v_u_5 = v2.Sounds.Pets
local function v_u_7(p6)
    return string.format("PetSound:%s", p6)
end
function v_u_4.setup(p_u_8)
    for _, v9 in v_u_5:GetChildren() do
        local v10 = p_u_8.base.root:FindFirstChild(v_u_7(v9.Name))
        if v10 then
            p_u_8.sounds.sound_unmodified_volumes[v10] = v9.Volume
            v10.Volume = v9.Volume * p_u_8.sounds.global_volume
        else
            local v11 = v9:Clone()
            local v12 = v9.Name
            v11.Name = string.format("PetSound:%s", v12)
            p_u_8.sounds.sound_unmodified_volumes[v11] = v9.Volume
            v11.Volume = v9.Volume * p_u_8.sounds.global_volume
            v11.Parent = p_u_8.base.root
        end
    end
    local function v19(p13)
        local v14 = p_u_8.base.root:FindFirstChild(v_u_7(p13))
        local v15 = string.format
        assert(v14, v15("No sounds exists for name \'%s\'", p13))
        local v16 = not v14.Looped
        local v17 = string.format
        local v18 = tostring(p13)
        assert(v16, v17("Cannot play looping sound \'%s\' with play_sound. Use the looping_sounds performance modifier instead.", v18))
        v14:Play()
    end
    local function v23(p20)
        local v21 = p_u_8.base.root:FindFirstChild(v_u_7(p20))
        local v22 = string.format
        assert(v21, v22("No sounds exists for name \'%s\'", p20))
        v21:Stop()
    end
    p_u_8.sounds.play_sound = v19
    p_u_8.sounds.stop_sound = v23
end
function v_u_4.cleanup(p24)
    for _, v25 in p24.base.root:GetChildren() do
        if v25:IsA("Sound") and v25.Name:match("^PetSound:") then
            v25:Stop()
            v25:Destroy()
        end
    end
end
function v_u_4.stop_looping_sound(p26, p27)
    p26.sounds.stop_sound(p27)
end
function v_u_4.play_looping_sound(p28, p29)
    local v30 = p28.base.root:FindFirstChild(v_u_7(p29))
    local v31 = string.format
    assert(v30, v31("No sounds exists for name \'%s\'", p29))
    v30:Play()
end
function v_u_4.reconcile_looping_sounds(p32, p33, p34)
    local v35 = v_u_3.List.toSet(p33)
    local v36 = v_u_3.List.toSet(p34)
    for v37, _ in pairs(v35) do
        if not v36[v37] then
            v_u_4.play_looping_sound(p32, v37)
        end
    end
    for v38, _ in pairs(v36) do
        if not v35[v38] then
            v_u_4.stop_looping_sound(p32, v38)
        end
    end
end
v_u_4.optimization_prioritize = "near"
function v_u_4.step(p39)
    local v40 = p39.sounds
    local v41 = p39.modifier_values_from_performances.looping_sounds or {}
    if v40.global_volume_last ~= v40.global_volume then
        v40.global_volume_last = v40.global_volume
        for v42, v43 in v40.sound_unmodified_volumes do
            v42.Volume = v43 * v40.global_volume
        end
    end
    local v44 = v40.current_looping_sounds
    local v45
    if #v41 == #v44 then
        if #v41 == 0 then
            v45 = true
        else
            if #v41 ~= 1 then
                for v46, v47 in v41 do
                    if v47 ~= v44[v46] then
                        v45 = false
                        goto l10
                    end
                end
                v45 = true
                goto l10
            end
            v45 = v41[1] == v44[1]
        end
    else
        v45 = false
    end
    ::l10::
    if not v45 then
        v_u_4.reconcile_looping_sounds(p39, v41, v40.current_looping_sounds)
        v40.current_looping_sounds = v41
    end
end
return v_u_4