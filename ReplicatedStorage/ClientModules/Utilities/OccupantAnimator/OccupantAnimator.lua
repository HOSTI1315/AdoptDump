--// ReplicatedStorage.ClientModules.Utilities.OccupantAnimator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SeatUtil")
local v_u_3 = v1("AnimationManager")
local v_u_24 = {
    ["get_tracks"] = function(p4)
        if p4.vehicle_seat then
            local v5 = p4.tracks
            local v6 = p4.movement_animations
            if v5 ~= nil or not v6 then
                return p4.tracks
            end
            local v7 = v_u_2.get_occupant(p4.vehicle_seat)
            if v7 ~= nil then
                local v8 = {}
                p4.tracks = v8
                for v9, v10 in v6 do
                    v8[v9] = v7:LoadAnimation((v_u_3.get_track(v10)))
                end
                v_u_24.reset_animation_playback(p4)
                return v8
            end
        end
    end,
    ["reset_animation_playback"] = function(p11)
        for v12, v13 in p11.tracks do
            if v12 == "idle" then
                v13:Play(0, 1, 0.2)
            elseif v12 == "jump" then
                v13:Stop(0)
            else
                v13:Play(0, 0.001, 1)
            end
        end
    end,
    ["clear_tracks"] = function(p14)
        if p14.tracks ~= nil then
            for _, v15 in p14.tracks do
                v15:Stop()
                v15:Destroy()
            end
            p14.tracks = nil
        end
    end,
    ["are_tracks_loaded"] = function(p16)
        return p16.tracks ~= nil
    end,
    ["batch_adjust_speed_once"] = function(p17, p18, p19)
        for _, v20 in ipairs(p17) do
            if v20.Speed ~= p18 then
                v20:AdjustSpeed(p18, p19)
            end
        end
    end,
    ["adjust_weight_once"] = function(p21, p22, p23)
        if p21.WeightTarget ~= p22 then
            p21:AdjustWeight(p22, p23)
        end
    end
}
return v_u_24