--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.PagesValueWrapper (ModuleScript)

local v1 = require(script.Parent.Class)("PagesValueWrapper")
function v1._updateProperties(p2)
    p2.IsFinished = p2.pages.IsFinished
end
function v1.__init(p3, p4, p5)
    p3.pages = p4
    p3.transformFunction = p5
    p3:_updateProperties()
end
function v1.AdvanceToNextPageAsync(p6)
    p6.pages:AdvanceToNextPageAsync()
    p6:_updateProperties()
end
function v1.GetCurrentPage(p7)
    local v8 = {}
    for v9, v10 in pairs(p7.pages:GetCurrentPage()) do
        local v11, v12 = p7.transformFunction(v9, v10)
        v8[v11] = v12
    end
    return v8
end
return v1