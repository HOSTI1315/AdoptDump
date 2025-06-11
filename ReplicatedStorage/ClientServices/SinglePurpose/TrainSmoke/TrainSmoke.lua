--// ReplicatedStorage.ClientServices.SinglePurpose.TrainSmoke (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SimpleEvents")
local v_u_3 = v1("SeatUtil")
local v_u_4 = v1("Maid")
return {
    ["init"] = function()
        v_u_2.foreach_tagged_including_new("Train", function(p_u_5)
            local v_u_6 = p_u_5:WaitForChild("VehicleSeat", 120)
            local v_u_7 = p_u_5:WaitForChild("Visual", 120):WaitForChild("TrainBody", 10):WaitForChild("Attachment", 120):WaitForChild("Smoke", 120)
            if v_u_6 and v_u_7 then
                local v_u_8 = v_u_4.new()
                v_u_8.self_clean = p_u_5.AncestryChanged:Connect(function()
                    if not p_u_5:IsDescendantOf(game) then
                        v_u_8:DoCleaning()
                    end
                end)
                local function v10()
                    local v9 = v_u_6.Throttle
                    if math.abs(v9) > 0 and v_u_3.get_occupant(v_u_6) then
                        if not v_u_7.Enabled then
                            v_u_7.Enabled = true
                            return
                        end
                    elseif v_u_7.Enabled then
                        v_u_7.Enabled = false
                    end
                end
                v_u_8.throttle_changed_connection = v_u_6:GetPropertyChangedSignal("Throttle"):Connect(v10)
                v_u_8.occupant_changed_connection = v_u_3.on_occupant_changed(v_u_6, v10)
                local v11 = v_u_6.Throttle
                if math.abs(v11) > 0 and v_u_3.get_occupant(v_u_6) then
                    if not v_u_7.Enabled then
                        v_u_7.Enabled = true
                        return
                    end
                elseif v_u_7.Enabled then
                    v_u_7.Enabled = false
                end
            end
        end)
    end
}