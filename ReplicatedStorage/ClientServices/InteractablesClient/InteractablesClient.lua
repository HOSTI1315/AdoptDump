--// ReplicatedStorage.ClientServices.InteractablesClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("ClientData")
v1("SharedConstants")
local v_u_2 = v1("UIManager")
v1("Utilities")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("WeatherClient")
local v5 = {}
local function v_u_6()
    v_u_4.add_interior_lighting(5, "CRIB_SLEEP")
    v_u_2.apps.TransitionsApp:set_blur("CribSleep", 8, 1)
    repeat
        wait(0.1)
    until game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored == false
    v_u_4.remove_lighting(5)
    v_u_2.apps.TransitionsApp:clear_blur("CribSleep")
end
function v5.init()
    v_u_3.get_event("AdoptAPI/BabySleeped").OnClientEvent:connect(v_u_6)
end
return v5