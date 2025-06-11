--// ReplicatedStorage.SharedModules.Game.LaunchDataHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("package:t")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("RunService")
local v4 = {}
local function v_u_9(p5)
    local v6 = v_u_3:IsServer()
    assert(v6, "Launch data can only be obtained on the server.")
    local v_u_7 = p5:GetJoinData().LaunchData
    if not v_u_7 then
        return nil
    end
    local v_u_8 = nil
    return pcall(function()
        v_u_8 = v_u_2:JSONDecode(v_u_7)
    end) and v_u_8 and v_u_8 or nil
end
local v_u_10 = v1.strictInterface({
    ["user_id"] = v1.integer,
    ["lobby_id"] = v1.string
})
function v4.try_get_minigame_lobby(p11)
    local v12 = v_u_9(p11)
    if not (v12 and v_u_10(v12)) then
        return nil
    end
    local v13 = game.Players:GetPlayerByUserId(v12.user_id)
    return v13 and {
        ["lobby_id"] = v12.lobby_id,
        ["host_player"] = v13
    } or nil
end
function v4.set_minigame_lobby(p14, p15)
    local v16 = {
        ["user_id"] = p14.UserId,
        ["lobby_id"] = p15
    }
    local v17 = v_u_10
    assert(v17(v16))
    return v_u_2:JSONEncode(v16)
end
return v4