--// ReplicatedStorage.ClientModules.Game.ToolHelpers.SimpleThrowToyHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
v1("Raycast")
v1("UIManager")
v1("InventoryDB")
v1("ClientData")
local v_u_2 = v1("ClientToolManager")
local v_u_3 = v1("RouterClient")
v1("ToolHandleHelper")
v1("StateManagerClient")
v1("CharWrapperClient")
local v_u_4 = v1("ToolHandleHelper")
local v_u_5 = v1("Raycast")
v1("package:Promise")
v1("AnimationManager")
v1("SimpleEvents")
local v_u_25 = {
    ["simple_throw_toy_use"] = function(p6, p7, p8)
        local v9 = p8 or {}
        local v10 = v_u_3.get("ToolAPI/CreateSimpleThrowToy"):InvokeServer({
            ["unique_id"] = p6.unique,
            ["animation_name"] = v9.animation_name,
            ["sound_name"] = v9.sound_name
        })
        if v10 then
            v_u_2.unequip(p6)
            local v11 = v_u_25.calculate_throw_direction(p7)
            v_u_25.throw(v10, v11, v9)
            v10:SetAttribute("Thrown", true)
            return v10
        end
    end,
    ["can_use"] = function(_)
        local v12 = game.Players.LocalPlayer.Character
        if v12:FindFirstChild("Humanoid") and v12:FindFirstChild("HumanoidRootPart") then
            return true
        else
            return false, nil
        end
    end,
    ["calculate_throw_direction"] = function(p13)
        local v14 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if p13 == "UIButton" then
            return v14.CFrame
        end
        local _, v16 = v_u_5.mousecast(nil, nil, nil, nil, {
            ["ignore_non_cancollide"] = true,
            ["ignore_transparent"] = true,
            ["ignore_function"] = function(p15)
                return p15:IsDescendantOf(game.Players.LocalPlayer.Character)
            end
        })
        return CFrame.new(v14.Position, v16)
    end,
    ["throw"] = function(p17, p18)
        local v19 = v_u_4.get_largest_part(p17:GetDescendants())
        local v20 = math.random(-5, 5)
        local v21 = p17:FindFirstChild("RootPart").CFrame * CFrame.Angles(0, math.rad(v20), 0)
        v19.AssemblyLinearVelocity = p18.LookVector * 90 + Vector3.new(0, 20, 0)
        local v22 = math.random()
        local v23 = math.random()
        local v24 = math.random
        v19.AssemblyAngularVelocity = Vector3.new(v22, v23, v24()) * 12
        p17:SetPrimaryPartCFrame(v21)
    end,
    ["init"] = function() end
}
return v_u_25