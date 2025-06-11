--// ReplicatedStorage.ClientModules.Game.ToolHelpers.GrapplingHook (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Raycast")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("ObbyM")
local v_u_5 = v1("UIManager")
local v_u_6 = v1("PlatformM")
local v_u_7 = v1("Signal")
local v_u_8 = v1("Debug").create_log()
local v_u_9 = game:GetService("RunService")
local v_u_10 = game:GetService("UserInputService")
local v_u_81 = {
    ["use"] = function(p11)
        local _, v12 = v_u_2.mousecast()
        v_u_81.shoot_grapple(p11, v12)
    end,
    ["shoot_grapple"] = function(p_u_13, p14)
        p_u_13.use_hash = (p_u_13.use_hash or 0) + 1
        local v_u_15 = p_u_13.use_hash
        v_u_3.get("ToolAPI/CancelGrapplingHook"):FireServer()
        if v_u_4.is_in_obby() then
            return
        elseif not game.Players.LocalPlayer.Character.Humanoid.Sit then
            local v16 = p_u_13.tool
            local v17 = v16.ModelHandle.Hook
            local v18
            if v17:IsA("Model") then
                v18 = v17.PrimaryPart.Position
            else
                v18 = v17.Position
            end
            v_u_3.get("ToolAPI/FireGrapplingHook"):FireServer(v18, p14)
            v_u_81.fire_projectile(game.Players.LocalPlayer, v16, v18, p14, function(_)
                return p_u_13.use_hash == v_u_15
            end)
        end
    end,
    ["fire_projectile"] = function(p19, p_u_20, p_u_21, p22, p_u_23)
        local v_u_24 = (p22 - p_u_21).unit * 440
        local v_u_25 = p19 == game.Players.LocalPlayer
        local v_u_26 = p19.Character
        local v_u_27 = 0
        local v_u_28 = 0
        local v_u_29 = p_u_21
        local v_u_30 = p_u_21
        local v_u_31 = nil
        local v_u_32 = p_u_20.ModelHandle.Hook
        local v_u_33 = v_u_32:Clone()
        v_u_33.Name = "HookClone"
        local v_u_34 = v_u_32:IsA("Model")
        if v_u_34 then
            for _, v35 in ipairs(v_u_32:GetChildren()) do
                v35.Transparency = 1
            end
            for _, v36 in ipairs(v_u_33:GetChildren()) do
                v36.Transparency = v36:GetAttribute("OriginalTransparency") or 0
                v36.Anchored = true
            end
        else
            v_u_32.Transparency = 1
            v_u_33.Anchored = true
        end
        v_u_33.Parent = p_u_20
        local v_u_37 = p_u_20.ModelHandle.ProjectileRopeSource
        local v_u_38 = v_u_37.Attachment1
        v_u_38.CFrame = CFrame.new()
        local v_u_39 = v_u_37:FindFirstChild("ParticleAttachment")
        if v_u_39 then
            v_u_39.Parent = v_u_38.Parent
            v_u_39.CFrame = v_u_38.CFrame
        end
        local v_u_40 = v_u_37.Attachment0
        coroutine.wrap(function()
            while true do
                if p_u_20.Parent == nil or (v_u_27 >= 4 or not p_u_23(v_u_27)) then
                    if v_u_33.Parent ~= nil then
                        v_u_33:Destroy()
                    end
                    if v_u_25 then
                        if v_u_31 then
                            v_u_3.get("ToolAPI/StickGrapplingHook"):FireServer(v_u_31)
                            v_u_38.CFrame = v_u_37.CFrame:toObjectSpace(CFrame.new(v_u_31))
                        else
                            v_u_8("NO PROJECTILE HIT")
                            v_u_38.CFrame = v_u_40.CFrame
                        end
                    else
                        v_u_38.CFrame = v_u_40.CFrame
                        return
                    end
                end
                local v41 = v_u_29
                local v42 = v_u_24.y * v_u_27 - v_u_27 ^ 2 * 15
                local v43 = p_u_21
                local v44 = v_u_24.x * v_u_27
                local v45 = v_u_24.z * v_u_27
                v_u_29 = v43 + Vector3.new(v44, v42, v45)
                if v_u_28 > 0.05 then
                    v_u_28 = 0
                    local v46 = Ray.new(v_u_30, v_u_29 - v_u_30)
                    local v47, v48 = v_u_2.FindPartOnRay(v46, { v_u_26 }, nil, {
                        ["ignore_transparent"] = false
                    })
                    v_u_30 = v48
                    if v47 ~= nil and v47.Anchored then
                        v_u_31 = v48
                        break
                    end
                end
                local v49 = v_u_32:GetAttribute("HookRotationOffset") or Vector3.new(0, 0, 0)
                if not v49 then
                    break
                end
                local v50 = CFrame.Angles
                local v51 = v49.x
                local v52 = math.rad(v51)
                local v53 = v49.y
                local v54 = math.rad(v53)
                local v55 = v49.z
                v59 = v50(v52, v54, (math.rad(v55)))
                if not v59 then
                    break
                end
                ::l11::
                local v56 = CFrame.new(v41, v_u_29) * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.Angles(1.5707963267948966, 0, 0) * v59
                local v57 = v56 - v56.p + v_u_29
                if v_u_34 then
                    v_u_33:SetPrimaryPartCFrame(v57)
                else
                    v_u_33.CFrame = v57
                end
                v_u_38.CFrame = v_u_37.CFrame:toObjectSpace(CFrame.new(v_u_29))
                if v_u_39 then
                    v_u_39.CFrame = v_u_38.CFrame
                end
                local v58 = v_u_9.Heartbeat:Wait()
                v_u_27 = v_u_27 + v58
                v_u_28 = v_u_28 + v58
            end
            local v59 = CFrame.identity
            goto l11
        end)()
    end,
    ["cancel_grapple"] = function(p60)
        v_u_3.get("ToolAPI/CancelGrapplingHook"):FireServer()
        local v61 = p60.tool
        v61.ModelHandle.ProjectileRopeSource.Attachment1.CFrame = v61.ModelHandle.ProjectileRopeSource.Attachment0.CFrame
        local v62 = v61.ModelHandle.ProjectileRopeSource:FindFirstChild("ParticleAttachment")
        if v62 then
            v62.CFrame = CFrame.new()
        end
        p60.cancel_signal:Fire()
    end,
    ["get_cancel_signal"] = function(p63)
        return p63.cancel_signal
    end,
    ["equipped"] = function(p_u_64)
        local v65 = v_u_6.get_platform()
        local v_u_66 = v65 == v_u_6.platform.phone and true or v65 == v_u_6.platform.tablet
        spawn(function()
            v_u_5.apps.HintApp:hint({
                ["text"] = ("%s anywhere to fire grappling hook"):format(v_u_66 and "Tap" or "Click"),
                ["length"] = 5
            })
        end)
        local v_u_67 = game.Players.LocalPlayer.Character
        local function v_u_76(p68, p69, p70)
            local v71 = p_u_64.use_hash
            local v72 = p68.ModelHandle.ProjectileRopeSource
            local v73 = v72.Attachment1
            local v74 = v72:FindFirstChild("ParticleAttachment")
            local v75 = 0
            while p69.Parent ~= nil and (p70.Length > 4 and not v_u_67.Humanoid.Sit) do
                p70.Length = p70.Length - v75 * 60
                v73.CFrame = v72.CFrame:toObjectSpace(CFrame.new(p70.Attachment1.WorldCFrame.p))
                if v74 then
                    v74.CFrame = v73.CFrame
                end
                v75 = v_u_9.Heartbeat:wait()
            end
            v73.CFrame = v72.Attachment0.CFrame
            if p_u_64.use_hash == v71 and p70.Length < 4 then
                if v_u_67.Humanoid:GetState() ~= Enum.HumanoidStateType.Seated then
                    v_u_67.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                v_u_81.cancel_grapple(p_u_64)
            end
            if p69.Parent ~= nil then
                p69:Destroy()
            end
        end
        p_u_64.child_added_connection = p_u_64.tool.ChildAdded:Connect(function(p77)
            if p77.Name == "GrappleParts" then
                local v78 = p77:WaitForChild("GrappleRope", 10)
                v78.Visible = false
                if v78 then
                    v_u_76(p_u_64.tool, p77, v78)
                end
            end
        end)
        local v_u_79 = 0
        p_u_64.uis_connection = v_u_10.JumpRequest:Connect(function()
            if tick() - v_u_79 > 0.5 then
                v_u_79 = tick()
                if p_u_64.tool:FindFirstChild("GrappleParts") then
                    v_u_81.cancel_grapple(p_u_64)
                end
            end
        end)
        p_u_64.cancel_signal = v_u_7.new()
    end,
    ["unequipped"] = function(p80)
        p80.child_added_connection:Disconnect()
        p80.uis_connection:Disconnect()
        p80.cancel_signal:Destroy()
        p80.cancel_signal = nil
    end
}
local v_u_82 = {}
function v_u_81.replicate_fired_grappling_hook(p_u_83, p84, p85, p86)
    v_u_82[p_u_83] = v_u_82[p_u_83] or 0
    local v_u_87 = v_u_82[p_u_83]
    v_u_81.fire_projectile(p_u_83, p84, p85, p86, function(_)
        return v_u_82[p_u_83] == v_u_87
    end)
end
return v_u_81