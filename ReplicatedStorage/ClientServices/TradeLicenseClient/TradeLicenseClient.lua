--// ReplicatedStorage.ClientServices.TradeLicenseClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("TableUtil")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("InteriorsM")
local v_u_6 = v1("AnimationManager")
local v_u_7 = v1("SoundPlayer")
local v_u_8 = v1("UIManager")
local v_u_9 = v1("Raycast")
local v10 = v1("PlatformM")
local v_u_11 = v1("package:Promise")
local v_u_12 = game:GetService("TweenService")
local v_u_13 = game:GetService("Debris")
local v_u_14 = {
    ["num_condensed_slots"] = 9,
    ["num_slots"] = 9,
    ["should_tween_mobile_layout"] = false,
    ["can_add_and_remove_items"] = false,
    ["app"] = v_u_8.apps.TooltipApp,
    ["platform_override"] = v10.platform.desktop
}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local function v_u_27(p22, p23, p24)
    local v25 = game.ReplicatedStorage.Resources.Particles[p22]:Clone()
    v25.CanCollide = false
    v25.Anchored = true
    v25.Position = p23
    v25.Parent = workspace
    for _, v26 in pairs(v25:GetChildren()) do
        if v26:IsA("ParticleEmitter") then
            v26:Emit(p24)
        end
    end
    v_u_13:AddItem(v25, 4)
end
local function v_u_38(p28, p_u_29)
    assert(p28, "Index must be provided to get gate")
    local v30 = v_u_5.get_current_location().interior
    local v31 = p28 or v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    local v32 = v30:FindFirstChild("Gate" .. tostring(v31))
    local v33 = {
        ["CFrame"] = v32.Base.CFrame * CFrame.new(0, -v32.Base.Size.Y * 1.2, 0)
    }
    v_u_27("CorrectAnswer", v32.Base.Position - Vector3.new(0, 10, 0), 10)
    v_u_7.FX:play("GoldSparklePrize", v32.Base)
    v_u_7.FX:play("ClickKeyboardLow", v32.Base)
    v32.PrimaryPart.SurfaceGui.Enabled = false
    local v34 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false)
    local v35 = v_u_12:Create(v32.Display, v34, v33)
    v35.Completed:Connect(function(p36)
        if p_u_29 and p36 == Enum.PlaybackState.Completed then
            p_u_29()
        end
    end)
    v35:Play()
    local v37 = v_u_15
    table.insert(v37, v35)
end
local function v_u_43()
    local v39 = v_u_5.get_current_location().interior
    for v40, v41 in pairs(v_u_15) do
        v41:Cancel()
        v_u_15[v40] = nil
    end
    for _, v42 in pairs(v39:GetChildren()) do
        if string.find(v42.Name, "Gate") then
            v42.Display.CFrame = v42.Base.CFrame
            v42.PrimaryPart.SurfaceGui.Enabled = false
        end
    end
end
local function v_u_53(p44)
    local v45 = v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    assert(v45, "Index must be provided to get gate")
    local v46 = v_u_5.get_current_location().interior
    local v47 = v45 or v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    local v48 = v46:FindFirstChild("Gate" .. tostring(v47))
    v48.PrimaryPart.SurfaceGui.Enabled = true
    local v49 = v48.PrimaryPart.SurfaceGui.Frame.ConfirmationFrame
    if not v_u_18[v48] then
        v_u_18[v48] = {}
    end
    local v50 = v_u_18[v48]
    v50.my_offer = v50.my_offer or v_u_8.wrap(v49.MyOffer, "OfferPane"):start(v_u_14)
    v50.partner_offer = v50.partner_offer or v_u_8.wrap(v49.PartnerOffer, "OfferPane"):start(v_u_14)
    local v51 = v50.my_offer
    local v52 = v50.partner_offer
    v51:set_items(p44.trade.your_offer)
    v51:set_accepted(true)
    v52:set_items(p44.trade.other_offer)
    v52:set_accepted(true)
    v49.PartnerLabel.Text = "STRANGER"
    v49.YouLabel.Text = game.Players.LocalPlayer.Name
