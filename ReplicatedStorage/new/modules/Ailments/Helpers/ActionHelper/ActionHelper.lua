--// ReplicatedStorage.new.modules.Ailments.Helpers.ActionHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_12 = {
    ["running_promises"] = {},
    ["has_exclusive_tag"] = function(p3)
        for _, v4 in v_u_12.running_promises do
            if v_u_2.List.find(v4, p3) ~= nil then
                return true
            end
        end
        return false
    end,
    ["cancel_mutually_exclusive_promises"] = function(p_u_5)
        for v6, v7 in v_u_12.running_promises do
            if v_u_2.List.some(v7, function(p8)
                return v_u_2.List.find(p_u_5, p8) ~= nil
            end) then
                v6:cancel()
            end
        end
    end,
    ["run_promise"] = function(p_u_9, p10)
        if p10 then
            v_u_12.cancel_mutually_exclusive_promises(p10)
        end
        v_u_12.running_promises[p_u_9] = p10 or {}
        p_u_9:finally(function()
            v_u_12.running_promises[p_u_9] = nil
        end)
        return p_u_9
    end,
    ["get_result_from_status"] = function(p11)
        if p11 == v_u_1.Status.Cancelled then
            return nil
        else
            return p11 ~= v_u_1.Status.Rejected
        end
    end
}
return v_u_12