--// ReplicatedStorage.ClientModules.Game.PetEntities.PetMovementTarget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Utilities")
local v3 = v1("PositionProvider")
local v_u_4 = v1("Class")("PetMovementTarget", v3)
function v_u_4.__init(p5, p6)
    assert(p6)
    local v7 = p6.target
    assert(v7)
    p5._target_value = p6.target
    p5._has_reached_func = p6.has_reached_func
    p5._target_reach_threshold = p6.target_reach_threshold
    local v8 = not p6.target_reached_threshold
    assert(v8, "target_reach_threshold misspelled as target_reached_threshold")
end
function v_u_4.from_target_and_follow_distance(p_u_9, p_u_10, p11)
    local v12 = p11 or {}
    if p_u_10 <= 0 then
        v12.target = p_u_9
        return v_u_4.new(v12)
    end
    local v_u_13 = debug.traceback(nil, 2)
    function v12.target(p14)
        local v15 = v_u_2.get_position_from_arbitrary_value(p_u_9, p14)
        local v16 = p14.base.root.Position
        if v15 then
            return v15 + ((v16 - v15) * Vector3.new(1, 0, 1)).Unit * p_u_10
        end
        warn((("[PetMovementTarget] Target %* not found for pet %*; keeping pet in current position. Target created at:\n%*"):format(p_u_9, p14.base.char, v_u_13)))
        return v16
    end
    return v_u_4.new(v12)
end
function v_u_4.from_callback(p17)
    return v_u_4.new({
        ["target"] = p17
    })
end
function v_u_4._get_delta(p18, p19)
    local v20 = p19.base.root.Position
    return p18:get_position(p19) - v20
end
function v_u_4.get_distance(p21, p22)
    local v23 = p21:_get_delta(p22)
    local v24 = v23.X
    local v25 = v23.Z
    return Vector3.new(v24, 0, v25).magnitude
end
function v_u_4.has_been_reached(p26, p27)
    if p26._has_reached_func then
        return p26._has_reached_func(p27)
    end
    local v28 = p26._target_reach_threshold
    assert(v28, "target_reach_threshold or has_reached_func needs to be specified in PetMovementTarget.new to use :has_been_reached")
    if not p26:get_position(p27) then
        return false
    end
    local v29 = p26:_get_delta(p27)
    local v30 = v29.Y
    if math.abs(v30) > 10 then
        return false
    end
    local v31 = v29.X
    local v32 = v29.Z
    return Vector3.new(v31, 0, v32).Magnitude < p26._target_reach_threshold
end
return v_u_4