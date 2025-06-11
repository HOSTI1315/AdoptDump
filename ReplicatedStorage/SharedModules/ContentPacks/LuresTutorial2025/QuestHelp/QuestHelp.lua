--// ReplicatedStorage.SharedModules.ContentPacks.LuresTutorial2025.QuestHelp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("LureBaitHelper")
return {
    ["lures_tutorial"] = function()
        v_u_1.run_tutorial()
    end
}