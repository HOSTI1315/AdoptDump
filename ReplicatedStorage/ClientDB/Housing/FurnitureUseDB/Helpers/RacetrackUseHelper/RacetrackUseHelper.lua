--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.RacetrackUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("TweenPromise")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("package:Sift")
local v_u_5 = v_u_1("package:Promise")
return {
    ["RACETRACK_STARTING_LINE"] = function()
        local v_u_6 = {
            Color3.fromRGB(165, 0, 30),
            Color3.fromRGB(165, 91, 0),
            Color3.fromRGB(218, 205, 22),
            Color3.fromRGB(0, 165, 41),
            Color3.fromRGB(0, 148, 165),
            Color3.fromRGB(91, 0, 165),
            Color3.fromRGB(150, 150, 150),
            Color3.fromRGB(0, 0, 0)
        }
        return {
            ["use_permissions"] = "EVERYONE",
            ["dont_automatically_mark_furniture_change_after_use"] = true,
            ["init"] = function(p7)
                p7.state = {
                    ["race_is_counting_down"] = false,
                    ["can_remove_vehicles"] = true,
                    ["COUNTDOWN_LENGTH"] = 10
                }
            end,
            ["use_text"] = function(_, _, p8)
                return p8.Name == "RemoveVehicles" and "Return Vehicles" or (p8.Name == "StartRace" and "Start Race" or "Get Go-Kart")
            end,
            ["client_get_data_for_server_use"] = function(p9, _, _, _, p10, p11)
                local v12 = v_u_1("UIManager")
                local v13 = v_u_1("ClientData")
                local v14 = p9.state
                if not p10.Name:match("GetVehicle") then
                    if v14.race_is_counting_down then
                        return false
                    end
                    local v15 = p11:get_house_owner()
                    local v16 = game.Players.LocalPlayer
                    if v16 ~= v15 then
                        local v17 = v13.get_server(v15, "family_list") or {}
                        if not v_u_4.Dictionary.includes(v17, v16) then
                            v12.apps.DialogApp:dialog({
                                ["text"] = "You need to be in this player\'s family to use this button.",
                                ["button"] = "Okay"
                            })
                            return
                        end
                    end
                    if p10.name:match("RemoveVehicles") then
                        if not v14.can_remove_vehicles then
                            v12.apps.DialogApp:dialog({
                                ["text"] = "You need to wait before you can use this again.",
                                ["button"] = "Okay"
                            })
                            return
                        end
                        if v12.apps.DialogApp:dialog({
                            ["text"] = "Do you want to return all vehicles?",
                            ["left"] = "No",
                            ["right"] = "Yes",
                            ["accept_delay"] = 3
                        }) == "Yes" then
                            return {
                                ["remove_vehicles"] = true
                            }
                        end
                    end
                    return {
                        ["furniture_folder_name"] = p11.folder.Name
                    }
                end
                local v18 = v_u_6[Random.new():NextInteger(1, #v_u_6)]
                local v19 = p10.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 6)
                if v14.race_is_counting_down then
                    return {
                        ["color"] = v18,
                        ["spawn_cframe"] = v19
                    }
                end
                local v20 = {
                    ["starter_color"] = v18,
                    ["available_colors"] = v_u_6
                }
                local v21, v22 = v12.apps.DialogApp:choose_color(v20)
                if v21 ~= "Cancel" then
                    return {
                        ["color"] = v22,
                        ["spawn_cframe"] = v19
                    }
                end
            end,
            ["server_use"] = function(p23, p24, p_u_25, p_u_26, p27, _, p28)
                local v29 = v_u_1("DataM")
                local v30 = v_u_1("MsgBridge")
                local v31 = v_u_1("ServerRouter")
                if p28:match("GetVehicle") then
                    local v32 = v29.get_store(p23)
                    local v33 = v32:get("inventory")
                    local v_u_34 = v32:get("equip_manager")
                    local v35 = v_u_3.transport.racehouse_2023_gokart
                    local v36 = v33:get_items_with_id(v35.id) or {}
                    local v_u_37 = #v36 > 0 and v36[1] or v33:add_item(v35)
                    if #v36 == 0 then
                        local v38 = v32:get("uniques_to_remove_on_location_change") or {}
                        local v39 = v_u_37.unique
                        table.insert(v38, v39)
                        v32:set("uniques_to_remove_on_location_change", v38)
                    end
                    local v40 = v_u_34:get_equipped()
                    local v41
                    if v40 and v40.transport then
                        v_u_34:unequip(v40.transport)
                        v41 = 0.3
                    else
                        v41 = 0
                    end
                    local v42 = p_u_26 and p_u_26.color or v_u_6[1]
                    v_u_37.properties.color = { v42.R, v42.G, v42.B }
                    v_u_5.delay(v41):andThen(function()
                        local v43 = v_u_34
                        local v44 = v_u_37
                        local v45 = {}
                        local v46 = p_u_26
                        if v46 then
                            v46 = p_u_26.spawn_cframe
                        end
                        v45.spawn_cframe = v46
                        v43:equip(v44, v45)
                    end)
                    return
                else
                    local v_u_47 = p24.state
                    if v_u_47.race_is_counting_down then
                        v30.hint(p23, {
                            ["text"] = "You can\'t use this button right now.",
                            ["length"] = 4
                        })
                        return
                    else
                        if p23 ~= p27 then
                            local v48 = v29.get(p27, "family_list") or {}
                            if not v_u_4.Dictionary.includes(v48, p23) then
                                return
                            end
                        end
                        local v49 = v29.get_store(p27):get("house_manager")
                        local v50 = v49 and v49:get_all_subscribers() or {}
                        if p28 == "StartRace" then
                            v_u_47.race_is_counting_down = true
                            v_u_5.delay(v_u_47.COUNTDOWN_LENGTH + 3):finally(function()
                                v_u_47.race_is_counting_down = false
                                p_u_25()
                            end)
                            if p_u_26 and p_u_26.furniture_folder_name then
                                for v51, _ in v50 do
                                    if v51 ~= p23 then
                                        v31.get("HousingAPI/PromptRaceStartTeleport"):FireClient(v51, p_u_26.furniture_folder_name)
                                    end
                                end
                            end
                            p_u_25()
                        elseif p28 == "RemoveVehicles" and (p_u_26 and p_u_26.remove_vehicles) then
                            if not v_u_47.can_remove_vehicles then
                                return
                            end
                            v_u_47.can_remove_vehicles = false
                            v_u_5.delay(25):finally(function()
                                v_u_47.can_remove_vehicles = true
                                if not v_u_47.race_is_counting_down then
                                    p_u_25()
                                end
                            end)
                            for v52, _ in v50 do
                                local v53 = v29.get_store(v52)
                                if v53 then
                                    local v54 = v53:get("equip_manager")
                                    if v54 then
                                        local v55 = v54:get_equipped()
                                        if v55 and v55.transport then
                                            v54:unequip(v55.transport)
                                            v30.hint(v52, {
                                                ["text"] = "Your vehicle was returned to your backpack.",
                                                ["length"] = 5
                                            })
                                        end
                                    end
                                end
                            end
                            p_u_25()
                        end
                    end
                end
            end,
            ["render"] = function(p56, p57)
                local v_u_58 = v_u_1("SoundPlayer")
                local v_u_59 = v_u_1("package:Promise")
                local v_u_60 = p56.state
                if v_u_60.race_is_counting_down then
                    local v61 = p57.InvisibleWallPosition
                    local v_u_62 = v61:Clone()
                    v_u_62.Name = "InvisibleWall"
                    local v63 = v_u_62.CFrame
                    local v64 = (v61.Size.Y + 30) / 2
                    v_u_62.CFrame = v63 + Vector3.new(0, v64, 0)
                    local v65 = v_u_62.Size.X
                    local v66 = v_u_62.Size.Z
                    v_u_62.Size = Vector3.new(v65, 30, v66)
                    v_u_62.Parent = p57
                    local v67 = Instance.new("BillboardGui")
                    v67.Size = UDim2.new(0, 450, 0, 450)
                    v67.AlwaysOnTop = true
                    v67.Parent = v_u_62
                    local v_u_68 = Instance.new("TextLabel")
                    v_u_68.Size = UDim2.new(0.5, 0, 0.5, 0)
                    v_u_68.AnchorPoint = Vector2.new(0.5, 0.5)
                    v_u_68.BackgroundTransparency = 1
                    v_u_68.FontFace = Font.fromEnum(Enum.Font.LuckiestGuy)
                    v_u_68.TextScaled = true
                    v_u_68.RichText = true
                    v_u_68.Parent = v67
                    local v_u_69 = v_u_68:Clone()
                    v_u_69.AnchorPoint = Vector2.new(0, 0)
                    v_u_69.Size = UDim2.new(1, 0, 1, 0)
                    v_u_69.Position = UDim2.new(0, 10, 0, -10)
                    v_u_69.TextColor3 = Color3.new(1, 1, 1)
                    v_u_69.Parent = v_u_68
                    v_u_68.Changed:Connect(function(p70)
                        if p70 == "Text" then
                            v_u_69.Text = v_u_68.Text
                        elseif p70 == "TextTransparency" then
                            v_u_69.TextTransparency = v_u_68.TextTransparency
                        end
                    end)
                    Instance.new("UIAspectRatioConstraint").Parent = v_u_68
                    local v71 = Instance.new("UIPadding")
                    v71.PaddingBottom = UDim.new(0.2, 0)
                    v71.PaddingLeft = UDim.new(0.2, 0)
                    v71.PaddingRight = UDim.new(0.2, 0)
                    v71.PaddingTop = UDim.new(0.2, 0)
                    v71.Parent = v_u_68
                    v_u_59.new(function(p72)
                        local v_u_73 = v_u_60.COUNTDOWN_LENGTH
                        local v74 = TweenInfo.new(0.65, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                        while v_u_73 > 0 do
                            v_u_68.Text = v_u_73
                            v_u_68.Position = UDim2.new(0.5, 0, 0, 0)
                            v_u_68.TextTransparency = 1
                            v_u_2.new(v_u_68, v74, {
                                ["TextTransparency"] = 0,
                                ["Position"] = UDim2.new(0.5, 0, 0.65, 0)
                            }):andThen(function()
                                if v_u_73 <= 3 then
                                    v_u_58.FX:play("SfxRaceCountdown321Mono", v_u_62)
                                end
                                return v_u_59.delay(0.35)
                            end):await()
                            local v75 = v_u_73 - 1
                            v_u_73 = v75
                        end
                        v_u_68.Size = UDim2.new(0, 0, 0, 0)
                        v_u_59.delay(0.35):await()
                        p72()
                    end):andThen(function()
                        local v76 = TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                        v_u_68.Text = "GO!"
                        v_u_58.FX:play("SfxRaceCountdownGOMono", v_u_62)
                        return v_u_2.new(v_u_68, v76, {
                            ["Size"] = UDim2.new(1, 0, 1, 0)
                        })
                    end):andThen(function()
                        local v77 = TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false, 0.35)
                        return v_u_2.new(v_u_68, v77, {
                            ["Size"] = UDim2.new(0, 0, 0, 0)
                        })
                    end):finally(function()
                        v_u_62:Destroy()
                    end)
                end
            end
        }
    end,
    ["RACETRACK_BOOSTER_PAD"] = function(p_u_78, p_u_79, p_u_80, p_u_81)
        return {
            ["render"] = function(_, p82)
                local v_u_83 = v_u_1("VehicleClient")
                p82.Collider.Touched:Connect(function(p84)
                    local v85 = v_u_83.get_current_vehicle_wrapper()
                    if not v85 then
                        return
                    end
                    if not (v85.is_boosting and v85.boost_percentage_max_speed) then
                        return
                    end
                    if v85:is_boosting() then
                        return
                    end
                    local v86 = v85.vehicle_model
                    if not v86 then
                        return
                    end
                    local v87 = v86:FindFirstChild("Assemblies")
                    local v88 = false
                    for _, v89 in v86:GetDescendants() do
                        if v89.Name == "Wheel" and (v89:IsA("BasePart") and not (v87 and v89:IsDescendantOf(v87))) and v89 == p84 then
                            v88 = true
                            break
                        end
                    end
                    if v88 then
                        v_u_1("SoundPlayer").FX:play("SfxRaceLaunch")
                        v85:boost_percentage_max_speed(p_u_78, p_u_79, p_u_80, p_u_81)
                    end
                end)
            end
        }
    end
}