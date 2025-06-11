--// ReplicatedStorage.SharedModules.TokenBucket (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")("TokenBucket")
function v1.__init(p2, p3, p4)
    p2.tokens_per_second = p3
    p2.bucket_size = p4
    p2.last_request_time = 0
end
function v1.request(p5)
    local v6 = tick()
    local v7 = (v6 - p5.last_request_time) * p5.tokens_per_second
    local v8 = (p5.tokens or p5.bucket_size) + v7
    local v9 = p5.bucket_size
    p5.tokens = math.clamp(v8, 0, v9)
    p5.last_request_time = v6
    if p5.tokens < 1 then
        return false
    end
    p5.tokens = p5.tokens - 1
    return true
end
return v1