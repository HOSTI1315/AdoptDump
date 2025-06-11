--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.VisualEffectCreator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetVisualEffectsDB")
local v_u_3 = v1("CharacterHider")
local v_u_4 = v1("CharacterScale")
local v_u_5 = v1("TableUtil")
local v_u_6 = v1("new:PetRigs")
local v_u_7 = v1("package:Promise")
local v_u_8 = v1("package:Sift")
local v_u_9 = game:GetService("ReplicatedStorage").Resources.PetVisualEffects
local v_u_10 = v_u_9.AttachmentsFolder
local function v_u_13(p11)
    for _, v12 in ipairs(p11.base.pet_model:GetDescendants()) do
        if v12:IsA("Attachment") and v12.Name == "Mouth" then
            return v12
        end
    end
    return nil
end
local v_u_56 = {
    ["setup"] = function(p14)
        local v15 = p14.visual_effects
        v15._prev_staged_effects = v15._staged_effects
        v15.pet_model_attachments = {
            ["mouth"] = v_u_13(p14)
        }
    end,
    ["create_effect"] = function(p16, p17)
        local v18 = p16.visual_effects
        local v19 = v_u_2[p17]
        local v20 = "Effect entry doesn\'t exist: " .. tostring(p17)
        assert(v19, v20)
        if v18.instances[p17] then
            warn("[VisualEffectCreator] Effect", p17, "already exists. From:\n" .. debug.traceback())
        else
            local v21 = v_u_4.get_scale_param(p16.base.char, "scale") or 1
            local v22 = {}
            for _, v23 in pairs(v19.asset_names) do
                local v24 = v_u_9:FindFirstChild(v23) or v_u_10:FindFirstChild(v23)
                local v25 = "Effect asset doesn\'t exist: " .. tostring(v23)
                assert(v24, v25)
                local v26 = p16.base.entry.head_part_for_reactions or "Head"
                local v27 = v24:Clone()
                local v28 = v19.parent_override or v26
                local v29 = p16.base.pet_model
                local v30 = v29:FindFirstChild("ReactionPartOverride")
                v27.Parent = v30 and v30.Value or v_u_6.get(v29).get_part(v29, v28)
                v22[v23] = v27
                v_u_4.register_prescaled_instance(v27, 1)
                v_u_4.apply_scale_to_instance(v27, v21)
            end
            v18.instances[p17] = v22
            if v19.on_create then
                v_u_7.try(v19.on_create, v22, p16)
            end
        end
    end,
    ["reconcile_scale"] = function(p31)
        local v32 = p31.visual_effects
        local v33 = v_u_4.get_scale_param(p31.base.char, "scale") or 1
        if v33 ~= v32.last_scale then
            v32.last_scale = v33
            for _, v34 in pairs(v32.instances) do
                for _, v35 in pairs(v34) do
                    v_u_4.apply_scale_to_instance(v35, v33)
                end
            end
        end
    end,
    ["destroy_effect"] = function(p36, p37)
        local v38 = p36.visual_effects
        local v_u_39 = v_u_2[p37]
        local v_u_40 = v38.instances[p37]
        if v_u_40 then
            v_u_7.try(function()
                if v_u_39.pre_destroy then
                    v_u_7.try(v_u_39.pre_destroy, v_u_40):catch(warn):expect()
                end
                for _, v41 in pairs(v_u_40) do
                    v41:Destroy()
                end
            end)
            v38.instances[p37] = nil
        end
    end,
    ["reconcile_changes"] = function(p42, p43, p44)
        local v45 = v_u_8.List.toSet(p43)
        local v46 = v_u_8.List.toSet(p44)
        local v47 = p42.base.char
        if v_u_3.is_char_hidden(v47) then
            for v48, _ in p42.visual_effects.instances do
                v_u_56.destroy_effect(p42, v48)
            end
        else
            for v49, _ in pairs(v45) do
                if not v46[v49] then
                    v_u_56.create_effect(p42, v49)
                end
            end
            for v50, _ in pairs(v46) do
                if not v45[v50] then
                    v_u_56.destroy_effect(p42, v50)
                end
            end
        end
    end,
    ["optimization_prioritize"] = "near",
    ["step"] = function(p51)
        local v52 = p51.visual_effects
        local v53 = p51.modifier_values_from_performances.effects or {}
        v_u_56.reconcile_scale(p51)
        if not v_u_5.shallow_equal(v53, v52.current_effects) then
            v_u_56.reconcile_changes(p51, v53, v52.current_effects)
            v52.current_effects = v53
        end
    end,
    ["cleanup"] = function(p54)
        for v55, _ in p54.visual_effects.current_effects do
            v_u_56.destroy_effect(p54, v55)
        end
    end
}
return v_u_56