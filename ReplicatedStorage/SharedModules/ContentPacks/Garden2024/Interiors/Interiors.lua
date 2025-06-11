--// ReplicatedStorage.SharedModules.ContentPacks.Garden2024.Interiors (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2:WaitForChild("Fsys")).load
local v_u_4 = v_u_3("package:Sift")
local v_u_5 = v_u_3("Maid")
local v_u_6 = v_u_3("Signal")
local v_u_7 = v_u_3("package:Promise")
local v_u_8 = v_u_3("TweenPromise")
local v_u_9 = v_u_3("GardenObbyHelper")
local v_u_10 = v2.Resources.Garden2024HintResources
local function v_u_15(p11)
    local v_u_12 = v_u_10.Garden2024JumpPoof:Clone()
    local v13 = p11.RootPart:GetPivot()
    local v14 = p11.HipHeight / 2
    v_u_12:PivotTo(v13 - Vector3.new(0, v14, 0))
    v_u_12.Parent = workspace
    v_u_12.ParticleEmitter:Emit(20)
    task.spawn(function()
        task.wait(v_u_12.ParticleEmitter.Lifetime.Max)
        v_u_12:Destroy()
    end)
end
local function v_u_19(p16, p17)
    local v18 = v_u_3("UIManager")
    v18.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 1,
        ["end_transparency"] = 0,
        ["yields"] = true
    })
    p17:PivotTo(p16)
    workspace.CurrentCamera.CFrame = p16 * CFrame.new(0, 0, 10)
    v18.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 0,
        ["end_transparency"] = 1
    })
end
local function v_u_26(p20, p21, p_u_22)
    local v_u_23 = false
    for _, v24 in p20.Programmed.RespawnBlocks:GetChildren() do
        if v24:IsA("BasePart") then
            p21.cleanup_maid:GiveTask(v24.Touched:Connect(function(p25)
                if v_u_23 then
                    return
                elseif p25:IsDescendantOf(v_u_1.LocalPlayer.Character) then
                    v_u_23 = true
                    v_u_19(p_u_22, v_u_1.LocalPlayer.Character)
                    v_u_23 = false
                end
            end))
        end
    end
end
local function v_u_35(p27, p28)
    local v_u_29 = v_u_3("MinigameForcedState")
    local v_u_30 = v_u_6.new()
    for _, v31 in p27.Programmed.SpeedBlocks:GetChildren() do
        if v31:IsA("BasePart") then
            p28.cleanup_maid:GiveTask(v31.Touched:Connect(function(p32)
                if p32:IsDescendantOf(v_u_1.LocalPlayer.Character) then
                    if not v_u_29.get_buff("garden_2024_speed_boost") then
                        v_u_30:Fire()
                        v_u_29.add_buff("garden_2024_speed_boost", {
                            ["walk_speed"] = 64,
                            ["jump_power"] = 75
                        })
                        local v_u_33 = workspace.CurrentCamera.FieldOfView
                        v_u_8.new(workspace.CurrentCamera, TweenInfo.new(1.5), {
                            ["FieldOfView"] = v_u_33 + 20
                        }):andThen(function()
                            return v_u_7.delay(2)
                        end):andThen(function()
                            local v34 = {
                                ["FieldOfView"] = v_u_33
                            }
                            return v_u_8.new(workspace.CurrentCamera, TweenInfo.new(1.5), v34)
                        end)
                    end
                else
                    return
                end
            end))
        end
    end
    return v_u_30
end
local function v_u_43(p36, p37)
    local v_u_38 = v_u_3("MinigameForcedState")
    local v39 = p36.Programmed.BuffRemovers
    local v_u_40 = v_u_6.new()
    for _, v41 in v39:GetChildren() do
        if v41:IsA("BasePart") then
            p37.cleanup_maid:GiveTask(v41.Touched:Connect(function(p42)
                if p42:IsDescendantOf(v_u_1.LocalPlayer.Character) then
                    if v_u_38.get_buff("garden_2024_speed_boost") then
                        v_u_38.remove_buff("garden_2024_speed_boost")
                        v_u_40:Fire()
                    end
                end
            end))
        end
    end
    return v_u_40
