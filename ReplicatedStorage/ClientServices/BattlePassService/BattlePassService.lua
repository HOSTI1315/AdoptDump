--// ReplicatedStorage.ClientServices.BattlePassService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("BattlePassDB")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("ClientData")
return {
    ["init"] = function()
        v_u_3.get_event("BattlePassAPI/BattlePassReset").OnClientEvent:connect(function(p6)
            local v7 = v_u_2[p6]
            v_u_4.apps.DialogApp:dialog({
                ["text"] = ("You\'ve completed the entire %s!"):format(v7.display_name),
                ["button"] = "Okay"
            })
            v_u_4.apps.DialogApp:dialog({
                ["text"] = ("The %s has been restarted, so you can claim each reward again!"):format(v7.display_name),
                ["button"] = "Okay"
            })
            if v7.daily_reset_limit then
                local v8 = v_u_5.get("battle_pass_manager")
                if v8 then
                    v8 = v8[p6]
                end
                local v9 = v7.daily_reset_limit - (v8 and v8.resets_this_cycle or 0)
                v_u_4.apps.DialogApp:dialog({
                    ["text"] = ("You have %* reset chances left today."):format(v9):format(v9, v7.display_name),
                    ["button"] = "Okay"
                })
            end
        end)
    end
}