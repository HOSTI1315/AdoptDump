--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.forwardRef (ModuleScript)

local v_u_1 = require(script.Parent.assign)
local v2 = require(script.Parent.None)
local v_u_3 = require(script.Parent.PropMarkers.Ref)
local v_u_4 = require(script.Parent.GlobalConfig).get()
local v_u_5 = {
    [v_u_3] = v2
}
return function(p_u_6)
    if v_u_4.typeChecks then
        local v7 = typeof(p_u_6) == "function"
        assert(v7, "Expected arg #1 to be a function")
    end
    return function(p8)
        local v9 = p8[v_u_3]
        return p_u_6(v_u_1({}, p8, v_u_5), v9)
    end
end