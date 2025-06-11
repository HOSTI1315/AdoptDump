--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.SpeechBubbleApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("RouterClient")
local v5 = v1("Class")
local v_u_6 = v1("ColorThemeManager")
local v_u_7 = v1("new:StreamingHelper")
local v_u_8 = v1("new:PetRigs")
local v_u_9 = v1("package:Promise")
local v_u_10 = v1("package:Sift")
local v_u_11 = game:GetService("TextService")
local v_u_12 = game:GetService("TweenService")
local v_u_13 = game:GetService("TextChatService")
local v_u_14 = v_u_3.get_platform()
local v15 = v5("SpeechBubbleApp", v1("UIBaseApp"))
local v_u_16 = Font.fromEnum(Enum.Font.Cartoon)
local v_u_17 = Font.fromEnum(Enum.Font.Cartoon)
v_u_17.Style = Enum.FontStyle.Italic
local function v_u_26(p18, p19, p20)
    local v21 = p18.bubble_template.UIPadding.PaddingBottom.Offset * 2
    local v22 = v_u_14 == v_u_3.platform.phone and 300 or 400
    local v23 = Vector2.new(v22, 400)
    local v24 = v_u_11:GetTextSize(p20, p19.Speech.TextSize, Enum.Font.Cartoon, v23) + Vector2.new(1, 1)
    local v25 = v24 + Vector2.new(v21 * 2, v21 * 1.5)
    return UDim2.new(0, v25.X, 0, v25.Y), v24
