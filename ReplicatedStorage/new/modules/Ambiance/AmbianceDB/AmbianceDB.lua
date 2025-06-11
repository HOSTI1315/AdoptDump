--// ReplicatedStorage.new.modules.Ambiance.AmbianceDB (ModuleScript)

local v1 = {
    ["live"] = {
        ["name"] = "Live",
        ["order"] = 0,
        ["use_live_weather"] = true
    },
    ["day"] = {
        ["name"] = "Day",
        ["icon"] = "rbxassetid://125325153346461",
        ["order"] = 1,
        ["use_live_weather"] = true,
        ["live_weather_time"] = "DAY"
    },
    ["night"] = {
        ["name"] = "Night",
        ["icon"] = "rbxassetid://74105351019178",
        ["order"] = 2,
        ["use_live_weather"] = true,
        ["live_weather_time"] = "NIGHT"
    }
}
local v2 = {
    ["name"] = "Rain",
    ["icon"] = "rbxassetid://125092104691986",
    ["order"] = 3,
    ["weather"] = {
        ["preset"] = "A_Rain_Day"
    }
}
local v3 = {
    ["Custom"] = {
        ["Rain"] = true
    }
}
v2.defaults = v3
v1.rain = v2
local v4 = {
    ["name"] = "Snow",
    ["icon"] = "rbxassetid://111682352542348",
    ["order"] = 4,
    ["weather"] = {
        ["preset"] = "A_Winter_Day"
    }
}
local v5 = {
    ["Custom"] = {
        ["Snow"] = true
    }
}
v4.defaults = v5
v1.snow = v4
local v6 = {
    ["name"] = "Fog",
    ["icon"] = "rbxassetid://72699903144700",
    ["order"] = 5,
    ["weather"] = {
        ["preset"] = "A_Fog_Day"
    }
}
v1.fog = v6
local v7 = {
    ["name"] = "Sunset",
    ["icon"] = "rbxassetid://134879278992410",
    ["order"] = 6,
    ["weather"] = {
        ["preset"] = "A_Fall_Day"
    }
}
local v8 = {
    ["Custom"] = {
        ["Leaves"] = true
    }
}
v7.defaults = v8
v1.sunset = v7
for v9, v10 in v1 do
    v10.kind = v9
end
return v1