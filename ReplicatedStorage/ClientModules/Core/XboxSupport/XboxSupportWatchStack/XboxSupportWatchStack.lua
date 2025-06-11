--// ReplicatedStorage.ClientModules.Core.XboxSupport.XboxSupportWatchStack (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("package:Sift")
local v_u_2 = {}
local v_u_11 = {
    ["get"] = function()
        return v_u_2
    end,
    ["clear"] = function(p_u_3)
        v_u_2 = v_u_1.List.filter(v_u_2, function(p4)
            return p4 == p_u_3
        end)
    end,
    ["remove"] = function(p5)
        v_u_2 = v_u_1.List.removeValue(v_u_2, p5)
    end,
    ["peek"] = function()
        return v_u_1.List.last(v_u_2)
    end,
    ["push"] = function(p6)
        local v7 = v_u_11.peek()
        if v7 then
            v7:deactivate_from_stack()
        end
        v_u_11.remove(p6)
        v_u_2 = v_u_1.List.push(v_u_2, p6)
        local v8 = v_u_11.peek()
        if v8 then
            v8:activate_from_stack()
        end
    end,
    ["pop"] = function()
        local v9 = v_u_11.peek()
        if v9 then
            v9:deactivate_from_stack()
        end
        v_u_2 = v_u_1.List.pop(v_u_2)
        local v10 = v_u_11.peek()
        if v10 then
            v10:activate_from_stack()
        end
    end
}
return v_u_11