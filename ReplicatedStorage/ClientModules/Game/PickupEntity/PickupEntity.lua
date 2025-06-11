--// ReplicatedStorage.ClientModules.Game.PickupEntity (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("Class")
local v_u_3 = v1("SoundPlayer")
local v4 = v1("package:t")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = v1("LiveOpsTime")
local v_u_7 = v1("Signal")
local v8 = v2("PickupEntity")
local v_u_9 = v4.strictInterface({
    ["model"] = v4.instanceIsA("Model"),
    ["should_collect_callback"] = v4.optional(v4.callback),
    ["should_emit_capture_effect"] = v4.optional(v4.boolean),
    ["collect_callback"] = v4.optional(v4.callback),
    ["finish_capture_callback"] = v4.optional(v4.callback),
    ["disappear_time"] = v4.optional(v4.number),
    ["disappear_callback"] = v4.optional(v4.callback),
    ["auto_collect"] = v4.optional(v4.boolean),
    ["flash_time"] = v4.optional(v4.number),
    ["get_target"] = v4.optional(v4.callback),
    ["capture_sound"] = v4.optional(v4.string),
    ["dont_play_capture_sound"] = v4.optional(v4.boolean),
    ["collection_offset"] = v4.optional(v4.Vector3),
    ["no_visual"] = v4.optional(v4.boolean),
    ["animation_time"] = v4.optional(v4.numberMin(0)),
    ["stall_percent"] = v4.optional(v4.numberConstrained(0, 1)),
    ["initial_scale"] = v4.optional(v4.number),
    ["final_scale"] = v4.optional(v4.number)
})
local function v_u_13(p10, p11)
    for _, v12 in p10:GetDescendants() do
        if v12:IsA("BasePart") and v12.Transparency ~= p11 then
            v12.Transparency = v12:GetAttribute("TransparencyOverride") or p11
        end
    end
end
function v8.__init(p_u_14, p15)
    local v16 = v_u_9
    assert(v16(p15))
    p_u_14.should_collect_callback = p15.should_collect_callback
    p_u_14.should_emit_capture_effect = p15.should_emit_capture_effect
    p_u_14.collect_callback = p15.collect_callback
    p_u_14.finish_capture_callback = p15.finish_capture_callback
    p_u_14.disappear_callback = p15.disappear_callback
    p_u_14.model = p15.model
    p_u_14.get_target = p15.get_target
    p_u_14.capture_sound = p15.capture_sound
    p_u_14.dont_play_capture_sound = p15.dont_play_capture_sound
    p_u_14.collection_offset = p15.collection_offset or Vector3.new(-0, -3, -0)
    p_u_14.collider = p_u_14.model:FindFirstChild("Collider") or p_u_14.model.PrimaryPart
    p_u_14.initial_scale = p15.initial_scale or p_u_14.model:GetScale()
    p_u_14.has_visual = not p15.no_visual
    p_u_14.auto_collect = p15.auto_collect
    p_u_14.final_scale = p15.final_scale or p_u_14.initial_scale * 0.2
    p_u_14.stall_percent = p15.stall_percent or 0.3
    p_u_14.captured_begin_timestamp = nil
    p_u_14.capture_position = nil
    p_u_14.disappear_fx_start_timestamp = nil
    p_u_14.on_destroy = v_u_7.new()
    if p15.disappear_time then
        local v17 = p15.flash_time or 0
        local v18 = v_u_6.now() + p15.disappear_time
        local v19 = v18 + v17
        p_u_14.disappear_promise = v_u_6.delay_until(v18):andThen(function()
            p_u_14.disappear_fx_start_timestamp = v_u_6.now()
        end)
        if p_u_14.auto_collect then
            p_u_14.destroy_promise = v_u_6.delay_until(v19):andThen(function()
                p_u_14:touched()
            end)
            return
        end
        p_u_14.destroy_promise = v_u_6.delay_until(v19):andThen(function()
            if p_u_14.disappear_callback then
                p_u_14.disappear_callback()
            end
        end):finally(function()
            p_u_14:destroy()
        end)
    end
