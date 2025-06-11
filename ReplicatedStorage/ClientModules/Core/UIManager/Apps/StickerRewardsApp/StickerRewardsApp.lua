--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.StickerRewardsApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientToolManager")
local v_u_3 = v1("SettingsHelper")
local v_u_4 = v1("TweenPromise")
local v_u_5 = v1("ShakePromise")
local v_u_6 = v1("InventoryDB")
local v_u_7 = v1("SoundPlayer")
local v_u_8 = v1("XboxSupport")
local v_u_9 = v1("ClientData")
local v10 = v1("PlatformM")
local v_u_11 = v1("RarityDB")
local v_u_12 = v1("Signal")
local v_u_13 = v1("Music")
local v14 = v1("Class")
local v_u_15 = v1("Maid")
local v_u_16 = v1("package:Sift")
local v_u_17 = v1("package:Promise")
local v_u_18 = game:GetService("ContentProvider")
local v_u_19 = v10.get_platform() == "phone" and true or v10.get_platform() == "tablet"
local v_u_20 = {
    ["event"] = {
        ["image"] = "rbxassetid://16741096723",
        ["color"] = Color3.fromRGB(0, 181, 84),
        ["image_color"] = Color3.fromRGB(0, 153, 98)
    },
    ["common"] = {
        ["image"] = "rbxassetid://16741096723",
        ["color"] = Color3.fromRGB(0, 181, 84),
        ["image_color"] = Color3.fromRGB(0, 153, 98)
    },
    ["uncommon"] = {
        ["image"] = "rbxassetid://16741096786",
        ["color"] = Color3.fromRGB(0, 177, 215),
        ["image_color"] = Color3.fromRGB(0, 154, 201)
    },
    ["rare"] = {
        ["image"] = "rbxassetid://16741096854",
        ["color"] = Color3.fromRGB(104, 5, 196),
        ["image_color"] = Color3.fromRGB(88, 3, 166)
    },
    ["ultra_rare"] = {
        ["image"] = "rbxassetid://16741096912",
        ["color"] = Color3.fromRGB(235, 0, 35),
        ["image_color"] = Color3.fromRGB(179, 0, 27)
    },
    ["legendary"] = {
        ["image"] = "rbxassetid://16741113124",
        ["color"] = Color3.fromRGB(2, 0, 25),
        ["image_color"] = Color3.fromRGB(52, 49, 82)
    }
}
local v_u_21 = {
    ["standard"] = {
        ["desktop"] = "rbxassetid://16800119693",
        ["mobile"] = "rbxassetid://16791198607"
    },
    ["premium"] = {
        ["desktop"] = "rbxassetid://16800119599",
        ["mobile"] = "rbxassetid://16791198498"
    }
}
local v_u_22 = {
    ["standard"] = {
        ["desktop"] = "rbxassetid://16800119749",
        ["mobile"] = "rbxassetid://16741113341"
    },
    ["premium"] = {
        ["desktop"] = "rbxassetid://16800119843",
        ["mobile"] = "rbxassetid://16788064048"
    }
}
local v_u_23 = Random.new()
local v24 = v14("StickerRewardsApp", v1("UIBaseApp"))
function v24.show(p25)
    p25.instance.Enabled = true
end
function v24.hide(p26)
    p26.instance.Enabled = false
end
local function v_u_34(p27)
    local v28 = p27:GetDescendants()
    table.insert(v28, p27)
    local v29 = {}
    for _, v30 in v28 do
        local v31 = {}
        if v30:IsA("Frame") then
            v31.BackgroundTransparency = 1
        elseif v30:IsA("ImageLabel") then
            v31.BackgroundTransparency = 1
            v31.ImageTransparency = 1
        elseif v30:IsA("TextLabel") then
            v31.BackgroundTransparency = 1
            v31.TextTransparency = 1
        end
        if next(v31) ~= nil then
            local v32 = v_u_4.new
            local v33 = TweenInfo.new(1.05)
            table.insert(v29, v32(v30, v33, v31))
        end
    end
    return v_u_17.allSettled(v29)
