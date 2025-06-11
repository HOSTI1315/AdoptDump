--// ReplicatedStorage.new.modules.ABTest.ConcurrentABTestHandler (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.AB)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_9 = {
    ["key"] = "concurrent_tests",
    ["test_is_participating"] = function(p_u_3)
        local v4 = v_u_1.getTest(v_u_9.key)
        if v4 then
            return v_u_2.List.findWhere(v4.groups, function(p5)
                return p5.name == p_u_3
            end) ~= nil
        else
            return false
        end
    end,
    ["get_override_group_or_nil"] = function(p6, p7)
        if not p7 then
            return nil
        end
        if not v_u_1.getTest(v_u_9.key) then
            return nil
        end
        if not v_u_9.test_is_participating(p6) then
            return nil
        end
        local v8 = v_u_1.getPlayerGroupOrNil(p7, v_u_9.key)
        return v8 ~= p6 and (v8 == "nonparticipating" and "nonparticipating" or (v8 == "control" and "control" or "nonparticipating")) or nil
    end
}
return v_u_9