--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.TooltipCertification (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("package:t")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("FormatHelper")
local v_u_6 = v1("new:SubscriptionsDB")
local v_u_7 = v2("TooltipCertification", (v1("UIBaseTooltipComponent")))
local v_u_8 = v3.strictInterface({
    ["subscription_kind"] = v3.optional(v3.string)
})
function v_u_7._validate_options(_, p9)
    return v_u_8(p9)
end
function v_u_7.start(p_u_10)
    p_u_10.options = {}
    p_u_10.icon = p_u_10.instance.ImageLabel
    p_u_10.time_label = p_u_10.instance.TimeRemaining
    p_u_10.button = p_u_10.UIManager.wrap(p_u_10.instance.ImageButton, "CustomButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_10.options.subscription_kind then
                p_u_10.UIManager.apps.CertificateApp:display_certificate(p_u_10.options.subscription_kind)
            end
        end
    })
end
function v_u_7.format_duration(p11)
    local v12 = v_u_5.get_time_breakdown(p11)
    local v13 = v12.days
    local v14 = v12.hours
    local v15 = v12.minutes
    local v16 = v12.seconds
    if v13 > 0 then
        return v13 .. " Days"
    elseif v14 > 0 then
        return v14 .. " Hours"
    elseif v15 > 0 then
        return v15 .. " Mins"
    else
        return v16 .. "s"
    end
end
function v_u_7.update(p17)
    if p17.instance.Visible then
        local v18 = p17.options.subscription_kind
        local v19
        if v18 then
            v19 = v_u_6[v18]
        else
            v19 = v18
        end
        if v19 then
            if v19.certification_icon then
                p17.icon.Image = v19.certification_icon
            end
            local v20 = tick()
            if p17.last_updated_timestamp == nil or v20 - p17.last_updated_timestamp >= 1 then
                local v21 = v_u_4.get("subscription_manager")[v18]
                if not v21 then
                    p17:set_visible(false)
                    return
                end
                local v22 = v21.expiration
                if not v22 then
                    p17.time_label.Text = ""
                    return
                end
                local v23 = v22 - DateTime.now().UnixTimestamp
                if v23 < 0 then
                    p17:set_visible(false)
                    return
                end
                local v24 = v_u_7.format_duration(v23) .. " Left"
                p17.time_label.Text = v24
                p17.last_updated_timestamp = v20
            end
        else
            p17:set_visible(false)
        end
    else
        return
    end
end
return v_u_7