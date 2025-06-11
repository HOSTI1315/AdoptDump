--// ReplicatedStorage.SharedModules.LeakyBucket (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("Class")("LeakyBucket")
function v1.__init(p2, p3, p4)
    p2.requests_per_second = p3 or 0
    p2.max_tokens = p4 or 1
    p2.tokens = p2.max_tokens
    p2.reserved_tokens = 0
    p2.timestamp = 0
end
function v1._refresh_tokens(p5)
    local v6 = tick()
    local v7 = (v6 - p5.timestamp) * p5.requests_per_second
    local v8 = p5.tokens + v7
    local v9 = p5.max_tokens - p5.reserved_tokens
    p5.tokens = math.min(v8, v9)
    p5.timestamp = v6
end
function v1.is_full(p10)
    p10:_refresh_tokens()
    return p10.tokens < 1
end
function v1.fill(p11)
    if p11:is_full() then
        return false
    end
    p11.tokens = p11.tokens - 1
    return true
end
function v1.reserve_fill(p_u_12)
    if not p_u_12:fill() then
        return nil
    end
    p_u_12.reserved_tokens = p_u_12.reserved_tokens + 1
    return function()
        p_u_12.reserved_tokens = p_u_12.reserved_tokens - 1
        p_u_12.timestamp = tick()
    end
end
return v1