--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.InteriorBehaviors (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = require(v1.SharedModules.Curves.BezierCurve)
local v_u_4 = require(v1.SharedModules.GameplayFX)
local v_u_5 = require(v1.SharedModules.Maid)
local v_u_6 = require(v1.SharedModules.TweenPromise)
local v_u_7 = require(v1.SharedPackages.Promise)
local v_u_8 = require(v1.SharedPackages.Sift)
local v_u_9 = require(v1.new.modules.InteriorHelpers.RoamingPetAdoptionClient)
local v_u_10 = require(game.ReplicatedStorage.Fsys).load
local v_u_11 = v_u_10("InteractionsEngine")
local v_u_12 = v_u_10("TranslationHelper")
local v_u_13 = v_u_10("SharedConstants")
local v14 = v_u_10("TimeZoneHelper")
local v_u_15 = v_u_10("LiveOpsTime")
local v_u_16 = v_u_10("UIManager")
local v_u_17 = v_u_10("DownloadClient")
local v_u_18 = v_u_10("KindDB")
local v_u_19 = v_u_10("ToolHandleHelper")
local _ = v14.from_region_datetime("PT", 2025, 6, 20, 8).UnixTimestamp
local function v_u_23(p20, p21, p22)
    if p22 then
        p20 = 1 - p20
    end
    return v_u_2:GetValue(p20, p21.EasingStyle, p21.EasingDirection)
end
local function v_u_29(p_u_24, p_u_25, p_u_26)
    local v27 = TweenInfo.new(p_u_24.Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, p_u_24.RepeatCount, p_u_24.Reverses, p_u_24.DelayTime)
    return v_u_6.callback(0, 1, v27, function(p28)
        p_u_25(v_u_23(p28, p_u_24, p_u_26))
    end):doneCall(p_u_25, v_u_23(1, p_u_24, p_u_26))
end
local function v_u_62(p30, p_u_31)
    local v32 = v_u_5.new()
    local v_u_33 = p30:Clone()
    v_u_33.Parent = workspace
    local v_u_34 = v_u_33.RainbowBezier
    local v_u_35 = v_u_33.Clouds
    local v_u_36 = v_u_33.Sun
    local v_u_43 = v_u_3.new(v_u_8.Array.map(v_u_8.Array.sort(v_u_34.Points:GetChildren(), function(p37, p38)
        local v39 = p37.Name
        local v40 = tonumber(v39)
        local v41 = p38.Name
        return v40 < tonumber(v41)
    end), function(p42)
        return p42.CFrame
    end))
    v_u_34.Parent = nil
    v32:GiveTask(v_u_34)
    v32:GiveTask(v_u_33)
    v32:GiveTask(v_u_43)
    local v44 = v_u_7.all
    local v45 = {}
    local v46 = p_u_31 and 0.2999999999999998 or 0
    local v47
    if v46 <= 0 then
        v47 = v_u_7.resolve()
    else
        v47 = v_u_7.delay(v46)
    end
    local v50 = v47:done(function()
        return v_u_7.all(v_u_8.Array.map(v_u_35:GetChildren(), function(p_u_48)
            return v_u_29(TweenInfo.new(2.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), function(p49)
                p_u_48:ScaleTo(0.001 + 0.999 * p49)
            end, p_u_31)
        end))
    end)
    local v51 = p_u_31 and 0.2999999999999998 or 0
    local v52
    if v51 <= 0 then
        v52 = v_u_7.resolve()
    else
        v52 = v_u_7.delay(v51)
    end
    local v54 = v52:done(function()
        return v_u_29(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), function(p53)
            v_u_36:ScaleTo(0.001 + 0.999 * p53)
        end, p_u_31)
    end)
    local v55 = p_u_31 and 0 or 0.9999999999999998
    local v56
    if v55 <= 0 then
        v56 = v_u_7.resolve()
    else
        v56 = v_u_7.delay(v55)
    end
    __set_list(v45, 1, {v50, v54, v56:done(function()
    local v_u_57 = v_u_34.RainbowEnd
    v_u_34.Parent = v_u_33
    v_u_57.Sparkles.Enabled = true
    v_u_57.Sparkles:Emit(20)
    return v_u_29(TweenInfo.new(1.8, Enum.EasingStyle.Linear, Enum.EasingDirection.In), function(p58)
        if v_u_43 then
            local v59 = v_u_2:GetValue(p58, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
            local v60 = v_u_2:GetValue(p58, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
            v_u_57.Rainbow.CurveSize0 = 20 * v59
            v_u_57.Water.CurveSize0 = 20 * v59
            v_u_57.Rainbow.CurveSize1 = 20 * v60
            v_u_57.Water.CurveSize1 = 20 * v60
            local v61 = v_u_2:GetValue(p58, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
            v_u_57.Rainbow.Width0 = 4 * v61
            v_u_57.Water.Width0 = 5 * v61
            v_u_57.CFrame = v_u_43:get_value(p58)
        end
    end, p_u_31):andThen(function()
        v_u_57.Sparkles.Enabled = false
    end)
end)})
    return v44(v45), v32
end
local v112 = {
    ["Butterfly2025Sanctuary"] = {
        ["render"] = function(p_u_63, p64)
            local v_u_65 = v_u_5.new()
            p64.butterfly_2025_maid = v_u_65
            local v66 = v_u_10("LootboxRewardsDisplay")
            local v67 = {
                ["use_explicit_pet_names"] = true,
                ["public_lootbox_rewards_options"] = {
                    ["decimal_places"] = 1
                }
            }
            v66.render(p_u_63, v67)
            v_u_65:GiveTask(v66.cleanup)
            local v68 = p_u_63.SwarmAreas.NormalButterflies:GetChildren()
            local v69 = {
                "We make up our own Rainbow, too!",
                "Another year spent uplifting!",
                "Butterfly, fly away!",
                "Mmm, that sweet sweet $FOOD!",
                "Nothing beats a little nectar in the morning.",
                "I was a caterpillar, then I transformed!"
            }
            local v70 = {
                ["pets_to_spawn"] = {
                    ["butterfly_2025_blue_butterfly"] = 3,
                    ["butterfly_2025_amber_butterfly"] = 2,
                    ["butterfly_2025_seafoam_butterfly"] = 1
                },
                ["exchange_kind"] = "butterfly_2025_bluebell_flower",
                ["capture_barks"] = v69,
                ["swarm_locations"] = v68
            }
            v_u_65:GiveTask(v_u_9.register_swarm(p_u_63, v70))
            local v71 = {
                ["pets_to_spawn"] = {
                    ["butterfly_2025_vermilion_butterfly"] = 3,
                    ["butterfly_2025_violet_butterfly"] = 2,
                    ["butterfly_2025_orchid_butterfly"] = 1
                },
                ["exchange_kind"] = "butterfly_2025_goldenrod_flower",
                ["capture_barks"] = v69,
                ["swarm_locations"] = v68
            }
            v_u_65:GiveTask(v_u_9.register_swarm(p_u_63, v71))
            local v_u_72 = false
            local v_u_73 = p_u_63.Programmed.SpecialPedestal
            local v74 = v_u_73.InteractionPart
            local v_u_75 = p_u_63.Programmed.PedestalRaisedPosition.Position
            local v_u_76 = p_u_63.Programmed.PedestalLoweredPosition.Position
            local v_u_77 = false
            v_u_11:register({
                ["text"] = "Place Bait",
                ["part"] = v74,
                ["is_visible"] = function()
                    if v_u_9.can_use_treat("butterfly_2025_snapdragon_flower") then
                        return v_u_72
                    else
                        return false
                    end
                end,
                ["on_selected"] = function()
                    if v_u_72 then
                        if v_u_9.can_use_treat("butterfly_2025_snapdragon_flower") then
                            if not v_u_77 then
                                if v_u_16.apps.DialogApp:dialog({
                                    ["text"] = "Put the Snapdragon Flower out for a chance to adopt the Prismatic Butterfly?",
                                    ["left"] = "No",
                                    ["right"] = "Yes"
                                }) ~= "Yes" then
                                    return
                                end
                                v_u_77 = true
                            end
                            local v79 = v_u_16.apps.BackpackApp:pick_item({
                                ["visible_backpack_categories"] = { "food" },
                                ["allow_callback"] = function(p78)
                                    return p78.kind == "butterfly_2025_snapdragon_flower"
                                end
                            })
                            if v79 then
                                local v80 = v_u_18[v79.kind]
                                local v_u_81 = v_u_17.promise_download_copy("Holdables", v80.model_handle):expect()
                                for _, v82 in v_u_81:GetDescendants() do
                                    if v82:IsA("BasePart") then
                                        v82.Anchored = true
                                        v82.CanCollide = false
                                    end
                                end
                                local v83 = v_u_19.get_largest_part(v_u_81:GetDescendants())
                                v_u_81.PrimaryPart = v83
                                v83.Anchored = true
                                v_u_81:PivotTo(v_u_73:GetPivot())
                                v_u_81.Parent = v_u_73
                                v_u_9.exchange_item_promise(v_u_81, v80, v79.unique):done(function()
                                    v_u_81:Destroy()
                                end)
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                end
            })
            local v_u_84 = p_u_63.RainbowSun
            local v_u_85 = p_u_63.CrescentMoon
            v_u_84.Parent = nil
            v_u_85.Parent = nil
            v_u_65:GiveTask(function()
                v_u_84.Parent = p_u_63
                v_u_85.Parent = p_u_63
            end)
            local function v_u_96(p86)
                local v_u_87 = v_u_15.get_is_day()
                v_u_65.rainbow_maid = nil
                local v88, v_u_89 = v_u_62(v_u_84, not v_u_87)
                v_u_65.animation_promise = v88:done(function()
                    if v_u_87 then
                        v_u_65.rainbow_maid = v_u_89
                    else
                        v_u_89:Destroy()
                    end
                end)
                v_u_65.pedestal_promise = v_u_29(TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), function(p90)
                    v_u_73:PivotTo(CFrame.new(v_u_76:Lerp(v_u_75, p90)))
                end, not v_u_87):done(function()
                    v_u_72 = v_u_87
                end)
                if p86 then
                    v_u_65.animation_promise = nil
                    v_u_65.pedestal_promise = nil
                end
                if v_u_87 then
                    local v91 = v_u_9.register_swarm
                    local v92 = p_u_63
                    local v93 = {
                        ["pets_to_spawn"] = {
                            ["butterfly_2025_prismatic_butterfly"] = 6
                        },
                        ["exchange_kind"] = "butterfly_2025_snapdragon_flower",
                        ["capture_barks"] = { "Look at my colors!", "My wings, a mosaic. ", "Without rain, there\'s no rainbow!" },
                        ["swarm_locations"] = p_u_63.SwarmAreas.SpecialButterflies:GetChildren()
                    }
                    local v_u_94 = v91(v92, v93)
                    function v_u_65.prismatic_swarm()
                        v_u_94.debounce_promise:finally(function()
                            if p_u_63.Parent then
                                for v95 in v_u_94.pet_swarms_by_entity do
                                    v_u_4.emit_poof(v95.base.root.Position, 5)
                                end
                            end
                            v_u_94:destroy()
                        end)
                    end
                else
                    v_u_65.prismatic_swarm = nil
                end
            end
            v_u_96(true)
            v_u_65:GiveTask(v_u_7.new(function(_, _, p97)
                while not p97() do
                    v_u_15.delay_until(v_u_15.get_next_time_change_timestamp()):expect()
                    v_u_96()
                end
            end))
        end,
        ["cleanup"] = function(_, p98)
            p98.butterfly_2025_maid:DoCleaning()
        end
    },
    ["MainMap"] = {
        ["interactions"] = function(p99, _)
            return { v_u_11:register({
                    ["text"] = function()
                        local v100 = {
                            ["display_mode"] = "buy_with_icon",
                            ["item_row_text"] = v_u_12.format_by_key("ui.buy_label_item", {
                                ["item"] = "Snapdragon Blossom"
                            }),
                            ["item_cost"] = 25,
                            ["icon"] = v_u_13.social_stones.image
                        }
                        return v100
                    end,
                    ["on_selected"] = function()
                        local v101 = v_u_10("InventoryDB").food.butterfly_2025_snapdragon_flower
                        string.format("ui.buy_label_item_question_with_alt_currency [%s] [%d] [%s]", v101.name, 25, v_u_13.social_stones.human_readable)
                        local v102 = v_u_10("ClientData")
                        local v103 = v_u_10("UIManager")
                        local v104 = v102.get("social_stones_2025") or 0
                        local v105 = v103.apps.DialogApp
                        local v106 = {
                            ["dialog_type"] = "CountDialog",
                            ["min"] = 1
                        }
                        local v107 = v104 / 25
                        local v108 = math.floor(v107)
                        local v109 = v_u_13.bulk_purchase_limit
                        v106.max = math.clamp(v108, 1, v109)
                        v106.text = ("Buy %* for %* Social Stones each?"):format(v101.name, 25)
                        function v106.right(p110)
                            return ("Buy (%* Social Stones)"):format(p110 * 25)
                        end
                        local v111 = v105:dialog(v106)
                        if v111 and v111 ~= 0 then
                            if 25 * v111 <= v104 then
                                v_u_10("RouterClient").get("SocialStonesAPI/AttemptExchange"):FireServer("food", "butterfly_2025_snapdragon_flower", v111)
                            else
                                v103.apps.DialogApp:dialog({
                                    ["text"] = "You can\'t afford this.",
                                    ["button"] = "Okay"
                                })
                            end
                        else
                            return
                        end
                    end,
                    ["is_visible"] = function()
                        return true
                    end,
                    ["part"] = p99:FindFirstChild("Event"):FindFirstChild("Butterfly2025"):FindFirstChild("SnapDragonStand"):FindFirstChild("Interact")
                }) }
        end,
        ["render"] = function(_, _) end,
        ["cleanup"] = function(_, _) end
    }
}
return v112