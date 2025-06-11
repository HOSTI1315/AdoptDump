--// ReplicatedStorage.SharedModules.TweenHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("package:t")
local v_u_3 = v1("package:Sift")
local v4 = {}
local v_u_5 = v2.strictInterface({
    ["time"] = v2.optional(v2.number),
    ["easing_style"] = v2.optional(v2.enum(Enum.EasingStyle)),
    ["easing_direction"] = v2.optional(v2.enum(Enum.EasingDirection)),
    ["repeat_count"] = v2.optional(v2.every(v2.integer, v2.numberMin(-1))),
    ["reverses"] = v2.optional(v2.boolean),
    ["delay_time"] = v2.optional(v2.numberMin(0))
})
local v_u_6 = {
    ["time"] = 1,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out,
    ["repeat_count"] = 0,
    ["reverses"] = false,
    ["delay_time"] = 0
}
function v4.tween_info(p7)
    local v8 = v_u_3.Dictionary.merge(v_u_6, p7)
    local v9 = v_u_5
    assert(v9(v8))
    local v10 = v8.time
    local v11 = math.max(0, v10)
    return TweenInfo.new(v11, v8.easing_style, v8.easing_direction, v8.repeat_count, v8.reverses, v8.delay_time)
end
return v4