end
local function v_u_38(p35)
    local v36 = v_u_9.get("inventory") or {}
    if v36 then
        for _, v37 in v36.gifts do
            if v37.kind == p35 then
                v_u_2.equip(v37)
                return
            end
        end
    end
end
function v24.tap_to_speed_up(p_u_39)
    function p_u_39.claim_button_behavior()
        if p_u_39.reveal_speed == 0 then
            return
        elseif p_u_39.reveal_speed < 1 then
            p_u_39.reveal_speed = 0
            p_u_39.insta_reveal_signal:Fire()
        else
            p_u_39.reveal_speed = 0.55
        end
    end
    p_u_39:show_claim_button(true, {
        ["full_screen"] = true
    })
end
function v24.play_closing(p_u_40)
    function p_u_40.claim_button_behavior() end
    if p_u_40.legendary_maid then
        p_u_40.legendary_maid:DoCleaning()
    end
    local v_u_41 = { p_u_40:show_claim_button(false, {
            ["full_screen"] = v_u_19
        }) }
    if p_u_40.reward_maid and p_u_40.reward_maid.shine_maid then
        p_u_40.reward_maid.shine_maid:DoCleaning()
    end
    v_u_7.FX:play("StickersFade")
    v_u_17.delay(1.1):andThen(function()
        v_u_7.FX:play("StickerDropOut")
    end)
    local v_u_56 = v_u_17.try(function()
        for v42, v_u_43 in p_u_40.cards do
            local v_u_44 = v_u_43.Container.Frame.Sticker
            v_u_44.Rotation = v_u_44.AbsoluteRotation
            v_u_44.Parent = v_u_43
            v_u_43.ShineFrame:Destroy()
            for _, v45 in v_u_43:GetChildren() do
                if v45 ~= v_u_43.Container and (v45 ~= v_u_44 and not v45:IsA("UIAspectRatioConstraint")) then
                    v45.Parent = v_u_43.Container.Frame
                end
            end
            local v46 = 1.2 + 0.65 * v42 / #p_u_40.cards
            local v47 = v_u_41
            local v48 = v_u_34
            local v49 = v_u_43.Container
            table.insert(v47, v48(v49))
            local v50 = v_u_41
            local v51 = v_u_17.delay(p_u_40.reveal_speed == 0 and 0 or v46)
            local function v52()
                return v_u_17.all({ v_u_4.new(v_u_43, TweenInfo.new(0.6), {
                        ["Size"] = UDim2.fromScale(0, 0),
                        ["Position"] = UDim2.fromScale(0.5, 1)
                    }), v_u_4.new(v_u_44, TweenInfo.new(0.6), {
                        ["ImageTransparency"] = 1
                    }) })
            end
            table.insert(v50, v51:andThen(v52))
        end
        if p_u_40.original_volume and p_u_40.faded_volume then
            local v53 = p_u_40.reward_maid
            local v_u_55 = v_u_4.callback(p_u_40.faded_volume, p_u_40.original_volume, TweenInfo.new(1.1), function(p54)
                v_u_13.set_master_volume(p54)
            end)
            v53:GiveTask(function()
                v_u_55:cancel()
            end)
        end
    end)
    return v_u_17.try(function()
        local v57 = v_u_41
        local v58 = v_u_56
        table.insert(v57, v58)
        local v_u_59 = v_u_17.all(v_u_41)
        p_u_40.reward_maid:GiveTask(function()
            v_u_59:cancel()
        end)
        return v_u_59
    end):catch(function(p60)
        warn("Something went wrong closing sticker rewards app:", p60)
    end):andThen(function()
        return v_u_4.new(p_u_40.background_fade, TweenInfo.new(1), {
            ["BackgroundTransparency"] = 1
        })
    end):andThen(function()
        p_u_40.UIManager.set_app_visibility(p_u_40.ClassName, false)
        p_u_40.reward_maid:DoCleaning()
    end)
