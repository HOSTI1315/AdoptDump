--// ReplicatedStorage.ClientModules.Game.ClientDeveloperProductHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductDB")
return {
    ["should_hide"] = function(p2)
        local v3 = v_u_1[p2]
        return v3.should_hide and v3.should_hide() and true or false
    end
}