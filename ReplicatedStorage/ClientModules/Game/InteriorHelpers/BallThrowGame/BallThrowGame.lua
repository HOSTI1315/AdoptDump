--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.BallThrowGame (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("RouterClient")
v1("package:Promise")
local v_u_3 = v1("UIManager")
v1("ClientData")
local v_u_4 = v1("SoundPlayer")
local v_u_5 = v1("ShopM")
local v_u_6 = {}
local v_u_7 = Random.new()
function emit_poof(p8)
    local v9 = game.ReplicatedStorage.Resources.Particles.PridePinPoof:Clone()
    local v10 = Instance.new("Attachment")
    v9.Parent = v10
    v10.Position = p8
    v10.Parent = workspace.Terrain
    v9:Emit(10)
    game:GetService("Debris"):AddItem(v10, 10)
end
function select_cup(p11)
    local v12 = {}
    for _, v13 in p11.BetaFishMinigame.WorkingParts.Cups:GetChildren() do
        if (v13.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 17 then
            table.insert(v12, v13)
        end
    end
    return v12[v_u_7:NextInteger(1, #v12)]
end
function v_u_6.prompt_throw(p14)
    if v_u_3.apps.DialogApp:dialog({
        ["text"] = string.format("Win a Betta Fish!\nSpend %d tickets?", 16000),
        ["left"] = "No",
        ["right"] = "Yes"
    }) == "Yes" then
        v_u_6.do_throw(p14)
    end
end
function v_u_6.do_throw(p15)
    local v_u_16 = select_cup(p15)
    if v_u_16 then
        if v_u_5.try_prompt_not_enough_money("tickets_2024", 16000) then
            local v_u_17 = v_u_2.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("summer_2024_betta_fish_game", nil)
            if v_u_17 then
                local v_u_18 = game.ReplicatedStorage.Resources:FindFirstChild("Ball"):Clone()
                v_u_18:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                v_u_18.Parent = workspace
                v_u_4.FX:play("Beta Fish Ball Throw")
                local v19 = v_u_16.Size
                local v20 = v_u_16.Position
                local v21 = v_u_18.PrimaryPart
                local v22 = v21.Position
                local v23 = v20.X + v_u_7:NextNumber(-v19.X / 2, v19.X / 2)
                local v24 = v20.Y
                local v25 = v20.Z + v_u_7:NextNumber(-v19.Z / 2, v19.Z / 2)
                local v26 = Vector3.new(v23, v24, v25)
                local v27 = Instance.new("BodyForce")
                local v28 = -80 + workspace.Gravity
                v27.Force = Vector3.new(0, v28, 0) * v21.AssemblyMass
                v27.Parent = v21
                local v29 = v26 - v22
                local v30 = v29.X
                local v31 = v29.Z
                local v32 = Vector3.new(v30, 0, v31)
                local v33 = v32.Magnitude / 0.8
                local v34 = (v29.Y + 25.6) / 0.8
                v21.AssemblyLinearVelocity = v32.unit * v33 + Vector3.new(0, v34, 0)
                v21.AssemblyAngularVelocity = v32:Cross(Vector3.new(0, 1, 0)).Unit * v_u_7:NextNumber(-20, -10)
                task.delay(0.8, function()
                    emit_poof(v_u_16.Position)
                    v_u_4.FX:play("Beta Fish Ball Land")
                    task.wait(0.5)
                    local v35 = v_u_17[1]
                    local _ = v35.kind
                    local v36 = v35.unique
                    local v37 = game.Players.LocalPlayer.Character
                    local v38 = v37.HumanoidRootPart
                    local v39 = v37.Humanoid
                    local v40 = v38.CFrame * CFrame.new(0, 0, 4)
                    local v41 = v38.Size.Y / 2 + v39.HipHeight
                    local v42 = {
                        ["spawn_cframe"] = v40 - Vector3.new(0, v41, 0)
                    }
                    v_u_2.get("ToolAPI/Equip"):InvokeServer(v36, v42)
                    v_u_4.FX:play("Beta Fish Jingle Ding")
                    game:GetService("Debris"):AddItem(v_u_18, 3)
                end)
            end
        else
            return
        end
    else
        v_u_3.apps.HintApp:hint({
            ["text"] = "You\'re too far away to do that!",
            ["length"] = 3,
            ["overridable"] = true,
            ["yields"] = false
        })
        return
    end
end
return v_u_6