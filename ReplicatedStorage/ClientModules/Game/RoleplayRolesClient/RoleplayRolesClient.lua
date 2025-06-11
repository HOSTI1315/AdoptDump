--// ReplicatedStorage.ClientModules.Game.RoleplayRolesClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("RoleplayDB")
local v_u_12 = {
    ["get_roleplay_role_entry_from_player"] = function(p5)
        local v6 = v_u_3.get_server(p5, "roleplay_role")
        if v6 then
            return v_u_4[v6.building_id].roles[v6.role_id]
        end
    end,
    ["get_players_with_role"] = function(p_u_7)
        return v_u_2.List.filter(game.Players:GetPlayers(), function(p8)
            local v9 = v_u_12.get_roleplay_role_entry_from_player(p8)
            if v9 then
                v9 = v9.role_id == p_u_7
            end
            return v9
        end)
    end,
    ["is_role_available"] = function(p10)
        local v11 = v_u_12.get_players_with_role(p10.role_id)
        return (not p10.user_limit or #v11 < p10.user_limit) and true or false
    end
}
return v_u_12