--// ReplicatedStorage.ClientServices.SinglePurpose.PetNetworkOwnershipResetter (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("CharWrapperClient")
local v_u_3 = v1("RouterClient")
local v_u_4 = game:GetService("Players")
return {
    ["init"] = function()
        v_u_2.register_property_changed("controller", function(p5, p6, _)
            if p6 == v_u_4.LocalPlayer then
                v_u_3.get("PetAPI/ResetNetworkOwnership"):FireServer(p5)
            end
        end)
    end
}