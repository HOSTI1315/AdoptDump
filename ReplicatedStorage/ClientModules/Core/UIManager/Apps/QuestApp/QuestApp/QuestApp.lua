--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.QuestApp.QuestApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = v_u_1("PlatformM")
local v_u_6 = v_u_1("XboxSupport")
local v_u_7 = v_u_1("QuestsDB")
local v_u_8 = v_u_1("BattlePassDB")
local v_u_9 = v_u_1("ColorThemeDB")
local v_u_10 = v_u_1("SharedConstants")
local v_u_11 = v_u_1("SoundPlayer")
local v_u_12 = v_u_1("TweenPromise")
local v_u_13 = v_u_1("DepthButtonColorDB")
local v_u_14 = v_u_1("LiveOpsTime")
local v_u_15 = v_u_1("QuestHelpDB")
local v_u_16 = v_u_1("AltCurrencyData")
local v_u_17 = v_u_1("QuestTabDB")
local v18 = v_u_1("Maid")
local v_u_19 = v_u_1("new:TutorialHelper")
local v_u_20 = v_u_1("new:TextUtil")
local v_u_21 = v_u_1("package:Promise")
local v_u_22 = v_u_1("package:Sift")
local v_u_23 = game:GetService("TweenService")
local v_u_24 = game:GetService("GuiService")
local v_u_25 = v_u_5.get_platform()
local v26 = v2("QuestApp", v_u_1("UIBaseApp"))
local v_u_27 = {}
local v_u_28 = {}
local v_u_29 = {}
local v_u_30 = nil
local v_u_31 = v18.new()
local function v_u_43(p32, p33)
    local v34 = math.max(p32, 0)
    local v35 = v34 / 86400
    local v36 = math.floor(v35)
    local v37 = v34 % 86400 / 3600
    local v38 = math.floor(v37)
    local v39 = v34 % 3600 / 60
    local v40 = math.floor(v39)
    local v41 = v34 % 60
    local v42 = math.floor(v41)
    if v36 > 0 then
        return v36 .. " days"
    elseif p33 then
        return string.format("%02d:%02d:%02d", v38, v40, v42)
    elseif v38 > 0 then
        return string.format("%d:%02d:%02d", v38, v40, v42)
    elseif v40 > 0 then
        return string.format("%d:%02d", v40, v42)
    else
        return string.format("%02d", v42)
    end
end
local function v_u_56(p44, p45, p46)
    local v47 = math.max(p45, 0)
    local v48 = v47 / 86400
    local v49 = math.floor(v48)
    local v50 = v47 % 86400 / 3600
    local v51 = math.floor(v50)
    local v52 = v47 % 3600 / 60
    local v53 = math.floor(v52)
    local v54 = v47 % 60
    local v55 = math.floor(v54)
    if v49 > 0 then
        return ("%*_days [%*]"):format(p44, v49)
    elseif p46 then
        return string.format(("%*_hms [%%02d] [%%02d] [%%02d]"):format(p44), v51, v53, v55)
    elseif v51 > 0 then
        return string.format(("%*_hms [%%d] [%%02d] [%%02d]"):format(p44), v51, v53, v55)
    elseif v53 > 0 then
        return string.format(("%*_ms [%%d] [%%02d]"):format(p44), v53, v55)
    else
        return string.format(("%*_seconds [%%02d]"):format(p44), v55)
    end
end
local function v_u_64(p57, p58, p59)
    local v60 = Instance.new("ImageLabel")
    v60.Image = p59
    v60.ImageColor3 = Color3.new(1, 1, 1)
    v60.ImageTransparency = p58
    v60.BackgroundTransparency = 1
    v60.Size = UDim2.new(1, 0, 1, 0)
    v60.BorderSizePixel = 0
    v60.ZIndex = 10
    v60.Parent = p57
    local v61 = { Enum.EasingDirection.In, Enum.EasingDirection.Out }
    local v62 = {
        ["time"] = 0.28,
        ["style"] = Enum.EasingStyle.Quad,
        ["direction"] = v61[p58 + 1]
    }
    local v63 = {
        ["goals"] = {
            ["ImageTransparency"] = 1 - p58
        },
        ["info"] = v62
    }
    return {
        ["frame"] = v60,
        ["tween"] = v_u_23:Create(v60, TweenInfo.new(v63.info.time, v63.info.style, v63.info.direction), v63.goals)
    }
