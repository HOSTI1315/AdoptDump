--// ReplicatedStorage.ClientServices.MapSpecificScripts.HotAirBalloon (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("SharedConstants")
local v_u_5 = v1("UIManager")
local v_u_6 = v1("ShopM")
local v_u_7 = v1("SimpleEvents")
local v8 = {}
local function v_u_9()
    if v_u_6.pre_buy(v_u_4.fly_balloon_cost, {
        ["prompt_confirmation"] = true,
        ["purchase_confirmation_message"] = "Fly balloon for $%d?"
    }) then
        if v_u_2.get("BalloonAPI/BuyBalloon"):InvokeServer() == "success" then
            v_u_5.apps.DialogApp:dialog({
                ["text"] = "Your balloon will take off in " .. v_u_4.balloon_takeoff_time .. " seconds!",
                ["button"] = "Okay"
            })
            spawn(function()
                v_u_5.apps.HintApp:hint({
                    ["text"] = "Take a seat so you don\'t get left behind!",
                    ["length"] = 10
                })
            end)
        end
    end
end
function v8.init()
    v_u_7.get("MyCharacterAdded"):connect(function(p_u_10)
        p_u_10:WaitForChild("Humanoid").Seated:connect(function()
            local v11 = workspace:FindFirstChild("StaticMap"):FindFirstChild("Balloon"):FindFirstChild("HotAirBalloon")
            if v11 then
                if p_u_10.Humanoid.SeatPart and (p_u_10.Humanoid.SeatPart:IsDescendantOf(v11) and not v_u_3.get_server_constant("balloon_in_motion")) then
                    v_u_9()
                end
            end
        end)
    end)
end
return v8