--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.LightUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("FurnitureUseHelperLegacy")
return {
    ["LIGHT_WITH_EFFECTS"] = function(p3)
        local v4 = v_u_2.LIGHT(p3)
        function v4.post_render(p5, p6, _, _, _)
            v_u_1("EffectsToggleHelper").toggle_effects(p6:GetDescendants(), p5.on)
        end
        return v4
    end
}