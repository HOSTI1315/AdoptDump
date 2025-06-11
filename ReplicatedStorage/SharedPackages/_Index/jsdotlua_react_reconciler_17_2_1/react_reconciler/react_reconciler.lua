--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler (ModuleScript)

require(script:WaitForChild("ReactInternalTypes"))
require(script:WaitForChild("ReactRootTags"))
return function(p1)
    local v2 = require(script:WaitForChild("ReactFiberHostConfig"))
    for v3, v4 in p1 do
        v2[v3] = v4
    end
    return require(script:WaitForChild("ReactFiberReconciler"))
end