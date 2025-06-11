--// ReplicatedStorage.SharedPackages._Index.stravant_goodsignal@0.2.1.goodsignal (ModuleScript)

local v_u_1 = nil
local function v_u_4(p2, ...)
    local v3 = v_u_1
    v_u_1 = nil
    p2(...)
    v_u_1 = v3
end
local function v_u_5()
    while true do
        v_u_4(coroutine.yield())
    end
end
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new(p7, p8)
    local v9 = v_u_6
    return setmetatable({
        ["_connected"] = true,
        ["_signal"] = p7,
        ["_fn"] = p8,
        ["_next"] = false
    }, v9)
end
function v_u_6.Disconnect(p10)
    p10._connected = false
    if p10._signal._handlerListHead == p10 then
        p10._signal._handlerListHead = p10._next
    else
        local v11 = p10._signal._handlerListHead
        while v11 and v11._next ~= p10 do
            v11 = v11._next
        end
        if v11 then
            v11._next = p10._next
        end
    end
end
setmetatable(v_u_6, {
    ["__index"] = function(_, p12)
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(p12))), 2)
    end,
    ["__newindex"] = function(_, p13, _)
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(p13))), 2)
    end
})
local v_u_14 = {}
v_u_14.__index = v_u_14
function v_u_14.new()
    local v15 = v_u_14
    return setmetatable({
        ["_handlerListHead"] = false
    }, v15)
end
function v_u_14.Connect(p16, p17)
    local v18 = v_u_6.new(p16, p17)
    if not p16._handlerListHead then
        p16._handlerListHead = v18
        return v18
    end
    v18._next = p16._handlerListHead
    p16._handlerListHead = v18
    return v18
end
function v_u_14.DisconnectAll(p19)
    p19._handlerListHead = false
end
function v_u_14.Fire(p20, ...)
    local v21 = p20._handlerListHead
    while v21 do
        if v21._connected then
            if not v_u_1 then
                v_u_1 = coroutine.create(v_u_5)
                coroutine.resume(v_u_1)
            end
            task.spawn(v_u_1, v21._fn, ...)
        end
        v21 = v21._next
    end
end
function v_u_14.Wait(p22)
    local v_u_23 = coroutine.running()
    local v_u_24 = nil
    v_u_24 = p22:Connect(function(...)
        v_u_24:Disconnect()
        task.spawn(v_u_23, ...)
    end)
    return coroutine.yield()
end
function v_u_14.Once(p25, p_u_26)
    local v_u_27 = nil
    v_u_27 = p25:Connect(function(...)
        if v_u_27._connected then
            v_u_27:Disconnect()
        end
        p_u_26(...)
    end)
    return v_u_27
end
setmetatable(v_u_14, {
    ["__index"] = function(_, p28)
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(p28))), 2)
    end,
    ["__newindex"] = function(_, p29, _)
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(p29))), 2)
    end
})
return v_u_14