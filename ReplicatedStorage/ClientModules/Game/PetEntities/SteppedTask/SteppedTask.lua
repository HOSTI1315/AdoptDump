--// ReplicatedStorage.ClientModules.Game.PetEntities.SteppedTask (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("package:Promise")
local function v_u_9(p4)
    local v5 = tostring(p4)
    local v6 = string.gsub(v5, "^[\r\n]+", "")
    local v7 = string.gsub(v6, "[\r\n]+$", "")
    local v8 = string.gsub(v7, "\n", "\n  ")
    return string.format("{\n  %s\n}", v8)
end
local v_u_10 = v2("SteppedTaskInternal")
function v_u_10.__init(p11, p12)
    p11._stepped_task = p12
end
function v_u_10.out(p13, ...)
    p13._stepped_task:_set_out_values(...)
end
function v_u_10.wait_for_step(p14)
    if coroutine.running() ~= p14._stepped_task._coroutine then
        error("Attempted to :wait_for_step() outside of the SteppedTask\'s coroutine.")
    end
    coroutine.yield(p14._stepped_task._unique_symbol)
end
function v_u_10.wait(p15, p16)
    local v17 = os.clock() + p16
    while os.clock() < v17 do
        p15:wait_for_step()
    end
end
function v_u_10.wait_until(p18, p19)
    while os.clock() < p19 do
        p18:wait_for_step()
    end
end
function v_u_10.repeat_for(p20, p21, p22)
    local v23 = os.clock() + p21
    while true do
        p22()
        if v23 <= os.clock() then
            break
        end
        p20:wait_for_step()
    end
end
function v_u_10.run_async(p24, p25, ...)
    local v26 = v_u_3.try(p25, ...)
    while v26:getStatus() == v_u_3.Status.Started do
        p24:wait_for_step()
    end
    return v26:expect()
end
local v27 = v2("SteppedTask")
function v27.__init(p_u_28, p_u_29)
    p_u_28._created_at = debug.traceback(nil, 4)
    p_u_28._callback = p_u_29
    p_u_28._coroutine = coroutine.create(function(...)
        p_u_28:_set_out_values(p_u_29(...))
    end)
    p_u_28._unique_symbol = { "SteppedTaskUniqueSymbol" }
    p_u_28._internal_api = v_u_10.new(p_u_28)
    p_u_28._out = {
        ["n"] = 0
    }
end
function v27._set_out_values(p30, ...)
    p30._out = table.pack(...)
end
function v27._get_out_values(p31)
    local v32 = p31._out
    local v33 = p31._out.n
    return unpack(v32, 1, v33)
end
function v27.step(p34)
    local v35 = coroutine.status(p34._coroutine)
    if v35 == "running" then
        error(string.format("Cannot :step() because the previous step is still running. SteppedTask created at: %s", v_u_9(p34._created_at)))
    elseif v35 == "normal" then
        error(string.format("Cannot :step() because the previous step is waiting on another coroutine. SteppedTask created at: %s", v_u_9(p34._created_at)))
    end
    if v35 == "suspended" then
        local v36, v37 = coroutine.resume(p34._coroutine, p34._internal_api)
        if not v36 then
            error(string.format("SteppedTask failed. Error: %s\nTraceback: %s\nSteppedTask created at: %s", v_u_9(v37), v_u_9(debug.traceback(p34._coroutine)), v_u_9(p34._created_at)))
        end
        if coroutine.status(p34._coroutine) == "suspended" and v37 ~= p34._unique_symbol then
            error(string.format("SteppedTask yielded internally by calling an async method. This will cause strange and unpredictable behavior. SteppedTask functions should never call async methods and should only yield by :wait_for_step().\nTry using run_async instead if you need to run code under the normal task scheduler.\nSteppedTask yielded at: %s\nSteppedTask created at: %s", v_u_9(debug.traceback(p34._coroutine)), v_u_9(p34._created_at)))
        end
    end
    return p34:_get_out_values()
end
return v27