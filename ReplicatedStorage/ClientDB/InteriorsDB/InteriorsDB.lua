--// ReplicatedStorage.ClientDB.InteriorsDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v_u_1("ShopM")
local v2 = v_u_1("HouseDB")
local v3 = v_u_1("ContentPackHelper")
local v_u_4 = v_u_1("new:StreamingHelper")
local v_u_5 = v_u_1("package:Promise")
local v_u_6 = v_u_1("package:Sift")
local v_u_7 = game:GetService("Debris")
local v_u_8 = nil
local v379 = {
    ["AutoShop"] = {
        ["render"] = function(p_u_9, p10)
            v_u_1("LiveOpsTime")
            v_u_1("FormatHelper")
            local v11 = p_u_9.FlashSale.Countdown.Surface.SurfaceGui
            local v12 = v11.Frame.Title
            local v13 = v11.Frame.Timer
            p10.countdown = v_u_5.resolve()
            v12.Text = ""
            v13.Text = ""
            v_u_1("TweenHelper")
            v_u_1("TweenPromise")
            local v_u_14 = p_u_9.FlashSale.Axis
            local v_u_15 = p_u_9.FlashSale.Vehicle
            local v16 = v_u_14:Clone()
            local v17 = v_u_15:Clone()
            local v18 = v17.NoWeld
            for _, v19 in pairs(v17:GetDescendants()) do
                if v19:IsA("BasePart") and not v19:IsDescendantOf(v18) then
                    local v20 = Instance.new("Weld")
                    v20.C0 = v16.CFrame:ToObjectSpace(v19.CFrame)
                    v20.Part0 = v16
                    v20.Part1 = v19
                    v20.Parent = v19
                    v19.Anchored = false
                    v19.Massless = true
                end
            end
            v_u_14.Parent = nil
            v_u_15.Parent = nil
            v16.Parent = p_u_9.FlashSale
            v17.Parent = p_u_9.FlashSale
            p10.spin_promise = v_u_5.new(function(_, _, p21)
                p21(function()
                    v_u_14.Parent = p_u_9.FlashSale
                    v_u_15.Parent = p_u_9.FlashSale
                end)
            end)
            v16:Destroy()
            v17:Destroy()
        end,
        ["cleanup"] = function(_, p22)
            p22.countdown:cancel()
            p22.countdown = nil
            p22.spin_promise:cancel()
            p22.spin_promise = nil
        end
    },
    ["IceCream"] = {
        ["interactions"] = function(p23)
            local v24 = v_u_1("InteractionsEngine")
            local v_u_25 = v_u_1("UIManager")
            local v26 = v_u_1("PenguinAdoption")
            local v27 = {}
            for _, v28 in p23.AdoptablePets:GetChildren() do
                local v29 = v26.add_dialog(v28)
                table.insert(v27, v29)
            end
            local function v30()
                v_u_25.apps.DialogApp:dialog({
                    ["product_id"] = "golden_goldfish",
                    ["dialog_type"] = "RobuxProductDialog"
                })
            end
            for _, v31 in p23.Goldfish:GetChildren() do
                local v32 = {
                    ["text"] = "Buy Golden Goldfish",
                    ["part"] = v31.Head,
                    ["on_selected"] = v30
                }
                table.insert(v27, v24:register(v32))
            end
            return v27
        end,
        ["render"] = function(p33, _)
            v_u_1("PenguinAdoption").start(p33)
        end,
        ["cleanup"] = function(_, _)
            v_u_1("PenguinAdoption").stop()
        end
    },
    ["CoffeeShop"] = {
        ["render"] = function(p_u_34, p35)
            local v36 = v_u_1("BeeAdoption")
            local v_u_37 = v_u_1("PublicLootBoxRewards")
            local v38 = v_u_1("TerrainHelper")
            v_u_37.request():andThen(function(p39)
                p_u_34.OddsSign.Main.SurfaceGui.Odds.Text = v_u_37.convert_to_human_readable(p39.honey)
            end)
            v36.start(p_u_34, p35)
            p35.terrain_cleanup = v38.load_by_parts({
                [p_u_34.TerrainWater] = Enum.Material.Water
            })
        end,
        ["cleanup"] = function(p40, p41)
            v_u_1("BeeAdoption").stop(p40)
            p41.terrain_cleanup()
        end
    },
    ["Hospital"] = {
        ["interactions"] = function(p42)
            local v43 = v_u_1("InteractionsEngine")
            local v_u_44 = v_u_1("DoorsM")
            v_u_1("InventoryDB")
            local v45 = {}
            for _, v_u_46 in p42.Doors:GetChildren() do
                local v47 = v_u_46.WorkingParts.Configuration
                if not (v47:FindFirstChild("DisableInteraction") and v47.DisableInteraction.Value) and (v47:FindFirstChild("NoAutoOpen") and v47.NoAutoOpen.Value ~= false) then
                    local v49 = v43:register({
                        ["text"] = v47:FindFirstChild("CustomText") and v47.CustomText.Value or "Open",
                        ["on_selected"] = function()
                            local v48 = v_u_44.get_door(v_u_46)
                            v48:open()
                            wait(0.6)
                            v48:enter()
                        end,
                        ["part"] = v_u_46.WorkingParts.TouchToEnter
                    })
                    table.insert(v45, v49)
                end
            end
            return v45
        end
    },
    ["housing"] = {
        ["interactions"] = function(p50)
            local v51 = v_u_1("new:SpawnSequenceHelper")
            local v52 = v_u_1("InteractionsEngine")
            local v_u_53 = v_u_1("DoorsM")
            local v54 = {}
            for _, v_u_55 in pairs(p50.Doors:GetChildren()) do
                local v56 = v_u_55.WorkingParts.Configuration
                if not (v56:FindFirstChild("DisableInteraction") and v56.DisableInteraction.Value) then
                    local v58 = v52:register({
                        ["text"] = v56:FindFirstChild("CustomText") and v56.CustomText.Value or "Exit Home",
                        ["on_selected"] = function()
                            local v57 = v_u_53.get_door(v_u_55)
                            v57:open()
                            wait(0.6)
                            v57:enter()
                        end,
                        ["is_visible"] = v51.can_exit_house,
                        ["part"] = v_u_55.WorkingParts.TouchToEnter,
                        ["tag"] = "InteriorDoor"
                    })
                    table.insert(v54, v58)
                end
            end
            return v54
        end,
        ["render"] = function(_, p_u_59)
            assert(p_u_59, "Location was not provided to housing.render callback")
            local v_u_60 = v_u_1("RouterClient")
            local v61 = v_u_1("UIManager").apps.ExtraButtonsApp:register_button({
                ["priority"] = 1,
                ["text"] = "Exit Home",
                ["mouse_button1_click"] = function()
                    v_u_60.get("HousingAPI/UnsubscribeFromHouse"):InvokeServer(p_u_59.house_owner, true)
                end
            })
            p_u_59.exit_home_button = v61
            v61:show()
        end,
        ["cleanup"] = function(_, p62)
            local v63 = v_u_1("UIManager")
            if p62.exit_home_button then
                v63.apps.ExtraButtonsApp:unregister_button(p62.exit_home_button)
            end
            if p62.refresh_button_connection then
                p62.refresh_button_connection:Disconnect()
                p62.refresh_button_connection = nil
            end
        end
    },
    ["housing!space_house"] = {
        ["interactions"] = function(p64, p_u_65)
            local v66 = v_u_8.housing.interactions(p64)
            local v_u_67 = v_u_1("ClientData")
            local v_u_68 = v_u_1("RouterClient")
            local v69 = v_u_1("InteractionsEngine")
            local v74 = {
                ["text"] = function()
                    local v70 = v_u_67.get("house_interior") or {}
                    local v71 = v70.properties
                    if v71 then
                        v71 = v70.properties.low_gravity
                    end
                    return v71 and "Turn On Gravity" or "Turn Off Gravity"
                end,
                ["on_selected"] = function()
                    local v72 = v_u_67.get("house_interior") or {}
                    local v73 = v72.properties
                    if v73 then
                        v73 = v72.properties.low_gravity
                    end
                    v_u_68.get("HousingAPI/UpdateMyHouseProperty"):FireServer(v72.house_id, "low_gravity", not v73)
                end,
                ["is_visible"] = function()
                    return p_u_65.house_owner == game.Players.LocalPlayer
                end,
                ["part"] = p64.SpecialParts.GravityButton.Button
            }
            table.insert(v66, v69:register(v74))
            return v66
        end,
        ["render"] = function(p_u_75, p76)
            v_u_8.housing.render(p_u_75, p76)
            local v_u_77 = v_u_1("ClientData")
            p76.gravity_updater = v_u_5.new(function(_, _, p78)
                while not p78() do
                    local v79 = v_u_77.get("house_interior") or {}
                    local v80 = v79.properties
                    if v80 then
                        v80 = v79.properties.low_gravity
                    end
                    workspace.Gravity = v80 and 70 or 196.2
                    p_u_75.SpecialParts.GravityButton.ButtonColor.Material = v80 and Enum.Material.Neon or Enum.Material.SmoothPlastic
                    p_u_75.SpecialParts.GravityButton.ButtonColor.Color = v80 and Color3.fromRGB(0, 211, 88) or Color3.fromRGB(165, 66, 66)
                    task.wait(1)
                end
            end):finally(function()
                workspace.Gravity = 196.2
            end)
        end,
        ["cleanup"] = function(p81, p82)
            v_u_8.housing.cleanup(p81, p82)
            p82.gravity_updater:cancel()
            p82.gravity_updater = nil
        end
    },
    ["housing!vip_house"] = {
        ["interactions"] = function(p83)
            return v_u_1("VIPHouseInterior").interactions(p83)
        end,
        ["render"] = function(p84, p85)
            v_u_1("VIPHouseInterior").render(p84, p85)
        end,
        ["cleanup"] = function(p86, p87)
            v_u_1("VIPHouseInterior").cleanup(p86, p87)
        end
    },
    ["preview_housing!vip_house"] = {
        ["interactions"] = function(p88, p89)
            local v90 = v_u_1("HousePreviewInteriorHelper")
            local v91 = v_u_1("InteractionsEngine")
            local v_u_92 = v_u_1("InteriorsM")
            return v_u_6.List.concat({ v91:register({
                    ["text"] = "Cinema",
                    ["tag"] = "HousePreviewMode",
                    ["on_selected"] = function()
                        v_u_92.enter_smooth("preview_housing!vip_house", "ElevatorDoorBasement")
                    end,
                    ["part"] = p88.Doors.ElevatorDoorFloor1.WorkingParts.DoorCenter
                }), v91:register({
                    ["text"] = "Floor 1",
                    ["tag"] = "HousePreviewMode",
                    ["on_selected"] = function()
                        v_u_92.enter_smooth("preview_housing!vip_house", "ElevatorDoorFloor1")
                    end,
                    ["part"] = p88.Doors.ElevatorDoorBasement.WorkingParts.DoorCenter
                }) }, v90.interactions(p88, p89))
        end,
        ["render"] = function(p93, p94)
            v_u_1("HousePreviewInteriorHelper").render(p93, p94)
        end,
        ["cleanup"] = function(p95, p96)
            v_u_1("HousePreviewInteriorHelper").cleanup(p95, p96)
        end
    },
    ["housing!castle_house"] = {
        ["interactions"] = function(p97)
            return v_u_1("CastleHouseInterior").interactions(p97)
        end,
        ["render"] = function(p98, p99)
            v_u_1("CastleHouseInterior").render(p98, p99)
        end,
        ["cleanup"] = function(p100, p101)
            v_u_1("CastleHouseInterior").cleanup(p100, p101)
        end
    },
    ["housing!luxury_house"] = {
        ["interactions"] = function(p102, p103)
            return v_u_1("LuxuryHouseInterior").interactions(p102, p103)
        end,
        ["render"] = function(p104, p105)
            v_u_1("LuxuryHouseInterior").render(p104, p105)
        end,
        ["cleanup"] = function(p106, p107)
            v_u_1("LuxuryHouseInterior").cleanup(p106, p107)
        end
    },
    ["DesertShop"] = {
        ["render"] = function(p108, p109)
            local v_u_110 = v_u_1("InteriorsM")
            local v_u_111 = v_u_1("LiveOpsMapSwap")
            local v112 = v_u_1("ScarabAdoption")
            p109.kick_player_out = v_u_111.map_type_changed:Connect(function()
                if v_u_111.get_current_map_type() ~= "Desert" then
                    v_u_110.enter_smooth("MainMap", "Neighborhood!MainDoor")
                end
            end)
            local v113 = v_u_1("LiveOpsShopSignHelper")
            local v114 = p108.Interactables.TimerSign.SignFace.SurfaceGui.Timer
            p109.sign_timer = v113.update_promise("Desert", v114)
            v112.start(p108)
            p109.terrain_cleanup = v_u_1("TerrainHelper").load_by_tagged_parts(p108, {
                ["WaterColor"] = Color3.fromRGB(49, 163, 211),
                ["WaterReflectance"] = 1,
                ["WaterTransparency"] = 0.3,
                ["WaterWaveSize"] = 0,
                ["WaterWaveSpeed"] = 4
            })
        end,
        ["cleanup"] = function(p115, p116)
            local v117 = v_u_1("ScarabAdoption")
            p116.kick_player_out:Disconnect()
            p116.kick_player_out = nil
            p116.sign_timer:cancel()
            p116.sign_timer = nil
            v117.stop(p115)
            p116.terrain_cleanup()
            p116.terrain_cleanup = nil
        end,
        ["interactions"] = function(p118)
            local v119 = v_u_1("ScarabAdoption")
            local v120 = {}
            for _, v121 in pairs(p118.AdoptablePets:GetChildren()) do
                local v122 = v119.add_dialog(v121)
                table.insert(v120, v122)
            end
            return v120
        end
    },
    ["SnowShop"] = {
        ["render"] = function(p123, p124)
            local v125 = v_u_1("LiveOpsShopSignHelper")
            local v126 = p123.Interactables.TimerSign.SignFace.SurfaceGui.Timer
            p124.sign_timer = v125.update_promise("Snow", v126)
            local v127 = v_u_1("AlbatrossAdoption")
            local v_u_128 = v_u_1("LiveOpsMapSwap")
            local v_u_129 = v_u_1("InteriorsM")
            p124.kick_player_out = v_u_128.map_type_changed:Connect(function()
                if v_u_128.get_current_map_type() ~= "Snow" then
                    v_u_129.enter_smooth("MainMap", "Neighborhood!MainDoor")
                end
            end)
            v127.start(p123, p124)
            p124.terrain_cleanup = v_u_1("TerrainHelper").load_by_tagged_parts(p123, {
                ["WaterColor"] = Color3.fromRGB(49, 163, 211),
                ["WaterReflectance"] = 1,
                ["WaterTransparency"] = 0.3,
                ["WaterWaveSize"] = 0,
                ["WaterWaveSpeed"] = 4
            })
        end,
        ["cleanup"] = function(p130, p131)
            local v132 = v_u_1("AlbatrossAdoption")
            p131.kick_player_out:Disconnect()
            p131.kick_player_out = nil
            p131.sign_timer:cancel()
            p131.sign_timer = nil
            v132.stop(p130)
            p131.terrain_cleanup()
            p131.terrain_cleanup = nil
        end
    },
    ["FallShop"] = {
        ["render"] = function(p133, p134)
            return v_u_1("FallShopInterior").render(p133, p134)
        end,
        ["cleanup"] = function(p135, p136)
            return v_u_1("FallShopInterior").cleanup(p135, p136)
        end,
        ["interactions"] = function(p137)
            return v_u_1("FallShopInterior").interactions(p137)
        end
    },
    ["RainBoatShop"] = v_u_1("RainBoatShopInterior"),
    ["RainGiftShop"] = v_u_1("RainGiftShopInterior"),
    ["RainPetShop"] = v_u_1("RainPetShopInterior"),
    ["MainMap"] = {
        ["render"] = function(p138, p139)
            local v140 = v_u_1("EggEventMainMap")
            local v141 = v_u_1("ForecastBoard")
            local v142 = v_u_1("TerrainHelper")
            local v143 = v_u_1("SharedConstants")
            local v144 = v_u_1("CountdownSigns")
            local v145 = v_u_1("BeachHelper")
            local v146 = v_u_1("ThemeAreaHelper")
            v140.render(p138, p139)
            v144.render(p138, p139)
            v145.render(p138, p139)
            if not workspace.StreamingEnabled then
                local v147 = v142.serialize_from_string_values(p138.SerializedTerrain:GetChildren())
                local v148 = v142.deserialize(v147)
                p139.terrain_cleanup = v142.load(v148)
            end
            if not v143.forecast_override then
                v141.start(p138)
            end
            v146.render(p138, p139)
        end,
        ["cleanup"] = function(p149, p150)
            local v151 = v_u_1("EggEventMainMap")
            local v152 = v_u_1("ForecastBoard")
            local v153 = v_u_1("CountdownSigns")
            local v154 = v_u_1("BeachHelper")
            local v155 = v_u_1("ThemeAreaHelper")
            v151.cleanup(p149, p150)
            v153.cleanup(p149, p150)
            v154.cleanup(p149, p150)
            v155.cleanup(p149, p150)
            v152.cleanup()
            if p150.terrain_cleanup then
                p150.terrain_cleanup()
            end
        end,
        ["interactions"] = function(p156)
            local v157 = v_u_1("InteractionsEngine")
            local v_u_158 = v_u_1("RouterClient")
            local v_u_159 = v_u_1("UIManager")
            local v_u_160 = v_u_1("ClientData")
            local v161 = v_u_1("ThemeAreaHelper")
            local function v166()
                if game.Players.LocalPlayer.Character == nil or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil then
                    return
                else
                    local v162, v163 = v_u_158.get("BalloonAPI/BungeeJump"):InvokeServer()
                    local v164 = v_u_4.await(v162, 10)
                    if v164 then
                        local v165 = game.Players.LocalPlayer.Character
                        while v164 and (v164.Parent and (v165 and (v165.Parent and v165:FindFirstChild("HumanoidRootPart")))) do
                            if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < v163 - 15 then
                                v164.MaxForce = (1 / 0)
                            else
                                v164.MaxForce = 0
                            end
                            wait(0.1)
                        end
                    end
                end
            end
            local v167 = {}
            local v168 = p156.Buildings.SkyCastle:FindFirstChild("Bungee")
            if v168 then
                table.insert(v167, v157:register({
                    ["text"] = "Bungee Jump",
                    ["part"] = v168,
                    ["on_selected"] = v166
                }))
            end
            for _, v_u_169 in pairs(p156.Plots:GetChildren()) do
                local v170 = {
                    ["text"] = "Move House Here",
                    ["part"] = v_u_169.ForRentSign.Sign,
                    ["on_selected"] = function()
                        if v_u_160.get("owns_premium_plots") then
                            v_u_158.get("HousingAPI/RentPremiumPlot"):InvokeServer(v_u_169.Name)
                        else
                            v_u_159.apps.DialogApp:dialog({
                                ["product_id"] = "premium_plots",
                                ["dialog_type"] = "RobuxProductDialog"
                            })
                        end
                        wait(1.5)
                    end,
                    ["is_visible"] = function()
                        return v_u_169.ForRentSign.Sign.Transparency == 0
                    end
                }
                table.insert(v167, v157:register(v170))
            end
            v161.register_interactions(p156, v167)
            return v167
        end
    },
    ["MainMap!Default"] = {
        ["render"] = function(p171, p172)
            v_u_8.MainMap.render(p171, p172)
        end,
        ["cleanup"] = function(p173, p174)
            v_u_8.MainMap.cleanup(p173, p174)
        end,
        ["interactions"] = function(p175)
            return v_u_8.MainMap.interactions(p175)
        end
    },
    ["MainMap!Desert"] = {
        ["render"] = function(p176, p177)
            v_u_8.MainMap.render(p176, p177)
        end,
        ["cleanup"] = function(p178, p179)
            v_u_8.MainMap.cleanup(p178, p179)
        end,
        ["interactions"] = function(p180)
            return v_u_8.MainMap.interactions(p180)
        end
    },
    ["MainMap!Snow"] = {
        ["render"] = function(p181, p182)
            v_u_8.MainMap.render(p181, p182)
            v_u_1("CameraParticlesClient").set_camera_particles("MainMapSnow", 10, "WinterSnow")
        end,
        ["cleanup"] = function(p183, p184)
            v_u_8.MainMap.cleanup(p183, p184)
            v_u_1("CameraParticlesClient").remove_camera_particles("MainMapSnow")
        end,
        ["interactions"] = function(p185)
            return v_u_8.MainMap.interactions(p185)
        end
    },
    ["MainMap!Fall"] = {
        ["render"] = function(p186, p187)
            v_u_8.MainMap.render(p186, p187)
            local v_u_188 = Random.new()
            local v_u_189 = p186.WindEmitters:GetChildren()
            local function v_u_193(p190, p191)
                p190:SetAttribute("Enabled", p191)
                for _, v192 in ipairs(p190:GetChildren()) do
                    if v192:IsA("ParticleEmitter") then
                        v192.Enabled = p191
                    end
                end
            end
            for _, v194 in ipairs(v_u_189) do
                v_u_193(v194, false)
            end
            p187.wind_promise = v_u_5.new(function(_, _, p_u_195)
                p_u_195(function()
                    for _, v196 in ipairs(v_u_189) do
                        v_u_193(v196, false)
                    end
                end)
                while not p_u_195() do
                    local v_u_197 = v_u_189[v_u_188:NextInteger(1, #v_u_189)]
                    if v_u_197:GetAttribute("Enabled") then
                        task.wait(0.2)
                    else
                        v_u_193(v_u_197, true)
                        task.delay(v_u_188:NextInteger(1, 6), function()
                            if not p_u_195() then
                                v_u_193(v_u_197, false)
                            end
                        end)
                        task.wait(v_u_188:NextInteger(1, 3))
                    end
                end
            end)
        end,
        ["cleanup"] = function(p198, p199)
            v_u_8.MainMap.cleanup(p198, p199)
            p199.wind_promise:cancel()
            p199.wind_promise = nil
        end,
        ["interactions"] = function(p200)
            return v_u_8.MainMap.interactions(p200)
        end
    },
    ["MainMap!Rain"] = {
        ["render"] = function(p201, p202)
            v_u_8.MainMap.render(p201, p202)
            if p201.Ambience then
                p201.Ambience:Play()
            end
            v_u_1("CameraParticlesClient").set_camera_particles("MainMapRain", 10, "RainDrops")
            p202.terrain_cleanup = v_u_1("TerrainHelper").load_by_tagged_parts(p201, {
                ["WaterColor"] = Color3.fromRGB(49, 163, 211),
                ["WaterReflectance"] = 1,
                ["WaterTransparency"] = 0.3,
                ["WaterWaveSize"] = 0,
                ["WaterWaveSpeed"] = 4
            })
        end,
        ["cleanup"] = function(p203, p204)
            v_u_8.MainMap.cleanup(p203, p204)
            if p203.Ambience then
                p203.Ambience:Stop()
            end
            v_u_1("CameraParticlesClient").remove_camera_particles("MainMapRain")
            p204.bridge_maid:Destroy()
            p204.terrain_cleanup()
            p204.terrain_cleanup = nil
        end,
        ["interactions"] = function(p205, p206)
            local v207 = v_u_1("InteractionsEngine")
            local v_u_208 = v_u_1("SharedConstants")
            local v_u_209 = v_u_1("TweenPromise")
            local v_u_210 = v_u_1("RouterClient")
            local v211 = v_u_1("Maid").new()
            local v212 = v_u_8.MainMap.interactions(p205)
            local v_u_213 = game.Workspace:WaitForChild("StaticMap"):WaitForChild("RainBridgeProperties")
            local v_u_214 = p205:WaitForChild("Static"):WaitForChild("Bridges"):WaitForChild("RainBridge")
            local v215 = v_u_214:WaitForChild("Switches")
            local v_u_216 = v_u_5.resolve()
            local v_u_217 = TweenInfo.new(v_u_208.rain_bridge_transition_time)
            for _, v218 in v215:GetChildren() do
                table.insert(v212, v207:register({
                    ["text"] = "Activate Bridge",
                    ["part"] = v218,
                    ["on_selected"] = function()
                        if os.time() - v_u_213.LastSwitched.Value >= v_u_208.rain_bridge_transition_time then
                            v_u_210.get("EventAPI/ToggleRainBridge"):FireServer()
                        end
                    end
                }))
            end
            local function v_u_225(p219)
                for _, v220 in p219.Ropes:GetChildren() do
                    local v221 = (v220.Start.Position - v220.End.Position).magnitude
                    local v222 = CFrame.new(v220.Start.Position, v220.End.Position):ToWorldSpace(CFrame.new(0, 0, -v221 / 2))
                    v220.RopePart.CFrame = v222
                    local v223 = v220.RopePart.Size.X
                    local v224 = v220.RopePart.Size.Y
                    v220.RopePart.Size = Vector3.new(v223, v224, v221)
                end
            end
            (function(p226)
                for _, v227 in v_u_214.Segments:GetChildren() do
                    local v228 = p226 == true and v227.Open.CFrame or v227.Closed.CFrame
                    v227.Wood.PrimaryPart.CFrame = v228
                    v_u_225(v227)
                end
            end)(v_u_213.Open.Value)
            v211:GiveTask(v_u_213.Open.Changed:Connect(function(p_u_229)
                local v_u_230 = {
                    ["Left"] = v_u_214.Segments.Left.Wood.PrimaryPart.CFrame,
                    ["Right"] = v_u_214.Segments.Right.Wood.PrimaryPart.CFrame
                }
                v_u_216:cancel()
                v_u_216 = v_u_209.callback(0, 1, v_u_217, function(p231)
                    for _, v232 in v_u_214.Segments:GetChildren() do
                        local v233 = p_u_229 == true and v232.Open.CFrame or v232.Closed.CFrame
                        v232.Wood.PrimaryPart.CFrame = v_u_230[v232.Name]:Lerp(v233, p231)
                        v_u_225(v232)
                    end
                end)
            end))
            v211:GiveTask(function()
                v_u_216:cancel()
            end)
            p206.bridge_maid = v211
            return v212
        end
    },
    ["Neighborhood!Default"] = {
        ["render"] = function(p234, _)
            local v235 = v_u_1("ForecastBoard")
            if not v_u_1("SharedConstants").forecast_override then
                v235.start(p234)
            end
        end,
        ["cleanup"] = function(_, _)
            v_u_1("ForecastBoard").cleanup()
        end,
        ["interactions"] = function(p236)
            local v_u_237 = v_u_1("UIManager")
            local v238 = v_u_1("InteractionsEngine")
            local v239 = {}
            local v240 = {
                ["text"] = "Unlock",
                ["part"] = p236.BuyMegaCarPack,
                ["on_selected"] = function()
                    v_u_237.apps.DialogApp:dialog({
                        ["product_id"] = "mega_cars_2024_mega_car_pack",
                        ["dialog_type"] = "RobuxProductDialog"
                    })
                end
            }
            table.insert(v239, v238:register(v240))
            local v241 = {
                ["text"] = "Unlock",
                ["part"] = p236.BuyRoyalCarriages,
                ["on_selected"] = function()
                    v_u_237.apps.DialogApp:dialog({
                        ["product_id"] = "springfest_2023_regal_carriages",
                        ["dialog_type"] = "RobuxProductDialog"
                    })
                end
            }
            table.insert(v239, v238:register(v241))
            local v_u_242 = v_u_1("RouterClient")
            local v_u_243 = v_u_1("ClientData")
            for _, v_u_244 in pairs(p236.Plots:GetChildren()) do
                local v245 = v_u_244.Name
                if not tonumber(v245) then
                    local v246 = {
                        ["text"] = "Move House Here",
                        ["part"] = v_u_244.ForRentSign.Sign,
                        ["on_selected"] = function()
                            if v_u_243.get("owns_premium_plots") then
                                v_u_242.get("HousingAPI/RentPremiumPlot"):InvokeServer(v_u_244.Name)
                            else
                                v_u_237.apps.DialogApp:dialog({
                                    ["product_id"] = "premium_plots",
                                    ["dialog_type"] = "RobuxProductDialog"
                                })
                            end
                            wait(1.5)
                        end,
                        ["is_visible"] = function()
                            return v_u_244.ForRentSign.Sign.Transparency == 0
                        end
                    }
                    table.insert(v239, v238:register(v246))
                end
            end
            return v239
        end
    },
    ["Neighborhood!Desert"] = {
        ["render"] = function(p247, p248)
            v_u_8["Neighborhood!Default"].render(p247, p248)
        end,
        ["cleanup"] = function(p249, p250)
            v_u_8["Neighborhood!Default"].cleanup(p249, p250)
        end,
        ["interactions"] = function(p251)
            return v_u_8["Neighborhood!Default"].interactions(p251)
        end
    },
    ["Neighborhood!Snow"] = {
        ["render"] = function(p252, p253)
            v_u_8["Neighborhood!Default"].render(p252, p253)
            v_u_1("CameraParticlesClient").set_camera_particles("MainMapSnow", 10, "WinterSnow")
        end,
        ["cleanup"] = function(p254, p255)
            v_u_8["Neighborhood!Default"].cleanup(p254, p255)
            v_u_1("CameraParticlesClient").remove_camera_particles("MainMapSnow")
        end,
        ["interactions"] = function(p256)
            return v_u_8["Neighborhood!Default"].interactions(p256)
        end
    },
    ["Neighborhood!Fall"] = {
        ["render"] = function(p257, p258)
            v_u_8["Neighborhood!Default"].render(p257, p258)
        end,
        ["cleanup"] = function(p259, p260)
            v_u_8["Neighborhood!Default"].cleanup(p259, p260)
        end,
        ["interactions"] = function(p261)
            return v_u_8["Neighborhood!Default"].interactions(p261)
        end
    },
    ["Neighborhood!Rain"] = {
        ["render"] = function(p262, p263)
            v_u_8["Neighborhood!Default"].render(p262, p263)
            if p262.Ambience then
                p262.Ambience:Play()
            end
            v_u_1("CameraParticlesClient").set_camera_particles("MainMapRain", 10, "RainDrops")
        end,
        ["cleanup"] = function(p264, p265)
            v_u_8["Neighborhood!Default"].cleanup(p264, p265)
            if p264.Ambience then
                p264.Ambience:Stop()
            end
            v_u_1("CameraParticlesClient").remove_camera_particles("MainMapRain")
        end,
        ["interactions"] = function(p266)
            return v_u_8["Neighborhood!Default"].interactions(p266)
        end
    },
    ["Nursery"] = v_u_1("NurseryInterior"),
    ["SafetyHub"] = {
        ["interactions"] = function(p_u_267)
            local v268 = v_u_1("InteractionsEngine")
            local v_u_269 = v_u_1("ClientData")
            local v_u_270 = v_u_1("DoorsM")
            local v_u_271 = v_u_1("UIManager")
            v_u_1("RouterClient")
            local v272 = {}
            local v277 = {
                ["text"] = "Enter",
                ["part"] = p_u_267.Doors.TradeLicenseZone.WorkingParts.TouchToEnter,
                ["on_selected"] = function()
                    if v_u_269.get("boolean_flags").has_talked_to_trade_quest_npc then
                        local v273 = v_u_269.get("inventory")
                        if not game:GetService("RunService"):IsStudio() then
                            for _, v274 in pairs(v273) do
                                for _, v275 in pairs(v274) do
                                    if v275.id == "trade_license" then
                                        v_u_271.apps.DialogApp:dialog({
                                            ["text"] = "You already have a Trade License! No need to go in here.",
                                            ["button"] = "Okay"
                                        })
                                        return
                                    end
                                end
                            end
                        end
                        local v276 = v_u_270.get_door(p_u_267.Doors.TradeLicenseZone)
                        v276:open()
                        wait(0.6)
                        v276:enter()
                    else
                        v_u_271.apps.DialogApp:dialog({
                            ["text"] = "You should talk to the person standing by the door before you go in here!",
                            ["button"] = "Okay"
                        })
                    end
                end
            }
            table.insert(v272, v268:register(v277))
            local v278 = {
                ["text"] = "Read Trade History",
                ["part"] = p_u_267.TradeHistoryBook.BookClosed,
                ["on_selected"] = function()
                    v_u_271.set_app_visibility("TradeHistoryApp", true)
                end
            }
            table.insert(v272, v268:register(v278))
            local v279 = {
                ["text"] = "Redeem Code",
                ["part"] = p_u_267.RedemptionKiosk.Screen,
                ["on_selected"] = function()
                    v_u_271.set_app_visibility("CodeRedemptionApp", true)
                end
            }
            table.insert(v272, v268:register(v279))
            return v272
        end
    },
    ["TradeLicenseZone"] = {
        ["interactions"] = function(p_u_280)
            local v281 = v_u_1("InteractionsEngine")
            local v_u_282 = v_u_1("RouterClient")
            local v_u_283 = v_u_1("SoundPlayer")
            local v_u_284 = v_u_1("ClientData")
            local v_u_285 = v_u_1("UIManager")
            local v_u_286 = v_u_1("InteriorsM")
            local function v_u_292(p287, p288, p289)
                local v290 = game.ReplicatedStorage.Resources.Particles[p287]:Clone()
                v290.CanCollide = false
                v290.Anchored = true
                v290.Position = p288
                v290.Parent = workspace
                for _, v291 in pairs(v290:GetChildren()) do
                    if v291:IsA("ParticleEmitter") then
                        v291:Emit(p289)
                    end
                end
                v_u_7:AddItem(v290, 4)
            end
            local v293 = {}
            local v297 = {
                ["text"] = "Claim!",
                ["part"] = p_u_280.License.License,
                ["on_selected"] = function()
                    v_u_292("CorrectAnswer", p_u_280.License.License.Position, 10)
                    v_u_283.FX:play("GoldSparklePrize", p_u_280.License.Model.Chassis)
                    p_u_280.License.License:Destroy()
                    local v294 = v_u_284.get("inventory")
                    for _, v295 in pairs(v294) do
                        for _, v296 in pairs(v295) do
                            if v296.id == "trade_license" then
                                v_u_282.get("ToolAPI/Equip"):InvokeServer(v296.unique)
                            end
                        end
                    end
                    v_u_5.delay(0.5):await()
                    v_u_285.apps.DialogApp:dialog({
                        ["text"] = "You can find your license in your backpack. Use it to view your trade history at any time!",
                        ["button"] = "Okay"
                    })
                    v_u_286.enter_smooth("SafetyHub", "TradeLicenseZone", {
                        ["studs_ahead_of_door"] = 9
                    })
                    v_u_285.apps.GuideArrowApp:navigate("SafetyHub", function()
                        if workspace.Interiors:FindFirstChild("SafetyHub") then
                            return workspace.Interiors.SafetyHub.TradeHistoryNPC.Position
                        end
                    end, nil, false)
                end
            }
            table.insert(v293, v281:register(v297))
            return v293
        end,
        ["render"] = function(_, p298)
            v_u_1("CharacterHider").hide_other_characters_in_location(p298.destination_id)
        end,
        ["cleanup"] = function(_, p299)
            local v300 = v_u_1("RouterClient")
            local v301 = v_u_1("CharacterHider")
            v300.get("TradeAPI/EndQuiz"):FireServer()
            v301.unhide_other_characters_in_location(p299)
        end
    },
    ["PetShop"] = {
        ["interactions"] = function(p302, _)
            local v303 = v_u_1("HamsterAdoption")
            local v304 = {}
            for _, v305 in pairs(p302.AdoptablePets:GetChildren()) do
                local v306 = v303.add_dialog(v305)
                table.insert(v304, v306)
            end
            return v304
        end,
        ["render"] = function(p_u_307, p308)
            local v309 = v_u_1("HamsterAdoption")
            local v_u_310 = v_u_1("PublicLootBoxRewards")
            v309.start(p_u_307, p308)
            v_u_310.request():andThen(function(p311)
                p_u_307.PetRoamArea.EndSign.Main.SurfaceGui.Odds.Text = v_u_310.convert_to_human_readable(p311.hamstertime_2024_golden_corn)
            end)
            p308.terrain_cleanup = v_u_1("TerrainHelper").load_by_parts({
                [p_u_307.TerrainWater] = Enum.Material.Water
            }, {
                ["WaterColor"] = Color3.fromRGB(105, 218, 243),
                ["WaterTransparency"] = 0.2,
                ["WaterReflectance"] = 0.7,
                ["WaterWaveSize"] = 0.45,
                ["WaterWaveSpeed"] = 10
            })
        end,
        ["cleanup"] = function(p312, p313)
            v_u_1("HamsterAdoption").stop(p312)
            p313.terrain_cleanup()
            p313.terrain_cleanup = nil
        end
    },
    ["SkyCastle"] = {
        ["render"] = function(p314, p315)
            return v_u_1("SkyCastleInterior").render(p314, p315)
        end,
        ["cleanup"] = function(p316, p317)
            return v_u_1("SkyCastleInterior").cleanup(p316, p317)
        end
    },
    ["FarmShop"] = {
        ["render"] = function(p_u_318, p319)
            local v320 = v_u_1("LadybugAdoption")
            local v321 = v_u_1("AnimationManager")
            local v_u_322 = v_u_1("PublicLootBoxRewards")
            v_u_322.request():andThen(function(p323)
                p_u_318.OddsSign.Main.SurfaceGui.Odds.Text = v_u_322.convert_to_human_readable(p323.diamond_lavender)
            end)
            v320.start(p_u_318, p319)
            local v324 = p_u_318.Static.Buildings.Windmill.Mill.Blades.AnimationController:LoadAnimation(v321.get_track("FarmShopBladeSpin"))
            v324:Play(0.1, 1, 0.05)
            p319.blades_track = v324
        end,
        ["cleanup"] = function(p325, p326)
            v_u_1("LadybugAdoption").stop(p325)
            p326.blades_track:Stop()
            p326.blades_track:Destroy()
        end
    },
    ["ToyShop"] = {
        ["render"] = function(p327, _)
            v_u_1("ShopInteriorHelper").render_lootbox_rewards(p327)
        end,
        ["cleanup"] = function(_, _)
            v_u_1("ShopInteriorHelper"):cleanup()
        end
    },
    ["VIP"] = v_u_1("VIPInterior"),
    ["HatShop"] = {
        ["sky"] = "BeachSky",
        ["interactions"] = function(p328)
            return v_u_1("HatShopUGCDummies").interactions(p328)
        end,
        ["render"] = function(p329, p_u_330)
            local v_u_331 = v_u_1("ClientData")
            local v332 = v_u_1("HatShopClient")
            local v333 = v_u_1("AccessoryMannequin")
            local v334 = v_u_1("PridePinBoard")
            local v335 = v_u_1("EcoPinBoard")
            local v_u_336 = v_u_1("LiveOpsTime")
            local v_u_337 = v_u_1("FormatHelper")
            local v338 = v_u_1("LootboxRewardsDisplay")
            local v339 = v_u_1("HatShopUGCDummies")
            local v340 = v_u_1("HatShopUGCDisplayBoard")
            local v341 = v_u_1("UIManager").apps.MannequinPurchaseApp
            v338.render(p329)
            local v342 = Instance.new("Folder")
            v342.Name = "Mannequins"
            v342.Parent = p329
            p_u_330.mannequin_folder = v342
            local v343 = p329.MannequinSpawns
            local v344 = {}
            for _, v345 in pairs(v343:GetChildren()) do
                v344[v345.Name] = v345.CFrame
            end
            local v_u_346 = {}
            p_u_330.mannequins = v_u_346
            v_u_346[1] = v333.new(v344.Left1, v342, "non_robux_accessory", 1)
            v_u_346[2] = v333.new(v344.Left2, v342, "non_robux_accessory", 2)
            v_u_346[3] = v333.new(v344.Left3, v342, "non_robux_accessory", 3)
            v_u_346[4] = v333.new(v344.Middle, v342, "non_robux_accessory", 4)
            v_u_346[5] = v333.new(v344.Promo1, v342, "developer_product", 5)
            local function v348(p347)
                v_u_346[1]:update_content(p347[1])
                v_u_346[2]:update_content(p347[2])
                v_u_346[3]:update_content(p347[3])
                v_u_346[4]:update_content(p347[4])
                v_u_346[5]:update_content(p347[8])
            end
            p_u_330.connection = v332.get_stock_changed_event():Connect(v348)
            v348(v332.get_current_stock())
            v341:set_mannequin_list(v_u_346)
            local v_u_349 = p329.Countdown.AdorneePart.SurfaceGui.Anchor.Timer
            spawn(function()
                while not p_u_330:is_exited() do
                    local v350 = v_u_331.get("hat_shop_next_rotation_time") - v_u_336.now()
                    local v351 = v_u_337.get_time_breakdown(v350)
                    v_u_349.Text = ("%02d:%02d:%02d:%02d"):format(v351.days, v351.hours, v351.minutes, v351.seconds)
                    task.wait(0.1)
                end
            end)
            p_u_330.terrain_cleanup = v_u_1("TerrainHelper").load_by_parts({
                [p329.TerrainWater] = Enum.Material.Water
            }, {
                ["WaterColor"] = Color3.fromRGB(12, 84, 92),
                ["WaterTransparency"] = 0.3,
                ["WaterReflectance"] = 1,
                ["WaterWaveSize"] = 0.15
            })
            v334.start(p329, p_u_330)
            v335.start(p329, p_u_330)
            v339.render(p329, p_u_330)
            v340.render(p329, p_u_330)
        end,
        ["cleanup"] = function(p352, p353)
            local v354 = v_u_1("UIManager")
            local v355 = v_u_1("UIManager").apps.MannequinPurchaseApp
            local v356 = v_u_1("PridePinBoard")
            local v357 = v_u_1("EcoPinBoard")
            local v358 = v_u_1("LootboxRewardsDisplay")
            local v359 = v_u_1("HatShopUGCDummies")
            local v360 = v_u_1("HatShopUGCDisplayBoard")
            v358.cleanup()
            p353.connection:Disconnect()
            p353.terrain_cleanup()
            p353.terrain_cleanup = nil
            for _, v361 in pairs(p353.mannequins) do
                v361:destroy()
            end
            p353.mannequin_folder:Destroy()
            v354.set_app_visibility("MannequinPurchaseApp", false)
            v355:set_mannequin_list({})
            v356.stop(p352, p353)
            v357.stop(p352, p353)
            v359.cleanup(p352, p353)
            v360.cleanup(p352, p353)
        end
    },
    ["WingRoom"] = {
        ["interactions"] = function(p362)
            return v_u_1("WingRoomInterior").interactions(p362)
        end,
        ["render"] = function(p363, p364)
            return v_u_1("WingRoomInterior").render(p363, p364)
        end,
        ["cleanup"] = function(p365, p366)
            return v_u_1("WingRoomInterior").cleanup(p365, p366)
        end
    },
    ["DebugInterior"] = v_u_1("DebugInterior"),
    ["DetectiveBuilding"] = {
        ["render"] = function(p367, p_u_368)
            local v_u_369 = v_u_1("InteriorsM")
            p_u_368.manhole_escape_connection = p367.DetectiveBuildingManholeEscape.Touched:Connect(function(p370)
                if p370:IsDescendantOf(game.Players.LocalPlayer.Character) then
                    p_u_368.manhole_escape_connection:Disconnect()
                    v_u_369.enter_smooth("MainMap", "MainDoor", {
                        ["spawn_cframe"] = function(p371)
                            return p371.Buildings.DetectiveBuilding.EscapeManhole.SpawnBlock.CFrame
                        end
                    })
                end
            end)
        end,
        ["cleanup"] = function(_, p372)
            p372.manhole_escape_connection:Disconnect()
        end
    },
    ["AFKZone"] = {
        ["interactions"] = function(p373, p374)
            return v_u_1("AFKZoneInterior").interactions(p373, p374)
        end,
        ["render"] = function(p375, p376)
            return v_u_1("AFKZoneInterior").render(p375, p376)
        end,
        ["cleanup"] = function(p377, p378)
            return v_u_1("AFKZoneInterior").cleanup(p377, p378)
        end
    }
}
v_u_8 = v379
local v_u_380 = v_u_8
for v381, _ in v2 do
    local v382 = "preview_housing!" .. v381
    if not v_u_380[v382] then
        v_u_380[v382] = {
            ["render"] = function(p383, p384)
                v_u_1("HousePreviewInteriorHelper").render(p383, p384)
            end,
            ["cleanup"] = function(p385, p386)
                v_u_1("HousePreviewInteriorHelper").cleanup(p385, p386)
            end,
            ["interactions"] = function(p387, p388)
                local v389 = v_u_1("HousePreviewInteriorHelper")
                return v_u_6.List.concat(v389.interactions(p387, p388), v_u_380.housing.interactions(p387))
            end
        }
    end
end
v3.merge("Interiors", v_u_380)
return v_u_380