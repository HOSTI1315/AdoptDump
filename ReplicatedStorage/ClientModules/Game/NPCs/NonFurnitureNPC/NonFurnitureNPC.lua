--// ReplicatedStorage.ClientModules.Game.NPCs.NonFurnitureNPC (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("CharWrapperClient")
local v_u_4 = v1("MouseCursorHider")
local v_u_5 = v1("AnimationManager")
local v_u_6 = v1("PetEntityManager")
local v_u_7 = v1("PetEntityHelper")
local v_u_8 = v1("CharacterHider")
local v_u_9 = v1("TweenPromise")
local v10 = v1("TweenHelper")
local v_u_11 = v1("UIManager")
local v12 = v1("Class")
local v_u_13 = v1("Maid")
local v_u_14 = v1("package:t")
local v_u_15 = v1("package:Promise")
local v_u_16 = game:GetService("Players")
local v_u_17 = v10.tween_info({
    ["time"] = 0.75,
    ["easing_style"] = Enum.EasingStyle.Sine,
    ["easing_direction"] = Enum.EasingDirection.InOut
})
local v_u_18 = nil
local function v_u_23(p19)
    local v20 = p19:FindFirstChild("PetModel") or p19
    local v21 = v20:FindFirstChildWhichIsA("AnimationController") or v20:FindFirstChild("Humanoid")
    if not v21 then
        v21 = Instance.new("AnimationController")
        v21.Parent = v20
    end
    local v22 = v21:FindFirstChildWhichIsA("Animator")
    if not v22 then
        v22 = Instance.new("Animator")
        v22.Parent = v21
    end
    return v22
end
local function v_u_28(p24, p25)
    v_u_11.apps.HideGuiApp:hide_all("npc", { "DialogApp" })
    v_u_11.apps.CoreGuiApp:set_coregui_disabled("npc", Enum.CoreGuiType.Chat)
    v_u_11.apps.SpeechBubbleApp:show_fullscreen_skip_button()
    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    local v_u_26 = v_u_4.hide()
    local v_u_27 = v_u_9.new(workspace.CurrentCamera, v_u_17, {
        ["CFrame"] = CFrame.lookAt(p24, p25)
    })
    return function()
        v_u_11.apps.HideGuiApp:unhide_all("npc")
        v_u_11.apps.CoreGuiApp:reenable_coregui("npc", Enum.CoreGuiType.Chat)
        v_u_11.apps.SpeechBubbleApp:hide_fullscreen_skip_button()
        v_u_26()
        v_u_27:cancel()
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end
local v29 = v12("NonFurnitureNPC")
local v30 = v_u_14.strictInterface
local v31 = {
    ["model"] = v_u_14.instanceIsA("Model"),
    ["speech_bubble_part"] = v_u_14.instanceIsA("BasePart"),
    ["speech_focus_positions"] = v_u_14.optional(v_u_14.strictInterface({
        ["camera_origin"] = v_u_14.Vector3,
        ["camera_target"] = v_u_14.Vector3
    }))
}
local v_u_32 = v30(v31)
function v29.get_focused_npc()
    return v_u_18
end
function v29.__init(p33, p34)
    local v35 = v_u_32
    assert(v35(p34))
    p33.model = p34.model
    p33.speech_bubble_part = p34.speech_bubble_part
    p33.speech_focus_positions = p34.speech_focus_positions
    p33.active_speech_bubbles = {}
    p33.action_promises = {}
end
local v_u_36 = v_u_14.strictInterface({
    ["hide_my_character"] = v_u_14.boolean,
    ["hide_my_pet"] = v_u_14.boolean,
    ["hide_other_characters"] = v_u_14.boolean,
    ["hide_other_pets"] = v_u_14.boolean
})
function v29.take_focus(p_u_37, p_u_38)
    local v39 = v_u_36
    assert(v39(p_u_38))
    if p_u_37.unfocus_callback then
        p_u_37.unfocus_callback()
        p_u_37.unfocus_callback = nil
    end
    local v_u_40 = v_u_28(p_u_37.speech_focus_positions.camera_origin, p_u_37.speech_focus_positions.camera_target)
    v_u_8.set_should_hide_char_callback("npc_dialog", function(_, p41)
        if p41.is_pet then
            if p41.player == v_u_16.LocalPlayer then
                return p_u_38.hide_my_pet
            else
                return p_u_38.hide_other_pets
            end
        elseif p41.player == v_u_16.LocalPlayer then
            return p_u_38.hide_my_character
        else
            return p_u_38.hide_other_characters
        end
    end)
    for _, v42 in v_u_3.get_all_char_wrappers() do
        local v43
        if v42.is_pet then
            if v42.player == v_u_16.LocalPlayer then
                v43 = p_u_38.hide_my_pet
            else
                v43 = p_u_38.hide_other_pets
            end
        else
            v43 = false
        end
        if v43 then
            local v44 = v_u_6.get_pet_entity(v42.char)
            if v44 then
                v_u_7.end_all_performances(v44)
            end
        end
    end
    v_u_18 = p_u_37
    v_u_11.apps.PlayerNameApp:set_hidden(v_u_18 ~= nil)
    v_u_2:set_tag_exclusive("NPCFocused", v_u_18 ~= nil)
    v_u_18 = p_u_37
    local function v_u_45()
        v_u_40()
        v_u_8.clear_should_hide_char_callback("npc_dialog")
        v_u_18 = nil
        v_u_11.apps.PlayerNameApp:set_hidden(v_u_18 ~= nil)
        v_u_2:set_tag_exclusive("NPCFocused", v_u_18 ~= nil)
    end
    p_u_37.unfocus_callback = v_u_45
    return function()
        if p_u_37.unfocus_callback == v_u_45 then
            p_u_37.unfocus_callback()
            p_u_37.unfocus_callback = nil
        end
    end
