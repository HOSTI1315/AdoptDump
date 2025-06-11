--// ReplicatedStorage.SharedPackages._Index.upliftgames_ui-absolute-visibility@0.1.0.ui-absolute-visibility.CascadeTree.Queue (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
v_u_1.ClassName = "Queue"
function v_u_1.new(p2)
    local v3 = v_u_1
    local v4 = setmetatable({}, v3)
    v4.index = 1
    v4.list = p2
    v4.length = #v4.list
    return v4
end
function v_u_1.PopFront(p5)
    local v6 = p5.list[p5.index]
    p5.list[p5.index] = nil
    p5.index = p5.index + 1
    p5.length = p5.length - 1
    return v6
end
function v_u_1.PushBack(p7, p8)
    p7.list[p7.index + p7.length] = p8
    p7.length = p7.length + 1
end
function v_u_1.GetLength(p9)
    return p9.length
end
return v_u_1