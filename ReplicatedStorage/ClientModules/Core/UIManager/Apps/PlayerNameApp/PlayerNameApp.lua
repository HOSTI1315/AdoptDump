--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerNameApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v3 = v_u_1("Class")
local v_u_4 = v_u_1("Set")
local v_u_5 = v_u_1("TableUtil")
local v_u_6 = v_u_1("CharWrapperClient")
local v_u_7 = v_u_1("new:AilmentsClient")
local v_u_8 = v_u_1("AboveCharStack")
local v_u_9 = v_u_1("DelayedUpdateBuffer")
local v_u_10 = v_u_1("PetProgressionDB")
local v_u_11 = v_u_1("InventoryDB")
local v_u_12 = v_u_1("SettingsHelper")
local v_u_13 = v_u_1("RoleplayDB")
local v_u_14 = v_u_1("ColorThemeManager")
local v_u_15 = v_u_1("PlatformM")
local v_u_16 = v_u_1("EquippedPets")
local v_u_17 = v_u_1("new:TextUtil")
local v_u_18 = v_u_1("BucksAgingMultiplierHelper")
local v_u_19 = v_u_1("Debug").create_log()
local v_u_20 = game:GetService("Players")
local v_u_21 = game:GetService("RunService")
local v_u_22 = game:GetService("TweenService")
local v_u_23 = {
    ["founder"] = {
        ["icon"] = "rbxassetid://5269331469",
        ["text_color_3"] = Color3.fromRGB(221, 153, 255),
        ["text_stroke_color_3"] = Color3.fromRGB(61, 38, 81)
    },
    ["developer"] = {
        ["icon"] = "rbxassetid://5269331469",
        ["text_color_3"] = Color3.fromRGB(221, 153, 255),
        ["text_stroke_color_3"] = Color3.fromRGB(61, 38, 81)
    },
    ["staff"] = {
        ["icon"] = "rbxassetid://5269331469",
        ["text_color_3"] = Color3.fromRGB(221, 153, 255),
        ["text_stroke_color_3"] = Color3.fromRGB(61, 38, 81)
    },
    ["influencer"] = {
        ["icon"] = "rbxassetid://5269331158",
        ["text_color_3"] = Color3.fromRGB(255, 0, 0),
        ["text_stroke_color_3"] = Color3.fromRGB(255, 255, 255)
    },
    ["vip"] = {
        ["icon"] = "rbxassetid://18536111292",
        ["text_color_3"] = Color3.fromRGB(255, 170, 0),
        ["text_stroke_color_3"] = Color3.fromRGB(240, 36, 0)
    }
}
local v24 = v3("PlayerNameApp", v_u_1("UIBaseApp"))
function v24.show(p25)
    p25:set_global_visible(true)
end
function v24.hide(p26)
    p26:set_global_visible(false)
end
function v24.refresh(p27, _)
    local v28 = p27.UIManager.is_closed({
        "AvatarEditorApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "FocusPetApp",
        "MockFocusPetApp"
    })
    if p27.hidden then
        v28 = false
    end
    p27:set_visibility(v28)
end
function v24.set_hidden(p29, p30)
    p29.hidden = p30
    p29:set_visibility(not p30)
end
function v24.set_name_visible(p31, p32, p33)
    p31.name_visibilities[p32] = p33
    local v34 = v_u_8.get(p32)
    if v34 then
        v34:set_visible(p33)
    end
end
function v24.set_global_visible(_, p35)
    v_u_8.set_global_visible(p35)
end
function v24.set_only_display_minigame_components(p36, p37)
    p36.only_display_minigame_components = p37
end
function v24.set_allow_charhider_components(p38, p39)
    p38.allow_charhider_components = p39
end
function v24.set_hide_age_bar(p40, p41)
    p40.hide_age_bar = p41
end
function v24.set_force_username(p42, p43, p44)
    local v45 = typeof(p43) == "Instance"
    assert(v45)
    local v46 = typeof(p44) == "boolean"
    assert(v46)
    if p44 then
        p42.forced_usernames[p43] = true
    else
        p42.forced_usernames[p43] = nil
    end
    p42:_refresh_above_char_stack(p43)
