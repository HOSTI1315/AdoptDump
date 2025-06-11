--// ReplicatedStorage.SharedModules.Game.EmployeeBonuses (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("SharedConstants")
local v_u_3 = v_u_1("package:Sift")
game:GetService("DataStoreService")
game:GetService("LocalizationService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = nil
local v_u_9 = false
local function v_u_13(p10)
    if v_u_4:IsServer() then
        return v_u_1("RoleplayRolesManager").get_roleplay_db_entry(p10)
    end
    local v11 = v_u_1("RoleplayDB")
    local v12 = v_u_1("ClientData").get_server(p10, "roleplay_role")
    if v12 then
        return v11[v12.building_id].roles[v12.role_id]
    end
end
local function v_u_22(p14)
    local v15 = {}
    local v16 = game.Players.LocalPlayer
    local v17 = v16.Character
    if v17 then
        v17 = v16.Character:FindFirstChild("HumanoidRootPart")
    end
    local v18
    if v17 then
        v18 = v17.Position
    else
        v18 = nil
    end
    if v18 == nil then
        return v15
    end
    for _, v19 in p14 do
        local v20 = v19.Character
        if v20 then
            v20 = v19.Character:FindFirstChild("HumanoidRootPart")
        end
        local v21
        if v20 then
            v21 = v20.Position
        else
            v21 = nil
        end
        if v21 and (v18 - v21).Magnitude < 35 then
            table.insert(v15, v19)
        end
    end
    return v15
end
local function v_u_28(p23, p24)
    local v25 = (p24 == "PERSON_TO_PAY" or p24 == "INELIGIBLE") and true or "NO_HIGHLIGHT"
    assert(v25, "Invalid status")
    if p23 == nil or p23.Parent == nil then
        return
    else
        local v26 = p23:FindFirstChild("EmployeeBonusHighlight")
        if not v26 or v26:GetAttribute("bonus_status") ~= p24 then
            if v26 then
                v26:Destroy()
            end
            local v27 = Instance.new("Highlight")
            v27:SetAttribute("bonus_status", p24)
            if p24 == "PERSON_TO_PAY" then
                v27.FillColor = Color3.fromRGB(11, 171, 0)
                v_u_5:Create(v27, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                    ["FillColor"] = Color3.fromRGB(17, 255, 0)
                }):Play()
            elseif p24 == "INELIGIBLE" then
                v27.FillColor = Color3.fromRGB(213, 0, 0)
            end
            v27.Enabled = p24 ~= "NO_HIGHLIGHT"
            v27.Name = "EmployeeBonusHighlight"
            v27.Parent = p23
            v_u_7[p23] = v27
        end
    end
end
local function v_u_33(p29)
    local v30 = p29 or {}
    for v31, v32 in v_u_7 do
        if not v30[v31] then
            v32:Destroy()
            v30[v31] = nil
        end
    end
end
local function v_u_56()
    local v34 = v_u_1("WeatherClient")
    local v35 = v_u_13(game.Players.LocalPlayer)
    if v35 and v35.building_id ~= nil then
        if v35.is_leadership_role then
            local v_u_36 = v35.building_id
            local v39 = v_u_3.List.filter(game.Players:GetPlayers(), function(p37)
                local v38 = v_u_13(p37)
                if v38 then
                    v38 = v38.building_id == v_u_36
                end
                return v38
            end)
            local v42 = v_u_22((v_u_3.List.filter(v39, function(p40)
                local v41 = v_u_13(p40)
                if v41 then
                    return not v41.is_leadership_role
                else
                    return false
                end
            end)))
            if v34.get_time_of_day() == "NIGHT" then
                v42 = v_u_3.List.filter(v42, function(p43)
                    local v44 = v_u_13(p43)
                    if v44 then
                        return v44.can_roleplay_at_night
                    else
                        return false
                    end
                end)
            end
            local v45 = game.Players.LocalPlayer
            local v46 = v45.Character
            if v46 then
                v46 = v45.Character:FindFirstChild("HumanoidRootPart")
            end
            local v_u_47
            if v46 then
                v_u_47 = v46.Position
            else
                v_u_47 = nil
            end
            if v_u_47 ~= nil then
                table.sort(v42, function(p48, p49)
                    local v50 = p48.Character
                    if v50 then
                        v50 = p48.Character:FindFirstChild("HumanoidRootPart")
                    end
                    local v51
                    if v50 then
                        v51 = v50.Position
                    else
                        v51 = nil
                    end
                    local v52 = p49.Character
                    if v52 then
                        v52 = p49.Character:FindFirstChild("HumanoidRootPart")
                    end
                    local v53
                    if v52 then
                        v53 = v52.Position
                    else
                        v53 = nil
                    end
                    if v51 == nil then
                        return true
                    elseif v53 == nil then
                        return false
                    else
                        return (v_u_47 - v51).Magnitude < (v_u_47 - v53).Magnitude
                    end
                end)
            end
            v_u_8 = nil
            local v54 = {}
            for _, v55 in v42 do
                if v_u_1("ClientData").get_server(v55, "was_paid_bonus_during_current_cycle") ~= true then
                    if v_u_1("ClientData").get("is_manager_bonus_paying_cooldown_active") == true then
                        v_u_28(v55.Character, "NO_HIGHLIGHT")
                    elseif v_u_8 == nil then
                        v_u_28(v55.Character, "PERSON_TO_PAY")
                        v_u_8 = v55
                    else
                        v_u_28(v55.Character, "NO_HIGHLIGHT")
                    end
                else
                    v_u_28(v55.Character, "INELIGIBLE")
                end
                v54[v55.Character] = true
            end
            v_u_33(v54)
        end
    else
        return
    end
