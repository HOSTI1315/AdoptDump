--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.MiscSharedStats (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v2 = require(script.Parent.Parent.Parent.t)
local v_u_3 = require(script.Parent.AverageStat)
local v_u_4 = game:GetService("Stats")
local v_u_5 = {
    "InstanceCount",
    "PrimitivesCount",
    "MovingPrimitivesCount",
    "ContactsCount",
    "HeartbeatTimeMs",
    "PhysicsStepTimeMs",
    "DataReceiveKbps",
    "DataSendKbps",
    "PhysicsReceiveKbps",
    "PhysicsSendKbps"
}
local v_u_6 = { "LuaFrameTimeMs" }
local v_u_7 = {
    ["HeartbeatTimeMs"] = true,
    ["PhysicsStepTimeMs"] = true
}
local v8 = v1("MiscSharedStats")
function v8.__init(p9)
    p9.stats = {}
    for _, v10 in ipairs(v_u_5) do
        p9.stats[v10] = v_u_3.new()
    end
    for _, v11 in ipairs(v_u_6) do
        p9.stats[v11] = v_u_3.new()
    end
    p9.isFocused = true
end
function v8.setFocused(p12, p13)
    p12.isFocused = p13
end
function v8.addLocalStatsFromStatsService(p14)
    for _, v15 in ipairs(v_u_5) do
        if p14.isFocused or not v_u_7[v15] then
            p14.stats[v15]:add(v_u_4[v15])
        end
    end
end
function v8.addFrameTime(p16, p17)
    if p17 > 10000 or p17 < 0 then
        return
    elseif p16.isFocused then
        p16.stats.LuaFrameTimeMs:add(p17)
    end
end
function v8.serialize(p18)
    local v19 = {}
    for v20, v21 in pairs(p18.stats) do
        v19[v20] = v21:serialize()
    end
    return v19
end
local v22 = {}
for _, v23 in ipairs({ v_u_5, v_u_6 }) do
    for _, v24 in ipairs(v23) do
        v22[v24] = v_u_3.isSerializedData
    end
end
v8.isSerializedData = v2.strictInterface(v22)
function v8.deserializeAdd(p25, p26)
    local v27 = p25.isSerializedData
    assert(v27(p26))
    for v28, v29 in pairs(p26) do
        p25.stats[v28]:deserializeAdd(v29)
    end
end
function v8.deserializeReplace(p30, p31)
    local v32 = p30.isSerializedData
    assert(v32(p31))
    for v33, v34 in pairs(p31) do
        p30.stats[v33]:deserializeReplace(v34)
    end
end
function v8.describe(p35, p36, p37)
    for v38, v39 in pairs(p35.stats) do
        v39:describe(p36, p37 .. "." .. v38)
    end
end
return v8