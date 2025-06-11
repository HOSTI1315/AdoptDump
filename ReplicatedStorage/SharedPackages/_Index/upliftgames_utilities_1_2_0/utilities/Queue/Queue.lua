--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.Queue (ModuleScript)

local v1 = require(script.Parent.Class)("Queue")
function v1.__init(p2)
    p2.values = {}
    p2.pointer = {
        ["first"] = 0,
        ["last"] = -1
    }
    p2.value_counts = {}
end
function v1.push(p3, p4)
    local v5 = p3.pointer.last + 1
    p3.pointer.last = v5
    p3.values[v5] = p4
    p3.value_counts[p4] = (p3.value_counts[p4] or 0) + 1
end
function v1.pop(p6)
    local v7 = p6.pointer.first
    if p6.pointer.last < v7 then
        return nil
    end
    local v8 = p6.values[v7]
    p6.values[v7] = nil
    p6.pointer.first = v7 + 1
    p6.value_counts[v8] = p6.value_counts[v8] - 1
    if p6.value_counts[v8] == 0 then
        p6.value_counts[v8] = nil
    end
    return v8
end
function v1.peek(p9)
    local v10 = p9.pointer.first
    if p9.pointer.last < v10 then
        return nil
    else
        return p9.values[v10]
    end
end
function v1.size(p11)
    return p11.pointer.last - p11.pointer.first + 1
end
function v1.contains(p12, p13)
    return p12.value_counts[p13] ~= nil
end
return v1