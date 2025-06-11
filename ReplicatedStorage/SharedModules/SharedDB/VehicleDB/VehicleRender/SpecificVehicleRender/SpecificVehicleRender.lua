--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleRender.SpecificVehicleRender (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("AnimationManager")
local v_u_3 = v_u_1("package:Promise")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = game:GetService("CollectionService")
local v_u_7 = Random.new()
local v199 = {
    ["gift_refresh_2022_stagecoach"] = {
        ["client"] = function(_, p8, _, p9)
            local v_u_10 = p8:WaitForChild("VehicleSeatWeldReplacement")
            local v11 = p8:WaitForChild("NoWeld")
            for v_u_12, v13 in { v11:WaitForChild("HorseA"), (v11:WaitForChild("HorseB")) } do
                local v14 = v13:WaitForChild("AnimationController"):WaitForChild("Animator")
                local v_u_15 = v14:LoadAnimation(v_u_2.get_track("HorseStagecoachRun"))
                local v_u_16 = v14:LoadAnimation(v_u_2.get_track("HorseStagecoachIdle"))
                v_u_16:Play(0)
                v_u_16.TimePosition = v_u_12 - 1
                local v_u_17 = v_u_16
                p9:GiveTask(v_u_4.PostSimulation:Connect(function()
                    local v18 = v_u_10.AssemblyLinearVelocity
                    local v19 = -v_u_10.CFrame:VectorToObjectSpace(v18).Z
                    local v20
                    if math.abs(v19) > 3 then
                        v20 = v_u_15
                    else
                        v20 = v_u_16
                    end
                    if v20 ~= v_u_17 then
                        v_u_17:Stop()
                        v20:Play()
                        v20.TimePosition = v_u_12 - 1
                        v_u_17 = v20
                    end
                    if v_u_17 == v_u_15 then
                        local v21 = v_u_17
                        local v22 = v19 / 10
                        v21:AdjustSpeed((math.clamp(v22, -1, 1)))
                    end
                end))
                p9:GiveTask(function()
                    v_u_16:Stop(0)
                    v_u_15:Stop(0)
                    v_u_16:Destroy()
                    v_u_15:Destroy()
                end)
            end
            local v_u_23 = p8:WaitForChild("BackConnector"):WaitForChild("BallSocketConstraint")
            p9:GiveTask(v_u_4.PostSimulation:Connect(function()
                local v24 = v_u_10.AssemblyLinearVelocity
                if -v_u_10.CFrame:VectorToObjectSpace(v24).Z < -3 then
                    v_u_23.UpperAngle = 0
                else
                    v_u_23.UpperAngle = 30
                end
            end))
        end
    },
    ["gift_refresh_2022_dapper_friend_carrier"] = {
        ["client"] = function(_, p25, _, p_u_26)
            local v_u_27 = p25:WaitForChild("VehicleSeat")
            local v_u_28 = p25:WaitForChild("NoWeld"):WaitForChild("Handle"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(v_u_2.get_track("VintageCarHandle"))
            v_u_28:Play(0)
            p_u_26:GiveTask(v_u_4.PostSimulation:Connect(function()
                local v29 = v_u_27.AssemblyLinearVelocity
                local v30 = -v_u_27.CFrame:VectorToObjectSpace(v29).Z
                if math.abs(v30) > 3 and v_u_28.Speed < 1 then
                    v_u_28:AdjustSpeed(1)
                elseif v_u_28.Speed > 0 then
                    v_u_28:AdjustSpeed(0)
                end
                p_u_26:GiveTask(function()
                    v_u_28:Stop(0)
                    v_u_28:Destroy()
                end)
            end))
        end
    },
    ["halloween_2022_knife_throwing_board"] = {
        ["client"] = function(_, p31, _, p32)
            local v_u_33 = p31:WaitForChild("VehicleSeat")
            local v_u_34 = p31:WaitForChild("VisualWheels"):WaitForChild("BackWheelComplex"):WaitForChild("TargetSeat")
            p32:GiveTask(v_u_4.Stepped:Connect(function()
                local v35 = v_u_33
                if v35 then
                    v35 = v_u_33:FindFirstChild("SeatWeld")
                end
                local v36 = v35 and (v35.Part1 and v35.Part1.Parent)
                if v36 then
                    v36 = v35.Part1.Parent:FindFirstChild("LowerTorso")
                end
                if v36 then
                    v36 = v36:FindFirstChild("Root")
                end
                if v36 and v36.Part0 then
                    local v37 = v_u_34.CFrame * v35.C0 * v36.C0 * v36.Transform * v36.C1:Inverse()
                    v36.Transform = (v36.Part0.CFrame * v36.C0):Inverse() * v37 * v36.C1
                end
            end))
        end
    },
    ["winter_2022_giant_snowball"] = {
        ["client"] = function(_, p38, _, p39)
            local v_u_40 = p38:WaitForChild("VehicleSeat")
            local v41 = p38:WaitForChild("NoWeld")
            local v_u_42 = v41:WaitForChild("SnowballMain")
            local v_u_43 = v41:WaitForChild("Snowballs")
            local v_u_44 = TweenInfo.new(0.25, Enum.EasingStyle.Linear)
            local v_u_45 = {}
            local function v_u_47()
                for _, v46 in v_u_45 do
                    v46:Cancel()
                    v46:Destroy()
                end
                v_u_45 = {}
            end
            p39:GiveTask(v_u_4.PostSimulation:Connect(function()
                local v48 = v_u_40.AssemblyLinearVelocity
                local v49 = -v_u_40.CFrame:VectorToObjectSpace(v48).Z
                if math.abs(v49) > 1 then
                    for _, v50 in v_u_43:GetChildren() do
                        local v51 = v50.Name
                        local v52 = tonumber(v51)
                        local v53 = v50:FindFirstChild("Weld")
                        if v53 then
                            local v54 = v52 * 1.5 + 4
                            local v55 = v52 % 3 + v52 / 1.5
                            local v56 = v_u_42.Position
                            local v57 = v_u_42.Size.Y / 2 - v50.Size.Y / 2
                            local v58 = v56 - Vector3.new(v55, v57, 0) + v48.Unit * v54 * (-v49 / v49) - v50.Position
                            local v59 = v58.Magnitude > 0.2 and v50.Position + v58.Unit * 1.5 or v50.Position
                            local v60 = CFrame.Angles
                            local v61 = v_u_42.Orientation.X
                            local v62 = math.rad(v61)
                            local v63 = v_u_42.Orientation.Y
                            local v64 = math.rad(v63)
                            local v65 = v_u_42.Orientation.Z
                            local v66 = v60(v62, v64, (math.rad(v65)))
                            local v67 = CFrame.new(v59):ToWorldSpace(v66)
                            local v68 = v_u_5:Create(v53, v_u_44, {
                                ["C0"] = v_u_40.CFrame:ToObjectSpace(v67)
                            })
                            local v69 = v_u_45
                            table.insert(v69, v52, v68)
                            v68:Play()
                        end
                    end
                elseif next(v_u_45) then
                    v_u_47()
                end
            end))
            p39:GiveTask(function()
                v_u_47()
            end)
        end
    },
    ["winter_2022_husky_drawn_sled"] = {
        ["client"] = function(_, p70, _, p71)
            local v_u_72 = p70:WaitForChild("VehicleSeat")
            local v73 = p70:WaitForChild("NoWeld")
            for _, v74 in { v73:WaitForChild("HuskyA"), (v73:WaitForChild("HuskyB")) } do
                local v75 = v74:WaitForChild("AnimationController")
                if v75 then
                    v75 = v75:WaitForChild("Animator")
                end
                local v_u_76 = v75:LoadAnimation(v_u_2.get_track("HuskyRun"))
                local v_u_77 = v75:LoadAnimation(v_u_2.get_track("HuskyIdle"))
                v_u_77:Play(0)
                local v_u_78 = v_u_77
                p71:GiveTask(v_u_4.PostSimulation:Connect(function()
                    local v79 = v_u_72.AssemblyLinearVelocity
                    local v80 = -v_u_72.CFrame:VectorToObjectSpace(v79).Z
                    local v81
                    if math.abs(v80) > 3 then
                        v81 = v_u_76
                    else
                        v81 = v_u_77
                    end
                    if v81 ~= v_u_78 then
                        v_u_78:Stop()
                        v81:Play()
                        v81.TimePosition = 0
                        v_u_78 = v81
                    end
                    if v_u_78 == v_u_76 then
                        local v82 = v_u_78
                        local v83 = v80 / 10
                        v82:AdjustSpeed((math.clamp(v83, -1, 1)))
                    end
                end))
                p71:GiveTask(function()
                    v_u_77:Stop(0)
                    v_u_76:Stop(0)
                    v_u_77:Destroy()
                    v_u_76:Destroy()
                end)
            end
        end
    },
    ["winter_2022_snowblower_toboggan"] = {
        ["client"] = function(_, p84, _, p85)
            local v_u_86 = p84:WaitForChild("VehicleSeat")
            local v_u_87 = p84:WaitForChild("FrontParticles")
            local v88 = p84:WaitForChild("NoWeld")
            if v88 then
                v88 = v88:WaitForChild("Fan")
            end
            if v88 then
                v88 = v88:WaitForChild("AnimationController")
            end
            if v88 then
                v88 = v88:WaitForChild("Animator")
            end
            local v_u_89 = v88:LoadAnimation(v_u_2.get_track("Winter2022SnowblowerTobogganFanSpin"))
            v_u_89:Play()
            local v_u_90 = nil
            p85:GiveTask(v_u_4.PostSimulation:Connect(function()
                local v91 = v_u_86.AssemblyLinearVelocity
                local v92 = -v_u_86.CFrame:VectorToObjectSpace(v91).Z > 3
                if v_u_87 and v_u_90 ~= v92 then
                    for _, v93 in v_u_87:GetDescendants() do
                        if v93:IsA("ParticleEmitter") then
                            v93.Enabled = v92
                        end
                    end
                    v_u_90 = v92
                end
            end))
            p85:GiveTask(function()
                v_u_89:Stop(0)
                v_u_89:Destroy()
            end)
        end
    },
    ["winter_2022_gingerbread_sleigh"] = {
        ["client"] = function(_, p94, _, p95)
            local v_u_96 = p94:WaitForChild("VehicleSeat")
            local v97 = p94:WaitForChild("NoWeld")
            for _, v98 in { v97:WaitForChild("ReindeerA"), (v97:WaitForChild("ReindeerB")) } do
                local v99 = v98:WaitForChild("AnimationController"):WaitForChild("Animator")
                local v_u_100 = v99:LoadAnimation(v_u_2.get_track("Winter2022GingerbreadReindeerRunning"))
                local v_u_101 = v99:LoadAnimation(v_u_2.get_track("Winter2022GingerbreadReindeerIdle"))
                v_u_101:Play(0)
                local v_u_102 = v_u_101
                p95:GiveTask(v_u_4.PostSimulation:Connect(function()
                    local v103 = v_u_96.AssemblyLinearVelocity
                    local v104 = -v_u_96.CFrame:VectorToObjectSpace(v103).Z
                    local v105
                    if math.abs(v104) > 3 then
                        v105 = v_u_100
                    else
                        v105 = v_u_101
                    end
                    if v105 ~= v_u_102 then
                        v_u_102:Stop()
                        v105:Play()
                        v105.TimePosition = 0
                        v_u_102 = v105
                    end
                    if v_u_102 == v_u_100 then
                        local v106 = v_u_102
                        local v107 = v104 / 10
                        v106:AdjustSpeed((math.clamp(v107, -1, 1)))
                    end
                end))
                p95:GiveTask(function()
                    v_u_101:Stop(0)
                    v_u_100:Stop(0)
                    v_u_101:Destroy()
                    v_u_100:Destroy()
                end)
            end
        end
    },
    ["winter_2022_ice_plane"] = {
        ["client"] = function(p_u_108, p109, _, p_u_110)
            local v_u_111 = v_u_1("VehicleSpeedBeam")
            local v_u_112 = p109:WaitForChild("VehicleSeat")
            local v113 = p109:WaitForChild("NoWeld")
            local v_u_114 = v113:WaitForChild("Propeller")
            local v_u_115 = p109:WaitForChild("PropellerShadows")
            local v116 = v113:WaitForChild("Beam")
            local v_u_117 = v_u_114:WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(v_u_2.get_track("Winter2022IcePlanePropeller"))
            v_u_117:Play(0.5)
            local v128 = {
                ["Default"] = function(p_u_118, p119, _)
                    if math.abs(p119) > 55 then
                        if p_u_118.active_beam and p_u_118.active_beam.part.Parent then
                            return
                        end
                        local v120 = p_u_118.beam_type
                        local v_u_121 = v_u_112.Steer
                        local v122
                        if v_u_121 == 1 and v120 == "Left" then
                            v122 = true
                        elseif v_u_121 == -1 then
                            v122 = v120 == "Right"
                        else
                            v122 = false
                        end
                        if (v122 and 0.95 or (v_u_121 == 0 and v120 == "Center" and 0.985 or 0.998)) >= v_u_7:NextNumber(0, 1) then
                            return
                        end
                        p_u_118.beam_params.length = v_u_7:NextNumber(0.035, 0.085)
                        p_u_118.beam_params.duration = v_u_7:NextNumber(0, 0.15)
                        p_u_118.beam_params.min_transparency = v_u_7:NextNumber(0.895, 0.945)
                        p_u_118.active_beam = v_u_111.new(p_u_118.beam_params)
                        p_u_118.active_beam:show_beam()
                        p_u_110:GiveTask(p_u_118.active_beam)
                        if v122 then
                            local v_u_123 = false
                            task.spawn(function()
                                repeat
                                    task.wait()
                                until v_u_123 == true or v_u_112.Steer ~= v_u_121
                                if p_u_118.active_beam then
                                    p_u_118.active_beam:hide_beam(v_u_7:NextNumber(1.1, 1.5))
                                end
                            end)
                            p_u_110:GiveTask(function()
                                v_u_123 = true
                            end)
                            return
                        end
                    elseif p_u_118.active_beam then
                        p_u_118.active_beam:hide_beam(v_u_7:NextNumber(1.1, 1.5))
                    end
                end,
                ["Propeller"] = function(p124, p125, p126)
                    local v127 = v_u_117.Speed
                    if math.abs(v127) + 0.5 >= 240.175 and (p125 >= 5 and p126 == 1 or p125 <= -5 and p126 == -1) then
                        if not (p124.active_beam and p124.active_beam.part.Parent) then
                            p124.beam_params.length = 0.035
                            p124.beam_params.min_transparency = 0.9
                            p124.active_beam = v_u_111.new(p124.beam_params)
                            p124.active_beam:show_beam()
                            p_u_110:GiveTask(p124.active_beam)
                        end
                    else
                        if p124.active_beam then
                            p124.active_beam:hide_beam(0.2, 0)
                        end
                        return
                    end
                end
            }
            local v_u_129 = {}
            local v_u_130 = 0.07803
            for _, v131 in p109:GetDescendants() do
                local v132 = v131:GetAttribute("BeamType")
                if v132 then
                    local v133 = {
                        ["attachment_updater"] = v128[v132] or v128.Default,
                        ["beam_type"] = v132,
                        ["beam_params"] = {
                            ["attachment"] = v131,
                            ["beam_template"] = v116,
                            ["vehicle_part"] = p109.PrimaryPart
                        }
                    }
                    table.insert(v_u_129, v133)
                end
            end
            local function v_u_137(p134, p135)
                if p_u_108 == game.Players.LocalPlayer then
                    for _, v136 in v_u_129 do
                        v136.attachment_updater(v136, p134, p135)
                    end
                end
            end
            local v_u_138 = v_u_3.resolve()
            local function v_u_159()
                local v139 = v_u_117.Speed
                if math.abs(v139) >= 218.3409090909091 then
                    if v_u_138:getStatus() ~= v_u_3.Status.Started then
                        v_u_138 = v_u_3.new(function(_, _, p_u_140)
                            while not p_u_140() do
                                local v141 = v_u_114.Base.OrientationReference.Orientation.Z
                                local v142 = {}
                                for _, v143 in v_u_115:GetChildren() do
                                    local v144 = {}
                                    local v145 = v143.Name
                                    v144.blade_index = tonumber(v145)
                                    local v146 = v141 - v143.PrimaryPart.Orientation.Z
                                    v144.distance = math.abs(v146)
                                    table.insert(v142, v144)
                                end
                                table.sort(v142, function(p147, p148)
                                    return p147.distance > p148.distance
                                end)
                                local v149 = v142[1]
                                for v150 = 1, #v142 do
                                    if p_u_140() then
                                        return
                                    end
                                    local v151 = v149.blade_index + v150
                                    if #v142 < v151 then
                                        local v152 = #v142 - v151
                                        v151 = math.abs(v152)
                                    end
                                    for _, v_u_153 in v_u_115:FindFirstChild((tostring(v151))):GetChildren() do
                                        local v_u_154 = TweenInfo.new(0.24, Enum.EasingStyle.Linear)
                                        local v_u_155 = v_u_5:Create(v_u_153, v_u_154, {
                                            ["Transparency"] = 0.75
                                        })
                                        task.delay((v150 - 1) * 0.03, function()
                                            v_u_155:Play()
                                            v_u_155.Completed:wait()
                                            if not p_u_140() then
                                                v_u_154 = TweenInfo.new(0.12, Enum.EasingStyle.Linear)
                                                v_u_5:Create(v_u_153, v_u_154, {
                                                    ["Transparency"] = 1
                                                }):Play()
                                            end
                                        end)
                                    end
                                end
                                task.wait(0.36)
                            end
                        end)
                    end
                else
                    v_u_138:cancel()
                    local v156 = TweenInfo.new(0.35, Enum.EasingStyle.Linear)
                    for _, v157 in v_u_115:GetChildren() do
                        for _, v158 in v157:GetChildren() do
                            v_u_5:Create(v158, v156, {
                                ["Transparency"] = 1
                            }):Play()
                        end
                    end
                    return
                end
            end
            p_u_110:GiveTask(v_u_4.PostSimulation:Connect(function()
                local v160 = v_u_112.AssemblyLinearVelocity
                local v161 = -v_u_112.CFrame:VectorToObjectSpace(v160).Z
                local v162 = v_u_112.Throttle
                local v163 = v162 == 0 and 0.0125 or 0.0225
                if v162 ~= 0 then
                    local v164 = v_u_130 + v162 * v163
                    v172 = math.clamp(v164, -1, 1)
                    if v172 then
                        ::l6::
                        v_u_130 = v172
                        local v165 = v_u_130
                        local v166 = math.abs(v165)
                        local v167 = 1 / (1 + (v166 / (1 - v166)) ^ (-2.5))
                        if v_u_130 < 0 then
                            v167 = -v167 or v167
                        end
                        v_u_117:AdjustSpeed(240.175 * v167)
                        v_u_137(v161, v162)
                        v_u_159()
                        return
                    end
                end
                if v162 ~= 0 or v_u_130 <= 0.07803 then
                    ::l8::
                    if v162 == 0 and v_u_130 < 0.07803 then
                        local v168 = v_u_130 + v163
                        local v169 = v_u_130
                        v172 = math.clamp(v168, v169, 0.07803) or 0.07803
                    else
                        v172 = 0.07803
                    end
                    goto l6
                end
                local v170 = v_u_130 - v163
                local v171 = v_u_130
                local v172 = math.clamp(v170, 0.07803, v171)
                if not v172 then
                    goto l8
                end
                goto l6
            end))
            p_u_110:GiveTask(function()
                v_u_138:cancel()
                v_u_117:Stop(0)
                v_u_117:Destroy()
            end)
        end
    },
    ["paint_2023_paint_roller_truck"] = {
        ["client"] = function(_, p173, _, p174)
            local v_u_175 = p173:WaitForChild("VehicleSeatWeldReplacement")
            local v_u_176 = p173:WaitForChild("BackConnector"):WaitForChild("BallSocketConstraint")
            p174:GiveTask(v_u_4.PostSimulation:Connect(function()
                local v177 = v_u_175.AssemblyLinearVelocity
                if -v_u_175.CFrame:VectorToObjectSpace(v177).Z < -7 then
                    v_u_176.UpperAngle = 0
                else
                    v_u_176.UpperAngle = 30
                end
            end))
        end
    },
    ["summerfest_2023_crabby_cruiser"] = {
        ["client"] = function(_, p178, _, p179)
            local v_u_180 = p178:WaitForChild("VehicleSeat")
            local v_u_181 = p178:WaitForChild("Assemblies"):WaitForChild("Carriage1"):WaitForChild("Center"):WaitForChild("HingeConstraint")
            local v182 = v_u_180.AssemblyAngularVelocity.Y
            local v_u_183 = -math.deg(v182) * 0.33
            p179:GiveTask(v_u_4.PostSimulation:Connect(function(p184)
                local v185 = v_u_183
                local v186 = v_u_180.AssemblyAngularVelocity.Y
                local v187 = -math.deg(v186) * 0.33
                local v188 = p184 * 4
                local v189 = math.min(0.25, v188)
                local v190 = (1 - v189) * v185 + v189 * v187
                v_u_181.TargetAngle = v190
                v_u_183 = v190
            end))
        end
    },
    ["rgb_ufo"] = {
        ["client"] = function(_, p191, _, p192)
            local v_u_193 = p191:WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(v_u_2.get_track("RgbUFOIdle"))
            v_u_193:Play(0)
            p192:GiveTask(function()
                v_u_193:Stop(0)
                v_u_193:Destroy()
            end)
        end
    },
    ["moving_truck"] = {
        ["server"] = function(_, p194, _, _)
            v_u_6:AddTag(p194, "MovingTruck")
        end
    },
    ["ice_cream_truck"] = {
        ["server"] = function(p195, p196, _, _)
            local v197 = v_u_1("PolicyHelper")
            v_u_6:AddTag(p196, "IceCreamTruck")
            local v198 = Instance.new("IntValue")
            v198.Name = "Price"
            v198.Value = 10
            v198.Parent = p196
            if v197.is_trading_prohibited(p195) then
                v198.Value = 0
            end
        end
    }
}
return v199