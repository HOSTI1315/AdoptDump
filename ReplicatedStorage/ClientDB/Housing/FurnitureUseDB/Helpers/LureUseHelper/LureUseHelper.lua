--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.LureUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("InventoryDB")
local v_u_3 = v_u_1("LiveOpsTime")
local v_u_4 = v_u_1("Utilities")
local v_u_5 = v_u_1("package:Sift")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = game:GetService("Players")
return {
    ["LURE"] = function(p_u_8, p_u_9)
        local v10 = p_u_8 == "BasicLure" and true or p_u_8 == "PremiumLure"
        local v11 = "Invalid lure type: " .. p_u_8
        assert(v10, v11)
        local function v_u_19(p12, p13, p14)
            local v_u_15 = game.ReplicatedStorage.Resources:FindFirstChild(p14 or "Lures2023BasicRevealEffect"):Clone()
            v_u_15:PivotTo(p12:GetPivot())
            v_u_15.Parent = p12
            local v16 = 0
            for _, v17 in v_u_15:GetChildren() do
                if v17:IsA("ParticleEmitter") then
                    v17:Emit(p13 or 10)
                    local v18 = v17.Lifetime.Max
                    v16 = math.max(v16, v18)
                end
            end
            task.delay(v16, function()
                v_u_15:Destroy()
            end)
        end
        local function v_u_33(p20, p21, p22)
            local v23 = v_u_1("ResizeM")
            local v24 = p20.DisplayBlock
            local v25, _ = v_u_4.getAlignedBoundingBox(p21, CFrame.identity)
            local v26 = p21.PrimaryPart
            p21.PrimaryPart = nil
            p21.WorldPivot = v25
            p21:PivotTo(v24.CFrame)
            if p22 ~= "pet_accessories" and p22 ~= "stickers" then
                v26:Destroy()
            end
            local v27, v28 = v_u_4.getAlignedBoundingBox(p21, v24.CFrame)
            p21.WorldPivot = v27
            p21:PivotTo(v24.CFrame * CFrame.new(0, -v24.Size.Y / 2 + v28.Y / 2, 0))
            local v29 = 4.5 / v28.x
            local v30 = 4.5 / v28.y
            local v31 = 4.5 / v28.z
            local v32 = math.min(1, v29, v30, v31)
            if v32 < 1 then
                v23.scale(p21, v32, p21:GetPivot().Position)
            end
        end
        return {
            ["init"] = function(p_u_34, p_u_35, p36, p37)
                local v38 = v_u_1("DataM")
                if p37 then
                    local v39 = v38.get_store(p37)
                    local v_u_40 = v39:get("lures_2023_lure_manager")
                    local v41 = v39:get_on_key_changed_event("lures_2023_lure_manager")
                    local function v45()
                        local v42 = v_u_40:get_active_lure_from_type(p_u_8)
                        local v43 = p_u_34
                        local v44
                        if v42 then
                            v44 = v_u_5.Dictionary.copyDeep(v42)
                        else
                            v44 = nil
                        end
                        v43.lure = v44
                        p_u_35()
                    end
                    local v46 = v_u_40:get_active_lure_from_type(p_u_8)
                    local v47
                    if v46 then
                        v47 = v_u_5.Dictionary.copyDeep(v46)
                    else
                        v47 = nil
                    end
                    p_u_34.lure = v47
                    p36.furniture = p_u_34
                    p36.house_owner_store = v39
                    p36.lure_manager_changed_conn = v41:Connect(v45)
                end
            end,
            ["server_furniture_deactivated"] = function(p48)
                if p48.lure_manager_changed_conn then
                    p48.lure_manager_changed_conn:Disconnect()
                end
            end,
            ["use_text"] = function(p49)
                return p49.lure and (p49.lure.finished and "Collect Reward" or "") or "Place Bait"
            end,
            ["on_interaction_shown"] = function(p_u_50, p51)
                if p_u_50.lure then
                    if not p_u_50.lure.finished then
                        local v_u_52 = v_u_1("ColorThemeManager")
                        local v_u_53 = game.ReplicatedStorage.Resources.InteractionsUIFragments.LuresTimerFragment:Clone()
                        local v54 = p_u_50.lure.bait_kind
                        local v_u_55 = v_u_2.food[v54].lure_time
                        v_u_53.Parent = p51.Message.FragmentHolder
                        task.spawn(function()
                            while v_u_53.Parent do
                                local v56 = p_u_50.lure.lure_start_timestamp + v_u_55 - v_u_3.now()
                                if v56 <= 0 then
                                    v_u_53:Destroy()
                                    return
                                end
                                local v57 = v56 / 3600
                                local v58 = math.floor(v57)
                                local v59 = v56 % 3600 / 60
                                local v60 = math.floor(v59)
                                local v61 = v56 % 60
                                local v62 = math.floor(v61)
                                local v63 = string.format("%02d:%02d:%02d", v58, v60, v62)
                                v_u_53.Container.Contents.Timer.Text = v63
                                local v64 = v_u_52.lookup("saturated")
                                v_u_53.Container.Contents.BackgroundColor3 = v64
                                task.wait(1)
                            end
                        end)
                    end
                else
                    return
                end
            end,
            ["client_get_data_for_server_use"] = function(p65, _, _, p66, _)
                local v67 = v_u_1("UIManager")
                if v_u_7.LocalPlayer == p66 then
                    if p65.lure then
                        if not p65.lure.finished then
                            v67.apps.HintApp:hint({
                                ["text"] = "Check back when the timer has finished!",
                                ["length"] = 4
                            })
                        end
                        return false
                    else
                        local v68 = v_u_1("ClientToolManager").get_equipped_by_category("food")[1]
                        local v69
                        if v68 then
                            v69 = v_u_2[v68.category][v68.kind]
                        else
                            v69 = v68
                        end
                        if v69 and v69.is_lure_bait then
                            return {
                                ["bait_unique"] = v68.unique
                            }
                        else
                            local v72 = {
                                ["picking_source"] = "lures_bait_pick",
                                ["visible_backpack_categories"] = { "food" },
                                ["allow_callback"] = function(p70)
                                    if p70.category == nil or p70.kind == nil then
                                        return false
                                    else
                                        local v71 = v_u_2[p70.category][p70.kind]
                                        if v71 then
                                            return v71.is_lure_bait == true
                                        else
                                            return false
                                        end
                                    end
                                end
                            }
                            local v73 = v67.apps.BackpackApp:pick_item(v72)
                            if v73 then
                                local v74 = v_u_2[v73.category][v73.kind]
                                if v67.apps.DialogApp:dialog({
                                    ["text"] = ("Are you sure you want to use %*?"):format(v74.name),
                                    ["left"] = "No",
                                    ["right"] = "Yes"
                                }) == "Yes" then
                                    return {
                                        ["bait_unique"] = v73.unique
                                    }
                                end
                            end
                        end
                    end
                else
                    v67.apps.HintApp:hint({
                        ["text"] = "This isn\'t your Lure!",
                        ["length"] = 4
                    })
                    return false
                end
            end,
            ["dont_automatically_mark_furniture_change_after_use"] = true,
            ["use_permissions"] = "HOUSE_OWNER",
            ["server_use"] = function(p75, p76, _, p77, p78)
                local v79 = v_u_1("DataM")
                if p78 == p75 then
                    local v80 = v79.get_store(p78)
                    local v81 = v80:get("lures_2023_lure_manager")
                    if p76.lure and p76.lure.finished then
                        v81:claim_lure_reward(p_u_8)
                    elseif p77 then
                        local v82 = p77.bait_unique
                        if not v82 then
                            return
                        end
                        local v83 = v80:get("inventory"):get_item(v82)
                        if not v83 then
                            return
                        end
                        v81:bait_lure(p_u_8, p76.id, v83)
                    end
                else
                    return
                end
            end,
            ["render"] = function(p84, p_u_85, _, _, _)
                local v86 = v_u_1("ItemModelHelper")
                if p84.lure ~= nil then
                    local v87 = p84.lure
                    local _ = v_u_2.food[v87.bait_kind]
                    if not v87.finished then
                        v86.promise_download_item_model(v87.bait_kind):andThen(function(p88)
                            v_u_33(p_u_85, p88, "food")
                            p88.Parent = p_u_85
                        end)
                        return
                    end
                    local v_u_89 = v87.reward
                    if v_u_89.category == "currency" and v_u_89.kind == "money" then
                        local v90 = game.ReplicatedStorage.Resources:FindFirstChild("Lures2023BucksBow"):Clone()
                        v_u_33(p_u_85, v90, "currency")
                        v90.Parent = p_u_85
                        return
                    end
                    if v_u_89.category == "stickers" then
                        local v91 = game.ReplicatedStorage.Resources:FindFirstChild("Lures2023Sticker"):Clone()
                        v_u_33(p_u_85, v91, "stickers")
                        v91.Parent = p_u_85
                        return
                    end
                    if v_u_89.category == "pets" then
                        p_u_9(p_u_85)
                        return
                    end
                    local _ = v_u_2[v_u_89.category][v_u_89.kind]
                    v86.promise_download_item_model(v_u_89.kind):andThen(function(p92)
                        v_u_33(p_u_85, p92, v_u_89.category)
                        p92.Parent = p_u_85
                    end)
                    local v93 = game.ReplicatedStorage.Resources:FindFirstChild("Lures2023GoldAura"):Clone()
                    v93:PivotTo(p_u_85.VFXPosition:GetPivot())
                    v93.Parent = p_u_85
                end
            end,
            ["post_render"] = function(p94, p95, _, p96, p97)
                local v_u_98 = v_u_1("SoundPlayer")
                local v_u_99 = v_u_1("Music")
                local v_u_100 = v_u_1("SoundDB")
                if p96 then
                    p96 = p96.lure
                end
                local v101 = p94.lure
                if p96 or not v101 then
                    if p96 and (v101 and (not p96.finished and v101.finished)) then
                        v_u_19(p95, 10)
                        v_u_98.FX:play("LureReveal", p95.PrimaryPart)
                    elseif p96 and (p96.finished and not v101) then
                        local v_u_102 = p96.reward
                        local v103 = v_u_2.food[p96.bait_kind]
                        if v_u_102.category == "pets" then
                            v_u_19(p95, 10, v103.lure_pet_reveal_effect)
                            v_u_98.FX:play(v103.lure_pet_reveal_sound or "LureReveal", p95.PrimaryPart)
                            local v_u_104 = v_u_2.pets[v_u_102.kind]
                            if v_u_102.kind == "lures_2023_blazing_lion" or v_u_102.kind == "ice_dimension_2025_frostbite_bear" then
                                v_u_99.play(101, v_u_100.Silence)
                                task.delay(0.5, function()
                                    local v105 = v_u_98.FX:play("LureLegendaryFlourish")
                                    v_u_6.fromEvent(v105.Ended):andThen(function()
                                        v_u_99.stop(101, v_u_100.Silence)
                                    end)
                                end)
                                if p97.props.player == v_u_7.LocalPlayer then
                                    local v_u_106 = v_u_1("HouseClient")
                                    local v_u_107 = v_u_1("UIManager")
                                    task.delay(3, function()
                                        if v_u_107.apps.DialogApp:dialog({
                                            ["text"] = ("You caught a %*! Would you like to throw a party?"):format(v_u_104.name),
                                            ["left"] = "No",
                                            ["right"] = "Yes"
                                        }) == "Yes" then
                                            v_u_106.throw_party(v_u_102.kind)
                                        end
                                    end)
                                    return
                                end
                            end
                        else
                            v_u_19(p95, 10)
                            v_u_98.FX:play("LureReveal", p95.PrimaryPart)
                        end
                    end
                else
                    v_u_19(p95, 10)
                    v_u_98.FX:play("LureReveal", p95.PrimaryPart)
                    return
                end
            end
        }
    end
}