end
function v_u_6.equipped()
    equipped = true
    task.spawn(function()
        while equipped do
            if not v_u_9 then
                v_u_56()
            end
            task.wait(0.15)
        end
    end)
end
function v_u_6.unequipped()
    equipped = false
    v_u_33({})
end
function v_u_6.begin_payout_client()
    local v57 = v_u_1("UIManager")
    local v58 = v_u_1("WeatherClient")
    local v59 = v_u_13(game.Players.LocalPlayer)
    if v59 and v59.building_id ~= nil then
        if v59.is_leadership_role then
            if v58.get_time_of_day() == "NIGHT" and not v59.can_roleplay_at_night then
                v57.apps.HintApp:hint({
                    ["text"] = "You can only pay your employees during work hours.",
                    ["length"] = 5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
                task.wait(0.5)
                return false
            elseif v_u_1("ClientData").get("is_manager_bonus_paying_cooldown_active") == true then
                v57.apps.HintApp:hint({
                    ["text"] = ("You can only pay a bonus every %s seconds."):format(30),
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                task.wait(0.5)
                return false
            elseif v_u_8 then
                v_u_9 = true
                local v60 = v57.apps.DialogApp:dialog({
                    ["text"] = ("Pay %s a bonus of %d Bucks?"):format(v_u_8.Name, v_u_2.employee_bonus_pay),
                    ["left"] = "No",
                    ["right"] = "Yes"
                })
                v_u_9 = false
                if v60 == "No" then
                    return false
                else
                    return true, v_u_8
                end
            else
                v57.apps.HintApp:hint({
                    ["text"] = "No nearby employees to pay.",
                    ["length"] = 5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
                task.wait(0.5)
                return false
            end
        else
            return false
        end
    else
        return false
    end
end
function v_u_6.pay_employee(p_u_61, p62)
    local v_u_63 = v_u_1("DataM")
    local v64 = v_u_1("JobPay")
    local v65 = v_u_1("MsgBridge")
    local v66 = v_u_1("WeatherServer")
    if p_u_61 == p62 then
        return
    else
        local v67 = v_u_13(p62)
        local v68 = v_u_13(p_u_61)
        if v67 and v68 then
            if v67.building_id == v68.building_id then
                if v67.is_leadership_role then
                    return
                elseif v68.is_leadership_role then
                    local v69 = v_u_63.get_store(p_u_61)
                    if v69 then
                        local v70 = v_u_63.get_store(p62)
                        if v70 then
                            local v71 = v70:get("job_pay_manager")
                            if v71 then
                                if v70:get("was_paid_bonus_during_current_cycle") then
                                    return
                                elseif v69:get("is_manager_bonus_paying_cooldown_active") then
                                    return
                                elseif v66.is_night() and not v67.can_roleplay_at_night then
                                    return
                                else
                                    v70:set("was_paid_bonus_during_current_cycle", true)
                                    v69:set("is_manager_bonus_paying_cooldown_active", true)
                                    local v72 = v71:increase_max_payout_to_accomodate_bonus()
                                    if v72 then
                                        v72 = v64.claim_pay_server(p62, v_u_2.employee_bonus_pay, {
                                            ["show_sprouting_money_on_all_clients"] = true,
                                            ["bypass_supression_ailment_check"] = true,
                                            ["analytics_pay_source"] = "employee_bonus",
                                            ["manager_who_paid_bonus_user_id"] = p_u_61.UserId
                                        })
                                    end
                                    if v72 then
                                        task.delay(30, function()
                                            local v73 = v_u_63.get_store(p_u_61)
                                            if v73 then
                                                v73:set("is_manager_bonus_paying_cooldown_active", false)
                                            end
                                        end)
                                        v65.hint(p_u_61, {
                                            ["text"] = string.format("%s received your bonus!", p62.Name),
                                            ["length"] = 4,
                                            ["overridable"] = true
                                        })
                                        v65.dialog(p62, {
                                            ["text"] = string.format("Your boss (%s) paid you a bonus of %s Bucks!", p_u_61.Name, v_u_2.employee_bonus_pay),
                                            ["button"] = "Awesome!"
                                        })
                                    else
                                        v69:set("is_manager_bonus_paying_cooldown_active", false)
                                        v65.hint(p_u_61, {
                                            ["text"] = string.format("Bonus payment failed.", p62.Name, v_u_2.employee_bonus_pay),
                                            ["length"] = 4,
                                            ["overridable"] = true
                                        })
                                    end
                                end
                            else
                                return
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    end
end
function v_u_6.mark_eligible_for_bonus_again(p74)
    local v75 = v_u_1("DataM").get_store(p74)
    if v75 then
        v75:set("was_paid_bonus_during_current_cycle", nil)
    end
end
function v_u_6.init()
    if v_u_4:IsServer() then
        local v76 = v_u_1("WeatherServer")
        local v_u_77 = v_u_1("WeatherDB")
        v76.on_weather_changed:Connect(function(p78)
            if p78 == v_u_77.DAY then
                for _, v79 in game.Players:GetPlayers() do
                    v_u_6.mark_eligible_for_bonus_again(v79)
                end
            end
        end)
    end
end
return v_u_6