--// ReplicatedStorage.new.modules.Utilities.WeightedRandom (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_21 = {
    ["get_value"] = function(p2, p3)
        return v_u_21.get_values(p2, 1, p3)[1]
    end,
    ["get_values"] = function(p4, p5, p6)
        local v7 = Random.new(p6)
        local v10 = v_u_1.List.reduce(v_u_1.Dictionary.values(p4), function(p8, p9)
            return p8 + p9
        end)
        local v11 = {}
        for v12, v13 in p4 do
            local v14 = {
                ["value"] = v12,
                ["weight"] = v13 / v10
            }
            table.insert(v11, v14)
        end
        table.sort(v11, function(p15, p16)
            return p15.weight > p16.weight
        end)
        local v17 = {}
        for v18 = 1, p5 do
            local v19 = v7:NextNumber()
            for _, v20 in v11 do
                if v19 < v20.weight then
                    v17[v18] = v20.value
                    break
                end
                v19 = v19 - v20.weight
            end
        end
        return v17
    end
}
return v_u_21