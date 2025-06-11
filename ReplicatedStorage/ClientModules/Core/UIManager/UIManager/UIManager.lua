--// ReplicatedStorage.ClientModules.Core.UIManager.UIManager (ModuleScript)

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys"))
local v3 = v_u_2.load
local v_u_4 = v3("PlatformM")
local v_u_5 = v3("ColorThemeManager")
local v_u_6 = v3("ContentPackHelper")
local v7 = v3("ServerType")
local v_u_8 = v3("Debug").create_log()
local v9 = v3("Signal")
local v_u_10 = v3("new:PlatformUITransform")
local v11 = v3("new:TestLabConfig")
local v_u_12 = v3("package:Sift")
local v_u_13 = v3("package:Promise")
local v_u_14 = require(game.ReplicatedFirst.Load.LoadTimers)
local v_u_15 = false
local v_u_16 = v9.new()
local v_u_17 = {
    ["cache"] = {},
    ["apps"] = {}
}
local v18 = {
    ["AilmentsMonitorApp"] = true,
    ["AltCurrencyIndicatorApp"] = true,
    ["BucksIndicatorApp"] = true,
    ["CoopBudgetIndicatorApp"] = true,
    ["CoreGuiApp"] = true,
    ["DevWatchModeApp"] = true,
    ["EventPopupApp"] = true,
    ["ExtraButtonsApp"] = true,
    ["FurnitureSelectorApp"] = true,
    ["GuideArrowApp"] = true,
    ["HideGuiApp"] = true,
    ["HintApp"] = true,
    ["HouseEditorWrapperApp"] = true,
    ["InputDisplayApp"] = true,
    ["InteractionsApp"] = true,
    ["MissingRoleApp"] = true,
    ["NavigatorApp"] = true,
    ["NewSpotlightApp"] = true,
    ["PartyInvitationApp"] = true,
    ["PeopleInsideCountApp"] = true,
    ["PlayerNameApp"] = true,
    ["PriceBillboardApp"] = true,
    ["PromosApp"] = true,
    ["QuestIconApp"] = true
}
local v19 = v7.use_test_lab_behavior()
if v19 then
    v19 = v11.scrolling_banner.enabled
end
v18.ScrollingBannerApp = v19
v18.SpecialEffectsApp = true
v18.SpeechBubbleApp = true
v18.SpotlightApp = true
v18.TesterWatermarkApp = true
v18.ToolApp = true
v18.TooltipApp = true
v18.TransitionsApp = true
v18.Code2xMultipliersApp = true
v18.DooberApp = true
v18.FriendMultiplierApp = true
v_u_17.app_visibilities = v18
local function v_u_23()
    local v20 = v_u_4.get_platform()
    local v21 = v_u_1:WaitForChild("RawUI")
    for _, v22 in v21:GetChildren() do
        v_u_10.transform_app_for_platform_mutate(v22, v20)
    end
    v21.Name = "UI_Resources"
    v21.Parent = game.ReplicatedStorage.Resources
    v_u_5.start(v21)
    return v21
end
v_u_17.app_visibilities_changed = v9.new()
v_u_17.all_apps_refreshed = v9.new()
function v_u_17.get_class(p24)
    local v25 = v_u_17.cache[p24]
    local v26
    if typeof(v25) == "Instance" then
        v26 = v25:IsA("ModuleScript")
    else
        v26 = false
    end
    assert(v26, ("Element does not exist: %s"):format(p24))
    return v_u_2.require(v25)
end
function v_u_17.wrap(p27, p28)
    return v_u_17.get_class(p28).new(v_u_17, p27)
end
local v_u_29 = 0
local v_u_30 = {}
local v_u_31 = v9.new()
function v_u_17.promise_apps_refreshed(p32)
    local v33 = p32 or v_u_12.Dictionary.keys(v_u_17.apps)
    local v_u_35 = v_u_12.List.map(v33, function(p34)
        return v_u_17.apps[p34]
    end)
    for _, v36 in v_u_35 do
        if v_u_30[v36] ~= v_u_29 then
            v38 = false
            ::l6::
            if v38 then
                return v_u_13.resolve()
            else
                return v_u_13.fromEvent(v_u_31, function(_, _)
                    for _, v37 in v_u_35 do
                        if v_u_30[v37] ~= v_u_29 then
                            return false
                        end
                    end
                    return true
                end)
            end
        end
    end
    local v38 = true
    goto l6
end
function v_u_17.refresh_all_apps()
    v_u_29 = v_u_29 + 1
    local v_u_39 = v_u_29
    for _, v_u_40 in pairs(v_u_17.apps) do
        task.spawn(function()
            v_u_40:refresh(v_u_17.app_visibilities)
            v_u_30[v_u_40] = v_u_39
            v_u_31:Fire(v_u_40, v_u_39)
        end)
    end
    v_u_17.all_apps_refreshed:Fire()
