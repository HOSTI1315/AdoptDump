--// ReplicatedStorage.SharedModules.TweenPromise (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(script.Parent.Signal)
local v_u_5 = require(v1.SharedPackages.Promise)
return {
    ["new"] = function(p_u_6, p_u_7, p_u_8)
        return v_u_5.new(function(p_u_9, _, p10)
            local v_u_11 = v_u_3:Create(p_u_6, p_u_7, p_u_8)
            p10(function()
                v_u_11:Cancel()
            end)
            v_u_11.Completed:Connect(function()
                v_u_11:Destroy()
                p_u_9()
            end)
            v_u_11:Play()
        end)
    end,
    ["callback"] = function(p_u_12, p_u_13, p_u_14, p_u_15)
        return v_u_5.new(function(p_u_16, _, p17)
            local v_u_18 = Instance.new("NumberValue")
            v_u_18.Value = p_u_12
            local v_u_19 = v_u_4.new()
            local v_u_20 = v_u_3:Create(v_u_18, p_u_14, {
                ["Value"] = p_u_13
            })
            p17(function()
                v_u_20:Cancel()
            end)
            v_u_20.Completed:Connect(function()
                v_u_19:Fire()
                v_u_20:Destroy()
                v_u_18:Destroy()
                p_u_16()
            end)
            v_u_20:Play()
            while v_u_20.PlaybackState ~= Enum.PlaybackState.Completed and not p17() do
                p_u_15(v_u_18.Value)
                v_u_5.race({ v_u_5.fromEvent(v_u_18.Changed), v_u_5.fromEvent(v_u_19) }):await()
            end
        end)
    end,
    ["callback_heartbeat"] = function(p_u_21, p22, p_u_23, p_u_24, p_u_25)
        local v_u_26 = p_u_24.DelayTime
        local v_u_27 = p_u_24.Reverses
        local v_u_28 = p_u_24.RepeatCount
        local v_u_29 = p_u_24.RepeatCount == -1
        local v_u_30 = p22 - p_u_21
        return v_u_5.new(function(p31, _, p32)
            local v33 = 0
            ::l17::
            if p32() or not v_u_29 and v33 > v_u_28 then
                p31()
                return
            end
            local v34 = os.clock() + v_u_26
            while not p32() do
                if v34 <= os.clock() then
                    local v35 = (os.clock() - v34) / p_u_24.Time
                    if v33 == 0 then
                        v35 = v35 + p_u_23
                    end
                    if v_u_27 and v35 > 1 then
                        v35 = 2 - v35
                    end
                    p_u_25(p_u_21 + v_u_30 * v_u_3:GetValue(math.clamp(v35, 0, 1), p_u_24.EasingStyle, p_u_24.EasingDirection), v33)
                    if v35 >= 1 or v_u_27 and v35 <= 0 then
                        break
                    end
                end
                v_u_2.Heartbeat:Wait()
            end
            v33 = v33 + 1
            goto l17
        end)
    end
}