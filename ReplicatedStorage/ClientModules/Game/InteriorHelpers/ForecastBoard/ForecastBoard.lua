--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.ForecastBoard (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("Maid")
local v_u_3 = v1("SharedConstants")
local v_u_4 = v1("FormatHelper")
local v_u_5 = v1("LiveOpsTime")
local v_u_6 = v1("MapForecast")
local v_u_7 = v1("DownloadClient")
local v_u_8 = {
    ["Default"] = "SUNNY",
    ["Desert"] = "DESERT",
    ["Snow"] = "SNOW",
    ["Fall"] = "FALL",
    ["Rain"] = "RAIN",
    ["Halloween"] = "SPOOKY",
    ["Xmas"] = "CHILLY"
}
local v_u_9 = v1("package:Promise")
local v10 = {}
local v_u_11 = v_u_9.resolve()
local v_u_12 = v2.new()
function v10.start(p13)
    if not v_u_3.forecast_override then
        v_u_11:cancel()
        local v14 = v_u_7.download("ForecastAssets", "MapForecast"):Clone()
        local v15 = v14.Board.SurfaceGui
        local v16 = p13:FindFirstChild("MapForecast")
        local v17 = "MapForecast does not exist in interior " .. p13.Name
        assert(v16, v17)
        local v18 = v16:GetPivot()
        v16:Destroy()
        v14:PivotTo(v18)
        v14.Parent = p13
        local v_u_19 = v15.Assets
        local v_u_20 = v15.Background.CurrentWeather
        local v_u_21 = v15.Background.FutureWeather
        v_u_11 = v_u_9.new(function(_, _, p22)
            local v_u_23 = v_u_9.resolve()
            p22(function()
                v_u_23:cancel()
            end)
            while not p22() do
                local v_u_24 = v_u_6.get_unique_forecast(v_u_5.now(), 7)
                local v25 = v_u_8[v_u_24[1].weather] or v_u_8[v_u_24[1].map_type]
                v_u_20.TextLabel.Text = v25
                v_u_20.Icon.Image = v_u_19.Large:FindFirstChild(v_u_24[1].weather).Image
                for v26 = 2, 7 do
                    local v27 = v_u_24[v26]
                    local v28 = v_u_21
                    local v29 = v26 - 1
                    local v30 = v28:FindFirstChild((tostring(v29)))
                    if v27 then
                        v30.Visible = true
                        local v31 = v_u_19.Small:FindFirstChild(v27.weather)
                        v30.Background.ImageColor3 = v31.BackgroundColor3
                        v30.Background.Icon:Destroy()
                        local v32 = v31:Clone()
                        v32.Name = "Icon"
                        v32.Parent = v30.Background
                    else
                        v30.Visible = false
                    end
                end
                local v44 = v_u_9.new(function(_, _, p33)
                    while not p33() do
                        local v34 = v_u_5.now()
                        for v35 = 2, 7 do
                            local v36 = v_u_24[v35]
                            local v37 = v_u_21
                            local v38 = v35 - 1
                            local v39 = v37:FindFirstChild((tostring(v38)))
                            if v36 then
                                v39.Visible = true
                                local v40 = v36.timestamp - v34
                                local v41 = math.max(v40, 0)
                                local v42 = v_u_4.get_time_breakdown(v41)
                                local v43 = v42.hours + v42.days * 24
                                if v43 >= 36 then
                                    v39.TextLabel.Text = ("%s DAYS"):format(v42.days)
                                elseif v36.map_type == v36.weather and v_u_24[v35 - 1].map_type == v_u_24[v35 - 1].weather then
                                    v39.TextLabel.Text = ("%02d:%02d:%02d"):format(v43, v42.minutes, v42.seconds)
                                elseif v43 >= 2 then
                                    v39.TextLabel.Text = ("%s HOURS"):format(v43)
                                else
                                    v39.TextLabel.Text = "SOON"
                                end
                            else
                                v39.Visible = false
                            end
                        end
                        task.wait(1)
                    end
                end)
                if v_u_24[2] then
                    v_u_23 = v_u_5.delay_until(v_u_24[2].timestamp)
                    v_u_23:await()
                else
                    task.wait(5)
                end
                v44:cancel()
            end
        end)
        v_u_12:GiveTask(function()
            v_u_11:cancel()
            v_u_7.release("ForecastAssets", "MapForecast")
        end)
    end
end
function v10.cleanup()
    v_u_12:DoCleaning()
end
return v10