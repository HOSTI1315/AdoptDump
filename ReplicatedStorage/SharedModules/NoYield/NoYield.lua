--// ReplicatedStorage.SharedModules.NoYield (ModuleScript)

local function v_u_3(p1, p2, ...)
    if not p2 then
        error(debug.traceback(p1, (...)), 2)
    end
    if coroutine.status(p1) ~= "dead" then
        error(debug.traceback(p1, "Attempted to yield inside a NoYield block!"), 2)
    end
    return ...
end
return function(p4, ...)
    local v5 = coroutine.create(p4)
    return v_u_3(v5, coroutine.resume(v5, ...))
end