end
local function v_u_60(p_u_47, p48, p49)
    p49.Visible = true
    p49.BackgroundTransparency = 1
    v_u_17.on_text_bounds({
        ["FontFace"] = p_u_47.BillboardGui.Frame.PlayerName.FontFace,
        ["FontSize"] = 50,
        ["Text"] = p48
    }, function(p50)
        local v51 = p50.X / p50.Y
        local v52 = p_u_47
        local v53 = p_u_47.Size.Y * v51
        local v54 = p_u_47.Size.Y
        local v55 = p_u_47.Size.Z
        v52.Size = Vector3.new(v53, v54, v55)
        p_u_47.BillboardGui.Size = UDim2.new(p_u_47.BillboardGui.Size.Y.Scale * v51, 0, p_u_47.BillboardGui.Size.Y.Scale, 0)
    end)
    local v56 = p_u_47.Size
    local v57 = p_u_47.Size.Y
    p_u_47.Size = v56 + Vector3.new(v57, 0, 0)
    p_u_47.BillboardGui.Size = p_u_47.BillboardGui.Size + UDim2.new(p_u_47.BillboardGui.Size.Y.Scale, 0, 0, 0)
    local v58 = p_u_47.Size.Y / p_u_47.Size.X
    p_u_47.BillboardGui.Frame.PlayerName.Size = UDim2.new(1 - v58, 0, 1, 0)
    local v59 = p_u_47.BillboardGui.Size.X.Scale / p_u_47.BillboardGui.Size.Y.Scale
    p_u_47.BillboardGui.Frame.UISizeConstraint.MaxSize = Vector2.new(100 * v59, 100)