end
function v15.create(p_u_27, p_u_28, p_u_29, p30)
    local v_u_31 = p30 or {}
    local v_u_32 = v_u_31.always_on_top
    local v33 = v_u_31.dont_translate
    local v34 = v_u_31.indefinite_length
    local v_u_35 = v_u_31.length
    if not v_u_35 then
        local v36 = string.len(p_u_29) / 5
        v_u_35 = math.clamp(v36, 6, 11)
    end
    local v37 = v_u_31.displayed_quickly or false
    local v_u_38 = v_u_31.max_distance or 120
    local v39 = v_u_31.italicized or false
    local v_u_40 = v_u_31.on_destroyed
    local v_u_41 = v_u_31.max_bubbles or 4
    local v_u_42 = p_u_28.Parent
    if p_u_28.Parent and p_u_28.Parent:FindFirstChild("PetModel") then
        local v43 = p_u_28.Parent.PetModel
        p_u_28 = v_u_8.get(v43).get_part(v43, "Head") or p_u_28
    end
    if p_u_28:FindFirstChild("SpeechBubbleApp") == nil then
        local v44 = p_u_27.billboard_template:Clone()
        v44:ClearAllChildren()
        v44.Parent = p_u_28
        if v_u_31.max_distance then
            v44.MaxDistance = v_u_31.max_distance
        end
    end
    p_u_27.UIManager.apps.PlayerNameApp:set_name_visible(v_u_42, false)
    local v_u_45 = p_u_27.bubble_template:Clone()
    v_u_45.Parent = p_u_28.SpeechBubbleApp
    if v_u_32 then
        p_u_28.SpeechBubbleApp.AlwaysOnTop = true
    end
    if not v33 then
        p_u_29 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer):Translate(v_u_45.Speech, p_u_29)
    end
    v_u_45.Speech.FontFace = v39 and v_u_17 or v_u_16
    v_u_45.BubbleTriangle.Visible = true
    v_u_45.Speech.TextWrapped = false
    local v46 = p_u_27.bubble_template.BubbleTriangle.Size
    local v47, v48 = v_u_26(p_u_27, v_u_45, p_u_29)
    local v49 = Instance.new("IntValue")
    v49.Name = "FinalHeight"
    v49.Value = v47.Y.Offset
    v49.Parent = v_u_45
    v_u_45.Speech.AutoLocalize = false
    v_u_45.Speech.Text = ""
    v_u_45.Speech.TextWrapped = true
    v_u_45.Speech.TextTransparency = 0
    v_u_45.Speech.Size = UDim2.new(0, v48.X, 0, v48.Y)
    v_u_45.Size = UDim2.new(0, v48.X - 10, 0, 0)
    v_u_45.BubbleTriangle.Size = UDim2.new(0, 15, 0, 0)
    v_u_12:Create(v_u_45, TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        ["Size"] = v47
    }):Play()
    v_u_12:Create(v_u_45.BubbleTriangle, TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        ["Size"] = v46
    }):Play()
    if v_u_31.TextColor3 then
        v_u_45.Speech.TextColor3 = v_u_31.TextColor3
    end
    local v_u_50 = nil
    local v_u_51 = nil
    local v_u_52 = false
    local function v_u_53()
        if not v_u_52 then
            v_u_52 = true
            v_u_50:Disconnect()
            v_u_51:Disconnect()
            v_u_45:Destroy()
            v_u_45 = nil
            if p_u_28 and (p_u_28:FindFirstChild("SpeechBubbleApp") == nil or #p_u_28.SpeechBubbleApp:GetChildren() == 0) then
                p_u_27.UIManager.apps.PlayerNameApp:set_name_visible(v_u_42, true)
            end
            if v_u_40 then
                v_u_40()
            end
        end
    end
    v_u_51 = v_u_45.AncestryChanged:Connect(function(_, p54)
        if not p54 then
            v_u_53()
        end
    end)
    local v_u_55 = v_u_45.Position
    v_u_50 = p_u_28.SpeechBubbleApp.ChildAdded:Connect(function(p56)
        if v_u_41 <= #p_u_28.SpeechBubbleApp:GetChildren() and p_u_28.SpeechBubbleApp:GetChildren()[1] == v_u_45 then
            v_u_53()
        else
            v_u_55 = v_u_55 - UDim2.new(0, 0, 0, p56:WaitForChild("FinalHeight").Value + 10)
            local v57 = {
                ["Position"] = v_u_55
            }
            v_u_12:Create(v_u_45, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v57):Play()
            v_u_45.BubbleTriangle.Visible = false
            p56.ChildAdded:Connect(function(p58)
                if p58.Name == "HeightAdjustment" and v_u_45 then
                    v_u_55 = v_u_55 - UDim2.new(0, 0, 0, p58.Value)
                    v_u_45.Position = v_u_55
                end
            end)
        end
    end)
    if not v34 then
        spawn(function()
            if p_u_28 then
                local v59 = p_u_28.Position
                local v60 = v_u_38
                local v61 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if v61 then
                    v61 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                end
                if v61 then
                    v61 = (v59 - v61).magnitude <= v60
                end
                if v61 and not v_u_32 then
                    local v62 = tick()
                    while tick() - v62 < v_u_35 do
                        local v63 = p_u_28
                        if v63 then
                            local v64 = p_u_28.Position
                            v63 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if v63 then
                                v63 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                            end
                            if v63 then
                                v63 = (v64 - v63).magnitude <= 20.1
                            end
                        end
                        if p_u_28 and p_u_28:FindFirstChild("SpeechBubbleApp") then
                            p_u_28.SpeechBubbleApp.AlwaysOnTop = v63
                        end
                        wait(0.1)
                    end
                    ::l13::
                    v_u_53()
                    return
                end
            end
            wait(v_u_35)
            goto l13
        end)
    end
    delay(v37 and 0.1 or 0.5, function()
        if v_u_45 and v_u_45:FindFirstChild("Speech") then
            v_u_45.Speech.Text = p_u_29
        end
    end)
    p_u_28.SpeechBubbleApp.StudsOffsetWorldSpace = v_u_2.get("team") == "Babies" and Vector3.new(0, 0.7, 0) or Vector3.new(0, 1.2, 0)
    if v_u_31.skippable_time and v_u_31.skippable_time > 0.5 then
        v_u_9.delay(0.5):andThen(function()
            return v_u_9.race({ v_u_9.delay(v_u_31.skippable_time - 0.5), v_u_9.fromEvent(p_u_27.instance.FullscreenSkipButton[v_u_3.mouse_down_or_click()]), v_u_9.fromEvent(game:GetService("UserInputService").InputBegan, function(p65)
                    local v66
                    if p65.UserInputState == Enum.UserInputState.Begin then
                        v66 = p65.KeyCode == Enum.KeyCode.ButtonX
                    else
                        v66 = false
                    end
                    return v66
                end) })
        end):await()
    end
    return v_u_53
end
function v15.create_for_character(p67, p68, p69, p70)
    if p68 and p68:FindFirstChild("Head") then
        local v71 = v_u_10.Dictionary.join({
            ["TextColor3"] = v_u_6.lookup("saturated")
        }, p70)
        p67:create(p68.Head, p69, v71)
    end
end
function v15.show_fullscreen_skip_button(p72)
    p72.instance.FullscreenSkipButton.Visible = true
end
function v15.hide_fullscreen_skip_button(p73)
    p73.instance.FullscreenSkipButton.Visible = false
end
function v15.show(_) end
function v15.hide(_) end
function v15.start(p_u_74)
    p_u_74.billboard_template = p_u_74.instance.SpeechBubbleBillboardTemplate
    p_u_74.billboard_template.Name = "SpeechBubbleApp"
    p_u_74.billboard_template.Parent = nil
    p_u_74.rich_text_converter = Instance.new("TextLabel")
    p_u_74.rich_text_converter.RichText = true
    p_u_74.bubble_template = p_u_74.billboard_template.Bubble:Clone()
    if v_u_14 == v_u_3.platform.phone then
        p_u_74.bubble_template.Speech.TextSize = 20
        p_u_74.bubble_template.BubbleTriangle.Position = UDim2.new(0.5, 0, 1, 5)
        p_u_74.bubble_template.BubbleTriangle.Size = UDim2.new(0, 15, 0, 7)
        p_u_74.bubble_template.UIPadding.PaddingBottom = UDim.new(0, 5)
        p_u_74.bubble_template.UIPadding.PaddingLeft = UDim.new(0, 5)
        p_u_74.bubble_template.UIPadding.PaddingRight = UDim.new(0, 5)
        p_u_74.bubble_template.UIPadding.PaddingTop = UDim.new(0, 5)
    end
    v_u_4.get_event("MsgAPI/MsgCreated").OnClientEvent:Connect(function(p75, p76)
        local v77 = v_u_7.get(p75)
        if v77 then
            p_u_74:create_for_character(v77, p76)
        end
    end)
    v_u_13.MessageReceived:Connect(function(p78)
        p_u_74.rich_text_converter.Text = p78.Text
        local v79 = p_u_74.rich_text_converter.ContentText
        local v80 = p78.TextSource
        if v80 then
            v80 = game.Players:GetPlayerByUserId(p78.TextSource.UserId)
        end
        local v81 = v80 and v80.Character
        if v81 then
            v81 = v80.Character:FindFirstChild("Head")
        end
        if v81 and p78.TextSource.CanSend then
            p_u_74:create(v81, v79, {
                ["dont_translate"] = true
            })
        end
    end)
end
return v15