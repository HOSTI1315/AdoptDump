--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberWorkInProgress (ModuleScript)

local v1 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v_u_2 = v1.NoLanes
local v_u_3 = v1.mergeLanes
return {
    ["workInProgressRootSkippedLanes"] = function(p4)
        if p4 == nil then
            return v_u_2
        end
        v_u_2 = p4
        return v_u_2
    end,
    ["markSkippedUpdateLanes"] = function(p5)
        v_u_2 = v_u_3(p5, v_u_2)
    end
}