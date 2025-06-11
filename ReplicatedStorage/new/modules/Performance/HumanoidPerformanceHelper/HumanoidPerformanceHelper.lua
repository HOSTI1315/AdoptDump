--// ReplicatedStorage.new.modules.Performance.HumanoidPerformanceHelper (ModuleScript)

local v_u_1 = {}
local v_u_2 = {
    ["HumanoidRootPart"] = "All"
}
local function v_u_5(p3, p4)
    if p4 == nil or (p4 == "None" or p4 == false) then
        p3.CanCollide = false
        p3.CanTouch = false
        p3.CanQuery = false
        return
    elseif p4 == "TouchOnly" then
        p3.CanCollide = false
        p3.CanTouch = true
        p3.CanQuery = false
        return
    elseif p4 == "QueryOnly" then
        p3.CanCollide = false
        p3.CanTouch = false
        p3.CanQuery = true
        return
    elseif p4 == "TouchAndQuery" then
        p3.CanCollide = false
        p3.CanTouch = true
        p3.CanQuery = true
    elseif p4 == "All" or p4 == true then
        p3.CanTouch = true
        p3.CanQuery = true
    end
end
function v_u_1.optimize_now(p_u_6, p7)
    local v_u_8 = p7 or {}
    local v_u_9 = v_u_8.collisions or v_u_2
    task.spawn(function()
        local function v15(p_u_10)
            if p_u_10:IsA("BasePart") then
                local v11
                if v_u_8.target == nil or v_u_8.target == "Descendants" then
                    v11 = true
                elseif v_u_8.target == "Children" then
                    v11 = p_u_10.Parent == p_u_6
                elseif v_u_8.target == "ChildrenAndAccessories" then
                    v11 = p_u_10.Parent == p_u_6 and true or p_u_10:FindFirstAncestorWhichIsA("Accoutrement") ~= nil
                else
                    v11 = false
                end
                if v11 then
                    local v_u_12 = v_u_9[p_u_10.Name]
                    v_u_5(p_u_10, v_u_12)
                    if v_u_8.reapply_on_change then
                        local v_u_13 = false
                        local function v14()
                            if not v_u_13 then
                                v_u_13 = true
                                v_u_5(p_u_10, v_u_12)
                                v_u_13 = false
                            end
                        end
                        p_u_10:GetPropertyChangedSignal("CanCollide"):Connect(v14)
                        p_u_10:GetPropertyChangedSignal("CanTouch"):Connect(v14)
                        p_u_10:GetPropertyChangedSignal("CanQuery"):Connect(v14)
                    end
                end
            else
                return
            end
        end
        for _, v16 in p_u_6:GetDescendants() do
            v15(v16)
        end
        if v_u_8.reapply_on_change then
            p_u_6.DescendantAdded:Connect(v15)
        end
    end)
end
function v_u_1.optimize_deferred(p_u_17, p_u_18)
    task.spawn(function()
        task.wait()
        v_u_1.optimize_now(p_u_17, p_u_18)
    end)
end
return v_u_1