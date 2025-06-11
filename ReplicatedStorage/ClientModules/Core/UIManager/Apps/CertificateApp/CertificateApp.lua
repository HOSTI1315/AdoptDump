--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.CertificateApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("TranslationHelper")
local v_u_6 = v1("new:SubscriptionsDB")
local v_u_7 = v_u_5.get_translator_for_player(game.Players.LocalPlayer)
local v8 = v2("CertificateApp", v1("UIBaseApp"))
function v8.show(p9)
    p9.instance.Enabled = true
end
function v8.hide(p10)
    p10.instance.Enabled = false
end
function v8.refresh(p11, p12)
    p11:set_visibility(p12[p11.ClassName] and true or false)
end
function v8.display_certificate(p13, p14, p15)
    local v16 = v_u_6[p14]
    if v16 then
        local v17 = p15 or v_u_4.get("subscription_manager")[p14]
        if v17 then
            local v18 = v17.expiration or v17.renewal
            if v18 then
                p13.expiration_date.Text = DateTime.fromUnixTimestamp(v18):FormatLocalTime("ll", v_u_7.LocaleId)
            else
                p13.expiration_date.Text = ""
            end
            p13.body.CertificateName.Text = v_u_5.translate(workspace, v16.name):upper()
            p13.certificate_description.Text = v16.certificate_description
            p13.certificate_icon.Image = v16.certificate_icon_large
            p13.player_name.Text = game.Players.LocalPlayer.Name
            p13.UIManager.set_app_visibility(p13.ClassName, true)
        end
    else
        return
    end
end
function v8.start(p_u_19)
    p_u_19.body = p_u_19.instance.Content.Body
    p_u_19.player_name = p_u_19.body.PlayerName
    p_u_19.certificate_name = p_u_19.body.CertificateName
    p_u_19.certificate_description = p_u_19.body.Description
    p_u_19.certificate_icon = p_u_19.instance.Content.CertificateIcon
    p_u_19.expiration_date = p_u_19.instance.Content.Expiration.DateLabel
    p_u_19.exit_button_instance = p_u_19.instance.Content.ExitButton
    p_u_19.exit_button = p_u_19.UIManager.wrap(p_u_19.exit_button_instance, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_19.UIManager.set_app_visibility(p_u_19.ClassName, false)
        end
    })
    p_u_19.watch = v_u_3.quick_watch({
        ["selection_parent"] = p_u_19.instance,
        ["default_selection"] = p_u_19.exit_button_instance,
        ["app_name"] = p_u_19.ClassName,
        ["exit_buttons"] = { p_u_19.exit_button_instance }
    })
end
return v8