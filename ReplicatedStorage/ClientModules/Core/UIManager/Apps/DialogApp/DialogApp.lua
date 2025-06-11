--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.DialogApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.new.modules.Utf8Tools)
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("SoundPlayer")
local v_u_4 = v_u_2("Maid")
local v5 = v_u_2("Class")
v_u_2("KindDB")
local v_u_6 = v_u_2("Signal")
local v_u_7 = v_u_2("Polaroid")
local v_u_8 = v_u_2("PlatformM")
local v_u_9 = v_u_2("TableUtil")
v_u_2("ClientData")
local v_u_10 = v_u_2("GamepassDB")
local v_u_11 = v_u_2("ScriptUtil")
local v_u_12 = v_u_2("CloudValues")
local v_u_13 = v_u_2("XboxSupport")
local v_u_14 = v_u_2("ColorThemeDB")
local v_u_15 = v_u_2("RouterClient")
local v_u_16 = v_u_2("ProductImages")
local v_u_17 = v_u_2("CountdownClock")
v_u_2("AltCurrencyData")
local v_u_18 = v_u_2("SharedConstants")
local v_u_19 = v_u_2("MouseCursorHider")
local v_u_20 = v_u_2("DeveloperProductDB")
local v_u_21 = v_u_2("CostDiscountHelper")
local v_u_22 = v_u_2("new:TextUtil")
local v_u_23 = v_u_2("new:LimitedsDisplayClient")
local v_u_24 = v_u_2("package:Promise")
local v_u_25 = v_u_2("package:Sift")
local v_u_26 = v_u_2("package:t")
local v_u_27 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v_u_28 = game:GetService("Players")
local v_u_29 = game:GetService("TweenService")
local v30 = v5("DialogApp", v_u_2("UIBaseApp"))
local v_u_31 = {
    "Bright red",
    "Really red",
    "Deep orange",
    "Bright orange",
    "Gold",
    "New Yeller",
    "Tr. Flu. Yellow",
    "Fire Yellow",
    "Daisy orange",
    "Mint",
    "Forest green",
    "Parsley green",
    "Br. yellowish green",
    "Lig. yellowish green",
    "Bright green",
    "Sea green",
    "Bright blue",
    "Really blue",
    "Tr. Blue",
    "Dark Royal blue",
    "Medium Royal blue",
    "Electric blue",
    "Baby blue",
    "Dark blue",
    "Med. bluish green",
    "Bright bluish violet",
    "Bright reddish violet",
    "Tr. Flu. Red",
    "Terra Cotta",
    "Bright reddish lilac",
    "Reddish lilac",
    "Lilac",
    "Dark indigo",
    "Cashmere",
    "Dirt brown",
    "Mulberry",
    "Magenta",
    "Royal purple",
    "Alder",
    "Bright purple",
    "Carnation pink",
    "Hot pink",
    "Burgundy",
    "Rust",
    "Burnt Sienna",
    "Maroon",
    "Tr. Brown",
    "Dark nougat",
    "Sand violet",
    "Sand blue",
    "Wheat",
    "White",
    "Institutional white",
    Color3.new(1, 1, 1),
    "Grey",
    "Black",
    "Really black"
}
local v_u_32 = {
    ["Cancel"] = "Cancel",
    ["Close"] = "Close",
    ["NoThanks"] = "No Thanks",
    ["No"] = "No",
    ["Decline"] = "Decline",
    ["Later"] = "Later",
    ["Ignore"] = "Ignore",
    ["Block"] = "Block",
    ["Maybelater"] = "Maybe later",
    ["Exit"] = "Exit"
}
local function v_u_39(p33)
    local v34 = p33.button
    local v35 = p33.left
    local v36 = p33.right
    local v37 = p33.center
    local v38 = {}
    table.insert(v38, v35)
    table.insert(v38, v37)
    table.insert(v38, v36)
    table.insert(v38, not (v34 or (v35 or (v36 or v37))) and "Okay" or v34)
    return v38
end
local function v_u_62(p_u_40, p41, p42)
    local v_u_43 = p41.existing_text or ""
    local v44 = p41.placeholder_text or "Insert Text Here"
    local v_u_45 = p41.max_length or (1 / 0)
    local v46 = p41.multiline or false
    local v_u_47 = p41.use_utf8_length or false
    local v48 = p41.is_text_box_editable == nil and true or p41.is_text_box_editable
    if v_u_47 then
        v_u_43 = v_u_1.substring_graphemes(v_u_43, 1, v_u_45)
    elseif v_u_45 < (1 / 0) then
        v_u_43 = string.sub(v_u_43, 1, v_u_45)
    end
    local v_u_49 = p42.Info.Response.Textbox
    v_u_49.Text = v_u_43
    v_u_49.PlaceholderText = v44
    v_u_49.MultiLine = v46
    v_u_49.TextEditable = v48
    local v_u_50 = p42.Info.CharacterCountdown
    local v_u_51 = v_u_45 ~= (1 / 0)
    if v_u_51 then
        local v52
        if v_u_47 then
            v52 = v_u_1.length_graphemes(v_u_43)
        else
            v52 = string.len(v_u_43)
        end
        v_u_50.Visible = true
        v_u_50.Text = string.format("%d/%d characters remaining", v_u_45 - v52, v_u_45)
    else
        v_u_50.Visible = false
    end
    local v_u_53 = v_u_43
    local v_u_54 = false
    v_u_49:GetPropertyChangedSignal("Text"):Connect(function()
        if v_u_54 then
            return
        else
            local v55, v56, v57, v58
            if v_u_47 then
                local v59 = {
                    ["limit_graphemes"] = v_u_45
                }
                v55, v56, v57 = v_u_1.sanitize_and_check_length(v_u_49.Text, v59)
                v58 = v_u_1.length_graphemes(v56)
            else
                v56 = v_u_49.Text
                v55 = #v56 <= v_u_45
                v58 = #v56
                v57 = "TooManyCharacters"
            end
            if v55 then
                v_u_53 = v56
                if v_u_51 then
                    v_u_50.Text = string.format("%d/%d characters remaining", v_u_45 - v58, v_u_45)
                end
            else
                p_u_40.UIManager.apps.HintApp:hint({
                    ["text"] = v57 == "TooManyBytes" and "Your text is too complex" or "Your text is too long",
                    ["overridable"] = true,
                    ["length"] = 2.5,
                    ["yields"] = false
                })
                v_u_54 = true
                v_u_49.Text = v_u_53
                v_u_54 = false
            end
        end
    end)
    local function v60()
        return v_u_1.replace_invalid_codepoints(v_u_49.Text, "")
    end
    local function v61()
        return v_u_43
    end
    if v_u_45 < string.len(v_u_43) then
        warn(string.format("Existing text for textbox (%s) is longer than the allowable limit for this dialog (%d). This may cause issues.", v_u_43, v_u_45))
    end
    return v60, v61
end
local function v_u_67(p63, p64, p65, p_u_66)
    return p63.UIManager.wrap(p65.Info.Dropdown, "Dropdown"):start({
        ["choose_text"] = p64.choose_text,
        ["choices"] = p64.choices,
        ["should_localize_choices"] = p64.should_localize_choices,
        ["on_choice_changed"] = function(_, _)
            if p_u_66 then
                p_u_66:Fire()
                p_u_66:Destroy()
                p_u_66 = nil
            end
        end
    })
