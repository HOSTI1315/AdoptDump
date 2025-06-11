--// ReplicatedStorage.ClientServices.SinglePurpose.ResetHandler (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIManager")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("CoreCall")
local v_u_5 = v1("MouseCursorHider")
local v_u_6 = v1("ClientData")
local v_u_7 = v1("ClientToolManager")
local v_u_8 = v1("ThemedServersHelper")
local v_u_9 = v1("EquippedPets")
local v_u_10 = v1("MinigameClientManager")
local v_u_11 = v1("new:TutorialHelper")
local v_u_12 = v1("Debug").create_log()
return {
    ["init"] = function()
        game.Players.LocalPlayer.CameraMaxZoomDistance = 70
        spawn(function()
            local v13 = Instance.new("BindableEvent")
            v13.Event:connect(function()
                if v_u_8.is_afk_place() then
                    return
                elseif not v_u_11.is_new_tutorial_running() then
                    for _, v14 in v_u_10.get_all() do
                        if v14:on_attempt_exit(true) then
                            return
                        end
                    end
                    v_u_2.apps.TransitionsApp:transition({
                        ["length"] = 0.5,
                        ["start_transparency"] = 1,
                        ["end_transparency"] = 0
                    })
                    game.Players.LocalPlayer.CameraMaxZoomDistance = 70
                    workspace.CurrentCamera.FieldOfView = 70
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
                    v_u_5.reset()
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                    end
                    v_u_6.update("is_resetting", true)
                    local v15 = v_u_9.get_my_equipped()
                    v_u_3.get("ToolAPI/UnequipAll"):FireServer()
                    v_u_3.get("TeamAPI/Spawn"):InvokeServer()
                    workspace.Gravity = 196.2
                    if v15 and next(v15) then
                        for _, v16 in v15 do
                            v_u_7.equip(v16, {
                                ["equip_as_last"] = true
                            })
                        end
                    end
                    v_u_6.update("is_resetting", false)
                    v_u_12("TeamAPI/spawn() returned")
                end
            end)
            v_u_4("SetCore", "ResetButtonCallback", v13)
        end)
    end
}