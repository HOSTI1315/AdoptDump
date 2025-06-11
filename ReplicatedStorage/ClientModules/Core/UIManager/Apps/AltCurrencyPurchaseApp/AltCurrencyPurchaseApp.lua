--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AltCurrencyPurchaseApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AltCurrencyData")
local v3 = v1("Class")
local v_u_4 = v1("FormatHelper")
local v_u_5 = v1("LiveOpsTime")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("package:Promise")
local v8, v_u_9 = v3("AltCurrencyPurchaseApp", (v1("CurrencyPurchaseBaseApp")))
function v8.show_warning(p10)
    if not p10.warning.Visible then
        local v11 = p10.warning.AbsoluteSize.Y
        p10.instance.Frame.Size = p10.frame_size + UDim2.fromOffset(0, v11)
        p10.instance.Frame.Body.Size = p10.body_size + UDim2.fromOffset(0, -v11)
        p10.warning.Visible = true
    end
end
function v8.hide_warning(p12)
    if p12.warning.Visible then
        p12.instance.Frame.Size = UDim2.fromOffset(530, 273)
        p12.instance.Frame.Size = p12.frame_size
        p12.instance.Frame.Body.Size = p12.body_size
        p12.warning.Visible = false
    end
end
function v8.make_timer_promise(p_u_13, p_u_14)
    if p_u_13.timer_promise then
        p_u_13.timer_promise:cancel()
        p_u_13.timer_promise = nil
    end
    p_u_13.timer_promise = v_u_7.new(function(p15, _, p16)
        local v17 = v_u_5.get_time_until(p_u_14)
        while v17 > 0 and not p16() do
            local v18 = v_u_4.get_time_breakdown(v17)
            if v18.days == 0 and v18.hours == 0 then
                p_u_13.warning.TextLabel.Text = ("Last chance! %s Shop disabled in: %02d:%02d"):format(v_u_2.human_readable, v18.minutes, v18.seconds)
                p_u_13:show_warning()
            end
            task.wait(1)
            v17 = v_u_5.get_time_until(p_u_14)
        end
        p15()
    end):andThen(function()
        if v_u_2.is_taken_down() then
            p_u_13.warning.TextLabel.Text = ("You cannot buy %s this close to the end of the event"):format(v_u_2.human_readable)
            p_u_13:show_warning()
        else
            p_u_13:hide_warning()
        end
    end)
end
function v8.show(p19)
    local v20 = p19.instance.Frame.Header
    v20.Icon.Image = v_u_2.purchase_app_icon
    v20.TextLabel.Text = "Buy " .. p19.currency_human_readable
    if v_u_2.is_taken_down() then
        p19.warning.TextLabel.Text = ("You cannot buy %s this close to the end of the event"):format(v_u_2.human_readable)
        p19:show_warning()
    else
        local v21 = v_u_2.get_takedown_timestamp()
        if v21 then
            p19:make_timer_promise(v21)
        else
            p19:hide_warning()
        end
    end
    v_u_9.show(p19)
end
function v8.hide(p22)
    v_u_9.hide(p22)
    if p22.timer_promise then
        p22.timer_promise:cancel()
        p22.timer_promise = nil
    end
end
function v8.start(p23)
    v_u_9.start(p23, v_u_2.name, v_u_2.human_readable, v_u_6.Dictionary.map(v_u_2.developer_products, function(_, p24)
        return p24, p24:match("(%u)$")
    end))
    p23.warning = p23.instance.Frame.Warning
    p23.frame_size = p23.instance.Frame.Size
    p23.body_size = p23.instance.Frame.Body.Size
end
return v8