end
local function v_u_76()
    local v54 = v_u_5.get_current_location().interior
    local v55 = v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    assert(v55, "Index must be provided to get gate")
    local v56 = v_u_5.get_current_location().interior
    local v57 = v55 or v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    local v58 = v56:FindFirstChild("Gate" .. tostring(v57))
    local v59 = game.Players.LocalPlayer.Character
    v59.Archivable = true
    local v60 = v59:Clone()
    for _, v61 in v60:GetTags() do
        v60:RemoveTag(v61)
    end
    for _, v62 in pairs(v60:GetDescendants()) do
        if v62:IsA("JointInstance") then
            if v62.Part0 and not v62.Part0:IsDescendantOf(v60) then
                v62:Destroy()
            elseif v62.Part1 and not v62.Part1:IsDescendantOf(v60) then
                v62:Destroy()
            end
        end
    end
    v60.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    v60:SetPrimaryPartCFrame(v58.Dummy1.CFrame * CFrame.new(0, v60.Humanoid.HipHeight + v60.PrimaryPart.Size.Y / 2, 0))
    v60.PrimaryPart.Anchored = true
    local v63 = game.ReplicatedStorage.Resources.Dummy:Clone()
    v63:SetPrimaryPartCFrame(v58.Dummy2.CFrame * CFrame.new(0, v63.Humanoid.HipHeight + v63.PrimaryPart.Size.Y / 2, 0))
    v63.PrimaryPart.Anchored = true
    v60:SetPrimaryPartCFrame(CFrame.new(v60.PrimaryPart.Position, v63.PrimaryPart.Position))
    v63:SetPrimaryPartCFrame(CFrame.new(v63.PrimaryPart.Position, v60.PrimaryPart.Position))
    v60.Parent = v54
    v_u_7.FX:play("PopShort", v60.PrimaryPart)
    local v64 = v60.PrimaryPart
    local v65 = game.ReplicatedStorage.Resources.Particles.Clouds:Clone()
    v65.Parent = v64
    v65:Emit(10)
    v_u_13:AddItem(v65, 4)
    local v66 = v60.PrimaryPart
    local v67 = game.ReplicatedStorage.Resources.Particles.Clouds2:Clone()
    v67.Parent = v66
    v67:Emit(10)
    v_u_13:AddItem(v67, 4)
    local v68 = v_u_6.get_track("RobloxDefaultIdle")
    v60.Humanoid:LoadAnimation(v68):Play()
    v_u_11.delay(0.25):await()
    v63.Parent = v54
    v_u_7.FX:play("PopShort", v60.PrimaryPart)
    local v69 = v63.PrimaryPart
    local v70 = game.ReplicatedStorage.Resources.Particles.Clouds:Clone()
    v70.Parent = v69
    v70:Emit(10)
    v_u_13:AddItem(v70, 4)
    local v71 = v63.PrimaryPart
    local v72 = game.ReplicatedStorage.Resources.Particles.Clouds2:Clone()
    v72.Parent = v71
    v72:Emit(10)
    v_u_13:AddItem(v72, 4)
    local v73 = v_u_6.get_track("RobloxDefaultIdle")
    v63.Humanoid:LoadAnimation(v73):Play()
    local v74 = v_u_16
    table.insert(v74, v60)
    local v75 = v_u_16
    table.insert(v75, v63)
    return v60, v63
end
local function v_u_82(p77)
    local v78 = v_u_5.get_current_location().interior
    local v79 = p77.PrimaryPart:Clone()
    v79.Transparency = 1
    v79.CanCollide = false
    v79.Parent = v78
    v_u_13:AddItem(v79, 1)
    v_u_7.FX:play("PopShort", v79)
    local v80 = game.ReplicatedStorage.Resources.Particles.Clouds:Clone()
    v80.Parent = v79
    v80:Emit(5)
    v_u_13:AddItem(v80, 4)
    local v81 = game.ReplicatedStorage.Resources.Particles.Clouds2:Clone()
    v81.Parent = v79
    v81:Emit(5)
    v_u_13:AddItem(v81, 4)
