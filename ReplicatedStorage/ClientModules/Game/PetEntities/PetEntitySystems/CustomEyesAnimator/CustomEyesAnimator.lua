--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.CustomEyesAnimator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetEyesDB")
local v_u_3 = v1("Utilities")
local v_u_4 = v1("ResizeM")
local v_u_5 = v1("CharacterScale")
local v_u_6 = game:GetService("ReplicatedStorage")
local function v_u_12(p7, p8)
    local v9 = p7:GetDescendants()
    table.insert(v9, p7)
    for _, v10 in ipairs(v9) do
        if v10:IsA("BasePart") then
            local v11 = v10:GetAttribute("BaseTransparency")
            if v11 == nil then
                v10:SetAttribute("BaseTransparency", v10.Transparency)
                v11 = v10.Transparency
            end
            v10.Transparency = 1 - (1 - v11) * (1 - p8)
        end
    end
end
local v_u_58 = {
    ["optimization_prioritize"] = "near",
    ["setup"] = function(p13)
        if p13.base.entry.is_egg then
            return
        elseif not p13.base.entry.no_eyes then
            local v14 = p13.base.pet_model:FindFirstChild("custom_eye_left_attachment", true)
            local v15 = p13.base.pet_model:FindFirstChild("custom_eye_right_attachment", true)
            if v14 and v15 then
                p13.custom_eyes.supports_custom_eyes = true
            end
            p13.custom_eyes.left_eye_attachment = v14
            p13.custom_eyes.right_eye_attachment = v15
        end
    end,
    ["cleanup"] = function(p16)
        if p16.custom_eyes.current_model then
            p16.custom_eyes.current_model:Destroy()
        end
    end,
    ["swap_eyes"] = function(p17, p18, p19, p20)
        local v21 = p17.custom_eyes
        if v21.current_model then
            v21.current_model:Destroy()
            v21.current_model = nil
        end
        if p18 ~= "default" then
            local v22 = v_u_2[p18]
            local v23 = v22.model_id
            local v24 = v21.left_eye_attachment
            local v25 = v21.right_eye_attachment
            local v26 = v_u_6.Resources.PetEyes:FindFirstChild(v23)
            local v27 = v26 ~= nil
            local v28 = "Eye model " .. v23 .. " for custom eyes " .. p18 .. " is missing."
            assert(v27, v28)
            local v29 = Instance.new("Model")
            v29.Name = v23
            v29.Parent = p17.base.pet_model
            for _, v30 in pairs({ "Left", "Right" }) do
                local v31 = v26:Clone()
                v31.Name = v30 .. "Eye"
                v31.Parent = v29
                local v32
                if v31:IsA("Model") then
                    v32 = v31.PrimaryPart
                    local v33 = v31.PrimaryPart
                    local v34 = "Eye model " .. v23 .. " for custom eyes " .. p18 .. " needs a PrimaryPart."
                    assert(v33, v34)
                else
                    v32 = v31
                end
                local v35 = v30 == "Left" and v24 and v24 or v25
                local v36 = v31:FindFirstChild(v35.Name, true)
                local v37 = v36 ~= nil
                local v38 = "Eye model " .. v23 .. " for custom eyes " .. p18 .. " is missing " .. v35.Name .. "."
                assert(v37, v38)
                local v39 = v35:FindFirstChild("EyeScale")
                local v40 = (v39 == nil and 1 or v39.Value) * p19
                v_u_4.scale(v31, v40, v32.Position)
                if v31:IsA("Model") then
                    for _, v41 in pairs(v31:GetDescendants()) do
                        if v41:IsA("BasePart") then
                            v41.Anchored = false
                            v41.CanCollide = false
                            v41:SetAttribute("OriginalEyeColor", v41.Color)
                            if v41 ~= v31.PrimaryPart then
                                v_u_3.Weld(v41, v31.PrimaryPart)
                            end
                        end
                    end
                else
                    v31.Anchored = false
                    v31.CanCollide = false
                    v31:SetAttribute("OriginalEyeColor", v31.Color)
                end
                local v42 = Instance.new("RigidConstraint")
                v42.Attachment0 = v35
                v42.Attachment1 = v36
                v42.Parent = v32
                if not v22.override_rig_appearance then
                    local v43 = p17.default_eyes
                    v32.Color = v43.rig_appearance.color
                    v32.Material = v43.rig_appearance.material
                end
            end
            v_u_5.register_prescaled_instance(v29, p19)
            v_u_12(v29, p20)
            if p17.base.entry.is_left_eye_hidden then
                v_u_12(v29.LeftEye, 1)
            end
            if p17.base.entry.is_right_eye_hidden then
                v_u_12(v29.RightEye, 1)
            end
            v21.current_model = v29
        end
    end,
    ["get_eye_transparency"] = function(p44)
        local v45 = p44.custom_eyes
        local v46 = p44.shared_cache.char_transparency_attribute
        local v47 = 0
        if v45.visible then
            local v48 = p44.base.entry.eye_transparency or p44.default_eyes.rig_appearance.transparency
            if v46 and v48 then
                return math.max(v46, v48)
            else
                return v46 or (v48 or v47)
            end
        else
            return 1
        end
    end,
    ["force_rerender"] = function(p49)
        local v50 = v_u_5.get_scale_param(p49.base.char, "scale") or 1
        local v51 = v_u_58.get_eye_transparency(p49)
        v_u_58.swap_eyes(p49, p49.custom_eyes.eyes_id, v50, v51)
    end,
    ["step"] = function(p52)
        if p52.base.entry.is_egg then
            return
        elseif p52.base.entry.no_eyes then
            return
        else
            local v53 = p52.custom_eyes
            local v54 = v_u_5.get_scale_param(p52.base.char, "scale") or 1
            local v55 = v_u_58.get_eye_transparency(p52)
            v53.eyes_id = p52.modifier_values_from_performances.eyes_id or "default"
            if v53.supports_custom_eyes then
                if v53.eyes_id ~= v53.last_eyes_id then
                    v_u_58.swap_eyes(p52, v53.eyes_id, v54, v55)
                    v53.last_eyes_id = v53.eyes_id
                    v53.last_eyes_color = nil
                end
                if v54 ~= v53.last_scale and v53.current_model ~= nil then
                    v_u_5.apply_scale_to_instance(v53.current_model, v54)
                end
                v53.last_scale = v54
                v53.eyes_color = p52.modifier_values_from_performances.eye_color
                if v53.current_model ~= nil and v53.eyes_color ~= v53.last_eyes_color then
                    for _, v56 in v53.current_model:GetDescendants() do
                        if v56:IsA("BasePart") then
                            v56.Color = v53.eyes_color or (v56:GetAttribute("OriginalEyeColor") or v56.Color)
                        end
                    end
                end
                v53.last_eyes_color = v53.eyes_color
                if v55 ~= v53.eye_transparency and v53.current_model ~= nil then
                    v_u_12(v53.current_model, v55)
                    if p52.base.entry.is_left_eye_hidden then
                        v_u_12(v53.current_model.LeftEye, 1)
                    end
                    if p52.base.entry.is_right_eye_hidden then
                        v_u_12(v53.current_model.RightEye, 1)
                    end
                end
                v53.eye_transparency = v55
                if v53.eyes_id ~= "default" then
                    local v57 = v_u_2[v53.eyes_id]
                    if v57.on_step then
                        if not p52.base.entry.is_left_eye_hidden then
                            v57.on_step(v53.current_model.LeftEye)
                        end
                        if not p52.base.entry.is_right_eye_hidden then
                            v57.on_step(v53.current_model.RightEye)
                        end
                    end
                end
            elseif v53.eyes_id ~= "default" and not v53.already_threw_warning then
                warn("Missing custom_eye_left or _right attachment for pet " .. p52.base.entry.name .. ". Animated / custom eyes will be disabled.")
                v53.already_threw_warning = true
            end
        end
    end
}
return v_u_58