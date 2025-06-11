--// ReplicatedStorage.ClientModules.Game.ClientGamepassHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("PolicyHelper")
local v_u_3 = v1("GamepassDB")
local v_u_4 = v1("ClientData")
return {
    ["owns_gamepass"] = function(p5)
        local v6 = v_u_4.get("gamepass_manager")
        if v6 then
            v6 = table.find(v6, p5)
        end
        return v6 and true or false
    end,
    ["should_hide"] = function(p7)
        local v8 = v_u_3[p7]
        if v8.should_hide and v8.should_hide() then
            return true
        end
        if v8.unavailable_for_policy then
            local v9 = v_u_2.get_policy_info(game.Players.LocalPlayer)
            for v10, v11 in v8.unavailable_for_policy do
                if v9[v10] == v11 then
                    return true
                end
            end
        end
        return false
    end
}