--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.LearnTricksReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("ModifierPriority")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_5 = v1("PetPerformanceName")
local v_u_6 = v1("PetEntityHelper")
local v_u_7 = v1("SteppedTask")
local v_u_8 = v1("UIManager")
local v_u_9 = v1("PetMovementTarget")
local v_u_10 = v1("RouterClient")
local v_u_11 = v1("SteppedTaskUtils")
local v_u_12 = v1("package:Promise")
local v_u_13 = v1("package:Sift")
local v_u_14 = {
    "bandicoot",
    "dingo",
    "emu",
    "kelpie",
    "frog",
    "koala",
    "kangaroo",
    "turtle"
}
local v_u_15 = {
    ["name"] = script.Name,
    ["exclusive_state"] = v_u_2.LearningTricks,
    ["allowed_exclusive_states"] = {
        v_u_2.DoingTrick,
        v_u_2.Sitting,
        v_u_2.Carried,
        v_u_2.Mounted,
        v_u_2.LearningTricks
    }
}
local function v_u_33(p_u_16, p_u_17)
    return { function(p18, p19, p20)
            local v21 = p20.modifiers
            p19.sounds.play_sound("QuackFail")
            v21.effects = { "question_mark" }
            v21.eyes_id = "wat_eyes"
            p18:wait(2.5)
            v_u_8.apps.SpeechBubbleApp:create(p_u_16, "Oh.... uh.... \240\159\152\172", p_u_17)
            p18:wait(2)
            v_u_8.apps.SpeechBubbleApp:create(p_u_16, "She\'ll be right, that was practice! \240\159\152\142", p_u_17)
            p18:wait(2)
            local v22 = {}
            p20.modifiers = v22
            v22.should_jump = true
            v22.jump_height = 2
            p18:wait(0.05)
            v22.should_jump = nil
            v22.jump_height = nil
        end, function(p23, p24, p25)
            local v26 = p25.modifiers
            v26.head_target = v_u_13.None
            p24.sounds.play_sound("BoredSit")
            v26.anim_name = p24.base.entry.anims.sit
            v26.anim_fade_time = 0.5
            v26.walkspeed = 0
            p23:wait(0.5)
            p24.sounds.play_sound("BoredCloseEyes")
            v26.eyes_id = "squinting_eyes"
            p23:wait(2)
            v_u_8.apps.SpeechBubbleApp:create(p_u_16, "Eh? What\'s this... \240\159\152\161", p_u_17)
            p23:wait(1)
            p24.sounds.play_sound("BoredSigh")
            v26.effects = { "sigh" }
            p23:wait(2)
            v_u_8.apps.SpeechBubbleApp:create(p_u_16, "I mean uh... no worries \240\159\153\132", p_u_17)
            p23:wait(0.5)
            local v27 = {}
            p25.modifiers = v27
            v27.should_jump = true
            v27.jump_height = 2
            p23:wait(0.05)
            v27.should_jump = nil
            v27.jump_height = nil
            p23:wait(1.5)
        end, function(p28, p29, p30)
            local v31 = p30.modifiers
            p29.sounds.play_sound("Yawn")
            v31.head_target = v_u_13.None
            v31.eyes_id = "sleepy_eyes"
            v31.anim_name = p29.base.entry.anims.sleep
            v31.anim_fade_time = 2
            v31.walkspeed = 0
            p28:wait(3)
            v_u_8.apps.SpeechBubbleApp:create(p_u_16, "\240\159\152\182", p_u_17)
            v31.looping_sounds = { "SleepLoop" }
            v31.effects = { "sleep" }
            p28:wait(2)
            v_u_8.apps.SpeechBubbleApp:create(p_u_16, "\240\159\164\148 I\'ve never seen an animal so stubborn before... ", p_u_17)
            p28:wait(3)
            v_u_8.apps.SpeechBubbleApp:create(p_u_16, "I\'m ridgy-didge, you\'ll see!! \240\159\152\164", p_u_17)
            p28:wait(0.25)
            local v32 = {}
            p30.modifiers = v32
            v32.should_jump = true
            v32.jump_height = 2
            p28:wait(0.05)
            v32.should_jump = nil
            v32.jump_height = nil
            p28:wait(1.25)
        end }
