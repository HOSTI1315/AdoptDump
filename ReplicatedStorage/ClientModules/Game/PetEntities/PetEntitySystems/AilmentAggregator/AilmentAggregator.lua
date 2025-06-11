--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.AilmentAggregator (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("new:AilmentsClient")
return {
    ["optimization_run_only_for"] = "owned",
    ["step"] = function(p2, _)
        local v3 = p2.ailments
        local v4 = {}
        if p2.base.char_wrapper and not v_u_1.are_ailments_hidden() then
            for _, v5 in v_u_1.get_ailments_for_pet_serialized(p2.base.char_wrapper) do
                local v6 = v5.kind
                if not v3[v6] then
                    v3[v6] = os.clock()
                end
                v4[v6] = true
            end
        end
        for v7, _ in v3 do
            if not v4[v7] then
                v3[v7] = nil
            end
        end
    end
}