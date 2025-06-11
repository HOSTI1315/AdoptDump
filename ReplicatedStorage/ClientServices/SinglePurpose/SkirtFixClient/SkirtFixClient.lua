--// ReplicatedStorage.ClientServices.SinglePurpose.SkirtFixClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("SkirtSitFix")
return {
    ["init"] = function()
        game.Players.LocalPlayer.CharacterAdded:connect(function(p2)
            v_u_1.track(p2)
        end)
    end
}