end
local function v_u_87()
    for v83, v84 in pairs(v_u_17) do
        if v84.PrimaryPart then
            local v85 = v84.PrimaryPart:Clone()
            v85.Transparency = 1
            v85.CanCollide = false
            v85.Parent = workspace
            local v86 = game.ReplicatedStorage.Resources.Particles.Clouds:Clone()
            v86.Parent = v85
            v86:Emit(12)
            v_u_13:AddItem(v86, 4)
            v_u_13:AddItem(v85, 4)
        end
        v84:Destroy()
        v_u_17[v83] = nil
    end
end
local function v_u_95(p88, p_u_89)
    v_u_7.FX:play("Click10", p88.PrimaryPart)
    local v90 = p88.Top
    local v91 = game.ReplicatedStorage.Resources.Particles.ButtonSparkles:Clone()
    v91.Parent = v90
    v91:Emit(12)
    v_u_13:AddItem(v91, 4)
    local v92 = {
        ["CFrame"] = p88.TopDown.CFrame
    }
    local v93 = TweenInfo.new(0.01, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false)
    local v_u_94 = v_u_12:Create(p88.Top, v93, v92)
    v_u_94.Completed:Connect(function()
        v_u_11.delay(0.5):await()
        v_u_94:Destroy()
        p_u_89()
    end)
    v_u_94:Play()
end
local function v_u_113(p96, p97, p_u_98, p99)
    local v100 = v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    assert(v100, "Index must be provided to get gate")
    local v101 = v_u_5.get_current_location().interior
    local v102 = v100 or v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    local v103 = v101:FindFirstChild("Gate" .. tostring(v102))
    local v104 = v_u_5.get_current_location().interior
    local v_u_105 = game.ReplicatedStorage.Resources.Button:Clone()
    v_u_105.Parent = v104
    local v106 = Ray.new(p96, Vector3.new(0, -20, 0))
    local _, v107 = v_u_9.FindPartOnRay(v106, { v103, v_u_105 })
    v_u_105:SetPrimaryPartCFrame(CFrame.new(p96.X, v107.Y + v_u_105.PrimaryPart.Size.Y / 2, p96.Z))
    v_u_105.Top.BrickColor = BrickColor.new(p97)
    v_u_105.ButtonBase.BillboardGui.TextLabel.Text = p99
    local function v_u_108()
        v_u_4.get("TradeAPI/AnswerQuizQuestion"):FireServer(p_u_98)
        v_u_87()
    end
    local v_u_109 = false
    v_u_105.Top.Touched:Connect(function(p110)
        if p110.Parent == game.Players.LocalPlayer.Character and not v_u_109 then
            v_u_109 = true
            v_u_95(v_u_105, v_u_108)
        end
    end)
    local v111 = v_u_105.Top
    local v112 = game.ReplicatedStorage.Resources.Particles.Clouds:Clone()
    v112.Parent = v111
    v112:Emit(7)
    v_u_13:AddItem(v112, 4)
    return v_u_105
end
local function v_u_135()
    local v114 = v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager"))
    local v115 = v114.quiz[v114.question_index]
    for v116, v117 in pairs(v_u_16) do
        v117:Destroy()
        v_u_16[v116] = nil
    end
    local v118, v119 = v_u_76()
    for _, v120 in pairs(v115.dialogue) do
        local v121 = v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")) ~= nil
        assert(v121)
        local v122 = v120.speaker == "player" and v118 and v118 or v119
        if v120.anim then
            local v123 = v_u_6.get_track(v120.anim)
            v122.Humanoid:LoadAnimation(v123):Play()
        end
        v_u_8.apps.SpeechBubbleApp:create(v122.Head, v120.text)
        v_u_11.delay(v120.wait_time):await()
    end
    local v124 = v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")) ~= nil
    assert(v124)
    v_u_82(v118)
    v_u_82(v119)
    for v125, v126 in pairs(v_u_16) do
        v126:Destroy()
        v_u_16[v125] = nil
    end
    v_u_53(v115)
    local v127 = v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    assert(v127, "Index must be provided to get gate")
    local v128 = v_u_5.get_current_location().interior
    local v129 = v127 or v_u_3.deep_copy(v_u_2.get("trade_license_quiz_manager")).question_index
    local v130 = v128:FindFirstChild("Gate" .. tostring(v129))
    local v131 = v_u_113(v130.Button1.Position, "Persimmon", "not safe", "Scam")
    local v132 = v_u_113(v130.Button2.Position, "Shamrock", "safe", "Safe")
    local v133 = v_u_17
    table.insert(v133, v131)
    local v134 = v_u_17
    table.insert(v134, v132)
