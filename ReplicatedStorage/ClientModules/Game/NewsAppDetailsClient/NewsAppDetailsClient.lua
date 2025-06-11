--// ReplicatedStorage.ClientModules.Game.NewsAppDetailsClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Signal")
local v_u_3 = v1("ClientData")
local v_u_4 = {}
local v_u_5 = v2.new()
function v_u_4.get_details()
    return v_u_3.get("news_app_details")
end
function v_u_4.has_viewed_details()
    local v6 = v_u_4.get_details() or {}
    return v_u_3.get("last_viewed_news_hash") == v6.Hashcode
end
function v_u_4.init()
    v_u_3.register_callback("news_app_details", function()
        v_u_5:Fire()
    end)
end
function v_u_4.get_details_changed_signal()
    return v_u_5
end
return v_u_4