end
function v24._refresh_above_char_stack(p_u_61, p_u_62)
    p_u_61.delayed_update_buffer:delay(p_u_62, function()
        v_u_19("Configuring PlayerNameApp for", p_u_62)
        local v63 = v_u_8.get(p_u_62)
        if v63 then
            v63:destroy()
        end
        local v_u_64 = v_u_6.get(p_u_62)
        if v_u_64 == nil then
            return
        end
        local v_u_65 = v_u_64.player
        local v_u_66 = game.Players.LocalPlayer.Character == p_u_62
        local v67 = v_u_1("CharacterHider")
        if not p_u_61.allow_charhider_components and v67.is_char_hidden(p_u_62) then
            return
        end
        local v68 = {
            ["char"] = p_u_62
        }
        local v_u_69 = p_u_61.UIManager.wrap(p_u_61.instance, "AboveCharStack"):start(v68)
        local function v73(p70, _, p71, p72)
            return v_u_69:add_component(p70, p71, p72)
        end
        if p_u_61.name_visibilities[p_u_62] ~= nil then
            v_u_69:set_visible(p_u_61.name_visibilities[p_u_62])
        end
        if v_u_64.nametag_hidden then
            return
        end
        if not v_u_64.is_pet then
            v_u_1("MinigameClientManager").refresh_minigame_above_char_stacks(v_u_65, v73)
        end
        if p_u_61.only_display_minigame_components then
            return
        end
        if v_u_64.is_pet then
            local v_u_74 = p_u_61.displayed_pet_progression[p_u_62] or {}
            local v75 = "age"
            local v_u_76 = nil
            local v_u_77 = nil
            local v_u_78 = false
            for v79, v80 in v_u_64.pet_progression do
                v_u_74[v79] = v_u_74[v79] or v80
            end
            if v_u_74.percentage == 1 then
                v_u_74.percentage = 0
            end
            v_u_74.age = v_u_74.age or 1
            v_u_74.friendship_level = v_u_74.friendship_level or 0
            local v_u_81 = v_u_11.pets[v_u_64.pet_id]
            if p_u_61.hide_age_bar or v_u_81.hide_age_bar then
                v_u_76 = nil
                v_u_77 = nil
            elseif v_u_74.age < 6 and not v_u_64.mega_neon then
                v_u_69:add_component("pet_progression", function(p82)
                    if v_u_12.get_setting_client({
                        ["setting_id"] = "theme_color"
                    }) == "black" then
                        p82.SurfaceGui.PetProgression.Frame.Darken.ImageColor3 = Color3.new(1, 1, 1)
                    else
                        p82.SurfaceGui.PetProgression.Frame.Darken.ImageColor3 = Color3.new(0, 0, 0)
                    end
                    v_u_76 = p82.SurfaceGui.PetProgression.Frame
                    v_u_77 = function(p83)
                        return UDim2.new(1 - p83, 0, 1, 0)
                    end
                    local v84
                    if v_u_81.is_egg then
                        v84 = v_u_81.is_doll and "Wrapped" or "Unhatched"
                    elseif v_u_64.neon then
                        v84 = v_u_10.neon_age_names[v_u_74.age]
                    else
                        v84 = v_u_10.age_names[v_u_74.age]
                    end
                    p82.SurfaceGui.PetProgression.TextLabel.Text = v84
                end, nil)
            elseif v_u_74.age >= 6 and not v_u_81.is_egg then
                local v85 = v_u_12.get_setting_client({
                    ["setting_id"] = "friendship_bar_visibility"
                })
                local v86
                if v85 == "No One" then
                    v86 = false
                else
                    local v87
                    if v85 == "Other Players" then
                        v87 = v_u_65 == v_u_20.LocalPlayer
                    else
                        v87 = false
                    end
                    v86 = not v87
                    if v86 then
                        local v88
                        if v85 == "Only Me" then
                            v88 = v_u_65 ~= v_u_20.LocalPlayer
                        else
                            v88 = false
                        end
                        v86 = not v88
                    end
                end
                if v86 then
                    v_u_69:add_component("friendship_progression", function(p89)
                        local v90 = v_u_74.friendship_level
                        local v91 = tostring(v90)
                        v_u_76 = p89.SurfaceGui.FriendProgression.Left.Background.Fill
                        v_u_77 = function(p92)
                            return UDim2.fromScale(p92, 1)
                        end
                        local v93 = p89.Size
                        local v94 = (#v91 - 1) * 0.2
                        local v95 = math.min(1, v94)
                        p89.Size = v93 + Vector3.new(v95, 0, 0)
                        p89.SurfaceGui.FriendProgression.Right.Border.LevelText.Text = v91
                        v_u_78 = true
                    end, nil)
                    v75 = "friendship_level"
                end
            end
            if v_u_76 and v_u_77 then
                v_u_76.Size = v_u_77(v_u_74.percentage)
                local v96 = v_u_64.pet_progression[v75] or v_u_74[v75]
                local v97 = v_u_64.pet_progression.percentage
                local v_u_98 = 1
                local v_u_99 = Enum.EasingStyle.Linear
                if v_u_74[v75] < v96 then
                    v_u_74[v75] = v_u_74[v75] + 1
                    v_u_98 = v_u_98 * (1 - v_u_74.percentage)
                    v_u_74.percentage = 1
                    if v_u_74[v75] == v96 and v97 == 0 then
                        v_u_99 = Enum.EasingStyle.Sine
                    else
                        local v100 = 1 + ((v_u_64.pet_progression.age or 1) - v_u_74.age + ((v_u_64.pet_progression.friendship_level or 0) - v_u_74.friendship_level))
                        v_u_98 = v_u_98 / math.max(1, v100)
                    end
                elseif v_u_74.percentage == v97 then
                    p_u_61.displayed_pet_progression[p_u_62] = nil
                else
                    v_u_99 = Enum.EasingStyle.Sine
                    v_u_98 = v_u_98 * (v97 - v_u_74.percentage)
                    v_u_74.percentage = v97
                end
                if p_u_61.displayed_pet_progression[p_u_62] then
                    task.spawn(function()
                        local v101 = v_u_98
                        local v102 = v_u_22:Create(v_u_76, TweenInfo.new(math.max(0.35, v101), v_u_99, Enum.EasingDirection.Out), {
                            ["Size"] = v_u_77(v_u_74.percentage)
                        })
                        v102:Play()
                        v102.Completed:Wait()
                        p_u_61:_refresh_above_char_stack(p_u_62)
                    end)
                end
                if v_u_65 == game.Players.LocalPlayer then
                    local v_u_103 = v_u_18.get_bucks_multiplier_for_pet(v_u_65, {
                        ["char_wrapper"] = v_u_64
                    })
                    local v_u_104 = v_u_18.get_aging_multiplier_for_pet(v_u_65, {
                        ["char_wrapper"] = v_u_64
                    })
                    local function v_u_112(p105, p106, p107, p108)
                        if p105 then
                            local v109
                            if p106 then
                                v109 = v_u_103
                            else
                                v109 = v_u_104
                            end
                            local v110 = ("<font size=\"40\">%*</font><font size=\"35\">x</font>"):format(v109)
                            local v111 = p105.SurfaceGui.MultiplierTag.TextLabel
                            v111.Text = v110
                            v111.Back.Text = v110
                            v111.Front.Text = v110
                            p105.SurfaceGui.MultiplierTag.Icons.Bucks.Visible = p106
                            p105.SurfaceGui.MultiplierTag.Icons.Aging.Visible = p107
                            p105.SurfaceGui.MultiplierTag.GroupTransparency = p108 or 0
                        end
                    end
                    local v_u_113 = v_u_103 ~= 1
                    local v_u_114 = v_u_104 ~= 1
                    if v_u_113 or v_u_114 then
                        local v_u_115 = nil
                        v_u_69:add_component("multiplier_tag", function(p_u_116)
                            if v_u_113 and (v_u_114 and v_u_103 ~= v_u_104) then
                                v_u_115 = v_u_21.Heartbeat:Connect(function()
                                    local v117 = tick() / 2 % 6.283185307179586
                                    local v118 = math.sin(v117) * 4
                                    local v119 = math.clamp(v118, -1, 1)
                                    local v120 = v119 > 0
                                    v_u_112(p_u_116, v120, not v120, 1 - math.abs(v119))
                                end)
                                return
                            else
                                local v121 = v_u_113
                                local v122 = v_u_114
                                if p_u_116 then
                                    local v123
                                    if v121 then
                                        v123 = v_u_103
                                    else
                                        v123 = v_u_104
                                    end
                                    local v124 = ("<font size=\"40\">%*</font><font size=\"35\">x</font>"):format(v123)
                                    local v125 = p_u_116.SurfaceGui.MultiplierTag.TextLabel
                                    v125.Text = v124
                                    v125.Back.Text = v124
                                    v125.Front.Text = v124
                                    p_u_116.SurfaceGui.MultiplierTag.Icons.Bucks.Visible = v121
                                    p_u_116.SurfaceGui.MultiplierTag.Icons.Aging.Visible = v122
                                    p_u_116.SurfaceGui.MultiplierTag.GroupTransparency = 0
                                end
                            end
                        end, {
                            ["offset"] = Vector3.new(v_u_78 and 1.35 or 1.64, -0.04, -0.01),
                            ["independent"] = true,
                            ["cleanup"] = function()
                                if v_u_115 then
                                    v_u_115:Disconnect()
                                end
                            end
                        })
                    end
                end
            end
        end
        if not (v_u_64.is_pet or v_u_66) then
            local v126 = v_u_2.get_server(v_u_65, "family_list")
            local v127 = v_u_2.get_server(v_u_65, "family_id")
            local v_u_128 = v126 and v_u_5.is_member(v126, game.Players.LocalPlayer) and "Family" or (v127 and "In Family" or nil)
            if v_u_128 then
                v_u_69:add_component("family_tag", function(p129)
                    p129.SurfaceGui.FamilyIndicator.TextLabel.Text = v_u_128
                    if v_u_128 == "Family" then
                        p129.SurfaceGui.FamilyIndicator.TextLabel.TextColor3 = Color3.fromRGB(212, 255, 201)
                        p129.SurfaceGui.FamilyIndicator.Image = "rbxassetid://3124896304"
                    elseif v_u_128 == "In Family" then
                        p129.SurfaceGui.FamilyIndicator.TextLabel.TextColor3 = Color3.fromRGB(199, 199, 199)
                        p129.SurfaceGui.FamilyIndicator.Image = "rbxassetid://3124915106"
                    end
                end, nil)
            end
        end
        local v_u_130 = nil
        if not v_u_64.is_pet and (v_u_64.display_rank or v_u_64.display_vip) then
            for _, v131 in v_u_2.get_server(v_u_65, "player_tags") or {} do
                if v131 == "vip" then
                    if v_u_64.display_vip then
                        v_u_130 = v_u_130 or v_u_23[v131]
                    end
                elseif v_u_23[v131] and v_u_64.display_rank then
                    v_u_130 = v_u_23[v131]
                    break
                end
            end
        end
        local v132 = v_u_2.get_server(v_u_65, "roleplay_role")
        local v133 = v_u_12.get_setting_client({
            ["setting_id"] = "use_ailments_monitor"
        })
        if not (v132 or v_u_7.are_ailments_hidden()) then
            if v133 then
                v_u_1("new:LegacyAilmentProgressBars").create(v73, v_u_64)
            else
                v_u_1("new:AboveCharAilmentsList").create(v73, v_u_64)
            end
        end
        local v134 = v_u_64.rp_name
        if v134 then
            v134 = v_u_64.rp_name ~= ""
        end
        if not v_u_66 or (v134 or v_u_130) then
            local v_u_135 = false
            local v_u_136
            if p_u_61.forced_usernames[p_u_62] or not v134 then
                if v_u_64.pet_id then
                    v_u_136 = v_u_11.pets[v_u_64.pet_id].name
                    v_u_135 = true
                else
                    v_u_136 = p_u_62.Name
                end
            else
                v_u_136 = "(" .. v_u_64.rp_name .. ")"
            end
            local v137 = v_u_12.get_setting_client({
                ["setting_id"] = "player_names_visibility"
            })
            local v138
            if v137 == "No One" then
                v138 = false
            else
                local v139
                if v137 == "Other Players" then
                    v139 = v_u_65 == v_u_20.LocalPlayer
                else
                    v139 = false
                end
                v138 = not v139
                if v138 then
                    local v140
                    if v137 == "Only Me" then
                        v140 = v_u_65 ~= v_u_20.LocalPlayer
                    else
                        v140 = false
                    end
                    v138 = not v140
                end
            end
            if v138 then
                v_u_69:add_component("player_name", function(p141)
                    p141.BillboardGui.Frame.PlayerName.Text = v_u_136
                    p141.BillboardGui.Frame.PlayerName.AutoLocalize = v_u_135
                    local v142 = v_u_136
                    if string.len(v142) <= 22 then
                        p141.BillboardGui.Size = UDim2.new(p_u_61.instance.player_name.BillboardGui.Size.X.Scale, 0, p_u_61.instance.player_name.BillboardGui.Size.Y.Scale / 2, 0)
                        local v143 = p_u_61.instance.player_name.Size
                        local v144 = p_u_61.instance.player_name.Size.Y / 2
                        p141.Size = v143 - Vector3.new(0, v144, 0)
                    end
                    local v145 = v_u_130
                    if v145 then
                        v145 = v_u_136 == v_u_65.Name
                    end
                    if v145 then
                        p141.BillboardGui.Frame.PlayerName.TextColor3 = v_u_130.text_color_3
                        p141.BillboardGui.Frame.PlayerName.TextStrokeColor3 = v_u_130.text_stroke_color_3
                        p141.BillboardGui.Frame.VerifiedIcon.Image = v_u_130.icon
                        v_u_60(p141, v_u_136, p141.BillboardGui.Frame.VerifiedIcon)
                    else
                        p141.BillboardGui.Frame.VerifiedIcon.Visible = false
                        p141.BillboardGui.Frame.UISizeConstraint.MaxSize = Vector2.new((1 / 0), (1 / 0))
                    end
                    if v_u_66 and not p_u_61.forced_usernames[p_u_62] then
                        p141.BillboardGui.Frame.PlayerName.TextTransparency = 0.4
                        p141.BillboardGui.Frame.PlayerName.TextStrokeTransparency = 1
                        if p141.BillboardGui.Frame:FindFirstChild("VerifiedIcon") then
                            p141.BillboardGui.Frame.VerifiedIcon.ImageTransparency = 0.4
                        end
                    end
                end, nil)
            end
        end
        if v132 and (v_u_66 or not v133) then
            local v_u_146 = v_u_13[v132.building_id].roles[v132.role_id]
            v_u_69:add_component("roleplay_role", function(p_u_147)
                local v148 = v_u_12.get_setting_client({
                    ["setting_id"] = "theme_color"
                })
                if v_u_146.is_leadership_role then
                    p_u_147.SurfaceGui.Role.InnerColor.ImageColor3 = v_u_14.lookup_specific_color(v148 == "yellow" and "black" or "yellow", "saturated")
                    v_u_14.exclude_instance_from_color_themeing(p_u_147.SurfaceGui.Role.InnerColor)
                end
                p_u_147.SurfaceGui.Role.Icon.Image = v_u_146.icon
                if v_u_66 and v_u_15.is_using_gamepad() then
                    task.delay(3, function()
                        if p_u_147.Parent then
                            for v149, v150 in {
                                [p_u_147.SurfaceGui.Role] = 0.7,
                                [p_u_147.SurfaceGui.Role.Icon] = 0.5,
                                [p_u_147.SurfaceGui.Role.InnerColor] = 0.7
                            } do
                                v_u_22:Create(v149, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                                    ["ImageTransparency"] = v150
                                }):Play()
                            end
                        end
                    end)
                end
            end)
        end
    end)
