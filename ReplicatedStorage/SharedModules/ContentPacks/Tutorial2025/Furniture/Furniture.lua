--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.Furniture (ModuleScript)

local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v2("EntryHelper")
local v4 = v2("NPCHelper")
local v5 = v3.furniture
local v6 = {
    ["tutorial_2025_sir_woofington"] = {
        ["name"] = "Sir Woofington",
        ["model_name"] = "TutorialSirWoofington"
    },
    ["tutorial_2025_shane"] = {
        ["name"] = "Pet Trainer Shane",
        ["model_name"] = "PetTrainer",
        ["behavior"] = v4.NPC_SIMPLE("tutorial_2025_shane")
    },
    ["sir_woofington"] = {
        ["name"] = "Sir Woofington",
        ["model_name"] = "SirWoofington",
        ["behavior"] = v1:IsServer() and {} or v2("new:TutorialHelper").render_sir_woofington("sir_woofington")
    },
    ["tutorial_sir_woofington"] = {
        ["name"] = "Sir Woofington",
        ["model_name"] = "TutorialSirWoofington",
        ["behavior"] = v1:IsServer() and {} or v2("new:TutorialHelper").render_sir_woofington("tutorial_sir_woofington")
    }
}
return v5(v6)