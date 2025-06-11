--// ReplicatedStorage.SharedModules.ShakePromise (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("TweenPromise")
local v_u_3 = v1("TweenHelper")
local v_u_4 = v1("package:t")
local v_u_5 = Random.new()
local v_u_6 = v_u_4.strictInterface({
    ["amplitude"] = v_u_4.number,
    ["frequency"] = v_u_4.number,
    ["time"] = v_u_4.number,
    ["decay_percent"] = v_u_4.number
})
return {
    ["callback"] = function(p_u_7, p_u_8)
        local v9 = v_u_6
        assert(v9(p_u_7))
        local v10 = v_u_4.callback
        assert(v10(p_u_8))
        local v_u_11 = v_u_5:NextNumber() * 10000
        local v_u_12 = v_u_5:NextNumber() * 10000
        local v_u_13 = v_u_5:NextNumber() * 10000
        local v_u_14 = 1 - p_u_7.decay_percent
        return v_u_2.callback(0, p_u_7.time, v_u_3.tween_info({
            ["easing_style"] = Enum.EasingStyle.Linear,
            ["time"] = p_u_7.time
        }), function(p15)
            local v16 = p15 / p_u_7.time
            local v17 = v_u_14 >= v16 and 1 or 1 - (v16 - v_u_14) / p_u_7.decay_percent
            local v18 = p_u_7.frequency
            local v19 = v_u_11
            local v20 = math.noise(p15 * v18, v19) * 2
            local v21 = math.clamp(v20, -1, 1)
            local v22 = p_u_7.frequency
            local v23 = v_u_12
            local v24 = math.noise(p15 * v22, v23) * 2
            local v25 = math.clamp(v24, -1, 1)
            local v26 = p_u_7.frequency
            local v27 = v_u_13
            local v28 = math.noise(p15 * v26, v27) * 2
            local v29 = math.clamp(v28, -1, 1)
            p_u_8(Vector3.new(v21, v25, v29) * v17 * p_u_7.amplitude)
        end)
    end
}