end
function v24.add_npc_id(p_u_151, p152, p_u_153, p154)
    local v_u_155 = p154 or {}
    local v156 = p_u_151.UIManager.wrap(p_u_151.instance, "AboveCharStack"):start({
        ["char"] = p152
    })
    local v_u_157, v_u_158
    if v_u_155.theme_color then
        local v159
        if v_u_155.theme_color == true then
            v159 = v_u_14.get_theme_color()
        else
            v159 = v_u_155.theme_color
        end
        v_u_157 = v_u_14.lookup_specific_color(v159, "saturated")
        v_u_158 = v_u_14.lookup_specific_color(v159, "background")
    else
        v_u_158 = nil
        v_u_157 = nil
    end
    if v_u_155.tag then
        v156:add_component("generic_tag", function(p160)
            local v161 = p160.SurfaceGui.Frame.TextLabel
            v161.Text = v_u_155.tag
            if v_u_155.theme_color then
                local v162 = p160.SurfaceGui.Frame
                v161.TextColor3 = v_u_158
                v162.BackgroundColor3 = v_u_157
                v162.UIStroke.Color = v_u_158
            end
        end)
    end
    if p_u_153 then
        v156:add_component("player_name", function(p163)
            p163.BillboardGui.Frame.PlayerName.AutoLocalize = true
            p163.BillboardGui.Frame.PlayerName.Text = p_u_153
            local v164 = p_u_153
            if string.len(v164) <= 22 then
                p163.BillboardGui.Size = UDim2.new(p_u_151.instance.player_name.BillboardGui.Size.X.Scale, 0, p_u_151.instance.player_name.BillboardGui.Size.Y.Scale / 2, 0)
                local v165 = p_u_151.instance.player_name.Size
                local v166 = p_u_151.instance.player_name.Size.Y / 2
                p163.Size = v165 - Vector3.new(0, v166, 0)
            end
            local v167 = p163.BillboardGui.Frame.PlayerName
            local v168 = p163.BillboardGui.Frame.VerifiedIcon
            if v_u_155.icon then
                v168.Image = v_u_155.icon
                v168.ScaleType = Enum.ScaleType.Fit
                v_u_60(p163, p_u_153, v168)
            end
            if v_u_155.theme_color then
                v167.TextColor3 = v_u_157
                v167.TextStrokeColor3 = v_u_158
                v168.ImageColor3 = v_u_157
            end
        end)
    end
    return v156
