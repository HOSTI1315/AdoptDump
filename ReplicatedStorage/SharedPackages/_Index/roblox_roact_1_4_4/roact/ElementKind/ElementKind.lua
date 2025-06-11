--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.ElementKind (ModuleScript)

local v1 = require(script.Parent.Symbol)
local v2 = require(script.Parent.strict)
local v_u_3 = require(script.Parent.Portal)
local v_u_4 = newproxy(true)
local v6 = {
    ["Portal"] = v1.named("Portal"),
    ["Host"] = v1.named("Host"),
    ["Function"] = v1.named("Function"),
    ["Stateful"] = v1.named("Stateful"),
    ["Fragment"] = v1.named("Fragment"),
    ["of"] = function(p5)
        if typeof(p5) == "table" then
            return p5[v_u_4]
        else
            return nil
        end
    end
}
local v_u_7 = {
    ["string"] = v6.Host,
    ["function"] = v6.Function,
    ["table"] = v6.Stateful
}
function v6.fromComponent(p8)
    if p8 == v_u_3 then
        return v_u_4.Portal
    else
        return v_u_7[typeof(p8)]
    end
end
getmetatable(v_u_4).__index = v6
v2(v6, "ElementKind")
return v_u_4