end
function v26._get_quest_array(p65)
    local v_u_66 = p65.current_tab
    if v_u_66 then
        v_u_66 = p65.current_tab.name
    end
    return v_u_22.List.filter(v_u_28, function(p67)
        local v68 = v_u_7.all_quests[p67.quest.entry_name]
        if v68 and (v68.tags and #v68.tags > 0) then
            return table.find(v68.tags, v_u_66) ~= nil
        else
            return v_u_66 == "default"
        end
    end)
end
function v26._play_reward_animation(p69, p70, p71)
    local v72 = p71 or {}
    local v73
    if v72 then
        v73 = v72.custom_particles
    else
        v73 = v72
    end
    local v74 = v73 or { p69.particles.Buck, p69.particles.Coin }
    if v73 == nil and p70.reward.is_alt_currency then
        v74 = v_u_22.List.map(v74, function(p75, p76)
            local v77 = p75:Clone()
            local v78
            if p76 == 1 then
                v78 = v_u_16.sprout_images.B
            else
                v78 = v_u_16.sprout_images.A
            end
            v77.Image = v78
            return v77
        end)
    end
    local v79 = Random.new()
    local v80 = v72.particle_count or 7
    while v80 > 0 do
        local v81 = v79:NextInteger(2, 5)
        while v81 > 0 do
            local v_u_82 = v74[v79:NextInteger(1, #v74)]:Clone()
            local v83 = v_u_82.AbsoluteSize
            local v84 = v79:NextInteger(4, 8) / 10
            local v85 = UDim2.new
            local v86 = v79:NextNumber()
            local v87 = math.clamp(v86, 0.1, 0.9)
            local v88 = v79:NextNumber()
            v_u_82.Position = v85(v87, 0, math.clamp(v88, 0.3, 0.7), 0)
            v_u_82.Size = UDim2.new(0, v83.X * v84, 0, v83.Y * v84)
            v_u_82.Rotation = v79:NextInteger(1, 360)
            v_u_82.Visible = true
            v_u_82.Parent = p69.header.ParticleEmitter
            local v89 = v72.tween_goals or {
                ["Position"] = UDim2.new(v_u_82.Position.X.Scale, v_u_82.Position.Y.Offset, 0, workspace.CurrentCamera.ViewportSize.Y + v83.Y),
                ["Rotation"] = v79:NextInteger(1, 360),
                ["Size"] = UDim2.new(0, v83.X, 0, v83.Y)
            }
            if typeof(v89) == "function" then
                v89 = v89(v_u_82, v79)
            end
            local v90 = v72.tween_info or {
                ["time"] = v79:NextNumber(0.8, 1.8),
                ["style"] = Enum.EasingStyle.Quad,
                ["direction"] = Enum.EasingDirection.In
            }
            if typeof(v90) == "function" then
                v90 = v90(v_u_82, v79)
            end
            local v91 = {
                ["goals"] = v89,
                ["info"] = v90
            }
            local v92 = v_u_23:Create(v_u_82, TweenInfo.new(v91.info.time, v91.info.style, v91.info.direction), v91.goals)
            v92.Completed:Connect(function()
                v_u_82:Destroy()
            end)
            v92:Play()
            v81 = v81 - 1
        end
        v80 = v80 - 1
        v_u_21.delay(0.1):await()
    end
end
function v26._play_reroll_animation(p_u_93, p_u_94, p_u_95)
    p_u_93.can_update_from_server = false
    local v_u_96 = v_u_64(p_u_94, 1, p_u_95)
    p_u_94.PushPinLeft.ImageTransparency = 1
    p_u_94.PushPinRight.ImageTransparency = 1
    p_u_94.Body.Title.Tag.ImageTransparency = 1
    v_u_96.tween.Completed:Connect(function()
        p_u_93.can_update_from_server = true
        p_u_93:_update_from_server():andThen(function()
            p_u_94.PushPinLeft.ImageTransparency = 1
            p_u_94.PushPinRight.ImageTransparency = 1
            p_u_94.Body.Title.Tag.ImageTransparency = 1
            local v_u_97 = v_u_64(p_u_94, 0, p_u_95)
            v_u_97.tween.Completed:Connect(function()
                v_u_97.tween:Destroy()
                v_u_97.frame:Destroy()
                p_u_93:_render_quests()
            end)
            v_u_97.tween:Play()
            v_u_96.frame:Destroy()
        end)
        v_u_96.tween:Destroy()
    end)
    v_u_96.tween:Play()
end
function v26._update_time(p98)
    local v99 = v_u_14.now()
    local v100 = p98:_get_quest_array()
    if p98.current_tab == nil or p98.current_tab.name == "default" then
        local v101 = 0
        for _, v102 in v100 do
            if v_u_7.all_quests[v102.quest.entry_name].contributes_to_quest_limit then
                v101 = v101 + 1
            end
        end
        p98.next_quest_sign.Visible = v101 == 0
        p98.next_quest_sign.Frame.TextLabel.Text = v_u_56("ui.task_board.keyed_next_task_in", p98.daily_quest_last_issued_time + v_u_10.daily_quest_frequency - v99)
    else
        p98.next_quest_sign.Visible = #v100 == 0
        p98.next_quest_sign.Frame.TextLabel.Text = "No tasks available!"
    end
    if p98.UIManager.is_visible(p98.ClassName) then
        for _, v103 in p98:_get_quest_array() do
            local v104 = v103.quest.time_expires
            if v104 then
                local v105 = v103.frame.Body.Title.Contents.Expiration
                v105.Visible = true
                v105.Text = v_u_56("ui.task_board.keyed_expires_in", v104 - v99)
            end
        end
    end
end
function v26._start_time_update_loop(p_u_106)
    task.spawn(function()
        while true do
            v_u_21.try(function()
                p_u_106:_update_time()
            end):catch(warn):await()
            task.wait(0.2)
        end
    end)
end
function v26._step_ui_for_quest_entries(p107)
    if p107.UIManager.is_visible(p107.ClassName) then
        for _, v108 in p107:_get_quest_array() do
            if v108.frame then
                local v109 = v_u_7.all_quests[v108.quest.entry_name]
                if v109.is_visible and not v109.is_visible(v108) then
                    v108.frame.Visible = false
                else
                    v108.frame.Visible = true
                    if v109.on_ui_step then
                        local v110 = v_u_29[v108.quest.unique_id]
                        v109.on_ui_step(v108, v110)
                    end
                end
            end
        end
    end
end
function v26._start_ui_stepping_for_quest_entries(p_u_111)
    task.spawn(function()
        while true do
            v_u_21.try(function()
                p_u_111:_step_ui_for_quest_entries()
            end):catch(warn):await()
            task.wait(0.2)
        end
    end)
end
function v26._update_from_server(p_u_112)
    if p_u_112.can_update_from_server then
        return v_u_21.try(function()
            local v113 = v_u_3.get("quest_manager") or {
                ["quests_cached"] = {}
            }
            if not v113.daily_quest_data then
                v113.daily_quest_data = {
                    ["last_quest_issued_time"] = 0,
                    ["recent_quests"] = {},
                    ["rerolls"] = 0,
                    ["event_rerolls"] = 0
                }
            end
            v_u_27 = v113.quests_cached
            p_u_112.daily_quest_last_issued_time = v113.daily_quest_data.last_quest_issued_time
            v_u_28 = {}
            for _, v114 in pairs(v_u_27) do
                if not v_u_29[v114.unique_id] then
                    v_u_29[v114.unique_id] = {}
                end
                local v115 = v_u_28
                table.insert(v115, {
                    ["quest"] = v114
                })
            end
            for v116, _ in pairs(v_u_29) do
                if not v_u_27[v116] then
                    v_u_29[v116] = nil
                end
            end
            p_u_112.can_reroll_daily = v113.daily_quest_data.rerolls > 0
            p_u_112.can_reroll_event = v113.daily_quest_data.event_rerolls > 0
            table.sort(v_u_28, function(p117, p118)
                local v119 = p117.quest
                local v120 = p118.quest
                local v121 = v_u_7.all_quests[v119.entry_name]
                local v122 = v_u_7.all_quests[v120.entry_name]
                local v123 = v_u_7.tutorial_quests[v119.entry_name] ~= nil
                if v123 == (v_u_7.tutorial_quests[v120.entry_name] ~= nil) then
                    if v121.sort_override == v122.sort_override then
                        if v119.steps_completed == v121.total_steps == (v120.steps_completed == v122.total_steps) then
                            return v119.time_added > v120.time_added
                        else
                            return v119.steps_completed == v121.total_steps
                        end
                    else
                        return v121.sort_override > v122.sort_override
                    end
                else
                    return v123
                end
            end)
            p_u_112:_render_quests()
        end)
    end
end
function v26._render_quests(p_u_124)
    if p_u_124.instance.Board.Visible then
        for _, v125 in p_u_124.countdown_timers do
            v125:cancel()
        end
        p_u_124.countdown_timers = {}
        v_u_31:DoCleaning()
        local v126
        if v_u_24.SelectedObject then
            v126 = v_u_24.SelectedObject:GetAttribute("QuestId")
        else
            v126 = nil
        end
        v_u_30 = p_u_124.scrolling_frame.CanvasPosition
        for _, v127 in pairs(p_u_124.scrolling_frame:GetChildren()) do
            if v127:IsA("Frame") and v127 ~= p_u_124.next_quest_sign then
                v127.Parent = nil
            end
        end
        for v128, v_u_129 in p_u_124:_get_quest_array() do
            local v_u_130 = v_u_129.quest
            local v_u_131 = v_u_29[v_u_130.unique_id]
            local v_u_132 = v_u_7.all_quests[v_u_130.entry_name]
            if v_u_132 and (not v_u_19.is_new_tutorial_running() or v_u_130.category == "tutorial_quests") then
                local v133 = v_u_132.frame_info.template
                local v_u_134 = p_u_124.frame_templates[v133]:Clone()
                local v_u_135 = v_u_134.Body
                local v_u_136 = v_u_135.Title.Contents.Squiggle
                local v137 = v_u_134.PushPinLeft
                local v138 = v_u_134.PushPinRight
                local v139 = v_u_132.frame_info.style
                v_u_135.Active = v_u_5.is_using_gamepad()
                v_u_135:SetAttribute("QuestId", v_u_130.unique_id)
                if v139.background_image then
                    v_u_135.Image = v139.background_image
                    v_u_135.ImageColor3 = v139.background_color or v_u_135.ImageColor3
                    v_u_135.BackgroundTransparency = 1
                else
                    v_u_135.BackgroundColor3 = v139.background_color
                end
                v_u_136.Image = v139.squiggle_image
                v_u_136.ImageColor3 = v139.squiggle_color or v_u_136.ImageColor3
                local v140 = v139.push_pin
                v137.Image = v140.image
                v137.Size = v140.size
                v137.ImageRectOffset = Vector2.new(v140.size.X.Offset, 0)
                v137.ImageRectSize = Vector2.new(v140.size.X.Offset * -1, v140.size.Y.Offset)
                v138.Image = v140.image
                v138.Size = v140.size
                local v141 = v_u_130.is_new
                local v_u_142 = v_u_132.reward.is_clientside
                local v_u_143 = v_u_130.steps_completed == v_u_132.total_steps and true or v_u_142
                local v_u_144 = v_u_132.quest_help_entry
                if v_u_144 then
                    v_u_144 = v_u_130.steps_completed == 0
                end
                local v145 = v_u_135.Title.Tag
                local v146
                if v141 or v_u_143 then
                    v146 = not v_u_142
                else
                    v146 = v_u_143
                end
                v145.Visible = v146
                v_u_135.Title.Tag.ImageColor3 = not v_u_143 and v_u_9.themes.red.medium_dark or v_u_9.themes.green.medium_dark
                v_u_135.Title.Tag.TextLabel.Text = v_u_143 and "Claim" or "New"
                if v_u_135:FindFirstChild("Reward") then
                    local v147 = v_u_132.reward.image
                    if v147 and type(v147) == "function" then
                        v147 = v147()
                    end
                    local v148 = v_u_132.reward.image_size
                    if v148 then
                        if v148 and type(v148) == "function" then
                            v148 = v148()
                        end
                        v_u_135.Reward.Icon.ImageLabel.Size = v148 or v_u_135.Reward.Icon.ImageLabel.Size
                    end
                    v_u_135.Reward.Icon.ImageLabel.Image = v147 or v_u_135.Reward.Icon.ImageLabel.Image
                    if v_u_132.reward.text then
                        v_u_135.Reward.Amount.Text = v_u_132.reward.text
                        v_u_135.Reward.Amount.TextColor3 = v_u_132.reward.text_color or Color3.new(0, 0, 0)
                    elseif v_u_132.reward.quantity then
                        local v149 = v_u_25 == "phone" and 4 or 0
                        v_u_135.Reward.Amount.Text = v_u_132.reward.quantity
                        v_u_135.Reward.Amount.TextColor3 = v_u_132.reward.text_color or Color3.new(0, 0, 0)
                        v_u_135.Reward.Icon.ImageLabel.Position = UDim2.new(0.5, -4, 0.5, v149)
                        v_u_135.Reward.Icon.Size = UDim2.new(0, 55, 0, 55)
                    else
                        v_u_135.Reward.Amount.Parent = nil
                        v_u_135.Reward.Icon.ImageLabel.Position = UDim2.new(0.5, -4, 0.5, 0)
                        v_u_135.Reward.Icon.Size = UDim2.new(0, 55, 0, 55)
                    end
                end
                local v_u_150 = v_u_136.QuestName
                v_u_150.Text = v_u_132.name
                v_u_150.TextStrokeColor3 = v139.title_stroke_color or v_u_150.TextStrokeColor3
                v_u_150.TextStrokeTransparency = v139.title_stroke_color and 0 or 1
                v_u_150.RichText = v_u_132.rich_text or false
                local v_u_151 = v_u_135.ButtonFrame.Button.Face.TextLabel
                if v_u_143 then
                    v_u_151.Text = v_u_132.reward.claim_text or "Claim!"
                elseif v_u_144 then
                    v_u_151.Text = "Help"
                elseif v_u_132.step_type == "durational" then
                    local v152 = v_u_132.total_steps - v_u_130.steps_completed
                    if v_u_131.duration == nil then
                        v_u_131.duration = v152
                        v_u_151.Text = v_u_43(v152)
                    else
                        if v_u_131.duration_promise then
                            v_u_131.duration_promise:cancel()
                        end
                        local v153 = v_u_131.duration - v152
                        if math.abs(v153) > 7 then
                            v_u_131.duration = v152 + 5
                        end
                        v_u_131.duration_promise = v_u_12.callback(v_u_131.duration, v152, TweenInfo.new(5, Enum.EasingStyle.Linear), function(p154)
                            v_u_131.duration = p154
                            v_u_151.Text = v_u_43(p154)
                        end)
                    end
                else
                    v_u_151.Text = v_u_130.steps_completed .. "/" .. v_u_132.total_steps
                end
                v_u_134.Parent = p_u_124.scrolling_frame
                local v155 = v_u_132.plaintext_name or v_u_150.Text
                v_u_20.on_text_bounds({
                    ["Instance"] = v_u_150,
                    ["Text"] = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer):Translate(v_u_150, v155),
                    ["ContainerWidth"] = v_u_150.AbsoluteSize.X
                }, function(p156)
                    local v157 = v_u_134
                    local v158 = UDim2.fromOffset
                    local v159 = v_u_134.AbsoluteSize.X
                    local v160 = v_u_134.AbsoluteSize.Y
                    local v161 = p156.Y + 18
                    local v162 = math.ceil(v161) + v_u_134.AbsoluteSize.Y - v_u_150.AbsoluteSize.Y
                    v157.Size = v158(v159, (math.max(v160, v162)))
                    local v163 = v_u_136
                    local v164 = UDim2.fromOffset
                    local v165 = v_u_136.AbsoluteSize.X
                    local v166 = v_u_136.AbsoluteSize.Y
                    local v167 = p156.Y + 18
                    local v168 = math.ceil(v167)
                    v163.Size = v164(v165, (math.max(v166, v168)))
                    local v169 = v_u_150
                    local v170 = UDim2.fromOffset
                    local v171 = v_u_150.AbsoluteSize.X
                    local v172 = v_u_150.AbsoluteSize.Y
                    local v173 = p156.Y + 18
                    local v174 = math.ceil(v173)
                    v169.Size = v170(v171, (math.max(v172, v174)))
                end)
                v_u_28[v128].frame = v_u_134
                local function v_u_175()
                    if v_u_143 then
                        v_u_30 = p_u_124.scrolling_frame.CanvasPosition
                        if v_u_142 then
                            p_u_124.UIManager.set_app_visibility(p_u_124.ClassName, false)
                            v_u_132.reward.callback(v_u_129, v_u_131)
                        elseif v_u_4.get("QuestAPI/ClaimQuest"):InvokeServer(v_u_130.unique_id) then
                            if not v_u_132.reward.disable_reward_fanfare then
                                v_u_11.Interface:play("TaskBoard/Reward")
                                p_u_124:_play_reward_animation(v_u_132)
                            end
                            v_u_134:Destroy()
                            if v_u_132.reward.close_app_on_claim then
                                p_u_124.UIManager.set_app_visibility(p_u_124.ClassName, false)
                            end
                        end
                        return true
                    end
                end
                local v_u_176 = v_u_132.can_reroll
                if v_u_176 then
                    v_u_176 = not v_u_143
                end
                if v_u_132.category == "daily_quests" then
                    if v_u_176 then
                        v_u_176 = p_u_124.can_reroll_daily
                    end
                elseif v_u_176 then
                    v_u_176 = p_u_124.can_reroll_event
                end
                v_u_135.Title.RerollButton.Visible = v_u_176
                local v177 = {
                    ["mouse_button1_click"] = function()
                        if v_u_176 then
                            v_u_11.Interface:play("TaskBoard/Reroll")
                            p_u_124:_play_reroll_animation(v_u_134, v_u_135.Image)
                            v_u_4.get("QuestAPI/RerollQuest"):FireServer(v_u_130.unique_id)
                        end
                    end
                }
                p_u_124.UIManager.wrap(v_u_135.Title.RerollButton, "DepthButton"):start(v177)
                if v_u_144 then
                    local v178 = {
                        ["mouse_button1_click"] = function()
                            if v_u_144 then
                                v_u_15[v_u_132.quest_help_entry](game.Players.LocalPlayer, p_u_124.UIManager)
                            end
                        end,
                        ["state"] = "normal"
                    }
                    p_u_124.UIManager.wrap(v_u_135.ButtonFrame.Button, "DepthButton"):start(v178):set_color_from_entry(v_u_13.orange, true)
                else
                    v_u_131.claim_button = p_u_124.UIManager.wrap(v_u_135.ButtonFrame.Button, "DepthButton"):start({
                        ["mouse_button1_click"] = function()
                            v_u_175()
                        end,
                        ["state"] = v_u_143 and "normal" or "unpressable"
                    })
                end
                if v_u_5.is_using_gamepad() then
                    v_u_135.Activated:Connect(function(p179)
                        if p179.KeyCode == Enum.KeyCode.ButtonA then
                            local v180
                            if v_u_176 then
                                v_u_11.Interface:play("TaskBoard/Reroll")
                                p_u_124:_play_reroll_animation(v_u_134, v_u_135.Image)
                                v_u_4.get("QuestAPI/RerollQuest"):FireServer(v_u_130.unique_id)
                                v180 = true
                            else
                                v180 = nil
                            end
                            if v180 then
                                return
                            end
                            if v_u_175() then
                                return
                            end
                            if v_u_144 then
                                v_u_15[v_u_132.quest_help_entry](game.Players.LocalPlayer, p_u_124.UIManager)
                            end
                        end
                    end)
                    if v126 == v_u_130.unique_id then
                        p_u_124.watch:select_object(v_u_135)
                    end
                    if v_u_24.SelectedObject == p_u_124.header.Top.ExitButton and v128 == 1 then
                        p_u_124.watch:select_object(v_u_135)
                    end
                end
            end
        end
        local v181 = p_u_124.battle_pass_button.instance
        local v182 = v_u_10.festival_event
        local v183 = v182.enabled and v182.battle_pass_entry_name
        if v183 then
            v183 = v182.battle_pass_accessible_in_quest_app
        end
        if v183 then
            local v184 = v_u_8[v_u_10.festival_event.battle_pass_entry_name].display_name
            v181.Face.TextLabel.Text = v184
            v181.Visible = true
        else
            v181.Visible = false
        end
        p_u_124:_update_time()
        p_u_124:_step_ui_for_quest_entries()
        local v185 = p_u_124.current_tab
        if v185 then
            v185 = p_u_124.current_tab.render
        end
        if v185 then
            v185(p_u_124.instance.Board, v_u_31)
        end
        p_u_124.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, p_u_124.scrolling_frame.UIListLayout.AbsoluteContentSize.Y + 35)
        p_u_124.scrolling_frame.CanvasPosition = v_u_30 or p_u_124.scrolling_frame.CanvasPosition
    end
end
function v26.render_tabs(p186)
    local v187 = p186.secondary_tab_index
    p186.primary_tab_index = 1
    local v188 = nil
    for v189, v190 in v_u_17 do
        if v189 ~= p186.primary_tab_index and (v190.is_visible == nil or v190.is_visible()) then
            v188 = v189
            break
        end
    end
    if v188 == v187 then
        p186:select_tab(not p186.current_tab and "default" or p186.current_tab.name)
    else
        p186.secondary_tab_index = v188
        local v191 = p186.header.Top.Title
        local v192 = p186.primary_tab_index
        if v192 then
            v192 = v_u_17[p186.primary_tab_index]
        end
        local v193 = p186.secondary_tab_index
        if v193 then
            v193 = v_u_17[p186.secondary_tab_index]
        end
        if v193 then
            v191.Visible = false
            p186.tab_frame.Visible = true
            p186.primary_tab_button.instance.Face.ImageLabel.Image = v192.icon
            p186.primary_tab_button.instance.Face.TextLabel.Text = v192.text
            p186.secondary_tab_button.instance.Face.ImageLabel.Image = v193.icon
            p186.secondary_tab_button.instance.Face.TextLabel.Text = v193.text
        else
            v191.Visible = true
            p186.tab_frame.Visible = false
        end
        p186:select_tab_index(p186.primary_tab_index)
    end
end
function v26.select_tab(p194, p195, p196)
    local v197 = p195 or "default"
    for v198, v199 in v_u_17 do
        if v199.name == v197 then
            p194:select_tab_index(v198, p196)
            return
        end
    end
    warn("No tab found of kind:", v197)
end
function v26.select_tab_index(p200, p201)
    if p200.primary_tab_index == p201 or p200.secondary_tab_index == p201 then
        if v_u_17[p201] ~= nil then
            p200.current_tab = v_u_17[p201]
            local v202 = p201 == p200.primary_tab_index
            p200.primary_tab_button:set_state(v202 and "selected" or "normal")
            p200.secondary_tab_button:set_state(v202 and "normal" or "selected")
            p200:_render_quests()
        end
    else
        return
    end
end
function v26.get_current_tab_instance(p203)
    if v_u_5.is_using_gamepad() and p203.tab_frame.Visible then
        if p203.primary_tab_index == p203.current_tab.index then
            return p203.primary_tab_button.instance
        else
            return p203.secondary_tab_button.instance
        end
    else
        return nil
    end
end
function v26.show(p_u_204)
    p_u_204.instance.Board.Visible = true
    p_u_204.app_has_been_opened = true
    p_u_204:render_tabs()
    p_u_204:_render_quests()
    v_u_11.Interface:play("TaskBoard/Open")
    v_u_1("CoreUIInsetHelper").run_once_if_intersecting(p_u_204.exit_button.instance, function(p205)
        p_u_204.exit_button.instance.Position = p_u_204.exit_button.instance.Position + UDim2.fromOffset(-p205 - 4, 0)
    end)
end
function v26.hide(p206)
    if p206.instance.Board.Visible and p206.app_has_been_opened then
        for _, v207 in pairs(v_u_27) do
            if v207.is_new then
                v_u_4.get("QuestAPI/MarkQuestsViewed"):FireServer()
                break
            end
        end
    end
    p206.instance.Board.Visible = false
    if p206.is_initial_hide then
        p206.is_initial_hide = false
    else
        v_u_11.Interface:play("TaskBoard/Close")
    end
    for _, v208 in p206.countdown_timers do
        v208:cancel()
    end
    p206.countdown_timers = {}
    v_u_30 = nil
end
function v26.refresh(p209, p210)
    local v211 = p209.UIManager.is_closed({
        "MainMenuApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "TradePreviewApp",
        "TradeHistoryApp",
        "MinigameInGameApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp"
    })
    if not p210[p209.ClassName] then
        v211 = false
    end
    if p209.UIManager.apps.HouseEditorWrapperApp.editor_open and p209.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v211 = false
    end
    p209:set_visibility(v211)
end
function v26.start(p_u_212)
    local v_u_213 = p_u_212.instance.Desktop
    local v_u_214 = p_u_212.instance.Phone
    v_u_5.run({
        ["desktop"] = function()
            local v215 = workspace.CurrentCamera.ViewportSize
            if v215.X < 746 or v215.Y < 464 then
                v_u_213:Destroy()
                v_u_214.Name = "Board"
            else
                v_u_214:Destroy()
                v_u_213.Name = "Board"
            end
        end,
        ["phone"] = function()
            v_u_213:Destroy()
            v_u_214.Name = "Board"
        end,
        ["tablet"] = "desktop",
        ["console"] = "desktop"
    })
    p_u_212.sized_for_phone = v_u_214.Parent ~= nil
    p_u_212.body = p_u_212.instance.Board.Body.Contents
    p_u_212.header = p_u_212.instance.Board.Header
    p_u_212.particles = p_u_212.instance.Board.Particles
    p_u_212.scrolling_frame = p_u_212.body.ScrollingFrame
    p_u_212.next_quest_sign = p_u_212.scrolling_frame.NextQuestSign
    p_u_212.tab_frame = p_u_212.instance.Board.Tabs
    p_u_212.tab_content = p_u_212.instance.Board.TabContent
    for _, v216 in p_u_212.tab_content:GetChildren() do
        v216.Visible = false
    end
    p_u_212.frame_templates = {}
    for _, v217 in pairs(p_u_212.scrolling_frame:GetChildren()) do
        if v217:IsA("Frame") and v217 ~= p_u_212.next_quest_sign then
            v217.Parent = nil
            p_u_212.frame_templates[v217.Name] = v217
        end
    end
    p_u_212.countdown_timers = {}
    p_u_212.daily_quest_last_issued_time = 0
    p_u_212.can_reroll_daily = false
    p_u_212.can_reroll_event = false
    p_u_212.can_update_from_server = true
    p_u_212.exit_button = p_u_212.UIManager.wrap(p_u_212.header.Top.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_212.UIManager.set_app_visibility(p_u_212.ClassName, false)
        end
    })
    local v220 = {
        ["mouse_button1_click"] = function()
            local v218 = v_u_10.festival_event
            local v219 = v218.enabled and v218.battle_pass_entry_name
            if v219 then
                v219 = v218.battle_pass_accessible_in_quest_app
            end
            if v219 then
                p_u_212.UIManager.apps.BattlePassApp:view(v_u_10.festival_event.battle_pass_entry_name)
            end
        end
    }
    p_u_212.battle_pass_button = p_u_212.UIManager.wrap(p_u_212.header.Top.BattlePassButton, "DepthButton"):start(v220)
    p_u_212.primary_tab_button = p_u_212.UIManager.wrap(p_u_212.tab_frame.Primary, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_212:select_tab_index(p_u_212.primary_tab_index)
        end
    })
    p_u_212.secondary_tab_button = p_u_212.UIManager.wrap(p_u_212.tab_frame.Secondary, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_212:select_tab_index(p_u_212.secondary_tab_index)
        end
    })
    v_u_3.register_server_on_change_hook("quest_manager", nil, function(_, _, _)
        p_u_212:_update_from_server()
    end)
    if v_u_19.is_new_tutorial_running() then
        v_u_19.new_tutorial_completed_promise():andThen(function()
            p_u_212:_update_from_server()
        end)
    end
    p_u_212:_update_from_server()
    p_u_212:_start_time_update_loop()
    p_u_212:_start_ui_stepping_for_quest_entries()
    p_u_212.watch = v_u_6.quick_watch({
        ["selection_parent"] = p_u_212.instance.Board,
        ["default_selection"] = function()
            return p_u_212:get_current_tab_instance() or p_u_212.header.Top.ExitButton
        end,
        ["app_name"] = p_u_212.ClassName,
        ["save_last_selection"] = false,
        ["exit_buttons"] = { p_u_212.header.Top.ExitButton }
    })
    p_u_212.is_initial_hide = true
end
return v26