--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TransitionsApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("QueueEffect")
local v_u_4 = v1("Debug").create_log()
local v_u_5 = v1("package:Promise")
local v_u_6 = v1("TweenPromise")
local v_u_7 = game:GetService("TweenService")
local v8 = v2("TransitionsApp", v1("UIBaseApp"))
function v8.sudden_fill(p9, p10)
    local v11 = (p10 or {}).color or Color3.new(1, 1, 1)
    p9.instance.Whiteout.BackgroundColor3 = v11
    p9.instance.DisplayOrder = 0
    p9.instance.Whiteout.BackgroundTransparency = 0
    p9.instance.Whiteout.Visible = true
end
function v8.sudden_fill_off(p12, p13)
    local v14 = (p13 or {}).color or Color3.new(1, 1, 1)
    p12.instance.Whiteout.BackgroundColor3 = v14
    p12.instance.Whiteout.BackgroundTransparency = 1
    p12.instance.Whiteout.Visible = false
end
function v8.manual_fill(p15, p16)
    local v17
    if p16 then
        v17 = p16.transparency
    else
        v17 = p16
    end
    assert(v17, "TransitionsApp:manual_fill() requires a transparency property")
    local v18 = p16.color or Color3.new(1, 1, 1)
    local v19 = p16.cover_everything == true and 30 or 0
    p15.instance.Whiteout.BackgroundColor3 = v18
    p15.instance.DisplayOrder = v19
    p15.instance.Whiteout.BackgroundTransparency = p16.transparency
    p15.instance.Whiteout.Visible = true
end
function v8.set_blur(p20, p21, p22, p23)
    p20.blur_controller:set(p21, {
        ["blur_amount"] = p22,
        ["transition_time"] = p23
    })
end
function v8.clear_blur(p24, p25)
    p24.blur_controller:clear(p25)
end
function v8.set_transition_speedup(p26, p27)
    p26.speedup = p27
end
function v8._transition(p28, p29, p30)
    if p28.key == p29 then
        local v31 = p30.length
        local v32 = p30.start_transparency or p28.instance.Whiteout.BackgroundTransparency
        local v33 = p30.end_transparency
        local v34 = p30.cover_everything == true and 30 or (p30.display_order_override or 0)
        local v35 = p30.yields
        local v36 = p30.color or Color3.new(1, 1, 1)
        local v37 = v35 == nil and true or v35
        v_u_4("Transitioning " .. v32 .. " to " .. v33 .. " of length " .. v31)
        if p28.instance.Whiteout.Transparency == v33 then
            return v_u_5.resolve()
        end
        p28.instance.Whiteout.BackgroundColor3 = v36
        p28.instance.Whiteout.Visible = true
        p28.instance.Whiteout.Transparency = v32
        p28.instance.DisplayOrder = v34
        local v38 = TweenInfo.new(v31 / p28.speedup, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local v39 = v_u_6.new(p28.instance.Whiteout, v38, {
            ["BackgroundTransparency"] = v33
        })
        if v37 then
            v39:expect()
        end
        return v39
    end
end
function v8.lock_transitions(p_u_40, p_u_41)
    p_u_40.key = p_u_41
    return function()
        if p_u_40.key == p_u_41 then
            p_u_40.key = nil
        end
    end
end
function v8.force_unlock(p42)
    p42.key = nil
end
function v8.transition(p43, p44)
    return p43:_transition(nil, p44)
end
function v8.transition_with_key(p45, p46, p47)
    return p45:_transition(p46, p47)
end
function v8.current_transparency(p48)
    return not p48.instance.Whiteout.Visible and 1 or p48.instance.Whiteout.Transparency
end
function v8.show(_) end
function v8.hide(_) end
function v8.start(p_u_49)
    p_u_49.blur = Instance.new("BlurEffect")
    p_u_49.blur.Name = "TransitionBlur"
    p_u_49.blur.Enabled = true
    p_u_49.blur.Size = 0
    p_u_49.blur.Parent = game.Lighting
    local v53 = {
        ["refresh"] = function(p50)
            local v51, v52
            if p50 then
                v51 = p50.transition_time / p_u_49.speedup
                v52 = p50.blur_amount
                p_u_49.last_blur_transition_time = v51
            else
                v51 = p_u_49.last_blur_transition_time or 0
                v52 = 0
            end
            v_u_7:Create(p_u_49.blur, TweenInfo.new(v51, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                ["Size"] = v52
            }):Play()
        end
    }
    p_u_49.blur_controller = v_u_3.new(v53)
    p_u_49.speedup = 1
end
return v8