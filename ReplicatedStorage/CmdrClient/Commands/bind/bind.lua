--// ReplicatedStorage.CmdrClient.Commands.bind (ModuleScript)

local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("TextChatService")
local v16 = {
    ["Name"] = "bind",
    ["Aliases"] = {},
    ["Description"] = "Binds a command string to a key or mouse input.",
    ["Group"] = "DefaultUtil",
    ["Args"] = {
        {
            ["Type"] = "userInput ! bindableResource @ player",
            ["Name"] = "Input",
            ["Description"] = "The key or input type you\'d like to bind the command to."
        },
        {
            ["Type"] = "command",
            ["Name"] = "Command",
            ["Description"] = "The command you want to run on this input"
        },
        {
            ["Type"] = "string",
            ["Name"] = "Arguments",
            ["Description"] = "The arguments for the command",
            ["Default"] = ""
        }
    },
    ["ClientRun"] = function(p_u_3, p_u_4, p5, p6)
        local v7 = p_u_3:GetStore("CMDR_Binds")
        local v_u_8 = p5 .. " " .. p6
        if v7[p_u_4] then
            v7[p_u_4]:Disconnect()
        end
        local v9 = p_u_3:GetArgument(1).Type.Name
        if v9 == "userInput" then
            v7[p_u_4] = v_u_1.InputBegan:Connect(function(p10, p11)
                if not p11 then
                    if p10.UserInputType == p_u_4 or p10.KeyCode == p_u_4 then
                        p_u_3:Reply(p_u_3.Dispatcher:EvaluateAndRun(p_u_3.Cmdr.Util.RunEmbeddedCommands(p_u_3.Dispatcher, v_u_8)))
                    end
                end
            end)
        else
            if v9 == "bindableResource" then
                return "Unimplemented..."
            end
            if v9 == "player" then
                local function v_u_14(p12)
                    local v13 = p_u_3.Cmdr.Util.RunEmbeddedCommands(p_u_3.Dispatcher, p_u_3.Cmdr.Util.SubstituteArgs(v_u_8, { p12 }))
                    p_u_3:Reply(("%s $ %s : %s"):format(p_u_4.Name, v13, p_u_3.Dispatcher:EvaluateAndRun(v13)), Color3.fromRGB(244, 92, 66))
                end
                if v_u_2.ChatVersion == Enum.ChatVersion.LegacyChatService then
                    v7[p_u_4] = p_u_4.Chatted:Connect(v_u_14)
                else
                    v7[p_u_4] = v_u_2.SendingMessage:Connect(function(p15)
                        v_u_14(p15.Text)
                    end)
                end
            end
        end
        return "Bound command to input."
    end
}
return v16