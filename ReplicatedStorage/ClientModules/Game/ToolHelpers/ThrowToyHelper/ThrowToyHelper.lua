--// ReplicatedStorage.ClientModules.Game.ToolHelpers.ThrowToyHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("Raycast")
local v_u_3 = v1("UIManager")
local v_u_4 = v1("ClientToolManager")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("AdoptMeEnums/PetEntities/PetObjectCreatorType")
local v_u_7 = v1("ToolHandleHelper")
local v_u_8 = v1("new:StreamingHelper")
local v_u_31 = {
    ["generic_throw_toy_use"] = function(p9, p10, p11)
        local v12 = p11 or {}
        local v13, v14 = v_u_31.can_use()
        if v13 then
            local v15 = v_u_5.get("PetObjectAPI/CreatePetObject"):InvokeServer(v_u_6.DroppableToy, {
                ["unique_id"] = p9.unique,
                ["performance_name"] = v12.performance_name,
                ["reaction_name"] = v12.reaction_name,
                ["cleanup_when_touch_water"] = v12.cleanup_when_touch_water,
                ["pet_unique"] = v12.pet_unique,
                ["spawn_cframe"] = v12.spawn_cframe
            })
            local v16 = v_u_8.await(v15, 15)
            if v16 then
                v_u_4.unequip(p9, {
                    ["from_throw_toy"] = true
                })
                local v17 = v_u_31.calculate_throw_direction(p10)
                if v12.custom_throw_function then
                    v12.custom_throw_function(v16, v17)
                    return v16
                else
                    v_u_31.throw(v16, v17)
                    return v16
                end
            else
                return
            end
        else
            if v14 ~= nil then
                v_u_3.apps.HintApp:hint({
                    ["text"] = v14,
                    ["overridable"] = true,
                    ["length"] = 2.5,
                    ["yields"] = false
                })
            end
            return
        end
    end,
    ["can_use"] = function()
        local v18 = game.Players.LocalPlayer.Character
        if v18:FindFirstChild("Humanoid") and v18:FindFirstChild("HumanoidRootPart") then
            return true
        else
            return false, nil
        end
    end,
    ["calculate_throw_direction"] = function(p19)
        local v20 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if p19 == "UIButton" then
            return v20.CFrame
        end
        local _, v22 = v_u_2.mousecast(nil, nil, nil, nil, {
            ["ignore_non_cancollide"] = true,
            ["ignore_transparent"] = true,
            ["ignore_function"] = function(p21)
                return p21:IsDescendantOf(game.Players.LocalPlayer.Character)
            end
        })
        return CFrame.new(v20.Position, v22)
    end,
    ["throw"] = function(p23, p24)
        local v25 = v_u_7.get_largest_part(p23:GetDescendants())
        local v26 = math.random(-30, 30)
        local v27 = p23:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(v26), 0)
        v25.AssemblyLinearVelocity = p24.LookVector * 90 + Vector3.new(0, 20, 0)
        local v28 = math.random()
        local v29 = math.random()
        local v30 = math.random
        v25.AssemblyAngularVelocity = Vector3.new(v28, v29, v30()) * 12
        p23:SetPrimaryPartCFrame(v27)
    end
}
return v_u_31