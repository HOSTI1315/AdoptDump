--// ReplicatedStorage.ClientServices.FriendsClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("CoreCall")
local v_u_4 = v1("SimpleEvents")
local v5 = v1("Signal")
local v_u_6 = v1("package:Promise")
local v_u_7 = v1("package:Sift")
local v_u_8 = game:GetService("Players")
local v9 = {}
local v_u_10 = {
    ["all"] = {},
    ["server"] = {}
}
local v_u_11 = v5.new()
local v_u_12 = v5.new()
local v_u_13 = v5.new()
local function v_u_19(p14)
    local v15 = v_u_8:GetFriendsAsync(p14 < 0 and 13953438 or p14)
    local v16 = 0
    local v17 = {}
    while v16 < 1000 do
        for _, v18 in ipairs(v15:GetCurrentPage()) do
            v17[v18.Id] = {
                ["user_id"] = v18.Id,
                ["username"] = v18.Username,
                ["display_name"] = v18.DisplayName
            }
            v16 = v16 + 1
        end
        if v15.IsFinished then
            break
        end
        v15:AdvanceToNextPageAsync()
    end
    return {
        ["all"] = v17,
        ["server"] = {}
    }
end
function v9.promise_get_is_friends_with(p_u_20)
    return v_u_6.resolve():andThen(function()
        return v_u_10.all[p_u_20] ~= nil
    end)
end
function v9.get_friends()
    return v_u_6.resolve():andThen(function()
        return v_u_7.Dictionary.copyDeep(v_u_10)
    end)
end
function v9.get_friend_changed_signal()
    return v_u_12
end
function v9.get_friends_in_server_changed_signal()
    return v_u_13
end
function v9.init()
    v_u_6.try(function()
        v_u_10 = v_u_19(v_u_8.LocalPlayer.UserId)
    end):catch(function(p21)
        warn(("Failed to get friends list for local player. Not retrying. Reason: %s"):format((tostring(p21))))
    end):finally(function()
        v_u_4.get("PlayerAddedPlusExisting"):Connect(function(p22)
            if v_u_10.all[p22.UserId] then
                v_u_10.server[p22.UserId] = p22
                v_u_13:Fire()
            end
        end)
        v_u_11:Fire()
    end)
    v_u_8.PlayerRemoving:Connect(function(p23)
        v_u_10.server[p23.UserId] = nil
        v_u_13:Fire()
    end)
    task.spawn(function()
        local _, v24 = v_u_3("GetCore", "PlayerFriendedEvent")
        v24.Event:Connect(function(p25)
            if v_u_10.all[p25.UserId] == nil then
                if v_u_2.get("FriendsAPI/FriendAdded"):InvokeServer(p25) then
                    v_u_10.all[p25.UserId] = {
                        ["user_id"] = p25.UserId,
                        ["username"] = p25.Name,
                        ["display_name"] = p25.DisplayName
                    }
                    v_u_10.server[p25.UserId] = p25
                    v_u_12:Fire(p25, true)
                    v_u_13:Fire()
                end
            end
        end)
        local _, v26 = v_u_3("GetCore", "PlayerUnfriendedEvent")
        v26.Event:Connect(function(p27)
            if v_u_10.all[p27.UserId] ~= nil then
                if v_u_2.get("FriendsAPI/FriendRemoved"):InvokeServer(p27) then
                    v_u_10.all[p27.UserId] = nil
                    v_u_10.server[p27.UserId] = nil
                    v_u_12:Fire(p27, false)
                    v_u_13:Fire()
                end
            end
        end)
    end)
end
return v9