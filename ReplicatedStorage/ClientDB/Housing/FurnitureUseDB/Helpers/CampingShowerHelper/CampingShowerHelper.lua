--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.CampingShowerHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("FurnitureUseHelperLegacy")
local v_u_3 = v_u_1("LiveOpsTime")
local v_u_4 = v_u_1("Maid")
return {
    ["CAMPING_SHOWER"] = function()
        local v5 = v_u_2.GENERIC_SHOWER()
        function v5.init(p_u_6, p_u_7, p8)
            local v_u_9 = v_u_1("new:AilmentsCadenceServer")
            local v_u_10 = v_u_1("WeatherServer")
            p_u_6.locked = true
            local v11 = v_u_4.new()
            local v_u_12 = nil
            local function v14()
                if v_u_12 then
                    v_u_12:cancel()
                    v_u_12 = nil
                end
                if v_u_9.is_camping_night() and p_u_6.locked then
                    p_u_6.locked = false
                    p_u_7()
                elseif v_u_10.is_day() and not p_u_6.locked then
                    local v13 = v_u_10.get_cycle_start_time() + 180
                    v_u_12 = v_u_3.delay_until(v13):andThen(function()
                        p_u_6.locked = true
                        p_u_7()
                    end)
                end
            end
            v11.weather_changed = v_u_10.on_weather_changed:Connect(v14)
            function v11.cancel_lock_promise()
                if v_u_12 then
                    v_u_12:cancel()
                    v_u_12 = nil
                end
            end
            p8.maid = v11
            v14()
        end
        function v5.server_furniture_deactivated(p15)
            p15.maid:DoCleaning()
        end
        v5.interaction_locking = {
            ["is_locked"] = function(p16)
                return p16.locked or false
            end,
            ["on_attempt_locked_interaction"] = function()
                v_u_1("UIManager").apps.HintApp:hint({
                    ["text"] = "Campsite showers are not open at this time.",
                    ["overridable"] = true,
                    ["length"] = 4.5
                })
            end
        }
        function v5.post_render(p17, p_u_18, _, p19, _)
            local v20 = (p17.occupied or {}).UseBlock and true or false
            local v21 = p17.locked
            if not v21 then
                p_u_18.Rotatable.PushOut.ClosedSign:Destroy()
            end
            local v_u_22, v_u_23, v_u_24, v_u_25, v_u_26, v_u_27
            if v20 or v21 then
                v_u_22 = 110
                v_u_23 = 0.5
                v_u_24 = 0
                v_u_25 = 0.8
                v_u_26 = 0
                v_u_27 = 1.4
            else
                v_u_22 = 0
                v_u_23 = 0
                v_u_24 = 110
                v_u_25 = 0.8
                v_u_26 = 0.5
                v_u_27 = 0.3
            end
            if p19 == nil then
                p_u_18.Rotatable:SetPrimaryPartCFrame(p_u_18.Rotatable.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(v_u_24), 0))
                p_u_18.Rotatable.PushOut:SetPrimaryPartCFrame(p_u_18.Rotatable.PushOut.PrimaryPart.CFrame * CFrame.new(0, 0, -v_u_24))
            else
                p_u_18.Rotatable:SetPrimaryPartCFrame(p_u_18.Rotatable.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(v_u_22), 0))
                p_u_18.Rotatable.PushOut:SetPrimaryPartCFrame(p_u_18.Rotatable.PushOut.PrimaryPart.CFrame * CFrame.new(0, 0, -v_u_23))
                task.spawn(function()
                    local v28 = v_u_24 - v_u_22
                    local v29 = p_u_18.Rotatable.PrimaryPart.CFrame
                    local v30 = 0
                    while v30 < v_u_25 do
                        v30 = v30 + task.wait()
                        if not p_u_18.Parent then
                            break
                        end
                        p_u_18.Rotatable:SetPrimaryPartCFrame(v29 * CFrame.Angles(0, math.rad(v28) * (v30 / v_u_25), 0))
                    end
                end)
                task.spawn(function()
                    local v31 = (v_u_26 - v_u_23) / v_u_27
                    local v32 = 0
                    while v32 < v_u_27 do
                        local v33 = task.wait()
                        v32 = v32 + v33
                        if not p_u_18.Parent then
                            break
                        end
                        p_u_18.Rotatable.PushOut:SetPrimaryPartCFrame(p_u_18.Rotatable.PushOut.PrimaryPart.CFrame * CFrame.new(0, 0, -v33 * v31))
                    end
                end)
            end
        end
        return v5
    end
}