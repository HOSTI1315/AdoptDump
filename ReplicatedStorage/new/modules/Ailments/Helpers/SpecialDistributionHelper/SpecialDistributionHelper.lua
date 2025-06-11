--// ReplicatedStorage.new.modules.Ailments.Helpers.SpecialDistributionHelper (ModuleScript)

require(script.Parent.Parent.AilmentEntry)
local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Sift)
return {
    ["wrap"] = function(p_u_2, p_u_3)
        return v_u_1.Dictionary.join(p_u_2, {
            ["can_distribute"] = p_u_3,
            ["create_server_components"] = function(p4, p5, p6)
                local v7 = game.ServerScriptService.new.modules.Ailments.ServerComponents
                local v8 = require(v7.Validation)
                local v9 = p_u_2.create_server_components(p4, p5, p6)
                local v10 = {
                    ["ailment_key"] = p6,
                    ["is_valid"] = p_u_3
                }
                v9.validation = v8.new(v10)
                return v9
            end
        })
    end
}