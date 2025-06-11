--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.PetVisualEffects (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Promise")
local v_u_2 = nil
local v8 = {
    ["ice_dimension_vfx"] = {
        ["asset_names"] = { "IceDimensionVFX" },
        ["on_create"] = function(p3)
            local v_u_4 = p3.IceDimensionVFX:FindFirstChild("Hearts")
            v_u_2 = v_u_1.new(function(_, _, p5)
                while not p5() do
                    if v_u_4 then
                        v_u_4:Emit(1)
                    end
                    task.wait(0.25)
                end
            end)
        end,
        ["pre_destroy"] = function(p6)
            if v_u_2 then
                v_u_2:cancel()
                v_u_2 = nil
            end
            local v7 = p6.IceDimensionVFX:FindFirstChild("Hearts")
            if v7 then
                v7.Enabled = false
                v_u_1.delay(v7.Lifetime.Max):await()
            end
        end
    }
}
return v8