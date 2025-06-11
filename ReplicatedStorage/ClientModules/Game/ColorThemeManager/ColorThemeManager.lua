--// ReplicatedStorage.ClientModules.Game.ColorThemeManager (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("TableUtil")
local v_u_3 = v1("ColorThemeDB")
local v_u_4 = v1("SettingsHelper")
local v5 = v1("Signal")
local v_u_6 = v1("Debug").create_log()
local v_u_7 = {
    ["ImageLabel"] = { "BackgroundColor3", "ImageColor3", "BorderColor3" },
    ["ImageButton"] = { "BackgroundColor3", "ImageColor3", "BorderColor3" },
    ["TextButton"] = { "BackgroundColor3", "BorderColor3", "TextColor3" },
    ["TextBox"] = {
        "BackgroundColor3",
        "BorderColor3",
        "TextColor3",
        "PlaceholderColor3"
    },
    ["TextLabel"] = { "BackgroundColor3", "BorderColor3", "TextColor3" },
    ["Frame"] = { "BackgroundColor3", "BorderColor3" },
    ["CanvasGroup"] = { "GroupColor3", "BackgroundColor3", "BorderColor3" },
    ["ScrollingFrame"] = { "BackgroundColor3", "BorderColor3", "ScrollBarImageColor3" },
    ["UIStroke"] = { "Color" }
}
local v8 = {}
local v_u_9 = "pink"
local v_u_10 = nil
local v_u_11 = {}
local v_u_12 = v5.new()
local v_u_13 = { "PartyInvitationApp", "PlayerProfileApp" }
local function v_u_26(p14, p15)
    local v16 = {}
    for _, v17 in pairs(v_u_2.append_elements_to_table(p14:GetDescendants(), { p14 })) do
        local v18 = v_u_7[v17.ClassName]
        if v18 then
            for _, v19 in pairs(v18) do
                local v20 = v17[v19]
                for v21, v22 in pairs(v_u_3.themes[p15]) do
                    local v23 = v20.r - v22.r
                    if math.abs(v23) < 0.0003921568627451 then
                        local v24 = v20.g - v22.g
                        if math.abs(v24) < 0.0003921568627451 then
                            local v25 = v20.b - v22.b
                            if math.abs(v25) < 0.0003921568627451 then
                                table.insert(v16, { v17, v19, v21 })
                            end
                        end
                    end
                end
            end
        end
    end
    return v16
end
local function v_u_34(p27, p28)
    local v29 = {}
    for _, v30 in pairs(v_u_13) do
        if p27:FindFirstChild(v30) then
            local v31 = p27[v30]
            table.insert(v29, v31)
            p27[v30].Parent = nil
        end
    end
    local v32 = v_u_26(p27, p28)
    for _, v33 in pairs(v29) do
        v33.Parent = p27
    end
    return v32
end
local function v_u_42(p35, p36)
    local v37 = v_u_3.themes[p36]
    for _, v38 in pairs(p35) do
        local v39 = v38[1]
        local v40 = v38[2]
        local v41 = v38[3]
        if not v39:GetAttribute("skip_color_theme") then
            v39[v40] = v37[v41]
        end
    end
end
function v8.set_theme_color_for_instance(p43, p44, p45)
    local v46 = v_u_2.is_member
    local v47 = v_u_13
    local v48 = p43.ClassName
    assert(v46(v47, v48))
    local v49 = p44:GetAttribute("ThemeColor") or "pink"
    p44:SetAttribute("ThemeColor", p45)
    v_u_42(v_u_26(p44, v49), p45)
end
function v8.set_theme_color_for_specific_app(p50, p51)
    v_u_6("Inputting class", p50.ClassName)
    local v52 = v_u_2.is_member
    local v53 = v_u_13
    local v54 = p50.ClassName
    assert(v52(v53, v54))
    v_u_11[p50.ClassName] = v_u_11[p50.ClassName] or v_u_26(p50.instance, "pink")
    v_u_42(v_u_11[p50.ClassName], p51)
end
function v8.get_theme_color()
    return v_u_9
end
function v8.set_theme_color(p55)
    v_u_42(v_u_34(game.Players.LocalPlayer.PlayerGui, v_u_9), p55)
    v_u_42(v_u_10, p55)
    v_u_9 = p55
end
function v8.lookup(p56)
    local v57 = v_u_3.themes[v_u_9][p56]
    assert(v57, "invalid color_type:", p56)
    return v57
end
function v8.lookup_specific_color(p58, p59)
    local v60 = v_u_3.themes[p58]
    assert(v60, "invalid specific_theme_color:", p58)
    local v61 = v60[p59]
    assert(v61, "invalid color_type:", p59)
    return v61
end
function v8.get_theme_changed_signal()
    return v_u_12
end
function v8.get_theme_color()
    return v_u_9
end
function v8.exclude_instance_from_color_themeing(p62)
    p62:SetAttribute("skip_color_theme", true)
end
function v8.start(p63)
    v_u_10 = v_u_34(p63, "pink")
    local v64 = v_u_4.get_setting_server({
        ["setting_id"] = "theme_color"
    })
    if v64 ~= "pink" then
        v_u_9 = v64
        v_u_42(v_u_10, v_u_9)
    end
end
return v8