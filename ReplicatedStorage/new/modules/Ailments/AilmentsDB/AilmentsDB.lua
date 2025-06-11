--// ReplicatedStorage.new.modules.Ailments.AilmentsDB (ModuleScript)

require(script.Parent.AilmentEntry)
local v1 = {}
for _, v2 in script:GetChildren() do
    if v2:IsA("ModuleScript") then
        local v3 = require(v2)
        v1[v3.kind] = v3
    end
end
return v1