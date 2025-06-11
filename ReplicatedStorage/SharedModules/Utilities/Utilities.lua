--// ReplicatedStorage.SharedModules.Utilities (ModuleScript)

local v_u_97 = {
    ["zero_out_y"] = function(p1)
        local v2 = p1.X
        local v3 = p1.Z
        return Vector3.new(v2, 0, v3)
    end,
    ["safe_unit"] = function(p4)
        local v5 = p4.Unit
        if v5 == v5 then
            return v5
        else
            return Vector3.new()
        end
    end,
    ["get_position_from_arbitrary_value"] = function(p6, ...)
        assert(p6, "Cannot get position from nil value")
        if typeof(p6) == "Vector3" then
            return p6
        end
        if typeof(p6) == "CFrame" then
            return p6.Position
        end
        if typeof(p6) == "function" then
            local v7 = p6(...)
            assert(v7, "Function passed cannot return nil")
            return v_u_97.get_position_from_arbitrary_value(v7)
        end
        if typeof(p6) == "Instance" then
            if p6:IsA("BasePart") then
                return p6.Position
            end
            if p6:IsA("Model") then
                if p6.PrimaryPart then
                    return p6.PrimaryPart.Position
                else
                    return p6:GetBoundingBox().Position
                end
            end
            if p6:IsA("Player") then
                local v8 = p6.Character
                if v8 then
                    v8 = v8:FindFirstChild("HumanoidRootPart")
                end
                if v8 then
                    return v8.Position
                end
                return
            end
        else
            error("Invalid value type: " .. tostring(p6))
        end
    end,
    ["does_exist"] = function(p9)
        if p9 then
            p9 = p9:IsDescendantOf(game)
        end
        return p9
    end,
    ["print_r"] = function(p10)
        local v_u_11 = {}
        local function v_u_16(p12, p13)
            if v_u_11[tostring(p12)] then
                print(p13 .. "*" .. tostring(p12))
                return
            else
                v_u_11[tostring(p12)] = true
                if type(p12) == "table" then
                    for v14, v15 in pairs(p12) do
                        if type(v15) == "table" then
                            print(p13 .. "[" .. v14 .. "] => " .. tostring(p12) .. " {")
                            v_u_16(v15, p13 .. string.rep(" ", string.len(v14) + 8))
                            print(p13 .. string.rep(" ", string.len(v14) + 6) .. "}")
                        elseif type(v15) == "string" then
                            print(p13 .. "[" .. v14 .. "] => \"" .. v15 .. "\"")
                        else
                            print(p13 .. "[" .. v14 .. "] => " .. tostring(v15))
                        end
                    end
                else
                    print(p13 .. tostring(p12))
                end
            end
        end
        if type(p10) == "table" then
            print(tostring(p10) .. " {")
            v_u_16(p10, "  ")
            print("}")
        else
            v_u_16(p10, "  ")
        end
        print()
    end,
    ["Create"] = function(p17)
        local v_u_18 = Instance.new(p17)
        return function(p19)
            for v20, v21 in pairs(p19) do
                v_u_18[v20] = v21
            end
            return v_u_18
        end
    end,
    ["Plural"] = function(p22, p23, p24)
        if p22 == 1 then
            return p23
        else
            return p24
        end
    end,
    ["recurse"] = function(p25, p26, p27)
        local v28 = p27 or 0
        for _, v29 in pairs(p25:GetChildren()) do
            v28 = v28 + 1
            p26(v28, v29)
            if #v29:GetChildren() > 0 then
                v28 = v_u_97.recurse(v29, p26, v28)
            end
        end
        return v28
    end,
    ["CloneDictionary"] = function(p30)
        local v31 = {}
        for v32, v33 in pairs(p30) do
            v31[v32] = v33
        end
        return v31
    end,
    ["Round"] = function(p34, p35)
        local v36 = 10 ^ (p35 or 0)
        local v37 = p34 * v36 + 0.5
        return math.floor(v37) / v36
    end,
    ["RoundToNearestMultiple"] = function(p38, p39)
        local v40 = p39 or 1
        local v41 = p38 / v40 + 0.5
        return math.floor(v41) * v40
    end,
    ["FindFirstChilds"] = function(p42, p43)
        for v44 = 1, #p43 do
            if not p42:findFirstChild(p43[v44]) then
                return nil
            end
            p42 = p42:findFirstChild(p43[v44])
        end
        return p42
    end,
    ["CFrameToTable"] = function(p45)
        return { p45:components() }
    end,
    ["TableToCFrame"] = function(p46)
        return CFrame.new(p46[1], p46[2], p46[3], p46[4], p46[5], p46[6], p46[7], p46[8], p46[9], p46[10], p46[11], p46[12])
    end,
    ["get_corners"] = function(p47, p48)
        local v49 = p47.CFrame
        local v50 = p47.Size.X / 2
        local v51 = p48 and (p47.Size.Y / 2 or 0) or 0
        local v52 = p47.Size.Z / 2
        local v53 = v49 * Vector3.new(v50, v51, v52)
        local v54 = p47.CFrame
        local v55 = -p47.Size.X / 2
        local v56 = p48 and (p47.Size.Y / 2 or 0) or 0
        local v57 = p47.Size.Z / 2
        local v58 = v54 * Vector3.new(v55, v56, v57)
        local v59 = p47.CFrame
        local v60 = -p47.Size.X / 2
        local v61 = p48 and (-p47.Size.Y / 2 or 0) or 0
        local v62 = -p47.Size.Z / 2
        local v63 = v59 * Vector3.new(v60, v61, v62)
        local v64 = p47.CFrame
        local v65 = p47.Size.X / 2
        local v66 = p48 and (-p47.Size.Y / 2 or 0) or 0
        local v67 = -p47.Size.Z / 2
        return v53, v58, v63, v64 * Vector3.new(v65, v66, v67)
    end,
    ["point_in_points"] = function(p68, p69, p70, p71)
        local v72 = (-1 / 0)
        local v73 = (1 / 0)
        if p70 then
            for v74, _ in pairs(p70:GetChildren()) do
                local v75
                if p70:findFirstChild("" .. v74) then
                    v75 = p70["" .. v74]
                else
                    v75 = p70:GetChildren()[v74]
                end
                local v76 = v75.Position
                table.insert(p69, v76)
            end
        end
        for _, v77 in pairs(p69) do
            if v72 < v77.Y then
                v72 = v77.Y
            end
            if v77.Y < v73 then
                v73 = v77.Y
            end
        end
        if p71 and (p68.Y < v73 or v72 < p68.Y) then
            return false
        end
        local v78 = p68.X
        local v79 = p68.Z
        local _ = #p69
        local v80 = #p69
        local v81 = false
        for v82 = 1, #p69 do
            if (p69[v82].Z < v79 and v79 <= p69[v80].Z or p69[v80].Z < v79 and v79 <= p69[v82].Z) and (p69[v82].X <= v78 or p69[v80].X <= v78) then
                if p69[v82].X + (v79 - p69[v82].Z) / (p69[v80].Z - p69[v82].Z) * (p69[v80].X - p69[v82].X) < v78 then
                    v81 = not v81
                end
            end
            v80 = v82
        end
        return v81
    end,
    ["CreateListString"] = function(p83)
        local v84 = ""
        for v85, v86 in pairs(p83) do
            print(v85)
            if v85 == 1 then
                print("SelectingBasic")
                v84 = v84 .. v86
            elseif v85 > 1 and v85 ~= #p83 then
                v84 = v84 .. ", " .. v86
            elseif v85 == 2 and v85 == #p83 then
                v84 = v84 .. " and " .. v86
            else
                v84 = v84 .. ",and " .. v86
            end
        end
        return v84
    end,
    ["get_largest_part"] = function(p87)
        local v88 = 0
        local v89 = nil
        for _, v90 in pairs(p87:GetDescendants()) do
            if v90:IsA("BasePart") and (v90.Transparency ~= 1 and v88 < v90.Size.Magnitude) then
                v88 = v90.Size.Magnitude
                v89 = v90
            end
        end
        return v89
    end,
    ["Weld"] = function(p91, p92)
        local v93 = Instance.new("Weld")
        v93.Part0 = p91
        v93.Part1 = p92
        local v94 = CFrame.new(p91.Position)
        local v95 = p91.CFrame:inverse() * v94
        local v96 = p92.CFrame:inverse() * v94
        v93.C0 = v95
        v93.C1 = v96
        v93.Parent = p91
        return v93
    end
}
v_u_97.weld = v_u_97.Weld
function v_u_97.WeldWithName(p98, p99, p100)
    v_u_97.Weld(p98, p99).Name = p100
