--// ReplicatedStorage.ClientServices.Order_01.AdoptMeChatClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("TranslationHelper")
local v_u_3 = v_u_1("SettingsHelper")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = game:GetService("TextChatService")
local v_u_7 = game:GetService("Players")
local v8 = {}
local v_u_9 = nil
local function v_u_12()
    if v_u_5.get("dev_watchmode") then
        local v_u_10 = v_u_6:WaitForChild("CustomTextChannels"):WaitForChild("WatchMode")
        v_u_9 = v_u_4.get_event("MsgAPI/WatchModeMsg").OnClientEvent:Connect(function(p11)
            v_u_10:DisplaySystemMessage(("<font color=\'#FFFF00\'>%s</font>"):format(p11))
        end)
    elseif v_u_9 ~= nil then
        v_u_9:Disconnect()
    end
end
local function v_u_32()
    local v13 = v_u_6:WaitForChild("ChatWindowConfiguration")
    local v14 = v_u_6:WaitForChild("ChatInputBarConfiguration")
    local v15 = v_u_6:WaitForChild("BubbleChatConfiguration")
    v13.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v13.BackgroundTransparency = 0.6
    v13.TextColor3 = Color3.fromRGB(255, 255, 255)
    v13.FontFace = Font.fromEnum(Enum.Font.SourceSansBold)
    v13.TextSize = 18
    v13.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v13.TextStrokeTransparency = 0.7
    v14.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v14.BackgroundTransparency = 0.6
    v14.TextColor3 = Color3.fromRGB(255, 255, 255)
    v14.FontFace = Font.fromEnum(Enum.Font.SourceSansBold)
    v14.TextSize = 18
    v14.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v14.TextStrokeTransparency = 1
    v15.Enabled = false
    local v16 = v_u_6:WaitForChild("TextChatCommands")
    v16:WaitForChild("RBXTeamCommand").Enabled = false
    v_u_4.get_event("MsgAPI/DisplayServerMsg").OnClientEvent:connect(function(p17, p18, p19)
        if p17 and p17:IsA("TextChannel") then
            p17:DisplaySystemMessage("<font color=\'#660E66\'>[Server]: </font><font color=\'#" .. ((not p19 or typeof(p19) ~= "Color3") and "FFFF00" or p19:ToHex()) .. "\'>" .. v_u_2.translate(workspace, p18) .. "</font>")
        end
    end)
    v_u_6:WaitForChild("TextChannels"):WaitForChild("RBXGeneral"):DisplaySystemMessage("<font color=\'#FFFF00\'>Welcome to Adopt Me! Type /help for a list of commands.</font>")
    function v_u_6.OnIncomingMessage(p20)
        local v21 = Instance.new("TextChatMessageProperties")
        if p20.TextSource then
            local v22 = v_u_7:GetPlayerByUserId(p20.TextSource.UserId)
            local v23
            if v22 then
                v23 = v22:GetAttribute("forced_chat_tags")
            else
                v23 = v22
            end
            local v24 = (not v23 or #v23 <= 0) and {} or string.split(v23, ",")
            if not v_u_3.get_setting_server({
                ["player"] = v22,
                ["setting_id"] = "display_vip"
            }) then
                for v25, v26 in v24 do
                    if v26 == "VIP" then
                        table.remove(v24, v25)
                        break
                    end
                end
            end
            if v_u_3.get_setting_server({
                ["player"] = v22,
                ["setting_id"] = "display_rank"
            }) then
                local v27
                if v22 then
                    v27 = v22:GetAttribute("optional_chat_tags")
                else
                    v27 = v22
                end
                for _, v28 in (not v27 or #v27 <= 0) and {} or string.split(v27, ",") do
                    table.insert(v24, v28)
                end
            end
            if v22 then
                if v24 and #v24 > 0 then
                    v21.PrefixText = "<font color=\'#FFFF00\'>[" .. table.concat(v24, "][") .. "]</font>  [@" .. v22.Name .. "]:"
                else
                    v21.PrefixText = "[@" .. v22.Name .. "]:"
                end
                if not p20.TextSource.CanSend then
                    p20.Status = Enum.TextChatMessageStatus.InvalidTextChannelPermissions
                end
            end
        end
        return v21
    end
    v_u_5.register_callback("dev_watchmode", function()
        v_u_12()
    end)
    v_u_1("ClientABTests")
    for _, v29 in script.ChatCommands:GetChildren() do
        local v30 = require(v29)
        local v31 = Instance.new("TextChatCommand")
        if v30.Enabled ~= nil then
            v31.Enabled = v30.Enabled
        end
        if v30.triggered then
            v31.Triggered:Connect(v30.triggered)
        end
        v31.PrimaryAlias = v30.PrimaryAlias
        v31.SecondaryAlias = v30.SecondaryAlias
        v31.Name = v29.Name
        v31.Parent = v16
        v30.instance = v31
        if v30.init then
            v30.init(v31)
        end
    end
end
function v8.init()
    task.spawn(v_u_32)
end
return v8