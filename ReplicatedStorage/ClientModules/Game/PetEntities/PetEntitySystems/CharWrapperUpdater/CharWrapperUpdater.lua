--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.CharWrapperUpdater (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("CharWrapperClient")
local v_u_2 = game:GetService("Players")
return {
    ["step"] = function(p3, _)
        local v4 = v_u_1.get(p3.base.char)
        p3.base.char_wrapper = v4
        p3.client_has_control = v4 == nil and true or v4.entity_controller == v_u_2.LocalPlayer
        p3.is_npc_pet = v4 == nil
        p3.is_in_workspace = p3.shared_cache.WorldRoot == workspace
        if p3.debug_override_client_has_control ~= nil then
            p3.client_has_control = p3.debug_override_client_has_control
        end
    end
}