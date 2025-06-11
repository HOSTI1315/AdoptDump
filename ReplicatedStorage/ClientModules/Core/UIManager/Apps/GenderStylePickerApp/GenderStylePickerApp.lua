--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.GenderStylePickerApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("Signal")
local v5 = v1("Class")
local v_u_6 = v1("package:Promise")
local v_u_7 = game:GetService("RunService")
local v8 = v5("GenderStylePickerApp", v1("UIBaseApp"))
function v8._step_wiggling(p9)
    local v10 = os.clock() % 1 / 1 * 6.283185307179586
    local v11 = math.sin(v10)
    for v12, v13 in p9.anim_state do
        v12.ImageLabel.Rotation = v11 * 4 * v13.intensity
    end
end
function v8._set_wiggling(p14, p15, p16, p17)
    local v18 = p14.anim_state[p15]
    v18.target_intensity = p16 and 1 or 0
    if p17 then
        v18.intensity = v18.target_intensity
        p14:_step_wiggling()
    end
end
function v8._clear_animation_heartbeat(p19)
    if p19.anim_heartbeat then
        p19.anim_heartbeat:Disconnect()
        p19.anim_heartbeat = nil
    end
end
function v8._start_animation_heartbeat(p_u_20)
    p_u_20:_clear_animation_heartbeat()
    p_u_20.anim_heartbeat = v_u_7.Heartbeat:Connect(function(p21)
        for _, v22 in p_u_20.anim_state do
            local v23 = p_u_20.pre_selected and 0.2 or v22.target_intensity
            local v24 = v22.intensity
            local v25 = p21 * 60
            local v26 = math.min(1, v25) * 0.2
            v22.intensity = (1 - v26) * v24 + v26 * v23
        end
        p_u_20:_step_wiggling()
    end)
end
function v8._init_animation(p_u_27)
    p_u_27.anim_state[p_u_27.boys] = {
        ["intensity"] = 0,
        ["target_intensity"] = 0
    }
    p_u_27.anim_state[p_u_27.girls] = {
        ["intensity"] = 0,
        ["target_intensity"] = 0
    }
    for v_u_28, _ in p_u_27.anim_state do
        v_u_28.Button.MouseEnter:Connect(function()
            p_u_27:_set_wiggling(v_u_28, true, false)
        end)
        v_u_28.Button.MouseLeave:Connect(function()
            p_u_27:_set_wiggling(v_u_28, false, false)
        end)
    end
end
function v8.promise_pick(p_u_29)
    p_u_29.UIManager.set_app_visibility(p_u_29.ClassName, true)
    local v_u_30 = v_u_6.fromEvent(p_u_29.selected)
    v_u_6.try(function()
        v_u_30:await()
        v_u_2.FX:play("BambooButton")
        p_u_29.UIManager.set_app_visibility(p_u_29.ClassName, false)
    end)
    return v_u_30
end
function v8.show(p31)
    v_u_2.FX:play("Pop")
    p31.instance.Dialog.Visible = true
    p31:_start_animation_heartbeat()
end
function v8.hide(p32)
    p32.instance.Dialog.Visible = false
    p32:_clear_animation_heartbeat()
    p32:_set_wiggling(p32.boys, false, true)
    p32:_set_wiggling(p32.girls, false, true)
end
function v8.start(p_u_33)
    p_u_33.instance.Enabled = true
    p_u_33.selected = v_u_4.new()
    p_u_33.boys = p_u_33.instance.Dialog.Interior.Clothes.Boys
    p_u_33.boys.ImageLabel.Selectable = false
    p_u_33.girls = p_u_33.instance.Dialog.Interior.Clothes.Girls
    p_u_33.girls.ImageLabel.Selectable = false
    p_u_33.anim_state = {}
    p_u_33:_init_animation()
    p_u_33.boys.Button.Activated:Connect(function()
        p_u_33.selected:Fire("Boys")
    end)
    p_u_33.girls.Button.Activated:Connect(function()
        p_u_33.selected:Fire("Girls")
    end)
    v_u_3.quick_watch({
        ["selection_parent"] = p_u_33.instance.Dialog,
        ["default_selection"] = p_u_33.boys.Button,
        ["app_name"] = p_u_33.ClassName,
        ["close_override"] = function()
            return false
        end
    })
end
return v8