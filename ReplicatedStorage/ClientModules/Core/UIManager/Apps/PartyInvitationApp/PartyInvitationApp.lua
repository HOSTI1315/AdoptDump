--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PartyInvitationApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v3 = v1("PlatformM")
local v_u_4 = v1("XboxSupport")
local v5 = v1("Class")
local v_u_6 = v1("CriticalSection")
local v_u_7 = v1("ScriptUtil")
local v_u_8 = v1("HouseDB")
local v_u_9 = v1("ColorThemeManager")
local v_u_10 = v1("Signal")
local v_u_11 = v1("SettingsHelper")
local v_u_12 = v1("InventoryDB")
local v_u_13 = v1("RarityDB")
local v_u_14 = game:GetService("TextChatService")
local v_u_15 = game:GetService("TweenService")
v3.get_platform()
local v_u_16 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v17 = v5("PartyInvitationApp", v1("UIBaseApp"))
function v17.show(_) end
function v17.hide(_) end
local v_u_18 = UDim2.new(0.5, 0, 1, 373)
local v_u_19 = UDim2.new(0.5, 0, 0, -160)
local v_u_20 = UDim2.new(1, 0, 0, 213)
function v17.play_envelope_exit_animation(p21)
    p21.envelope_front.Position = v_u_18
    p21.envelope_back.Position = v_u_18
    p21.envelope_flap.Size = v_u_20
    p21.envelope_flap.AnchorPoint = Vector2.new(0.5, 1)
    p21.envelope_flap.Rotation = 0
    p21.envelope_front.Visible = true
    p21.envelope_back.Visible = true
    p21.envelope_flap.Parent = p21.envelope_back
    v_u_15:Create(p21.envelope_front, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    local v22 = v_u_15:Create(p21.envelope_back, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
    })
    v22:Play()
    v22.Completed:wait()
    wait(0.4)
    p21.envelope_flap.Parent = p21.envelope_front
    local v23 = v_u_15:Create(p21.envelope_flap, TweenInfo.new(0.08, Enum.EasingStyle.Linear), {
        ["Size"] = UDim2.new(1, 0, 0, 0)
    })
    v23:Play()
    v23.Completed:wait()
    p21.envelope_flap.Rotation = 180
    p21.envelope_flap.AnchorPoint = Vector2.new(0.5, 0)
    local v24 = {
        ["Size"] = v_u_20
    }
    local v25 = v_u_15:Create(p21.envelope_flap, TweenInfo.new(0.08, Enum.EasingStyle.Linear), v24)
    v25:Play()
    v25.Completed:wait()
    p21.instance.Frame.Visible = false
    wait(0.65)
    local v26 = {
        ["Position"] = v_u_19
    }
    v_u_15:Create(p21.envelope_front, TweenInfo.new(0.3, Enum.EasingStyle.Linear), v26):Play()
    local v27 = {
        ["Position"] = v_u_19
    }
    local v28 = v_u_15:Create(p21.envelope_back, TweenInfo.new(0.3, Enum.EasingStyle.Linear), v27)
    v28:Play()
    v28.Completed:wait()
    wait(0.5)
    p21.envelope_back.Visible = false
    p21.envelope_front.Visible = false
end
function v17.play_envelope_entrance_animation(p29)
    p29.envelope_front.Position = v_u_19
    p29.envelope_back.Position = v_u_19
    p29.envelope_flap.Size = v_u_20
    p29.envelope_flap.AnchorPoint = Vector2.new(0.5, 0)
    p29.envelope_flap.Rotation = 180
    p29.envelope_front.Visible = true
    p29.envelope_back.Visible = true
    p29.envelope_flap.Parent = p29.envelope_front
    v_u_15:Create(p29.envelope_front, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    local v30 = v_u_15:Create(p29.envelope_back, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
    })
    v30:Play()
    v30.Completed:wait()
    wait(0.4)
    p29.instance.Frame.Visible = true
    local v31 = v_u_15:Create(p29.envelope_flap, TweenInfo.new(0.08, Enum.EasingStyle.Linear), {
        ["Size"] = UDim2.new(1, 0, 0, 0)
    })
    v31:Play()
    v31.Completed:wait()
    p29.envelope_flap.Rotation = 0
    p29.envelope_flap.AnchorPoint = Vector2.new(0.5, 1)
    local v32 = {
        ["Size"] = v_u_20
    }
    local v33 = v_u_15:Create(p29.envelope_flap, TweenInfo.new(0.08, Enum.EasingStyle.Linear), v32)
    v33:Play()
    v33.Completed:wait()
    wait(0.65)
    p29.envelope_flap.Parent = p29.envelope_back
    local v34 = {
        ["Position"] = v_u_18
    }
    v_u_15:Create(p29.envelope_front, TweenInfo.new(0.3, Enum.EasingStyle.Linear), v34):Play()
    local v35 = {
        ["Position"] = v_u_18
    }
    local v36 = v_u_15:Create(p29.envelope_back, TweenInfo.new(0.3, Enum.EasingStyle.Linear), v35)
    v36:Play()
    v36.Completed:wait()
    wait(0.5)
    p29.envelope_back.Visible = false
    p29.envelope_front.Visible = false
