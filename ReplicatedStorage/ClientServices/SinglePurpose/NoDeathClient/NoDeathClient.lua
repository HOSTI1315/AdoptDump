--// ReplicatedStorage.ClientServices.SinglePurpose.NoDeathClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SimpleEvents")
v1("ClientData")
v1("Utilities")
return {
    ["init"] = function()
        v_u_2.get("AllCharacterAddedPlusExisting"):connect(function(p3)
            p3:WaitForChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end)
    end
}