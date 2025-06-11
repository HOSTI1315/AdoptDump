--// ReplicatedStorage.SharedModules.CharUtil (ModuleScript)

local v_u_1 = game:GetService("Players")
return {
    ["GetHumanoid"] = function(p2)
        while true do
            local v3 = p2:FindFirstChild("Humanoid")
            if v3 then
                if v3:IsA("Humanoid") then
                    return v3
                end
                for _, v4 in pairs(p2:GetChildren()) do
                    if v4.Name == "Humanoid" and v4:IsA("Humanoid") then
                        return v4
                    end
                end
            end
            if not (p2.Parent and p2:IsDescendantOf(workspace)) then
                return nil
            end
            p2 = p2.Parent
        end
    end,
    ["GetPlayerFromCharacter"] = function(p5)
        local v6 = v_u_1:GetPlayerFromCharacter(p5)
        while not v6 do
            if not (p5 and p5.Parent) then
                return nil
            end
            p5 = p5.Parent
            v6 = v_u_1:GetPlayerFromCharacter(p5)
        end
        return v6, p5
    end
}