end
function v17.show_invitation(p_u_37, p_u_38)
    return p_u_37.critical_section:run(function()
        local v39 = p_u_38.mode
        local v40 = v39 == "build" and true or v39 == "invited"
        assert(v40)
        local v41 = p_u_38.invitation_type
        local v42 = v41 == "special"
        local v43, v44
        if v42 then
            local v45 = p_u_38.pet_kind
            local v46 = v_u_12.pets[v45]
            v43 = v_u_13[v46.rarity].name
            v44 = v46.name
            p_u_37.instance.Frame.SpecialFrame.Inner.Elements.PetFrame.Image = v46.image
        else
            v43 = nil
            v44 = nil
        end
        p_u_37.instance.Frame.SpecialFrame.Visible = v41 == "special"
        p_u_37.instance.Frame.NormalFrame.Visible = v41 == "normal"
        local v47
        if v41 == "special" then
            v47 = p_u_37.instance.Frame.SpecialFrame
        else
            v47 = p_u_37.instance.Frame.NormalFrame
        end
        local v48 = v47.Inner
        local v_u_49 = v48.Elements
        local v50
        if v39 == "build" then
            v50 = not v_u_14:CanUserChatAsync(game.Players.LocalPlayer.UserId)
        else
            v50 = false
        end
        if v50 or p_u_38.party_name == "" then
            p_u_38.party_name = v42 and "LET\'S CELEBRATE!" or "You\'re Invited!"
        end
        if v50 or p_u_38.party_description == "" then
            p_u_38.party_description = not v42 and "Come to my party!" or ("I tamed a %* %*. Come and see!"):format(v43, v44)
        end
        local v51 = v_u_49.PartyDescription
        local v52
        if v50 then
            v52 = false
        else
            v52 = v39 == "build"
        end
        v51.TextEditable = v52
        v_u_49.PartyDescription.Text = p_u_38.party_description or ""
        local v53 = v_u_49.PartyName
        local v54
        if v50 then
            v54 = false
        else
            v54 = v39 == "build"
        end
        v53.TextEditable = v54
        v_u_49.PartyName.Text = p_u_38.party_name or ""
        v_u_49.From.Text = "From: " .. p_u_38.from
        v_u_49.To.Text = "To: " .. p_u_38.to
        p_u_37.buttons = p_u_37.buttons_template:clone()
        p_u_37.buttons.Parent = v48
        p_u_37.buttons.Left.Face.TextLabel.Text = v39 == "build" and "Cancel" or "Decline"
        p_u_37.buttons.Right.Face.TextLabel.Text = v39 == "build" and "Start Party" or "Accept"
        local v55 = v_u_8[p_u_38.building_type]
        v_u_49.HouseImage.Image = v55.image
        v_u_49.Rating.TextLabel.Text = string.format("(%d Ratings)", p_u_38.ratings.quantity)
        local v56 = p_u_38.ratings.stars / 5
        v_u_49.Rating.Fill.Size = UDim2.new(v56, 0, 1, 0)
        v_u_49.Rating.Back.Size = UDim2.new(1 - v56, 0, 1, 0)
        v_u_49.PartyDescription.BackgroundTransparency = v39 == "build" and 0.7 or 1
        v_u_49.PartyName.BackgroundTransparency = v39 == "build" and 0.7 or 1
        v_u_9.set_theme_color_for_specific_app(p_u_37, p_u_38.theme_color)
        p_u_37.cont = v_u_7.create_continue()
        local v57 = {
            ["mouse_button1_click"] = function()
                p_u_37.cont.continue(false)
            end
        }
        p_u_37.UIManager.wrap(p_u_37.buttons.Left, "DepthButton"):start(v57)
        local v58 = {
            ["mouse_button1_click"] = function()
                if v_u_49.PartyDescription.Text == "" or v_u_49.PartyName.Text == "" then
                    p_u_37.UIManager.apps.DialogApp:dialog({
                        ["text"] = "You need to add a party name and description first",
                        ["button"] = "Okay"
                    })
                else
                    p_u_37.cont.continue(true)
                end
            end
        }
        p_u_37.UIManager.wrap(p_u_37.buttons.Right, "DepthButton"):start(v58)
        if v39 == "invited" then
            p_u_37:play_envelope_entrance_animation()
        end
        p_u_37.instance.Frame.Visible = true
        if p_u_37.signal_open then
            p_u_37.signal_open:Fire(p_u_37.buttons.Right)
        end
        local v59 = p_u_37.cont.yield()
        if v59 and v39 == "build" then
            p_u_37:play_envelope_exit_animation()
        end
        p_u_37.buttons:Destroy()
        p_u_37.instance.Frame.Visible = false
        p_u_37.cont = nil
        if p_u_37.signal_close then
            p_u_37.signal_close:Fire()
        end
        if v59 then
            return true, {
                ["party_description"] = v_u_49.PartyDescription.Text,
                ["party_name"] = v_u_49.PartyName.Text,
                ["invitation_type"] = v41,
                ["pet_kind"] = p_u_38.pet_kind
            }
        else
            return false
        end
    end)
