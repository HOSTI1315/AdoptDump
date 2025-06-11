--// ReplicatedStorage.ClientServices.SinglePurpose.TurnOffAutoJumpEnabled (ModuleScript)

local _ = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
return {
    ["init"] = function()
        spawn(function()
            game.Players.LocalPlayer.CharacterAdded:wait()
            game.Players.LocalPlayer.AutoJumpEnabled = false
        end)
    end
}