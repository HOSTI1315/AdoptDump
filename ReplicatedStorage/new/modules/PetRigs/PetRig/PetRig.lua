--// ReplicatedStorage.new.modules.PetRigs.PetRig (ModuleScript)

local v1 = {}
v1.__index = v1
function v1.should_transform(_)
    return false
end
function v1.validate(_)
    return false, "Not implemented"
end
function v1.transform(_) end
function v1.get_part(_, _, _)
    return nil
end
function v1.get_geo_part(_, _)
    return nil
end
return v1