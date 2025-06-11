--// ReplicatedStorage.ClientServices.Interactions.MagicHouseDoorInteractions (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("InteriorsM")
local v_u_5 = v1("AnimationManager")
local v_u_6 = v1("MagicHouseDoorClient")
local v_u_7 = v1("ClientData")
local v_u_8 = v1("UIManager")
local v_u_9 = v1("FamilyHelper")
local v_u_10 = v1("PlaceableToolHelper")
local v_u_11 = v1("FurnitureBlockerHelper")
local v12 = {}
local function v_u_17(p13)
    local v14 = p13:WaitForChild("Rig", 5)
    local v15
    if v14 then
        v15 = v14:WaitForChild("AnimationController", 5)
    else
        v15 = v14
    end
    if v15 then
        v15:LoadAnimation(v_u_5.get_track("MagicDoorIdle")):Play()
        local v16 = v15:LoadAnimation(v_u_5.get_track("MagicDoorSpin"))
        v16:Play()
        v16.Stopped:Wait()
        v14.Glow.Transparency = 0
        v14.Glow.Attachment.SpinningGlow.Enabled = true
    end
end
local function v_u_30(p18)
    local v19 = v_u_10.get_owner(p18)
    local v20 = v_u_7.get_server(v19, "door_locked")
    if v_u_7.get("dev_watchmode") and true or ((v20 ~= true or (v_u_9.is_my_friend_or_family(v19) or v19 == game.Players.LocalPlayer)) and true or false) then
        game.Players.LocalPlayer.SetControlEnabled:Fire(false)
        local v21 = p18.PlacementBlock
        local v_u_22 = game.Players.LocalPlayer.Character
        local v23 = v_u_22.HumanoidRootPart.Position * Vector3.new(1, 0, 1)
        local v_u_24 = (v21.Position - -v21.CFrame.LookVector * 2) * Vector3.new(1, 0, 1)
        local v25 = (v23 - v_u_24).Magnitude / v_u_22.Humanoid.WalkSpeed
        local v26 = 0.5 - math.min(0.5, v25)
        task.delay(v26, function()
            v_u_22.Humanoid:MoveTo(v_u_24)
        end)
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        local v27 = v21.CFrame * CFrame.new(0, 5, -(v21.Size.Z / 2 - 1))
        local v28 = v21.CFrame * CFrame.new(0, 5, -(v21.Size.Z / 2 + 15))
        local v_u_29 = game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(0.8, Enum.EasingStyle.Linear), {
            ["CFrame"] = CFrame.new(v27.p, v28.p)
        })
        v_u_29:Play()
        task.delay(0.475, function()
            v_u_29:Cancel()
        end)
        coroutine.wrap(v_u_6.animate_door)(p18)
        v_u_4.enter_smooth("housing", "MainDoor", {
            ["house_owner"] = v19
        })
        v_u_3.get("PlaceableToolAPI/UseMagicHouseDoor"):InvokeServer()
    else
        v_u_8.apps.HintApp:hint({
            ["text"] = "This door is locked!",
            ["length"] = 4,
            ["yields"] = false,
            ["overridable"] = true
        })
    end
end
local function v_u_36(p_u_31, p32)
    local v33 = p_u_31:WaitForChild("EnterPortal", 5)
    if v33 then
        local v_u_34 = v_u_10.get_owner(p_u_31)
        local v_u_35 = v_u_34 == game.Players.LocalPlayer
        p32.interaction = v_u_2:register({
            ["text"] = v_u_35 and "Configure" or "Teleport to " .. v_u_34.Name .. "\'s house",
            ["part"] = v33,
            ["on_selected"] = function()
                if v_u_35 then
                    return {
                        {
                            ["text"] = "Teleport to your house",
                            ["on_selected"] = function()
                                v_u_30(p_u_31)
                            end
                        },
                        {
                            ["text"] = "Take Down",
                            ["on_selected"] = function()
                                v_u_3.get("PlaceableToolAPI/DestroyPlaceable"):InvokeServer("magic_house_door", "magic_house_door")
                            end
                        }
                    }
                end
                if v_u_10.is_house_owner() then
                    return {
                        {
                            ["text"] = "Teleport to " .. v_u_34.Name .. "\'s house",
                            ["on_selected"] = function()
                                v_u_30(p_u_31)
                            end
                        },
                        {
                            ["text"] = "Take Down",
                            ["on_selected"] = function()
                                v_u_3.get("PlaceableToolAPI/HouseOwnerDestroyPlaceable"):InvokeServer(v_u_34, "magic_house_door", "magic_house_door")
                            end
                        }
                    }
                end
                v_u_30(p_u_31)
            end
        })
        v_u_11.protect_interaction(p32.interaction)
        v_u_17(p_u_31)
    end
end
function v12.init()
    v_u_10.listen_for_placeables("MagicHouseDoor", v_u_36)
end
return v12