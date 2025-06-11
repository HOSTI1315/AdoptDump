--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.JackboxRewardApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("InventoryDB")
local v3 = v_u_1("Class")
local v_u_4 = v_u_1("SoundPlayer")
local v_u_5 = v_u_1("XboxSupport")
local v_u_6 = v_u_1("RarityDB")
local v_u_7 = v_u_1("Maid")
local v_u_8 = v_u_1("DownloadClient")
local v_u_9 = v_u_1("ViewportModelFitter")
local v_u_10 = v_u_1("PetAccessoryEquipHelper")
local v_u_11 = v_u_1("package:Promise")
local v_u_12 = game:GetService("RunService")
local v_u_13 = game:GetService("TweenService")
local v_u_14 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v15 = v3("JackboxRewardApp", v_u_1("UIBaseApp"))
function v15.show(p16)
    p16.body.Visible = true
end
function v15.hide(p17)
    p17.body.Visible = false
end
function v15.play_cloud_burst_animation(p18, p19)
    local v20 = p18.body.Clouds:GetChildren()
    local v_u_21 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    v_u_21.DisplayOrder = -10
    local v22 = Random.new()
    for _ = 1, v22:NextInteger(15, 20) do
        local v_u_23 = v20[v22:NextInteger(1, #v20)]:Clone()
        v_u_23.Parent = v_u_21
        v_u_23.ImageTransparency = 0
        v_u_23.Visible = true
        v_u_23.Position = UDim2.new(0, p19.AbsolutePosition.X + p19.AbsoluteSize.X / 2, 0, p19.AbsolutePosition.Y + p19.AbsoluteSize.Y / 2)
        local v24 = v22:NextNumber(0, 360)
        local v25 = math.rad(v24)
        local v26 = math.cos(v25)
        local v27 = math.sin(v25)
        v_u_23.Position = v_u_23.Position + UDim2.new(0, v26 * p19.AbsoluteSize.X / 2, 0, v27 * p19.AbsoluteSize.Y / 2)
        local v28 = {
            ["goals"] = {
                ["Position"] = v_u_23.Position + UDim2.new(0, v26 * 250, 0, v27 * 250),
                ["Rotation"] = v22:NextInteger(1, 360),
                ["Size"] = UDim2.new(0, 1, 0, 1)
            },
            ["info"] = {
                ["time"] = 2,
                ["style"] = Enum.EasingStyle.Quint,
                ["direction"] = Enum.EasingDirection.Out
            }
        }
        local v29 = v_u_13:Create(v_u_23, TweenInfo.new(v28.info.time, v28.info.style, v28.info.direction), v28.goals)
        v29.Completed:Connect(function()
            v_u_23:Destroy()
        end)
        v29:Play()
    end
    delay(2, function()
        v_u_21:Destroy()
    end)
end
function v15.reveal_frame(p_u_30, p31, p32, p33, p34)
    local v_u_35 = v_u_1("PetEntityManager")
    local v_u_36 = v_u_1("PetEntityHelper")
    local v_u_37 = v_u_1("PetPerformanceName")
    local v_u_38 = p31:FindFirstChild("Prize")
    local v_u_39 = v_u_2[p33][p32]
    local v40 = v_u_38.ItemNameLabel
    v_u_38.Visible = true
    p_u_30:play_cloud_burst_animation(v_u_38)
    local v41 = v_u_39.rarity
    local v42 = v_u_6[v41].name
    local v43 = v_u_6[v41].color
    v_u_38.RarityTag.ContentsCenter.ImageColor3 = v43
    v_u_38.RarityTag.ContentsCenter.ContentsLeftTear.ImageColor3 = v43
    v_u_38.RarityTag.ContentsCenter.ContentsRightTear.ImageColor3 = v43
    v_u_38.RarityTag.TextLabel.Text = v42
    if p34 and p33 == "pets" then
        v_u_38.ImageLabel.Image = ""
        local v_u_44 = v_u_38.ViewportFrame
        if v_u_44.CurrentCamera then
            v_u_44.CurrentCamera:Destroy()
        end
        p_u_30.reveal_maid:DoCleaning()
        v_u_44:ClearAllChildren()
        local v_u_75 = v_u_11.new(function(p45, p46, p47)
            local v48
            if v_u_39.unreleased or v_u_39.permanently_delete_all_copies_of_this_item_from_the_game then
                v48 = nil
            else
                v48 = v_u_8.promise_download_copy("Pets", v_u_39.kind):expect()
            end
            if p47() and v48 then
                v48:Destroy()
                return
            elseif v48 then
                p45(v48)
            else
                p46("Could not find pet model")
            end
        end):andThen(function(p_u_49)
            return v_u_11.new(function(p50, p51, p52)
                local v53 = Instance.new("WorldModel")
                v53.Parent = v_u_44
                p_u_49:SetPrimaryPartCFrame(CFrame.new())
                p_u_49.Parent = v53
                local v_u_54 = v_u_35.create_pet_entity(p_u_49, v_u_39)
                local function v55()
                    if v_u_54 then
                        v_u_35.remove_pet_entity_by_entity(v_u_54)
                    end
                    p_u_49:Destroy()
                end
                if p52() then
                    if v_u_54 then
                        v_u_35.remove_pet_entity_by_entity(v_u_54)
                    end
                    p_u_49:Destroy()
                    return
                else
                    p_u_30.reveal_maid:GiveTask(v55)
                    if v_u_54 then
                        p50(v_u_54)
                    else
                        p51("Could not create pet entity")
                    end
                end
            end)
        end):andThen(function(p_u_56)
            local v_u_57 = Instance.new("Camera")
            v_u_44.CurrentCamera = v_u_57
            v_u_57.FieldOfView = 30
            v_u_57.Parent = v_u_44
            local v58 = v_u_36.stage_performance
            local v59 = {
                ["name"] = v_u_37.AnimationProvider,
                ["options"] = {
                    ["anim_name"] = v_u_39.anims.idle
                }
            }
            v58(p_u_56, v59)
            if v_u_39.pre_equipped_removable_accessories then
                for _, v60 in v_u_39.pre_equipped_removable_accessories do
                    local v_u_61 = v_u_2.pet_accessories[v60]
                    local v_u_63 = v_u_8.promise_download_copy("PetAvatarResources", v_u_61.model_handle):andThen(function(p62)
                        v_u_10.equip_accessory({
                            ["pet_model"] = p_u_56.base.pet_model,
                            ["accessory_base_asset"] = p62,
                            ["accessory_item_entry"] = v_u_61,
                            ["play_poof_effect"] = false
                        })
                    end)
                    p_u_30.reveal_maid:GiveTask(function()
                        v_u_63:cancel()
                    end)
                end
            end
            local v64 = v_u_9.new(v_u_44, v_u_57, p_u_56.base.pet_model)
            local v65 = p_u_56.base.pet_model:GetBoundingBox()
            local v_u_66 = p_u_56.base.pet_model.HumanoidRootPart:FindFirstChildWhichIsA("Motor6D")
            local v_u_67 = 180
            local v_u_68 = CFrame.new()
            local v_u_69 = CFrame.new()
            local v_u_70 = v_u_66.Part1.CFrame:Inverse() * v65
            local v_u_71 = v64:get_fit_distance()
            p_u_30.reveal_maid:GiveTask(v_u_12.Stepped:Connect(function(_, p72)
                local v73 = v_u_67
                local v74 = 30 * p72
                v_u_67 = v73 + math.rad(v74)
                v_u_68 = v_u_66.Part1.CFrame * v_u_70
                v_u_69 = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, v_u_67, 0)
                v_u_57.CFrame = CFrame.new(v_u_68.Position) * v_u_69 * CFrame.new(0, 0, v_u_71)
                v_u_44.LightDirection = -v_u_69.ZVector
            end))
            p_u_30.reveal_maid:GiveTask(function()
                v_u_36.end_performance(p_u_56, v_u_37.AnimationProvider)
            end)
            p_u_30.reveal_maid:GiveTask(v_u_57)
        end):catch(function(_)
            v_u_44:ClearAllChildren()
            v_u_38.ImageLabel.Image = v_u_39.image
        end)
        p_u_30.reveal_maid:GiveTask(function()
            v_u_75:cancel()
        end)
    else
        v_u_38.ImageLabel.Image = v_u_39.image
    end
    local v76 = v_u_39.name
    local v77 = v_u_14.LocaleId
    local v78
    if string.sub(v77, 1, 3) == "en-" then
        v78 = v76:upper()
    else
        v78 = v_u_14:Translate(workspace, v76)
    end
    v40.Text = v78
    local v79 = {
        ["time"] = 0.5,
        ["style"] = Enum.EasingStyle.Quint,
        ["direction"] = Enum.EasingDirection.Out
    }
    v_u_38.ImageTransparency = 1
    v_u_38.ImageLabel.ImageTransparency = 1
    v_u_38.ItemNameLabel.TextTransparency = 1
    v_u_38.ViewportFrame.ImageTransparency = 1
    local v80 = {
        ["goals"] = {
            ["ImageTransparency"] = 0
        },
        ["info"] = v79
    }
    v_u_13:Create(v_u_38, TweenInfo.new(v80.info.time, v80.info.style, v80.info.direction), v80.goals):Play()
    local v81 = {
        ["goals"] = {
            ["ImageTransparency"] = 0
        },
        ["info"] = v79
    }
    v_u_13:Create(v_u_38.ImageLabel, TweenInfo.new(v81.info.time, v81.info.style, v81.info.direction), v81.goals):Play()
    local v82 = {
        ["goals"] = {
            ["TextTransparency"] = 0
        },
        ["info"] = v79
    }
    v_u_13:Create(v_u_38.ItemNameLabel, TweenInfo.new(v82.info.time, v82.info.style, v82.info.direction), v82.goals):Play()
    local v83 = {
        ["goals"] = {
            ["ImageTransparency"] = 0
        },
        ["info"] = v79
    }
    v_u_13:Create(v_u_38.ViewportFrame, TweenInfo.new(v83.info.time, v83.info.style, v83.info.direction), v83.goals):Play()
    v_u_38.Visible = true
    if p34 then
        v_u_4.FX:play("GoldSparklePrize")
    else
        v_u_4.FX:play("PopShort")
    end
end
function v15.tween_confetti(p84)
    for v85, v86 in pairs(p84.initial_confetti_placements) do
        local v87 = {
            ["goals"] = {
                ["Position"] = v86,
                ["ImageTransparency"] = 0
            },
            ["info"] = {
                ["time"] = 0.3,
                ["style"] = Enum.EasingStyle.Back,
                ["direction"] = Enum.EasingDirection.Out
            }
        }
        v_u_13:Create(v85, TweenInfo.new(v87.info.time, v87.info.style, v87.info.direction), v87.goals):Play()
    end
end
function v15.store_initial_confetti_positions(p88)
    p88.initial_confetti_placements = {}
    for _, v89 in pairs(p88.body.Confetti:GetChildren()) do
        p88.initial_confetti_placements[v89] = v89.Position
    end
end
function v15.start_pinstripe_spin(p_u_90)
    p_u_90.pinstripe_spin_connection = v_u_12.Heartbeat:Connect(function()
        p_u_90.body.RadialPinstripe.Rotation = p_u_90.body.RadialPinstripe.Rotation + 0.5
    end)
end
function v15.stop_pinstripe_spin(p91)
    if p91.pinstripe_spin_connection then
        p91.pinstripe_spin_connection:Disconnect()
        p91.pinstripe_spin_connection = nil
    end
end
function v15.clean_up(p92)
    for _, v93 in pairs(p92.body.Confetti:GetChildren()) do
        v93.ImageTransparency = 1
        v93.Position = UDim2.new()
    end
    for _, v94 in p92.body.Prizes:GetChildren() do
        if v94:IsA("Frame") then
            v94:Destroy()
        end
    end
    p92.reveal_maid:DoCleaning()
    p92:stop_pinstripe_spin()
end
function v15.show_rewards(p_u_95, p_u_96)
    v_u_1("UIManager").set_app_visibility("JackboxRewardApp", true)
    p_u_95:clean_up()
    p_u_95:tween_confetti()
    p_u_95:start_pinstripe_spin()
    v_u_11.new(function()
        for v_u_97, v_u_98 in p_u_96 do
            local v_u_99 = p_u_95.body.PrizeTemplates:FindFirstChild("Prize" .. v_u_97):Clone()
            v_u_99.Visible = true
            v_u_99:FindFirstChild("Prize").Visible = false
            v_u_99.Parent = p_u_95.body.Prizes
            v_u_11.delay(v_u_97 * 0.3):andThen(function()
                p_u_95:reveal_frame(v_u_99, v_u_98.kind, v_u_98.category, v_u_97 == 3)
            end)
        end
    end)
end
function v15.start(p_u_100)
    p_u_100.reveal_maid = v_u_7.new()
    p_u_100.body = p_u_100.instance.Body
    p_u_100.initial_confetti_placements = {}
    p_u_100:store_initial_confetti_positions()
    p_u_100.UIManager.wrap(p_u_100.body.ClaimButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_100:clean_up()
            p_u_100.UIManager.set_app_visibility(p_u_100.ClassName, false)
        end
    })
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_100.body,
        ["default_selection"] = p_u_100.body.ClaimButton,
        ["app_name"] = p_u_100.ClassName
    })
end
return v15