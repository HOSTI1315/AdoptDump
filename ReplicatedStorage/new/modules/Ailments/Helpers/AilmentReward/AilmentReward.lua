--// ReplicatedStorage.new.modules.Ailments.Helpers.AilmentReward (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
    local v3 = v_u_1
    return setmetatable(p2, v3)
end
function v_u_1.get(_, _, _)
    return 0
end
function v_u_1.apply_multiplier(_, p4, _)
    return p4
end
function v_u_1.apply_budget(_, p5, _)
    return p5
end
function v_u_1.commit(_, _, _) end
function v_u_1.render_ailment_tag(_, _, _)
    return false
end
return v_u_1