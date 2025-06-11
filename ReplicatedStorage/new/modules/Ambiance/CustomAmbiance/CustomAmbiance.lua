--// ReplicatedStorage.new.modules.Ambiance.CustomAmbiance (ModuleScript)

local v_u_1 = require(script.Parent.AmbianceDB)
local v_u_2 = require(script.Parent.AmbiancePropertyHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = require(script.Parent.Parent.LegacyLoad)
local v_u_5 = v_u_4("Maid")
local v_u_6 = v_u_4("WeatherDB")
local v_u_7 = v_u_4("WeatherClient")
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new(p9, p_u_10, p11, p12)
    local v13 = v_u_4("InteriorsM")
    local v14 = v_u_1[p9]
    local v15 = v14 ~= nil
    local v16 = "Ambiance entry not found: " .. p9
    assert(v15, v16)
    local v17 = v_u_5.new()
    v17:GiveTask(function()
        v_u_7.remove_lighting(p_u_10, true)
        v_u_2.set_camera_particles(false)
    end)
    local v18 = nil
    local v19
    if v14.use_live_weather then
        v18 = v14.live_weather_time or p12
        local v20 = v13.get_current_location()
        v19 = v_u_7.get_weather_preset(v20, v14.live_weather_time)
    else
        v19 = v14.weather
        if v19 then
            v19 = v14.weather.preset
        end
    end
    local v21 = {
        ["maid"] = v17,
        ["priority"] = p_u_10,
        ["ambiance_kind"] = p9,
        ["preset"] = v19 or v_u_6.DAY.preset,
        ["time_of_day"] = v18,
        ["custom_props"] = {},
        ["default_values"] = {}
    }
    local v22 = v_u_8
    local v23 = setmetatable(v21, v22)
    v23.default_values = v23:_generate_defaults()
    v23:initialize_properties()
    v23:set_properties(p11)
    return v23
end
function v_u_8._generate_defaults(p24)
    local v25 = v_u_1[p24.ambiance_kind]
    local v26
    if v25 and v25.defaults then
        v26 = v_u_2.filter_to_whitelisted_properties(v25.defaults)
    else
        v26 = nil
    end
    local v27 = v_u_7.get_lighting_preset(p24.preset)
    local v28 = {}
    for v29, v30 in v_u_2.get_whitelisted_properties() do
        v28[v29] = v28[v29] or {}
        local v31
        if v29 == "Lighting" then
            v31 = v27.lighting_props
        else
            v31 = v27.lighting_effect_instances[v29]
            if v31 then
                v31 = v31.props
            end
        end
        for v32, v33 in v30 do
            local v34
            if v31 then
                v34 = v31[v32]
            else
                v34 = v31
            end
            if v34 == nil and v26 then
                v34 = v26[v29]
                if v34 then
                    v34 = v26[v29][v32]
                end
            end
            if v34 == nil then
                v34 = v33.default
            end
            if v34 == nil then
                if v33.type == "Slider" then
                    v34 = v33.range.Min
                elseif v33.type == "ColorPicker" then
                    v34 = Color3.new(1, 1, 1)
                elseif v33.type == "Switch" then
                    v34 = false
                end
            end
            if v33 and v33.modify then
                v34 = v33.modify(v34)
            end
            v28[v29][v32] = v34
        end
    end
    return v28
end
function v_u_8.initialize_properties(p35)
    local v36 = {}
    for v37, v38 in v_u_2.get_whitelisted_properties() do
        v36[v37] = v_u_3.Dictionary.keys(v38)
    end
    p35:reset_properties(v36)
end
function v_u_8.reset_properties(p39, p40)
    local v41 = {}
    for v42, v43 in p40 do
        v41[v42] = v41[v42] or {}
        for _, v44 in v43 do
            v41[v42][v44] = p39:get_default(v42, v44)
        end
    end
    p39:set_properties(v41)
end
function v_u_8.set_properties(p45, p46)
    if p46 then
        local v47 = v_u_2.filter_to_whitelisted_properties(p46)
        local v48 = {}
        local v49 = {}
        for v50, v51 in p45.default_values do
            for v52, v56 in v51 do
                local v54 = p45.custom_props[v50]
                if v54 then
                    v54 = p45.custom_props[v50][v52]
                end
                local v55 = v47[v50]
                if v55 then
                    v55 = v47[v50][v52]
                end
                local v56
                if v55 == nil then
                    if v54 ~= nil then
                        v56 = v54
                    end
                else
                    v56 = v55
                end
                local v57 = v56 ~= v54
                if v57 then
                    p45.custom_props[v50] = p45.custom_props[v50] or {}
                    p45.custom_props[v50][v52] = v56
                else
                    v56 = v54
                end
                local v58 = v_u_2.get_entry(v50, v52)
                if v58 and v58.modify then
                    v56 = v58.modify(v56)
                end
                local v59 = v_u_2.get_custom_setter(v50, v52)
                if v59 == nil then
                    if v50 == "Lighting" then
                        v48[v52] = v56
                    else
                        v49[v50] = v49[v50] or {
                            ["class_name"] = v50,
                            ["props"] = {}
                        }
                        v49[v50].props[v52] = v56
                    end
                elseif v57 then
                    local v60 = v59(v56)
                    local v61 = p45.custom_props[v50]
                    if v60 ~= nil then
                        v56 = v60
                    end
                    v61[v52] = v56
                end
            end
        end
        local v62 = {
            ["preset"] = p45.preset,
            ["custom_lighting_props"] = v48,
            ["custom_effect_props"] = v49
        }
        v_u_7.change_weather(p45.priority, v62, true)
    end
end
function v_u_8.get_live_property(p63, p64, p65)
    local v66 = v_u_2.get_custom_getter(p64, p65)
    local v67
    if v66 == nil then
        v67 = nil
    else
        v67 = v66()
    end
    if v67 == nil then
        v67 = v_u_7.get_current_property(p64, p65)
    end
    if v67 == nil then
        v67 = p63:get_property(p64, p65)
    end
    return v67
end
function v_u_8.get_property(p68, p69, p70)
    local v71 = p68.custom_props[p69]
    if v71 then
        v71 = p68.custom_props[p69][p70]
    end
    return v71
end
function v_u_8.has_overrides(p72)
    for v73, v74 in p72.custom_props do
        for v75, v76 in v74 do
            local v77 = p72:get_default(v73, v75)
            if v76 ~= v77 then
                local v78 = v_u_2.get_entry(v73, v75)
                if not v78 or (not v78.modify or v77 ~= v78.modify(v76)) then
                    return true
                end
            end
        end
    end
    return false
end
function v_u_8.get_default(p79, p80, p81)
    local v82 = p79.default_values[p80]
    if v82 then
        v82 = p79.default_values[p80][p81]
    end
    return v82
end
function v_u_8.serialize(p83)
    return {
        ["kind"] = p83.ambiance_kind,
        ["time"] = p83.time_of_day,
        ["priority"] = p83.priority,
        ["custom_props"] = p83.custom_props
    }
end
function v_u_8.deserialize(p84)
    return v_u_8.new(p84.kind, p84.priority, p84.custom_props, p84.time)
end
function v_u_8.destroy(p85)
    p85.maid:DoCleaning()
end
return v_u_8