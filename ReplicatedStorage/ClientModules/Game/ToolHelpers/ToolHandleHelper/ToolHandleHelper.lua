--// ReplicatedStorage.ClientModules.Game.ToolHelpers.ToolHandleHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("CollisionsClient")
local v_u_3 = v1("Utilities")
local v_u_19 = {
    ["get_equipped_tool_model_handle"] = function()
        local v4 = nil
        for _, v5 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v5:IsA("Tool") and v5:FindFirstChild("ModelHandle") then
                v4 = v5.ModelHandle
            end
        end
        return v4
    end,
    ["get_largest_part"] = function(p6)
        if typeof(p6) == "instance" then
            p6 = p6:GetDescendants()
        end
        local v7 = nil
        local v8 = 0
        if p6 and #p6 >= 1 then
            for _, v9 in pairs(p6) do
                if v9:IsA("BasePart") and (v9.Transparency ~= 1 and v8 < v9.Size.magnitude) then
                    v8 = v9.Size.magnitude
                    v7 = v9
                end
            end
        end
        return v7
    end,
    ["prep_handle_for_drop"] = function(p10, p11)
        local v12 = (p11 or {}).cancollide
        local v13 = v12 == nil and true or v12
        local v14 = {}
        for _, v15 in pairs(p10:GetDescendants()) do
            if v15:IsA("BasePart") then
                if string.find(v15.Name, "Mount") then
                    v15:Destroy()
                else
                    v15.CanCollide = v13
                    v15.Anchored = false
                    v15.CustomPhysicalProperties = PhysicalProperties.new(2, 1, 0)
                    table.insert(v14, v15)
                end
            end
        end
        (function(p16)
            if p16 and #p16 > 1 then
                for _, v17 in pairs(p16) do
                    if v17 ~= p16[1] then
                        v_u_3.weld(p16[1], v17)
                    end
                end
            end
        end)(v14)
        local v18 = v_u_19.get_largest_part(v14)
        v_u_2.set_model_collision_group(p10, "noncollide")
        p10.Parent = workspace
        game:GetService("Debris"):AddItem(p10, 150)
        return p10, v18
    end
}
return v_u_19