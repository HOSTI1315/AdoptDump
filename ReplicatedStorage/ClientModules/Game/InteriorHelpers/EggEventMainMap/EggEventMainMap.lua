--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.EggEventMainMap (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("EggEvent")
local v_u_3 = v1("DownloadClient")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("Maid")
local v_u_6 = v1("MysterySignHelper")
local v_u_7 = v1("package:Promise")
local v_u_8 = v1("SharedConstants")
local v_u_9 = v1("LiveOpsTime")
local v44 = {
    ["render"] = function(p_u_10, p11)
        p11.egg_event_maid = v_u_5.new()
        if v_u_2.has_release_happened() then
            local v19 = v_u_7.new(function(p12, _, p13)
                local v_u_14 = v_u_3.download("EggEventPreRelease", "MysterySign"):Clone()
                local v_u_15 = nil
                local v_u_16 = false
                local function v17()
                    if not v_u_16 then
                        v_u_16 = true
                        v_u_3.release("EggEventPreRelease", "MysterySign")
                        v_u_15:cancel()
                        v_u_14:Destroy()
                    end
                end
                local v18 = {
                    ["use_discrete_countdown"] = false,
                    ["get_countdown_model"] = function()
                        v_u_14.Parent = p_u_10
                        return v_u_14
                    end,
                    ["get_time_until_release"] = function()
                        return v_u_9.get_time_until(v_u_8.egg_event.release_time)
                    end,
                    ["get_time_until_countdown"] = function()
                        return v_u_9.get_time_until(v_u_8.egg_event.countdown_time)
                    end,
                    ["get_time_until_removal"] = function()
                        return v_u_9.get_time_until(v_u_8.egg_event.release_time + v_u_8.egg_event.mystery_sign_post_release_duration)
                    end
                }
                v_u_15 = v_u_6.start(v_u_8.egg_event.mystery_sign_text, v18)
                v_u_15:andThen(function()
                    if not v_u_16 then
                        v_u_16 = true
                        v_u_3.release("EggEventPreRelease", "MysterySign")
                        v_u_15:cancel()
                        v_u_14:Destroy()
                    end
                end)
                if p13() then
                    if not v_u_16 then
                        v_u_16 = true
                        v_u_3.release("EggEventPreRelease", "MysterySign")
                        v_u_15:cancel()
                        v_u_14:Destroy()
                    end
                else
                    p12(v17)
                end
            end):expect()
            p11.egg_event_maid:GiveTask(v19)
        else
            local v_u_42 = v_u_7.new(function(p20, _, p21)
                local v_u_22 = v_u_3.download("EggEventPreRelease", "MysterySign"):Clone()
                local v_u_23 = nil
                local v_u_24 = false
                local function v25()
                    if not v_u_24 then
                        v_u_24 = true
                        v_u_3.release("EggEventPreRelease", "MysterySign")
                        v_u_23:cancel()
                        v_u_22:Destroy()
                    end
                end
                local v26 = {
                    ["use_discrete_countdown"] = false,
                    ["get_countdown_model"] = function()
                        v_u_22.Parent = p_u_10
                        return v_u_22
                    end,
                    ["get_time_until_release"] = function()
                        return v_u_9.get_time_until(v_u_8.egg_event.release_time)
                    end,
                    ["get_time_until_countdown"] = function()
                        return v_u_9.get_time_until(v_u_8.egg_event.countdown_time)
                    end,
                    ["get_time_until_removal"] = function()
                        return v_u_9.get_time_until(v_u_8.egg_event.release_time + v_u_8.egg_event.mystery_sign_post_release_duration)
                    end
                }
                v_u_23 = v_u_6.start(v_u_8.egg_event.mystery_sign_text, v26)
                v_u_23:andThen(function()
                    if not v_u_24 then
                        v_u_24 = true
                        v_u_3.release("EggEventPreRelease", "MysterySign")
                        v_u_23:cancel()
                        v_u_22:Destroy()
                    end
                end)
                if p21() then
                    if not v_u_24 then
                        v_u_24 = true
                        v_u_3.release("EggEventPreRelease", "MysterySign")
                        v_u_23:cancel()
                        v_u_22:Destroy()
                    end
                else
                    p20(v25)
                end
            end):andThen(function(p_u_27)
                return v_u_7.new(function(p_u_28, _, p29)
                    local v_u_30 = v_u_2.delay_until_release():andThen(function()
                        p_u_28(p_u_27)
                    end)
                    p29(function()
                        v_u_30:cancel()
                        p_u_27()
                    end)
                end)
            end):andThen(function(p31)
                v_u_4.apps.TransitionsApp:transition({
                    ["length"] = 0.375,
                    ["end_transparency"] = 0
                })
                p31()
                local v_u_32 = p_u_10
                local v_u_40 = v_u_7.new(function(p33, _, p34)
                    local v_u_35 = v_u_3.download("EggEventPreRelease", "MysterySign"):Clone()
                    local v_u_36 = nil
                    local v_u_37 = false
                    local function v38()
                        if not v_u_37 then
                            v_u_37 = true
                            v_u_3.release("EggEventPreRelease", "MysterySign")
                            v_u_36:cancel()
                            v_u_35:Destroy()
                        end
                    end
                    local v39 = {
                        ["use_discrete_countdown"] = false,
                        ["get_countdown_model"] = function()
                            v_u_35.Parent = v_u_32
                            return v_u_35
                        end,
                        ["get_time_until_release"] = function()
                            return v_u_9.get_time_until(v_u_8.egg_event.release_time)
                        end,
                        ["get_time_until_countdown"] = function()
                            return v_u_9.get_time_until(v_u_8.egg_event.countdown_time)
                        end,
                        ["get_time_until_removal"] = function()
                            return v_u_9.get_time_until(v_u_8.egg_event.release_time + v_u_8.egg_event.mystery_sign_post_release_duration)
                        end
                    }
                    v_u_36 = v_u_6.start(v_u_8.egg_event.mystery_sign_text, v39)
                    v_u_36:andThen(function()
                        if not v_u_37 then
                            v_u_37 = true
                            v_u_3.release("EggEventPreRelease", "MysterySign")
                            v_u_36:cancel()
                            v_u_35:Destroy()
                        end
                    end)
                    if p34() then
                        if not v_u_37 then
                            v_u_37 = true
                            v_u_3.release("EggEventPreRelease", "MysterySign")
                            v_u_36:cancel()
                            v_u_35:Destroy()
                        end
                    else
                        p33(v38)
                    end
                end):expect()
                v_u_4.apps.TransitionsApp:transition({
                    ["length"] = 0.375,
                    ["end_transparency"] = 1
                })
                return v_u_7.new(function(_, _, p41)
                    p41(v_u_40)
                end)
            end)
            p11.egg_event_maid:GiveTask(function()
                v_u_42:cancel()
            end)
        end
    end,
    ["cleanup"] = function(_, p43)
        p43.egg_event_maid:Destroy()
    end
}
return v44