--// ReplicatedStorage.ClientServices.FurnitureMannequinsClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("FurnitureMannequinsHelper")
return {
    ["init"] = function()
        v_u_1.refresh_mannequins_on_change()
    end
}