end
function v8.update(p20)
    if p20.model:IsDescendantOf(workspace) then
        local v21
        if p20.get_target then
            v21 = p20.get_target()
        else
            v21 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or nil
        end
        if v21 then
            local v22 = p20.has_visual
            if v22 then
                v22 = p20.model.Visual
            end
            local v23
            if v22 then
                v23 = p20.model:FindFirstChild("RootJoint", true)
            else
                v23 = v22
            end
            local v24 = p20.initial_scale
            local v25 = p20.final_scale
            local v26 = p20.captured_begin_timestamp ~= nil
            local v27 = p20.disappear_fx_start_timestamp ~= nil
            if v22 and not v26 then
                local v28 = os.clock() % 3 / 3
                local v29 = os.clock() * 2
                local v30 = (math.sin(v29) + 1) / 2
                v23.Transform = CFrame.new(0, v30 * 0.4, 0) * CFrame.Angles(0, 6.283185307179586 * v28, 0)
            end
            if v26 then
                if v22 then
                    v_u_13(v22, 0)
                end
                local v31 = os.clock() - p20.captured_begin_timestamp
                if v31 >= 0.5 then
                    if v22 then
                        p20:emit_capture_effect(v22:GetPivot())
                    end
                    if not p20.dont_play_capture_sound then
                        if p20.capture_sound then
                            v_u_3.FX:play(p20.capture_sound)
                        else
                            v_u_3.FX:play((("Crunch%*"):format((math.random(1, 5)))))
                        end
                    end
                    if p20.finish_capture_callback then
                        p20.finish_capture_callback()
                    end
                    p20:destroy()
                    return
                end
                if v22 then
                    local v32 = v31 / 0.5
                    local v33 = -(v32 * 1.7 - 1) ^ 2 + 1
                    local v34 = CFrame.new(0, 8 * v33, 0) * CFrame.Angles(0, 18.84955592153876 * v32, 0)
                    p20.model:ScaleTo(v24 + (v25 - v24) * v32)
                    v23.Transform = v34
                    local v35 = v31 / 0.3
                    local v36 = v21.Position + p20.collection_offset
                    local v37 = v_u_5:GetValue(v35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    local v38 = p20.capture_position:Lerp(v36, v37)
                    p20.collider.CFrame = CFrame.new(v38)
                    return
                end
            elseif v27 then
                if os.clock() - p20.disappear_fx_start_timestamp > 2 then
                    p20:destroy()
                    return
                end
                if v22 then
                    local v39 = os.clock() * 40
                    v_u_13(v22, math.sin(v39) > 0.5 and 1 or 0)
                end
            end
        else
            p20:destroy()
        end
    else
        p20:destroy()
        return
    end
end
function v8.touched(p40)
    if p40.captured_begin_timestamp == nil then
        p40:collect()
    end
end
function v8.collect(p41)
    if not p41.should_collect_callback or p41.should_collect_callback() then
        p41.captured_begin_timestamp = os.clock()
        p41.capture_position = p41.collider.Position
        if p41.collect_callback then
            p41.collect_callback()
        end
    end
end
function v8.emit_capture_effect(p42, p43)
    if p42.should_emit_capture_effect then
        local v44 = game.ReplicatedStorage.Resources.Effects.CaptureEffectTemplate:Clone()
        v44:PivotTo(p43)
        v44.Parent = workspace
        v44.Attachment.CaptureParticles:Emit(16)
        game.Debris:AddItem(v44, 1)
    end
end
function v8.destroy(p45)
    if p45.disappear_promise then
        p45.disappear_promise:cancel()
    end
    if p45.destroy_promise then
        p45.destroy_promise:cancel()
    end
    if p45.model then
        p45.model:Destroy()
    end
    p45.on_destroy:Fire()
end
return v8