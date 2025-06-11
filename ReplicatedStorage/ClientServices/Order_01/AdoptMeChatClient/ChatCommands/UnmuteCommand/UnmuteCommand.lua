--// ReplicatedStorage.ClientServices.Order_01.AdoptMeChatClient.ChatCommands.UnmuteCommand (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("MuteHandler")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TextChatService")
local v_u_4 = {
    ["PrimaryAlias"] = "/unmute",
    ["SecondaryAlias"] = "/um",
    ["Enabled"] = v_u_1.is_muting_enabled()
}
local function v_u_9(p5, p6)
    local v7 = string.split(p5, " ")[2]:lower()
    if v7 then
        for _, v8 in v_u_2:GetPlayers() do
            if v7 == v8.Name:lower() then
                return v_u_1.unmute(v8, p6)
            end
        end
    end
end
function v_u_4.triggered(_, p10)
    return v_u_9(p10, "chat")
end
function v_u_4.init(_)
    local v11 = v_u_3:WaitForChild("TextChatCommands"):WaitForChild("RBXUnmuteCommand")
    v11.Enabled = not v_u_4.Enabled
    if v11.Enabled then
        v11.Triggered:Connect(function(_, p12)
            return v_u_9(p12, "roblox-default")
        end)
    end
end
return v_u_4