end
function v24.add_shine(p61, p62, p63)
    local v64 = p63 or {}
    local v_u_65 = p61.shine:Clone()
    v_u_65.Position = v64.position or UDim2.fromScale(v_u_23:NextNumber(), v_u_23:NextNumber())
    v_u_65.UIScale.Scale = 0
    v_u_65.Parent = p62
    local v66 = v64.max_pixel_drift or 50
    local v_u_67 = v_u_4.new(v_u_65, TweenInfo.new(v_u_23:NextNumber(1, 3), Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true, v_u_23:NextNumber(0.2, 1)), {
        ["ImageTransparency"] = v_u_23:NextNumber(0.3, 0.9)
    })
    local v68 = v_u_23:NextNumber(0.45, 1.3)
    local v_u_69 = v_u_23:NextNumber(0.45, 1.3)
    local v70 = v68 + v_u_69 + v_u_23:NextNumber(1, 4)
    return v_u_17.all({ v_u_4.new(v_u_65.UIScale, TweenInfo.new(v68), {
            ["Scale"] = v_u_23:NextNumber(0.4, 1.25)
        }), v_u_17.delay(v70 - v_u_69):andThen(function()
            return v_u_4.new(v_u_65.UIScale, TweenInfo.new(v_u_69), {
                ["Scale"] = 0
            })
        end), v_u_4.new(v_u_65, TweenInfo.new(v70, Enum.EasingStyle.Linear), {
            ["Position"] = v_u_65.Position + UDim2.fromOffset(v_u_23:NextInteger(-v66, v66), v_u_23:NextInteger(-v66, v66))
        }) }):finally(function()
        v_u_67:cancel()
        v_u_65:Destroy()
    end)
end
function v24.play_shine(p_u_71)
    if not p_u_71.reward_maid.shine_maid then
        p_u_71.shine_container.Visible = true
        local v_u_72 = v_u_15.new()
        local v_u_73 = false
        v_u_72:GiveTask(function()
            v_u_73 = true
        end)
        v_u_72:GiveTask(function()
            for _, v74 in p_u_71.shine_container:GetChildren() do
                v_u_4.new(v74, TweenInfo.new(1.2), {
                    ["ImageTransparency"] = 1
                })
            end
            task.delay(1.25, function()
                p_u_71.shine_container.Visible = false
            end)
        end)
        local function v_u_77()
            if not v_u_73 then
                local v75 = v_u_72
                local v_u_76 = p_u_71:add_shine(p_u_71.shine_container):finally(function()
                    if not v_u_73 then
                        v_u_77()
                    end
                end)
                v75:GiveTask(function()
                    v_u_76:cancel()
                end)
            end
        end
        task.spawn(function()
            for _ = 1, 10 do
                if not v_u_73 then
                    local v78 = v_u_72
                    local v_u_79 = p_u_71:add_shine(p_u_71.shine_container):finally(function()
                        if not v_u_73 then
                            v_u_77()
                        end
                    end)
                    v78:GiveTask(function()
                        v_u_79:cancel()
                    end)
                end
                task.wait(v_u_23:NextNumber(0.05, 0.15))
            end
        end)
        p_u_71.reward_maid.shine_maid = v_u_72
    end
end
function v24.show_claim_button(p80, p81, p82)
    local v83 = p82 or {}
    p80.claim_button_active = p81
    if v83.full_screen then
        p80.full_screen_claim_button.instance.Visible = p81
        return v_u_17.resolve()
    end
    if v83.text then
        p80.claim_button.instance.Face.TextLabel.Text = v83.text
    end
    local v84 = p80.claim_button.instance
    local v85
    if p81 then
        v85 = nil
    else
        v85 = p80.claim_button.instance.EmptyFrame
    end
    v84.SelectionImageObject = v85
    local v86 = v83.instant and 0 or p80.reveal_speed * (p81 and 0.6 or 0.15)
    local v87 = {}
    local v88 = p81 and 0 or 1
    for _, v89 in v_u_16.List.concat(p80.claim_button.instance.Face.Colors:GetChildren(), p80.claim_button.instance.Shadow.Colors:GetChildren()) do
        local v90 = v_u_4.new
        local v91 = TweenInfo.new(v86)
        table.insert(v87, v90(v89, v91, {
            ["ImageTransparency"] = v88
        }))
    end
    local v92 = v_u_4.new
    local v93 = p80.claim_button.instance.Face.TextLabel
    local v94 = TweenInfo.new(v86)
    table.insert(v87, v92(v93, v94, {
        ["TextTransparency"] = v88
    }))
    return v_u_17.all(v87)
