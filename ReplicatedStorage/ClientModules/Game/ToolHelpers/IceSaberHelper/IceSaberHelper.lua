--// ReplicatedStorage.ClientModules.Game.ToolHelpers.IceSaberHelper (ModuleScript)

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = require(v3:WaitForChild("Fsys")).load
local v_u_5 = v4("GameplayFX")
local v_u_6 = v4("SoundPlayer")
local v_u_7 = v4("FamilyHelper")
local v_u_8 = v4("RouterClient")
local v_u_9 = v4("ToolDBHelper")
local v_u_10 = v4("ControlsDisabler")
local v_u_11 = v4("package:Promise")
local v12 = {}
local v_u_13 = game.ReplicatedStorage.Resources
local v_u_14 = Random.new()
local v_u_15 = false
local v_u_16 = {}
local function v_u_21(p17)
    local v18 = v_u_13:FindFirstChild("IceBlock"):Clone()
    local v19 = p17.UserId
    v18.Name = "ice_block_" .. tostring(v19)
    v18.Parent = workspace
    local v20 = p17.Character:FindFirstChild("HumanoidRootPart")
    v18:PivotTo(v20.CFrame)
    v_u_5.emit_poof(v20.CFrame.Position)
    v_u_6.FX:play("PlayerFrozen", v20)
    if p17 == v_u_1.LocalPlayer then
        v_u_10.disable_controls("ice_saber_ice_block")
    end
end
local function v_u_27(p22)
    local v23 = workspace
    local v24 = p22.UserId
    local v25 = v23:FindFirstChild("ice_block_" .. tostring(v24))
    local v26 = p22.Character:FindFirstChild("HumanoidRootPart")
    v_u_5.emit_poof(v26.CFrame.Position)
    v_u_6.FX:play("PlayerUnfrozen", v26)
    if v25 then
        v25:Destroy()
    end
    if p22 == v_u_1.LocalPlayer then
        v_u_10.enable_controls("ice_saber_ice_block")
    end
end
local function v_u_30(p28, p29)
    if p28 and (p29 and p28 ~= p29) then
        if p28 == v_u_1.LocalPlayer and not v_u_7.is_my_friend_or_family(p29) then
            return
        elseif p29 ~= v_u_1.LocalPlayer or v_u_7.is_my_friend_or_family(p28) then
            if not v_u_16[p28] or v_u_16[p28] <= DateTime.now().UnixTimestamp then
                return true
            end
        end
    else
        return
    end
end
local function v_u_33(p_u_31, p32)
    if v_u_30(p_u_31, p32) then
        v_u_16[p_u_31] = DateTime.now().UnixTimestamp + 10
        v_u_21(p_u_31)
        v_u_11.delay(1):finally(function()
            v_u_27(p_u_31)
        end)
    end
end
local function v_u_47(p_u_34, p35)
    v_u_6.FX:play("IceSaberSwing" .. v_u_14:NextInteger(1, 4))
    local v_u_36 = v_u_13:FindFirstChild("IceSaberProjectile"):Clone()
    local v37 = v_u_36.PrimaryPart
    v_u_36:PivotTo(p35)
    v_u_36.Parent = workspace
    local v38 = p_u_34.Character.PrimaryPart.Velocity.Magnitude * 3
    local v39 = p_u_34.Character.Humanoid.WalkSpeed * 2
    local v40 = math.max(v38, v39)
    local v41 = v37.AssemblyMass
    local v42 = Instance.new("Attachment")
    v42.Parent = v37
    local v43 = Instance.new("VectorForce")
    v43.Attachment0 = v42
    v43.Force = Vector3.new(0, 1, 0) * workspace.Gravity * v41
    v43.Parent = v37
    v37:ApplyImpulse(p35.LookVector * v40 * v41)
    if p_u_34 == v_u_1.LocalPlayer then
        local v_u_44 = nil
        v_u_44 = v_u_36:FindFirstChild("Hitbox").Touched:Connect(function(p45)
            local v46 = game.Players:GetPlayerFromCharacter(p45.Parent)
            if v_u_30(v46, p_u_34) then
                v_u_44:Disconnect()
                v_u_8.get("ToolAPI/HitIceSaber"):FireServer(v46)
                v_u_33(v46, p_u_34)
            end
        end)
    end
    v_u_11.delay(0.4):finally(function()
        v_u_36:Destroy()
    end)
end
function v12.client_use(p_u_48, p_u_49, p_u_50, _, _)
    local v51 = v_u_2:IsClient()
    assert(v51, "Attempted to call IceSaberHelper.client_use() on server")
    if not v_u_15 then
        v_u_15 = true
        v_u_11.all({ v_u_11.delay(0.3):finally(function()
                local v52 = v_u_1.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                v_u_8.get("ToolAPI/SwingIceSaber"):FireServer(v52)
                v_u_47(v_u_1.LocalPlayer, v52)
                return v_u_11.delay(0):finally(function()
                    v_u_15 = false
                end)
            end), v_u_11.try(function()
                return v_u_9.generic_client_use(p_u_48, p_u_49, p_u_50)
            end), v_u_11.delay(0.5) }):await()
    end
end
function v12.replicate_swing(p53, p54)
    local v55 = v_u_2:IsClient()
    assert(v55, "Attempted to call IceSaberHelper.replicate_swing() on server")
    v_u_47(p53, p54)
end
function v12.replicate_hit(p56, p57)
    local v58 = v_u_2:IsClient()
    assert(v58, "Attempted to call IceSaberHelper.replicate_hit() on server")
    v_u_33(p57, p56)
end
return v12