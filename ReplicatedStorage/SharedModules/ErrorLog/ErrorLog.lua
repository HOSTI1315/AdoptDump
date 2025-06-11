--// ReplicatedStorage.SharedModules.ErrorLog (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Stash")
local v_u_3 = v1("package:Promise")
local v_u_4 = {}
local v_u_5 = {
    504,
    502,
    500,
    400,
    "unknown"
}
local function v_u_9(p6)
    for _, v7 in pairs(v_u_5) do
        local v8 = "HTTP " .. v7
        if p6:find(v8) then
            return v8
        end
    end
    return nil
end
function v_u_4.log(p10)
    local v11 = p10.origin
    assert(v11, "Missing origin.")
    local v12 = p10.origin
    local v13 = table.clone(p10)
    if v13.error then
        if v_u_3.Error.is(v13.error) then
            v13.error_message = v13.error.error
            v13.stack_trace = v13.error.trace
        else
            local v14 = v13.error
            v13.error_message = tostring(v14)
        end
    end
    v13.origin = nil
    v13.error = nil
    v_u_2:into("errorlog"):log(v12, v13)
end
function v_u_4.log_api_failure(p15)
    local v16 = p15.api
    assert(v16, "Missing API.")
    local v17 = table.clone(p15)
    v_u_2:into("performancelog"):log("API failure", v17)
end
function v_u_4.check_for_http_error_and_log(p18)
    local v19 = p18.error_message
    assert(v19, "Missing error.")
    local v20 = p18.api
    assert(v20, "Missing API.")
    local v21 = v_u_9(p18.error_message)
    if not v21 then
        return false
    end
    warn(p18.error_message)
    local v22 = table.clone(p18)
    v22.http_error = v21
    v_u_4.log_api_failure(v22)
    return true
end
return v_u_4