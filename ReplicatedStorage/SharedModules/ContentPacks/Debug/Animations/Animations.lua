--// ReplicatedStorage.SharedModules.ContentPacks.Debug.Animations (ModuleScript)

if not game:GetService("RunService"):IsStudio() then
    return {}
end
local v1 = game.ReplicatedStorage:FindFirstChild("PetDebug")
if not v1 then
    return {}
end
local v2 = {}
for _, v3 in v1:GetChildren() do
    if v3:IsA("Model") and v3:FindFirstChild("Animations") then
        for _, v4 in v3.Animations:GetChildren() do
            v2[v3.Name .. v4.Name] = v4.AnimationId
        end
    end
end
return v2