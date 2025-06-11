--// ReplicatedStorage.ClientDB.PetVisualEffectsDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("NumberSequenceUtil")
local v3 = v1("ContentPackHelper")
local v_u_4 = v1("new:PetRigs")
local v_u_5 = v1("package:Promise")
local v95 = {
    ["surprised"] = {
        ["asset_names"] = { "Surprise" },
        ["on_create"] = function(p6)
            p6.Surprise.ParticleEmitter:Emit(1)
        end,
        ["pre_destroy"] = function(p7)
            v_u_5.delay(p7.Surprise.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["shock"] = {
        ["asset_names"] = { "Shock" },
        ["on_create"] = function(p8)
            p8.Shock.ParticleEmitter:Emit(1)
        end,
        ["pre_destroy"] = function(p9)
            v_u_5.delay(p9.Shock.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["smoke_trail"] = {
        ["asset_names"] = { "SmokeTrail" },
        ["parent_override"] = "Torso",
        ["on_create"] = function(p10)
            p10.SmokeTrail.ParticleEmitter:Emit(1)
        end,
        ["pre_destroy"] = function(p11)
            local v12 = p11.SmokeTrail.ParticleEmitter
            v12.Enabled = false
            v_u_5.delay(v12.Lifetime.Max):await()
        end
    },
    ["emit_smoke"] = {
        ["asset_names"] = { "Smoke" },
        ["parent_override"] = "Torso",
        ["on_create"] = function(p13)
            local v14 = p13.Smoke.ParticleEmitter
            v14.Enabled = false
            v14:Emit(5)
        end,
        ["pre_destroy"] = function(p15)
            v_u_5.delay(p15.Smoke.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["sleep"] = {
        ["asset_names"] = { "SleepZZZs", "SleepBubbles" }
    },
    ["dot_dot_dot"] = {
        ["asset_names"] = { "Dot1", "Dot2", "Dot3" },
        ["on_create"] = function(p16)
            for v17 = 1, 3 do
                p16["Dot" .. v17].ParticleEmitter:Emit(1)
                v_u_5.delay(0.4):await()
            end
        end
    },
    ["dot_dot_dot_long"] = {
        ["asset_names"] = { "Dot1", "Dot2", "Dot3" },
        ["on_create"] = function(p18)
            for v19 = 1, 3 do
                p18["Dot" .. v19].ParticleEmitter:Emit(1)
                v_u_5.delay(0.8):await()
            end
        end
    },
    ["exclaim"] = {
        ["asset_names"] = { "Exclaim" },
        ["on_create"] = function(p20)
            p20.Exclaim.ParticleEmitter:Emit(1)
        end,
        ["pre_destroy"] = function(p21)
            v_u_5.delay(p21.Exclaim.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["question_mark"] = {
        ["asset_names"] = { "StiffQuestionMark" },
        ["on_create"] = function(p22)
            p22.StiffQuestionMark.ParticleEmitter:Emit(1)
        end,
        ["pre_destroy"] = function(p23)
            v_u_5.delay(p23.StiffQuestionMark.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["sigh"] = {
        ["asset_names"] = { "Sigh" },
        ["on_create"] = function(p24, p25)
            local v26 = p25.visual_effects.pet_model_attachments.mouth
            if v26 then
                p24.Sigh.Parent = v26.Parent
                p24.Sigh.CFrame = v26.CFrame
                p24.Sigh.ParticleEmitter:Emit(1)
            end
        end,
        ["pre_destroy"] = function(p27)
            v_u_5.delay(p27.Sigh.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["sweatdrop"] = {
        ["asset_names"] = { "SweatDrop" },
        ["on_create"] = function(p28)
            local v29 = p28.SweatDrop.ParticleEmitter
            v29.Enabled = false
            v_u_5.delay(0.8):await()
            v29:Emit(1)
            v29.Enabled = true
        end
    },
    ["emit_sweatdrop"] = {
        ["asset_names"] = { "SweatDrop" },
        ["on_create"] = function(p30)
            local v31 = p30.SweatDrop.ParticleEmitter
            v31.Enabled = false
            v31:Emit(1)
        end,
        ["pre_destroy"] = function(p32)
            v_u_5.delay(p32.SweatDrop.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["woozy"] = {
        ["asset_names"] = {
            "WoozyGradientLeft",
            "WoozyGradientRight",
            "WoozyLinesTop",
            "WoozyLinesBottom"
        },
        ["on_create"] = function(p33, p34)
            local v35 = p34.base.entry.head_part_for_reactions or "Head"
            local v36 = p34.base.pet_model
            local v37 = v_u_4.get(v36).get_part(v36, v35).Size.Z / 2
            for _, v38 in pairs(p33) do
                local v39 = v38.Position
                local v40 = -v37
                v38.Position = v39 + Vector3.new(0, 0, v40)
            end
            local v41 = p33.WoozyLinesBottom.Beam
            v41.Attachment0 = p33.WoozyLinesBottom
            v41.Attachment1 = p33.WoozyLinesTop
            local v42 = p33.WoozyGradientRight.Beam
            v42.Attachment0 = p33.WoozyGradientRight
            v42.Attachment1 = p33.WoozyGradientLeft
            local v43 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            v_u_2.tween_number_sequence_property(v41, v43, "Transparency", 1, 0):Play()
            v_u_2.tween_number_sequence_property(v42, v43, "Transparency", 1, 0):Play()
        end,
        ["pre_destroy"] = function(p44)
            local v45 = p44.WoozyLinesBottom.Beam
            local v46 = p44.WoozyGradientRight.Beam
            local v47 = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            v_u_2.tween_number_sequence_property(v45, v47, "Transparency", 0, 1):Play()
            v_u_2.tween_number_sequence_property(v46, v47, "Transparency", 0, 1):Play()
            v_u_5.delay(1.5):await()
        end
    },
    ["stinky"] = {
        ["asset_names"] = { "StinkLinesBottom", "StinkLinesTop", "StinkDots" },
        ["on_create"] = function(p48, p49)
            local v50 = p49.base.entry.head_part_for_reactions or "Head"
            local v51 = p49.base.pet_model
            local v52 = v_u_4.get(v51).get_part(v51, v50).Size.Y / 2
            for _, v53 in ipairs({ "StinkLinesBottom", "StinkLinesTop" }) do
                local v54 = p48[v53]
                local v55 = v54.Position
                local v56 = v52 / 2
                v54.Position = v55 + Vector3.new(0, v56, 0)
            end
            local v57 = p48.StinkLinesBottom
            for _, v58 in ipairs({ "LinesOne", "LinesTwo" }) do
                local v59 = v57[v58]
                v59.Attachment0 = p48.StinkLinesBottom
                v59.Attachment1 = p48.StinkLinesTop
                v_u_2.tween_number_sequence_property(v59, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), "Transparency", 1, 0):Play()
            end
        end
    },
    ["blushing"] = {
        ["asset_names"] = { "BlushingLeft", "BlushingRight" },
        ["on_create"] = function(p60, p61)
            local v62 = p61.base.entry.head_part_for_reactions or "Head"
            local v63 = p61.base.pet_model
            local v64 = v_u_4.get(v63).get_part(v63, v62).Size.X / 2
            local v65 = math.max(0.8, v64)
            local v66 = p61.visual_effects.pet_model_attachments.mouth
            if v66 then
                p60.BlushingRight.Parent = v66.Parent
                p60.BlushingLeft.Parent = v66.Parent
                for _, v67 in ipairs({ "BlushingLeft", "BlushingRight" }) do
                    local v68 = v67 == "BlushingLeft" and -1 or 1
                    local v69 = p60[v67]
                    local v70 = v66.Position
                    local v71 = (v65 + 0.1) * v68
                    v69.Position = v70 + Vector3.new(v71, 0.25, 0.25)
                end
                local v72 = p60.BlushingLeft.Beam
                v72.Attachment0 = p60.BlushingLeft
                v72.Attachment1 = p60.BlushingRight
                v72.CurveSize0 = v65 * 2
                v_u_2.tween_number_sequence_property(v72, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), "Transparency", 1, 0):Play()
            end
        end,
        ["pre_destroy"] = function(p73)
            local v74 = p73.BlushingLeft.Beam
            v_u_2.tween_number_sequence_property(v74, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), "Transparency", 0, 1):Play()
            v_u_5.delay(1):await()
        end
    },
    ["sparkly"] = {
        ["asset_names"] = { "Sparkly" },
        ["on_create"] = function(p75)
            p75.Sparkly:Emit(2)
        end,
        ["pre_destroy"] = function(p76)
            local v77 = p76.Sparkly
            v77.Enabled = false
            v_u_5.delay(v77.Lifetime.Max):await()
        end
    },
    ["fast_sparkles"] = {
        ["asset_names"] = { "FastSparkles" },
        ["parent_override"] = "Torso",
        ["pre_destroy"] = function(p78)
            local v79 = p78.FastSparkles
            v79.Enabled = false
            v_u_5.delay(v79.Lifetime.Max):await()
        end
    },
    ["heal_ring"] = {
        ["asset_names"] = { "HealRing" },
        ["parent_override"] = "Torso",
        ["on_create"] = function(p80)
            p80.HealRing.ParticleEmitter:Emit(1)
        end,
        ["pre_destroy"] = function(p81)
            v_u_5.delay(p81.HealRing.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["hearts"] = {
        ["asset_names"] = { "HeartBig", "HeartSmallRight", "HeartSmallLeft" },
        ["on_create"] = function(p82)
            for _, v83 in pairs(p82) do
                for _, v84 in ipairs(v83:GetChildren()) do
                    v84:Emit(1)
                end
            end
        end,
        ["pre_destroy"] = function(_)
            v_u_5.delay(2.5):await()
        end
    },
    ["love"] = {
        ["asset_names"] = { "Love" },
        ["on_create"] = function(p85)
            p85.Love.Gradient:Emit(1)
        end,
        ["pre_destroy"] = function(p86)
            p86.Love.LockedHearts.Enabled = false
            p86.Love.UnlockedHearts.Enabled = false
            v_u_5.delay(p86.Love.LockedHearts.Lifetime.Max):await()
        end
    },
    ["lightbulb"] = {
        ["asset_names"] = { "Lightbulb" },
        ["on_create"] = function(p87)
            p87.Lightbulb.ParticleEmitter:Emit(1)
        end,
        ["pre_destroy"] = function(p88)
            v_u_5.delay(p88.Lightbulb.ParticleEmitter.Lifetime.Max):await()
        end
    },
    ["love_boosted"] = {
        ["asset_names"] = { "Love" },
        ["on_create"] = function(p89)
            p89.Love.LockedHearts.Rate = 20
            p89.Love.LockedHearts.Speed = NumberRange.new(12, 25)
            p89.Love.UnlockedHearts.Rate = 20
            p89.Love.UnlockedHearts.Speed = NumberRange.new(12, 25)
            p89.Love.Gradient:Emit(1)
        end,
        ["pre_destroy"] = function(p90)
            p90.Love.LockedHearts.Enabled = false
            p90.Love.UnlockedHearts.Enabled = false
            v_u_5.delay(p90.Love.LockedHearts.Lifetime.Max):await()
        end
    },
    ["hearts_boosted"] = {
        ["asset_names"] = { "HeartBig", "HeartSmallRight" },
        ["on_create"] = function(p91)
            p91.HeartSmallRight.CFrame = CFrame.new(p91.HeartSmallRight.CFrame.Position)
            p91.HeartSmallRight.Heart.SpreadAngle = Vector2.new(45, 45)
            p91.HeartSmallRight.Heart.RotSpeed = NumberRange.new(-5, 5)
            p91.HeartSmallRight.Heart.Speed = NumberRange.new(10, 12)
            p91.HeartSmallRight.Heart:Emit(10)
            for _, v92 in p91.HeartBig:GetChildren() do
                v92:Emit(1)
            end
        end,
        ["pre_destroy"] = function(_)
            v_u_5.delay(2.5):await()
        end
    },
    ["suds"] = {
        ["asset_names"] = { "Suds" },
        ["parent_override"] = "Torso",
        ["pre_destroy"] = function(p93)
            local v94 = p93.Suds
            v94.Enabled = false
            v_u_5.delay(v94.Lifetime.Max):await()
        end
    }
}
v3.merge("PetVisualEffects", v95)
return v95