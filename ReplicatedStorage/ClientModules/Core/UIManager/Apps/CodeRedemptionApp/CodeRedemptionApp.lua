--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.CodeRedemptionApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("SoundPlayer")
local v_u_4 = v1("XboxSupport")
local v5 = v1("Class")("CodeRedemptionApp", v1("UIBaseApp"))
function v5._pick_color(p6, p7)
    return p6.UIManager.apps.ColorPickerApp:pick_color({
        ["request_source"] = p6.ClassName,
        ["no_advanced"] = true,
        ["starter_color"] = p7
    })
end
function v5._display_page(p8, p9)
    for _, v10 in p8.pages:GetChildren() do
        v10.Visible = false
    end
    local v11 = p8.pages:FindFirstChild(p9)
    if v11 then
        v11.Visible = true
        if v11:FindFirstChild("DefaultSelection") then
            p8.watch:select_object(v11.DefaultSelection.Value)
        end
    end
end
function v5._show_rejection(p12, p13, p14)
    p12.pages.Rejected.ErrorTitle.Text = p13 or "ERROR"
    p12.pages.Rejected.Reason.Text = p14 or "No error message provided!"
    p12:_display_page("Rejected")
end
function v5._redeem_code(p15, p16)
    p15.input_textbox.Text = ""
    local v17, v18 = v_u_2.get("CodeRedemptionAPI/AttemptRedeemCode"):InvokeServer(p16)
    if v17 then
        p15:_display_page("Success")
    elseif v18 then
        local v19
        if v18.id > 0 then
            local v20 = v18.id
            v19 = "ERROR: " .. tostring(v20)
        else
            v19 = nil
        end
        p15:_show_rejection(v19, v18.msg)
    end
end
function v5.show(p21)
    v_u_3.FX:play("PopShort")
    p21.input_textbox.Text = ""
    p21:_display_page("Redemption")
    p21.frame.Visible = true
end
function v5.hide(p22)
    p22.frame.Visible = false
end
function v5.start(p_u_23)
    p_u_23.frame = p_u_23.instance.Frame
    p_u_23.pages = p_u_23.frame.Pages
    p_u_23.input_textbox = p_u_23.pages.Redemption.CodeTextbox
    local v24 = {
        ["mouse_button1_click"] = function()
            v_u_3.Interface:play("TaskBoard/Close")
            p_u_23.UIManager.set_app_visibility(p_u_23.ClassName, false)
        end
    }
    p_u_23.exit_button = p_u_23.UIManager.wrap(p_u_23.frame.ExitButton, "DepthButton"):start(v24)
    p_u_23.input_textbox.FocusLost:Connect(function(p25)
        if p25 then
            p_u_23:_redeem_code(p_u_23.input_textbox.Text)
        end
    end)
    local v26 = {
        ["mouse_button1_click"] = function()
            v_u_3.FX:play("PopShort")
            p_u_23:_redeem_code(p_u_23.input_textbox.Text)
        end
    }
    p_u_23.UIManager.wrap(p_u_23.pages.Redemption.RedeemButton, "DepthButton"):start(v26)
    local v27 = {
        ["mouse_button1_click"] = function()
            v_u_3.FX:play("PopShort")
            p_u_23:_display_page("Info")
        end
    }
    p_u_23.UIManager.wrap(p_u_23.pages.Redemption.InfoButton, "DepthButton"):start(v27)
    local v28 = {
        ["mouse_button1_click"] = function()
            v_u_3.FX:play("PopShort")
            p_u_23:_display_page("Redemption")
        end
    }
    p_u_23.UIManager.wrap(p_u_23.pages.Success.ReturnButton, "DepthButton"):start(v28)
    local v29 = {
        ["mouse_button1_click"] = function()
            v_u_3.FX:play("PopShort")
            p_u_23:_display_page("Redemption")
        end
    }
    p_u_23.UIManager.wrap(p_u_23.pages.Rejected.ReturnButton, "DepthButton"):start(v29)
    p_u_23.UIManager.wrap(p_u_23.pages.Info.ReturnButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_23:_display_page("Redemption")
        end
    })
    v_u_2.get("CodeRedemptionAPI/RequestPickColor").OnClientInvoke = function(p30)
        return p_u_23:_pick_color(p30)
    end
    p_u_23.watch = v_u_4.quick_watch({
        ["selection_parent"] = p_u_23.frame,
        ["default_selection"] = p_u_23.input_textbox,
        ["app_name"] = p_u_23.ClassName,
        ["exit_buttons"] = { p_u_23.frame.ExitButton },
        ["save_last_selection"] = false,
        ["close_override"] = function()
            return p_u_23.exit_button.instance.Visible
        end
    })
end
return v5