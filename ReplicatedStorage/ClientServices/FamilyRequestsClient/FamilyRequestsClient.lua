--// ReplicatedStorage.ClientServices.FamilyRequestsClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("UIManager")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = v_u_1("SettingsHelper")
local v_u_6 = v_u_1("Debug").create_log()
local v7 = {}
local v_u_8 = {}
local v_u_9 = {}
local function v_u_14(p10)
    if not v_u_1("MinigameForcedState").can_receive_invites() then
        return "Decline"
    end
    if v_u_8[p10] and tick() - v_u_8[p10] < 0 then
        return "Please Wait"
    end
    local v11 = v_u_2.get_server(p10, "family_list") or {}
    local v12 = v_u_5.get_setting_client({
        ["setting_id"] = "family_requests"
    })
    v_u_6("Family_requests:", v12)
    local v13 = nil
    if v12 then
        v13 = v12 == "No One" and "Decline" or (v12 == "Friends" and not p10:IsFriendsWith(game.Players.LocalPlayer.UserId) and "Decline" or v13)
    end
    if v13 == nil then
        v13 = v_u_3.apps.DialogApp:dialog({
            ["text"] = "You\'ve been invited to " .. p10.Name .. "\'s family of " .. #v11,
            ["left"] = "Decline",
            ["right"] = "Accept",
            ["image_size"] = UDim2.new(0, 125, 0, 125),
            ["image"] = "https://www.roblox.com/headshot-thumbnail/image?width=150&height=150&format=png&userid=" .. p10.UserId
        })
    end
    if v13 == "Accept" then
        v_u_9[p10] = 0
        return v13
    end
    v_u_9[p10] = v_u_9[p10] and (v_u_9[p10] + 1 or 1) or 1
    v_u_8[p10] = tick() + 20 * v_u_9[p10]
    return v13
end
function v7.init()
    v_u_4.get_event("FamilyAPI/AcceptDeclineInvite").OnClientInvoke = v_u_14
end
return v7