--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureUniqueFinder (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("FurnitureModelTracker")
local v_u_3 = v1("FurnitureUseDB")
local v_u_4 = v1("ClientStore")
return {
    ["filter"] = function(p5)
        local v6 = v_u_4.store:getState().house_interior
        local v7 = {}
        for v8, v9 in v6 and v6.furniture or {} do
            if v_u_2.get_furniture_by_unique(v8) then
                local v10 = v_u_3[v9.id]
                if v10 and p5(v8, v9, v10) then
                    table.insert(v7, v8)
                end
            end
        end
        return v7
    end
}