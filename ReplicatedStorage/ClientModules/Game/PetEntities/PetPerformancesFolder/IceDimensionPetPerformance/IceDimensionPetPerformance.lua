--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.IceDimensionPetPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_4 = game:GetService("Workspace")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p5)
        local v6 = p5.other_pet
        local v7
        if v6 == nil then
            v7 = false
        else
            v7 = v6:IsDescendantOf(v_u_4)
        end
        return v7
    end,
    ["init_performance"] = function(p8, p9)
        return {
            ["other_pet"] = p9.other_pet,
            ["trick_anim_name"] = p8.base.char_wrapper.pet_id == "ice_dimension_2025_frostbite_bear" and "IceDimension2025FrostbiteBearBFVFX" or "Winter2024FrostbiteCubBFVFX"
        }
    end,
    ["step"] = function(p10, p11)
        local v12 = p11.other_pet
        if not v12:IsDescendantOf(v_u_4) then
            return v_u_2.Complete
        end
        if (p10.base.root.Position - v12.PrimaryPart.Position).magnitude > 20 then
            return v_u_2.Complete
        end
    end,
    ["calculate_modifiers"] = function(p13, p14)
        local v15 = {
            ["eyes_id"] = "happy_eyes",
            ["effects"] = { "sparkly", "ice_dimension_vfx" }
        }
        if not p13.move_state.is_moving and (not p13.mount_state.is_mounted and (p13.exclusive_state ~= v_u_3.Sitting and p13.exclusive_state ~= v_u_3.Carried)) then
            v15.anim_name = p14.trick_anim_name or nil
        end
        return v15, {}
    end
}