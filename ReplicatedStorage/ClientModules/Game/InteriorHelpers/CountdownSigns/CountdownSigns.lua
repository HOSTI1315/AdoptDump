--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.CountdownSigns (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("LiveOpsTime")
local v_u_3 = v_u_1("SharedConstants")
local v_u_4 = v_u_1("ThemeAreaHelper")
local v_u_5 = v_u_1("FormatHelper")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = v_u_1("Maid")
local v_u_8 = {}
local v_u_9 = {
    ["countdown_time"] = v_u_3.theme_area.end_date,
    ["countdown_text"] = "Pets Leaving In:"
}
local function v_u_13(p10, p11)
    local v12 = v_u_1("GrammarUtil")
    if p10.days > 0 then
        return string.format("%d %s", p10.days, v12.get_plural_or_singular(p10.days, "Days", "Day"))
    elseif p10.hours >= 12 then
        return string.format("%d %s", p10.hours, v12.get_plural_or_singular(p10.hours, "Hours", "Hour"))
    elseif p10.minutes >= 10 then
        return ("%01d:%02d:%02d"):format(p10.hours, p10.minutes, p10.seconds)
    else
        return p11
    end
end
function v_u_8.render_sign(p14, p_u_15, p_u_16)
    local v_u_21 = v_u_6.new(function(_, _, p17)
        if p_u_15:FindFirstChild("Countdown") ~= nil then
            while not p17() do
                local v18 = p_u_16.countdown_time - v_u_2.now()
                local v19 = math.max(0, v18)
                local v20 = v_u_13(v_u_5.get_time_breakdown(v19), p_u_16.leaving_soon_text or "SOON!")
                if p_u_16.countdown_format_string and (p_u_16.leaving_soon_text == nil or (v20 ~= p_u_16.leaving_soon_text or not p_u_16.ignore_format_when_leaving_soon)) then
                    v20 = p_u_16.countdown_format_string:format(v20)
                end
                if p_u_16.countdown_text then
                    if p_u_16.force_uppercase ~= false then
                        p_u_16.countdown_text = string.upper(p_u_16.countdown_text)
                    end
                    p_u_15.CountdownText.Text = string.upper(p_u_16.countdown_text)
                end
                if p_u_16.force_uppercase ~= false then
                    v20 = string.upper(v20)
                end
                p_u_15.Countdown.Text = v20
                task.wait(1)
            end
        end
    end)
    p14.timer_sign_maid = p14.timer_sign_maid or v_u_7.new()
    p14.timer_sign_maid:GiveTask(function()
        v_u_21:cancel()
    end)
end
function v_u_8.render(p22, p23)
    for _, v24 in p22.GenericStands:GetChildren() do
        local v25 = v24:FindFirstChildWhichIsA("SurfaceGui", true)
        if v25 then
            local v26 = v_u_3[v24.Name]
            if v26 then
                if v26.sign_settings then
                    v_u_8.render_sign(p23, v25, v26.sign_settings)
                else
                    warn("No sign_settings in SharedConstants entry found for generic sign " .. v24.Name)
                end
            else
                warn("No SharedConstants entry found for generic sign " .. v24.Name)
            end
        else
            warn("No SurfaceGui found for generic sign " .. v24.Name)
        end
    end
    if v_u_4.is_active() then
        local v27 = p22.ThemeArea:FindFirstChild("Sign")
        if not v27 then
            return
        end
        local v28 = v27:FindFirstChildWhichIsA("SurfaceGui", true)
        v_u_8.render_sign(p23, v28, v_u_9)
    end
end
function v_u_8.cleanup(_, p29)
    if p29.timer_sign_maid then
        p29.timer_sign_maid:Destroy()
        p29.timer_sign_maid = nil
    end
end
return v_u_8