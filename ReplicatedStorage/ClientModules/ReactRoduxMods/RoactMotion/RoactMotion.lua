--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactMotion (ModuleScript)

local v1 = require(script:WaitForChild("MotionSpecifier"))
local v2 = require(script:WaitForChild("SimpleMotion"))
return {
    ["spring"] = v1.spring,
    ["Motion"] = v2
}