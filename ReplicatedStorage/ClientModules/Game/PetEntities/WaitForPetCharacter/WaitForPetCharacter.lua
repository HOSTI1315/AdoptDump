--// ReplicatedStorage.ClientModules.Game.PetEntities.WaitForPetCharacter (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Promise")
local function v_u_7(p2, p3, p4)
    local v5 = p2:WaitForChild(p3, p4)
    local v6 = string.format
    return assert(v5, v6("Child %s not present after %d seconds", p3, p4))
end
local function v_u_9(p_u_8)
    if p_u_8:IsDescendantOf(game) then
        return v_u_1.fromEvent(p_u_8.AncestryChanged, function()
            return not p_u_8:IsDescendantOf(game)
        end):andThen(function()
            return v_u_1.reject("Character left the game during initialization")
        end)
    else
        return v_u_1.reject("Character must be a descendant of game")
    end
end
return function(p10)
    v_u_1.race({ v_u_9(p10), v_u_1.all({ v_u_1.try(v_u_7, p10, "PetModel", 300), v_u_1.try(v_u_7, p10, "Humanoid", 300), v_u_1.try(v_u_7, p10, "HumanoidRootPart", 300) }) }):expect()
end