--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.ForSaleCallbacks (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("SharedConstants")
local v_u_3 = v1("LiveOpsTime")
local v_u_4 = v2.egg_event
return {
    [v_u_4.gumball_egg_kind_pre_release] = function(_, _)
        return not v_u_3.has_happened(v_u_4.release_time)
    end,
    [v_u_4.gumball_egg_kind_post_release] = function(_, _)
        return v_u_3.has_happened(v_u_4.release_time)
    end
}