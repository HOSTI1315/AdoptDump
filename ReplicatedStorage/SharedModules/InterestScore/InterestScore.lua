--// ReplicatedStorage.SharedModules.InterestScore (ModuleScript)

return require(game.ReplicatedStorage:WaitForChild("Fsys")).load("HardenConstants").harden_map({
    ["Effect"] = -30,
    ["InformationPersistent"] = -20,
    ["Information"] = -10,
    ["Anticipate"] = 0,
    ["Gameplay"] = 10,
    ["GameplayCritical"] = 20,
    ["AlwaysInterested"] = (1 / 0),
    ["NeverInterested"] = (-1 / 0)
})