--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("AdoptMeEnums/PetEntities/StimulusType")
local v2 = {}
for _, v3 in ipairs(script:GetChildren()) do
    v2[v3.Name] = require(v3)
end
local v4 = {}
for _, v5 in pairs(v1) do
    v4[v5] = {}
end
for _, v6 in pairs(v2) do
    if v6.trigger_stimuli then
        for _, v7 in ipairs(v6.trigger_stimuli) do
            local v8 = v4[v7]
            table.insert(v8, v6)
        end
    end
end
return {
    ["reactions"] = v2,
    ["by_stimulus"] = v4
}