end
function v_u_97.ExactWeld(p101, p102, p103)
    local v104 = Instance.new("Weld")
    v104.Part0 = p101
    v104.Part1 = p102
    v104.C1 = p103
    print("Parenting mirror weld to " .. p101.Name)
    v104.Parent = p101
end
function v_u_97.MirrorWeld(p105, p106, p107, p108)
    local v109 = Instance.new("Weld")
    v109.Part0 = p105
    v109.Part1 = p106
    local v110 = CFrame.new(p107.Position)
    local v111 = p107.CFrame:inverse() * v110
    local v112 = p108.CFrame:inverse() * v110
    v109.C0 = v111
    v109.C1 = v112
    print("Parenting mirror weld to " .. p105.Name)
    v109.Parent = p105
end
function v_u_97.ScaleMirrorWeld(p113, p114, p115, p116, p117)
    local v118 = Instance.new("Weld")
    v118.Part0 = p113
    v118.Part1 = p114
    local v119 = CFrame.new(p115.Position)
    local v120 = p115.CFrame:inverse() * v119
    local v121 = p116.CFrame:inverse() * v119
    v118.C0 = CFrame.new(v120.p * p117) * (v120 - v120.p)
    v118.C1 = CFrame.new(v121.p * p117) * (v121 - v121.p)
    print("Parenting mirror weld to " .. p113.Name)
    v118.Parent = p113
