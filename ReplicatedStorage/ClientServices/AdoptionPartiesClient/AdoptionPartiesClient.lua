--// ReplicatedStorage.ClientServices.AdoptionPartiesClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("UIManager")
local v_u_4 = v_u_1("ClientData")
local v_u_5 = v_u_1("new:TutorialHelper")
local v6 = {}
local function v_u_8()
    local v7 = v_u_1("InteriorsM")
    v_u_3.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 1,
        ["end_transparency"] = 0,
        ["color"] = Color3.new(1, 1, 1)
    })
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
        wait(0.1)
    end
    v7.enter("Nursery", "MainDoor", {
        ["studs_ahead_of_door"] = 6
    })
    v_u_3.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 0,
        ["end_transparency"] = 1,
        ["color"] = Color3.new(1, 1, 1)
    })
end
function v6.init()
    task.spawn(function()
        v_u_2.get_event("AdoptAPI/AdoptionPartyStarted").OnClientEvent:connect(function()
            if v_u_5.is_completed() then
                if v_u_4.get("team") ~= "Choosing" then
                    if v_u_3.apps.DialogApp:dialog({
                        ["text"] = "The Adoption Party is starting! Go to nursery to find new family?",
                        ["left"] = "Cancel",
                        ["right"] = "Go!",
                        ["image_size"] = UDim2.new(0, 125, 0, 125),
                        ["image"] = "rbxassetid://2131741777"
                    }) == "Go!" then
                        v_u_8()
                    end
                end
            else
                return
            end
        end)
    end)
end
return v6