end
local v_u_34 = { "Ready? %s!", "You\'ll get it this time, %s!", "Third time\'s the charm, %s!" }
local v_u_35 = {
    "I reckon this is the one... now, %s!",
    "Now, time for %s!",
    "Keep at it mate! Now, %s",
    "Go on, %s!",
    "Just a couple more! Now, %s!",
    "And the finale... %s!"
}
local v_u_36 = {
    "ACE!! We did it, %s! \240\159\146\170\240\159\143\189",
    "Maaaate, that\'s it! They should call me Shane Irwin \240\159\164\160",
    "Beauty!! \240\159\152\142",
    "Bonza! That\'s it!",
    "You\'re a pro!",
    "Wow. I\'m the best, I told yous \240\159\164\160"
}
local function v_u_46(p37, p38, p_u_39, p40, p41, p42, p43)
    v_u_8.apps.SpeechBubbleApp:create(p37, string.format(p41, p42), p43)
    p38:wait(1)
    local v44 = v_u_11.run_performance
    local v45 = {
        ["name"] = v_u_5.NoticeObject,
        ["manager_reaction_name"] = v_u_15.name,
        ["options"] = {
            ["object"] = p40.NPC,
            ["eyes_on_notice"] = "tiny_eyes",
            ["effects_on_notice"] = { "dot_dot_dot_long" },
            ["notice_delay_time"] = 0.2,
            ["acknowledgement_time"] = 2.4,
            ["sounds_on_notice"] = { "LearnTrickAnticipation" },
            ["idle_anim_speed"] = 0.2
        },
        ["should_end_performance"] = function()
            return p_u_39.exclusive_state == v_u_2.Mounted
        end
    }
    v44(p38, p_u_39, v45)
    p38:wait(1)
end
function v_u_15.init_reaction(p_u_47, p_u_48)
    local v_u_49 = {
        ["head"] = p_u_48.head,
        ["furniture_model"] = p_u_48.furniture_model,
        ["speech_bubble_options_func"] = p_u_48.speech_bubble_options_func,
        ["learnable_tricks"] = p_u_48.learnable_tricks,
        ["should_skip_dialog"] = false,
        ["modifiers"] = {}
    }
    v_u_49.skip_button = v_u_8.apps.ExtraButtonsApp:register_button({
        ["priority"] = 1,
        ["text"] = "Skip",
        ["mouse_button1_click"] = function()
            v_u_49.should_skip_dialog = true
        end
    })
    v_u_49.skip_button:show()
    function v_u_49.end_reaction()
        v_u_8.apps.ExtraButtonsApp:unregister_button(v_u_49.skip_button)
        v_u_10.get("PetAPI/UpdatePetTrickLevel"):FireServer(p_u_47.base.char_wrapper.pet_unique)
        if p_u_47.base.char_wrapper.pet_progression.age == 6 or p_u_47.base.char_wrapper.neon then
            v_u_8.apps.SpeechBubbleApp:create(p_u_48.head, "Your animal knows every trick in the book! Do not ask me about my book \240\159\152\160", p_u_48.speech_bubble_options_func(3))
        else
            v_u_8.apps.SpeechBubbleApp:create(p_u_48.head, "That\'s all for now! Grow your pet for more tricks!", p_u_48.speech_bubble_options_func(3))
        end
        v_u_8.apps.SpeechBubbleApp:create(p_u_48.head, "Tap your pet to show off their new trick(s)!", p_u_48.speech_bubble_options_func(3))
    end
    function v_u_49.on_despawn()
        if v_u_49.skip_button then
            v_u_8.apps.ExtraButtonsApp:unregister_button(v_u_49.skip_button)
        end
    end
    return v_u_49