end
function v24.apply_legendary_effect_post_reveal(p95, p96, p97)
    if not p95.legendary_maid then
        p95.legendary_maid = v_u_15.new()
        p95.reward_maid:GiveTask(p95.legendary_maid)
    end
    local v98 = p96.LightGlow
    v98.Visible = true
    v98.Rotation = p96.Container.Frame.Rotation
    for _, v99 in v98.Frame:GetChildren() do
        local v100 = p95.reward_maid
        local v_u_101 = v_u_4.new(v99, TweenInfo.new(0.6), {
            ["ImageTransparency"] = 0
        })
        v100:GiveTask(function()
            v_u_101:cancel()
        end)
    end
    local v102 = p96.Container.Frame
    local v103 = v102.Backing:Clone()
    v103.Parent = p96
    local v104 = p95.reward_maid
    local v105 = v_u_4.new
    local v106 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true, 0)
    local v107 = {}
    local v108 = v102.Size
    local v109
    if p97 then
        v109 = UDim2.fromScale(0.05, 0.05)
    else
        v109 = UDim2.fromScale(0.03, 0.03)
    end
    v107.Size = v108 + v109
    local v_u_110 = v105(v102, v106, v107)
    v104:GiveTask(function()
        v_u_110:cancel()
    end)
    local v111 = p95.legendary_maid
    local v112 = v_u_4.new
    local v113 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, false, 1)
    local v114 = {}
    local v115 = v103.Size
    local v116
    if p97 then
        v116 = UDim2.fromScale(0.3, 0.3)
    else
        v116 = UDim2.fromScale(0.2, 0.2)
    end
    v114.Size = v115 + v116
    v114.BackgroundTransparency = 1
    local v_u_117 = v112(v103, v113, v114)
    v111:GiveTask(function()
        v_u_117:cancel()
    end)
    if p97 then
        p95.UIManager.wrap(p96.ShineFrame, "Shine"):start({
            ["start_delay"] = 1
        })
    end
    for _ = 1, p97 and 7 or 3 do
        local v118 = v_u_23:NextNumber(0.75, 1.05)
        if v_u_23:NextNumber() > 0.5 then
            v118 = 1 - v118
        end
        local v119 = v_u_23:NextNumber(0.75, 1.05)
        if v_u_23:NextNumber() > 0.5 then
            v119 = 1 - v119
        end
        local v120 = p95.reward_maid
        local v_u_121 = p95:add_shine(p96, {
            ["position"] = UDim2.fromScale(v118, v119),
            ["max_pixel_drift"] = 20
        })
        v120:GiveTask(function()
            v_u_121:cancel()
        end)
    end
end
function v24.shake_legendary(_, p_u_122, p123)
    local v_u_124 = p_u_122.Position
    if p123 then
        v_u_7.FX:play("StickerFlipLegendaryAnimated")
    else
        v_u_7.FX:play("StickerFlipLegendary")
    end
    local v_u_125 = tick()
    return v_u_5.callback({
        ["amplitude"] = p123 and 15 or 10,
        ["frequency"] = p123 and 15 or 10,
        ["time"] = 1.3,
        ["decay_percent"] = 0
    }, function(p126)
        local v127 = tick() - v_u_125
        local v128 = v127 * 2 / 1.3
        local v129 = p126 * math.min(1, v128)
        if v127 > 1.2 then
            v129 = v129 * ((1.3 - v127) / 0.1)
        end
        p_u_122.Position = v_u_124 + UDim2.fromOffset(v129.X, v129.Y)
    end):andThen(function()
        p_u_122.Position = v_u_124
    end)
