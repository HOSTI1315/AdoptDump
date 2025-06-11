--// ReplicatedStorage.ClientServices.Order_01.ClientABTests (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("CloudValues")
local v_u_3 = v1("CloudABTests")
local v_u_4 = v1("CloudABTestExtras")
local v_u_5 = v1("ClientData")
local v_u_6 = v1("package:AB")
local v7 = {}
local v_u_8 = {}
local function v_u_9()
    v_u_8 = v_u_3.reconcile_tests({
        ["new_tests"] = v_u_2:getValue("ab_tests", "shared_tests"),
        ["new_concurrent_tests"] = v_u_2:getValue("ab_tests", "concurrent_tests"),
        ["old_tests"] = v_u_8,
        ["extras"] = v_u_4.extras
    })
end
function v7.init()
    v_u_6.setGlobalTestOverride(function(p10, p11)
        local v12 = v_u_5.get_server(p11, "ab_group_overrides")
        if v12 then
            return v12[p10.name]
        else
            return nil
        end
    end)
    v_u_9()
    v_u_2:onChange(v_u_9)
end
return v7