end
function v24.add_npc_roleplay_role(p169, p170, p_u_171)
    local v172 = p169.UIManager.wrap(p169.instance, "AboveCharStack"):start({
        ["char"] = p170
    })
    local v_u_173 = nil
    v172:add_component("roleplay_role", function(p_u_174)
        local v175 = v_u_12.get_setting_client({
            ["setting_id"] = "theme_color"
        })
        if p_u_171.is_leadership_role then
            p_u_174.SurfaceGui.Role.InnerColor.ImageColor3 = v_u_14.lookup_specific_color(v175 == "yellow" and "black" or "yellow", "saturated")
            v_u_14.exclude_instance_from_color_themeing(p_u_174.SurfaceGui.Role.InnerColor)
        end
        p_u_174.SurfaceGui.Role.Icon.Image = p_u_171.icon
        if v_u_173 and v_u_15.is_using_gamepad() then
            task.delay(3, function()
                if p_u_174.Parent then
                    for v176, v177 in {
                        [p_u_174.SurfaceGui.Role] = 0.7,
                        [p_u_174.SurfaceGui.Role.Icon] = 0.5,
                        [p_u_174.SurfaceGui.Role.InnerColor] = 0.7
                    } do
                        v_u_22:Create(v176, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                            ["ImageTransparency"] = v177
                        }):Play()
                    end
                end
            end)
        end
    end)
    return v172
