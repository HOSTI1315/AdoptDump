--// ReplicatedStorage.SharedModules.ContentPacks.FriendWeek2025.Cmdr.Commands.getbucksCapServer (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return function(p2, p3)
    local v4 = p3 or { p2.Executor }
    local v5 = v_u_1("DataM")
    local v6 = {}
    for _, v7 in ipairs(v4) do
        local v8 = v5.get_store(v7):get("bucks_cap_manager"):_calculate_cap()
        local v9 = v7.DisplayName
        table.insert(v6, ("%s has a bucks cap of %d"):format(v9, v8))
    end
    return table.concat(v6, "; ")
end