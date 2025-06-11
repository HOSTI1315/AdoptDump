--// ReplicatedStorage.ClientModules.Core.WeatherClient.WeatherClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v3 = v1("DelayedUpdateBuffer")
local v_u_4 = v1("HouseDB")
local v_u_5 = v1("Music")
local v_u_6 = v1("WeatherDB")
local v_u_7 = v1("RouterClient")
local v_u_8 = v1("WeatherState")
local v9 = v1("Signal")
local v10 = v1("Maid")
local v_u_11 = v1("package:Sift")
local v_u_12 = {
    ["TransitionBlur"] = true
}
local v_u_13 = {
    ["BloomEffect"] = {
        ["Intensity"] = 0
    },
    ["BlurEffect"] = {
        ["Size"] = 0
    },
    ["ColorCorrectionEffect"] = {
        ["Brightness"] = 0,
        ["Contrast"] = 0,
        ["Saturation"] = 0,
        ["TintColor"] = Color3.fromRGB(255, 255, 255)
    },
    ["DepthOfFieldEffect"] = {
        ["NearIntensity"] = 0,
        ["FarIntensity"] = 0
    },
    ["SunRaysEffect"] = {
        ["Intensity"] = 0
    },
    ["Sky"] = {
        ["CelestialBodiesShown"] = true,
        ["MoonAngularSize"] = 11,
        ["MoonTextureId"] = "rbxasset://sky/moon.jpg",
        ["SkyboxBk"] = "rbxasset://textures/sky/sky512_bk.tex",
        ["SkyboxDn"] = "rbxasset://textures/sky/sky512_dn.tex",
        ["SkyboxFt"] = "rbxasset://textures/sky/sky512_ft.tex",
        ["SkyboxLf"] = "rbxasset://textures/sky/sky512_lf.tex",
        ["SkyboxRt"] = "rbxasset://textures/sky/sky512_rt.tex",
        ["SkyboxUp"] = "rbxasset://textures/sky/sky512_up.tex",
        ["StarCount"] = 3000,
        ["SunAngularSize"] = 21,
        ["SunTextureId"] = "rbxasset://sky/sun.jpg"
    },
    ["Atmosphere"] = {
        ["Density"] = 0,
        ["Offset"] = 0,
        ["Color"] = Color3.new(1, 1, 1),
        ["Decay"] = Color3.new(1, 1, 1),
        ["Glare"] = 0,
        ["Haze"] = 0
    }
}
local v_u_14 = {
    ["Atmosphere"] = true
}
local v_u_15 = {}
local v_u_16 = v_u_8.new()
local v_u_17 = nil
local v_u_18 = game:GetService("TweenService")
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = v9.new()
local v_u_22 = v10.new()
local v_u_23 = v3.new()
local function v_u_27(p24)
    for v25, v26 in pairs(v_u_20) do
        if v_u_14[v25] and not p24.lighting_effect_instances[v25] then
            v26:Destroy()
            v_u_20[v25] = nil
        end
    end
end
local function v_u_39(p28, p29)
    local v30 = {}
    for v31, v32 in pairs(p28.lighting_effect_instances) do
        if not v_u_20[v31] then
            v30[v31] = v32
        end
    end
    for v33, v34 in pairs(v30) do
        local v35 = Instance.new(v34.class_name)
        for v36, v37 in pairs(v34.props) do
            if p29 then
                v35[v36] = v_u_13[v34.class_name][v36]
            else
                v35[v36] = v37
            end
        end
        if v35:IsA("PostEffect") then
            local v38 = v34.props.Enabled
            v35.Enabled = v38 == nil and true or v38
        end
        v35.Name = "Weather_" .. v33
        v35.Parent = game.Lighting
        v_u_20[v33] = v35
    end
end
local function v_u_47(p40, p41, p42, p43)
    local v44 = v_u_20[p40]
    if v44 then
        if p42 == 0 or (p43 == "Sky" or p43 == "Atmosphere") then
            for v45, v46 in pairs(p41) do
                v44[v45] = v46
            end
            return
        end
        v_u_18:Create(v44, TweenInfo.new(p42, Enum.EasingStyle.Linear), p41):Play()
        if p41.Enabled ~= nil then
            v44.Enabled = p41.Enabled
            return
        end
        v44.Enabled = true
    end
end
local function v_u_55(p48, p49, p50)
    for v51, v52 in pairs(p48) do
        if not p49[v51] then
            v_u_47(v51, v_u_13[v52.class_name], p50, v52.class_name)
        end
    end
    for v53, v54 in pairs(p49) do
        v_u_47(v53, v54.props, p50, v54.class_name)
    end
