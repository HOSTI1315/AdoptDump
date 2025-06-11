--// ReplicatedStorage.SharedModules.Class (ModuleScript)

local v_u_1 = {
    "__add",
    "__call",
    "__concat",
    "__div",
    "__le",
    "__lt",
    "__mod",
    "__mul",
    "__pow",
    "__sub",
    "__tostring",
    "__unm"
}
local function v_u_3(p2, ...)
    if p2.__init then
        p2:__init(...)
    end
end
function class(p4, p5)
    local v_u_6 = {}
    v_u_6.__index = v_u_6
    v_u_6.ClassName = p4
    function v_u_6.new(...)
        local v7 = v_u_6
        local v8 = setmetatable({}, v7)
        v_u_3(v8, ...)
        return v8
    end
    if p5 then
        v_u_6.Super = p5
        setmetatable(v_u_6, p5)
        for _, v9 in ipairs(v_u_1) do
            v_u_6[v9] = p5[v9]
        end
    end
    return v_u_6, p5
end
return class