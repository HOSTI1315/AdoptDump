--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactMotion.MotionSpecifier (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("Config"))
local v_u_2 = require(script.Parent:WaitForChild("MotionType"))
return {
    ["spring"] = function(p3, p4, p5)
        local v6 = p4 or v_u_1.DEFAULT_STIFFNESS
        local v7 = p5 or v_u_1.DEFAULT_DAMPING
        return {
            ["type"] = v_u_2.Spring,
            ["value"] = p3,
            ["stiffness"] = v6,
            ["damping"] = v7
        }
    end,
    ["extractValue"] = function(p8)
        if type(p8) == "table" then
            return p8.value
        else
            return p8
        end
    end,
    ["getType"] = function(p9)
        if type(p9) == "table" then
            return p9.type
        else
            return v_u_2.Instant
        end
    end
}