--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.FixedCapacityQueue (ModuleScript)

local v1, v_u_2 = require(script.Parent.Class)("FixedCapacityQueue", (require(script.Parent.Queue)))
function v1.__init(p3, p4, ...)
    p3.maximum_capacity = p4
    v_u_2.__init(p3, ...)
end
function v1.push(p5, ...)
    if p5:size() >= p5.maximum_capacity then
        p5:pop()
    end
    v_u_2.push(p5, ...)
end
return v1