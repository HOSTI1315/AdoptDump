--// ReplicatedStorage.SharedModules.SeatUtil (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("Maid")
local v_u_3 = v1("SimpleEvents")
local v_u_14 = {
    ["get_seat_from_humanoid"] = function(p4)
        if p4.RootPart then
            local v5 = p4.RootPart:GetConnectedParts()
            for _, v6 in ipairs(v5) do
                if (v6:IsA("Seat") or v6:IsA("VehicleSeat")) and v_u_14.get_occupant(v6) == p4 then
                    return v6
                end
            end
        end
    end,
    ["get_occupant_char"] = function(p7, p8)
        local v9 = p8 or p7:FindFirstChild("SeatWeld")
        if v9 then
            if v9:IsA("Weld") or v9:IsA("WeldConstraint") then
                local v10 = nil
                if v9.Part0 == p7 then
                    v10 = v9.Part1
                elseif v9.Part1 == p7 then
                    v10 = v9.Part0
                end
                if v10 then
                    return v10.Parent
                end
            end
        else
            return
        end
    end,
    ["get_occupant"] = function(p11, p12)
        local v13 = v_u_14.get_occupant_char(p11, p12)
        if v13 then
            v13 = v13:FindFirstChildWhichIsA("Humanoid")
        end
        return v13
    end
}
local function v_u_28(p_u_15, p_u_16, p17)
    local v_u_18 = v_u_2.new()
    v_u_18.self_clean = p_u_15.AncestryChanged:Connect(function()
        if not p_u_15:IsDescendantOf(game) then
            v_u_18:DoCleaning()
        end
    end)
    local v_u_19 = p17
    local v_u_20 = {}
    local v_u_21 = nil
    local function v_u_23()
        local v22 = v_u_14.get_occupant(p_u_15)
        if v22 ~= v_u_21 then
            v_u_21 = v22
            if v_u_19 then
                p_u_16(v22)
            end
        end
    end
    v_u_18.child_added = v_u_3.foreach_child_including_new(p_u_15, function(p_u_24)
        if p_u_24:IsA("Weld") or p_u_24:IsA("WeldConstraint") then
            if p_u_24.Name == "SeatWeld" then
                local v_u_25 = v_u_2.new()
                v_u_20[p_u_24] = v_u_25
                v_u_25.self_clean = p_u_24.AncestryChanged:Connect(function()
                    if not p_u_24:IsDescendantOf(game) then
                        v_u_25:DoCleaning()
                    end
                end)
                function v_u_25.remove_from_list()
                    v_u_20[p_u_24] = nil
                end
                v_u_25.part_0 = p_u_24:GetPropertyChangedSignal("Part0"):Connect(v_u_23)
                v_u_25.part_1 = p_u_24:GetPropertyChangedSignal("Part1"):Connect(v_u_23)
                local v26 = v_u_14.get_occupant(p_u_15)
                if v26 ~= v_u_21 then
                    v_u_21 = v26
                    if v_u_19 then
                        p_u_16(v26)
                    end
                end
            end
        else
            return
        end
    end)
    function v_u_18.clean_weld_maids()
        for _, v27 in pairs(v_u_20) do
            v27:DoCleaning()
        end
    end
    v_u_19 = true
    return v_u_18
end
function v_u_14.on_occupant_changed(p29, p30)
    return v_u_28(p29, p30, false)
end
function v_u_14.foreach_occupant_including_new(p31, p32)
    return v_u_28(p31, p32, true)
end
return v_u_14