end
local v_u_81 = {
    ["interactions"] = function(_, _)
        return {}
    end,
    ["render"] = function(p_u_44, p45)
        p45.cleanup_maid = v_u_5.new()
        local v_u_46 = v_u_3("UIManager")
        local v47 = v_u_3("ClientData")
        local v_u_48 = v_u_3("CollisionsClient")
        local v_u_49 = v_u_3("RouterClient")
        local v50 = p_u_44:GetAttribute("CameraParticles")
        if v50 then
            local v_u_51 = v_u_3("CameraParticlesClient")
            v_u_51.set_camera_particles("GardenHintCourse", 100, v50)
            p45.cleanup_maid:GiveTask(function()
                v_u_51.remove_camera_particles("GardenHintCourse")
            end)
        end
        local v_u_52 = v_u_3("MinigameForcedState")
        local v53 = {
            ["can_enter_doors"] = true,
            ["app_visibility"] = {
                ["type"] = "include",
                ["app_names"] = {},
                ["include_essential"] = true
            }
        }
        v_u_52.enable(v_u_4.Dictionary.merge(v_u_52.RESTRICT_ALL, v53))
        local v_u_54 = v_u_52.disable_character_buffs()
        local v_u_55
        if v47.get("team") == "Parents" then
            v_u_55 = false
        else
            v_u_49.get("TeamAPI/ChooseTeam"):InvokeServer("Parents", {
                ["dont_respawn"] = true
            })
            v_u_55 = true
        end
        v_u_48.disable_player_on_collision("garden_2024_obby" .. p_u_44.Name)
        p45.cleanup_maid:GiveTask(function()
            v_u_48.enable_player_on_collision("garden_2024_obby" .. p_u_44.Name)
        end)
        p45.cleanup_maid:GiveTask(function()
            v_u_52.remove_buff("garden_2024_speed_boost")
            v_u_52.disable()
            v_u_52.restore_equipped({ "pets" })
            if v_u_55 then
                v_u_49.get("TeamAPI/ChooseTeam"):InvokeServer("Babies", {
                    ["dont_respawn"] = true
                })
            end
            v_u_54()
        end)
        local v56 = p45.door.WorkingParts.TouchToEnter
        local v_u_57 = v_u_1.LocalPlayer.Character
        local v58
        if v_u_57 then
            v58 = v_u_57:FindFirstChild("HumanoidRootPart")
        else
            v58 = v_u_57
        end
        local v_u_59 = v_u_1.LocalPlayer.Character:WaitForChild("Humanoid")
        p45.cleanup_maid:GiveTask(v_u_59.StateChanged:Connect(function(_, p60)
            if p60 == Enum.HumanoidStateType.Jumping then
                v_u_15(v_u_59)
            end
        end))
        local v61 = v56.CFrame * CFrame.new(0, -v56.Size.Y / 2, -12)
        local v62 = v_u_59.HipHeight + v58.Size.Y / 2
        local v_u_63 = v61 + Vector3.new(0, v62, 0)
        v_u_26(p_u_44, p45, v_u_63)
        local v64 = v_u_35(p_u_44, p45)
        local v65 = v_u_43(p_u_44, p45)
        local v66 = v_u_9.CHASEMAP_INTERIOR_NAMES[p_u_44.Name]
        local v67 = v_u_46.apps.MinigameInGameApp
        local v68 = {
            ["title"] = ("Garden\nCourse %*"):format(v66),
            ["exit_title"] = "Exit Obby",
            ["exit_callback"] = function()
                v_u_19(v_u_63 * CFrame.Angles(0, 3.141592653589793, 0), v_u_57)
            end,
            ["left"] = {
                ["title"] = "TIME",
                ["value"] = "0:00",
                ["title_x_alignment"] = Enum.TextXAlignment.Center
            }
        }
        local v_u_69 = v67:display(v68)
        v_u_49.get("EventAPI/StartObby"):FireServer(v66)
        local v_u_70 = false
        local v_u_79 = v_u_7.all({ v_u_7.fromEvent(v64):andThen(function()
                return v_u_7.new(function(p71, _, p72)
                    local v73 = os.clock()
                    while not p72() do
                        local v74 = os.clock() - v73
                        if v_u_70 then
                            p71(v74)
                            return
                        end
                        local v75 = v74 / 60
                        local v76 = math.floor(v75)
                        local v77 = v74 % 60
                        local v78 = math.floor(v77)
                        v_u_69:set_left_value(string.format("%2d:%02d", v76, v78))
                        task.wait(0.2)
                    end
                end)
            end), v_u_7.fromEvent(v65):andThen(function()
                v_u_70 = true
            end) })
        p45.cleanup_maid:GiveTask(function()
            v_u_46.set_app_visibility("MinigameInGameApp", false)
            v_u_79:cancel()
        end)
    end,
    ["cleanup"] = function(_, p80)
        if p80.cleanup_maid then
            p80.cleanup_maid:Destroy()
            p80.cleanup_maid = nil
        end
    end
}
return v_u_4.Dictionary.map(v_u_9.CHASEMAP_INTERIOR_NAMES, function(_, p82)
    return v_u_81, p82
end)