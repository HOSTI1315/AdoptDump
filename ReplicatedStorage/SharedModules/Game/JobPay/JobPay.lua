--// ReplicatedStorage.SharedModules.Game.JobPay (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
v_u_1("package:Promise")
local v_u_2 = game:GetService("RunService")
return {
    ["claim_pay_server"] = function(p3, p4, p5)
        local v6
        if p3 then
            if p4 then
                if p5 then
                    v6 = p5.analytics_pay_source
                else
                    v6 = p5
                end
            else
                v6 = p4
            end
        else
            v6 = p3
        end
        assert(v6, "Missing arguments")
        local v7 = v_u_2:IsServer()
        assert(v7, "Attempted to call JobPay.claim_pay_server() on client")
        local v8 = v_u_1("DataM").get_store(p3)
        if v8 then
            v8 = v8:get("job_pay_manager")
        end
        if v8 then
            return v8:attempt_payout(p4, p5)
        else
            return false
        end
    end
}