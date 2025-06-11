--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.DefaultEyesAnimator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("CharacterScale")
local v_u_3 = v1("new:PetRigs")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = Random.new()
local v6 = {}
local function v_u_11(p7, ...)
    local v8 = false
    for v9 = 1, select("#", ...) do
        local v10 = select(v9, ...)
        if p7[v9] ~= v10 then
            p7[v9] = v10
            v8 = true
        end
    end
    return v8
end
local function v_u_15(p12)
    local v13 = p12.rig_part
    local v14 = p12.display_part
    p12.rig_part_cached_size = v13.size
    v14.Size = v13.Size
    p12.blink_tween = v_u_4:Create(v14, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, true), {
        ["Size"] = v13.Size * Vector3.new(1, 0, 1)
    })
    p12.close_tween = v_u_4:Create(v14, TweenInfo.new(0.12, Enum.EasingStyle.Linear), {
        ["Size"] = v13.Size * Vector3.new(1, 0, 1)
    })
    p12.open_tween = v_u_4:Create(v14, TweenInfo.new(0.12, Enum.EasingStyle.Linear), {
        ["Size"] = v13.Size
    })
end
local function v_u_18(p16)
    for _, v17 in p16:GetChildren() do
        if not v17:IsA("SurfaceAppearance") then
            v17:Destroy()
        end
    end
end
local function v_u_22(p19, p20)
    for _, v21 in p19:GetDescendants() do
        if v21:IsA("Motor6D") and v21.Part1 == p20 then
            return v21
        end
    end
    return nil
end
function v6.setup(p_u_23)
    if p_u_23.base.entry.is_egg then
        return
    end
    local v_u_24 = p_u_23.default_eyes
    v_u_24.next_blink_time = os.clock() + 5
    local v25 = p_u_23.base.pet_model
    local v26 = p_u_23.base.entry.eyes or { "Eyes" }
    local v27 = p_u_23.base.entry.eye_transparency
    local v28 = {}
    for _, v29 in ipairs(v26) do
        local v30 = v_u_3.get(v25).get_geo_part(v25, v29)
        if v30 then
            local v31 = v_u_3.get(v25).get_part(v25, v29)
            local v32
            if v31 then
                v32 = nil
                ::l9::
                local v33 = {
                    ["rig_part"] = v30,
                    ["default_eye_transparency"] = v27,
                    ["enabled"] = true
                }
                local v34 = v30:FindFirstChild("DisplayPart")
                if v34 then
                    v34:Destroy()
                end
                local v35 = v30:Clone()
                v_u_18(v35)
                v35.Name = "DisplayPart"
                v35.Parent = v31
                local v36 = Instance.new("Attachment")
                v36.Name = "EyesAttachment"
                local v37
                if v32 then
                    v37 = v32.C0
                else
                    v37 = CFrame.identity
                end
                v36.CFrame = v37
                v36.Parent = v31
                local v38 = Instance.new("Attachment")
                v38.Name = "EyesAttachment"
                local v39
                if v32 then
                    v39 = v32.C1
                else
                    v39 = CFrame.identity
                end
                v38.CFrame = v39
                v38.Parent = v35
                local v40 = Instance.new("RigidConstraint")
                v40.Name = "DisplayPartWeld"
                v40.Attachment0 = v36
                v40.Attachment1 = v38
                v40.Parent = v35
                v33.display_part = v35
                v_u_24.rig_appearance = v_u_24.rig_appearance or {
                    ["color"] = v30.Color,
                    ["material"] = v30.Material,
                    ["transparency"] = v27
                }
                v30.Transparency = 1
                v_u_15(v33)
                v28[v29] = v33
            else
                v32 = v_u_22(v25, v30)
                if v32 then
                    local v41 = v32.Part0.Name:gsub("_Geo", "")
                    v31 = v_u_3.get(v25).get_part(v25, v41)
                    goto l9
                end
            end
        end
    end
    v_u_24.eye_states = v28
    v_u_24.char_transparency = p_u_23.base.char:GetAttribute("Transparency")
    p_u_23.base.char:GetAttributeChangedSignal("Transparency"):Connect(function()
        v_u_24.char_transparency = p_u_23.base.char:GetAttribute("Transparency")
    end)
    local v42 = table.create(5)
    local v43 = v_u_11
    local v44 = v_u_24.char_transparency
    local v45 = v_u_24.visible
    local v46 = v_u_24.eyes_closed
    local v47
    if p_u_23.custom_eyes.supports_custom_eyes then
        v47 = p_u_23.custom_eyes.eyes_id or nil
    else
        v47 = nil
    end
    v43(v42, v44, v45, v46, v47, v_u_2.get_scale_param(p_u_23.base.char, "scale") or 1)
    v_u_24.memo_deps = v42
