--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameRagdoll (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("StateManagerClient")
local v4 = v1("Maid")
local v_u_5 = v1("package:Promise")
local v_u_6 = game:GetService("HttpService")
local v_u_7 = game:GetService("RunService")
local v_u_8 = game:GetService("Players")
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = v4.new()
local v_u_12 = v_u_5.resolve()
local function v_u_16(p13)
    local v14 = game.ReplicatedStorage.Resources.Particles.PridePinPoof:Clone()
    local v15 = Instance.new("Attachment")
    v14.Parent = v15
    v15.Position = p13
    v15.Parent = workspace.Terrain
    v14:Emit(10)
    game:GetService("Debris"):AddItem(v15, 10)
end
function v_u_9.is_enabled()
    return next(v_u_10) ~= nil
end
function on_enable_changed()
    if next(v_u_10) == nil then
        v_u_11:DoCleaning()
        return
    else
        local v_u_17 = v_u_8.LocalPlayer.Character
        if v_u_17 then
            v_u_17 = v_u_17:FindFirstChild("Humanoid")
        end
        if v_u_17 then
            v_u_3.exit_seat_states()
            local v_u_18 = v_u_17.Parent
            local v_u_25 = v_u_5.new(function(_, _, p19)
                local v_u_20 = {}
                for _, v21 in pairs(v_u_18:GetDescendants()) do
                    if v21:IsA("Motor6D") then
                        v_u_20[v21] = v21.Transform
                    end
                end
                local v_u_24 = v_u_7.Stepped:Connect(function()
                    for v22, v23 in pairs(v_u_20) do
                        v22.Transform = v23
                    end
                end)
                p19(function()
                    v_u_24:Disconnect()
                end)
            end)
            v_u_17:ChangeState(Enum.HumanoidStateType.Physics)
            v_u_11:GiveTask(function()
                v_u_17:ChangeState(Enum.HumanoidStateType.GettingUp)
                v_u_25:cancel()
            end)
        end
    end
end
function v_u_9.enable(p26)
    assert(p26, "Must provide a string handle.")
    local v27 = p26 ~= v_u_9
    assert(v27, "MinigameRagdoll.enable is called with a period, not a colon.")
    v_u_10[p26] = true
    on_enable_changed()
end
function v_u_9.disable(p28)
    assert(p28, "Must provide a string handle.")
    local v29 = p28 ~= v_u_9
    assert(v29, "MinigameRagdoll.disable is called with a period, not a colon.")
    v_u_10[p28] = nil
    on_enable_changed()
end
function v_u_9.fling(p30, p31, p32, p33, p34)
    local v_u_35 = p34 or {}
    if v_u_35.exclusive and (v_u_12 and v_u_12:getStatus() == v_u_5.Status.Started) then
        return
    else
        v_u_12:cancel()
        local v36 = v_u_8.LocalPlayer.Character
        if v36 then
            v36 = v36:FindFirstChild("Humanoid")
        end
        if v36 then
            v36 = v36.RootPart
        end
        if v36 then
            if p32 then
                v_u_16(v36.Position)
            end
            if p33 then
                v_u_2.FX:play("RagdollFling")
            end
            local v_u_37 = v_u_6:GenerateGUID(false)
            v_u_9.enable(v_u_37)
            v_u_12 = v_u_5.delay(p31):finally(function()
                v_u_9.disable(v_u_37)
                if v_u_35.recovery_callback then
                    v_u_35.recovery_callback()
                end
            end)
            v36.AssemblyLinearVelocity = p30
            v36.AssemblyAngularVelocity = v_u_35.angular_veloctiy or Vector3.new(2, 2, 2)
        end
    end
end
return v_u_9