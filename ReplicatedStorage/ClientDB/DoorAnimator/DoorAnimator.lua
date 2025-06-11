--// ReplicatedStorage.ClientDB.DoorAnimator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("AnimationManager")
local v_u_4 = v1("TweenPromise")
local v_u_5 = v1("package:Promise")
local function v_u_20(p6, p7, p8)
    local v9 = p8 or TweenInfo.new()
    local v_u_10 = p6:get_config(p7 .. "_duration")
    local v_u_11 = p6:get_config(p7 .. "_easing_style")
    local v_u_12 = p6:get_config(p7 .. "_easing_direction")
    local v17, _ = pcall(function()
        local v13 = v_u_10
        if v13 then
            local v14 = v_u_10
            v13 = tonumber(v14)
        end
        v_u_10 = v13
        local v15 = v_u_11
        if v15 then
            v15 = Enum.EasingStyle[v_u_11]
        end
        v_u_11 = v15
        local v16 = v_u_12
        if v16 then
            v16 = Enum.EasingDirection[v_u_12]
        end
        v_u_12 = v16
    end)
    local v18, v19
    if v17 then
        v18 = v_u_12
        v19 = v_u_11
    else
        warn("Invalid TweenInfo config for door:", v_u_10, v_u_11, v_u_12)
        v_u_10 = nil
        v_u_11 = nil
        v_u_12 = nil
        v18 = v_u_12
        v19 = v_u_11
    end
    return TweenInfo.new(v_u_10 or v9.Time, v19 or v9.EasingStyle, v18 or v9.EasingDirection)