end
function v24.reveal_card(p_u_130, p131)
    local v_u_132 = p_u_130.cards
    if v_u_132 then
        v_u_132 = p_u_130.cards[p131]
    end
    local v_u_133 = p_u_130.current_rewards[p131]
    if v_u_132 and v_u_133 then
        local v134 = v_u_133.entry.rarity
        local v_u_135 = v_u_20[v134]
        local v_u_136 = v_u_132.Container.Frame.Sticker
        local v_u_137 = v134 == "legendary"
        local v_u_138 = v_u_133.entry.animated == true
        local v139 = v_u_17.resolve()
        local v_u_140 = p_u_130.reveal_speed
        if v_u_140 > 0 then
            if v_u_137 then
                v139 = p_u_130:shake_legendary(v_u_132, v_u_138)
            else
                local v141 = p131 % 2 + 1
                local v142 = v134 == "rare" and "Rare" or (v134 == "ultra_rare" and "UltraRare" or "")
                v_u_7.FX:play("StickerFlip" .. v142 .. v141)
            end
        end
        local v_u_143 = v_u_132.Container.Frame.Size
        local v_u_151 = v139:andThen(function()
            return v_u_4.new(v_u_132.Container.Frame, TweenInfo.new(v_u_140 * 0.09, Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.fromScale(0, v_u_143.Y.Scale)
            })
        end):andThen(function()
            local v144 = v_u_132.Container.Frame.Background
            v144.Image = v_u_135.image
            v144.ImageColor3 = v_u_135.image_color
            v144.BackgroundColor3 = v_u_135.color
            v144.BackgroundTransparency = 0
            if v_u_138 then
                v144.BackgroundTransparency = 1
                v144.ImageColor3 = Color3.new(1, 1, 1)
                v144.ImageTransparency = 0.7
                p_u_130.rainbow_background:Clone().Parent = v_u_132.Container.Frame
            end
            p_u_130.reward_maid:GiveTask(p_u_130.UIManager.wrap(v_u_136, "ItemImage"):start({
                ["entry"] = v_u_133.entry,
                ["use_instance"] = true
            }))
            v_u_136.Visible = true
            if v_u_137 then
                local v_u_145 = v_u_132.CircleGlow
                v_u_145.Visible = true
                local v146 = p_u_130.reward_maid
                local v_u_147 = v_u_4.new(v_u_145.UIScale, TweenInfo.new(1.1, Enum.EasingStyle.Linear), {
                    ["Scale"] = 3
                })
                v146:GiveTask(function()
                    v_u_147:cancel()
                end)
                local v148 = p_u_130.reward_maid
                local v_u_149 = v_u_17.delay(0.5):andThen(function()
                    return v_u_4.new(v_u_145, TweenInfo.new(0.55), {
                        ["ImageTransparency"] = 1
                    })
                end)
                v148:GiveTask(function()
                    v_u_149:cancel()
                end)
            end
            return v_u_4.new(v_u_132.Container.Frame, TweenInfo.new(v_u_140 * 0.09, Enum.EasingStyle.Linear), {
                ["Size"] = v_u_143,
                ["Rotation"] = v_u_23:NextNumber(-2, 2)
            })
        end):andThen(function()
            if v_u_137 then
                p_u_130:apply_legendary_effect_post_reveal(v_u_132, v_u_138)
            end
            return v_u_4.new(v_u_132.Container.Frame.RarityLabel, TweenInfo.new(v_u_140 * 0.82), {
                ["TextTransparency"] = 0
            })
        end):catch(function(p150)
            warn("Something went wrong revealing sticker:", p150)
        end)
        p_u_130.reward_maid:GiveTask(function()
            v_u_151:cancel()
        end)
        return v_u_151
    end
end
function v24.add_preload_image(p152, p153)
    local v154 = Instance.new("ImageLabel")
    v154.Image = p153
    p152.reward_maid:GiveTask(v154)
    p152.preload_assets = p152.preload_assets or {}
    local v155 = p152.preload_assets
    table.insert(v155, v154)
