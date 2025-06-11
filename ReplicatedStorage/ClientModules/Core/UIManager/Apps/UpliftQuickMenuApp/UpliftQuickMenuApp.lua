--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.UpliftQuickMenuApp (ModuleScript)

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("StarterGui")
local v_u_4 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v5 = v_u_4("Class")
local v6 = v_u_4("Signal")
local v_u_7 = v_u_4("canUseAdminApi")
local v_u_8 = false
local v_u_9 = v6.new()
task.spawn(function()
    if v_u_7(v_u_1.LocalPlayer, "Tester") then
        v_u_8 = true
        v_u_9:Fire()
    end
end)
local v10, v_u_11 = v5("UpliftQuickMenuApp", v_u_4("UIBaseApp"))
function v10.__init(p12, ...)
    v_u_11.__init(p12, ...)
    local v13 = p12.instance.Frame
    p12._quick_button_template = assert(v13:FindFirstChild("QuickButtonTemplate", true))
    p12._quick_button_template.Visible = false
end
function v10.show(p14)
    p14.instance.Frame.Visible = true
end
function v10.hide(p15)
    p15.instance.Frame.Visible = false
end
function v10._set_visible(p_u_16, p_u_17)
    task.spawn(function()
        local v18 = v_u_4("UIManager")
        v18.set_app_visibility("UpliftQuickMenuApp", p_u_17)
        p_u_16.instance.Frame.Visible = v18.is_visible("UpliftQuickMenuApp")
    end)
end
function v10._toggle_visible(p19)
    p19:_set_visible(not p19.instance.Frame.Visible)
end
function v10.create_quick_button(p20, p21)
    local v22 = p20._quick_button_template:Clone()
    v22.Visible = true
    if p21.text then
        v22.Text = p21.text
    end
    if p21.activated then
        v22.Activated:Connect(p21.activated)
    end
    v22.Parent = p20.instance.Frame:FindFirstChild("QuickButtons", true)
    return v22
end
function v10._start_menu_button(p_u_23)
    local v24 = p_u_23.instance.UpliftQuickButton
    local v_u_25 = assert(v24:FindFirstChild("MenuButton", true))
    p_u_23.instance.Frame:GetPropertyChangedSignal("Visible"):Connect(function()
        local v26 = v_u_25
        local v27
        if p_u_23.instance.Frame.Visible then
            v27 = Color3.fromRGB(238, 46, 127)
        else
            v27 = Color3.fromRGB(0, 0, 0)
        end
        v26.BackgroundColor3 = v27
    end)
    v_u_25.Activated:Connect(function()
        p_u_23:_toggle_visible()
        v_u_3:SetCore("DevConsoleVisible", false)
    end)
    local v_u_28 = v_u_4("ClientData")
    local function v32()
        local v29 = v_u_28.get("boolean_flags") or {}
        local v30 = p_u_23.instance.UpliftQuickButton
        local v31 = v_u_8
        if v31 then
            v31 = v29.display_uplift_button
        end
        v30.Enabled = v31
    end
    v_u_28.register_callback("boolean_flags", v32)
    v_u_9:Connect(v32)
    local v33 = v_u_28.get("boolean_flags") or {}
    local v34 = p_u_23.instance.UpliftQuickButton
    local v35 = v_u_8
    if v35 then
        v35 = v33.display_uplift_button
    end
    v34.Enabled = v35
end
function v10._soft_start(p_u_36)
    p_u_36.instance.Frame.Visible = false
    p_u_36.instance.UpliftQuickButton.Enabled = false
    p_u_36:_start_menu_button()
    p_u_36:create_quick_button({
        ["text"] = "Close Menu",
        ["activated"] = function()
            p_u_36:_set_visible(false)
        end
    })
    p_u_36:create_quick_button({
        ["text"] = "Open Cmdr",
        ["activated"] = function()
            p_u_36:_set_visible(false)
            require(v_u_2:WaitForChild("CmdrClient")):Toggle()
        end
    })
    p_u_36:create_quick_button({
        ["text"] = "Open DevConsole",
        ["activated"] = function()
            p_u_36:_set_visible(false)
            v_u_3:SetCore("DevConsoleVisible", true)
        end
    })
    p_u_36:create_quick_button({
        ["text"] = "Toggle Performance Stats",
        ["activated"] = function()
            p_u_36:_set_visible(false)
            local v37 = v_u_4("UIManager")
            v37.set_app_visibility("PerformanceGraphApp", not v37.is_visible("PerformanceGraphApp"))
        end
    })
    p_u_36:create_quick_button({
        ["text"] = "Disable Uplift Button",
        ["activated"] = function()
            local v38 = v_u_4("UIManager")
            v38.apps.SettingsApp:set_setting("display_uplift_button", false)
            p_u_36:_set_visible(false)
            v38.apps.DialogApp:dialog({
                ["text"] = "The Uplift button can be re-enabled in the \'Extra\' section of the Adopt Me settings menu.",
                ["button"] = "Okay"
            })
        end
    })
    p_u_36:create_quick_button({
        ["text"] = "Localization: toggle showing keys of strings",
        ["activated"] = function()
            p_u_36:_set_visible(false)
            local v39 = v_u_1.LocalPlayer:GetAttribute("LocalizationDebugDisplayMode") == "ShowKeys" and "Normal_behavior" or "Show_keys_of_all_translated_strings"
            require(v_u_2:WaitForChild("CmdrClient")).Dispatcher:Run("debuglocalization", "DisplayMode", v39)
        end
    })
    p_u_36:create_quick_button({
        ["text"] = "Localization: toggle hiding translated strings",
        ["activated"] = function()
            p_u_36:_set_visible(false)
            local v40 = v_u_1.LocalPlayer:GetAttribute("LocalizationDebugDisplayMode") == "HideTranslated" and "Normal_behavior" or "Hide_all_translated_strings"
            require(v_u_2:WaitForChild("CmdrClient")).Dispatcher:Run("debuglocalization", "DisplayMode", v40)
        end
    })
end
function v10.start(p41)
    p41.instance.UpliftQuickButton.Enabled = false
    p41.instance.Frame.Visible = false
    task.spawn(p41._soft_start, p41)
end
return v10