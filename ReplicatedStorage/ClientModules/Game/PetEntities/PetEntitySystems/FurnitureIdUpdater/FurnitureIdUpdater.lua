--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.FurnitureIdUpdater (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("StateManagerClient")
return {
    ["step"] = function(p2, _)
        local v3 = v_u_1.get(p2.base.char)
        local v4 = nil
        local v5 = nil
        if v3 then
            for _, v6 in pairs(v3.states) do
                if v6.furniture_id then
                    v4 = v6.furniture_id
                end
                if v6.furniture_use_id then
                    v5 = v6.furniture_use_id
                end
                if v4 and v5 then
                    break
                end
            end
        end
        p2.current_furniture_id = v4
        p2.current_furniture_use_id = v5
    end
}