end
function v24.open_pack(p_u_156)
    local v_u_157 = p_u_156.current_pack
    if v_u_157 then
        p_u_156.preload_assets = {}
        p_u_156.reward_maid:GiveTask(function()
            p_u_156.preload_assets = nil
        end)
        local v_u_158 = {}
        for v159, v160 in p_u_156.current_rewards or {} do
            local v161 = v_u_6[v160.category][v160.kind]
            if v161 then
                v160.entry = v161
                p_u_156:add_preload_image(v_u_20[v161.rarity].image)
                if v161.image_large and not v_u_19 then
                    p_u_156:add_preload_image(v161.image_large)
                else
                    p_u_156:add_preload_image(v161.image)
                end
                v_u_17.try(v_u_18.PreloadAsync, v_u_18, p_u_156.preload_assets or {})
                local v162 = p_u_156.card:Clone()
                v162.Size = v_u_157.Size
                v162.Visible = true
                v162.Container.Frame.Background.Image = p_u_156.card_back_image
                v162.ZIndex = -v159
                v162.Container.Frame.RarityLabel.Text = v_u_11[v161.rarity].name:upper()
                v162.Container.Frame.RarityLabel.TextTransparency = 1
                v162.Parent = p_u_156.body
                p_u_156.reward_maid:GiveTask(v162)
                v_u_158[v159] = v162
            end
        end
        p_u_156.cards = v_u_158
        p_u_156.reward_maid:GiveTask(function()
            p_u_156.cards = nil
        end)
        local v_u_187 = v_u_17.all({ p_u_156:show_claim_button(false):andThen(function()
                if v_u_157 and v_u_157.Parent then
                    p_u_156:tap_to_speed_up()
                    v_u_7.FX:play("StickerPackOpen")
                    return v_u_17.all({ v_u_4.new(v_u_157.Container, TweenInfo.new(p_u_156.reveal_speed * 1.3), {
                            ["Position"] = UDim2.fromScale(0.5, -2.5)
                        }), v_u_34(v_u_157.Container.Frame) }):finally(function()
                        v_u_157:Destroy()
                        v_u_157 = nil
                    end)
                end
            end), v_u_17.delay(p_u_156.reveal_speed * 1.2):andThen(function()
                local v163 = p_u_156.reward_maid
                local v_u_164 = v_u_4.new(p_u_156.body, TweenInfo.new(p_u_156.reveal_speed * 0.7), {
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1)
                })
                v163:GiveTask(function()
                    v_u_164:cancel()
                end)
                local v165 = {}
                local v166 = TweenInfo.new(p_u_156.reveal_speed > 0 and 0.7 or 0.1)
                local v167 = #p_u_156.cards > 6 and 2 or 1
                local v168
                if v167 == 1 then
                    v168 = #p_u_156.cards
                else
                    local v169 = #p_u_156.cards / 2
                    v168 = math.ceil(v169)
                end
                local v170 = p_u_156.cards[1]:Clone()
                v170.Size = UDim2.new(v170.Size.X.Scale, v170.Size.X.Offset, v167 > 1 and 0.3 or 0.5, 0)
                v170.Visible = false
                v170.Parent = p_u_156.cards[1].Parent
                local v171 = v170.AbsoluteSize.X / p_u_156.body.AbsoluteSize.X
                v170:Destroy()
                v_u_7.FX:play("StickersFanOut")
                for v175, v173 in p_u_156.cards do
                    local v174 = v175 <= v168 and 1 or 2
                    if v174 ~= 1 then
                        local v175 = v175 - v168
                    end
                    local v176 = UDim2.fromScale(0.5, 0.5)
                    if v167 > 1 then
                        v176 = v176 + UDim2.fromScale(0, v174 == 1 and -0.2 or 0.2)
                    end
                    local v177 = v175 - (v168 + 1) / 2
                    local v178 = v176 + UDim2.new(v171 * v177, 12 * v177)
                    local v179 = v_u_4.new
                    local v180 = {
                        ["Position"] = v178,
                        ["Size"] = UDim2.new(v173.Size.X.Scale, v173.Size.X.Offset, v167 > 1 and 0.3 or 0.5, 0)
                    }
                    table.insert(v165, v179(v173, v166, v180))
                end
                return v_u_17.all(v165)
            end):andThen(function()
                return v_u_17.new(function(p181, _, p182)
                    task.wait(p_u_156.reveal_speed)
                    local v183 = false
                    for v184 = 1, #v_u_158 do
                        if p182() then
                            break
                        end
                        local v185 = p_u_156:reveal_card(v184)
                        if p_u_156.reveal_speed > 0 then
                            v_u_17.any({ v_u_17.fromEvent(p_u_156.insta_reveal_signal), v185 }):await()
                            if p_u_156.reveal_speed == 0 then
                                local _ = v184 - 1
                            end
                        elseif not v183 then
                            v_u_7.FX:play("StickerFlip1")
                            v183 = true
                        end
                    end
                    p181()
                end):andThen(function()
                    if v_u_19 then
                        return v_u_17.resolve()
                    else
                        return v_u_4.new(p_u_156.body, TweenInfo.new(p_u_156.reveal_speed == 0 and 0.1 or 0.7), {
                            ["Position"] = p_u_156.body_transform.position,
                            ["Size"] = p_u_156.body_transform.size
                        })
                    end
                end)
            end) }):andThen(function()
            p_u_156:show_claim_button(false, {
                ["full_screen"] = true
            })
            function p_u_156.claim_button_behavior()
                p_u_156:play_closing()
            end
            p_u_156:show_claim_button(true, {
                ["full_screen"] = v_u_19,
                ["instant"] = false,
                ["text"] = "Cool!"
            })
        end):catch(function(p186)
            warn("Something went wrong opening a sticker pack:", p186)
        end)
        p_u_156.reward_maid:GiveTask(function()
            v_u_187:cancel()
        end)
        return v_u_187
    end