end
function v17.close_invitation(p60)
    if p60.cont then
        p60.cont.continue(false)
    end
end
function v17.build(p61, p62)
    local v63 = v_u_2.get("house_manager")
    local v64 = nil
    for _, v65 in pairs(v63) do
        if v65.active then
            v64 = v65
        end
    end
    local v66 = v_u_11.get_setting_client({
        ["setting_id"] = "theme_color"
    })
    local _, v67 = p61:show_invitation({
        ["mode"] = "build",
        ["from"] = game.Players.LocalPlayer.Name,
        ["to"] = v_u_16:Translate(workspace, #game.Players:GetPlayers() - 1 .. " People"),
        ["building_type"] = v64.building_type,
        ["ratings"] = v64.ratings,
        ["theme_color"] = v66,
        ["invitation_type"] = p62 == nil and "normal" or "special",
        ["pet_kind"] = p62
    })
    return v67
end
function v17.start(p_u_68)
    p_u_68.buttons_template = p_u_68.instance.Frame.NormalFrame.Inner.Buttons
    p_u_68.buttons_template.Parent = nil
    p_u_68.critical_section = v_u_6.new()
    p_u_68.instance.Frame.Visible = false
    p_u_68.envelope_back = p_u_68.instance.EnvelopeBack
    p_u_68.envelope_back.Visible = false
    p_u_68.envelope_back.ZIndex = 0
    p_u_68.envelope_front = p_u_68.envelope_back.EnvelopeFront
    p_u_68.envelope_front.Visible = false
    p_u_68.envelope_front.Parent = p_u_68.instance
    p_u_68.envelope_front.ZIndex = 3
    local v69 = p_u_68.instance.Frame.NormalFrame.Inner.Elements
    v69.PartyDescription.PlaceholderText = v_u_16:Translate(workspace, v69.PartyDescription.PlaceholderText)
    v69.PartyName.PlaceholderText = v_u_16:Translate(workspace, v69.PartyName.PlaceholderText)
    local v70 = p_u_68.instance.Frame.SpecialFrame.Inner.Elements
    v70.PartyDescription.PlaceholderText = v_u_16:Translate(workspace, v70.PartyDescription.PlaceholderText)
    v70.PartyName.PlaceholderText = v_u_16:Translate(workspace, v70.PartyName.PlaceholderText)
    p_u_68.envelope_flap = p_u_68.envelope_front.EnvelopeFlap
    p_u_68.signal_open = v_u_10.new()
    p_u_68.signal_close = v_u_10.new()
    v_u_4.watch({
        ["selection_parent"] = p_u_68.instance.Frame,
        ["signal_open"] = p_u_68.signal_open,
        ["signal_close"] = p_u_68.signal_close,
        ["setup_button_actions"] = function()
            game:GetService("ContextActionService"):BindAction(p_u_68.ClassName .. "Close", function(_, p71)
                if p71 == Enum.UserInputState.Begin then
                    p_u_68:close_invitation()
                end
            end, false, Enum.KeyCode.ButtonB)
        end,
        ["teardown_button_actions"] = function()
            game:GetService("ContextActionService"):UnbindAction(p_u_68.ClassName .. "Close")
        end
    })
end
return v17