--// ReplicatedStorage.CmdrClient.Types.Vector (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Shared.Util)
local function v4(p2, p3)
    if p2 == nil then
        return false, ("Invalid or missing number at position %d in Vector type."):format(p3)
    else
        return true
    end
end
local v_u_5 = v_u_1.MakeSequenceType({
    ["ValidateEach"] = v4,
    ["TransformEach"] = tonumber,
    ["Constructor"] = Vector3.new,
    ["Length"] = 3
})
local v_u_6 = v_u_1.MakeSequenceType({
    ["ValidateEach"] = v4,
    ["TransformEach"] = tonumber,
    ["Constructor"] = Vector2.new,
    ["Length"] = 2
})
return function(p7)
    p7:RegisterType("vector3", v_u_5)
    p7:RegisterType("vector3s", v_u_1.MakeListableType(v_u_5))
    p7:RegisterType("vector2", v_u_6)
    p7:RegisterType("vector2s", v_u_1.MakeListableType(v_u_6))
end