end
local v_u_122 = {}
function v_u_97.mark(p123)
    local v124 = typeof(p123) == "CFrame" and p123 and p123 or CFrame.new(p123)
    local v125 = Instance.new("Part")
    v125.Name = "marker"
    v125.Anchored = true
    v125.BrickColor = BrickColor.new("Really red")
    v125.Size = Vector3.new(0.3, 0.3, 0.3)
    v125.CanCollide = false
    v125.CFrame = v124
    v125.Parent = workspace
    local v126 = v_u_122
    table.insert(v126, v125)
end
function v_u_97.clear_marks()
    for _, v127 in pairs(v_u_122) do
        v127:destroy()
    end
    v_u_122 = {}
end
local v_u_128 = workspace.CurrentCamera
function v_u_97.PanCamera(p129, p130, p_u_131, p_u_132, p133)
    workspace.CurrentCamera.CameraType = "Scriptable"
    local v134 = game:GetService("RunService")
    local v_u_135 = { p129:components() }
    local v_u_136 = { p130:components() }
    print("Comp1, ", v_u_135[1])
    local v_u_137 = tick()
    local v_u_138 = nil
    local v_u_139 = false
    v_u_138 = v134.RenderStepped:connect(function()
        if (tick() - v_u_137) / p_u_132 >= 1 then
            v_u_138:disconnect()
            v_u_139 = true
        else
            local v140 = {}
            for v141, _ in pairs(v_u_135) do
                local v142 = v_u_97[p_u_131]
                local v143 = tick() - v_u_137
                local v144 = v_u_135[v141]
                local v145 = v_u_136[v141] - v_u_135[v141]
                local v146 = p_u_132
                table.insert(v140, v142(v143, v144, v145, v146))
            end
            v_u_128.CoordinateFrame = CFrame.new(unpack(v140))
        end
    end)
    repeat
        wait()
    until v_u_139
    v_u_128.CoordinateFrame = p130
    if p133 ~= (1 / 0) then
        wait(p133)
        workspace.CurrentCamera.CameraType = "Custom"
    end
end
function v_u_97.easeInOutQuad(p147, p148, p149, p150)
    local v151 = p147 / (p150 / 2)
    if v151 < 1 then
        return p149 / 2 * v151 * v151 + p148
    end
    local v152 = v151 - 1
    return -p149 / 2 * (v152 * (v152 - 2) - 1) + p148
end
function v_u_97.linearTween(p153, p154, p155, p156)
    return p155 * p153 / p156 + p154
end
function v_u_97.easeOutQuad(p157, p158, p159, p160)
    local v161 = p157 / p160
    return -p159 * v161 * (v161 - 2) + p158
end
function v_u_97.easeInQuad(p162, p163, p164, p165)
    local v166 = p162 / p165
    return p164 * v166 * v166 + p163
end
function v_u_97.easeInCubic(p167, p168, p169, p170)
    local v171 = p167 / p170
    return p169 * v171 * v171 * v171 + p168
end
function v_u_97.formatDate(p172, p173)
    local v174 = Instance.new("LocalizationTable")
    v174:SetEntryValue("date", "", "", "date", ("{date:%s}"):format(p173 or "iso8601"))
    return v174:GetTranslator("date"):FormatByKey("date", {
        ["date"] = p172
    })
end
function v_u_97.getAlignedBoundingBox(p175, p176)
    if typeof(p175) == "Instance" then
        p175 = p175:GetDescendants()
    end
    local v177 = p176 or CFrame.new()
    local v178 = math.abs
    local v179 = (-1 / 0)
    local v180 = (-1 / 0)
    local v181 = (1 / 0)
    local v182 = (1 / 0)
    local v183 = (1 / 0)
    local v184 = (-1 / 0)
    for _, v185 in pairs(p175) do
        if v185:IsA("BasePart") then
            local v186 = v177:toObjectSpace(v185.CFrame)
            local v187 = v185.Size
            local v188 = v187.X
            local v189 = v187.Y
            local v190 = v187.Z
            local v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202 = v186:components()
            local v203 = 0.5 * (v178(v194) * v188 + v178(v195) * v189 + v178(v196) * v190)
            local v204 = 0.5 * (v178(v197) * v188 + v178(v198) * v189 + v178(v199) * v190)
            local v205 = 0.5 * (v178(v200) * v188 + v178(v201) * v189 + v178(v202) * v190)
            if v191 - v203 < v181 then
                v181 = v191 - v203
            end
            if v192 - v204 < v182 then
                v182 = v192 - v204
            end
            if v193 - v205 < v183 then
                v183 = v193 - v205
            end
            if v184 < v191 + v203 then
                v184 = v191 + v203
            end
            if v179 < v192 + v204 then
                v179 = v192 + v204
            end
            if v180 < v193 + v205 then
                v180 = v193 + v205
            end
        end
    end
    local v206 = Vector3.new(v181, v182, v183)
    local v207 = Vector3.new(v184, v179, v180)
    local v208 = (v207 + v206) / 2
    return v177 - v177.p + v177:pointToWorldSpace(v208), v207 - v206
end
return v_u_97