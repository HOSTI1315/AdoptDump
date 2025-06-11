--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.TransformingPetHandler (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("CustomEyesAnimator")
local v_u_3 = v1("DefaultEyesAnimator")
local v_u_4 = v1("Maid")
local v_u_5 = v1("PetAccessoryEquipHelper")
local v_u_6 = v1("PetEntityHelper")
v1("new:PetEntryHelper")
local v_u_7 = v1("new:PetRigs")
local v_u_8 = v1("PetPerformanceName")
local v_u_9 = v1("package:Sift")
local v_u_10 = v1("TweenPromise")
local v11 = {
    ["optimization_prioritize"] = "owned"
}
local function v_u_32(p12, p13, p14)
    local v15 = p12.base.entry
    local v16 = p12.base.pet_model
    local v17 = v15.transforming_pet.forms[p13].part_properties or {}
    local v18 = {}
    for v19, v20 in v15.transforming_pet.forms do
        if v20.parts then
            for _, v21 in v20.parts do
                if v19 == p13 then
                    v18[v21] = {
                        ["Transparency"] = 0
                    }
                else
                    v18[v21] = {
                        ["Transparency"] = 1
                    }
                end
            end
        end
    end
    local v22 = v_u_9.Dictionary.joinDeep(v17, v18)
    local v23 = v_u_5.get_has_shoes(v16)
    if v23 then
        v23 = v_u_5.get_shoe_hide_parts(v16)
    end
    local v24 = {}
    if v23 then
        for _, v25 in v23 do
            v24[v25.Name] = true
        end
    end
    for _, v26 in v16:GetChildren() do
        local v27 = v26.Name
        local v28 = v26:GetAttribute("is_neon_transformed")
        local v29 = v22[v27]
        if v29 and not (v28 and (v29.Color or v29.Material)) then
            for v30, v31 in v29 do
                if v30 == "Color" then
                    if not v26:GetAttribute("colored_hair_spray_original_color") then
                        v_u_10.new(v26, TweenInfo.new(p14 and 0 or 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            ["Color"] = v31
                        })
                    end
                elseif v30 ~= "Transparency" or not (v23 and v24[v26.Name]) then
                    v26[v30] = v31
                end
            end
        end
    end
end
local function v_u_42(p33, p34)
    local v35 = p33.base.entry
    local v36 = v35.transforming_pet.forms[p34].eyes or v35.eyes
    local v37 = p33.base.entry.eye_transparency
    local v38 = p33.base.pet_model
    local v39 = v_u_7.get(v38).get_geo_part(v38, v36[1])
    p33.default_eyes.rig_appearance = {
        ["color"] = v39.Color,
        ["material"] = v39.Material,
        ["transparency"] = v37
    }
    for _, v40 in v35.eyes do
        local v41 = v_u_9.List.find(v36, v40) ~= nil
        v_u_3.set_eye_enabled(p33, v40, v41)
    end
    v_u_2.force_rerender(p33)
end
function v11.setup(p_u_43)
    if p_u_43.base.entry.transforming_pet then
        local v44 = v_u_4.new()
        local v45 = p_u_43.base.char
        local v46 = p_u_43.base.pet_model
        v44:GiveTask(v45:GetAttributeChangedSignal("has_colored_hair_spray"):Connect(function()
            local v47 = p_u_43
            local v48 = p_u_43.modifier_values_from_performances.current_form
            v47.transforming_pet.last_form = v48
            v_u_32(v47, v48, true)
            v_u_42(v47, v48)
            local v49 = v47.base.entry
            v47.base.entry.anims = v49.transforming_pet.forms[v48].anims
            v47.base.entry.tricks = v49.transforming_pet.forms[v48].tricks
        end))
        v44:GiveTask(v46.ChildAdded:Connect(function(p50)
            if p50:GetAttribute("PetAvatarItemKind") then
                local v51 = p_u_43
                local v52 = p_u_43.modifier_values_from_performances.current_form
                v51.transforming_pet.last_form = v52
                v_u_32(v51, v52, true)
                v_u_42(v51, v52)
                local v53 = v51.base.entry
                v51.base.entry.anims = v53.transforming_pet.forms[v52].anims
                v51.base.entry.tricks = v53.transforming_pet.forms[v52].tricks
            end
        end))
        v44:GiveTask(v46.ChildRemoved:Connect(function(p54)
            if p54:GetAttribute("PetAvatarItemKind") then
                local v55 = p_u_43
                local v56 = p_u_43.modifier_values_from_performances.current_form
                v55.transforming_pet.last_form = v56
                v_u_32(v55, v56, true)
                v_u_42(v55, v56)
                local v57 = v55.base.entry
                v55.base.entry.anims = v57.transforming_pet.forms[v56].anims
                v55.base.entry.tricks = v57.transforming_pet.forms[v56].tricks
            end
        end))
        p_u_43.transforming_pet.maid = v44
    end
end
function v11.step(p58)
    local v59 = p58.base.entry
    if v59.transforming_pet then
        if (p58.client_has_control or p58.is_npc_pet) and not (v_u_6.has_performance(p58, v_u_8.Transform) or p58.staged_performances[v_u_8.Transform]) then
            v_u_6.stage_performance(p58, {
                ["name"] = v_u_8.Transform
            })
        end
        local v60 = v59.transforming_pet.get_form(p58)
        if p58.transforming_pet.needs_setup then
            p58.transforming_pet.last_form = v60
            v_u_32(p58, v60, true)
            v_u_42(p58, v60)
            local v61 = p58.base.entry
            p58.base.entry.anims = v61.transforming_pet.forms[v60].anims
            p58.base.entry.tricks = v61.transforming_pet.forms[v60].tricks
            p58.transforming_pet.needs_setup = false
        else
            local v62 = p58.transforming_pet.last_form
            local v63 = p58.modifier_values_from_performances.current_form
            if v63 and v63 ~= v62 then
                p58.transforming_pet.last_form = v63
                v_u_32(p58, v63, nil)
                v_u_42(p58, v63)
                local v64 = p58.base.entry
                p58.base.entry.anims = v64.transforming_pet.forms[v63].anims
                p58.base.entry.tricks = v64.transforming_pet.forms[v63].tricks
                local v65 = p58.base.entry.transforming_pet.transformation_effects
                if v65 then
                    v65(p58)
                end
            end
        end
    else
        return
    end
end
function v11.cleanup(p66)
    if p66.transforming_pet.maid then
        p66.transforming_pet.maid:DoCleaning()
    end
    p66.transforming_pet.maid = nil
end
return v11