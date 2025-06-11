--// ReplicatedStorage.ClientDB.ToolDB (ModuleScript)

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v_u_2("ContentPackHelper")
local v_u_4 = v_u_2("ToolDBHelper")
v_u_2("Debug").create_log()
local v_u_5 = v_u_2("PetReactionName")
local v_u_6 = v_u_2("EquippedPets")
local v_u_7 = v_u_2("new:StreamingHelper")
v_u_2("package:Sift")
local v_u_8 = v_u_2("package:Promise")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("ReplicatedStorage")
local v621 = {
    ["ThrowToyTool"] = {
        ["health_check_validation"] = v_u_4.HEALTH_CHECK_VALIDATIONS.has_mouth_attachment,
        ["client_use"] = function(_, _, p11, _, p12)
            v_u_2("ThrowToyHelper").generic_throw_toy_use(p11.item_data, p12, {
                ["reaction_name"] = v_u_5.ThrowToyReaction
            })
        end
    },
    ["SqueakyToyTool"] = {
        ["health_check_validation"] = v_u_4.HEALTH_CHECK_VALIDATIONS.has_mouth_attachment,
        ["client_use"] = function(_, _, p13, _, p14)
            local v15 = v_u_2("ThrowToyHelper")
            local v16 = v_u_2("ToolHandleHelper")
            local v_u_17 = v_u_2("RouterClient")
            local v_u_18 = v_u_2("SqueakyToyClient")
            local v19 = v15.generic_throw_toy_use(p13.item_data, p14, {
                ["reaction_name"] = v_u_5.ThrowToyReaction
            })
            if v19 then
                local v_u_20 = tick() - 10
                local v_u_21 = nil
                local v_u_22 = v16.get_largest_part(v19:GetChildren())
                v_u_22.Touched:connect(function(p23)
                    local v24 = p23.Parent:FindFirstChild("Humanoid") or v_u_22.Parent.Parent:FindFirstChild("Humanoid")
                    local v25 = v24 and 0.75 or 0.25
                    if p23.Parent == v_u_22.Parent then
                        return
                    elseif v25 < tick() - v_u_20 then
                        if p23 == v_u_21 then
                            return
                        elseif v24 or v_u_22.Velocity.Magnitude >= 8 then
                            v_u_20 = tick()
                            v_u_21 = p23
                            v_u_17.get("PetObjectAPI/TriggerSqueakEffect"):FireServer(v_u_22)
                            v_u_18.play_squeak_effect(v_u_22, true)
                        end
                    else
                        return
                    end
                end)
            end
        end
    },
    ["FlyingDiscTool"] = {
        ["health_check_validation"] = v_u_4.HEALTH_CHECK_VALIDATIONS.has_mouth_attachment,
        ["client_use"] = function(_, _, p26, _, p27)
            local v_u_28 = v_u_2("ToolHandleHelper")
            local v29 = v_u_2("ThrowToyHelper")
            local v_u_30 = v_u_2("Maid")
            local function v_u_34(p31)
                local v32 = 0
                for _, v33 in pairs(p31:GetDescendants()) do
                    if v33:IsA("BasePart") then
                        v32 = v32 + v33:GetMass()
                    end
                end
                return v32
            end
            v29.generic_throw_toy_use(p26.item_data, p27, {
                ["reaction_name"] = v_u_5.ThrowToyReaction,
                ["custom_throw_function"] = function(p35, p36)
                    local v37 = v_u_28.get_largest_part(p35:GetChildren())
                    local v38 = math.random(-30, 30)
                    local v39 = p35:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(v38), 0)
                    local v40 = Instance.new("BodyForce")
                    local v41 = -(v38 * math.random() * 3)
                    local v42 = v_u_34(p35)
                    local v43 = p36.RightVector * v41
                    local v44 = v42 * 140
                    v40.Force = v43 + Vector3.new(0, v44, 0)
                    v40.Parent = v37
                    v37.Velocity = p36.LookVector * 50 + p36.RightVector * v38 + Vector3.new(0, 20, 0)
                    v37.RotVelocity = (v37.CFrame * v37.CFrame:toObjectSpace(v39)).LookVector * 10
                    local v_u_45 = v_u_30.new()
                    v_u_45.body_force = v40
                    for _, v46 in pairs(p35:GetDescendants()) do
                        if v46:IsA("BasePart") then
                            v_u_45:GiveTask(v46.Touched:connect(function(p47)
                                if p47.CanCollide then
                                    v_u_45:DoCleaning()
                                    v_u_45 = nil
                                end
                            end))
                        end
                    end
                    p35:SetPrimaryPartCFrame(v39)
                end
            })
        end
    },
    ["ChewToyTool"] = {
        ["health_check_validation"] = v_u_4.HEALTH_CHECK_VALIDATIONS.has_mouth_attachment,
        ["client_use"] = function(_, _, p48, _, p49)
            v_u_2("ThrowToyHelper").generic_throw_toy_use(p48.item_data, p49, {
                ["custom_throw_function"] = function(_, _) end,
                ["cant_use_in_water"] = true,
                ["cleanup_when_touch_water"] = true,
                ["reaction_name"] = v_u_5.ChewToyReaction
            })
        end
    },
    ["HintTool"] = {
        ["client_use"] = function(p50)
            v_u_2("UIManager").apps.HintApp:hint({
                ["text"] = p50.tool_hint_text,
                ["length"] = p50.tool_hint_length,
                ["overridable"] = true,
                ["yields"] = false
            })
        end
    },
    ["GenericTool"] = {
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use_start"] = v_u_4.generic_server_use_start,
        ["server_use_end"] = v_u_4.generic_server_use_end
    },
    ["FlyingTool"] = {
        ["client_use"] = function(p51, _, p52)
            local v53 = v_u_2("ObbyM")
            local v54 = v_u_2("UIManager")
            local v55 = v_u_2("WeatherClient")
            local v56 = v_u_2("AnimationManager")
            if v53.is_in_obby() then
                v54.apps.DialogApp:dialog({
                    ["text"] = "You cannot use this tool in an Obby",
                    ["button"] = "Okay"
                })
                return
            end
            if p51.id == "flying_broomstick" and v55.get_time_of_day() == "DAY" then
                v54.apps.HintApp:hint({
                    ["text"] = "The Flying Broomstick\'s magic only works at night",
                    ["length"] = 5.5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
                return
            end
            if not p52.msg_shown then
                p52.msg_shown = true
                v54.apps.HintApp:hint({
                    ["text"] = "Jump to stop flying; Rotate camera to control",
                    ["length"] = 8,
                    ["yields"] = false
                })
            end
            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
                wait(0.1)
            end
            local v57 = v56.get_track(p51.anims.use)
            local v_u_58 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v57)
            v_u_58:Play()
            local v_u_59 = Instance.new("BodyVelocity")
            v_u_59.MaxForce = Vector3.new(50000, 50000, 50000)
            v_u_59.Name = "GliderFlying"
            v_u_59.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v_u_60 = Instance.new("BodyGyro")
            v_u_60.MaxTorque = Vector3.new(5000, 5000, 5000)
            v_u_60.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
            function p52.stop_flying()
                v_u_59:Destroy()
                v_u_60:Destroy()
                v_u_58:Stop()
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
            end
            local v61 = tick()
            local v62 = game:GetService("RunService")
            while p52:is_equipped() and (p51.id ~= "flying_broomstick" or v55.get_time_of_day() == "NIGHT") do
                if game.Players.LocalPlayer.Character.Humanoid.Sit then
                    v61 = tick()
                end
                if tick() - v61 > 0.1 or (v53.is_in_obby() or game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil) then
                    break
                end
                local v63 = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(0.3490658503988659, 0, 0)
                v_u_59.Velocity = v63.lookVector * 27
                v_u_60.CFrame = v63
                v62.Stepped:wait()
            end
            if p51.id == "flying_broomstick" and v55.get_time_of_day() == "DAY" then
                v54.apps.HintApp:hint({
                    ["text"] = "The Flying Broomstick\'s magic only works at night",
                    ["length"] = 5.5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
            end
            p52.stop_flying()
        end,
        ["unequipped"] = function(_, p64)
            if p64.stop_flying then
                p64.stop_flying()
            end
        end
    },
    ["PogoTool"] = {
        ["equipped"] = function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 3, 0)
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            end
        end,
        ["unequipped"] = function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
            end
        end
    },
    ["BalloonTool"] = {
        ["equipped"] = function(_, p65)
            local v66 = v_u_2("ObbyM")
            local v67 = 0
            for _, v68 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v68:IsA("BasePart") then
                    v67 = v67 + v68:GetMass()
                end
            end
            for _, v69 in pairs(p65.tool:GetDescendants()) do
                if v69:IsA("BasePart") then
                    v67 = v67 + v69:GetMass()
                end
            end
            local v70 = workspace.Gravity * v67 * 0.7
            local v71 = Vector3.new(0, v70, 0)
            local v72 = Instance.new("BodyForce")
            local v73
            if v66.is_in_obby() then
                v73 = Vector3.new() or v71
            else
                v73 = v71
            end
            v72.Force = v73
            v72.Parent = p65.tool.ModelHandle.RightMount
            p65.bf = v72
            while p65:is_equipped() and v72 do
                local v74
                if v66.is_in_obby() then
                    v74 = Vector3.new() or v71
                else
                    v74 = v71
                end
                v72.Force = v74
                wait(0.5)
            end
        end,
        ["unequipped"] = function(_, p75)
            if p75.bf then
                p75.bf:Destroy()
            end
        end
    },
    ["ChineseLanternTool"] = {
        ["client_use"] = function(_, _, _)
            v_u_2("RouterClient").get("EventAPI/FlyLantern"):InvokeServer()
        end
    },
    ["HalloweenEventPumpkin"] = {
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use"] = function(p76, _)
            if p76.Character.Head.Transparency == 0 then
                p76.Character.Head.Transparency = 1
                if p76.Character.Head:FindFirstChild("face") then
                    p76.Character.Head:FindFirstChild("face").Transparency = 1
                    return
                end
            else
                p76.Character.Head.Transparency = 0
                if p76.Character.Head:FindFirstChild("face") then
                    p76.Character.Head:FindFirstChild("face").Transparency = 0
                end
            end
        end
    },
    ["StrollerTool"] = {
        ["equipped"] = function(p77, p78)
            local v79 = v_u_2("AnimationManager")
            local v80 = v_u_2("ClientData").get("team")
            local v81 = p77.anims and (v80 == "Babies" and p77.anims.baby_hold or p77.anims.parent_hold) or (v80 == "Babies" and "BabyHoldingStroller" or "ParentHoldingStroller")
            p78.hold_animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v79.get_track(v81))
            p78.hold_animation:Play()
        end,
        ["unequipped"] = function(_, p_u_82)
            v_u_2("RouterClient").get("AdoptAPI/UnequipStroller"):FireServer()
            if p_u_82.hold_animation then
                task.spawn(function()
                    repeat
                        task.wait()
                    until p_u_82.tool.Parent == nil
                    p_u_82.hold_animation:Stop()
                end)
            end
        end
    },
    ["FloatTool"] = {
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use"] = function(p_u_83, _, p84)
            local v85 = v_u_2("DataM")
            local v86 = v_u_2("Utilities")
            local v_u_87 = v_u_2("ServerRouter")
            local v88 = p_u_83.Character.HumanoidRootPart.CFrame
            local v89 = p84:get_equipped_tool()
            if v89 == nil or v89.Parent == nil then
                return
            elseif v89:FindFirstChild("ModelHandle") ~= nil then
                local v_u_90 = v89.ModelHandle:clone()
                local v91 = v_u_90:FindFirstChild("RightMount") or v_u_90:FindFirstChild("LeftMount")
                assert(v91, "mount does not exist")
                v91:Destroy()
                local v92 = nil
                for _, v93 in pairs(v_u_90:GetDescendants()) do
                    if v93:IsA("BasePart") then
                        v93.CustomPhysicalProperties = PhysicalProperties.new(0.3, 1, 0.1)
                        if v93:IsA("Seat") then
                            v93.CanCollide = false
                            v93.Disabled = true
                            v93:AddTag("FloatSeat")
                        else
                            v93.CollisionGroup = "players"
                            v93.CanCollide = true
                            v93.Massless = false
                        end
                        if v92 then
                            v86.weld(v92, v93)
                        else
                            v92 = v93
                        end
                    end
                end
                local v94 = p84.entry.forward_drop_offset or 3
                v_u_90.PrimaryPart = v_u_90.MainPart
                v_u_90:SetPrimaryPartCFrame(v_u_90.MainPart.CFrame + v88.lookVector * v94)
                v_u_90:SetAttribute("owner_user_id", p_u_83.UserId)
                v_u_90.Parent = workspace
                v_u_90.MainPart:SetNetworkOwner(p_u_83)
                local v95 = v85.get_store(p_u_83)
                v95:get("equip_manager"):unequip(p84)
                local v_u_96 = Instance.new("BodyPosition")
                v_u_96.MaxForce = Vector3.new(0, 0, 0)
                v_u_96.Parent = v_u_90.MainPart
                local v97 = Instance.new("BodyGyro")
                v97.MaxTorque = Vector3.new(40000, 0, 40000)
                v97.CFrame = CFrame.new(0, 1, 0)
                v97.Parent = v_u_90.MainPart
                local v_u_98 = Instance.new("BodyAngularVelocity")
                v_u_98.AngularVelocity = Vector3.new(0, 0.2, 0)
                v_u_98.MaxTorque = Vector3.new(4000, 4000, 4000)
                v_u_98.P = 1250
                v_u_98.Parent = v_u_90.MainPart
                local v99 = Instance.new("Attachment")
                v99.Parent = v_u_90.MainPart
                local v_u_100 = Instance.new("VectorForce")
                v_u_100.Attachment0 = v99
                v_u_100.Force = Vector3.new(0, 0, 0)
                v_u_100.Parent = v_u_90.MainPart
                local v_u_101 = 31
                local v_u_102 = v_u_90.MainPart.Size.Y / 2
                coroutine.wrap(function()
                    while v_u_90.Parent do
                        local v103 = Ray.new(v_u_90.MainPart.Position + Vector3.new(0, 3, 0), Vector3.new(0, -12, 0))
                        local v104, v105, _, v106 = v_u_87.get("ToolAPI/CastWaterRaycast"):InvokeClient(p_u_83, v103)
                        if v104 and v106 == Enum.Material.Water then
                            local v107 = v_u_102
                            v_u_96.Position = v105 + Vector3.new(0, v107, 0)
                            v_u_96.MaxForce = Vector3.new(0, 10000, 0)
                            v_u_98.MaxTorque = Vector3.new(4000, 4000, 4000)
                            if v_u_101 > 30 then
                                v_u_101 = 0
                                local v108 = (math.random() - 0.5) * 20
                                local v109
                                if v108 > 0 then
                                    v109 = v108 + 10
                                else
                                    v109 = v108 - 10
                                end
                                local v110 = (math.random() - 0.5) * 20
                                local v111
                                if v109 > 0 then
                                    v111 = v110 + 10
                                else
                                    v111 = v110 - 10
                                end
                                v_u_100.Force = Vector3.new(v109, 0, v111)
                            end
                        else
                            v_u_101 = 31
                            v_u_96.MaxForce = Vector3.new(0, 0, 0)
                            v_u_100.Force = Vector3.new(0, 0, 0)
                            v_u_98.MaxTorque = Vector3.new(0, 0, 0)
                        end
                        v_u_101 = v_u_101 + wait(0.3)
                    end
                end)()
                v95:get("flotation_manager"):register_floaty(v_u_90)
            end
        end
    },
    ["TombstoneTool"] = {
        ["client_use"] = function(p112, p113, p114)
            p113()
            v_u_4.generic_client_use(p112, p113, p114)
        end,
        ["server_use"] = function(p115, _)
            local function v123(p116)
                local v117 = {}
                for _, v118 in pairs({
                    "LeftHand",
                    "LeftLowerArm",
                    "LeftUpperArm",
                    "RightHand",
                    "RightLowerArm",
                    "RightUpperArm",
                    "UpperTorso",
                    "LeftFoot",
                    "LeftLowerLeg",
                    "LeftUpperLeg",
                    "RightFoot",
                    "RightLowerLeg",
                    "RightUpperLeg",
                    "LowerTorso",
                    "Head"
                }) do
                    if p116:FindFirstChild(v118) then
                        local v119 = p116[v118]
                        table.insert(v117, v119)
                    end
                end
                for _, v120 in pairs(p116:GetChildren()) do
                    if v120:IsA("Accessory") and v120:FindFirstChild("Left") == nil then
                        for _, v121 in pairs(v120:GetDescendants()) do
                            if v121:IsA("BasePart") then
                                table.insert(v117, v121)
                            end
                        end
                    end
                end
                if p116:FindFirstChild("Head") then
                    for _, v122 in pairs(p116.Head:GetDescendants()) do
                        if v122:IsA("Decal") then
                            table.insert(v117, v122)
                        end
                    end
                end
                return v117
            end
            if p115.Character and p115.Character:FindFirstChild("UpperTorso") then
                local v124 = game:GetService("TweenService")
                local v125 = v123(p115.Character)
                if p115.Character.UpperTorso.Transparency == 0 then
                    for _, v126 in pairs(v125) do
                        v124:Create(v126, TweenInfo.new(1), {
                            ["Transparency"] = 0.95
                        }):Play()
                    end
                else
                    for _, v127 in pairs(v125) do
                        v124:Create(v127, TweenInfo.new(1), {
                            ["Transparency"] = 0
                        }):Play()
                    end
                end
            else
                return
            end
        end
    },
    ["TradeLicense"] = {
        ["client_use"] = function()
            v_u_2("UIManager").set_app_visibility("TradeHistoryApp", true)
        end
    },
    ["PotionTool"] = {
        ["client_use"] = function(...)
            return v_u_2("PotionM").attempt_to_consume(...)
        end
    },
    ["CandyTool"] = {
        ["client_use"] = function(p128, p129, p130)
            local v131 = v_u_2("ObbyM")
            local v132 = v_u_2("UIManager")
            if v131.is_in_obby() then
                v132.apps.DialogApp:dialog({
                    ["text"] = "You cannot eat sweets in an Obby",
                    ["button"] = "Okay"
                })
            else
                if v_u_4.generic_client_use(p128, p129, p130) == false then
                    return false
                end
                if not v131.is_in_obby() then
                    local v133 = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
                    if v133 <= 26 then
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v133 + 10
                        return
                    end
                    if v133 <= 31 then
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v133 + 5
                        return
                    end
                    if v133 <= 60 then
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v133 + 3
                        return
                    end
                    if v133 <= 100 then
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v133 + 2
                    end
                end
            end
        end,
        ["server_use"] = v_u_4.generic_server_use_end
    },
    ["GiftTool"] = {
        ["client_use"] = function(p134, p135, p136)
            if not v_u_4.confirm_use(p134) then
                return false
            end
            local v137 = v_u_2("SoundPlayer")
            local v138 = v_u_2("RouterClient")
            local v139 = v_u_2("GrammarUtil")
            local v140 = v_u_2("InventoryDB")
            local v_u_141 = v_u_2("UIManager")
            v137.FX:play("GiftUnwrap")
            v138.get("ShopAPI/IndicateOpenGift"):FireServer(p136.item_data.unique)
            v_u_4.generic_client_use(p134, p135, p136)
            v137.FX:play("MagicExplosion")
            local v142, v143 = v138.get("ShopAPI/OpenGift"):InvokeServer(p136.item_data.unique)
            if v142 and v143 then
                local v144 = {
                    ["entry"] = v140[v142][v143],
                    ["subject_phrase"] = "You",
                    ["verb_phrase"] = "found"
                }
                local v_u_145 = v139.build_subject_verb_item_string(v144)
                task.spawn(function()
                    local v146 = {
                        ["text"] = v_u_145,
                        ["length"] = 4
                    }
                    v_u_141.apps.HintApp:hint(v146)
                end)
            end
        end
    },
    ["RatBoxTool"] = {
        ["client_use"] = function(p147, _, p148)
            if not v_u_4.confirm_use(p147) then
                return false
            end
            local v149 = v_u_2("SoundPlayer")
            local v150 = v_u_2("RouterClient")
            local v151 = v_u_2("Spring")
            v149.FX:play("GiftUnwrap")
            local v_u_152 = p148.tool.ModelHandle:Clone()
            v_u_152.PrimaryPart = v_u_152.BoxInterior
            v_u_152.LeftMount:ClearAllChildren()
            for _, v153 in ipairs(v_u_152:GetChildren()) do
                if v153:IsA("BasePart") then
                    v153.Anchored = true
                end
            end
            local v154 = p148.item_data.unique
            v150.get("ToolAPI/Unequip"):InvokeServer(v154)
            v_u_152.Parent = workspace
            local v_u_155 = Random.new()
            local v_u_156 = v_u_152.PrimaryPart.CFrame
            local v_u_157 = v151.new(0.75, 2, (Vector3.new()))
            local v_u_158 = v151.new(0.75, 2, v_u_156.LookVector)
            local v_u_159 = 0
            local v_u_160 = tick() + v_u_155:NextNumber(0.75, 1.5)
            local v_u_161 = v_u_156.Position
            v_u_158:set_goal((v_u_156.LookVector * Vector3.new(1, 0, 1)).Unit)
            local v180 = game:GetService("RunService").Heartbeat:Connect(function(p162)
                v_u_159 = v_u_159 + p162
                if v_u_160 < tick() then
                    v_u_160 = tick() + v_u_155:NextNumber(0.75, 1.5)
                    local v163 = v_u_159 * 5
                    local v164 = v_u_158
                    local v165 = v_u_155:NextNumber(-v163, v163)
                    local v166 = v_u_155:NextNumber(-v163, v163)
                    local v167 = v_u_155
                    local v168 = -v163
                    v164:set_velocity((Vector3.new(v165, v166, v167:NextNumber(v168, v163))))
                    local v169 = v_u_157
                    local v170 = v_u_155:NextNumber(-v163, v163)
                    local v171 = v_u_155:NextNumber(-v163, v163)
                    local v172 = v_u_155
                    local v173 = -v163
                    v169:set_velocity((Vector3.new(v170, v171, v172:NextNumber(v173, v163))))
                end
                v_u_157:update(p162)
                local v174 = v_u_157:get_position()
                v_u_158:update(p162)
                local v175 = v_u_158:get_position()
                local v176 = v_u_159
                local v177 = v_u_156.Position + Vector3.new(0, v176, 0) + v174
                local v178 = CFrame.Angles(0, v_u_159 ^ 1.75 % 6.283185307179586, 0)
                local v179 = CFrame.new(v177, v177 + v175) * v178
                v_u_161 = v179.Position
                v_u_152:SetPrimaryPartCFrame(v179)
            end)
            wait(4)
            local v_u_181 = v_u_152.BoxTop:Clone()
            v_u_181.Parent = workspace
            v_u_181.Transparency = 1
            v_u_181.Parent = workspace
            local v182 = v_u_161
            local v183 = 0
            for _, v184 in ipairs(v_u_181:GetChildren()) do
                if v184:IsA("ParticleEmitter") then
                    v184:Emit(v184.Rate)
                    if v183 < v184.Lifetime.Max then
                        v183 = v184.Lifetime.Max
                    end
                end
            end
            delay(v183, function()
                v_u_181:Destroy()
            end)
            v180:Disconnect()
            v_u_152:Destroy()
            v149.FX:play("MagicExplosion")
            v150.get("PetAPI/ExchangeRatBox"):InvokeServer(v154, v182)
        end
    },
    ["MonkeyBoxTool"] = {
        ["client_use"] = function(p185, _, p186)
            if v_u_4.confirm_use(p185) then
                local v187 = v_u_2("SoundPlayer")
                local v188 = v_u_2("RouterClient")
                local v189 = v_u_2("UIManager")
                local v190 = v_u_2("AnimationManager")
                local v_u_191 = p186.tool.ModelHandle:Clone()
                v_u_191.PrimaryPart = v_u_191.HumanoidRootPart
                v_u_191.LeftMount:ClearAllChildren()
                v_u_191.PrimaryPart.Anchored = true
                local v192 = p186.item_data.unique
                v188.get("ToolAPI/Unequip"):InvokeServer(v192)
                v_u_191.Name = v192
                if workspace:FindFirstChild(v_u_191.Name) then
                    v_u_191:Destroy()
                else
                    v187.FX:play("GiftUnwrap")
                    v_u_191.Parent = workspace
                    local v193 = v190.get_track(p185.anims.open)
                    game:GetService("ContentProvider"):PreloadAsync({ v193 })
                    v_u_191.AnimationController:LoadAnimation(v193):Play()
                    local v_u_194 = 0
                    local v_u_195 = v_u_191.PrimaryPart.Position
                    local v200 = game:GetService("RunService").Heartbeat:Connect(function(p196)
                        v_u_194 = v_u_194 + p196
                        local v197 = v_u_194
                        local v198 = v_u_195 + Vector3.new(0, v197, 0)
                        local v199 = CFrame.Angles(0, v_u_194 ^ 1.75 % 6.283185307179586, 0)
                        v_u_191:SetPrimaryPartCFrame(CFrame.new(v198) * v199)
                    end)
                    if p185.id == "monkey_box" then
                        wait(2.2)
                    else
                        wait(1.2)
                    end
                    local v_u_201 = v_u_191.HumanoidRootPart:Clone()
                    v_u_201.Anchored = true
                    v_u_201.Parent = workspace
                    v_u_201.Transparency = 1
                    v_u_201.Parent = workspace
                    local v202 = 0
                    for _, v203 in ipairs(v_u_201:GetChildren()) do
                        if v203:IsA("ParticleEmitter") then
                            v203:Emit(v203.Rate)
                            if v202 < v203.Lifetime.Max then
                                v202 = v203.Lifetime.Max
                            end
                        end
                    end
                    v187.FX:play("MagicExplosion")
                    delay(v202, function()
                        v_u_201:Destroy()
                    end)
                    v200:Disconnect()
                    local v204 = v188.get("PetAPI/ExchangeMonkeyBox"):InvokeServer(v192, v_u_191.PrimaryPart.CFrame)
                    v189.apps.JackboxRewardApp:show_rewards(v204)
                    delay(0.5, function()
                        v_u_191:Destroy()
                    end)
                end
            else
                return false
            end
        end
    },
    ["BatBoxTool"] = {
        ["equipped"] = function()
            v_u_2("PetBoxHelper").preload_animations({ "BatBoxOpen" })
        end,
        ["client_use"] = function(p205, _, p206)
            local v210 = {
                ["box_entry"] = p205,
                ["tool_state"] = p206,
                ["rig_model_name"] = "BatBoxRig",
                ["finish_at_marker"] = "Lifted",
                ["animations"] = { "BatBoxOpen" },
                ["marker_reached_callbacks"] = {
                    ["Landed"] = function(p207)
                        p207.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Hopped"] = function(p208)
                        p208.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Lifted"] = function(p209)
                        p209.PrimaryPart.LiftedParticleAttachment.LiftedParticle:Emit(20)
                    end
                }
            }
            v_u_2("PetBoxHelper").exchange_box_with_animation(v210)
        end
    },
    ["OxBoxTool"] = {
        ["equipped"] = function()
            v_u_2("PetBoxHelper").preload_animations({ "OxBoxOpen1", "OxBoxOpen2", "OxBoxOpen3" })
        end,
        ["client_use"] = function(p211, _, p212)
            local v216 = {
                ["box_entry"] = p211,
                ["tool_state"] = p212,
                ["rig_model_name"] = "OxBoxRig",
                ["finish_at_marker"] = "Lifted",
                ["animations"] = { "OxBoxOpen1", "OxBoxOpen2", "OxBoxOpen3" },
                ["marker_reached_callbacks"] = {
                    ["Landed"] = function(p213)
                        p213.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Hopped"] = function(p214)
                        p214.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Lifted"] = function(p215)
                        p215.PrimaryPart.LiftedParticleAttachment.LiftedParticle:Emit(20)
                    end
                }
            }
            v_u_2("PetBoxHelper").exchange_box_with_animation(v216)
        end
    },
    ["MessageTool"] = {
        ["client_use"] = function(p217)
            v_u_2("UIManager").apps.DialogApp:dialog({
                ["text"] = p217.message,
                ["button"] = "Okay"
            })
            return false
        end
    },
    ["BabyFormulaTool"] = {
        ["client_use"] = function(p218, p219, p220)
            if v_u_2("UIManager").apps.DialogApp:dialog({
                ["text"] = "Product Description: Cures the hunger and thirst of all nearby babies and pets (Does not hatch eggs)",
                ["left"] = "Cancel",
                ["right"] = "Use Now"
            }) == "Cancel" then
                return false
            end
            v_u_4.generic_client_use(p218, p219, p220)
        end,
        ["server_use"] = function(p221, _)
            local v222 = v_u_2("new:AilmentsServer")
            local v223 = v_u_2("CharacterWrapper")
            local v224 = v_u_2("InventoryDB")
            local v225 = v_u_2("BucksAgingMultiplierHelper")
            if p221.Character == nil or p221.Character:FindFirstChild("HumanoidRootPart") == nil then
                return
            end
            for _, v226 in v223.get_all_char_wrappers() do
                if v226.char:FindFirstChild("HumanoidRootPart") and (v226.char.HumanoidRootPart.Position - p221.Character.HumanoidRootPart.Position).Magnitude < 45 then
                    local v227 = v226.is_pet
                    if v227 then
                        v227 = v224.pets[v226.pet_id].is_egg
                    end
                    if v227 then
                        local v228 = v226.pet_progression_manager:get_ailments_to_completion()
                        local v229 = v225.apply_aging_multiplier(p221, 1)
                        for _, v230 in { "hungry", "thirsty" } do
                            if v229 >= v228 then
                                break
                            end
                            v222.add_progress(v226, v230, 1)
                            v228 = v228 - v229
                        end
                    else
                        v222.add_progress(v226, "hungry", 1)
                        v222.add_progress(v226, "thirsty", 1)
                    end
                end
            end
        end
    },
    ["PizzaShopPizza"] = {
        ["server_render"] = function(p231, p232)
            v_u_2("PizzaRenderHelper").render(p232, p231.properties.pizza)
        end,
        ["client_use"] = function(p233, p234, p235, p236, p237, p238, p239)
            local v240 = p235:get_updated_item_data().properties.pizza
            if not v240.boxed then
                if v240.state ~= "Dough" then
                    return v_u_4.generic_client_use(p233, p234, p235, p236, p237, p238, p239)
                end
            end
        end,
        ["server_use_end"] = function(p241, p242, p243, p244)
            local v245 = v_u_2("SoundPlayer")
            local v246 = p243.properties.pizza
            if v246.boxed then
                v246.boxed = false
                p243.properties.pizza = v246
                local v247 = v_u_10.Resources.PizzaBoxOpen:Clone()
                v247:SetPrimaryPartCFrame(p244[1].Box.Bottom.CFrame)
                v247.Parent = workspace
                task.delay(5, v247.Destroy, v247)
                local v248 = v245.FX
                local v249 = "Roleplay/BoxSound"
                local v250 = p241.Character
                if v250 then
                    v250 = p241.Character.PrimaryPart
                end
                v248:play(v249, v250)
            elseif v246.state ~= "Dough" then
                return v_u_4.generic_server_use_end(p241, p242, p243, p244)
            end
        end
    },
    ["PizzaShopDirtyPlates"] = {
        ["client_use"] = function()
            local v251 = v_u_2("UIManager")
            local v252 = v_u_2("FurnitureRegistry").get_all_furniture_of_id("pizza_shop_sink")[1]
            if v252 then
                v251.apps.GuideArrowApp:navigate("PizzaShop", v252.UseBlocks.UseBlock.Position, function(p253, p254)
                    return (p253 - p254).magnitude < 11
                end)
            end
        end,
        ["server_render"] = function(p255, p256)
            p256["Plate" .. 1].Transparency = p255.properties.count >= 1 and 0 or 1
            p256["Plate" .. 2].Transparency = p255.properties.count >= 2 and 0 or 1
            p256["Plate" .. 3].Transparency = p255.properties.count >= 3 and 0 or 1
            p256["Plate" .. 4].Transparency = p255.properties.count >= 4 and 0 or 1
        end
    },
    ["PizzaTool"] = {
        ["equipped"] = function()
            v_u_2("ScriptUtil")
            local v257 = v_u_2("AnimationManager").get_track("PizzaThrownInAir")
            game:GetService("ContentProvider"):PreloadAsync({ v257 })
            wait()
            game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v257):Play()
        end,
        ["client_use"] = function(p258, p259, p260, p261, p262, p263, p264)
            local v265 = v_u_2("RouterClient")
            v265.get("ToolAPI/ModifyItemTopping"):InvokeServer("slice_visible", true)
            local v266 = v_u_4.generic_client_use(p258, p259, p260, p261, p262, p263, p264)
            v265.get("ToolAPI/ModifyItemTopping"):InvokeServer("slice_visible", false)
            return v266
        end,
        ["server_use"] = v_u_4.generic_server_use_end,
        ["server_render"] = function(p267, p268)
            local function v272(p269, p270)
                for _, v271 in pairs(p269:GetDescendants()) do
                    if v271:IsA("BasePart") then
                        v271.Transparency = p270
                    end
                end
            end
            if p268.Name == "ModelHandle" or p267.properties.slice_visible then
                v272(p268.cheese, p267.properties.cheese and 0 or 1)
                v272(p268.pepperoni, p267.properties.pepperoni and 0 or 1)
                v272(p268.peppers, p267.properties.peppers and 0 or 1)
                v272(p268.tomato_sauce, p267.properties.tomato_sauce and 0 or 1)
                v272(p268.dough, 0)
                if p267.properties.burned then
                    p268.dough.dough.BrickColor = BrickColor.new("Black")
                    return
                elseif p267.properties.baked then
                    p268.dough.dough.BrickColor = BrickColor.new("Bright yellow")
                else
                    p268.dough.dough.BrickColor = BrickColor.new("Pastel yellow")
                end
            else
                v272(p268.cheese, 1)
                v272(p268.pepperoni, 1)
                v272(p268.peppers, 1)
                v272(p268.tomato_sauce, 1)
                v272(p268.dough, 1)
                return
            end
        end
    },
    ["DonutTool"] = {
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use"] = v_u_4.generic_server_use_end,
        ["server_render"] = function(p273, p274)
            p274.chocolate_icing.Transparency = p273.properties.chocolate_icing and 0 or 1
            p274.strawberry_icing.Transparency = p273.properties.strawberry_icing and 0 or 1
            p274.vanilla_icing.Transparency = p273.properties.vanilla_icing and 0 or 1
            p274.dough.Transparency = 0
            if p273.properties.burned then
                p274.dough.BrickColor = BrickColor.new("Black")
                return
            elseif p273.properties.baked then
                p274.dough.BrickColor = BrickColor.new("Nougat")
            else
                p274.dough.BrickColor = BrickColor.new("Buttermilk")
            end
        end
    },
    ["FlashlightTool"] = {
        ["server_use"] = function(_, _, p275)
            p275.properties.flashlight_on = not p275.properties.flashlight_on
        end,
        ["server_render"] = function(p276, p277)
            local v278 = p276.properties.flashlight_on
            local v279 = p277:FindFirstChild("BeamParts")
            for _, v280 in pairs(v279:GetChildren()) do
                v280.Beam.Enabled = v278
            end
            local v281 = p277:FindFirstChild("LightPart")
            v281.SpotLight.Enabled = v278
            v281.BrickColor = v278 and BrickColor.new("Cashmere") or BrickColor.new("Black")
            v281.Material = v278 and Enum.Material.Neon or Enum.Material.SmoothPlastic
        end
    },
    ["MarshmallowTool"] = {
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use"] = v_u_4.generic_server_use_end,
        ["equipped"] = function(_, p_u_282)
            local v_u_283 = v_u_2("RouterClient")
            local v_u_284 = game:GetService("CollectionService")
            local v_u_285 = game.Players.LocalPlayer.Character.HumanoidRootPart
            coroutine.wrap(function()
                while true do
                    if not p_u_282:is_equipped() then
                        return
                    end
                    wait(2)
                    local v286 = v_u_284:GetTagged("CampfirePart")
                    for _, v287 in ipairs(v286) do
                        if v287:IsDescendantOf(workspace) and (v287.Position - v_u_285.Position).Magnitude < 13 then
                            v_u_283.get("ToolAPI/CookMarshmallow"):InvokeServer()
                            break
                        end
                    end
                end
            end)()
        end,
        ["server_render"] = function(p288, p289)
            local v290 = game:GetService("TweenService")
            local v291 = p288.properties.percent_cooked or 0
            local v292 = Color3.fromRGB(248, 248, 248)
            local v293 = Color3.fromRGB(210, 169, 141)
            local v294 = Color3.fromRGB(63, 44, 41)
            if v291 > 0 then
                p289.CookGlow.Transparency = 0.8
                p289.CookGlow.Material = Enum.Material.Neon
                local v295
                if v291 <= 60 then
                    local v296 = v291 / 60
                    local v297 = Color3.new
                    local v298 = v292.r
                    local v299 = v298 + (v293.r - v298) * v296
                    local v300 = v292.g
                    local v301 = v300 + (v293.g - v300) * v296
                    local v302 = v292.b
                    v295 = v297(v299, v301, v302 + (v293.b - v302) * v296)
                else
                    local v303 = (v291 - 60) / 40
                    local v304 = Color3.new
                    local v305 = v293.r
                    local v306 = v305 + (v294.r - v305) * v303
                    local v307 = v293.g
                    local v308 = v307 + (v294.g - v307) * v303
                    local v309 = v293.b
                    v295 = v304(v306, v308, v309 + (v294.b - v309) * v303)
                end
                v290:Create(p289.Marshmallow, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Color"] = v295
                }):Play()
                if v291 == 100 then
                    p289.CookGlow.Fire.Enabled = true
                    return
                end
            else
                p289.CookGlow.Transparency = 1
                p289.CookGlow.Material = Enum.Material.SmoothPlastic
                p289.Marshmallow.Color = v292
            end
        end
    },
    ["MusicalInstrumentTool"] = {
        ["client_use"] = function(p310, _, _)
            local v311 = v_u_2("AnimationManager")
            local v312 = v_u_2("MusicInstrumentClient")
            local v313 = v_u_2("RouterClient")
            local v314 = v_u_2("ClientData")
            if (v314.get("music_instrument_tool_debounce_end") or 0) > tick() then
                return
            else
                local v315 = Random.new():NextInteger(1, #p310.sounds)
                local v316 = p310.sounds[v315]
                if v316 then
                    local v317 = game.Players.LocalPlayer.Character.HumanoidRootPart
                    if v317 then
                        local v318 = v312.play_sound(v316, v317)
                        local v319 = v311.get_track(p310.anims.use)
                        game:GetService("ContentProvider"):PreloadAsync({ v319, v318 })
                        local v320 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v319)
                        v320.Looped = true
                        v320:Play()
                        v314.update("music_instrument_tool_debounce_end", tick() + v318.TimeLength)
                        v313.get("ToolAPI/PlayMusicInstrument"):FireServer(v316)
                        v318.Ended:Wait()
                        v320:Stop()
                    end
                end
            end
        end,
        ["server_use"] = v_u_4.generic_server_use_end
    },
    ["PropellerTool"] = {
        ["equipped"] = function(p321, p_u_322)
            local v_u_323 = v_u_2("ObbyM")
            local v_u_324 = v_u_2("UIManager")
            local v325 = v_u_2("AnimationManager")
            local v326 = game:GetService("UserInputService")
            local v327 = game.Players.LocalPlayer.Character
            local v_u_328 = v327.Humanoid
            local v329 = 0
            for _, v330 in pairs(v327:GetChildren()) do
                if v330:IsA("BasePart") then
                    v329 = v329 + v330:GetMass()
                end
            end
            for _, v331 in pairs(p_u_322.tool:GetDescendants()) do
                if v331:IsA("BasePart") then
                    v329 = v329 + v331:GetMass()
                end
            end
            local v332 = workspace.Gravity * v329 * 0.8
            local v_u_333 = Vector3.new(0, v332, 0)
            local v_u_334 = Instance.new("BodyForce")
            v_u_334.Force = Vector3.new()
            v_u_334.Parent = p_u_322.tool.ModelHandle.RightMount
            local v_u_335 = Instance.new("BodyVelocity")
            v_u_335.MaxForce = Vector3.new()
            v_u_335.P = 2250
            v_u_335.Velocity = Vector3.new(0, 15, 0)
            v_u_335.Parent = p_u_322.tool.ModelHandle.RightMount
            local v336 = p321.spin_anim
            local v337 = v325.get_track(v336)
            local v_u_338 = p_u_322.tool.ModelHandle.AnimationController:LoadAnimation(v337)
            p_u_322.bf = v_u_334
            p_u_322.body_velocity = v_u_335
            p_u_322.propelling = false
            function p_u_322.set_propelling(p339)
                local v340 = p_u_322.propelling
                p_u_322.propelling = p339
                if p_u_322.propelling and not (v340 or v_u_323.is_in_obby()) then
                    v_u_334.Force = v_u_333
                    v_u_335.MaxForce = Vector3.new(0, 1000, 0)
                    v_u_328:ChangeState(Enum.HumanoidStateType.Jumping)
                    v_u_338:Play()
                elseif not p_u_322.propelling and v340 then
                    v_u_335.MaxForce = Vector3.new()
                    v_u_338:Stop()
                end
            end
            p_u_322.humanoid_state_connection = v_u_328.StateChanged:Connect(function(_, p341)
                if p341 == Enum.HumanoidStateType.Landed and not p_u_322.propelling then
                    v_u_334.Force = Vector3.new()
                end
            end)
            local v_u_342 = 0
            p_u_322.uis_connection = v326.JumpRequest:Connect(function()
                if tick() - v_u_342 > 1 then
                    v_u_342 = tick()
                    p_u_322.set_propelling(false)
                end
            end)
            spawn(function()
                v_u_324.apps.HintApp:hint({
                    ["text"] = "Jump to stop propeller",
                    ["length"] = 8
                })
            end)
        end,
        ["client_use"] = function(_, _, p343)
            local v344 = v_u_2("ObbyM")
            if p343.set_propelling then
                p343.set_propelling(true)
                while p343.propelling do
                    if v344.is_in_obby() then
                        p343.set_propelling(false)
                        return
                    end
                    wait()
                end
            end
        end,
        ["unequipped"] = function(_, p345)
            p345.bf:Destroy()
            p345.body_velocity:Destroy()
            p345.uis_connection:Disconnect()
            p345.humanoid_state_connection:Disconnect()
        end
    },
    ["GrapplingHookTool"] = {
        ["client_use"] = function(_, _, p346)
            v_u_2("GrapplingHook").use(p346)
        end,
        ["equipped"] = function(_, p347)
            v_u_2("GrapplingHook").equipped(p347)
        end,
        ["unequipped"] = function(_, p348)
            v_u_2("GrapplingHook").unequipped(p348)
        end,
        ["server_pre_render"] = function(_, p349)
            local v350 = p349:FindFirstChild("Hook")
            if v350:IsA("Model") then
                for _, v351 in ipairs(v350:GetChildren()) do
                    if v351:GetAttribute("Hidden") then
                        v351.Transparency = 1
                    end
                end
            elseif v350:GetAttribute("Hidden") then
                v350.Transparency = 1
            end
        end
    },
    ["PlaceableTool"] = {
        ["equipped"] = function(p_u_352, p_u_353)
            local v_u_354 = v_u_2("Raycast")
            local v_u_355 = v_u_2("AnimationManager")
            local v_u_356 = v_u_2("VehicleBlockerHelper")
            local v_u_357 = v_u_2("FurnitureBlockerHelper")
            local v_u_358 = v_u_2("PlaceableToolHelper")
            local v_u_359 = game.Players.LocalPlayer.Character
            local v_u_360 = v_u_359:FindFirstChild("Humanoid")
            local v_u_361 = v_u_359:FindFirstChild("HumanoidRootPart")
            if v_u_361 and v_u_360 then
                local v362 = p_u_353.tool.ModelHandle
                local v_u_363 = v362:Clone()
                v362:Destroy()
                local v_u_364 = Instance.new("Part")
                v_u_364.Anchored = true
                v_u_364.CanTouch = false
                v_u_364.CanQuery = false
                v_u_364.CanCollide = false
                v_u_364.Transparency = 1
                v_u_364.Name = "PlacementModelBounds"
                v_u_364.Parent = workspace
                v_u_363.Parent = workspace
                v_u_363:BreakJoints()
                for _, v365 in pairs(v_u_363:GetDescendants()) do
                    if v365:IsA("BasePart") then
                        v365.Anchored = true
                        v365.CanCollide = false
                        if v365.Name == "PlacementBlock" or v365.Name == "RightMount" then
                            v365.Transparency = 1
                        elseif v365.Transparency ~= 1 then
                            v365.Transparency = 0.5
                        end
                    end
                end
                local v_u_366 = v_u_363:FindFirstChild("PlacementBlock")
                v_u_363.PrimaryPart = v_u_366
                function p_u_353.get_placement_cf()
                    return v_u_361.CFrame * CFrame.new(0, -(v_u_361.Size.Y / 2) - v_u_360.HipHeight - v_u_366.Size.Y / 2, -v_u_366.Size.Z / 2 - 1) * CFrame.Angles(0, 3.141592653589793, 0)
                end
                function p_u_353.can_place()
                    local v367 = v_u_366.Position
                    local v368 = Ray.new(v367 + Vector3.new(0, 3, 0), Vector3.new(0, -3, 0))
                    local v369 = { v_u_359, v_u_363 }
                    local v370, v371 = v_u_354.FindPartOnRay(v368, v369)
                    local v372, v373 = v_u_363:GetBoundingBox()
                    v_u_364.CFrame = v372
                    v_u_364.Size = v373
                    return v370 and (v370.Anchored and (not v370:IsA("Terrain") and (v371.Y - v367.Y <= 1.25 and (not v_u_356.is_part_colliding_with_vehicle_blocker(v_u_364) and (not v_u_357.is_part_colliding_with_furniture_blocker(v_u_364) and v_u_358.can_place(p_u_352)))))) and true or false
                end
                local v_u_374 = {}
                local function v_u_377(p375)
                    for _, v376 in pairs(v_u_363:GetDescendants()) do
                        if v376:IsA("BasePart") then
                            if not v_u_374[v376] then
                                v_u_374[v376] = v376.Color
                            end
                            v376.Color = p375 and Color3.new(0.9, 0, 0) or v_u_374[v376]
                        end
                    end
                end
                spawn(function()
                    local v378 = game:GetService("RunService")
                    local v379 = true
                    while p_u_353:is_equipped() do
                        v_u_363:SetPrimaryPartCFrame(p_u_353.get_placement_cf())
                        v378.Heartbeat:Wait()
                        local v380 = p_u_353.can_place()
                        if v380 and not v379 then
                            v_u_377(false)
                            v379 = v380
                        elseif v380 or not v379 then
                            v379 = v380
                        else
                            v_u_377(true)
                            v379 = v380
                        end
                    end
                    v_u_363:Destroy()
                    v_u_364:Destroy()
                end)
                if p_u_352.placeable_type == "magic_house_door" then
                    spawn(function()
                        local v381 = { (v_u_355.get_track("MagicDoorSpin")) }
                        game:GetService("ContentProvider"):PreloadAsync(v381)
                    end)
                end
            end
        end,
        ["client_use"] = function(p382, _, p383)
            local v384 = v_u_2("RouterClient")
            local v_u_385 = v_u_2("UIManager")
            local v386 = v_u_2("PlaceableToolHelper")
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if p383.can_place and p383.can_place() then
                    if not v386.validate_placement(p382) then
                        return
                    end
                    if p382.placeable_type == "toy_furniture" then
                        v384.get("ToolAPI/PlaceToyFurniture"):InvokeServer(p383.get_placement_cf())
                        return
                    end
                    local v387 = v384.get("PlaceableToolAPI/CreatePlaceable"):InvokeServer(p383.get_placement_cf())
                    if v387 then
                        local v388 = v_u_7.await(v387, 10)
                        if v388 then
                            v_u_385.apps.SpecialEffectsApp:placement_effect(v388:WaitForChild("PlacementBlock"))
                            return
                        end
                    elseif p382.placeable_type == "placeable_furniture" then
                        v_u_8.fromEvent(v_u_1:GetInstanceAddedSignal(p382.kind)):andThen(function(p389)
                            v_u_385.apps.SpecialEffectsApp:placement_effect(p389:WaitForChild("PlacementBlock"))
                        end)
                    end
                end
            end
        end,
        ["server_render"] = function(_, p390)
            for _, v391 in pairs(p390:GetDescendants()) do
                if v391:IsA("BasePart") then
                    v391.CanCollide = false
                    if v391.Name == "PlacementBlock" or v391.Name == "RightMount" then
                        v391.Transparency = 1
                    end
                end
            end
        end
    },
    ["GoldenGoldfish"] = {
        ["client_use"] = function(_, _, p392)
            v_u_2("PenguinAdoption").throw_food(p392.tool.ModelHandle, p392.item_data.unique)
        end
    },
    ["MudBall"] = {
        ["client_use"] = function(_, _, p393)
            v_u_2("ScarabAdoption").throw_food(p393.tool.ModelHandle, p393.item_data.unique)
        end
    },
    ["Honey"] = {
        ["client_use"] = function(_, _, p394)
            v_u_2("BeeAdoption").throw_honey(p394.tool.ModelHandle, p394.item_data.unique)
        end
    },
    ["GoldenClam"] = {
        ["client_use"] = function(_, _, p395)
            v_u_2("AlbatrossAdoption").throw_treat(p395.tool.ModelHandle, p395.item_data.unique)
        end
    },
    ["ButterflyLeafAsPetBox"] = {
        ["client_use"] = function(p396, _, p397)
            local v398 = v_u_2("PetBoxHelper")
            local v_u_399 = v_u_2("TweenPromise")
            local v_u_400 = v_u_2("SoundPlayer")
            v398.exchange_box_with_promise({
                ["box_entry"] = p396,
                ["tool_state"] = p397,
                ["rig_model_name"] = p396.model_handle .. "Rig",
                ["promise"] = function(p_u_401, p_u_402)
                    local v_u_403 = p_u_401.PrimaryPart.CFrame + Vector3.new(0, -1, 0)
                    local v_u_404 = p_u_401.ParticlesPart
                    v_u_404.Parent = workspace
                    v_u_400.FX:play("GiftUnwrap")
                    v_u_404.SpawnParticleAttachment.SpawnParticle:Emit(10)
                    game:GetService("Debris"):AddItem(v_u_404, 10)
                    return v_u_399.callback(0, 1, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), function(p405)
                        p_u_401:SetPrimaryPartCFrame(v_u_403 * CFrame.Angles(0, 25.132741228718345 * p405, 0) * CFrame.new(0, 1 * p405, 0))
                    end):andThen(function()
                        v_u_400.FX:play("MagicExplosion")
                        p_u_402()
                        v_u_404.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        p_u_401.Parent = nil
                    end)
                end
            })
        end
    },
    ["GoldenBone"] = {
        ["client_use"] = function(_, _, p406)
            v_u_2("ChowChowAdoption").throw_bone(p406.tool.ModelHandle, p406.item_data.unique)
        end
    },
    ["GoldenWheatStalk"] = {
        ["client_use"] = function(_, _, p407)
            v_u_2("PheasantAdoption").throw_food(p407.tool.ModelHandle, p407.item_data.unique)
        end
    },
    ["PetLeash"] = {
        ["client_use"] = function(_, _, p408)
            v_u_2("PetLeash").use(p408)
        end,
        ["unequipped"] = function(_, p409)
            v_u_2("PetLeash").unequipped(p409)
        end
    },
    ["TeaCupTool"] = {
        ["on_no_uses_left"] = function(_, _)
            v_u_2("UIManager").apps.HintApp:hint({
                ["text"] = "Use a kettle to fill your cup!",
                ["length"] = 2.5,
                ["overridable"] = true,
                ["yields"] = false
            })
        end,
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use_start"] = v_u_4.generic_server_use_start,
        ["server_use_end"] = v_u_4.generic_server_use_end,
        ["server_render"] = function(p410, p411)
            local v412 = {
                ["green_tea_kettle"] = Color3.fromRGB(95, 163, 79),
                ["oolong_tea_kettle"] = Color3.fromRGB(75, 68, 58),
                ["jasmine_tea_kettle"] = Color3.fromRGB(208, 124, 230)
            }
            if p410.properties.uses_left and p410.properties.uses_left > 0 then
                p411.Particles.Cloud1.Enabled = true
                p411.Particles.Cloud2.Enabled = true
                p411.Liquid.Decal.Transparency = 0.5
                p411.Liquid.Decal.Color3 = v412[p410.properties.flavor] or Color3.new(1, 1, 1)
            else
                p411.Particles.Cloud1.Enabled = false
                p411.Particles.Cloud2.Enabled = false
                p411.Liquid.Decal.Transparency = 1
            end
        end
    },
    ["Discosplosion"] = {
        ["client_use"] = function(_, _, p413, _, p414)
            v_u_2("DiscosplosionHelper").use(p413, p414)
        end
    },
    ["PetAccessoryTool"] = {
        ["client_use"] = function(_, _, _)
            local v415 = v_u_2("AvatarClientManager")
            local v416 = v_u_2("InventoryDB")
            local v417 = v_u_2("ClientToolManager")
            local v418 = v_u_2("ClientData")
            local v419 = v_u_2("UIManager")
            local v420 = v_u_6.choose_wrapper()
            if v420 == nil then
                v419.apps.DialogApp:dialog({
                    ["text"] = "Use this while you have a pet equipped to make them wear this accessory",
                    ["button"] = "Okay"
                })
                return false
            end
            local v421 = v416.pets[v420.pet_id]
            if v421.is_doll then
                v419.apps.HintApp:hint({
                    ["text"] = "Dolls can\'t wear pet accessories.",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                return false
            end
            if v421.is_egg then
                v419.apps.HintApp:hint({
                    ["text"] = "Eggs can\'t wear accessories. Hatch it first!",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                return false
            end
            if not v421.is_customizable then
                v419.apps.HintApp:hint({
                    ["text"] = "This pet cannot be customized.",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                return false
            end
            local v422 = (v418.get("equip_manager") or {}).pet_accessories[1]
            if not v422 then
                return false
            end
            local v423 = v422.unique
            local v424 = v418.get("avatar_manager") or {}
            local v425 = v418.get("inventory") or {}
            local v426 = false
            for _, v427 in (v424.pet or {})[v420.pet_unique] or {} do
                for _, v428 in v427 do
                    local v429 = v425.pet_accessories
                    if v429 then
                        v429 = v425.pet_accessories[v428]
                    end
                    if v429 and v429.kind == v422.kind then
                        v426 = true
                        break
                    end
                end
            end
            if v426 then
                v419.apps.HintApp:hint({
                    ["text"] = "Your pet is already wearing this accessory",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                return false
            end
            local v430 = v415.convert_soft_category_to_actual_category("pet", "all", "General", v423)
            if not v415.put_on("pet", v430, v423, v420) then
                return false
            end
            v417.unequip(v422)
            return true
        end,
        ["equipped"] = function(p431, p432)
            if p431.category == "pet_accessories" and p431.equip_type == "wings" then
                local v433 = p432.tool.ModelHandle.AccessoryModel.AnimationController
                if #v433:GetPlayingAnimationTracks() <= 0 then
                    local v434 = v_u_2("AnimationManager").get_track(p431.flap_animation or "PetFlyingWingFlap")
                    game:GetService("ContentProvider"):PreloadAsync({ v434 })
                    v433:LoadAnimation(v434):Play()
                end
            else
                return
            end
        end
    },
    ["SnowballLauncherTool"] = {
        ["client_use"] = function()
            v_u_2("SnowballLauncher").use()
        end,
        ["equipped"] = function(_, _)
            v_u_2("SnowballLauncher").equip()
        end,
        ["unequipped"] = function(_, _)
            v_u_2("SnowballLauncher").unequip()
        end
    },
    ["DiamondLavender"] = {
        ["client_use"] = function(_, _, p435)
            v_u_2("LadybugAdoption").throw_treat(p435.tool.ModelHandle, p435.item_data.unique)
        end
    },
    ["FoodCannonTool"] = {
        ["client_use"] = function(p436, _, _, _, p437)
            v_u_2("FoodCannon").use(p436, p437)
        end,
        ["equipped"] = function(p438, _, _)
            v_u_2("FoodCannon").equip(p438)
        end
    },
    ["VotingPaddle"] = {
        ["client_use"] = function(_, _, p439)
            local v440 = v_u_2("UIManager")
            local v441 = v_u_2("RouterClient")
            local v442 = v_u_2("SharedConstants")
            if p439.current_state == "revealed" then
                local v443, v444 = v440.apps.DialogApp:dialog({
                    ["dialog_type"] = "DropdownDialog",
                    ["choose_text"] = "Choose",
                    ["header"] = "Write something on your paddle!",
                    ["choices"] = v442.voting_paddle_choices,
                    ["left"] = "Cancel",
                    ["right"] = "Submit"
                })
                if v443 == "Submit" then
                    p439.player_submitted_value = v444
                    v441.get("ToolAPI/UpdateVotingPaddle"):InvokeServer("\226\157\147", "")
                    v440.apps.HintApp:hint({
                        ["text"] = "Use the item again to reveal what you wrote!",
                        ["yields"] = false
                    })
                    p439.animation_tracks.low_idle:Play(0)
                    p439.animation_tracks.high_idle:Stop(0)
                    p439.animation_tracks.front_idle:Play(0)
                    p439.animation_tracks.back_idle:Stop(0)
                    p439.animation_tracks.raise.TimePosition = p439.animation_tracks.raise.Length
                    p439.animation_tracks.raise:Play(0, 1, -1)
                    p439.animation_tracks.spin.TimePosition = p439.animation_tracks.spin.Length
                    p439.animation_tracks.spin:Play(0, 1, -1)
                    p439.current_state = "hidden"
                    return
                end
            elseif p439.current_state == "hidden" then
                v441.get("ToolAPI/UpdateVotingPaddle"):InvokeServer("", p439.player_submitted_value)
                p439.animation_tracks.low_idle:Stop(0)
                p439.animation_tracks.high_idle:Play(0)
                p439.animation_tracks.raise:Play(0)
                p439.animation_tracks.front_idle:Stop(0)
                p439.animation_tracks.back_idle:Play(0)
                p439.animation_tracks.spin:Play(0)
                p439.current_state = "revealed"
            end
        end,
        ["server_render"] = function(p445, p446)
            local v447 = p445.properties.front_value_to_display or ""
            local v448 = p445.properties.back_value_to_display or "\240\159\146\172"
            p446.Board.FrontGUI.Frame.TextLabel.Text = v447
            p446.Board.BackGUI.Frame.TextLabel.Text = v448
        end,
        ["equipped"] = function(_, p449)
            local v450 = v_u_2("AnimationManager")
            local v451 = v_u_2("RouterClient")
            local v452 = game:GetService("ContentProvider")
            p449.current_state = "revealed"
            p449.player_submitted_value = nil
            p449.animation_tracks = {}
            local v453 = game.Players.LocalPlayer.Character.Humanoid
            local v454 = p449.tool.ModelHandle.AnimationController
            local v455 = v450.get_track("VotingPaddleHighIdle")
            v452:PreloadAsync({ v455 })
            local v456 = v453:LoadAnimation(v455)
            p449.animation_tracks.high_idle = v456
            local v457 = v450.get_track("VotingPaddleLowIdle")
            v452:PreloadAsync({ v457 })
            local v458 = v453:LoadAnimation(v457)
            p449.animation_tracks.low_idle = v458
            local v459 = v450.get_track("VotingPaddleRaise")
            v452:PreloadAsync({ v459 })
            local v460 = v453:LoadAnimation(v459)
            p449.animation_tracks.raise = v460
            local v461 = v450.get_track("VotingPaddleBackIdle")
            v452:PreloadAsync({ v461 })
            local v462 = v454:LoadAnimation(v461)
            p449.animation_tracks.back_idle = v462
            local v463 = v450.get_track("VotingPaddleFrontIdle")
            v452:PreloadAsync({ v463 })
            local v464 = v454:LoadAnimation(v463)
            p449.animation_tracks.front_idle = v464
            local v465 = v450.get_track("VotingPaddleSpin")
            v452:PreloadAsync({ v465 })
            local v466 = v454:LoadAnimation(v465)
            p449.animation_tracks.spin = v466
            p449.animation_tracks.high_idle:Play(0)
            p449.animation_tracks.raise:Play(0)
            p449.animation_tracks.back_idle:Play(0)
            p449.animation_tracks.spin:Play(0)
            v451.get("ToolAPI/UpdateVotingPaddle"):InvokeServer("", "\240\159\146\172")
        end,
        ["unequipped"] = function(_, p467)
            for _, v468 in pairs(p467.animation_tracks) do
                v468:Stop()
                v468:Destroy()
            end
        end
    },
    ["CatBoxTool"] = {
        ["equipped"] = function()
            v_u_2("PetBoxHelper").preload_animations({
                "CatBoxOpen1",
                "CatBoxOpen2",
                "CatBoxOpen3",
                "CatBoxOpen4"
            })
        end,
        ["client_use"] = function(p469, _, p470)
            local v472 = {
                ["box_entry"] = p469,
                ["tool_state"] = p470,
                ["rig_model_name"] = "CatBoxRig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = {
                    "CatBoxOpen1",
                    "CatBoxOpen2",
                    "CatBoxOpen3",
                    "CatBoxOpen4"
                },
                ["marker_reached_callbacks"] = {
                    ["Opened"] = function(p471)
                        p471.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        p471.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end
                }
            }
            v_u_2("PetBoxHelper").exchange_box_with_animation(v472)
        end
    },
    ["WalrusBoxTool"] = {
        ["equipped"] = function()
            v_u_2("PetBoxHelper").preload_animations({ "WalrusBoxOpen1", "WalrusBoxOpen2" })
        end,
        ["client_use"] = function(p473, _, p474)
            local v476 = {
                ["box_entry"] = p473,
                ["tool_state"] = p474,
                ["rig_model_name"] = "WalrusBoxRig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = { "WalrusBoxOpen1", "WalrusBoxOpen2" },
                ["marker_reached_callbacks"] = {
                    ["Opened"] = function(p475)
                        p475.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        p475.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end
                }
            }
            v_u_2("PetBoxHelper").exchange_box_with_animation(v476)
        end
    },
    ["RGBRewardBoxTool"] = {
        ["equipped"] = function(p477)
            v_u_2("UIManager").apps.DialogApp:dialog({
                ["text"] = p477.custom_tooltip_description,
                ["button"] = "Okay",
                ["play_pop_sound"] = false
            })
        end,
        ["client_use"] = function(p478, _, p479)
            local v480 = v_u_2("PetBoxHelper")
            local v_u_481 = v_u_2("TweenPromise")
            local v_u_482 = v_u_2("SoundPlayer")
            v480.exchange_box_with_promise({
                ["box_entry"] = p478,
                ["tool_state"] = p479,
                ["rig_model_name"] = "RGBRewardBoxRig",
                ["promise"] = function(p_u_483, p_u_484)
                    local v_u_485 = p_u_483.PrimaryPart.CFrame
                    v_u_482.FX:play("GiftUnwrap")
                    return v_u_481.callback(0, 1, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), function(p486)
                        p_u_483:SetPrimaryPartCFrame(v_u_485 * CFrame.Angles(0, 25.132741228718345 * p486, 0) * CFrame.new(0, 1.5 * p486, 0))
                    end):andThen(function()
                        v_u_482.FX:play("MagicExplosion")
                        p_u_484()
                        local v487 = p_u_483.OpenParticlesPart
                        v487.Parent = workspace
                        p_u_483.Parent = nil
                        v487.Attachment.Ring1.Enabled = true
                        task.wait(0.1)
                        v487.Attachment.Ring1.Enabled = false
                        task.wait(0.1)
                        v487.Lines1.Enabled = true
                        v487.Lines2.Enabled = true
                        v487.Lines3.Enabled = true
                        task.wait(0.4)
                        v487.Lines1.Enabled = false
                        v487.Lines2.Enabled = false
                        v487.Lines3.Enabled = false
                        task.wait(1)
                        v487:Destroy()
                    end)
                end
            })
        end
    },
    ["LunarTigerBoxTool"] = {
        ["equipped"] = function()
            v_u_2("PetBoxHelper").preload_animations({
                "LunarTigerPetBoxOpenCommon1",
                "LunarTigerPetBoxOpenCommon2",
                "LunarTigerPetBoxOpenRare",
                "LunarTigerPetBoxOpenLegendary"
            })
        end,
        ["client_use"] = function(p488, _, p489)
            local v492 = {
                ["box_entry"] = p488,
                ["tool_state"] = p489,
                ["rig_model_name"] = "LNY2022TigerBoxRig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = {
                    "LunarTigerPetBoxOpenCommon1",
                    "LunarTigerPetBoxOpenCommon2",
                    "LunarTigerPetBoxOpenRare",
                    "LunarTigerPetBoxOpenLegendary"
                },
                ["marker_reached_callbacks"] = {
                    ["Landed"] = function(p490)
                        p490.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Opened"] = function(p491)
                        p491.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        p491.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end
                }
            }
            v_u_2("PetBoxHelper").exchange_box_with_animation(v492)
        end
    },
    ["ColoredHairSpray"] = {
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use_start"] = function(p_u_493, p494, p_u_495, p496)
            local v_u_497 = v_u_2("ColoredHairSprayHelper")
            task.delay(1.9, function()
                v_u_497.spray_once(p_u_493, p_u_495.properties.color)
            end)
            v_u_4.generic_server_use_start(p_u_493, p494, p_u_495, p496)
        end,
        ["server_use_end"] = v_u_4.generic_server_use_end,
        ["server_render"] = function(p498, p499)
            local v500 = p498.properties.color
            p499.Sprayer.ParticleEmitter.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(unpack(v500))), ColorSequenceKeypoint.new(1, Color3.new(unpack(v500))) })
        end
    },
    ["ColoredHairSpraySealer"] = {
        ["client_use"] = function(p501, p502, p503, p504, p505, p506, p507)
            local v_u_508 = v_u_2("PetColorHelper")
            local v509 = v_u_2("UIManager")
            local v512 = v_u_6.choose_equipped(function(p510)
                local v511 = v_u_6.get_wrapper_from_item(p510)
                return v_u_508.has_salon_colors_applied(v511)
            end)
            local v513 = v_u_6.get_wrapper_from_item(v512)
            if not (v513 and v_u_508.has_salon_colors_applied(v513)) then
                if #v_u_6.get_my_equipped() == 0 then
                    v509.apps.DialogApp:dialog({
                        ["text"] = "Equip a pet to use this!",
                        ["button"] = "Okay"
                    })
                else
                    v509.apps.DialogApp:dialog({
                        ["text"] = "Your pet can\'t use this right now!",
                        ["button"] = "Okay"
                    })
                end
                return false
            end
            if v509.apps.DialogApp:dialog({
                ["text"] = "Keep your equipped pet\'s color?",
                ["left"] = "Cancel",
                ["right"] = "Use"
            }) == "Cancel" then
                return false
            end
            if not (v_u_6.get_item_from_wrapper(v513) and v_u_508.has_salon_colors_applied(v513)) then
                v509.apps.DialogApp:dialog({
                    ["text"] = "Your pet can\'t use this right now!",
                    ["button"] = "Okay"
                })
                return false
            end
            p502(v513.pet_unique)
            v_u_4.generic_client_use(p501, p502, p503, p504, p505, p506, p507)
        end,
        ["server_use"] = function(p514, _, p515, p516, p517)
            local v518 = v_u_2("PetColorHelper")
            local v519 = v_u_2("MsgBridge")
            local v520 = v_u_6.get_item_from_unique(p517, p514)
            local v521 = v_u_6.get_wrapper_from_item(v520)
            if not (v521 and v518.can_seal_colors(v521)) then
                v519.dialog(p514, {
                    ["text"] = "Your pet can\'t use this right now!",
                    ["button"] = "Okay"
                })
                return
            end
            local v522 = nil
            local v523 = nil
            for _, v524 in p516 do
                local v525 = v524:FindFirstChild("Nozzle")
                if v525 then
                    v522 = v525:FindFirstChildWhichIsA("ParticleEmitter")
                    v523 = v525:FindFirstChildWhichIsA("Sound")
                    break
                end
            end
            if v522 and v523 then
                local v526 = Random.new()
                local v527 = tick()
                while tick() - v527 < 2.5 do
                    v523:Play()
                    v522:Emit(5)
                    task.wait(0.1)
                    v523:Stop()
                    task.wait(v526:NextNumber(0.17, 0.55))
                end
                task.wait(0.7)
                if v518.try_seal_colors(v521) then
                    p515:destroy()
                else
                    v519.dialog(p514, {
                        ["text"] = "Your pet can\'t use this right now!",
                        ["button"] = "Okay"
                    })
                end
            else
                return
            end
        end
    },
    ["HeistGlovesFurnitureStealing"] = {
        ["client_use"] = function()
            v_u_2("FurnitureHeistClient").heist_gloves_use()
        end,
        ["equipped"] = function()
            v_u_2("FurnitureHeistClient").heist_gloves_equipped()
        end,
        ["unequipped"] = function()
            v_u_2("FurnitureHeistClient").heist_gloves_unequipped()
        end
    },
    ["DetectiveHandcuffs"] = {
        ["client_use"] = function()
            v_u_2("HandcuffsArrestClient").detective_handcuffs_use()
        end,
        ["equipped"] = function()
            v_u_2("HandcuffsArrestClient").detective_handcuffs_equipped()
        end
    },
    ["CriminalHandcuffs"] = {
        ["client_use"] = function()
            v_u_2("HandcuffsArrestClient").attempt_escape_handcuffs()
        end,
        ["equipped"] = function()
            v_u_2("HandcuffsArrestClient").criminal_handcuffs_equipped()
        end,
        ["unequipped"] = function()
            v_u_2("HandcuffsArrestClient").attempt_escape_handcuffs()
        end
    },
    ["CriminalBaseballBat"] = {
        ["client_use"] = function(_, _, p528)
            local v529 = v_u_2("AnimationManager")
            local v_u_530 = v_u_2("RouterClient")
            local v531 = v_u_9.LocalPlayer.Character
            local v_u_532
            if v531 then
                v_u_532 = v531.PrimaryPart
            else
                v_u_532 = v531
            end
            if v531 then
                v531 = v531:FindFirstChild("Humanoid")
            end
            if not (v531 and v_u_532) then
                return false
            end
            local v533 = p528.entry.anims.use
            local v534 = v531:LoadAnimation((v529.get_track(v533)))
            v534:Play()
            task.delay(0.4, function()
                local v535 = 11
                local v536 = nil
                for _, v537 in pairs(v_u_9:GetPlayers()) do
                    if v537 ~= v_u_9.LocalPlayer then
                        local v538 = v537.Character
                        if v538 then
                            v538 = v538.PrimaryPart
                        end
                        if v538 then
                            local v539 = (v538.Position - v_u_532.Position).Magnitude
                            if v535 >= v539 then
                                v536 = v537
                                v535 = v539
                            end
                        end
                    end
                end
                if v536 then
                    v_u_530.get("RoleplayAPI/CriminalBaseballBatHitPlayer"):FireServer(v536)
                end
            end)
            task.wait(v534.Length - 0.1)
        end
    },
    ["LegendaryHatShopBoxTool"] = {
        ["equipped"] = function(p540)
            v_u_2("PetBoxHelper").preload_animations(p540.anims.box_opening)
        end,
        ["client_use"] = function(p541, _, p542)
            local v543 = v_u_2("PetBoxHelper").exchange_box_with_animation
            local v546 = {
                ["box_entry"] = p541,
                ["tool_state"] = p542,
                ["rig_model_name"] = p541.model_handle .. "Rig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = p541.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, -1.5707963267948966, 0),
                ["marker_reached_callbacks"] = {
                    ["TeaseOpen"] = function(p544)
                        p544.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Opened"] = function(p545)
                        p545.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        p545.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end
                }
            }
            v543(v546)
        end
    },
    ["EmployeeBonuses"] = {
        ["equipped"] = function(_)
            v_u_2("EmployeeBonuses").equipped()
        end,
        ["unequipped"] = function()
            v_u_2("EmployeeBonuses").unequipped()
        end,
        ["client_use"] = function(_, _, _)
            local v547, v548 = v_u_2("EmployeeBonuses").begin_payout_client()
            return v547, v548
        end,
        ["server_use"] = function(p549, _, _, _, p550)
            local v551 = v_u_2("EmployeeBonuses")
            if typeof(p550) == "Instance" and p550:IsA("Player") then
                v551.pay_employee(p549, p550)
            end
        end
    },
    ["PizzaShopMenu"] = {
        ["client_use"] = function(_, _, _)
            v_u_2("UIManager").apps.HintApp:hint({
                ["text"] = "1 - Cheese | 2 - Pepperoni | 3 - Veggie | 4 - Hawaiian (Ham & Pineapple)",
                ["length"] = 4,
                ["yields"] = false,
                ["overridable"] = true
            })
            task.wait(0.5)
        end
    },
    ["WaitersNotepad"] = {
        ["server_use_start"] = v_u_4.generic_server_use_start,
        ["server_use_end"] = v_u_4.generic_server_use_end,
        ["client_use"] = function(p552, p553, p554, p555, p556, p_u_557, p558)
            local v_u_559 = v_u_2("UIManager")
            task.spawn(function()
                v_u_559.apps.WaitersNotepadApp:open_notepad()
                task.wait(0.7)
                p_u_557:Fire()
            end)
            return v_u_4.generic_client_use(p552, p553, p554, p555, p556, p_u_557, p558)
        end
    },
    ["WingBoxTool"] = {
        ["equipped"] = function(p560)
            v_u_2("PetBoxHelper").preload_animations(p560.anims.box_opening)
        end,
        ["client_use"] = function(p561, _, p562)
            local v563 = v_u_2("PetBoxHelper").exchange_box_with_animation
            local v566 = {
                ["box_entry"] = p561,
                ["tool_state"] = p562,
                ["rig_model_name"] = p561.model_handle .. "Rig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = p561.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, 3.141592653589793, 0),
                ["marker_reached_callbacks"] = {
                    ["Landed"] = function(p564)
                        p564.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Opened"] = function(p565)
                        p565.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                    end
                }
            }
            v563(v566)
        end
    },
    ["WolfBoxTool"] = {
        ["equipped"] = function(p567)
            v_u_2("PetBoxHelper").preload_animations(p567.anims.box_opening)
        end,
        ["client_use"] = function(p568, _, p569)
            local v570 = v_u_2("PetBoxHelper").exchange_box_with_animation
            local v573 = {
                ["box_entry"] = p568,
                ["tool_state"] = p569,
                ["rig_model_name"] = p568.model_handle .. "Rig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = p568.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, 3.141592653589793, 0),
                ["marker_reached_callbacks"] = {
                    ["TeaseOpen"] = function(p571)
                        p571.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Opened"] = function(p572)
                        p572.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        p572.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end
                }
            }
            v570(v573)
        end
    },
    ["PonyBoxTool"] = {
        ["equipped"] = function(p574)
            v_u_2("PetBoxHelper").preload_animations(p574.anims.box_opening)
        end,
        ["client_use"] = function(p575, _, p576)
            local v577 = v_u_2("PetBoxHelper").exchange_box_with_animation
            local v580 = {
                ["box_entry"] = p575,
                ["tool_state"] = p576,
                ["rig_model_name"] = p575.model_handle .. "Rig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = p575.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, 3.141592653589793, 0),
                ["marker_reached_callbacks"] = {
                    ["TeaseOpen"] = function(p578)
                        p578.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end,
                    ["Opened"] = function(p579)
                        p579.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        p579.PrimaryPart.LandParticleAttachment.LandParticle:Emit(20)
                    end
                }
            }
            v577(v580)
        end
    },
    ["GoldenPlantain"] = {
        ["client_use"] = function(_, _, p581)
            v_u_2("AmazonAdoption").throw_plantain(p581.tool.ModelHandle, p581.item_data.unique)
        end
    },
    ["MoonBearBoxTool"] = {
        ["equipped"] = function(p582)
            v_u_2("PetBoxHelper").preload_animations(p582.anims.box_opening)
        end,
        ["client_use"] = function(p583, _, p584)
            local v585 = v_u_2("PetBoxHelper").exchange_box_with_animation
            local v587 = {
                ["box_entry"] = p583,
                ["tool_state"] = p584,
                ["rig_model_name"] = p583.model_handle .. "Rig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = p583.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, 3.141592653589793, 0),
                ["marker_reached_callbacks"] = {
                    ["Opened"] = function(p586)
                        p586.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                    end
                }
            }
            v585(v587)
        end
    },
    ["GorillaBoxTool"] = {
        ["equipped"] = function(p588)
            v_u_2("PetBoxHelper").preload_animations(p588.anims.box_opening)
        end,
        ["client_use"] = function(p589, _, p590)
            local v_u_591 = v_u_2("UIManager")
            local v592 = v_u_2("PetBoxHelper")
            local v_u_593 = v_u_2("RouterClient")
            local v_u_594 = v_u_2("SoundPlayer")
            local v595 = v592.exchange_box_with_animation
            local v605 = {
                ["box_entry"] = p589,
                ["tool_state"] = p590,
                ["rig_model_name"] = p589.model_handle .. "Rig",
                ["finish_at_marker"] = "Ended",
                ["animations"] = p589.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, 0, 0),
                ["dont_play_default_opened_sound"] = true,
                ["marker_reached_callbacks"] = {
                    ["Started"] = function(p596)
                        local v597 = p596:FindFirstChild("FuseParticle")
                        if v597 then
                            v597.ParticleEmitter.Enabled = true
                        end
                    end,
                    ["Opened"] = function(p598)
                        local v599 = p598:FindFirstChild("FuseParticle")
                        if v599 then
                            v599.ParticleEmitter.Enabled = false
                        end
                        for _, v600 in { "CannonBurst", "SmokeBurst" } do
                            local v601 = p598:FindFirstChild(v600)
                            if v601 then
                                for _, v602 in v601:GetChildren() do
                                    if v602:IsA("ParticleEmitter") then
                                        v602:Emit(3)
                                    end
                                end
                            end
                        end
                        v_u_594.FX:play("MagicExplosion")
                    end
                },
                ["exchange_callback"] = function(p603, p604)
                    v_u_591.apps.JackboxRewardApp:show_rewards(p603)
                    v_u_593.get("ToolAPI/Equip"):InvokeServer(p603[3].unique, {
                        ["spawn_cframe"] = p604
                    })
                end
            }
            v595(v605)
        end
    },
    ["GenericBoxTool"] = {
        ["equipped"] = function(p606)
            v_u_2("PetBoxHelper").preload_animations(p606.anims.box_opening)
        end,
        ["client_use"] = function(p607, _, p608)
            local v609 = v_u_2("PetBoxHelper").exchange_box_with_animation
            local v611 = {
                ["box_entry"] = p607,
                ["tool_state"] = p608,
                ["rig_model_name"] = p607.model_handle .. "Rig",
                ["finish_at_marker"] = "Opened",
                ["animations"] = p607.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, 3.141592653589793, 0),
                ["marker_reached_callbacks"] = {
                    ["Opened"] = function(p610)
                        p610.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                    end
                }
            }
            v609(v611)
        end
    },
    ["LuresBaitPopup"] = {
        ["client_use"] = function(_, _, _)
            if v_u_2("UIManager").apps.DialogApp:dialog({
                ["text"] = "This item cannot be eaten. Please use it to set a lure.",
                ["right"] = "Place Bait",
                ["left"] = "Cancel"
            }) == "Place Bait" then
                v_u_2("LureBaitHelper").run_tutorial()
            end
        end
    },
    ["GenericConstraintsTool"] = {
        ["client_use"] = v_u_4.generic_client_use,
        ["server_use_start"] = v_u_4.generic_server_use_start,
        ["server_use_end"] = v_u_4.generic_server_use_end,
        ["equipped"] = function(_, p_u_612)
            local v613 = v_u_9.LocalPlayer.Character
            if v613 then
                v613 = v613:FindFirstChild("HumanoidRootPart")
            end
            if v613 then
                p_u_612.character_teleport_conn = v613:GetPropertyChangedSignal("Position"):Connect(function()
                    if p_u_612.tool then
                        local v614 = {}
                        local v615 = {}
                        for _, v616 in p_u_612.tool:GetDescendants() do
                            if v616:IsA("Constraint") then
                                v616.Enabled = false
                                local v617 = Instance.new("RigidConstraint")
                                v617.Attachment0 = v616.Attachment0
                                v617.Attachment1 = v616.Attachment1
                                v617.Parent = v616.Parent
                                table.insert(v614, v617)
                                table.insert(v615, v616)
                            end
                        end
                        task.wait()
                        if p_u_612.tool then
                            for _, v618 in v614 do
                                v618:Destroy()
                            end
                            for _, v619 in v615 do
                                v619.Enabled = true
                            end
                        end
                    else
                        return
                    end
                end)
            end
        end,
        ["unequipped"] = function(_, p620)
            if p620.character_teleport_conn then
                p620.character_teleport_conn:Disconnect()
                p620.character_teleport_conn = nil
            end
        end
    }
}
v3.merge("Tools", v621)
return v621