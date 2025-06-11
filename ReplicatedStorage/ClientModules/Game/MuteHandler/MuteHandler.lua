--// ReplicatedStorage.ClientModules.Game.MuteHandler (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("CoreCall")
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("TextChatService")
local v_u_6 = 0
local v_u_7 = {}
local v_u_8 = {}
local function v_u_13(p9, p10, p11)
    if p9 == v_u_4.LocalPlayer then
        return false
    end
    if v_u_7[p9.UserId] == p10 then
        return false
    end
    v_u_7[p9.UserId] = p10 and true or nil
    if p10 then
        v_u_6 = v_u_6 + 1
    else
        v_u_6 = v_u_6 - 1
    end
    for _, v12 in v_u_5:GetDescendants() do
        if v12:IsA("TextSource") and v12.UserId == p9.UserId then
            v12.CanSend = not p10
        end
    end
    v_u_2.get("MsgAPI/SetPlayerMuted"):FireServer({
        ["user_id"] = p9.UserId,
        ["should_mute"] = p10,
        ["muted_count"] = v_u_6,
        ["source"] = p11
    })
    return true
end
function v_u_8.mute(p14, p15)
    if v_u_8.is_muted(p14) then
        return false
    end
    local v16 = v_u_1("UIManager").apps.DialogApp
    if p15 ~= "roblox-block" and v_u_8.is_muting_enabled() and v16:dialog({
        ["text"] = ("Are you sure you want to mute %*?"):format(p14.Name),
        ["left"] = "No",
        ["right"] = "Yes"
    }) ~= "Yes" then
        return false
    end
    if not v_u_13(p14, true, p15) then
        return false
    end
    if p15 ~= "roblox-block" and v_u_8.is_muting_enabled() then
        v16:dialog({
            ["text"] = ("%* has been muted for the rest of the session."):format(p14.Name),
            ["button"] = "Okay"
        })
    end
    return true
end
function v_u_8.unmute(p17, p18)
    if not v_u_13(p17, false, p18) then
        return false
    end
    if p18 ~= "roblox-block" and v_u_8.is_muting_enabled() then
        v_u_1("UIManager").apps.HintApp:hint({
            ["text"] = ("%* has been unmuted."):format(p17.Name),
            ["yields"] = false,
            ["overridable"] = true,
            ["length"] = 4
        })
    end
    return true
end
function v_u_8.is_muted(p19)
    if v_u_8.is_muting_enabled() then
        return v_u_7[p19.UserId] == true
    else
        return false
    end
end
function v_u_8.is_muting_enabled()
    return true
end
function v_u_8.init()
    v_u_5.DescendantAdded:Connect(function(p20)
        if p20:IsA("TextSource") and v_u_7[p20.UserId] then
            p20.CanSend = false
        end
    end)
    if v_u_4.LocalPlayer.UserId > 0 then
        local v_u_21 = {}
        local function v_u_27()
            local v22, v23 = v_u_3("GetCore", "GetBlockedUserIds")
            if not v22 then
                return false
            end
            for _, v24 in v_u_4:GetPlayers() do
                local v25 = table.find(v23, v24.UserId) ~= nil
                local v26 = table.find(v_u_21, v24.UserId) ~= nil
                if v25 ~= v26 then
                    if v25 then
                        v_u_8.mute(v24, "roblox-block")
                    elseif v26 then
                        v_u_8.unmute(v24, "roblox-block")
                    end
                end
            end
            v_u_21 = v23
            return true
        end
        task.defer(function()
            if not v_u_27() then
                warn("GetCore(\'GetBlockedUserIds\') failed. Blocked users will not be auto muted.")
            end
            local v28, v29 = v_u_3("GetCore", "PlayerBlockedEvent")
            if v28 then
                v29.Event:Connect(v_u_27)
            else
                warn("GetCore(\'PlayerBlockedEvent\') failed. Blocking users will not mute them.")
            end
            local v30, v31 = v_u_3("GetCore", "PlayerUnblockedEvent")
            if v30 then
                v31.Event:Connect(v_u_27)
            else
                warn("GetCore(\'PlayerUnblockedEvent\') failed. Unblocking users will not unmute them.")
            end
        end)
    end
end
return v_u_8