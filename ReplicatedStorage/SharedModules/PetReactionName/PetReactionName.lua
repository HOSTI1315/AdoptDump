--// ReplicatedStorage.SharedModules.PetReactionName (ModuleScript)

local v_u_1 = {}
local function v_u_5(p2)
    for _, v3 in ipairs(p2:GetChildren()) do
        if v3:IsA("Folder") then
            v_u_5(v3)
        else
            local v4 = v3.Name
            v_u_1[v4] = v4
        end
    end
end
v_u_5(game:GetService("ReplicatedStorage").ClientModules.Game.PetEntities.PetReactions)
return v_u_1