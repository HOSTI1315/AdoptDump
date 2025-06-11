--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.BeachHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("LiveOpsTime")
local v_u_3 = v1("TweenPromise")
local v4 = v1("Maid")
local v_u_5 = v1("package:Promise")
local v6 = {}
local v_u_7 = v4.new()
function v6.render(p_u_8, _)
    local v_u_20 = v_u_5.new(function(_, p9, p10)
        local v_u_11 = p_u_8:WaitForChild("Static"):WaitForChild("Beach"):WaitForChild("Lighthouse"):WaitForChild("LightBeams")
        if v_u_11 then
            local v_u_12 = v_u_11:GetChildren()[1].Transparency
            local function v_u_17(p13)
                local v14 = v_u_2.get_is_day()
                for _, v15 in v_u_11:GetChildren() do
                    local v16 = v14 and 1 or v_u_12
                    if p13 then
                        v_u_3.new(v15, TweenInfo.new(p13, Enum.EasingStyle.Linear), {
                            ["Transparency"] = v16
                        })
                    else
                        v15.Transparency = v16
                    end
                end
            end
            v_u_17()
            while not p10() do
                local v18 = v_u_2.get_next_time_change_timestamp()
                v_u_2.delay_until(v18):andThen(function()
                    v_u_17(1)
                end):await()
            end
        else
            p9("Lighthouse model is not setup correctly")
        end
    end):catch(function(p19)
        warn((tostring(p19)))
    end)
    v_u_7:GiveTask(function()
        v_u_20:cancel()
    end)
end
function v6.cleanup(_, _)
    v_u_7:DoCleaning()
end
return v6