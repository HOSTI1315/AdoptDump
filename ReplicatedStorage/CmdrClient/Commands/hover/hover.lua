--// ReplicatedStorage.CmdrClient.Commands.hover (ModuleScript)

local v_u_1 = game:GetService("Players")
return {
    ["Name"] = "hover",
    ["Description"] = "Returns the name of the player you are hovering over.",
    ["Group"] = "DefaultUtil",
    ["Args"] = {},
    ["ClientRun"] = function()
        local v2 = v_u_1.LocalPlayer:GetMouse().Target
        if not v2 then
            return ""
        end
        local v3 = v_u_1:GetPlayerFromCharacter(v2:FindFirstAncestorOfClass("Model"))
        return v3 and v3.Name or ""
    end
}