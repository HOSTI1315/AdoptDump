--// ReplicatedStorage.ClientServices.TestLabScheduledChatsService (ModuleScript)

local v_u_1 = game:GetService("TextChatService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v3 = v2("ServerType")
local v_u_4 = v2("GrammarUtil")
local v_u_5 = v2("FormatHelper")
local v_u_6 = v2("new:TestLabConfig")
if not v3.use_test_lab_behavior() then
    return {}
end
local v7 = {}
local function v_u_12(p8)
    local v9
    if v_u_6.data_clearing.on then
        local v10 = v_u_6.data_clearing.seconds - workspace:GetServerTimeNow() % v_u_6.data_clearing.seconds
        local v11 = v_u_5.get_time_breakdown(v10)
        if v11.days > 1 then
            v9 = v11.days .. " " .. v_u_4.get_plural_or_singular(v11.days, "days", "day")
        elseif v11.hours > 1 then
            v9 = v11.hours .. " " .. v_u_4.get_plural_or_singular(v11.hours, "hours", "hour")
        else
            v9 = v11.minutes <= 1 and "less than a minute" or v11.minutes .. " " .. v_u_4.get_plural_or_singular(v11.minutes, "minutes", "minute")
        end
    else
        v9 = "never"
    end
    return string.gsub(p8, "$DATA_CLEAR_TIME_REMAINING", v9)
end
function v7.init()
    if v_u_6.scheduled_chats then
        for _, v_u_13 in v_u_6.scheduled_chats do
            local v_u_14 = v_u_13.delay or 0
            task.spawn(function()
                local v15 = v_u_1:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
                while true do
                    task.wait(v_u_13.interval - (workspace:GetServerTimeNow() - v_u_14) % v_u_13.interval)
                    v15:DisplaySystemMessage(v_u_12(v_u_13.message))
                end
            end)
        end
    end
end
return v7