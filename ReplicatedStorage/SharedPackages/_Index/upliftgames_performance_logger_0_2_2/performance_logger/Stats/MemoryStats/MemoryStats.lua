--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.MemoryStats (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v2 = require(script.Parent.Parent.Parent.t)
local v_u_3 = require(script.Parent.AverageStat)
local v_u_4 = game:GetService("Stats")
local v_u_5 = { "Total" }
for _, v6 in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
    local v7 = v6.Name
    table.insert(v_u_5, v7)
end
local v8 = v1("MemoryStats")
function v8.__init(p9)
    p9.stats = {}
    for _, v10 in ipairs(v_u_5) do
        p9.stats[v10] = v_u_3.new()
    end
end
function v8.addLocalMemory(p11)
    local v12 = {}
    local v13 = 0
    for _, v14 in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
        local v15 = v_u_4:GetMemoryUsageMbForTag(v14.Name)
        if v15 > 10000 or v15 < 0 then
            return
        end
        v12[v14.Name] = v15
        v13 = v13 + v15
    end
    v12.Total = v13
    for v16, v17 in pairs(v12) do
        p11.stats[v16]:add(v17)
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
for _, v23 in ipairs(v_u_5) do
    v22[v23] = v_u_3.isSerializedData
end
v8.isSerializedData = v2.strictInterface(v22)
function v8.deserializeAdd(p24, p25)
    local v26 = p24.isSerializedData
    assert(v26(p25))
    for v27, v28 in pairs(p25) do
        p24.stats[v27]:deserializeAdd(v28)
    end
end
function v8.deserializeReplace(p29, p30)
    local v31 = p29.isSerializedData
    assert(v31(p30))
    for v32, v33 in pairs(p30) do
        p29.stats[v32]:deserializeReplace(v33)
    end
end
function v8.describe(p34, p35, p36)
    for v37, v38 in pairs(p34.stats) do
        v38:describe(p35, p36 .. "." .. v37)
    end
end
return v8