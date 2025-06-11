--// ReplicatedStorage.new.modules.Ambiance.AmbiancePropertyHelper (ModuleScript)

local v_u_1 = game:GetService("LocalizationService")
local v_u_2 = require(script.Parent.Parent.LegacyLoad)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.t)
local function v_u_8(p5, p6)
    local v7 = v_u_2("CameraParticlesClient")
    if p5 and v_u_2("CameraParticlesClient").get_active_camera_particle_kind() ~= p6 then
        v7.set_camera_particles("CustomAmbiance", 3, p6)
    elseif not p5 and (p6 == nil or v_u_2("CameraParticlesClient").get_active_camera_particle_kind() == p6) then
        v7.remove_camera_particles("CustomAmbiance")
    end
end
local function v12(p_u_9, p10)
    return v_u_3.Dictionary.merge({
        ["type"] = "Switch",
        ["validation"] = v_u_4.boolean,
        ["custom_set"] = function(p11)
            v_u_8(p11, p_u_9)
        end,
        ["custom_get"] = function()
            return p_u_9 == v_u_2("CameraParticlesClient").get_active_camera_particle_kind()
        end
    }, p10)
end
local function v25(p13)
    local v14 = v_u_3.Dictionary.merge({
        ["type"] = "Slider",
        ["range"] = NumberRange.new(0, 1),
        ["show_as_percentage"] = true,
        ["validation"] = v_u_4.number
    }, p13)
    local function v17(p15)
        local v16 = p15 * 100
        return math.round(v16) / 100
    end
    local v_u_18 = v14.modify
    if v_u_18 then
        function v14.modify(p19)
            local v20 = p19 * 100
            return v_u_18(math.round(v20) / 100)
        end
    else
        v14.modify = v17
    end
    local v21 = v14.range.Min * 100
    local v22 = math.round(v21) / 100
    local v23 = v14.range.Max * 100
    local v24 = math.round(v23) / 100
    v14.validation = p13.validation or v_u_4.intersection(v14.validation, v_u_4.numberMin(v22), v_u_4.numberMax(v24))
    return v14
