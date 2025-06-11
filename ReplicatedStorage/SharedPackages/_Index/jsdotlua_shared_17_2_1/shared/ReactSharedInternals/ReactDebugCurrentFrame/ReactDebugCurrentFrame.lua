--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactSharedInternals.ReactDebugCurrentFrame (ModuleScript)

local v_u_1 = {}
local v_u_2 = nil
function v_u_1.setExtraStackFrame(p3)
    if _G.__DEV__ then
        v_u_2 = p3
    end
end
if _G.__DEV__ then
    v_u_1.getCurrentStack = nil
    function v_u_1.getStackAddendum()
        local v4 = ""
        if v_u_2 then
            v4 = v4 .. v_u_2
        end
        local v5 = v_u_1.getCurrentStack
        if v5 then
            v4 = v4 .. (v5() or "")
        end
        return v4
    end
end
return v_u_1