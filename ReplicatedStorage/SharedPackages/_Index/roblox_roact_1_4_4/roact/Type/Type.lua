--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Type (ModuleScript)

local v1 = require(script.Parent.Symbol)
local v2 = require(script.Parent.strict)
local v_u_3 = newproxy(true)
local v5 = {
    ["Binding"] = v1.named("RoactBinding"),
    ["Element"] = v1.named("RoactElement"),
    ["HostChangeEvent"] = v1.named("RoactHostChangeEvent"),
    ["HostEvent"] = v1.named("RoactHostEvent"),
    ["StatefulComponentClass"] = v1.named("RoactStatefulComponentClass"),
    ["StatefulComponentInstance"] = v1.named("RoactStatefulComponentInstance"),
    ["VirtualNode"] = v1.named("RoactVirtualNode"),
    ["VirtualTree"] = v1.named("RoactVirtualTree"),
    ["of"] = function(p4)
        if typeof(p4) == "table" then
            return p4[v_u_3]
        else
            return nil
        end
    end
}
getmetatable(v_u_3).__index = v5
getmetatable(v_u_3).__tostring = function()
    return "RoactType"
end
v2(v5, "Type")
return v_u_3