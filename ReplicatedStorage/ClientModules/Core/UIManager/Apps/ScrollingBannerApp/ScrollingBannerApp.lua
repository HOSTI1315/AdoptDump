--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ScrollingBannerApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = game:GetService("RunService")
local v3 = v1("Class")
local v_u_4 = v1("new:TextUtil")
local v5 = v1("new:TestLabConfig")
local v_u_6 = v1("new:ToggleableSignal")
local v7 = v3("ScrollingBannerApp", v1("UIBaseApp"))
local v_u_8 = ("\226\154\160 You\'re currently playing the Adopt Me Test Lab. Your data will NOT TRANSFER to the Main Version of Adopt Me, and WILL BE RESET %*! \226\154\160"):format(v5.data_clearing.on and (v5.data_clearing.seconds < 3600 and "FREQUENTLY" or (v5.data_clearing.seconds < 86400 and "HOURLY" or (v5.data_clearing.seconds < 604800 and "DAILY" or "OCCASIONALLY"))) or "OCCASIONALLY")
function v7._get_text_size(p9)
    local v10 = p9.instance.BannerBackground.AbsoluteSize.Y
    local v11 = p9.instance.BannerBackground.UISizeConstraint
    local v12 = v11.MinSize.Y
    local v13 = v11.MaxSize.Y
    return 29 * ((v10 - v12) / (v13 - v12)) + 18
end
function v7._update_text_size(p14)
    p14.instance.BannerBackground.BannerLabel.TextSize = p14:_get_text_size()
end
function v7._hook_font_size_update(p_u_15)
    p_u_15.instance.BannerBackground:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        if p_u_15.instance.Enabled then
            p_u_15:_update_text_size()
        end
    end)
end
function v7.set_text(p_u_16, p17)
    v_u_4.on_text_bounds({
        ["FontFace"] = p_u_16.instance.BannerBackground.BannerLabel.FontFace,
        ["FontSize"] = p_u_16:_get_text_size(),
        ["Text"] = p17
    }, function(p18)
        local v19 = p18.X
        p_u_16.instance.BannerBackground.BannerLabel.Size = UDim2.new(0, v19, 1, 0)
        p_u_16.text_width = v19
    end)
    p_u_16.instance.BannerBackground.BannerLabel.Text = p17
end
function v7.show(p20)
    p20:_update_text_size()
    p20.instance.Enabled = true
end
function v7.hide(p21)
    p21.instance.Enabled = false
end
function v7._start_scrolling(p_u_22)
    local v_u_23 = 0
    local v_u_24 = os.clock()
    v_u_6.newConnect(v_u_2.Heartbeat, function()
        v_u_23 = (os.clock() - v_u_24) * 75
        p_u_22.instance.BannerBackground.BannerLabel.Position = UDim2.new(1, -v_u_23, 0.5, 0)
        if v_u_23 > p_u_22.instance.BannerBackground.AbsoluteSize.X + p_u_22.text_width then
            v_u_24 = os.clock()
        end
    end):WithProperty(p_u_22.instance, "Enabled")
end
function v7.start(p25)
    p25:set_text(v_u_8)
    p25:_hook_font_size_update()
    p25:_start_scrolling()
end
return v7