end
function v24.reveal_pack(p_u_188)
    local v189 = #p_u_188.current_rewards
    local v190 = v189 > 6
    local v191 = UDim2.fromScale
    local v192
    if v190 then
        local v193 = v189 / 2
        v192 = math.ceil(v193) or v189
    else
        v192 = v189
    end
    local v194 = v191(1 / v192, 0.5)
    if v189 > 1 then
        v194 = v194 - UDim2.fromOffset(v189 * 12 / (v189 - (v190 and 2 or 1)), 0)
    end
    local v195 = p_u_188.pack_entry.foil
    if not v195 then
        if p_u_188.is_premium_pack then
            v195 = v_u_22.premium
        else
            v195 = v_u_22.standard
        end
    end
    local v_u_196 = p_u_188.pack:Clone()
    v_u_196.Container.Frame.Background.Image = p_u_188.card_back_image
    v_u_196.Container.Frame.Background.ImageTransparency = 1
    local v197 = v_u_196.Container.Frame.Foil
    local v198
    if v_u_19 then
        v198 = v195.mobile
    else
        v198 = v195.desktop
    end
    v197.Image = v198
    v_u_196.Container.Frame.Foil.ImageTransparency = 1
    v_u_196.Container.Visible = true
    v_u_196.Visible = true
    v_u_196.Size = v194
    v_u_196.Parent = p_u_188.body
    p_u_188.current_pack = v_u_196
    p_u_188.reward_maid:GiveTask(v_u_196)
    p_u_188.reward_maid:GiveTask(function()
        p_u_188.current_pack = nil
    end)
    v_u_7.FX:play("StickersFade")
    local v199 = v_u_3.get_setting_client({
        ["setting_id"] = "background_music_volume"
    })
    if v199 > 0 then
        local v_u_200 = v199 / 100
        local v201 = v_u_200
        local v202 = math.min(v201, 0.45)
        local v203 = p_u_188.reward_maid
        local v_u_205 = v_u_4.callback(v_u_200, v202, TweenInfo.new(1.1), function(p204)
            v_u_13.set_master_volume(p204)
        end)
        v203:GiveTask(function()
            v_u_205:cancel()
        end)
        p_u_188.reward_maid:GiveTask(function()
            v_u_13.set_master_volume(v_u_200)
            p_u_188.original_volume = nil
            p_u_188.faded_volume = nil
        end)
        p_u_188.original_volume = v_u_200
        p_u_188.faded_volume = v202
    end
    local v_u_210 = v_u_17.all({ v_u_4.new(p_u_188.background_fade, TweenInfo.new(p_u_188.reveal_speed * 2), {
            ["BackgroundTransparency"] = 0.5
        }), v_u_17.delay(0.55):andThen(function()
            local v206 = {}
            for _, v207 in v_u_196.Container.Frame:GetChildren() do
                local v208 = v_u_4.new
                local v209 = TweenInfo.new(p_u_188.reveal_speed * 1.05)
                table.insert(v206, v208(v207, v209, {
                    ["ImageTransparency"] = 0
                }))
            end
            return v_u_17.all(v206)
        end), v_u_17.delay(p_u_188.reveal_speed * 1):andThen(function()
            function p_u_188.claim_button_behavior()
                p_u_188:open_pack()
            end
            return p_u_188:show_claim_button(true, {
                ["instant"] = false,
                ["text"] = "Open"
            })
        end) })
    p_u_188.reward_maid:GiveTask(function()
        v_u_210:cancel()
    end)
    return v_u_210
