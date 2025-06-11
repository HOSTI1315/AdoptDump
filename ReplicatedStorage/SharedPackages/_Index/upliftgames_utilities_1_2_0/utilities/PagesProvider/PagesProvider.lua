--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.PagesProvider (ModuleScript)

local v1 = require(script.Parent.Class)
local v_u_2 = require(script.Parent.Queue)
local v3 = v1("PagesProvider")
function v3.__init(p4, p5)
    p4.pages = p5
    p4.currentValues = v_u_2.new()
    p4.pageFinished = false
end
function v3._moreValuesNeeded(p6)
    return p6.currentValues:size() == 0
end
function v3._getMoreValues(p7)
    if p7.pageFinished then
        p7.pages:AdvanceToNextPageAsync()
    end
    local v8 = p7.pages:GetCurrentPage()
    for _, v9 in pairs(v8) do
        p7.currentValues:push({
            ["key"] = v9.key,
            ["value"] = v9.value
        })
    end
    p7.pageFinished = true
end
function v3.provideAsync(p10)
    if p10:_moreValuesNeeded() then
        local v11 = not p10:exhausted()
        assert(v11, "Provider is exhausted!")
        p10:_getMoreValues()
    end
    return p10.currentValues:pop()
end
function v3.exhausted(p12)
    if p12:_moreValuesNeeded() then
        if p12.pageFinished then
            return p12.pages.IsFinished
        else
            return #p12.pages:GetCurrentPage() == 0
        end
    else
        return false
    end
end
return v3