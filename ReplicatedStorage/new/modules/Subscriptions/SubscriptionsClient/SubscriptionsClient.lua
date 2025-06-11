--// ReplicatedStorage.new.modules.Subscriptions.SubscriptionsClient (ModuleScript)

local v_u_1 = require(script.Parent.SubscriptionsDB)
local v_u_2 = require(script.Parent.Parent.LegacyLoad)
local v_u_3 = v_u_2("KindDB")
local v_u_4 = v_u_2("ClientData")
local v_u_5 = v_u_2("RouterClient")
local v_u_6 = v_u_2("package:Promise")
local v_u_7 = {}
local v_u_8 = false
local v_u_9 = {}
local function v_u_17(p10, p11)
    local v12 = v_u_2("UIManager")
    local v13 = v_u_1[p10]
    if p11 and v13 then
        if p11.source ~= "subscription_certificate" then
            local v14 = v_u_1[p10]
            local v15
            if v14 then
                v15 = v14.product_info
            else
                v15 = nil
            end
            local v16 = "Your subscription has been activated:\n" .. (v15 and v15.Name or (v13.name or ""))
            if v13.renewing_benefits then
                v16 = v16 .. "\n(Some items may take some time to be added to your account)"
            end
            v12.apps.DialogApp:dialog({
                ["text"] = v16,
                ["button"] = "Cool!"
            })
        end
    else
        return
    end
end
local function v_u_38(p18, p19)
    local v_u_20 = v_u_2("UIManager")
    local v_u_21 = v_u_2("ClientToolManager")
    local v22 = v_u_2("DeveloperProductDB")
    local v_u_23 = v_u_1[p18]
    if not v_u_23 then
        return
    end
    if p19.source ~= "subscription_certificate" then
        local v24 = v_u_1[p18]
        local v25
        if v24 then
            v25 = v24.product_info
        else
            v25 = nil
        end
        local v_u_26 = v25 and v25.Name or (v_u_23.name or "")
        local function v27()
            v_u_20.apps.DialogApp:dialog({
                ["text"] = ("Your subscription has expired:\n%*"):format(v_u_26),
                ["button"] = "Okay"
            })
        end
        if v_u_8 then
            v27()
        else
            local v28 = v_u_9
            table.insert(v28, v27)
        end
    end
    local v_u_29 = v_u_23.certificate_resubscription
    local v30
    if v_u_29 == nil then
        v30 = false
    else
        v30 = v_u_7.is_active(v_u_29)
    end
    local v_u_31 = false
    if v_u_23.certificate_item_kind then
        for _, v32 in (v_u_4.get("inventory") or {}).gifts do
            if v32.kind == v_u_23.certificate_item_kind then
                v_u_31 = v32
                break
            end
        end
    end
    local v33 = {}
    if not v30 then
        table.insert(v33, "SUBSCRIBE!")
    end
    if v_u_31 then
        table.insert(v33, "Reactivate")
    elseif v_u_23.certificate_item_kind and v22[v_u_23.certificate_item_kind] then
        table.insert(v33, "BUY MORE!")
    end
    local v_u_34 = {
        ["dialog_type"] = "NPCDialog",
        ["npc_image"] = "rbxassetid://127307823334144",
        ["text"] = ("Uh oh!\nYour %* just expired!"):format(v_u_23.name)
    }
    if #v33 == 0 then
        v_u_34.button = "Okay"
    elseif #v33 == 1 then
        v_u_34.button = v33[1]
    else
        v_u_34.right = v33[1]
        v_u_34.left = v33[2]
    end
    local function v36()
        local v35 = v_u_20.apps.DialogApp:dialog(v_u_34)
        if v35 == "SUBSCRIBE!" then
            v_u_20.apps.SubscriptionConfirmationApp:display_subscription(v_u_29)
            return
        elseif v35 == "BUY MORE!" then
            v_u_20.apps.DialogApp:dialog({
                ["product_id"] = v_u_23.certificate_item_kind,
                ["dialog_type"] = "RobuxProductDialog"
            })
        elseif v35 == "Reactivate" then
            v_u_21.equip(v_u_31)
        end
    end
    if v_u_8 then
        v36()
    else
        local v37 = v_u_9
        table.insert(v37, v36)
    end