end
function v_u_17.set_app_visibility(p41, p42)
    local v43 = typeof(p41) ~= "table"
    assert(v43, "Can\'t find app. Did you acidentally call UIManager.set_app_visibility with a colon instead of a period?")
    local v44 = v_u_17.apps[p41]
    assert(v44, "App doesn\'t exist")
    if p42 == nil then
        p42 = not v_u_17.app_visibilities[p41]
    end
    if v_u_17.app_visibilities[p41] ~= p42 and v44:can_set_app_visibility(p42) then
        v_u_17.app_visibilities[p41] = p42
        v_u_17.refresh_all_apps()
        v_u_17.app_visibilities_changed:Fire(p41, p42)
    end
end
function v_u_17.is_closed(p45)
    for _, v46 in pairs(p45) do
        if v_u_17.app_visibilities[v46] then
            return false
        end
    end
    return true
end
function v_u_17.is_visible(p47)
    return v_u_17.app_visibilities[p47] == true
end
function v_u_17.has_initialized()
    return v_u_15
end
function v_u_17.wait_for_initialization()
    while not v_u_15 do
        v_u_16:Wait()
    end
end
function v_u_17.init()
    local v48 = v_u_23()
    local v49, v50 = v_u_14.new_consecutive_timers()
    v49("084_ui_manager_init_early")
    local v_u_51 = script.Parent:GetDescendants()
    v_u_6.merge_folder("UIApps", v_u_51, function(p52)
        return p52, #v_u_51 + 1
    end, true)
    v_u_6.merge_folder("UIElements", v_u_51, function(p53)
        return p53, #v_u_51 + 1
    end, true)
    for _, v54 in pairs(v_u_51) do
        if v54:IsA("ModuleScript") then
            v_u_17.cache[v54.Name] = v54
        end
    end
    local v_u_55 = script.Parent.Apps:GetChildren()
    v_u_6.merge_folder("UIApps", v_u_55, function(p56)
        return p56, #v_u_55 + 1
    end)
    v49("085_ui_manager_init_wrap")
    local v57 = {}
    for _, v58 in pairs(v_u_55) do
        local v59 = nil
        if v58:IsA("ModuleScript") then
            v59 = v58
        elseif v58:IsA("Folder") then
            v59 = v58:FindFirstChild(v58.Name)
            local v60 = v59 ~= nil
            local v61 = "Expected child ModuleScript \'" .. v58.Name .. "\" to exist under " .. v58:GetFullName()
            assert(v60, v61)
        end
        if v59 ~= nil then
            local v62 = v48:FindFirstChild(v59.Name)
            if v62 and v62:IsA("ScreenGui") then
                v62.Enabled = true
            end
            local v63 = v_u_14.start_misc_timer((("085_ui_manager_init_wrap_%*"):format(v59.Name)))
            local v64 = v_u_14.track_thread_misc(("085_ui_manager_init_wrap_%*"):format(v59.Name), true)
            local v65 = v_u_17.wrap(v62, v59.Name)
            v_u_17.apps[v59.Name] = v65
            v64()
            v63()
            local v66 = {
                ["name"] = v59.Name,
                ["start_order"] = v65:get_start_order()
            }
            table.insert(v57, v66)
            if v_u_17.app_visibilities[v59.Name] == nil then
                v_u_17.app_visibilities[v59.Name] = false
            end
        end
    end
    table.sort(v57, function(p67, p68)
        return p67.start_order < p68.start_order
    end)
    v49("086_ui_manager_init_start")
    for _, v69 in v57 do
        local v_u_70 = v69.name
        local v71 = v_u_17.apps[v_u_70]
        local v_u_72 = false
        task.delay(5, function()
            if not v_u_72 then
                v_u_8(v_u_70 .. ":start() has yielded for over 5 seconds. This method should never yield.")
            end
        end)
        local v73 = v_u_14.start_misc_timer((("086_ui_manager_init_start_%*"):format(v_u_70)))
        local v74 = v_u_14.track_thread_misc(("086_ui_manager_init_start_%*"):format(v_u_70), true)
        v71:start()
        v_u_72 = true
        v74()
        v73()
        if v71.instance and v71.instance.Parent == v48 then
            v71.instance.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        end
    end
    v_u_4.get_gamepad_changed():Connect(v_u_17.refresh_all_apps)
    v49("087_ui_manager_init_late")
    v_u_17.refresh_all_apps()
    v_u_15 = true
    v_u_16:Fire()
    v50()
end
return v_u_17