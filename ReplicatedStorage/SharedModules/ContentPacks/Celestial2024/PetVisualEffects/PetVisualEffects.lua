--// ReplicatedStorage.SharedModules.ContentPacks.Celestial2024.PetVisualEffects (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Promise")
local v5 = {
    ["celestial_vfx"] = {
        ["asset_names"] = { "CelestialVFX" },
        ["on_create"] = function(p2)
            p2.CelestialVFX.Frame:Emit(2)
            p2.CelestialVFX.Stars:Emit(2)
            p2.CelestialVFX.Void:Emit(2)
        end,
        ["pre_destroy"] = function(p3)
            local v4 = p3.CelestialVFX.Frame
            v4.Enabled = false
            v_u_1.delay(v4.Lifetime.Max):await()
        end
    }
}
return v5