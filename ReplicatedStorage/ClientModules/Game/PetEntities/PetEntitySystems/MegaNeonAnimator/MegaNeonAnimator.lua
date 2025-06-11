--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.MegaNeonAnimator (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("PetNeonHelper")
return {
    ["optimization_prioritize"] = "near",
    ["step"] = function(p2)
        if p2.shared_cache.WorldRoot then
            if not p2.mega_neon.force_visible then
                local v3 = p2.base.char_wrapper
                if v3 then
                    v3 = p2.base.char_wrapper.mega_neon
                end
                if not v3 then
                    return
                end
            end
            v_u_1.step_mega_neon(p2.mega_neon, p2.base.pet_model, p2.base.entry)
        end
    end
}