--// ReplicatedStorage.CmdrClient.Commands.clear (ModuleScript)

local v_u_1 = game:GetService("Players")
return {
    ["Name"] = "clear",
    ["Aliases"] = {},
    ["Description"] = "Clear all lines above the entry line of the Cmdr window.",
    ["Group"] = "DefaultUtil",
    ["Args"] = {},
    ["ClientRun"] = function()
        local v2 = v_u_1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Cmdr")
        local v3 = v2:WaitForChild("Frame")
        if v2 and v3 then
            for _, v4 in pairs(v3:GetChildren()) do
                if v4.Name == "Line" and v4:IsA("TextBox") then
                    v4:Destroy()
                end
            end
        end
        return ""
    end
}