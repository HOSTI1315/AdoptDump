--// ReplicatedStorage.ClientServices.RacetrackStartingLineService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("UIManager")
return {
    ["init"] = function()
        v_u_2.get_event("HousingAPI/PromptRaceStartTeleport").OnClientEvent:connect(function(p4)
            if v_u_3.apps.DialogApp:dialog({
                ["text"] = "A Go-Kart race is starting!",
                ["left"] = "Ignore",
                ["right"] = "Join!"
            }) == "Join!" then
                local v5 = game.Workspace.HouseInteriors.furniture:FindFirstChild(p4)
                if not v5 then
                    return
                end
                local v6 = v5:GetChildren()[1]:FindFirstChild("TeleportLocation").CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v6
            end
        end)
    end
}