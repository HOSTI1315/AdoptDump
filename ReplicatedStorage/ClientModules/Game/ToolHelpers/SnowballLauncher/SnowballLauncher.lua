--// ReplicatedStorage.ClientModules.Game.ToolHelpers.SnowballLauncher (ModuleScript)

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("Debris")
local v3 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_4 = v3("PlatformM")
local v_u_5 = require(game.ReplicatedStorage.new.modules.Explorer)
local v_u_6 = v3("RouterClient")
local v_u_7 = v3("package:Promise")
local v_u_8 = Random.new()
local v_u_9 = game.ReplicatedStorage.Resources.SnowballLauncher
local v_u_10 = v_u_9.Sound.Launcher
local v_u_11 = false
local v_u_12 = v1.LocalPlayer
local v_u_13 = v_u_12:GetMouse()
local function v_u_16(p14)
    local v15 = Instance.new("Part")
    v15.Shape = Enum.PartType.Ball
    v15.Size = Vector3.new(p14, p14, p14)
    v15.Color = Color3.new(1, 1, 1)
    v15.Material = Enum.Material.Sand
    v15.CanCollide = false
    v15.Name = "Snowball"
    return v15
end
local function v_u_19(p17)
    local v18 = v_u_9.SnowballImpact:Clone()
    v18.CFrame = CFrame.new(p17)
    v18.Parent = workspace
    v18.Dots:Emit(3)
    v18.Clouds1:Emit(10)
    v18.Clouds2:Emit(5)
    v_u_2:AddItem(v18, 5)
end
local v_u_31 = {
    ["shoot_snowball"] = function(p20, p21)
        local v22 = v_u_5.get(p20, {
            "Character",
            "SnowballLauncherTool",
            "ModelHandle",
            "Nozzle"
        })
        local v23 = v_u_5.get(p20, {
            "Character",
            "SnowballLauncherTool",
            "ModelHandle",
            "Snowball"
        })
        local v_u_24 = v_u_5.get(p20, { "Character", "HumanoidRootPart" })
        local v25 = v_u_5.get(game.Players.LocalPlayer, { "Character", "HumanoidRootPart" })
        if v22 and (v_u_24 and v25) then
            if (v_u_24.Position - v25.Position).magnitude <= 500 then
                local v26 = v22.CFrame * CFrame.new(0, 0, -0.8)
                local v27 = workspace:FindFirstChild("Snowballs")
                if not v27 then
                    v27 = Instance.new("Folder")
                    v27.Name = "Snowballs"
                    v27.Parent = workspace
                end
                local v_u_28 = v_u_16(0.753)
                v_u_28.CFrame = v26
                v_u_28.Velocity = (CFrame.lookAt(Vector3.new(0, 0, 0), p21) * CFrame.fromEulerAnglesXYZ(0.17453292519943295, 0, 0)).LookVector * 150
                v_u_28.Parent = v27
                v_u_28.Touched:Connect(function(p29)
                    if p29.Transparency == 1 or not p29.CanCollide then
                        return
                    elseif not (v_u_24.Parent and p29:IsDescendantOf(v_u_24.Parent)) then
                        v_u_28:Destroy()
                        v_u_19(v_u_28.Position)
                    end
                end)
                v_u_7.delay(60):andThen(function()
                    if v_u_28 and v_u_28.Parent then
                        v_u_28:Destroy()
                    end
                end)
                v23.Transparency = 1
                v_u_7.delay(0.3):await()
                v23.Transparency = 0
            end
        else
            return
        end
    end,
    ["use"] = function()
        local v30
        if v_u_4.is_using_gamepad() then
            v30 = workspace.CurrentCamera.CFrame.LookVector
        else
            v30 = v_u_13.UnitRay.Direction
        end
        v_u_6.get("EventAPI/ShootSnowball"):FireServer(v30)
        v_u_10:FindFirstChild("SnowballLauncherFire" .. v_u_8:NextInteger(1, 4)):Play()
        v_u_31.shoot_snowball(v_u_12, v30)
    end,
    ["is_equipped"] = function()
        return v_u_11
    end,
    ["equip"] = function()
        v_u_10.SnowballLauncherEquip:Play()
        v_u_11 = true
    end,
    ["unequip"] = function()
        v_u_11 = false
    end
}
return v_u_31