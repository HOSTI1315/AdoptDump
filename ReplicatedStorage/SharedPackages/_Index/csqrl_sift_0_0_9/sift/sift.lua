--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift (ModuleScript)

require(script.Types)
local v1 = {
    ["Array"] = require(script.Array),
    ["Dictionary"] = require(script.Dictionary),
    ["Set"] = require(script.Set),
    ["None"] = require(script.None),
    ["Types"] = require(script.Types),
    ["equalObjects"] = require(script.Util.equalObjects),
    ["isEmpty"] = require(script.Util.isEmpty)
}
v1.List = v1.Array
return v1