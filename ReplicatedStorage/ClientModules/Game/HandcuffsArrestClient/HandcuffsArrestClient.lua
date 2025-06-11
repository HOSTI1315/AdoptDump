--// ReplicatedStorage.ClientModules.Game.HandcuffsArrestClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("UIManager")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("InteractionsEngine")
local v_u_5 = v1("ClientData")
local v_u_6 = v1("InteriorsM")
local _ = v1("RoleplayDB").detective_building.roles.detective.advertised_pay_per_task
local v7 = {}
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = {}
local function v_u_19(p12)
    local v13 = game.Players.LocalPlayer.Character
    if v13 then
        v13 = v13:FindFirstChild("HumanoidRootPart")
    end
    if v13 then
        local v14 = (1 / 0)
        local v15 = nil
        for _, v16 in ipairs(game.Players:GetPlayers()) do
            if v16 ~= game.Players.LocalPlayer and (v_u_5.get_server(v16, "roleplay_role") or {}).building_id == p12 then
                local v17 = v16.Character
                if v17 then
                    v17 = v16.Character:FindFirstChild("HumanoidRootPart")
                end
                if v17 then
                    local v18 = (v13.Position - v17.Position).magnitude
                    if v18 < v14 then
                        v15 = v16.Character
                        v14 = v18
                    end
                end
            end
        end
        return v15, v14
    end
end
local function v_u_24(p_u_20)
    local v21 = p_u_20:FindFirstChild("HumanoidRootPart")
    if v21 then
        local v22 = {
            ["text"] = "",
            ["part"] = v21,
            ["on_selected"] = {
                {
                    ["text"] = "Send to Jail",
                    ["on_selected"] = function()
                        v_u_3.get("RoleplayAPI/SendToJail"):InvokeServer(p_u_20)
                    end
                },
                {
                    ["text"] = "Release",
                    ["on_selected"] = function()
                        if v_u_3.get("RoleplayAPI/UnhandcuffPlayer"):InvokeServer(p_u_20) then
                            v_u_2.apps.HintApp:hint({
                                ["text"] = string.format("Successfully released %s!", p_u_20.Name),
                                ["overridable"] = true,
                                ["length"] = 5,
                                ["yields"] = false
                            })
                        end
                    end
                }
            }
        }
        local v23 = v_u_4:register(v22)
        v_u_2.apps.InteractionsApp:call_on_selected_helper(v23, v23.on_selected, {})
        v23:destroy()
    end
end
function v7.detective_handcuffs_use()
    local v_u_25, v26 = v_u_19("criminal_base")
    if v_u_25 and v26 <= 35 then
        if v_u_25 and v26 > 9 then
            v_u_2.apps.HintApp:hint({
                ["text"] = "Get closer!",
                ["overridable"] = true,
                ["length"] = 5,
                ["yields"] = false
            })
        elseif v_u_25 and v26 <= 9 then
            if v_u_6.get_current_location().destination_id == "CriminalBase" then
                v_u_2.apps.HintApp:hint({
                    ["text"] = "Can\'t use handcuffs in Criminal Base.",
                    ["overridable"] = true,
                    ["length"] = 4,
                    ["yields"] = false
                })
                return
            end
            if v_u_25:GetAttribute("is_handcuffed") == true then
                v_u_24(v_u_25)
                return
            end
            if v_u_3.get("RoleplayAPI/HandcuffPlayer"):InvokeServer(v_u_25) ~= true then
                return
            end
            task.spawn(function()
                v_u_2.apps.HintApp:hint({
                    ["text"] = string.format("Successfully handcuffed %s!", v_u_25.Name),
                    ["length"] = 3,
                    ["overridable"] = true,
                    ["color"] = Color3.fromRGB(138, 208, 255)
                })
                local v27 = v_u_11[v_u_25.Name]
                if v27 ~= nil then
                    local _ = os.time() - v27 > 60
                end
            end)
        end
    else
        v_u_2.apps.HintApp:hint({
            ["text"] = "Find a criminal to handcuff them.",
            ["overridable"] = true,
            ["length"] = 5,
            ["yields"] = false
        })
        return
    end
end
function v7.detective_handcuffs_equipped()
    v_u_2.apps.HintApp:hint({
        ["text"] = "Use these handcuffs to arrest Criminals.",
        ["overridable"] = true,
        ["length"] = 5,
        ["yields"] = false
    })
end
function v7.attempt_escape_handcuffs()
    if v_u_5.get("is_resetting") then
        return
    elseif game.Players.LocalPlayer.Character:GetAttribute("is_handcuffed") == true then
        if v_u_10 == nil or os.time() - v_u_10 >= 20 then
            if v_u_3.get("RoleplayAPI/EscapeHandcuffs"):InvokeServer() then
                v_u_2.apps.HintApp:hint({
                    ["text"] = "Successfully picked lock.",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
            end
            local v28 = game.Players.LocalPlayer.Character
            if v28 then
                v28 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            end
            if not v28 then
                return
            end
            if v_u_8 and v_u_9 then
                v28.WalkSpeed = v_u_8
                v28.JumpHeight = v_u_9
                return
            end
        else
            local v29 = os.time() - v_u_10
            v_u_2.apps.HintApp:hint({
                ["text"] = string.format("Can\'t escape for %s more second(s).", 20 - v29),
                ["overridable"] = true,
                ["length"] = 5,
                ["yields"] = false
            })
            task.defer(function()
                v_u_3.get("RoleplayAPI/PutHandcuffsBackOn"):FireServer()
            end)
        end
        return
    else
        local v30 = game.Players.LocalPlayer.Character
        if v30 then
            v30 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        end
        if v30 then
            if v_u_8 and v_u_9 then
                v30.WalkSpeed = v_u_8
                v30.JumpHeight = v_u_9
            end
        end
    end
end
function v7.criminal_handcuffs_equipped()
    local v31 = game.Players.LocalPlayer.Character
    if v31 then
        v31 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    end
    if v31 then
        if not (v_u_8 or v_u_9) then
            v_u_8 = v31.WalkSpeed
            v_u_9 = v31.JumpHeight
        end
        v31.WalkSpeed = 8
        v31.JumpHeight = 10
    end
end
function v7.init()
    v_u_3.get("RoleplayAPI/WasHandcuffed").OnClientEvent:Connect(function()
        v_u_10 = os.time()
    end)
    v_u_3.get("RoleplayAPI/WasSentToJail").OnClientEvent:Connect(function()
        v_u_5.update("jail_prisoner_controls_locked_at_timestamp", os.time())
        v_u_6.enter_smooth("DetectiveBuilding", "MainDoor", {
            ["spawn_cframe"] = function(p32)
                return p32.JailSpawn.CFrame
            end
        })
    end)
    local v_u_33 = nil
    v_u_6.on_location_changing:Connect(function()
        if (v_u_5.get("roleplay_role") or {}).building_id == "criminal_base" then
            v_u_33 = game:GetService("HttpService"):GenerateGUID()
            v_u_3.get("RoleplayAPI/SetArrestImmunity"):FireServer(true)
        end
    end)
    v_u_6.on_location_changed:Connect(function()
        if (v_u_5.get("roleplay_role") or {}).building_id == "criminal_base" then
            local v34 = game:GetService("HttpService"):GenerateGUID()
            v_u_33 = v34
            task.wait(1.3)
            if v34 == v_u_33 then
                v_u_3.get("RoleplayAPI/SetArrestImmunity"):FireServer(false)
            end
        end
    end)
end
return v7