end
function v_u_15.step(p_u_50, p_u_51)
    if p_u_50.is_changing_interiors then
        v_u_12.try(p_u_51.end_reaction)
        return v_u_4.Cancel
    end
    p_u_51.task = p_u_51.task or v_u_7.new(function(p52)
        local v53 = p_u_51.head
        local v54 = p_u_51.furniture_model
        local v55 = p_u_51.speech_bubble_options_func
        local v56 = p_u_51.learnable_tricks
        local v57 = v_u_6.stage_performance
        local v58 = p_u_50
        local v59 = {
            ["name"] = v_u_5.ModifiersProvider,
            ["manager_reaction_name"] = v_u_15.name
        }
        local v60 = {}
        local v61 = {
            ["pause_ailment_chat_bubbles"] = true,
            ["movement_target"] = v_u_9.from_target_and_follow_distance(v54.NPC, 6),
            ["rotation_target"] = v_u_9.new({
                ["target"] = v54.NPC
            }),
            ["head_target"] = v_u_9.new({
                ["target"] = v54.NPC
            }),
            ["dont_allow_sit_states"] = true,
            ["dont_allow_mount_states"] = true
        }
        v60.modifiers = v61
        v59.options = v60
        v57(v58, v59)
        local v62 = v_u_33(v53, v55())
        v_u_8.apps.SpeechBubbleApp:create(v53, "Easy job, mate! I\'m the best animal handler there is \240\159\165\177", v55())
        p52:wait(3)
        v_u_8.apps.SpeechBubbleApp:create(v53, "Step back and watch this, you\'re \'bout to see some magic... ", v55())
        if table.find(v_u_14, p_u_50.base.entry.kind) then
            p52:wait(3)
            v_u_8.apps.SpeechBubbleApp:create(v53, string.format("This should be easy, I know your kind! We go way back, %s and me, we\'re from the land down under! \240\159\153\131", p_u_50.base.entry.name), v55())
        end
        local v63 = v_u_6.stage_performance
        local v64 = p_u_50
        local v65 = {
            ["name"] = v_u_5.TargetProvider,
            ["manager_reaction_name"] = v_u_15.name,
            ["options"] = {
                ["priority"] = v_u_3.Lower
            }
        }
        v63(v64, v65)
        p52:wait(4)
        v_u_8.apps.SpeechBubbleApp:create(v53, string.format("Right creature, all eyes on me \240\159\164\160", p_u_50.base.entry.name), v55())
        p52:wait(2)
        for v66 = 1, 3 do
            v_u_46(v53, p52, p_u_50, v54, v_u_34[v66], v56[1], v55())
            local v67 = v62[v66]
            local v68 = v_u_11.run_performance
            local v69 = p_u_50
            local v70 = {
                ["name"] = v_u_5.RunTask,
                ["manager_reaction_name"] = v_u_15.name,
                ["options"] = {
                    ["task_function"] = v67
                }
            }
            v68(p52, v69, v70)
            p52:wait(0.5)
        end
        for v71, v72 in v56 do
            if v71 == 1 then
                v_u_46(v53, p52, p_u_50, v54, v_u_35[v71], v72, v55())
            else
                v_u_8.apps.SpeechBubbleApp:create(v53, string.format(v_u_35[v71], v72), v55())
                p52:wait(1)
            end
            local v73 = v_u_11.run_performance
            local v74 = p_u_50
            local v75 = {
                ["name"] = v_u_5.NoticeObject,
                ["manager_reaction_name"] = v_u_15.name,
                ["options"] = {
                    ["object"] = v54.NPC,
                    ["eyes_on_notice"] = "happy_eyes",
                    ["effects_on_notice"] = { "lightbulb" },
                    ["notice_delay_time"] = 0,
                    ["acknowledgement_time"] = 0.8,
                    ["should_jump_on_notice"] = false,
                    ["sounds_on_notice"] = { "Lightbulb", "HappySqueak" }
                }
            }
            v73(p52, v74, v75)
            p52:wait(0.4)
            if v71 == 1 then
                p_u_50.sounds.play_sound("LearnTrickSuccess")
            end
            local v76 = v_u_6.stage_performance
            local v77 = p_u_50
            local v78 = {
                ["name"] = v_u_5.DoTrick,
                ["manager_reaction_name"] = v_u_15.name,
                ["options"] = {
                    ["trick_name"] = v72
                }
            }
            v76(v77, v78)
            v_u_6.end_performance(p_u_50, v_u_5.ModifiersProvider)
            local v79 = v_u_6.stage_performance
            local v80 = p_u_50
            local v81 = {
                ["name"] = v_u_5.ModifiersProvider,
                ["manager_reaction_name"] = v_u_15.name
            }
            local v82 = {}
            local v83 = {
                ["pause_ailment_chat_bubbles"] = true,
                ["movement_target"] = v_u_9.from_target_and_follow_distance(v54.NPC, 6),
                ["rotation_target"] = v_u_9.new({
                    ["target"] = v54.NPC
                }),
                ["dont_allow_sit_states"] = true,
                ["dont_allow_mount_states"] = true
            }
            v82.modifiers = v83
            v81.options = v82
            v79(v80, v81)
            p52:wait(2)
            v_u_8.apps.SpeechBubbleApp:create(v53, string.format(v_u_36[v71], p_u_50.base.entry.name), v55())
            p52:wait(4)
            v_u_6.end_performance(p_u_50, v_u_5.DoTrick)
            v_u_6.end_performance(p_u_50, v_u_5.ModifiersProvider)
            local v84 = v_u_6.stage_performance
            local v85 = p_u_50
            local v86 = {
                ["name"] = v_u_5.ModifiersProvider,
                ["manager_reaction_name"] = v_u_15.name
            }
            local v87 = {}
            local v88 = {
                ["pause_ailment_chat_bubbles"] = true,
                ["movement_target"] = v_u_9.from_target_and_follow_distance(v54.NPC, 6),
                ["rotation_target"] = v_u_9.new({
                    ["target"] = v54.NPC
                }),
                ["head_target"] = v_u_9.new({
                    ["target"] = v54.NPC
                }),
                ["dont_allow_sit_states"] = true,
                ["dont_allow_mount_states"] = true
            }
            v87.modifiers = v88
            v86.options = v87
            v84(v85, v86)
        end
        v_u_6.end_performance(p_u_50, v_u_5.ModifiersProvider)
        v_u_6.end_performance(p_u_50, v_u_5.TargetProvider)
        v_u_6.end_performance(p_u_50, v_u_5.DoTrick)
        v_u_12.try(p_u_51.end_reaction)
        return v_u_4.Complete
    end)
    if not p_u_51.should_skip_dialog then
        return p_u_51.task:step()
    end
    v_u_12.try(p_u_51.end_reaction)
    return v_u_4.Cancel
end
return v_u_15