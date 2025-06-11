--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.from (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("Set"))
local v_u_2 = require(script.Parent.Parent:WaitForChild("Map"):WaitForChild("Map"))
local v_u_3 = require(script.Parent:WaitForChild("isArray"))
local v_u_4 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local v_u_5 = require(script:WaitForChild("fromString"))
local v_u_6 = require(script:WaitForChild("fromSet"))
local v_u_7 = require(script:WaitForChild("fromMap"))
local v_u_8 = require(script:WaitForChild("fromArray"))
return function(p9, p10, p11)
    if p9 == nil then
        error("cannot create array from a nil value")
    end
    local v12 = typeof(p9)
    if v12 == "table" and v_u_3(p9) then
        return v_u_8(p9, p10, p11)
    elseif v_u_4(p9, v_u_1) then
        return v_u_6(p9, p10, p11)
    elseif v_u_4(p9, v_u_2) then
        return v_u_7(p9, p10, p11)
    else
        return v12 ~= "string" and {} or v_u_5(p9, p10, p11)
    end
end