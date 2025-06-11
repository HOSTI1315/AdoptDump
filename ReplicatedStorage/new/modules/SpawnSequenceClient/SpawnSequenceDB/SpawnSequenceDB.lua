--// ReplicatedStorage.new.modules.SpawnSequenceClient.SpawnSequenceDB (ModuleScript)

require(script.Parent.BaseSpawnSequence)
local v1 = {}
for _, v2 in script:GetChildren() do
    if v2:IsA("ModuleScript") then
        local v3 = require(v2)
        table.insert(v1, v3)
    end
end
table.sort(v1, function(p4, p5)
    return p4.priority > p5.priority
end)
return v1