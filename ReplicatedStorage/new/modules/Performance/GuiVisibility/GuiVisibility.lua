--// ReplicatedStorage.new.modules.Performance.GuiVisibility (ModuleScript)

local v_u_41 = {
    ["is_visible"] = function(p1)
        if p1:IsA("GuiObject") then
            if not p1.Visible then
                return false
            end
            local v2 = p1:FindFirstAncestorWhichIsA("LayerCollector")
            if not (v2 and v2.Enabled) then
                return false
            end
            if p1.AbsolutePosition.X > v2.AbsoluteSize.X or (p1.AbsolutePosition.Y > v2.AbsoluteSize.Y or (p1.AbsolutePosition.X + p1.AbsoluteSize.X < 0 or p1.AbsolutePosition.Y + p1.AbsoluteSize.Y < 0)) then
                return false
            end
        elseif not p1.Enabled then
            return false
        end
        if not (p1:FindFirstAncestorOfClass("PlayerGui") or p1:IsDescendantOf(workspace)) then
            return false
        end
        local v3 = p1.Parent
        while v3 do
            if v3:IsA("GuiObject") then
                if not v3.Visible then
                    return false
                end
            elseif v3:IsA("LayerCollector") and not v3.Enabled then
                return false
            end
            v3 = v3.Parent
        end
        return true
    end,
    ["get_visible_changed_signal"] = function(p_u_4)
        local v_u_5 = false
        local v_u_6 = Instance.new("BindableEvent")
        local v_u_7 = false
        local v_u_8 = false
        local v_u_9 = {}
        local v_u_10 = false
        local v_u_11 = nil
        local v_u_12 = nil
        local function v_u_14()
            local v13 = next(v_u_9) == nil and (v_u_10 and v_u_8)
            if v13 then
                v13 = v_u_7
            end
            if v13 ~= v_u_5 then
                v_u_5 = v13
                v_u_6:Fire(v_u_5)
            end
        end
        local v_u_15 = p_u_4:IsA("GuiObject") and "Visible" or "Enabled"
        local function v_u_16()
            v_u_7 = p_u_4[v_u_15]
            v_u_14()
        end
        v_u_7 = p_u_4[v_u_15]
        v_u_14()
        local v_u_17 = p_u_4:GetPropertyChangedSignal(v_u_15):Connect(function()
            v_u_16()
            v_u_14()
        end)
        if p_u_4:IsA("GuiObject") then
            local function v_u_20()
                local v18 = p_u_4:FindFirstAncestorWhichIsA("LayerCollector")
                if v18 then
                    local v19
                    if p_u_4.AbsolutePosition.X <= v18.AbsoluteSize.X and (p_u_4.AbsolutePosition.Y <= v18.AbsoluteSize.Y and p_u_4.AbsolutePosition.X + p_u_4.AbsoluteSize.X >= 0) then
                        v19 = p_u_4.AbsolutePosition.Y + p_u_4.AbsoluteSize.Y >= 0
                    else
                        v19 = false
                    end
                    v_u_8 = v19
                end
            end
            v_u_20()
            v_u_11 = p_u_4:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                v_u_20()
                v_u_14()
            end)
            v_u_12 = p_u_4:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                v_u_20()
                v_u_14()
            end)
        end
        local v_u_21 = {}
        local function v_u_31()
            local v_u_22 = p_u_4.Parent
            local v23 = {}
            while v_u_22 and (v_u_22.ClassName ~= "PlayerGui" and (v_u_22.ClassName ~= "Workspace" and v_u_22.ClassName ~= "DataModel")) do
                v23[v_u_22] = true
                if not v_u_21[v_u_22] then
                    if v_u_22:IsA("GuiObject") then
                        if not v_u_22.Visible then
                            v_u_9[v_u_22] = true
                        end
                        local v_u_24 = "Visible"
                        v_u_21[v_u_22] = v_u_22:GetPropertyChangedSignal("Visible"):Connect(function()
                            local v25 = next(v_u_9) ~= nil
                            if v_u_22[v_u_24] then
                                v_u_9[v_u_22] = nil
                            else
                                v_u_9[v_u_22] = true
                            end
                            if v25 ~= (next(v_u_9) ~= nil) then
                                v_u_14()
                            end
                        end)
                    elseif v_u_22:IsA("LayerCollector") then
                        if not v_u_22.Enabled then
                            v_u_9[v_u_22] = true
                        end
                        local v_u_26 = "Enabled"
                        v_u_21[v_u_22] = v_u_22:GetPropertyChangedSignal("Enabled"):Connect(function()
                            local v27 = next(v_u_9) ~= nil
                            if v_u_22[v_u_26] then
                                v_u_9[v_u_22] = nil
                            else
                                v_u_9[v_u_22] = true
                            end
                            if v27 ~= (next(v_u_9) ~= nil) then
                                v_u_14()
                            end
                        end)
                    end
                end
                v_u_22 = v_u_22.Parent
            end
            for v28, v29 in v_u_21 do
                if not v23[v28] then
                    v29:Disconnect()
                    v_u_21[v28] = nil
                end
            end
            if p_u_4:IsA("GuiObject") then
                local v30
                if p_u_4:FindFirstAncestorWhichIsA("LayerCollector") == nil then
                    v30 = false
                else
                    v30 = p_u_4:FindFirstAncestorOfClass("PlayerGui") ~= nil and true or p_u_4:IsDescendantOf(workspace)
                end
                v_u_10 = v30
            else
                v_u_10 = p_u_4:FindFirstAncestorOfClass("PlayerGui") ~= nil and true or p_u_4:IsDescendantOf(workspace)
            end
        end
        v_u_31()
        local v_u_32 = p_u_4.AncestryChanged:Connect(function()
            v_u_31()
            v_u_14()
        end)
        v_u_14()
        local function v34()
            v_u_17:Disconnect()
            v_u_32:Disconnect()
            if v_u_11 then
                v_u_11:Disconnect()
            end
            if v_u_12 then
                v_u_12:Disconnect()
            end
            for _, v33 in pairs(v_u_21) do
                v33:Disconnect()
            end
            v_u_6:Destroy()
        end
        return v_u_6.Event, v34, function()
            return v_u_5
        end
    end,
    ["on_visible_changed"] = function(p35, p36)
        local v37, v_u_38, v39 = v_u_41.get_visible_changed_signal(p35)
        local v_u_40 = v37:Connect(p36)
        task.spawn(p36, v39())
        return function()
            v_u_40:Disconnect()
            v_u_38()
        end, v39
    end
}
return v_u_41