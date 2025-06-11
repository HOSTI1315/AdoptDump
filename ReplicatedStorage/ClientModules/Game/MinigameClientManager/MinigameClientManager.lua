--// ReplicatedStorage.ClientModules.Game.MinigameClientManager (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ContentPackHelper")
local v_u_3 = v1("RouterClient")
local v4 = v1("SharedConstants")
local v_u_5 = v1("package:Sift")
local v_u_6 = v1("package:t")
local v_u_7 = v4.include_debug_minigame
local v_u_8 = {}
local v_u_9 = {}
function v_u_8.init()
    for _, v10 in script.Parent.Minigames:GetChildren() do
        local v11 = require(v10)
        if v_u_6.table(v11) and (v11.minigame_id and (v11.minigame_id ~= "debug_minigame" or v_u_7)) then
            v_u_9[v11.minigame_id] = v11
        end
    end
    v_u_2.merge_minigames(v_u_9)
    v_u_3.get("MinigameAPI/MessageClient").OnClientEvent:Connect(function(p12, p13, ...)
        local v14 = v_u_8.get(p12)
        if v14 then
            if v14[p13 .. "_msg"] then
                v14:message_received(p13, ...)
            else
                error(("Message type %s is invalid."):format(p13))
            end
        else
            error(("Minigame %s does not exist."):format(p12))
            return
        end
    end)
    v_u_3.get("MinigameAPI/RequestClient").OnClientInvoke = function(p15, p16, ...)
        local v17 = v_u_8.get(p15)
        if v17 then
            if v17[p16 .. "_rqst"] then
                return v17:request_received(p16, ...)
            end
            error(("Message type %s is invalid."):format(p16))
        else
            error(("Minigame %s does not exist."):format(p15))
        end
    end
end
function v_u_8.add(p18)
    v_u_9[p18.minigame_id] = p18
end
function v_u_8.remove(p19)
    local v20 = v_u_9[p19]
    if v20 and v20.destroy then
        v20:destroy()
    end
    v_u_9[p19] = nil
end
function v_u_8.get(p21)
    return v_u_9[p21]
end
function v_u_8.get_all()
    return v_u_9
end
function v_u_8.get_all_ids()
    return v_u_5.Dictionary.keys(v_u_9)
end
function v_u_8.refresh_minigame_above_char_stacks(p22, p23)
    for _, v24 in v_u_9 do
        if v24:should_refresh_above_char_stack(p22) then
            v24:_on_refresh_above_char_stack(p22, p23)
        end
    end
end
return v_u_8