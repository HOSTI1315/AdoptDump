--// ReplicatedStorage.SharedModules.Game.InteriorWeatherHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("SoundDB")
local v_u_3 = v_u_1("HouseDB")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("ServerStorage")
local v6 = {}
local v_u_7 = nil
local function v_u_26()
    local v8 = {}
    local v9 = {}
    for _, v10 in v_u_3 do
        v8[v10.model_name] = v10
    end
    for _, v11 in v_u_5.Downloadable.Interiors:GetChildren() do
        local v12 = v11.Name
        local v13 = v8[v11.Name]
        if v13 then
            v12 = "housing!" .. v13.kind
        end
        local v14 = v11:GetAttribute("DayLighting")
        local v15 = v11:GetAttribute("NightLighting")
        local v16 = v11:GetAttribute("DayMusic")
        local v17 = v11:GetAttribute("NightMusic")
        if v14 then
            local v18 = v_u_5.Settings.Lighting:FindFirstChild(v14)
            local v19 = ("No lighting exists by name %* for the interior: %*"):format(v14, v11.Name)
            assert(v18, v19)
        end
        if v15 then
            local v20 = v_u_5.Settings.Lighting:FindFirstChild(v15)
            local v21 = ("No lighting exists by name %* for the interior: %*"):format(v15, v11.Name)
            assert(v20, v21)
        end
        if v16 then
            local v22 = v_u_2[v16]
            local v23 = ("No music exists by name %* for the interior: %*"):format(v16, v11.Name)
            assert(v22, v23)
        end
        if v17 then
            local v24 = v_u_2[v17]
            local v25 = ("No music exists by name %* for the interior: %*"):format(v17, v11.Name)
            assert(v24, v25)
        end
        if v14 or (v15 or (v16 or v17)) then
            v9[v12] = {
                ["day_lighting"] = v14,
                ["night_lighting"] = v15,
                ["day_music"] = v16,
                ["night_music"] = v17
            }
        end
    end
    return v9
end
function v6.get_interior_weather_serialized()
    return v_u_7
end
function v6.init()
    if v_u_4:IsServer() then
        v_u_7 = v_u_26()
    else
        v_u_7 = v_u_1("RouterClient").get("WeatherAPI/SendSerializedInteriorWeather").OnClientEvent:Wait()
    end
end
return v6