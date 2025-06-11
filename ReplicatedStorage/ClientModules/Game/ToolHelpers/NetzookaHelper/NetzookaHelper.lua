--// ReplicatedStorage.ClientModules.Game.ToolHelpers.NetzookaHelper (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2:WaitForChild("Fsys")).load
local v_u_4 = v_u_3("RouterClient")
local v_u_5 = v_u_3("ProjectileHelper")
local v_u_6 = v_u_3("SoundPlayer")
local v_u_7 = v_u_3("package:Promise")
local v_u_8 = v_u_3("TweenPromise")
local v_u_9 = v_u_3("GameplayFX")
local v_u_10 = require(v2.new.modules.Explorer)
local v11 = {}
local v_u_12 = v2.Resources.Halloween2024.NetzookaToy
local v_u_13 = false
local function v_u_38(p_u_14, p15, p16)
    local v_u_17 = v_u_10.get(p_u_14, { "Character", "HumanoidRootPart" })
    local v18 = v_u_10.get(p_u_14, { "Character", p15.tool, "ModelHandle" })
    local v19 = v_u_10.get(p_u_14, {
        "Character",
        p15.tool,
        "ModelHandle",
        "LaunchPart"
    })
    if v_u_17 and v18 then
        local v_u_20 = v_u_12.NetzookaNet:Clone()
        local v_u_21 = v_u_20.Visual
        v_u_21:ScaleTo(0.05)
        v_u_20:PivotTo(CFrame.lookAlong(v19.Position, p16))
        v_u_20.Parent = game.Workspace
        local v22 = Instance.new("Attachment")
        v22.Parent = v_u_20.PrimaryPart
        local v23 = v_u_20.PrimaryPart.AssemblyMass
        local v24 = Instance.new("VectorForce")
        v24.Attachment0 = v22
        v24.RelativeTo = Enum.ActuatorRelativeTo.World
        v24.ApplyAtCenterOfMass = true
        local v25 = v23 * (workspace.Gravity - 80)
        v24.Force = Vector3.new(0, v25, 0)
        v24.Parent = v_u_20.PrimaryPart
        local v26 = p16 * 55
        v_u_20.PrimaryPart.AssemblyLinearVelocity = v26
        local v27 = v18.LaunchPart
        local v28 = v_u_10.get(v27, { "MuzzleFlashAttachment" })
        if v28 then
            v28.Fire:Emit(9)
        end
        v_u_6.FX:play("WBTagShootNetzooka", v19)
        local v_u_30 = v_u_7.all({ v_u_8.callback(0, 1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(p29)
                v_u_21:ScaleTo(p29 * 1.15 + 0.05)
            end), v_u_7.delay(5) }):finally(function()
            v_u_20:Destroy()
        end)
        v_u_20.PrimaryPart.Touched:Connect(function(p31)
            if p31:CanCollideWith(v_u_17) then
                if not p31:IsDescendantOf(p_u_14.Character) then
                    local v32 = v_u_1:GetPlayerFromCharacter((p31:FindFirstAncestorWhichIsA("Model")))
                    local v33 = v_u_20.PrimaryPart.Position
                    local v_u_34 = Instance.new("Attachment")
                    v_u_34.Position = v33
                    v_u_34.Parent = workspace.Terrain
                    v_u_6.FX:play("WBTagNetzookaHit", v_u_34)
                    v_u_7.delay(2):andThen(function()
                        v_u_34:Destroy()
                    end)
                    if v32 then
                        local v35 = v32.Character
                        local v_u_36 = v_u_12.NetWrapAccessory:Clone()
                        v_u_36.Handle:PivotTo(v35:GetPivot())
                        v_u_36.Parent = v35
                        local v37 = Instance.new("Weld")
                        v37.Part0 = v_u_36.Handle
                        v37.Part1 = v35:FindFirstChild("UpperTorso")
                        v37.Parent = v_u_36.Handle
                        v_u_7.delay(5):andThen(function()
                            return v_u_8.new(v_u_36.Handle, TweenInfo.new(1), {
                                ["Transparency"] = 1
                            })
                        end):finally(function()
                            v_u_36:Destroy()
                        end)
                    else
                        v_u_9.emit_poof(v_u_20.PrimaryPart.Position, 15, 1)
                    end
                    v_u_30:cancel()
                end
            else
                return
            end
        end)
    end
end
function v11.client_use(p39, p40)
    if v_u_13 then
        return
    else
        v_u_13 = true
        local v41 = v_u_10.get(v_u_1.LocalPlayer, {
            "Character",
            p39.tool,
            "ModelHandle",
            "LaunchPart"
        })
        if v41 then
            local v42 = v41.Position + v41.CFrame.LookVector * 0.8
            local v43 = v41.CFrame.LookVector
            if p40 == "WorldTap" then
                v43 = v_u_5.get_aim_direction(v42, 80, 55)
            end
            v_u_4.get("ToolAPI/LaunchNetzooka"):InvokeServer(p39, v43)
            v_u_38(v_u_1.LocalPlayer, p39, v43)
            v_u_7.delay(2):andThen(function()
                v_u_13 = false
            end)
        else
            v_u_13 = false
        end
    end
end
function v11.equip(_)
    local v44 = v_u_1.LocalPlayer.Character
    if v44 then
        v44 = v44:FindFirstChild("HumanoidRootPart")
    end
    v_u_3("InteractionsEngine"):set_tag_exclusive("HoldingNetzookaToy", true)
    if v44 then
        v_u_6.FX:play("WBTagEquipNetzooka", v44)
    end
end
function v11.unequip()
    v_u_3("InteractionsEngine"):set_tag_exclusive("HoldingNetzookaToy", false)
end
function v11.replicate_launched_net(p45, p46, p47)
    v_u_38(p45, p46, p47)
end
return v11