end
local v_u_26 = {}
local v30 = {
    ["ClockTime"] = v25({
        ["name"] = "TIME OF DAY",
        ["range"] = NumberRange.new(0, 24),
        ["interval"] = 0.5,
        ["color"] = Color3.fromRGB(43, 42, 46),
        ["icon"] = "rbxassetid://74957143603830",
        ["icon_size"] = UDim2.fromOffset(18, 18),
        ["show_as_percentage"] = false,
        ["slider_formatter"] = function(p27)
            local v28 = p27 * 10
            local v29 = math.round(v28) / 10
            return DateTime.fromUnixTimestamp(v29 * 3600):FormatUniversalTime("LT", v_u_1:GetTranslatorForPlayer(game.Players.LocalPlayer).LocaleId)
        end
    })
}
local v31 = {
    ["name"] = "AMBIENT",
    ["color"] = Color3.fromRGB(226, 60, 64),
    ["icon"] = "rbxassetid://72875095286105",
    ["description"] = "Color of indoor shadows"
}
v30.Ambient = v_u_3.Dictionary.merge({
    ["type"] = "ColorPicker",
    ["validation"] = v_u_4.Color3
}, v31)
local v32 = {
    ["name"] = "OUTDOOR AMBIENT",
    ["color"] = Color3.fromRGB(117, 170, 255),
    ["icon"] = "rbxassetid://111839263905327",
    ["icon_size"] = UDim2.fromOffset(21, 19),
    ["description"] = "Color of light from the sky"
}
v30.OutdoorAmbient = v_u_3.Dictionary.merge({
    ["type"] = "ColorPicker",
    ["validation"] = v_u_4.Color3
}, v32)
local v33 = {
    ["name"] = "SUNLIGHT TINT",
    ["color"] = Color3.fromRGB(236, 181, 61),
    ["icon"] = "rbxassetid://103756643227151",
    ["description"] = "Color of areas hit by sunlight"
}
v30.ColorShift_Top = v_u_3.Dictionary.merge({
    ["type"] = "ColorPicker",
    ["validation"] = v_u_4.Color3
}, v33)
v30.ExposureCompensation = v25({
    ["name"] = "EXPOSURE COMPENSATION",
    ["range"] = NumberRange.new(-2, 2),
    ["color"] = Color3.fromRGB(43, 42, 46),
    ["icon"] = "rbxassetid://123893899096139"
})
v_u_26.Lighting = v30
local v34 = {
    ["Density"] = v25({
        ["name"] = "DENSITY",
        ["range"] = NumberRange.new(0, 0.9),
        ["default"] = 0,
        ["color"] = Color3.fromRGB(226, 60, 64),
        ["icon"] = "rbxassetid://86835362181602"
    })
}
local v35 = {
    ["name"] = "ATMOSPHERE COLOR",
    ["color"] = Color3.fromRGB(43, 42, 46),
    ["default"] = Color3.fromRGB(255, 255, 255),
    ["icon"] = "rbxassetid://132990520333175",
    ["description"] = "Color of fog"
}
v34.Color = v_u_3.Dictionary.merge({
    ["type"] = "ColorPicker",
    ["validation"] = v_u_4.Color3
}, v35)
v34.Glare = v25({
    ["name"] = "GLARE",
    ["range"] = NumberRange.new(0, 2),
    ["default"] = 0,
    ["color"] = Color3.fromRGB(236, 181, 61),
    ["icon"] = "rbxassetid://74323548705558"
})
v34.Haze = v25({
    ["name"] = "HAZE",
    ["range"] = NumberRange.new(2, 3),
    ["default"] = 2,
    ["color"] = Color3.fromRGB(117, 170, 255),
    ["icon"] = "rbxassetid://78317398816349",
    ["validation"] = v_u_4.intersection(v_u_4.numberMin(0), v_u_4.numberMax(3))
})
v_u_26.Atmosphere = v34
local v36 = {
    ["Contrast"] = v25({
        ["name"] = "CONTRAST",
        ["range"] = NumberRange.new(-0.8, 1),
        ["color"] = Color3.fromRGB(226, 60, 64),
        ["icon"] = "rbxassetid://110158459475440"
    }),
    ["Saturation"] = v25({
        ["name"] = "SATURATION",
        ["range"] = NumberRange.new(-1, 1),
        ["color"] = Color3.fromRGB(117, 170, 255),
        ["icon"] = "rbxassetid://116663214044619"
    })
}
local v41 = {
    ["name"] = "TINT COLOR",
    ["color"] = Color3.fromRGB(236, 181, 61),
    ["icon"] = "rbxassetid://71281585993325",
    ["modify"] = function(p37)
        local v38, v39, v40 = p37:ToHSV()
        return Color3.fromHSV(v38, math.min(0.5098039215686274, v39), (math.max(0.7843137254901961, v40)))
    end
}
v36.TintColor = v_u_3.Dictionary.merge({
    ["type"] = "ColorPicker",
    ["validation"] = v_u_4.Color3
}, v41)
v_u_26.ColorCorrectionEffect = v36
local v42 = {
    ["Intensity"] = v25({
        ["name"] = "SUN RAYS",
        ["range"] = NumberRange.new(0, 0.6),
        ["color"] = Color3.fromRGB(236, 181, 61),
        ["icon"] = "rbxassetid://123893899096139"
    })
}
v_u_26.SunRaysEffect = v42
local v43 = {
    ["Snow"] = v12("WinterSnow", {
        ["name"] = "SNOW",
        ["description"] = "Enables snow particles",
        ["color"] = Color3.fromRGB(43, 42, 46),
        ["icon"] = "rbxassetid://75949873854243"
    }),
    ["Rain"] = v12("RainDrops", {
        ["name"] = "RAIN",
        ["description"] = "Enables rain particles",
        ["color"] = Color3.fromRGB(117, 170, 255),
        ["icon"] = "rbxassetid://109925690274274"
    }),
    ["Leaves"] = v12("FallLeaves", {
        ["name"] = "LEAVES",
        ["description"] = "Enables leaf particles",
        ["color"] = Color3.fromRGB(226, 60, 64),
        ["icon"] = "rbxassetid://110670396833520"
    })
}
v_u_26.Custom = v43
for v44, v45 in v_u_26 do
    for v46, v47 in v45 do
        v47.parent_property = v44
        v47.property = v46
    end
end
local v_u_68 = {
    ["get_entry"] = function(p48, p49)
        if v_u_26[p48] == nil then
            return nil
        else
            return v_u_26[p48][p49]
        end
    end,
    ["get_custom_setter"] = function(p50, p51)
        local v52 = v_u_68.get_entry(p50, p51)
        if v52 then
            v52 = v52.custom_set
        end
        return v52
    end,
    ["get_custom_getter"] = function(p53, p54)
        local v55 = v_u_68.get_entry(p53, p54)
        if v55 then
            v55 = v55.custom_get
        end
        return v55
    end,
    ["get_whitelisted_properties"] = function()
        return v_u_26
    end,
    ["validate"] = function(p56, p57, p58)
        local v59 = v_u_68.get_entry(p56, p57)
        if not v59 then
            return false
        end
        if v59.modify then
            p58 = v59.modify(p58)
        end
        local v60, v61 = v59.validation(p58)
        if v60 then
            return true
        end
        warn((("Property: %*.%* (%*) is invalid: %*"):format(p56, p57, p58, v61)))
        return false
    end,
    ["filter_to_whitelisted_properties"] = function(p62)
        return v_u_3.Dictionary.map(p62, function(p63, p_u_64)
            if v_u_26[p_u_64] == nil then
                return nil
            else
                local v67 = v_u_3.Dictionary.filter(p63, function(p65, p66)
                    return v_u_68.validate(p_u_64, p66, p65)
                end)
                if next(v67) == nil then
                    return nil
                else
                    return v67
                end
            end
        end)
    end,
    ["set_camera_particles"] = v_u_8
}
return v_u_68