end
function v24.start(p_u_178)
    p_u_178.instance.Parent = nil
    p_u_178.delayed_update_buffer = v_u_9.new()
    p_u_178.forced_usernames = {}
    p_u_178.name_visibilities = {}
    p_u_178.displayed_pet_progression = {}
    p_u_178.only_display_minigame_components = false
    p_u_178.allow_charhider_components = false
    p_u_178.hide_age_bar = false
    p_u_178.instance.player_name.BillboardGui.Frame.PlayerName.AutoLocalize = false
    p_u_178.instance.player_name.BillboardGui.Frame.VerifiedIcon.Visible = false
    v_u_6.register_property_changed("rp_name", function(p179, _, _)
        p_u_178:_refresh_above_char_stack(p179)
    end)
    v_u_6.register_property_changed("display_rank", function(p180, _, _)
        p_u_178:_refresh_above_char_stack(p180)
    end)
    v_u_6.register_property_changed("display_vip", function(p181, _, _)
        p_u_178:_refresh_above_char_stack(p181)
    end)
    v_u_6.register_property_changed("pet_progression", function(p182, _, p183)
        p_u_178.displayed_pet_progression[p182] = p183
        p_u_178:_refresh_above_char_stack(p182)
    end)
    v_u_6.register_property_changed("nametag_hidden", function(p184, _, _)
        p_u_178:_refresh_above_char_stack(p184)
    end)
    v_u_7.get_changed_signal():Connect(function(p185)
        if not v_u_7.are_ailments_hidden() then
            if p185.Character then
                p_u_178:_refresh_above_char_stack(p185.Character)
            end
            for _, v186 in v_u_16.get_equipped_char_wrappers(p185) do
                p_u_178:_refresh_above_char_stack(v186.char)
            end
        end
    end)
    v_u_7.get_ailments_hidden_changed_signal():Connect(function()
        for _, v187 in v_u_8.get_chars_in_cache() do
            p_u_178:_refresh_above_char_stack(v187)
        end
    end)
    v_u_2.register_callback("family_list", function(p188, p189, p190)
        if p188 == game.Players.LocalPlayer then
            local v191 = v_u_4.new(p189 or {})
            local v192 = v_u_4.new(p190 or {})
            local v193 = (v191 + v192 - v191 * v192):tolist()
            for _, v194 in pairs(v193) do
                p_u_178:_refresh_above_char_stack(v194.Character)
                for _, v195 in v_u_16.get_equipped_char_wrappers(v194) do
                    p_u_178:_refresh_above_char_stack(v195.char)
                end
            end
        end
    end)
    v_u_2.register_callback("family_id", function(p196)
        p_u_178:_refresh_above_char_stack(p196.Character)
        for _, v197 in v_u_16.get_equipped_char_wrappers(p196) do
            p_u_178:_refresh_above_char_stack(v197.char)
        end
    end)
    v_u_2.register_callback("roleplay_role", function(p198, _)
        p_u_178:_refresh_above_char_stack(p198.Character)
        for _, v199 in v_u_16.get_equipped_char_wrappers(p198) do
            p_u_178:_refresh_above_char_stack(v199.char)
        end
    end)
    v_u_2.register_callback("player_tags", function(p200, _)
        p_u_178:_refresh_above_char_stack(p200.Character)
    end)
    v_u_14.get_theme_changed_signal():Connect(function()
        for _, v201 in v_u_8.get_chars_in_cache() do
            p_u_178:_refresh_above_char_stack(v201)
        end
    end)
    v_u_12.promise_setting_changed_signal("friendship_bar_visibility"):andThen(function(p202)
        p202:Connect(function()
            for _, v203 in v_u_8.get_chars_in_cache() do
                p_u_178:_refresh_above_char_stack(v203)
            end
        end)
    end)
    v_u_12.promise_setting_changed_signal("player_names_visibility"):andThen(function(p204)
        p204:Connect(function()
            for _, v205 in v_u_8.get_chars_in_cache() do
                p_u_178:_refresh_above_char_stack(v205)
            end
        end)
    end)
    v_u_12.promise_setting_changed_signal("use_ailments_monitor"):andThen(function(p206)
        p206:Connect(function()
            for _, v207 in v_u_8.get_chars_in_cache() do
                p_u_178:_refresh_above_char_stack(v207)
            end
        end)
    end)
    local v_u_208 = {}
    task.spawn(function()
        while true do
            local v209 = {}
            for _, v210 in v_u_8.get_chars_in_cache() do
                local v211 = v_u_6.get(v210)
                if v211 and v211.player == game.Players.LocalPlayer then
                    local v212 = v_u_208[v210]
                    local v213 = v_u_18.get_multiplier_for_pet(v211.player, {
                        ["char_wrapper"] = v211
                    })
                    v209[v210] = v213
                    if not v212 or (v213.bucks ~= v212.bucks or v213.aging ~= v212.aging) then
                        p_u_178:_refresh_above_char_stack(v210)
                    end
                end
            end
            v_u_208 = v209
            task.wait(0.2)
        end
    end)
end
return v24