end
function v29.is_focused(p46)
    return p46.unfocus_callback ~= nil
end
local v47 = v_u_14.strictInterface
local v48 = {
    ["bubble_options"] = v_u_14.optional(v_u_14.union(v_u_14.callback, v_u_14.table)),
    ["dialog"] = v_u_14.array(v_u_14.strictInterface({
        ["text"] = v_u_14.string,
        ["length"] = v_u_14.optional(v_u_14.numberPositive),
        ["callback"] = v_u_14.optional(v_u_14.callback)
    }))
}
local v_u_49 = v47(v48)
function v29.play_speech(p_u_50, p_u_51)
    local v52 = v_u_49
    assert(v52(p_u_51))
    local v53 = p_u_51.bubble_options
    local v_u_55 = not v_u_14.callback(p_u_51.bubble_options) and function(p54)
        return p_u_51.bubble_options or {
            ["always_on_top"] = true,
            ["skippable_time"] = p54.length,
            ["TextColor3"] = Color3.fromRGB(59, 0, 255)
        }
    end or v53
    local v_u_63 = v_u_15.new(function(p56, _, p57)
        for _, v58 in p_u_51.dialog do
            local v59 = v_u_15.resolve()
            if v58.callback then
                v59 = v_u_15.try(v58.callback)
            end
            local v_u_60 = table.clone(v_u_55(v58))
            local v_u_61 = v_u_60.on_destroyed
            function v_u_60.on_destroyed()
                p_u_50.active_speech_bubbles[v_u_60] = nil
                if v_u_61 then
                    v_u_61()
                end
            end
            local v62 = v_u_11.apps.SpeechBubbleApp:create(p_u_50.speech_bubble_part, v58.text, v_u_60)
            p_u_50.active_speech_bubbles[v_u_60] = v62
            if not v58.length then
                v59:expect()
            end
            if p57() then
                v62()
                break
            end
        end
        p56()
    end)
    p_u_50.action_promises[v_u_63] = true
    v_u_15.try(function()
        v_u_63:await()
        p_u_50.action_promises[v_u_63] = nil
    end)
    return v_u_63
end
local v_u_64 = v_u_14.strictInterface({
    ["animation_name"] = v_u_14.string,
    ["looped"] = v_u_14.optional(v_u_14.boolean),
    ["priority"] = v_u_14.optional(v_u_14.enum(Enum.AnimationPriority))
})
function v29.play_animation(p_u_65, p66)
    local v67 = v_u_64
    assert(v67(p66))
    local v68 = v_u_5.get_track(p66.animation_name)
    local v_u_69 = v_u_23(p_u_65.model):LoadAnimation(v68)
    v_u_69.Looped = p66.looped or false
    v_u_69.Priority = p66.priority or Enum.AnimationPriority.Core
    local v_u_72 = v_u_15.new(function(p_u_70, _, p71)
        p71(function()
            v_u_69:Stop()
        end)
        v_u_69.Stopped:Connect(function()
            v_u_69:Destroy()
            p_u_70()
        end)
        v_u_69:Play()
    end)
    p_u_65.action_promises[v_u_72] = true
    v_u_15.try(function()
        v_u_72:await()
        p_u_65.action_promises[v_u_72] = nil
    end)
    return v_u_72, v_u_69
end
function v29.clear_speech_bubbles(p73)
    local v74 = v_u_13.new()
    for _, v75 in p73.active_speech_bubbles do
        v74:GiveTask(v75)
    end
    v74:DoCleaning()
end
function v29.cancel_actions(p76)
    if p76.unfocus_callback then
        p76.unfocus_callback()
        p76.unfocus_callback = nil
    end
    for v77, _ in p76.action_promises do
        v77:cancel()
    end
end
return v29