end
local function v_u_58(p48, p49)
    local v50 = p48.default_eyes
    local v51 = v50.char_transparency
    local v52 = v50.rig_appearance.transparency
    local v53 = 0
    local v54
    if v51 and v52 then
        v54 = math.max(v51, v52)
    else
        v54 = v51 or (v52 or v53)
    end
    local v55 = p48.custom_eyes.supports_custom_eyes and p48.custom_eyes.eyes_id ~= "default" and 1 or v54
    local v56 = not v50.visible and 1 or v55
    local v57 = not p49.enabled and 1 or v56
    p49.display_part.Transparency = v57
    p49.rig_part.Transparency = 1
end
function v6.set_eye_enabled(p59, p60, p61)
    local v62 = p59.default_eyes.eye_states[p60]
    if v62 then
        v62.enabled = p61
        v_u_58(p59, v62)
    end
end
local function v_u_74(p63, p64, p65)
    local v66 = p63.default_eyes
    v_u_58(p63, p64)
    if p64.rig_part.Size ~= p64.rig_part_cached_size then
        v_u_15(p64)
        local v67 = p64.active_tween
        if v67 ~= nil then
            if v67 then
                v67:Cancel()
            end
            p64.active_tween = nil
        end
    end
    if v66.eyes_closed then
        local v68 = p64.active_tween
        local v69 = p64.close_tween
        if v68 ~= v69 then
            if v68 then
                v68:Cancel()
            end
            p64.active_tween = v69
            if v69 then
                v69:Play()
            end
        end
    elseif p64.active_tween == p64.close_tween then
        local v70 = p64.active_tween
        local v71 = p64.open_tween
        if v70 ~= v71 then
            if v70 then
                v70:Cancel()
            end
            p64.active_tween = v71
            if v71 then
                v71:Play()
            end
        end
    else
        if p65 then
            p64.display_part.Size = p64.rig_part_cached_size
            local v72 = p64.active_tween
            local v73 = p64.blink_tween
            local _ = v72 == v73
            if v72 then
                v72:Cancel()
            end
            p64.active_tween = v73
            if v73 then
                v73:Play()
            end
        end
        return
    end
end
local function v_u_85(p75)
    local v76 = p75.default_eyes
    local v77 = v76.memo_deps
    local v78 = false
    if v76._was_closed ~= v76.eyes_closed then
        if v76._was_closed then
            v76.next_blink_time = os.clock() + v_u_5:NextNumber(1, 6)
        end
        v76._was_closed = v76.eyes_closed
    end
    if os.clock() > v76.next_blink_time then
        v76.next_blink_time = os.clock() + v_u_5:NextNumber(1, 6)
        v78 = true
    end
    if not v78 then
        local v79 = v_u_11
        local v80 = v76.char_transparency
        local v81 = v76.visible
        local v82 = v76.eyes_closed
        local v83
        if p75.custom_eyes.supports_custom_eyes then
            v83 = p75.custom_eyes.eyes_id or nil
        else
            v83 = nil
        end
        if not v79(v77, v80, v81, v82, v83, v_u_2.get_scale_param(p75.base.char, "scale") or 1) then
            return
        end
    end
    for _, v84 in v76.eye_states do
        if v84.enabled then
            v_u_74(p75, v84, v78)
        end
    end
end
v6.optimization_run_only_for = "near"
function v6.step(p86)
    if p86.visible then
        if p86.base.entry.is_egg then
            return
        elseif p86.base.entry.has_non_standard_eyes then
            return
        elseif not p86.base.entry.no_eyes then
            v_u_85(p86)
        end
    else
        return
    end
end
return v6