end
local v_u_75 = {
    ["animated_door"] = function(p21)
        local v22 = p21.door_model.WorkingParts:FindFirstChildWhichIsA("AnimationController", true)
        if v22 then
            if v22:IsDescendantOf(workspace) then
                local v23 = p21:get_config("CustomOpen")
                local v24 = p21:get_config("CustomClose")
                if v23 and v24 then
                    local v_u_25 = v22:LoadAnimation(v_u_3.get_track(v23))
                    local v_u_26 = v22:LoadAnimation(v_u_3.get_track(v24))
                    local v_u_27 = v22:LoadAnimation(v_u_3.get_track(v24))
                    return {
                        ["open"] = v23 and function()
                            v_u_25:Play(0)
                            return v_u_5.fromEvent(v_u_25.Stopped):andThen(function()
                                v_u_27:Play(0)
                                v_u_27:AdjustSpeed(0)
                            end)
                        end or v23,
                        ["close"] = function()
                            v_u_27:Stop()
                            v_u_26:Play(0)
                            return v_u_5.fromEvent(v_u_26.Stopped)
                        end
                    }
                end
            end
        else
            return
        end
    end,
    ["no_door"] = function(_) end,
    ["single_door"] = function(p_u_28)
        local v29 = p_u_28:get_config("open_degrees") or 100
        local v30 = math.rad(v29)
        local v_u_31 = p_u_28.door_model:FindFirstChild("Door")
        assert(v_u_31, "No Door model within single_door")
        local v_u_32 = v_u_31:GetPivot()
        local v_u_33 = v_u_32 * CFrame.Angles(0, -v30, 0)
        return {
            ["open"] = function()
                local v_u_34 = v_u_31:GetPivot()
                local v35 = v_u_20(p_u_28, "open", TweenInfo.new(1.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out))
                return v_u_4.callback(0, 1, v35, function(p36)
                    v_u_31:PivotTo(v_u_34:Lerp(v_u_33, p36))
                end)
            end,
            ["close"] = function()
                local v_u_37 = v_u_31:GetPivot()
                local v38 = v_u_20(p_u_28, "close", TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In))
                return v_u_4.callback(0, 1, v38, function(p39)
                    v_u_31:PivotTo(v_u_37:Lerp(v_u_32, p39))
                end)
            end
        }
    end,
    ["double_door"] = function(p_u_40)
        local v41 = p_u_40:get_config("open_degrees") or 100
        local v42 = math.rad(v41)
        local v_u_43 = p_u_40.door_model:FindFirstChild("Left")
        local v_u_44 = p_u_40.door_model:FindFirstChild("Right")
        assert(v_u_43 and v_u_44, "No Left or Right model within double_door")
        local v_u_45 = v_u_43:GetPivot()
        local v_u_46 = v_u_44:GetPivot()
        local v_u_47 = v_u_45 * CFrame.Angles(0, -v42, 0)
        local v_u_48 = v_u_46 * CFrame.Angles(0, v42, 0)
        return {
            ["open"] = function()
                local v_u_49 = v_u_43:GetPivot()
                local v_u_50 = v_u_44:GetPivot()
                local v51 = v_u_20(p_u_40, "open", TweenInfo.new(2.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out))
                return v_u_4.callback(0, 1, v51, function(p52)
                    v_u_43:PivotTo(v_u_49:Lerp(v_u_47, p52))
                    v_u_44:PivotTo(v_u_50:Lerp(v_u_48, p52))
                end)
            end,
            ["close"] = function()
                local v_u_53 = v_u_43:GetPivot()
                local v_u_54 = v_u_44:GetPivot()
                local v55 = v_u_20(p_u_40, "close", TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In))
                return v_u_4.callback(0, 1, v55, function(p56)
                    v_u_43:PivotTo(v_u_53:Lerp(v_u_45, p56))
                    v_u_44:PivotTo(v_u_54:Lerp(v_u_46, p56))
                end)
            end
        }
    end,
    ["pivot_door"] = function(p_u_57)
        local v58 = p_u_57.door_model:FindFirstChild("Doors")
        assert(v58, "No Doors model within pivot_door")
        local v_u_59 = {}
        local v_u_60 = {}
        for _, v61 in v58:GetChildren() do
            local v62 = v61:FindFirstChild("GoalPivot", true)
            local v63 = "No GoalPivot specified within pivot_door:" .. p_u_57.door_model.Name .. ".Doors." .. v61.Name
            assert(v62, v63)
            local v64 = nil
            if v62:IsA("Attachment") then
                v64 = v62.WorldCFrame
            elseif v62:IsA("BasePart") then
                v64 = v62.CFrame
            end
            v62:Destroy()
            v_u_59[v61] = v61:GetPivot()
            v_u_60[v61] = v64
        end
        return {
            ["open"] = function()
                local v_u_65 = {}
                for v66, _ in v_u_59 do
                    v_u_65[v66] = v66:GetPivot()
                end
                local v67 = v_u_20(p_u_57, "open", TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
                return v_u_4.callback(0, 1, v67, function(p68)
                    for v69, _ in v_u_59 do
                        v69:PivotTo(v_u_65[v69]:Lerp(v_u_60[v69], p68))
                    end
                end)
            end,
            ["close"] = function()
                local v_u_70 = {}
                for v71, _ in v_u_59 do
                    v_u_70[v71] = v71:GetPivot()
                end
                local v72 = v_u_20(p_u_57, "close", TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In))
                return v_u_4.callback(0, 1, v72, function(p73)
                    for v74, _ in v_u_59 do
                        v74:PivotTo(v_u_70[v74]:Lerp(v_u_59[v74], p73))
                    end
                end)
            end
        }
    end
}
local function v_u_79(p76)
    if p76.door_animator then
        return p76.door_animator
    end
    if p76.working_parts and p76.working_parts:FindFirstChildWhichIsA("AnimationController", true) then
        p76.door_animator = v_u_75.animated_door(p76)
    else
        local v77 = p76:get_config("Type") or "single_door"
        local v78 = v77 and v_u_75[v77]
        if v78 then
            v78 = v_u_75[v77](p76)
        end
        p76.door_animator = v78
    end
    return p76.door_animator
end
return {
    ["open"] = function(p80)
        local v81 = v_u_79(p80)
        if v81 and v81.open then
            local v82 = p80:get_config("OpenSound")
            if v82 then
                v_u_2.FX:play(v82, p80.door_model.WorkingParts.TouchToEnter)
            end
            return v81.open():await()
        end
    end,
    ["close"] = function(p83)
        local v84 = v_u_79(p83)
        if v84 and v84.close then
            local v85 = p83:get_config("CloseSound")
            if v85 then
                v_u_2.FX:play(v85, p83.door_model.WorkingParts.TouchToEnter)
            end
            return v84.close():await()
        end
    end
}