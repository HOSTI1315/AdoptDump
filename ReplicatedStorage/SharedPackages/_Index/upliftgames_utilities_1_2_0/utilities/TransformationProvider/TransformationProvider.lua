--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.TransformationProvider (ModuleScript)

local v1 = require(script.Parent.Class)("TransformationProvider")
function v1.__init(p2, p3, p4)
    p2.originalProvider = p3
    p2.transformationCallback = p4
end
function v1.exhausted(p5)
    return p5.originalProvider:exhausted()
end
function v1.provideAsync(p6)
    local v7 = p6.originalProvider:provideAsync()
    return p6.transformationCallback(v7)
end
return v1