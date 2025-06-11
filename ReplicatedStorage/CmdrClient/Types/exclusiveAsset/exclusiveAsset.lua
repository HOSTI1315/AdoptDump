--// ReplicatedStorage.CmdrClient.Types.exclusiveAsset (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("AvatarItemSupplementalDB")
local v_u_3 = v1("package:Sift")
return function(p4)
    local v6 = p4.Cmdr.Util.MakeEnumType("Exclusive Asset", v_u_3.List.map(v_u_3.Dictionary.values(v_u_2.catalog_blacklist), function(p5)
        return p5.name
    end))
    p4:RegisterType("exclusiveAsset", v6)
    p4:RegisterType("exclusiveAssets", p4.Cmdr.Util.MakeListableType(v6))
end