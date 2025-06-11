--// ReplicatedStorage.SharedModules.Curves.CompositeCatmullRomSpline (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")("CompositeCatmullRomSpline")
function v1.__init(p2, p3, p4)
    p2.curves = p3
    p2.num_curves = #p3
    p2.average_position = p4
end
function v1._get_with_callback(p5, p6, p7)
    local v8 = math.clamp(p6, 0, 1)
    if v8 == 1 then
        return p7(p5.curves[p5.num_curves], 1)
    end
    local v9 = v8 * p5.num_curves
    local v10 = math.floor(v9)
    local v11 = v9 - v10
    return p7(p5.curves[v10 + 1], v11)
end
function v1.get_value(p_u_12, p13)
    return p_u_12:_get_with_callback(p13, function(p14, p15)
        return p14:get_value(p15) + p_u_12.average_position
    end)
end
function v1.get_cframe(p_u_16, p17)
    return p_u_16:_get_with_callback(p17, function(p18, p19)
        return p18:get_cframe(p19) + p_u_16.average_position
    end)
end
return v1