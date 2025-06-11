--// ReplicatedStorage.ClientDB.WeatherDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("InteriorWeatherHelper")
local v3 = v1("ContentPackHelper")
local v4 = v1("SoundDB")
local v5 = {
    ["DAY"] = {
        ["preset"] = "A_Default_Day",
        ["music"] = v4.AdoptMeDayTheme,
        ["transition_times_from"] = {
            ["NIGHT"] = 10
        }
    },
    ["NIGHT"] = {
        ["preset"] = "A_Default_Night",
        ["music"] = v4.AdoptMeNightTheme,
        ["transition_times_from"] = {
            ["DAY"] = 10
        }
    },
    ["DEFAULT_INTERIOR_LIGHTING"] = {
        ["day_preset"] = "Interior Day Default",
        ["night_preset"] = "Interior Night Default"
    },
    ["CRIB_SLEEP"] = {
        ["day_preset"] = "Crib sleep",
        ["night_preset"] = "Crib sleep night"
    },
    ["HOUSING"] = {
        ["day_music"] = v4.AdoptMeDayTheme,
        ["night_music"] = v4.AdoptMeNightTheme,
        ["day_preset"] = "House Interior Daytime",
        ["night_preset"] = "House Interior Night"
    },
    ["SHOWER"] = {
        ["preset"] = "Shower"
    },
    ["NurseryGarden"] = {
        ["day_music"] = v4.AdoptMeDayTheme,
        ["night_music"] = v4.AdoptMeNightTheme,
        ["day_preset"] = "A_Default_Day",
        ["night_preset"] = "A_Default_Night"
    },
    ["NurseryMoon"] = {
        ["day_music"] = v4.AdoptMeDayTheme,
        ["night_music"] = v4.AdoptMeNightTheme,
        ["day_preset"] = "A_Default_Night_No_Moon",
        ["night_preset"] = "Moon_Night"
    }
}
v3.merge("Weather", v5)
for v6, v7 in v2.get_interior_weather_serialized() do
    local v8 = not v5[v6]
    local v9 = "There\'s a collision between manual weather DB entries and interior attributes for weather on " .. v6
    assert(v8, v9)
    local v10 = {
        ["day_preset"] = v7.day_lighting,
        ["night_preset"] = v7.night_lighting
    }
    local v11
    if v7.day_music then
        v11 = v4[v7.day_music]
    else
        v11 = nil
    end
    v10.day_music = v11
    local v12
    if v7.night_music then
        v12 = v4[v7.night_music]
    else
        v12 = nil
    end
    v10.night_music = v12
    v5[v6] = v10
end
for v13, v14 in v5 do
    v14.id = v13
end
return v5