end
local function v_u_68(p56, p57, p58)
    local v59 = p56:get_highest_priority_weather()
    local v60 = p57:get_highest_priority_weather()
    local v61 = p57:get_time_of_day()
    local v62 = p57:get_music()
    v_u_5.play(1, v62)
    local v63 = v_u_11.Dictionary.copyDeep(v_u_17[v61 == "DAY" and v60.day_preset or (v61 == "NIGHT" and v60.night_preset or v60.preset)])
    v63.lighting_props = v_u_11.Dictionary.merge(v63.lighting_props, v60.custom_lighting_props)
    v63.lighting_effect_instances = v_u_11.Dictionary.mergeDeep(v63.lighting_effect_instances, v60.custom_effect_props)
    v_u_27(v63)
    v_u_39(v63, not p58)
    v_u_22:DoCleaning()
    if p58 or v59 == nil then
        for v64, v65 in pairs(v63.lighting_props) do
            game.Lighting[v64] = v65
        end
        v_u_55(v_u_19.lighting_effect_instances or {}, v63.lighting_effect_instances, 0)
    else
        local v66 = (v60.transition_times_from or {})[v59.id] or 1
        local v_u_67 = v_u_18:Create(game.Lighting, TweenInfo.new(v66, Enum.EasingStyle.Linear), v63.lighting_props)
        v_u_67:Play()
        v_u_22:GiveTask(function()
            v_u_67:Cancel()
            v_u_67:Destroy()
        end)
        v_u_55(v_u_19.lighting_effect_instances or {}, v63.lighting_effect_instances, v66)
    end
    v_u_19 = v63
end
function v_u_15.get_current_property(p69, p70)
    local v71 = v_u_20[p69]
    if p69 == "Lighting" then
        v71 = game.Lighting
    end
    if v71 ~= nil then
        return v71[p70]
    end
end
function v_u_15.get_time_of_day()
    return v_u_16 and v_u_16:get_time_of_day() or "DAY"
end
function v_u_15.change_weather(p72, p73, p_u_74)
    local v_u_75 = v_u_16
    local v_u_76 = v_u_8.new(v_u_75)
    v_u_16 = v_u_76
    v_u_76:change_weather(p72, p73)
    v_u_21:Fire(v_u_76)
    v_u_23:defer("change_weather", function()
        v_u_68(v_u_75, v_u_76, p_u_74)
    end)
end
function v_u_15.get_weather_id(p77)
    local v78 = p77.destination_id
    local v79 = p77.interior
    local v80 = string.split(v78, "!")
    if v78 == "MainMap" then
        return v79.Name
    end
    local v81
    if v78 == "housing" or v80[1] == "preview_housing" then
        v81 = "HOUSING"
        local v82
        if v80[2] then
            v82 = v80[2]
        else
            v82 = (v_u_2.get("house_interior") or {}).building_type
        end
        if v_u_4[v82] then
            local v83 = "housing!" .. v82
            if v_u_6[v83] then
                return v83
            end
        end
    else
        local v84 = string.match(v79.Name, "(.+)::") or v79.Name
        v81 = not v_u_6[v84] and "DEFAULT_INTERIOR_LIGHTING" or v84
    end
    return v81
end
function v_u_15.get_weather_preset(p85, p86)
    local v87 = v_u_6[v_u_15.get_weather_id(p85)]
    if v87 == nil then
        return nil
    end
    local v88
    if (p86 or v_u_15.get_time_of_day()) == "DAY" then
        v88 = v87.day_preset
    else
        v88 = v87.night_preset
    end
    return v88 or v87.preset
end
function v_u_15.add_interior_lighting(p89, p90, p91)
    local v92 = v_u_6[p90]
    local v93 = "[WeatherClient] " .. p90 .. " doesn\'t exist in WeatherDB"
    assert(v92, v93)
    v_u_15.change_weather(p89, v_u_6[p90], p91)
end
function v_u_15.remove_lighting(p94, p95)
    v_u_15.change_weather(p94, nil, p95)
end
function v_u_15.get_lighting_preset(p96)
    if v_u_17[p96] == nil then
        return nil
    else
        return v_u_11.Dictionary.copyDeep(v_u_17[p96])
    end
end
function v_u_15.init()
    for _, v97 in pairs(game.Lighting:GetChildren()) do
        if (v97:IsA("PostEffect") or (v97:IsA("Sky") or v97:IsA("Atmosphere"))) and not v_u_12[v97.Name] then
            v97:Destroy()
        end
    end
    v_u_17 = v_u_7.get("WeatherAPI/SendLightingPresets").OnClientEvent:Wait()
    coroutine.wrap(function()
        local function v99()
            local v98 = game.Lighting:FindFirstChildWhichIsA("Sky")
            if v98 then
                v98.StarCount = (game.Lighting.ClockTime > 17.5 and true or game.Lighting.ClockTime < 6.5) and 5000 or 0
            end
        end
        game.Lighting.ChildAdded:Connect(v99)
        game.Lighting:GetPropertyChangedSignal("ClockTime"):Connect(v99)
        local v100 = game.Lighting:FindFirstChildWhichIsA("Sky")
        if v100 then
            v100.StarCount = (game.Lighting.ClockTime > 17.5 and true or game.Lighting.ClockTime < 6.5) and 5000 or 0
        end
    end)()
end
v_u_15.weather_changed = v_u_21
return v_u_15