end
local function v_u_142()
    v_u_21:Disconnect()
    v_u_21 = nil
    v_u_19:SetPrimaryPartCFrame(v_u_20)
    v_u_7.FX:play("PopShort", v_u_19.PrimaryPart)
    local v136 = v_u_19.PrimaryPart
    local v137 = game.ReplicatedStorage.Resources.Particles.Clouds:Clone()
    v137.Parent = v136
    v137:Emit(5)
    v_u_13:AddItem(v137, 4)
    local v138 = v_u_19.PrimaryPart
    local v139 = game.ReplicatedStorage.Resources.Particles.Clouds2:Clone()
    v139.Parent = v138
    v139:Emit(5)
    v_u_13:AddItem(v139, 4)
    v_u_87()
    v_u_43()
    for v140, v141 in pairs(v_u_16) do
        v141:Destroy()
        v_u_16[v140] = nil
    end
end
local function v_u_149()
    local v143 = v_u_5.get_current_location().interior.Doors.MainDoor.WorkingParts.TouchToEnter
    local v144 = game.Players.LocalPlayer.Character
    if v144 and v144.PrimaryPart then
        v144:SetPrimaryPartCFrame(v143.CFrame * CFrame.new(0, 0, -9))
        v_u_7.FX:play("PopShort", v144.PrimaryPart)
        local v145 = v144.PrimaryPart
        local v146 = game.ReplicatedStorage.Resources.Particles.Clouds:Clone()
        v146.Parent = v145
        v146:Emit(10)
        v_u_13:AddItem(v146, 4)
        local v147 = v144.PrimaryPart
        local v148 = game.ReplicatedStorage.Resources.Particles.Clouds2:Clone()
        v148.Parent = v147
        v148:Emit(10)
        v_u_13:AddItem(v148, 4)
    end
    v_u_8.apps.DialogApp:dialog({
        ["text"] = "Oh no! That answer was wrong, but you can retake the quiz whenever you want.",
        ["button"] = "Okay"
    })
end
local function v_u_152()
    local v_u_150 = v_u_5.get_current_location().interior
    v_u_21 = game:GetService("RunService").Heartbeat:Connect(function(p151)
        if v_u_150:FindFirstChild("License") and v_u_150.License:FindFirstChild("License") then
            v_u_150.License.License.CFrame = v_u_150.License.License.CFrame * CFrame.Angles(0, 0.7853981633974483 * p151, 0)
        end
    end)
    v_u_20 = v_u_19.PrimaryPart.CFrame
    v_u_82(v_u_19)
    v_u_19:SetPrimaryPartCFrame(v_u_19.PrimaryPart.CFrame * CFrame.new(0, 200, 0))
    v_u_11.delay(2):await()
    v_u_11.defer(v_u_135)
end
return {
    ["set_trade_license_agent_model"] = function(p153)
        v_u_19 = p153
    end,
    ["init"] = function()
        v_u_2.register_callback_plus_existing("trade_license_quiz_manager", function(_, p154, p155)
            if p155 == nil and p154 ~= nil then
                v_u_152()
            elseif p155 ~= nil and p154 == nil then
                v_u_142()
            end
        end)
        v_u_4.get_event("TradeAPI/QuizAnswerReported").OnClientEvent:Connect(function(p156, p_u_157, p158)
            if p156 then
                v_u_38(p158, function()
                    if p_u_157 then
                        v_u_8.apps.DialogApp:dialog({
                            ["text"] = "Congratulations! You passed! Step forward and claim your license!",
                            ["button"] = "Okay"
                        })
                    else
                        v_u_135()
                    end
                end)
            else
                v_u_149()
            end
        end)
    end
}