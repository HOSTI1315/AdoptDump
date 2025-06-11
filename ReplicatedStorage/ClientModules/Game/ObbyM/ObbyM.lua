--// ReplicatedStorage.ClientModules.Game.ObbyM (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.new.modules.Explorer)
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("RouterClient")
local v_u_4 = v_u_2("StateManagerClient")
local v_u_5 = v_u_2("UIManager")
local v6 = v_u_2("Maid")
local v_u_7 = game:GetService("Players")
local v8 = {}
local v_u_9 = v6.new()
local v_u_10 = nil
local v_u_11 = false
function v8.is_in_obby()
    return v_u_10 ~= nil
end
function v8.complete_obby()
    if v_u_10 then
        local v12 = v_u_10.Name
        v_u_3.get("MinigameAPI/FinishObby"):FireServer(v12)
    end
    v_u_9:DoCleaning()
end
function v8.enter_obby(p13)
    local v14 = v_u_2("DoorsM")
    local v15 = v_u_1.get(p13, { "Doors", "MainDoor" })
    local v_u_16
    if v15 then
        v_u_16 = v14.get_door(v15)
    else
        v_u_16 = v15
    end
    local v_u_17
    if v15 then
        v_u_17 = v_u_1.get(v15, { "WorkingParts", "TouchToEnter" })
    else
        v_u_17 = v15
    end
    if v15 and (v_u_16 and v_u_17) then
        v_u_5.set_app_visibility("AvatarEditorApp", false)
        local v18 = v_u_7.LocalPlayer.Character
        local v_u_19
        if v18 then
            v_u_19 = v18:FindFirstChild("Humanoid")
        else
            v_u_19 = v18
        end
        local v_u_20
        if v18 then
            v_u_20 = v18:FindFirstChild("HumanoidRootPart")
        else
            v_u_20 = v18
        end
        if v18 and (v_u_19 and v_u_20) then
            v_u_4.exit_seat_states()
            local v_u_21 = {
                ["JumpPower"] = v_u_19.JumpPower,
                ["WalkSpeed"] = v_u_19.WalkSpeed,
                ["HipHeight"] = v_u_19.HipHeight,
                ["Gravity"] = workspace.Gravity
            }
            v_u_19.JumpPower = 50
            v_u_19.WalkSpeed = 16
            v_u_19.HipHeight = 2
            workspace.Gravity = 192.6
            v_u_9:GiveTask(function()
                v_u_19.JumpPower = v_u_21.JumpPower
                v_u_19.WalkSpeed = v_u_21.WalkSpeed
                v_u_19.HipHeight = v_u_21.HipHeight
                workspace.Gravity = v_u_21.Gravity
                v_u_10 = nil
            end)
            local v_u_22 = Instance.new("Part")
            v_u_22.Name = "ObbyHitbox"
            v_u_22.Massless = true
            v_u_22.CanCollide = false
            v_u_22.Transparency = 1
            v_u_22.Size = Vector3.new(2, 5, 1)
            v_u_22.Parent = v18
            local v23 = Instance.new("Weld")
            v23.C0 = CFrame.new(0, v_u_22.Size.Y / 2 - (v_u_20.Size.Y / 2 + v_u_19.HipHeight + 0.001), 0)
            v23.Part0 = v_u_20
            v23.Part1 = v_u_22
            v23.Parent = v_u_22
            v_u_9:GiveTask(v23)
            v_u_9:GiveTask(v_u_22)
            local v24 = p13:FindFirstChild("KillBricks")
            for _, v25 in not v24 and {} or v24:GetChildren() do
                if v25:IsA("BasePart") then
                    v_u_9:GiveTask(v25.Touched:Connect(function(p26)
                        if p26 == v_u_22 then
                            local v27 = v_u_20
                            local v28 = v_u_17
                            if v_u_11 then
                                return
                            end
                            v_u_11 = true
                            v27.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            v27.CFrame = v28.CFrame * CFrame.new(0, 0, -6 - v28.Size.Z / 2)
                            task.wait(0.5)
                            v_u_11 = false
                        end
                    end))
                end
            end
            local v_u_29 = v_u_5.apps.ExtraButtonsApp:register_button({
                ["priority"] = 1,
                ["text"] = "Exit Obby",
                ["mouse_button1_click"] = function()
                    v_u_16:enter({
                        ["is_exit_button"] = true
                    })
                end
            })
            v_u_29:show()
            v_u_9:GiveTask(function()
                v_u_5.apps.ExtraButtonsApp:unregister_button(v_u_29)
            end)
            v_u_10 = p13
        else
            v_u_16:enter({
                ["is_exit_button"] = true
            })
        end
    else
        return
    end
end
function v8.exit_obby()
    v_u_9:DoCleaning()
end
function v8.enter_obby_lobby()
    task.spawn(function()
        v_u_5.apps.HintApp:hint({
            ["text"] = "Complete obstacle courses for Roblox badges!",
            ["length"] = 5
        })
    end)
end
return v8