end
local v_u_406 = {
    ["NormalDialog"] = function(p68, p69, p70, p71)
        local v72 = v_u_27:Translate(workspace, p70.text)
        local v73 = v_u_39(p70)
        assert(v72, "No text supplied")
        p71.Info.TextLabel.Text = v72
        p71.Info.TextLabel.RichText = p70.rich_text and true or false
        return p68:_yield_until_button_pressed(p69, v73, p71, p70)
    end,
    ["ScrollingDialog"] = function(p74, p75, p76, p77)
        local v78 = v_u_39(p76)
        local v_u_79 = {}
        local v_u_80 = p77.Info.ScrollingFrame.Container
        local v81 = v_u_80.UIListLayout
        local v_u_82 = v_u_80.TextLabel
        v_u_82.Visible = false
        local function v91(p_u_83)
            local v84
            if p_u_83.already_translated then
                v84 = p_u_83.text
            else
                v84 = v_u_27:Translate(workspace, p_u_83.text)
            end
            local v_u_85 = v_u_82:Clone()
            v_u_85.Text = v84
            v_u_85.TextSize = p_u_83.size
            v_u_85.Visible = true
            if p_u_83.text_x_alignment then
                v_u_85.TextXAlignment = p_u_83.text_x_alignment
            end
            if p_u_83.font then
                v_u_85.Font = p_u_83.font
            end
            v_u_22.on_text_bounds({
                ["FontFace"] = v_u_85.FontFace,
                ["FontSize"] = p_u_83.size,
                ["Text"] = v84,
                ["ContainerWidth"] = v_u_80.AbsoluteSize.X
            }, function(p86)
                local v87 = v_u_85
                local v88 = UDim2.new
                local v89 = p86.Y
                v87.Size = v88(1, 0, 0, math.ceil(v89) + (p_u_83.padding or 0))
            end)
            v_u_85.Parent = v_u_80
            local v90 = v_u_79
            table.insert(v90, v_u_85)
            return v_u_85
        end
        if p76.labels then
            for v92, v93 in p76.labels do
                v91(v93).LayoutOrder = v92
            end
        elseif p76.elements then
            for v94, v95 in p76.elements do
                if v_u_26.callback(v95) then
                    local v96 = v95()
                    v96.LayoutOrder = v94
                    v96.Parent = v_u_80
                    table.insert(v_u_79, v96)
                elseif v_u_26.Instance(v95) then
                    v95.LayoutOrder = v94
                    v95.Parent = v_u_80
                    table.insert(v_u_79, v95)
                else
                    v91(v95).LayoutOrder = v94
                end
            end
        end
        p77.Info.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, v81.AbsoluteContentSize.Y)
        p77.Info.ScrollbarBacking.Visible = v81.AbsoluteContentSize.Y > p77.Info.AbsoluteSize.Y
        local v97 = p74:_yield_until_button_pressed(p75, v78, p77, p76)
        for _, v98 in v_u_79 do
            v98:Destroy()
        end
        return v97
    end,
    ["UpdatesDialog"] = function(p99, p100, p101, p102)
        p102.Info.GamepassButton.MouseButton1Click:connect(function()
            v_u_15.get("ProductsAPI/PromptProductPurchase"):FireServer("robo_dog")
        end)
        return p99:_yield_until_button_pressed(p100, { "Play" }, p102, p101)
    end,
    ["ColorPickerDialog"] = function(p103, p104, p105, p_u_106)
        local v107 = v_u_4.new()
        local v_u_108 = v_u_6.new()
        local v_u_109 = p105.starter_color
        local v110 = p105.no_cancel
        local v111 = p105.available_colors or v_u_31
        p_u_106.ChosenColor.BackgroundColor3 = v_u_109
        p_u_106.Position = p105.custom_offset or p103.color_picker_default_position
        local v112 = p_u_106.Info.UIGridLayout
        v112.Parent = nil
        p_u_106.Info:ClearAllChildren()
        v112.Parent = p_u_106.Info
        local v113 = v_u_109
        for v114, v115 in v111 do
            local v_u_116 = p103.color_picker_template:clone()
            v_u_116.BackgroundColor3 = typeof(v115) == "Color3" and v115 and v115 or BrickColor.new(v115).Color
            v_u_116.LayoutOrder = v114
            v_u_116.Parent = p_u_106.Info
            v_u_116.MouseButton1Down:Connect(function()
                v_u_109 = v_u_116.BackgroundColor3
                p_u_106.ChosenColor.BackgroundColor3 = v_u_109
                v_u_108:Fire(v_u_109)
            end)
            v_u_116.MouseEnter:Connect(function()
                if game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                    v_u_109 = v_u_116.BackgroundColor3
                    p_u_106.ChosenColor.BackgroundColor3 = v_u_109
                end
            end)
        end
        if p105.polaroid then
            local v_u_117 = v_u_7.new(p105.polaroid.entry, p105.polaroid.viewport_frame, {
                ["update_signal"] = v_u_108
            })
            v107:GiveTask(function()
                v_u_117:Destroy()
            end)
        end
        local v118 = p103:_yield_until_button_pressed(p104, v110 and { "Done" } or { v_u_32.Cancel, "Done" }, p_u_106, p105)
        v107:Destroy()
        if v_u_32[v118:gsub("%p+", ""):gsub("%s+", "")] and true or false then
            return v118, v113
        else
            return v118, v_u_109
        end
    end,
    ["ParagraphDialog"] = function(p119, p120, p121, p122)
        local v123 = v_u_39(p121)
        local v124 = #v123 > 0
        assert(v124)
        local v125, v126 = v_u_62(p119, p121, p122)
        local v127 = p119:_yield_until_button_pressed(p120, v123, p122, p121)
        if v_u_32[v127:gsub("%p+", ""):gsub("%s+", "")] and true or false then
            return v127, v126()
        else
            return v127, v125()
        end
    end,
    ["FreeResponseDialog"] = function(p128, p129, p130, p131)
        local v132 = p130.text or "Enter Text Here:"
        local v133 = v_u_39(p130)
        local v134 = #v133 > 0
        assert(v134)
        p131.Info.TextLabel.Text = v132
        local v135, v136 = v_u_62(p128, p130, p131)
        local v137 = p128:_yield_until_button_pressed(p129, v133, p131, p130)
        if v_u_32[v137:gsub("%p+", ""):gsub("%s+", "")] and true or false then
            return v137, v136()
        else
            return v137, v135()
        end
    end,
    ["ThemeColorDialog"] = function(p138, p139, p140, p_u_141)
        local v_u_142 = v_u_6.new()
        p_u_141.Info.TextLabel.TextColor3 = Color3.fromRGB(54, 54, 54)
        local v_u_143 = {}
        local v_u_144 = nil
        for v145, v_u_146 in pairs(v_u_14.ordered_themes) do
            local v_u_147 = v_u_14.themes[v_u_146]
            local v148, v149, v150 = Color3.toHSV(v_u_147.saturated)
            local v151 = Color3.fromHSV
            local v152 = v150 - 0.22
            local v153 = v151(v148, v149, (math.clamp(v152, 0, 1)))
            local v154 = p138.theme_color_template:clone()
            v154.LayoutOrder = v145
            v154.Parent = p_u_141.Info.Response
            local v_u_155 = p138.UIManager.wrap(v154, "DepthButton")
            v_u_155:start({
                ["mouse_button1_down"] = function()
                    for _, v156 in pairs(v_u_143) do
                        if v156 ~= v_u_155 then
                            v156:set_button_pressed("up")
                        end
                    end
                    p_u_141.Info.TextLabel.TextColor3 = v_u_147.saturated
                    v_u_144 = v_u_146
                    if v_u_142 then
                        v_u_142:Fire()
                        v_u_142:Destroy()
                        v_u_142 = nil
                    end
                end,
                ["hold_down"] = true
            })
            v_u_155:set_face_shadow_color(v_u_147.saturated, v153)
            table.insert(v_u_143, v_u_155)
        end
        local v157 = p138:_yield_until_button_pressed(p139, { "Done" }, p_u_141, p140, v_u_142)
        for _, v158 in pairs(v_u_143) do
            v158.instance:Destroy()
        end
        return v157, v_u_144
    end,
    ["RoleChooserDialog"] = function(p159, _, _, p160)
        local v161 = v_u_4.new()
        if v_u_8.get_platform() == v_u_8.platform.desktop then
            local v_u_162 = Instance.new("UIScale")
            v_u_162.Parent = p160.Baby
            v161:GiveTask(v_u_162)
            local v_u_163 = Instance.new("UIScale")
            v_u_163.Parent = p160.ChooseParent
            v161:GiveTask(v_u_163)
            v161:GiveTask(p160.Baby.MouseEnter:connect(function()
                game:GetService("TweenService"):Create(v_u_162, TweenInfo.new(0.1), {
                    ["Scale"] = 1.1
                }):Play()
            end))
            v161:GiveTask(p160.ChooseParent.MouseEnter:connect(function()
                game:GetService("TweenService"):Create(v_u_163, TweenInfo.new(0.1), {
                    ["Scale"] = 1.1
                }):Play()
            end))
            v161:GiveTask(p160.Baby.MouseLeave:connect(function()
                game:GetService("TweenService"):Create(v_u_162, TweenInfo.new(0.1), {
                    ["Scale"] = 1
                }):Play()
            end))
            v161:GiveTask(p160.ChooseParent.MouseLeave:connect(function()
                game:GetService("TweenService"):Create(v_u_163, TweenInfo.new(0.1), {
                    ["Scale"] = 1
                }):Play()
            end))
        end
        p160.Recommended.Visible = false
        p159:_do_xbox_selection(p160.Baby)
        local v_u_164 = v_u_11.create_continue()
        v161:GiveTask(p160.Baby.MouseButton1Click:connect(function()
            v_u_164.continue("Babies")
        end))
        v161:GiveTask(p160.ChooseParent.MouseButton1Click:connect(function()
            v_u_164.continue("Parents")
        end))
        local v165 = v_u_164.yield()
        v161:DoCleaning()
        return v165
    end,
    ["RobuxProductDialog"] = function(p166, p167, p168, p169)
        local v170 = p168.product_id
        local v171 = v_u_10[v170]
        local v172 = v171 ~= nil
        local v173 = v171 or v_u_20[v170]
        local v174 = "No product exists for " .. v170 .. " within GamepassDB or DeveloperProductDB"
        assert(v173, v174)
        if v173.limiteds_campaign then
            p169.Visible = false
            p166.instance.Dialog.Backing.Visible = false
            local v175, v176 = v_u_15.get("LimitedsAPI/PrefetchReservationClaim"):InvokeServer(v173.limiteds_campaign)
            if not v175 then
                local v177
                if v176 == "reservations_exhausted" then
                    local v178 = v_u_23.get_client_stats(v173.limiteds_campaign)
                    if v178 then
                        v178 = v178.next_drop_exists
                    end
                    if v178 == true then
                        v177 = v_u_12:getValue("limiteds", "message_purchase_failure_reservations_exhausted_temporarily")
                    elseif v178 == false then
                        v177 = v_u_12:getValue("limiteds", "message_purchase_failure_reservations_exhausted_forever")
                    else
                        v177 = v_u_12:getValue("limiteds", "message_purchase_failure_reservations_exhausted_unknown")
                    end
                elseif v176 == "per_player_limit" then
                    v177 = v_u_12:getValue("limiteds", "message_purchase_failure_per_player_limit")
                else
                    v177 = v_u_12:getValue("limiteds", "message_purchase_failure_internal_error")
                end
                p166:_dialog_helper(p167, {
                    ["dialog_type"] = "NormalDialog",
                    ["text"] = v177,
                    ["button"] = "Okay"
                })
                return false
            end
            p169.Visible = true
            p166.instance.Dialog.Backing.Visible = p168.hidden_backing ~= true
        end
        local v179 = v173.original_cost
        if v179 then
            v179 = v173.cost < v173.original_cost
        end
        local v_u_180 = p169.ProductImage
        v_u_16.get(v170, {
            ["use_large_image_id"] = true
        }):andThen(function(p181)
            v_u_180.Image = p181
        end)
        v_u_180.BackgroundTransparency = 1
        v_u_180.Price.TextLabel.Text = v173.cost
        v_u_180.LastChanceSign.Visible = v173.is_last_chance
        v_u_180.Discount.Visible = v179
        if v179 then
            if v179 then
                v179 = v_u_21.calculate_discount_percent_text(v173.original_cost, v173.cost)
            end
            v_u_180.Discount.Text = v179 .. "% OFF!"
        end
        p169.Description.Text = v173.detailed_description or v173.description
        local v182 = p166:_yield_until_button_pressed(p167, { v_u_32.NoThanks, "Get it now!" }, p169, p168)
        if v182 == "Get it now!" then
            v_u_15.get(v172 and "ProductsAPI/PromptGamepassPurchase" or "ProductsAPI/PromptProductPurchase"):FireServer(v170)
            return v182
        else
            if v173.limiteds_campaign then
                v_u_15.get("LimitedsAPI/PrefetchReservationRelease"):FireServer(v173.limiteds_campaign)
            end
            return v182
        end
    end,
    ["ReportScamDialog"] = function(p183, p184, p185, p186)
        local v187 = p185.suspect_name or "N/A"
        local v188 = p185.header_format_text or "Scammer: %s"
        p186.Info.Header.Text = string.format(v188, v187)
        local v189, _ = v_u_62(p183, p185, p186)
        local v190 = v_u_39(p185)
        local v191 = #v190 > 0
        assert(v191)
        local v_u_192 = v_u_6.new()
        local v193 = p185.report_reasons or v_u_18.scam_report_reasons
        local v_u_194 = p185.report_reasons_human_readable or v_u_18.scam_report_reasons_human_readable
        local v196 = p183.UIManager.wrap(p186.Info.Dropdown, "Dropdown"):start({
            ["choose_text"] = p185.dropdown_text or "Choose Scam Type",
            ["choices"] = v_u_25.List.map(v193, function(p195)
                return v_u_194[p195]
            end),
            ["on_choice_changed"] = function(_, _)
                if v_u_192 then
                    v_u_192:Fire()
                    v_u_192:Destroy()
                    v_u_192 = nil
                end
            end
        })
        local v197 = p183:_yield_until_button_pressed(p184, v190, p186, p185, v_u_192)
        local v198 = v193[v196:get_selected_choice()]
        if v_u_32[v197:gsub("%p+", ""):gsub("%s+", "")] and true or false then
            return v197
        else
            return v197, v198, v189()
        end
    end,
    ["SingleChoiceDialog"] = function(p199, p200, p201, p202)
        p202.Info.Header.Text = p201.text
        local v203 = v_u_39(p201)
        local v204 = #v203 > 0
        assert(v204)
        local v_u_205 = v_u_6.new()
        if p201.randomize_order then
            local v206 = {}
            for _, v207 in ipairs(p201.choices) do
                local v208 = math.random(0, #v206) + 1
                table.insert(v206, v208, v207)
            end
            p201.choices = v206
        end
        local v209 = p199.UIManager.wrap(p202.Info.Dropdown, "Dropdown"):start({
            ["choose_text"] = "Pick one",
            ["choices"] = p201.choices,
            ["on_choice_changed"] = function(_, _)
                if v_u_205 then
                    v_u_205:Fire()
                    v_u_205:Destroy()
                    v_u_205 = nil
                end
            end
        })
        p199:_yield_until_button_pressed(p200, v203, p202, p201, v_u_205)
        local _, v210 = v209:get_selected_choice()
        return v210
    end,
    ["MultipleChoiceDialog"] = function(p211, p212, p213, p214)
        p214.Info.Header.Text = p213.text
        local v215 = v_u_39(p213)
        local v216 = {}
        if p213.randomize_order then
            local v217 = {}
            for _, v218 in ipairs(p213.choices) do
                local v219 = math.random(0, #v217) + 1
                table.insert(v217, v219, v218)
            end
            p213.choices = v217
        end
        for _, v_u_220 in ipairs(p213.choices) do
            local v_u_221 = p214.Info.DepthButton:Clone()
            v_u_221.Parent = p214.Info.Choices
            v_u_221.Face.Text.Text = v_u_220
            v_u_221.Visible = true
            local v_u_222 = p211.UIManager.wrap(v_u_221, "DepthButton")
            v_u_222:set_state("cancel")
            v216[v_u_220] = v_u_222:start({
                ["mouse_button1_click"] = function()
                    if v_u_222:get_state() == "normal_blue" then
                        v_u_222:set_state("cancel")
                        v_u_221.Face.Text.Text = v_u_220
                    elseif v_u_222:get_state() == "cancel" then
                        v_u_222:set_state("normal_blue")
                        v_u_221.Face.Text.Text = v_u_220 .. " \226\156\133"
                    end
                end
            })
        end
        if #p213.choices <= 4 then
            p214.Info.Choices.UIGridLayout.CellSize = UDim2.new(1, 0, 0, 25)
        else
            p214.Info.Choices.Size = UDim2.new(1, 60, 0.6, 0)
        end
        p211:_yield_until_button_pressed(p212, v215, p214, p213)
        local v223 = {}
        for v224, v225 in pairs(v216) do
            v223[v224] = v225:get_state() == "normal_blue"
        end
        return v223
    end,
    ["DropdownDialog"] = function(p226, p227, p228, p229)
        p229.Info.Header.Text = p228.header
        local v230 = v_u_6.new()
        local v231 = v_u_39(p228)
        local v232 = #v231 > 0
        assert(v232)
        local v233 = v_u_67(p226, p228, p229, v230)
        local v234 = p226:_yield_until_button_pressed(p227, v231, p229, p228, v230)
        local v235, v236 = v233:get_selected_choice()
        if v_u_32[v234:gsub("%p+", ""):gsub("%s+", "")] and true or false then
            return v234
        else
            return v234, v236, v235
        end
    end,
    ["PhysicalToyCodeDialog"] = function(p237, p238, p239, p240)
        local v241 = p239.text
        local v242 = v_u_39(p239)
        assert(v241, "No text supplied")
        p240.Info.Header.Text = v241
        return p237:_yield_until_button_pressed(p238, v242, p240, p239)
    end,
    ["LargeButtonsListDialog"] = function(p243, p_u_244, p245, p246)
        local v247 = p245.buttons
        local v248 = p246.Buttons.ButtonTemplate
        local v_u_249 = v_u_11.create_continue()
        local v252 = p243.force_response_signal:Connect(function(p250, p251)
            if p250 == p_u_244 then
                v_u_249.continue(p251)
            end
        end)
        local v253 = 0
        local v254 = 0
        for _, v255 in v247 do
            local v256 = v255.weight
            assert(v256, "Missing weight property")
            v253 = v253 + 1
            v254 = v254 + v255.weight
        end
        local v257 = 265 - ((v253 - 1) * p246.Buttons.UIListLayout.Padding.Offset + p246.Buttons.UIPadding.PaddingTop.Offset + p246.Buttons.UIPadding.PaddingBottom.Offset)
        local v258 = (-1 / 0)
        for _, v259 in v247 do
            v259.original_height = v248.Size.Y.Offset
            local v260 = v259.weight / v254 * v257
            v259.button_height = math.floor(v260)
            if v259.icon then
                local v261 = v259.button_height
                v258 = math.max(v258, v261)
            end
        end
        local v262 = (1 / 0)
        local v263 = nil
        for v_u_264, v265 in v247 do
            local v266 = v265.layout_order
            assert(v266, "Missing layout_order property")
            local v267 = v265.text
            assert(v267, "Missing text property")
            local v268 = v248:Clone()
            v268.Size = UDim2.new(1, 0, 0, v265.button_height)
            v268.LayoutOrder = v265.layout_order
            v268.Face.ContentFrame.TextLabel.Text = v265.text
            if v268.LayoutOrder < v262 then
                v262 = v268.LayoutOrder
                v263 = v268
            end
            if v265.icon then
                v268.Face.ContentFrame.IconFrame.ImageLabel.Image = v265.icon.image
                local v269 = v265.button_height - v265.original_height
                local v270 = v258 - v265.original_height
                v268.Face.ContentFrame.TextLabel.Size = v268.Face.ContentFrame.TextLabel.Size - UDim2.new(0, v270, 0, 0)
                v268.Face.ContentFrame.IconFrame.Position = v268.Face.ContentFrame.IconFrame.Position + UDim2.new(0, (v270 - v269) / 2, 0, 0)
                if v265.icon.size then
                    v268.Face.ContentFrame.IconFrame.ImageLabel.Size = v265.icon.size
                end
            else
                v268.Face.ContentFrame.IconFrame:Destroy()
                v268.Face.ContentFrame.TextLabel.TextXAlignment = Enum.TextXAlignment.Center
                v268.Face.ContentFrame.TextLabel.Size = UDim2.new(1, 0, 1, 0)
                v268.Face.ContentFrame.UIPadding.PaddingLeft = UDim.new(0, 8)
                v268.Face.ContentFrame.UIPadding.PaddingRight = UDim.new(0, 8)
            end
            local v271 = p243.UIManager.wrap(v268, "DepthButton"):start({
                ["mouse_button1_click"] = function()
                    v_u_249.continue(v_u_264)
                end
            })
            if v265.button_state then
                v271:set_state(v265.button_state)
            elseif v_u_32[v265.text:gsub("%p+", ""):gsub("%s+", "")] and true or false then
                v271:set_state("cancel")
            end
            v268.Parent = p246.Buttons
        end
        p243:_do_xbox_selection(v263)
        v248:Destroy()
        local v272 = v_u_249.yield()
        v252:Disconnect()
        return v272
    end,
    ["HeaderDialog"] = function(p273, p274, p275, p276)
        local v277 = v_u_27:Translate(workspace, p275.text)
        local v278 = v_u_39(p275)
        assert(v277, "No text supplied")
        p276.Info.TextLabel.Text = v277
        local v279 = p275.header
        assert(v279, "No header supplied")
        p276.Header.TextLabel.Text = p275.header
        if p275.header_icon then
            p276.Header.ImageLabel.Visible = true
            p276.Header.ImageLabel.Image = p275.header_icon
            local v280 = 10 + p276.Header.TextLabel.TextBounds.X
            p276.Header.TextLabel.Size = UDim2.new(0, v280, 1, 0)
            local v281 = p276.Header.ImageLabel.AbsoluteSize.X
            p276.Header.TextLabel.Position = UDim2.new(0.5, v281 / 2, 0, 0)
            p276.Header.ImageLabel.Position = UDim2.new(0.5, -v280 / 2, 0, 0)
        else
            p276.Header.ImageLabel.Visible = false
            p276.Header.TextLabel.Position = UDim2.fromScale(0.5, 0)
        end
        return p273:_yield_until_button_pressed(p274, v278, p276, p275)
    end,
    ["ScrollingButtonsDialog"] = function(p282, p_u_283, p284, p285)
        local v286 = p284.header
        assert(v286, "No header supplied")
        p285.Header.Text = p284.header
        local v_u_287 = v_u_11.create_continue()
        if p284.exit_button then
            p282.exit_button_callback = v_u_287.continue
        end
        local v290 = p282.force_response_signal:Connect(function(p288, p289)
            if p288 == p_u_283 then
                v_u_287.continue(p289)
            end
        end)
        local v291 = p285.ScrollingFrame.Content.UIListLayout
        local v292 = p282.UIManager.wrap(p285.ScrollingFrame, "VerticalButtonGrid")
        v292:start(p285.ScrollingFrame.Content.ButtonTemplate, {
            ["row_height"] = p284.row_height or 50,
            ["cells_per_row"] = p284.cells_per_row or 1,
            ["padding"] = p284.padding or 0
        })
        local v293 = {}
        for v294, v295 in p284.buttons do
            table.insert(v293, {
                ["entry"] = v295,
                ["id"] = v294
            })
        end
        if p284.cancelable then
            table.insert(v293, {
                ["entry"] = {
                    ["text"] = "Cancel",
                    ["layout_order"] = (1 / 0)
                },
                ["id"] = "cancel"
            })
        end
        table.sort(v293, function(p296, p297)
            return p296.entry.layout_order < p297.entry.layout_order
        end)
        for _, v298 in v293 do
            local v299 = v298.entry
            local v_u_300 = v298.id
            local v301 = v299.text
            assert(v301, "No button text supplied")
            v299.button_props = {
                ["mouse_button1_click"] = function()
                    v_u_287.continue(v_u_300)
                end
            }
            if not v299.button_state and v_u_32[v299.text:gsub("%p+", ""):gsub("%s+", "")] then
                v299.button_state = "cancel"
            end
            v292:add(v_u_300, v299)
        end
        local v302 = p282.UIManager.wrap(p285.ScrollingFrame, "GridList"):start()
        v302:add(v292)
        v302:render()
        p285.ScrollingFrame.CanvasSize = UDim2.new(1, 0, 0, v292:get_height())
        p285.ScrollingFrame.Content.UIListLayout.VerticalAlignment = p284.vertical_alignment or Enum.VerticalAlignment.Top
        p282:_do_xbox_selection(v292:get_button(1, 1))
        local v303 = table.pack(v_u_287.yield())
        v302:destroy()
        v292:destroy()
        v291.VerticalAlignment = Enum.VerticalAlignment.Top
        v290:Disconnect()
        p282.exit_button_callback = nil
        return table.unpack(v303)
    end,
    ["ItemPreviewDialog"] = function(p304, p305, p306, p307)
        local v308 = v_u_2("ItemDB")
        local v309 = v_u_27:Translate(workspace, p306.text)
        local v310 = p306.items or {}
        if p306.item then
            local v311 = p306.item
            table.insert(v310, v311)
        end
        local v312 = v_u_39(p306)
        assert(v309, "No text supplied")
        local v313
        if v310 then
            v313 = #v310 > 0
        else
            v313 = v310
        end
        assert(v313, "No item supplied")
        p307.Info.TextLabel.Text = v309
        local v314 = p304.UIManager.wrap(p307, "ItemTooltip"):start(p304)
        v314:set_mouse_leave_frame(p307)
        local v315 = p307.Info.Items.Item
        v315.Parent = nil
        local v316 = {}
        for _, v317 in v310 do
            local v318 = v315:Clone()
            v318.Parent = p307.Info.Items
            local v319 = v308[v317.category][v317.kind]
            p304.UIManager.wrap(v318, "ItemImage"):start({
                ["entry"] = v319
            })
            if v317.category == "pets" then
                p304.UIManager.wrap(v318, "TagDisplay"):start({
                    ["properties"] = v317.properties
                })
            end
            if p306.is_item_entry then
                v314:hook_on_hover({
                    ["frame"] = v318,
                    ["type"] = "item_entry",
                    ["item_entry"] = v319
                })
            else
                v314:hook_on_hover({
                    ["frame"] = v318,
                    ["type"] = "item_data",
                    ["item_data"] = v317
                })
            end
            table.insert(v316, v318)
        end
        local v320 = #v310
        local v321 = p307.Info.Items.UIGridLayout
        v321.CellPadding = UDim2.fromOffset(v320 > 4 and 5 or 25, 0)
        v321.CellSize = UDim2.new(1 / v320, -v321.CellPadding.X.Offset, 1, 0)
        local v322 = p304:_yield_until_button_pressed(p305, v312, p307, p306)
        v314:hide()
        for _, v323 in v316 do
            v323:Destroy()
        end
        v315.Parent = p307.Info.Items
        return v322
    end,
    ["ImageDialog"] = function(p324, p325, p326, p327)
        local v328 = v_u_39(p326)
        p327.Info.Container.ImageLabel.Image = p326.image or ""
        p327.Info.Container.ImageLabel.TextLabel.Text = p326.text or ""
        return p324:_yield_until_button_pressed(p325, v328, p327, p326)
    end,
    ["NPCDialog"] = function(p_u_329, p330, p331, p332)
        local v333 = v_u_27:Translate(workspace, p331.text)
        local v334 = v_u_39(p331)
        local v335 = p331.npc_image
        assert(v335, "No NPC image supplied")
        p332.NPC.Image = p331.npc_image
        assert(v333, "No text supplied")
        p332.Info.TextLabel.Text = v333
        local v336 = {
            ["mouse_button1_click"] = function()
                if p_u_329.exit_button_callback then
                    p_u_329.exit_button_callback()
                end
            end,
            ["mouse_button1_down"] = function()
                v_u_3.FX:play("BambooButton")
            end
        }
        p_u_329.UIManager.wrap(p332.ExitButton, "DepthButton"):start(v336)
        p331.exit_button = true
        p_u_329.instance.Dialog.Backing.Visible = false
        local v337 = p_u_329:_yield_until_button_pressed(p330, v334, p332, p331)
        p_u_329.instance.Dialog.Backing.Visible = true
        return v337
    end,
    ["CheckboxDialog"] = function(p338, p339, p340, p341)
        local v342 = v_u_27:Translate(workspace, p340.text)
        local v343 = v_u_27:Translate(workspace, p340.checkbox_text)
        local v344 = v_u_39(p340)
        assert(v342, "No text supplied")
        assert(v343, "No checkbox text supplied")
        p341.Info.TextLabel.Text = v342
        local v345 = p338.UIManager.wrap(p341.Checkbox, "Checkbox"):start({
            ["default"] = false,
            ["text"] = v343
        })
        local v346 = p338:_yield_until_button_pressed(p339, v344, p341, p340)
        local v347 = v345:get()
        v345:destroy()
        return v346, v347
    end,
    ["CountDialog"] = function(p348, _, p_u_349, p_u_350)
        local v_u_351 = v_u_11.create_continue()
        local v_u_352 = p_u_349.min
        local v_u_353 = p_u_349.max
        local v_u_354 = v_u_352
        local v_u_355 = nil
        local v_u_356 = nil
        local v357 = {
            ["mouse_button1_click"] = function()
                v_u_351.continue(v_u_354)
            end
        }
        p348.UIManager.wrap(p_u_350.Buttons.Accept, "DepthButton"):start(v357):set_state("normal")
        local v358 = p348.UIManager.wrap(p_u_350.Buttons.Cancel, "DepthButton"):start({
            ["mouse_button1_click"] = function()
                v_u_351.continue(0)
            end
        })
        p_u_350.Buttons.Cancel.Face.TextLabel.Text = v_u_27:Translate(workspace, p_u_349.left or "Cancel")
        v358:set_state("cancel")
        local function v_u_365(p359)
            local v360 = tonumber(p359)
            if v360 then
                local v361 = v_u_352
                local v362 = v_u_353
                v_u_354 = math.clamp(v360, v361, v362)
                p_u_350.Info.Count.Display.Text = v_u_354
                v_u_355:set_state(v_u_354 < v_u_353 and "normal" or "disabled")
                v_u_356:set_state(v_u_352 < v_u_354 and "normal" or "disabled")
                v_u_355.instance.Visible = v_u_8.is_using_gamepad() or v_u_354 < v_u_353
                v_u_356.instance.Visible = v_u_8.is_using_gamepad() or v_u_352 < v_u_354
                local v363 = p_u_349.right or "Okay"
                if type(v363) == "function" then
                    v363 = v363(v_u_354)
                end
                p_u_350.Buttons.Accept.Face.TextLabel.Text = v_u_27:Translate(workspace, v363)
                local v364 = p_u_349.text
                if type(v364) == "function" then
                    v364 = v364(v_u_354)
                end
                p_u_350.Info.TextLabel.Text = v_u_27:Translate(workspace, v364)
            end
        end
        local v366 = {
            ["mouse_button1_click"] = function()
                v_u_365(v_u_354 + 1)
            end
        }
        v_u_355 = p348.UIManager.wrap(p_u_350.Info.Count.Increase, "DepthButton"):start(v366)
        local v367 = {
            ["mouse_button1_click"] = function()
                v_u_365(v_u_354 - 1)
            end
        }
        v_u_356 = p348.UIManager.wrap(p_u_350.Info.Count.Decrease, "DepthButton"):start(v367)
        local v_u_368 = p_u_350.Info.Count.Display
        v_u_368:GetPropertyChangedSignal("Text"):Connect(function()
            v_u_365(v_u_368.Text)
        end)
        v_u_368.FocusLost:Connect(function()
            local v369 = v_u_368.Text
            if tonumber(v369) then
                v_u_365(v_u_368.Text)
            else
                v_u_365(v_u_354)
            end
        end)
        v_u_365(v_u_352)
        p348:_do_xbox_selection(p_u_350.Buttons.Accept)
        return v_u_351.yield() or 0
    end,
    ["SpawnChooserDialog"] = function(p370, _, p371, p372)
        local v_u_373 = v_u_11.create_continue()
        local v374 = v_u_4.new()
        if v_u_8.get_platform() == v_u_8.platform.desktop then
            for _, v375 in { p372.AdoptionIsland, p372.House } do
                local v_u_376 = Instance.new("UIScale")
                v_u_376.Parent = v375
                v374:GiveTask(v_u_376)
                v374:GiveTask(v375.MouseEnter:connect(function()
                    game:GetService("TweenService"):Create(v_u_376, TweenInfo.new(0.1), {
                        ["Scale"] = 1.025
                    }):Play()
                end))
                v374:GiveTask(v375.MouseLeave:connect(function()
                    game:GetService("TweenService"):Create(v_u_376, TweenInfo.new(0.1), {
                        ["Scale"] = 1
                    }):Play()
                end))
            end
        end
        v374:GiveTask(p372.AdoptionIsland.MouseButton1Click:connect(function()
            v_u_373.continue("Adoption Island")
        end))
        v374:GiveTask(p372.House.MouseButton1Click:connect(function()
            v_u_373.continue("Home")
        end))
        p372.Checkbox.Visible = false
        if p371.exit_button then
            p370.exit_button_callback = v_u_373.continue
        end
        p370:_do_xbox_selection(p372.House)
        local v377 = v_u_373.yield()
        v374:DoCleaning()
        return v377, false
    end,
    ["CaptchaDialog"] = function(p378, _, p379, p_u_380)
        p378.instance.Dialog.Backing.Visible = false
        p378.exit_button.instance.Visible = false
        local v381 = p379.text
        assert(v381, "No text supplied")
        p_u_380.Body.TextLabel.Text = v_u_27:Translate(workspace, p379.text)
        local v_u_382 = nil
        local v_u_383 = v_u_4.new()
        local v384 = Random.new()
        local v_u_385
        if p379.exit_button then
            local v386 = {
                ["mouse_button1_click"] = function()
                    if v_u_382 then
                        v_u_382.continue()
                    end
                end,
                ["mouse_button1_down"] = function()
                    v_u_3.FX:play("BambooButton")
                end
            }
            p378.UIManager.wrap(p_u_380.ExitButton, "DepthButton"):start(v386)
            p_u_380.ExitButton.Visible = true
            v_u_385 = nil
        else
            p_u_380.ExitButton.Visible = false
            v_u_385 = nil
        end
        while not v_u_385 do
            local v387 = v_u_11.create_continue()
            local v_u_388 = v387
            local v389 = {}
            for _, v_u_390 in p_u_380.Buttons:GetChildren() do
                if v_u_390:IsA("ImageButton") then
                    local v391 = v_u_390:Clone()
                    v391.Parent = p_u_380.Buttons
                    v_u_383:GiveTask(v391)
                    v_u_383:GiveTask(function()
                        v_u_390.Parent = p_u_380.Buttons
                    end)
                    v_u_390.Parent = nil
                    table.insert(v389, v391)
                end
            end
            table.sort(v389, function(p392, p393)
                return p392.LayoutOrder < p393.LayoutOrder
            end)
            local v_u_394 = v384:NextInteger(1, #v389)
            local v395 = v_u_25.List.shuffle(p_u_380.Assets.Shapes:GetChildren())
            local v397 = v_u_25.List.shuffle(v_u_25.List.map(p_u_380.Assets.Colors:GetChildren(), function(p396)
                return p396.Value
            end))
            local v_u_398 = nil
            for v_u_399, v_u_400 in v389 do
                local v401 = v395[v_u_399]:Clone()
                v401.ImageColor3 = v397[v_u_399]
                v401.Visible = true
                v401.Parent = v_u_400
                v_u_383:GiveTask(v401)
                local v_u_402 = Instance.new("UIScale")
                v_u_402.Parent = v401
                v_u_402.Scale = 1
                local v404 = {
                    ["mouse_button1_click"] = function()
                        if not v_u_398 then
                            v_u_398 = v_u_399
                            v_u_385 = v_u_398 == v_u_394
                            if v_u_385 == false then
                                local v403 = p_u_380.Assets.Failure:Clone()
                                v403.Visible = true
                                v403.Parent = v_u_400
                                v_u_383:GiveTask(v403)
                                task.wait(1.1)
                            end
                            v_u_388.continue()
                        end
                    end,
                    ["hover_render"] = function()
                        v_u_29:Create(v_u_402, TweenInfo.new(0.15), {
                            ["Scale"] = 1.08
                        }):Play()
                    end,
                    ["up_render"] = function()
                        v_u_29:Create(v_u_402, TweenInfo.new(0.25), {
                            ["Scale"] = 1
                        }):Play()
                    end
                }
                p378.UIManager.wrap(v_u_400, "CustomButton"):start(v404)
                if v_u_399 == v_u_394 then
                    local v405 = v401:Clone()
                    v405.Parent = p_u_380.Body.ShapeSelection
                    v_u_383:GiveTask(v405)
                end
            end
            p378:_do_xbox_selection(v389[1])
            v_u_388.yield()
            v_u_383:DoCleaning()
            if v_u_385 ~= false or not p379.allow_retry then
                break
            end
        end
        return v_u_385
    end
}
function v30._yield_until_button_pressed(p407, p_u_408, p409, p410, p_u_411, p412)
    local v413 = #p409 >= 1
    assert(v413, "No buttons supplied for NormalDialog")
    local v_u_414 = v_u_11.create_continue()
    for _, v415 in pairs(p410.Buttons:GetChildren()) do
        if v415:IsA("ImageButton") then
            v415:Destroy()
        end
    end
    if p_u_411.exit_button then
        p407.exit_button_callback = v_u_414.continue
    end
    local v416 = p_u_411.text_area_button and p410:FindFirstChild("TextAreaButton", true)
    if v416 then
        v416.Visible = true
        v416.MouseButton1Click:Connect(function()
            v_u_414.continue(p_u_411.text_area_button)
        end)
    end
    local v_u_417 = {}
    for v418, v_u_419 in pairs(p409) do
        local v_u_420 = p407.normal_dialog_button_template:Clone()
        v_u_420.Modal = true
        v_u_420.Face.TextLabel.Text = v_u_419
        local v421 = {
            ["mouse_button1_click"] = function()
                v_u_414.continue(v_u_419)
            end,
            ["mouse_button1_down"] = function()
                v_u_3.FX:play("BambooButton")
            end
        }
        local v_u_422 = p407.UIManager.wrap(v_u_420, "DepthButton"):start(v421)
        if #p409 > 1 and v_u_32[v_u_419:gsub("%p+", ""):gsub("%s+", "")] then
            v_u_422:set_state("cancel")
        else
            local function v423()
                if v_u_419 == "Sell" or v_u_419 == "Report" then
                    v_u_422:set_state("selected")
                else
                    v_u_422:set_state("normal")
                end
            end
            if p412 then
                v_u_422:set_state("unpressable")
                p412:Connect(v423)
            else
                if v_u_419 == "Sell" or v_u_419 == "Report" then
                    v_u_422:set_state("selected")
                else
                    v_u_422:set_state("normal")
                end
                if p_u_411.accept_delay then
                    v_u_422:set_state("disabled")
                    v_u_417[v418] = {
                        ["reset"] = function()
                            if v_u_419 == "Sell" or v_u_419 == "Report" then
                                v_u_422:set_state("selected")
                            else
                                v_u_422:set_state("normal")
                            end
                            v_u_420.Face.TextLabel.Text = v_u_419
                        end,
                        ["update_text"] = function(p424)
                            v_u_420.Face.TextLabel.Text = p424
                        end
                    }
                end
            end
        end
        v_u_420.Parent = p410.Buttons
        if v418 == 1 then
            p407:_do_xbox_selection(v_u_420)
        end
    end
    p410.Buttons.UIGridLayout.CellSize = UDim2.new(1 / #p409, (#p409 - 1) * -6, 1, 0)
    p410.Buttons.UIGridLayout.CellPadding = UDim2.new(0, 6, 0, 6)
    local v427 = p407.force_response_signal:Connect(function(p425, p426)
        if p425 == p_u_408 then
            v_u_414.continue(p426)
        end
    end)
    local v_u_428
    if p_u_411.accept_delay then
        v_u_428 = v_u_17.new()
        if p_u_411.accept_delay_tick_interval then
            v_u_428:set_tick_interval(p_u_411.accept_delay_tick_interval)
        end
        v_u_428:on_tick(function()
            for _, v429 in v_u_417 do
                local v430 = v429.update_text
                local v431 = v_u_428:get_remaining_time()
                v430((math.ceil(v431)))
            end
        end)
        v_u_428:on_stopped(function()
            for _, v432 in v_u_417 do
                v432.reset()
            end
        end)
        v_u_428:set_duration(p_u_411.accept_delay)
        v_u_428:start()
    else
        v_u_428 = nil
    end
    local v433 = v_u_414.yield()
    v427:Disconnect()
    p407.exit_button_callback = nil
    if v_u_428 then
        v_u_428:stop()
        v_u_428:destroy()
    end
    return v433
end
function v30._do_xbox_selection(p434, p435)
    p434.default_selection = p435
    p434.signal_open:Fire(p435)
end
function v30._dialog_helper(p436, p437, p438)
    if p438.play_pop_sound or p438.play_pop_sound == nil then
        v_u_3.FX:play("Pop")
    end
    p436.UIManager.set_app_visibility("DialogApp", true)
    local v439 = v_u_19.force_show()
    local v440 = p438.dialog_type or "NormalDialog"
    local v441 = p436.instance.Dialog[v440]
    p436.instance.Dialog.Backing.Visible = p438.hidden_backing ~= true
    p436.exit_button.instance.Visible = p438.exit_button or false
    for _, v442 in pairs(p436.instance.Dialog:GetChildren()) do
        if v442:IsA("Frame") then
            v442.Visible = v442 == v441
        end
    end
    local v443 = v441:Clone()
    local v444 = table.pack(v_u_406[v440](p436, p437, p438, v441))
    v443.Parent = v441.Parent
    v441:Destroy()
    v443.Visible = false
    p436.UIManager.set_app_visibility("DialogApp", false)
    v439()
    p436.default_selection = nil
    p436.signal_close:Fire()
    local v445 = v444.n
    return unpack(v444, 1, v445)
end
function v30._queue_ticket(p_u_446, p_u_447)
    return v_u_24.race({ v_u_24.new(function(p448)
            if p_u_446.completed_ticket + 1 == p_u_447 then
                p448()
            end
        end), v_u_24.fromEvent(p_u_446.ticket_completed_signal, function(p449)
            return p449 + 1 == p_u_447
        end) })
end
function v30.queue_with_override(p_u_450, p451)
    local v_u_452 = p451 or {}
    p_u_450.ticket_count = p_u_450.ticket_count + 1
    local v_u_453 = p_u_450.ticket_count
    local v_u_454 = false
    local v_u_455 = nil
    local function v456(...)
        if not v_u_454 then
            v_u_454 = true
            v_u_455 = table.pack(...)
            p_u_450.force_response_signal:Fire(v_u_453, v_u_455)
        end
    end
    local v_u_458 = p_u_450:_queue_ticket(v_u_453):andThen(function()
        local v457 = v_u_455 or table.pack(p_u_450:_dialog_helper(v_u_453, v_u_452))
        return table.unpack(v457)
    end)
    local v461 = v_u_24.race({ v_u_458, v_u_24.fromEvent(p_u_450.force_response_signal, function(p459)
            return p459 == v_u_453
        end):andThen(function(_, p460)
            return table.unpack(p460)
        end) })
    v_u_24.try(function()
        v_u_458:await()
        v_u_454 = true
        p_u_450.completed_ticket = v_u_453
        p_u_450.ticket_completed_signal:Fire(v_u_453)
    end)
    return v461, v456
end
function v30.dialog(p_u_462, p463)
    local v_u_464 = p463 or {}
    local v465 = v_u_24.resolve()
    if v_u_464.dialog_type == "RobuxProductDialog" then
        v465 = v465:andThen(function()
            v_u_2("new:StandardSequencePreviewClient").show_initial_purchase_disclosure_async(v_u_464.product_id)
        end)
    end
    local v466 = v465:andThen(function()
        return p_u_462:queue_with_override(v_u_464)
    end)
    if v_u_464.yields or v_u_464.yields == nil then
        return v466:expect()
    else
        return v466
    end
end
function v30.choose_color(p467, p468)
    return p467:dialog(v_u_9.combine(p468, {
        ["dialog_type"] = "ColorPickerDialog"
    }))
end
function v30.paragraph_dialog(p469, p470)
    return p469:dialog(v_u_9.combine(p470, {
        ["dialog_type"] = "ParagraphDialog"
    }))
end
function v30.free_response_dialog(p471, p472)
    return p471:dialog(v_u_9.combine(p472, {
        ["dialog_type"] = "FreeResponseDialog"
    }))
end
function v30.dialog_is_visible(p473, p474)
    return p473.instance.Dialog[p474].Visible
end
function v30.is_any_visible(p475)
    for _, v476 in p475.instance.Dialog:GetChildren() do
        if v476.Name ~= "Backing" and v476.Visible then
            return true
        end
    end
    return false
end
function v30.show(p477)
    p477.instance.Dialog.Visible = true
end
function v30.hide(p478)
    p478.instance.Dialog.Visible = false
end
function v30.connect_to_msg_bridge(p_u_479)
    if not p_u_479.msg_bridge_connected then
        p_u_479.msg_bridge_connected = true
        coroutine.wrap(function()
            local v480 = v_u_15.get("MsgAPI/DownloadInitialQueue"):InvokeServer("dialog")
            for _, v481 in pairs(v480) do
                v481.yields = false
                p_u_479:dialog(v481)
            end
        end)()
        v_u_15.get_event("MsgAPI/DialogSent").OnClientEvent:connect(function(p482)
            p_u_479:dialog(p482)
        end)
    end
end
function v30.set_display_order(p_u_483, p484)
    local v_u_485 = p_u_483.instance.DisplayOrder
    p_u_483.instance.DisplayOrder = p484
    return function()
        p_u_483.instance.DisplayOrder = v_u_485
    end
end
function v30.refresh(p486, p487)
    local v488 = p486.UIManager.is_closed({ "StickerRewardsApp" })
    if not p487[p486.ClassName] then
        v488 = false
    end
    p486:set_visibility(v488)
end
function v30.start(p_u_489)
    p_u_489.is_dialog_open = false
    p_u_489.force_response_signal = v_u_6.new()
    p_u_489.ticket_count = 0
    p_u_489.completed_ticket = 0
    p_u_489.ticket_completed_signal = v_u_6.new()
    p_u_489.normal_dialog_button_template = p_u_489.instance.Dialog.NormalDialog.Buttons.ButtonTemplate
    p_u_489.normal_dialog_button_template.Parent = nil
    p_u_489.color_picker_template = p_u_489.instance.Dialog.ColorPickerDialog.Info.ColorTemplate
    p_u_489.color_picker_default_position = UDim2.new(0.5, 2, 0.5, 1)
    p_u_489.color_picker_template.Parent = nil
    p_u_489.theme_color_template = p_u_489.instance.Dialog.ThemeColorDialog.Info.Response.ColorTemplate
    p_u_489.theme_color_template.Parent = nil
    p_u_489.signal_open = v_u_6.new()
    p_u_489.signal_close = v_u_6.new()
    p_u_489.exit_button_callback = nil
    local v490 = {
        ["mouse_button1_click"] = function()
            if p_u_489.exit_button_callback then
                p_u_489.exit_button_callback()
            end
        end,
        ["mouse_button1_down"] = function()
            v_u_3.FX:play("BambooButton")
        end
    }
    p_u_489.exit_button = p_u_489.UIManager.wrap(p_u_489.instance.Dialog.ExitButton, "DepthButton"):start(v490)
    local v_u_491 = v_u_28.LocalPlayer.PlayerGui
    v_u_13.watch({
        ["selection_parent"] = p_u_489.instance.Dialog,
        ["default_selection"] = function()
            if p_u_489.default_selection and (p_u_489.default_selection:IsDescendantOf(v_u_491) and p_u_489.default_selection.Visible) then
                return p_u_489.default_selection
            end
            local v492 = nil
            for _, v493 in p_u_489.instance.Dialog:GetChildren() do
                if v493.Visible and v493 ~= p_u_489.instance.Dialog.Backing then
                    local v494 = nil
                    for _, v495 in v493:GetDescendants() do
                        if v495:IsA("GuiBase2d") and (v495.Visible and (v495.Selectable and (v494 == nil or v495.SelectionOrder < v494.SelectionOrder))) then
                            v494 = v495
                        end
                    end
                    return v494 or v492
                end
            end
            return v492
        end,
        ["signal_open"] = p_u_489.signal_open,
        ["signal_close"] = p_u_489.signal_close
    })
end
return v30