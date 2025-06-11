--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.CelestialPetPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_4 = game:GetService("Workspace")
local v_u_5 = {
    ["celestial_2024_glormy_leo"] = "Celestial2024GlormyLeoTrick2",
    ["celestial_2024_glormy_hound"] = "Celestial2024GlormyHoundTrick1",
    ["moon_2025_glormy_dolphin"] = "Moon2025GlormyDolphinSpecial"
}
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p6)
        local v7 = p6.other_pet
        local v8
        if v7 == nil then
            v8 = false
        else
            v8 = v7:IsDescendantOf(v_u_4)
        end
        return v8
    end,
    ["init_performance"] = function(p9, p10)
        return {
            ["other_pet"] = p10.other_pet,
            ["trick_anim_name"] = v_u_5[p9.base.char_wrapper.pet_id]
        }
    end,
    ["step"] = function(p11, p12)
        local v13 = p12.other_pet
        if not v13:IsDescendantOf(v_u_4) then
            return v_u_2.Complete
        end
        if (p11.base.root.Position - v13.PrimaryPart.Position).magnitude > 20 then
            return v_u_2.Complete
        end
    end,
    ["calculate_modifiers"] = function(p14, p15)
        local v16 = {
            ["eyes_id"] = "happy_eyes",
            ["effects"] = { "sparkly", "celestial_vfx" }
        }
        if not p14.move_state.is_moving and (not p14.mount_state.is_mounted and (p14.exclusive_state ~= v_u_3.Sitting and p14.exclusive_state ~= v_u_3.Carried)) then
            v16.anim_name = p15.trick_anim_name or nil
        end
        return v16, {}
    end
}