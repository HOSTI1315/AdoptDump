--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.RoleplayPayApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("RoleplayDB")
local v_u_6 = v1("RouterClient")
v1("XboxSupport")
local v_u_7 = game:GetService("TweenService")
local v_u_8 = v_u_3.get_platform()
local v9 = v2("RoleplayPayApp", v1("UIBaseApp"))
function v9.show(p10)
    p10.instance.Enabled = true
end
function v9.hide(p11)
    p11.instance.Enabled = false
end
function v9.refresh(p12, p13)
    local v14 = p12.UIManager.is_closed({ "MainMenuApp", "AvatarEditorApp" })
    if not p13[p12.ClassName] then
        v14 = false
    end
    p12:set_visibility(v14)
end
function v9._set_increments(p_u_15, p16)
    for v17, v18 in p_u_15.increments do
        v18:Destroy()
        p_u_15.increments[v17] = nil
    end
    for v19 = 1, p16 do
        local v_u_20 = p_u_15.increment_template:Clone()
        v_u_20.Rotation = 36 * (v19 - 1)
        v_u_20.Name = "Increment-" .. v19
        v_u_20.Parent = p_u_15.increment_container
        if v19 == p16 then
            v_u_20.ImageColor3 = Color3.fromRGB(255, 255, 255)
            v_u_20.ImageTransparency = 1
            task.spawn(function()
                local v21 = v_u_7:Create(v_u_20, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
                    ["ImageTransparency"] = 0
                })
                v21:Play()
                v21.Completed:Wait()
                if v_u_20.Parent then
                    v_u_7:Create(v_u_20, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                        ["ImageColor3"] = p_u_15.increment_template.ImageColor3
                    }):Play()
                end
            end)
        end
        p_u_15.increments[v19] = v_u_20
    end
end
function v9._render_ui(p22)
    local v23 = v_u_4.get("job_pay_manager")
    local v24
    if v23 then
        v24 = v23.roleplay_role
    else
        v24 = v23
    end
    if v24 then
        local v25 = v_u_5[v24.building_id].roles[v24.role_id]
        p22.instance.Container.Role.InnerColor.Icon.Image = v25.icon
        local _ = v25.pay_percentage_breakdown.roleplay == 100
        local v26 = v23.is_night
        local v27 = v23.is_in_designated_interior
        local v28 = v23.is_job_pay_supressed_by_progressing_ailment
        if v26 and not v25.can_roleplay_at_night then
            p22.instance.Container.Role.EarningsLabel.Text = "We\'re Closed"
        elseif v27 then
            if v28 then
                p22.instance.Container.Role.EarningsLabel.Text = "Starting Soon"
            else
                p22.instance.Container.Role.EarningsLabel.Text = string.format("$%d/$%d", v23.amount_paid_out_this_cycle, v23.max_payout)
            end
        else
            p22.instance.Container.Role.EarningsLabel.Text = "On Break"
        end
        if v23.is_incremental_pay_timer_running then
            p22:_set_increments(v23.incremental_pay_increment)
        else
            p22:_set_increments(0)
        end
        p22.UIManager.set_app_visibility(p22.ClassName, true)
    else
        p22.UIManager.set_app_visibility(p22.ClassName, false)
    end
end
function v9.start(p_u_29)
    local v30 = p_u_29.instance.Container
    p_u_29.increment_container = v30.Role.FilledIncrements
    p_u_29.increment_template = p_u_29.increment_container.FilledIncrementTemplate
    p_u_29.increment_template.Parent = nil
    p_u_29.increments = {}
    v_u_4.register_callback("job_pay_manager", function(_, _)
        p_u_29:_render_ui()
    end)
    v30.Role.Close.MouseButton1Down:connect(function()
        v_u_6.get("RoleplayAPI/AbandonRoleplayRole"):FireServer()
    end)
    if v_u_8 == v_u_3.platform.console then
        v30.Role.Close.Visible = false
    end
    local v31 = UDim.new(0, 0)
    local v32
    if v_u_8 == v_u_3.platform.phone then
        v31 = UDim.new(0, 6)
        v32 = 0.5
    else
        v32 = 1
    end
    v30.LayoutOrder = 3000
    v30.UIScale.Scale = v32
    local v33 = {
        ["padding_top"] = v31,
        ["on_press"] = function()
            v_u_6.get("RoleplayAPI/AbandonRoleplayRole"):FireServer()
        end
    }
    p_u_29.UIManager.apps.SharedLayoutsApp:register_to_topbar(v30, v33)
end
return v9