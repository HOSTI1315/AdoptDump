--// ReplicatedStorage.ClientModules.Game.CollisionsClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("RouterClient")
local v4 = v1("Signal")
local v_u_5 = v1("Debug").create_log()
local v_u_6 = v1("package:Promise")
local v_u_7 = game:GetService("Players")
local v_u_11 = {
    ["set_model_collision_group"] = function(p8, p9)
        if p8 and p8.Parent then
            for _, v10 in pairs(p8:GetDescendants()) do
                if v10:IsA("BasePart") and v10.Name ~= "Wheel" then
                    v10.CollisionGroup = p9
                end
            end
        end
    end
}
local v_u_12 = 0
local v_u_13 = {}
local v_u_14 = nil
local v_u_15 = true
local v_u_16 = v4.new()
local v_u_17 = v_u_6.resolve()
function v_u_11.set_collidable(p18)
    if game.Players.LocalPlayer.Character == nil then
        return
    else
        local v19 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v19 ~= nil then
            v_u_5("Setting collisions", p18)
            v_u_12 = v_u_12 + 1
            if p18 then
                for _, v20 in pairs(v_u_13) do
                    if v_u_7:GetPlayerFromCharacter(v20) and (v20 and v20.Parent) then
                        local v21 = v_u_2.get_server(game.Players:GetPlayerFromCharacter(v20), "player_on_player_collisions_disabled") and "players_no_player_collision" or "players"
                        v_u_11.set_model_collision_group(v20, v21)
                    end
                end
                if v_u_14 and v_u_14.Parent then
                    v_u_11.set_model_collision_group(v_u_14, "vehicles")
                end
                v_u_14 = nil
                v_u_13 = {}
                v_u_15 = true
            else
                for _, v22 in pairs(game.Players:GetPlayers()) do
                    local v23 = v22 and v22.Character
                    if v23 then
                        v23 = v22.Character:FindFirstChild("HumanoidRootPart")
                    end
                    if v23 and (v19.Position - v23.Position).Magnitude < 50 then
                        v_u_11.set_model_collision_group(v22.Character, "noncollide")
                        local v24 = v_u_13
                        local v25 = v22.Character
                        table.insert(v24, v25)
                    end
                end
                local v26 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if v26 then
                    v26 = v26.SeatPart
                end
                if v26 and v26:IsA("VehicleSeat") then
                    local v27 = v26.Parent
                    v_u_11.set_model_collision_group(v27, "noncollide")
                    v_u_14 = v27
                end
                v_u_15 = false
            end
            v_u_16:Fire()
        end
    end
end
function v_u_11.delayed_set_collidable(p_u_28, p29)
    local v_u_30 = v_u_12
    delay(p29, function()
        if v_u_30 == v_u_12 then
            v_u_11.set_collidable(p_u_28)
        end
    end)
end
local v_u_31 = {}
local function v_u_33()
    v_u_17:cancel()
    if v_u_15 then
        v_u_17 = v_u_6.resolve()
    else
        v_u_17 = v_u_6.fromEvent(v_u_16, function()
            return v_u_15
        end)
    end
    v_u_17:andThen(function()
        local v32 = next(v_u_31) == nil
        if v32 ~= not v_u_2.get("player_on_player_collisions_disabled") then
            v_u_3.get("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(v32)
        end
    end)
end
function v_u_11.enable_player_on_collision(p34)
    v_u_31[p34] = nil
    v_u_33()
end
function v_u_11.disable_player_on_collision(p35)
    v_u_31[p35] = true
    v_u_33()
end
return v_u_11