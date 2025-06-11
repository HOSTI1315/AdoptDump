--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MissingRoleApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("SettingsHelper")
local v_u_4 = v_u_1("ColorThemeManager")
local v_u_5 = v_u_1("SoundPlayer")
local v_u_6 = game:GetService("TweenService")
local v_u_7 = game:GetService("CollectionService")
local v8 = v2("DialogApp", v_u_1("UIBaseApp"))
function v8.show(p9)
    p9.instance.Enabled = true
end
function v8.hide(p10)
    p10.instance.Enabled = false
end
local function v_u_22(p11, p12, p13)
    local v14 = (1 / 0)
    local v15 = nil
    for _, v16 in pairs(p11) do
        if not (p12 and v16.is_leadership_role) then
            local v17 = "roleplay_role_picker-" .. v16.building_id .. "-" .. v16.role_id
            local v18 = game.Players.LocalPlayer.Character
            if v18 then
                v18 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            local v19 = v18 and v18.Position or Vector3.new()
            for _, v20 in v_u_7:GetTagged(v17) do
                local v21 = (v20.Position - v19).Magnitude
                if v16.role_id == p13 then
                    v21 = v21 - 99999999
                end
                if v21 < v14 then
                    v15 = v20.Position
                    v14 = v21
                end
            end
        end
    end
    return v15
end
function v8._navigate_to_nearest_roleplay_role_picker(p_u_23, p24, p25)
    local v_u_26 = v_u_1("InteriorsM")
    local v_u_27 = v_u_22(p24, true, p25)
    if v_u_27 == nil then
        v_u_27 = v_u_22(p24, false, p25)
    end
    if v_u_27 then
        task.spawn(function()
            local v_u_28 = os.clock()
            local v_u_29 = false
            p_u_23.UIManager.apps.GuideArrowApp:navigate(v_u_26.get_current_location(), v_u_27, function(p30, _)
                if (p30 - v_u_27).Magnitude >= 11 and not v_u_29 then
                    return false
                end
                v_u_29 = true
                return os.clock() - v_u_28 >= 2
            end)
        end)
    end
end
function v8.show_missing_roles(p31, p32, p33)
    local v34 = next(p32) ~= nil
    assert(v34, "No roles provided")
    if not p31.show_missing_roles_debounce then
        p31.show_missing_roles_debounce = true
        local v35 = {}
        for _, v36 in pairs(p32) do
            local v37 = p31.role_template:Clone()
            v37.Name = "Role"
            v37.Icon.Image = v36.icon
            v37.Parent = p31.instance.Frame.Upper
            local v38 = v_u_3.get_setting_client({
                ["setting_id"] = "theme_color"
            })
            if v36.is_leadership_role then
                v37.InnerColor.ImageColor3 = v_u_4.lookup_specific_color(v38 == "yellow" and "black" or "yellow", "saturated")
            end
            table.insert(v35, v37)
        end
        p31.instance.Frame.Missing.Text = #v35 == 1 and "Missing Role" or "Missing Roles"
        p31.ui_scale.Scale = 0
        p31.instance.Frame.Visible = true
        v_u_5.FX:play("Roleplay/WrongRoleWrongOrder")
        local v39 = v_u_6:Create(p31.ui_scale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            ["Scale"] = 1
        })
        v39:Play()
        v39.Completed:Wait()
        p31:_navigate_to_nearest_roleplay_role_picker(p32, p33)
        task.wait(3.5)
        local v40 = v_u_6:Create(p31.ui_scale, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            ["Scale"] = 0
        })
        v40:Play()
        v40.Completed:Wait()
        for _, v41 in ipairs(v35) do
            v41:Destroy()
        end
        p31.show_missing_roles_debounce = false
    end
end
function v8.start(p42)
    p42.ui_scale = p42.instance.Frame.UIScale
    p42.role_template = p42.instance.Frame.Upper.RoleTemplate
    p42.role_template.Parent = nil
    p42.instance.Frame.Visible = false
    p42.show_missing_roles_debounce = false
end
return v8