--// ReplicatedStorage.SharedModules.PositionProvider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Utilities")
local v3 = v1("Class")("PositionProvider")
function v3.__init(p4, p5)
    assert(p5, "Missing target_value")
    p4._target_value = p5
end
function v3.get_position(p6, ...)
    local v7 = v_u_2.get_position_from_arbitrary_value(p6._target_value, ...)
    if not v7 then
        error((("get_position_from_arbitrary_value returned nothing for %*"):format(p6._target_value)))
    end
    return v7
end
function v3.get_target_value(p8)
    return p8._target_value
end
return v3