end
local function v_u_62(p_u_39, p_u_40, _, p_u_41)
    local v_u_42 = v_u_2("UIManager")
    local v43 = v_u_1[p_u_39]
    if p_u_40 and v43 then
        if p_u_40.source == "subscription_certificate" then
            local function v44()
                v_u_42.apps.CertificateApp:display_certificate(p_u_39, p_u_40)
            end
            if v_u_8 then
                v44()
            else
                local v45 = v_u_9
                table.insert(v45, v44)
            end
        else
            local v46 = v_u_1[p_u_39]
            local v47
            if v46 then
                v47 = v46.product_info
            else
                v47 = nil
            end
            local v_u_48 = ("Congrats! %* is now active!"):format(v47 and v47.Name or (v43.name or ""))
            local function v60()
                if p_u_41 and #p_u_41 > 0 then
                    v_u_48 = v_u_48 .. " Items have been added to your backpack."
                    local v49 = {}
                    local v50 = {}
                    for _, v51 in p_u_41 do
                        local v52 = v_u_3[v51]
                        if v52 then
                            local v53 = {
                                ["kind"] = v52.kind,
                                ["category"] = v52.category,
                                ["properties"] = {}
                            }
                            table.insert(v49, v53)
                            if not table.find(v50, v52.category) then
                                local v54 = v52.category
                                table.insert(v50, v54)
                            end
                        end
                    end
                    local v55 = {
                        ["dialog_type"] = "ItemPreviewDialog",
                        ["items"] = v49,
                        ["text"] = v_u_48,
                        ["button"] = "Cool!"
                    }
                    v_u_42.apps.DialogApp:dialog(v55)
                    v_u_42.apps.BackpackApp:set_visible_categories(v50)
                    if v50[1] then
                        v_u_42.apps.BackpackApp:select_category(v50[1])
                    end
                    v_u_42.set_app_visibility("BackpackApp", true)
                    v_u_6.fromEvent(v_u_42.app_visibilities_changed, function(p56, p57)
                        local v58
                        if p56 == "BackpackApp" then
                            v58 = not p57
                        else
                            v58 = false
                        end
                        return v58
                    end):andThen(function()
                        v_u_42.apps.BackpackApp.categories:reset_visible_categories()
                    end)
                else
                    local v59 = {
                        ["text"] = v_u_48,
                        ["button"] = "Cool!"
                    }
                    v_u_42.apps.DialogApp:dialog(v59)
                end
            end
            if v_u_8 then
                v60()
            else
                local v61 = v_u_9
                table.insert(v61, v60)
            end
            return
        end
    else
        return
    end
end
function v_u_7._get_subscription_data(p63)
    local v64 = v_u_4.get("subscription_manager")
    return not (v64 and v64[p63]) and {} or v64[p63]
end
function v_u_7.is_active(p65)
    return v_u_7._get_subscription_data(p65).active == true
end
function v_u_7.is_renewing(p66)
    local v67 = v_u_7._get_subscription_data(p66)
    return v67.renewal ~= nil, v67.renewal
end
function v_u_7.is_expiring(p68)
    local v69 = v_u_7._get_subscription_data(p68)
    return v69.expiration ~= nil, v69.expiration
end
function v_u_7.get_state(p70)
    local v71 = v_u_7._get_subscription_data(p70)
    for _, v72 in Enum.SubscriptionState:GetEnumItems() do
        if v72.Name == v71.state then
            return v72
        end
    end
    return Enum.SubscriptionState.NeverSubscribed
end
function v_u_7.is_expiring_or_renewing_soon(p73)
    if v_u_7._get_subscription_data(p73).can_view_notification then
        local v74 = DateTime.now().UnixTimestamp
        local v75, v76 = v_u_7.is_expiring(p73)
        if v75 and (v76 and v76 - v74 < 259200) then
            return "expiring"
        end
        local v77, v78 = v_u_7.is_renewing(p73)
        if v77 and (v78 and v78 - v74 < 259200) then
            return "renewing"
        end
    end
end
function v_u_7.show_expiration_and_renewal_notifications()
    for _, v79 in v_u_9 do
        v79()
    end
    v_u_9 = {}
    v_u_8 = true
    for v80, _ in v_u_4.get("subscription_manager") do
        local v81 = v_u_7.is_expiring_or_renewing_soon(v80)
        if v81 then
            local v82 = v_u_1[v80]
            if v82 then
                v_u_2("UIManager").apps.DialogApp:dialog({
                    ["text"] = ("Your subscription (%*) is %* soon!"):format(v82.name, v81),
                    ["button"] = "Okay!",
                    ["yields"] = true
                })
                v_u_5.get("ProductsAPI/ViewSubscription"):FireServer(v80)
            end
        end
    end
end
function v_u_7.start()
    v_u_5.get("ProductsAPI/GetClientSubscriptionInfo").OnClientInvoke = function(p83)
        while true do
            local v84 = v_u_1[p83]
            local v85
            if v84 then
                v85 = v84.product_info
            else
                v85 = nil
            end
            if v85 then
                return v85
            end
            task.wait(1)
        end
    end
    v_u_5.get_event("SubscriptionAPI/Activated").OnClientEvent:Connect(v_u_17)
    v_u_5.get_event("SubscriptionAPI/Deactivated").OnClientEvent:Connect(v_u_38)
    v_u_5.get_event("SubscriptionAPI/ReceivedBenefits").OnClientEvent:Connect(v_u_62)
end
return v_u_7