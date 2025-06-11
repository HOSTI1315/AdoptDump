--// ReplicatedStorage.CmdrClient.DefaultEventHandlers (ModuleScript)

local v_u_1 = game:GetService("StarterGui")
local v_u_2 = game:GetService("TextChatService")
local v_u_3 = require(script.Parent.CmdrInterface.Window)
return function(p4)
    p4:HandleEvent("Message", function(p5)
        if v_u_2.ChatVersion == Enum.ChatVersion.LegacyChatService then
            v_u_1:SetCore("ChatMakeSystemMessage", {
                ["Text"] = ("[Announcement] %s"):format(p5),
                ["Color"] = Color3.fromRGB(249, 217, 56)
            })
        else
            v_u_2.TextChannels.RBXSystem:DisplaySystemMessage((("<font color=\"rgb(249, 217, 56)\">[Announcement] %*</font>"):format(p5)))
        end
    end)
    p4:HandleEvent("AddLine", function(...)
        v_u_3:AddLine(...)
    end)
end