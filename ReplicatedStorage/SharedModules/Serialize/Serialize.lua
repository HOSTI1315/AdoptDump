--// ReplicatedStorage.SharedModules.Serialize (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Number")
return {
    ["from_color3"] = function(p2)
        return { v_u_1.round(p2.r * 255), v_u_1.round(p2.g * 255), v_u_1.round(p2.b * 255) }
    end,
    ["to_color3"] = function(p3)
        return Color3.fromRGB(unpack(p3))
    end
}