--// ReplicatedStorage.ClientModules.Core.Music (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v3 = v1("CriticalSection")
local v4 = v1("Signal")
local v_u_5 = v1("TweenPromise")
local v_u_6 = game:GetService("SoundService")
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = {}
local v_u_12 = v3.new()
local v_u_13 = false
local v_u_14 = 1
v_u_7.music_played = v4.new()
v_u_7.volume_changed = v4.new()
local function v_u_22()
    v_u_12:wait()
    local v15 = v_u_13
    if v15 then
        local v16 = 0
        v15 = nil
        for v17, v18 in pairs(v_u_8) do
            if v16 < v17 then
                v15 = v18
                v16 = v17
            end
        end
    end
    if not v_u_9 or (not v15 or v_u_9.id ~= v15.id) then
        if v_u_10 then
            local v19 = v15 and (v15.fade_time or 1) or 1
            v_u_5.new(v_u_10, TweenInfo.new(v19, Enum.EasingStyle.Linear), {
                ["Volume"] = 0
            }):await()
            v_u_11[v_u_9.id] = v_u_10.TimePosition
            v_u_10:Destroy()
            v_u_10 = nil
            v_u_9 = nil
        end
        if v15 then
            if v15.name and v15.id ~= "rbxassetid://0" then
                local v20 = v_u_2.Music:loop(v15.id)
                v20.PlaybackSpeed = v_u_14
                local v21 = v_u_11[v15.id]
                if v21 and not v15.reset_time_on_playback then
                    v20.TimePosition = v21
                else
                    v20.TimePosition = 0
                end
                v20:play()
                v_u_7.music_played:Fire(v20)
                v_u_10 = v20
            else
                v_u_10 = nil
            end
            v_u_9 = v15
        end
    end
    v_u_12:signal()
end
function v_u_7.set_master_volume(p23)
    local v24 = math.clamp(p23, 0, 1)
    v_u_6:FindFirstChild("Music").Volume = v24
    v_u_7.volume_changed:fire(v24)
end
function v_u_7.enable()
    if not v_u_13 then
        v_u_13 = true
        task.spawn(v_u_22)
    end
end
function v_u_7.disable()
    if v_u_13 then
        v_u_13 = false
        task.spawn(v_u_22)
    end
end
function v_u_7.reset_time_position(p25)
    v_u_11[p25] = nil
end
function v_u_7.play(p26, p27)
    if v_u_8[p26] ~= p27 then
        v_u_8[p26] = p27
        if not v_u_13 then
            return
        end
        task.spawn(v_u_22)
    end
end
function v_u_7.stop(p28, p29)
    if v_u_8[p28] == p29 then
        v_u_8[p28] = nil
        if not v_u_13 then
            return
        end
        task.spawn(v_u_22)
    end
end
function v_u_7.adjust_global_playback_speed(p30)
    v_u_14 = p30
    if v_u_10 and v_u_9 then
        v_u_10.PlaybackSpeed = v_u_14
    end
end
return v_u_7