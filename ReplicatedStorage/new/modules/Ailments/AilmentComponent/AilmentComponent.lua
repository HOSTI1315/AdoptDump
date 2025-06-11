--// ReplicatedStorage.new.modules.Ailments.AilmentComponent (ModuleScript)

require(script.Parent.AilmentTypes)
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new()
    local v2 = v_u_1
    return setmetatable({}, v2)
end
function v_u_1.start(_, _) end
function v_u_1.stop(_) end
function v_u_1.transform_reward(_, p3, p4)
    return p3, p4
end
function v_u_1.serialize_for_client_replication(_)
    return nil
end
function v_u_1.serialize_for_save(_)
    return nil
end
return v_u_1