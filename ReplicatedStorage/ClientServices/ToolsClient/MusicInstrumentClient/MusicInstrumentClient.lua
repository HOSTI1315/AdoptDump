--// ReplicatedStorage.ClientServices.ToolsClient.MusicInstrumentClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("SoundPlayer")
local v_u_4 = v1("Music")
local v_u_5 = v1("SoundDB")
local v_u_6 = v1("new:StreamingHelper")
local v_u_10 = {
    ["init"] = function()
        v_u_2.get("ToolAPI/MusicInstrumentPlayed").OnClientEvent:connect(function(p7, p8)
            local v9 = v_u_6.get(p8)
            if v9 then
                v_u_10.play_sound(p7, v9)
            end
        end)
    end
}
local v_u_11 = 0
function v_u_10.play_sound(p12, p13)
    v_u_4.play(1000, v_u_5.Silence)
    local v_u_14 = v_u_3.FX:play(p12, p13)
    v_u_14.Loaded:Connect(function()
        local v15 = v_u_14.TimeLength
        local v16 = tick() + v15
        if v_u_11 < v16 then
            v_u_11 = v16
            local v_u_17 = v_u_11
            task.delay(v15, function()
                if v_u_11 == v_u_17 then
                    v_u_4.stop(1000, v_u_5.Silence)
                end
            end)
        end
    end)
    return v_u_14
end
return v_u_10