end
function v24.show_rewards(p_u_211, p_u_212, p213)
    p_u_211.reveal_speed = 1
    p_u_211:tap_to_speed_up()
    p_u_211.reward_maid:DoCleaning()
    p_u_211.UIManager.set_app_visibility("StickerRewardsApp", true)
    p_u_211.is_premium_pack = p_u_212.rarity == "legendary"
    p_u_211.pack_entry = p_u_212
    local v214 = p_u_211.pack_entry.card_back
    if not v214 then
        if p_u_211.is_premium_pack then
            v214 = v_u_21.premium
        else
            v214 = v_u_21.standard
        end
    end
    local v215
    if v_u_19 then
        v215 = v214.mobile
    else
        v215 = v214.desktop
    end
    p_u_211.card_back_image = v215
    p_u_211.current_rewards = p213
    p_u_211.reward_maid:GiveTask(function()
        p_u_211.body.Size = p_u_211.body_transform.size
        p_u_211.body.Position = p_u_211.body_transform.position
        p_u_211.background_fade.BackgroundTransparency = 1
        p_u_211.is_premium_pack = nil
        p_u_211.current_rewards = nil
        p_u_211.card_back_image = nil
        p_u_211.pack_entry = nil
        v_u_38(p_u_212.kind)
        p_u_211.UIManager.set_app_visibility("StickerRewardsApp", false)
    end)
    p_u_211:play_shine()
    p_u_211:reveal_pack()
end
function v24.start(p_u_216)
    p_u_216.reward_maid = v_u_15.new()
    p_u_216.insta_reveal_signal = v_u_12.new()
    p_u_216.body = p_u_216.instance.Body
    p_u_216.body_transform = {
        ["size"] = p_u_216.body.Size,
        ["position"] = p_u_216.body.Position
    }
    p_u_216.background_fade = p_u_216.instance.BackgroundFade
    p_u_216.shine_container = p_u_216.instance.ShineContainer
    p_u_216.shine_container.Visible = false
    p_u_216.shine = p_u_216.shine_container.Shine
    p_u_216.shine.Parent = nil
    p_u_216.card = p_u_216.body.Card
    p_u_216.card.Parent = nil
    p_u_216.rainbow_background = p_u_216.card.Container.Frame.RainbowBackground
    p_u_216.rainbow_background.Parent = nil
    p_u_216.pack = p_u_216.body.Pack
    p_u_216.pack.Parent = nil
    local v217 = {
        ["mouse_button1_click"] = function()
            if p_u_216.claim_button_active and p_u_216.claim_button_behavior then
                p_u_216.claim_button_behavior()
            end
        end
    }
    p_u_216.claim_button = p_u_216.UIManager.wrap(p_u_216.instance.ClaimContainer.ClaimButton, "DepthButton")
    p_u_216.claim_button:start(v217)
    p_u_216.full_screen_claim_button = p_u_216.UIManager.wrap(p_u_216.instance.ScreenButton, "CustomButton")
    p_u_216.full_screen_claim_button:start(v217)
    p_u_216.full_screen_claim_button.instance.Visible = false
    v_u_8.quick_watch({
        ["selection_parent"] = p_u_216.instance,
        ["default_selection"] = p_u_216.instance.ClaimContainer.ClaimButton,
        ["app_name"] = p_u_216.ClassName,
        ["close_override"] = function()
            return false
        end
    })
    p_u_216:show_claim_button(false, {
        ["instant"] = true
    })
end
return v24