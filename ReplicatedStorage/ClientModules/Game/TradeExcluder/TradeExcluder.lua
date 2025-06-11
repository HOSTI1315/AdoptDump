--// ReplicatedStorage.ClientModules.Game.TradeExcluder (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("LiveOpsTime")
local v_u_3 = {}
local v_u_4 = {}
local v_u_5 = {}
function v_u_3._refresh_declined_trades(p6)
    if v_u_5[p6] then
        local v7 = v_u_2.now()
        local v8 = {}
        for _, v9 in v_u_5[p6] do
            if v7 - v9 <= 300 then
                table.insert(v8, v9)
            end
        end
        v_u_5[p6] = v8
    end
end
function v_u_3.trade_was_declined(p10)
    if not v_u_5[p10] then
        v_u_5[p10] = {}
    end
    local v11 = v_u_5[p10]
    local v12 = v_u_2.now
    table.insert(v11, v12())
    v_u_3._refresh_declined_trades(p10)
end
function v_u_3.is_player_exclusion_candidate(p13)
    v_u_3._refresh_declined_trades(p13)
    local v14 = v_u_5[p13]
    if v14 then
        v14 = #v_u_5[p13] > 0
    end
    return v14
end
function v_u_3.is_player_excluded(p15)
    return v_u_4[p15] == true
end
function v_u_3.include_player(p16)
    v_u_4[p16] = nil
end
function v_u_3.confirm_and_exclude_player(p17)
    if v_u_4[p17] then
        return
    else
        local v18 = v_u_1("UIManager")
        if v18.apps.DialogApp:dialog({
            ["text"] = ("Ignore trade requests from %* for the rest of this session?"):format(p17.Name),
            ["left"] = "No",
            ["right"] = "Yes"
        }) ~= "No" then
            v18.apps.HintApp:hint({
                ["text"] = ("%* will no longer send you trade requests for the rest of this session."):format(p17.Name),
                ["length"] = 8,
                ["overridable"] = true,
                ["yields"] = false
            })
            v_u_4[p17] = true
        end
    end
end
return v_u_3