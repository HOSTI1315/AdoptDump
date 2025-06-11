--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PerformanceGraphApp (ModuleScript)

local v_u_1 = game:GetService("AssetService")
local v_u_2 = game:GetService("RunService")
local v3 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v4 = v3("Class")
local v_u_5 = v3("ServerType")
local v_u_6 = v3("new:ClientFramerateLog")
local function v_u_85(p7, p8)
    local v_u_9 = p8.bar_schema
    local v_u_10 = p8.bar_mode
    local v_u_11 = p8.width
    local v_u_12 = p8.height
    local v_u_13 = p7.KeySection.Key:Clone()
    local v_u_14 = p7.GraphSection.LabelX:Clone()
    local v_u_15 = p7.GraphSection.LabelY:Clone()
    local v_u_16 = p7.GraphSection.GuideY:Clone()
    local v17 = p7.GraphSection.Contents.View.Bar:Clone()
    local v18 = p7.GraphSection.Contents.View.Highlight:Clone()
    local v19 = p7.GraphSection.Contents.View:Clone()
    v19.Bar:Destroy()
    v19.Highlight:Destroy()
    local v_u_20 = p7:Clone()
    v_u_20.KeySection.Key:Destroy()
    v_u_20.GraphSection.LabelX:Destroy()
    v_u_20.GraphSection.LabelY:Destroy()
    v_u_20.GraphSection.GuideY:Destroy()
    v_u_20.GraphSection.Contents.View:Destroy()
    local function v26(p21)
        for _, v22 in v_u_20.KeySection:GetChildren() do
            if v22:IsA("Frame") then
                v22:Destroy()
            end
        end
        for v23, v24 in p21 do
            local v25 = v_u_13:Clone()
            v25.TextLabel.Text = v24.text
            v25.KeyColor.BackgroundColor3 = v24.color
            v25.KeyColor.BackgroundTransparency = v24.transparency or 0
            v25.LayoutOrder = v23
            v25.Parent = v_u_20.KeySection
        end
    end
    local function v31(p27, p28, p29)
        local v30 = v_u_20.GraphSection:FindFirstChild((("LabelX_%*"):format(p27)))
        if not v30 then
            v30 = v_u_14:Clone()
            v30.Name = ("LabelX_%*"):format(p27)
            v30.Parent = v_u_20.GraphSection
        end
        v30.Pivot.TextLabel.Text = p29
        v30.Position = UDim2.new(p28, 0, 1, 0)
    end
    local function v34(p32)
        local v33 = v_u_20.GraphSection:FindFirstChild((("LabelX_%*"):format(p32)))
        if v33 then
            v33:Destroy()
        end
    end
    local function v39(p35, p36, p37)
        local v38 = v_u_20.GraphSection:FindFirstChild((("LabelY_%*"):format(p35)))
        if not v38 then
            v38 = v_u_15:Clone()
            v38.Name = ("LabelY_%*"):format(p35)
            v38.Parent = v_u_20.GraphSection
        end
        v38.TextLabel.Text = p37
        v38.Position = UDim2.new(0, 0, 1 - p36, 0)
    end
    local function v42(p40)
        local v41 = v_u_20.GraphSection:FindFirstChild((("LabelY_%*"):format(p40)))
        if v41 then
            v41:Destroy()
        end
    end
    local function v46(p43, p44)
        local v45 = v_u_20.GraphSection:FindFirstChild((("GuideY_%*"):format(p43)))
        if not v45 then
            v45 = v_u_16:Clone()
            v45.Name = ("GuideY_%*"):format(p43)
            v45.Parent = v_u_20.GraphSection
        end
        v45.Position = UDim2.new(0, 0, 1 - p44, 0)
    end
    local function v49(p47)
        local v48 = v_u_20.GraphSection:FindFirstChild((("GuideY_%*"):format(p47)))
        if v48 then
            v48:Destroy()
        end
    end
    local v_u_50, v_u_51
    if v_u_10 == "editable_image" then
        v_u_50 = game:GetService("AssetService"):CreateEditableImage({
            ["Size"] = Vector2.new(v_u_11, v_u_12)
        })
        v_u_51 = game:GetService("AssetService"):CreateEditableImage({
            ["Size"] = Vector2.new(v_u_11, v_u_12)
        })
    else
        v_u_51 = nil
        v_u_50 = nil
    end
    local v_u_52 = v19:Clone()
    v_u_52.Parent = v_u_20.GraphSection.Contents
    local v_u_53 = 0
    local v_u_54 = v19:Clone()
    v_u_54.Parent = v_u_20.GraphSection.Contents
    local v_u_55 = 0
    local v_u_56 = true
    if v_u_10 == "gui" then
        for v57 = 0, v_u_11 - 1 do
            for v58 = 1, #v_u_9 do
                local v59 = v17:Clone()
                v59.Name = ("%*_%*"):format(v57, v58)
                v59.Size = UDim2.new(1 / v_u_11, 0, 0, 0)
                v59.Position = UDim2.new(v57 / v_u_11, 0, 1, 0)
                v59.BackgroundColor3 = v_u_9[v58]
                v59.Parent = v_u_52
                v59:Clone().Parent = v_u_54
            end
            local v60 = v18:Clone()
            v60.Name = ("h_%*"):format(v57)
            v60.Size = UDim2.new(1 / v_u_11, 0, 0, 0)
            v60.Position = UDim2.new(v57 / v_u_11, 0, 0, 0)
            v60.Parent = v_u_52
            local v61 = v60:Clone()
            v61.Name = ("h_%*"):format(v57)
            v61.Size = UDim2.new(1 / v_u_11, 0, 0, 0)
            v61.Position = UDim2.new(v57 / v_u_11, 0, 0, 0)
            v61.Parent = v_u_54
        end
    else
        v_u_52.ImageContent = Content.fromObject(v_u_50)
        v_u_54.ImageContent = Content.fromObject(v_u_51)
    end
    return {
        ["instance"] = v_u_20,
        ["set_key"] = v26,
        ["set_label_x"] = v31,
        ["remove_label_x"] = v34,
        ["set_label_y"] = v39,
        ["remove_label_y"] = v42,
        ["set_guide_y"] = v46,
        ["remove_guide_y"] = v49,
        ["add_bar"] = function(p62, p63)
            local v64 = v_u_56 and v_u_52 or v_u_54
            local v65 = v_u_56 and v_u_53 or v_u_55
            if v_u_10 == "gui" then
                local v66 = 0
                for v67, v68 in p62 do
                    local v69 = v64[("%*_%*"):format(v65, v67)]
                    v69.Size = UDim2.new(1 / v_u_11, 0, v68, 0)
                    v69.Position = UDim2.new(v65 / v_u_11, 0, 1 - v66, 0)
                    v66 = v66 + v68
                end
                for v70 = #p62 + 1, #v_u_9 do
                    v64[("%*_%*"):format(v65, v70)].Size = UDim2.new(1 / v_u_11, 0, 0, 0)
                end
                if p63 then
                    local v71 = v64[("h_%*"):format(v65)]
                    v71.BackgroundColor3 = p63
                    v71.Size = UDim2.new(1 / v_u_11, 0, 1, 0)
                else
                    v64[("h_%*"):format(v65)].Size = UDim2.new(1 / v_u_11, 0, 0, 0)
                end
            else
                local v72 = v_u_56 and v_u_50 or v_u_51
                if p63 then
                    v72:DrawLine(Vector2.new(v65, 0), Vector2.new(v65, v_u_12 - 1), p63, 0.7, Enum.ImageCombineType.Overwrite)
                end
                local v73 = 0
                for v74, v75 in p62 do
                    local v76 = Vector2.new
                    local v77 = (1 - v73) * v_u_12
                    local v78 = math.floor(v77)
                    local v79 = v_u_12 - 1
                    local v80 = v76(v65, (math.clamp(v78, 0, v79)))
                    local v81 = Vector2.new
                    local v82 = (1 - v73 - v75) * v_u_12
                    local v83 = math.floor(v82)
                    local v84 = v_u_12 - 1
                    v72:DrawLine(v80, v81(v65, (math.clamp(v83, 0, v84))), v_u_9[v74], 0, Enum.ImageCombineType.Overwrite)
                    v73 = v73 + v75
                end
            end
            if v_u_56 then
                v_u_52.Position = UDim2.new(1 - v_u_53 / v_u_11, 0, 0, 0)
                v_u_54.Position = UDim2.new(-v_u_53 / v_u_11, 0, 0, 0)
                v_u_53 = v_u_53 + 1
                if v_u_11 <= v_u_53 then
                    v_u_53 = 0
                    v_u_56 = false
                    if v_u_10 == "editable_image" then
                        v_u_51:DrawRectangle(Vector2.new(0, 0), Vector2.new(v_u_11, v_u_12 - 1), Color3.new(0, 0, 0), 1, Enum.ImageCombineType.Overwrite)
                        return
                    end
                end
            else
                v_u_54.Position = UDim2.new(1 - v_u_55 / v_u_11, 0, 0, 0)
                v_u_52.Position = UDim2.new(-v_u_55 / v_u_11, 0, 0, 0)
                v_u_55 = v_u_55 + 1
                if v_u_11 <= v_u_55 then
                    v_u_55 = 0
                    v_u_56 = true
                    if v_u_10 == "editable_image" then
                        v_u_50:DrawRectangle(Vector2.new(0, 0), Vector2.new(v_u_11, v_u_12 - 1), Color3.new(0, 0, 0), 1, Enum.ImageCombineType.Overwrite)
                    end
                end
            end
        end
    }
end
local v86, v_u_87 = v4("PerformanceGraphApp", v3("UIBaseApp"))
function v86.__init(p88, ...)
    v_u_87.__init(p88, ...)
end
function v86.show(p89)
    p89.instance.Frame.Visible = true
    v_u_6.mutate_settings({
        ["enabled"] = true,
        ["mode_detailed"] = true
    })
end
function v86.hide(p90)
    p90.instance.Frame.Visible = false
end
function v86.start(p_u_91)
    local v92 = p_u_91.instance.Frame.GraphTemplate
    v92.Parent = nil
    local function v_u_93()
        while not p_u_91.instance.Frame.Visible do
            p_u_91.instance.Frame:GetPropertyChangedSignal("Visible"):Wait()
        end
    end
    local v94 = pcall(function()
        v_u_1:CreateEditableImage():DrawLine(Vector2.new(), Vector2.new(), Color3.new(), 0, Enum.ImageCombineType.Overwrite)
    end) and "editable_image" or "gui"
    local v_u_95 = v94 == "gui" and 10 or 1
    local v_u_96 = v_u_85(v92, {
        ["bar_schema"] = {
            Color3.fromHex("#b30000"),
            Color3.fromHex("#5ad45a"),
            Color3.fromHex("#4421af"),
            Color3.fromHex("#ff9900"),
            Color3.fromHex("#1a53ff")
        },
        ["bar_mode"] = v94,
        ["width"] = 300 / v_u_95,
        ["height"] = 180
    })
    v_u_96.set_key({
        {
            ["color"] = Color3.fromHex("#b30000"),
            ["text"] = ("%*  <font transparency=\"0.2\">%*</font>"):format("prerender", "[vsync, replication, input]")
        },
        {
            ["color"] = Color3.fromHex("#5ad45a"),
            ["text"] = ("%*  <font transparency=\"0.2\">%*</font>"):format("preanim", "[render setup, replication, gc]")
        },
        {
            ["color"] = Color3.fromHex("#4421af"),
            ["text"] = ("%*  <font transparency=\"0.2\">%*</font>"):format("presim", "[anim]")
        },
        {
            ["color"] = Color3.fromHex("#ff9900"),
            ["text"] = ("%*  <font transparency=\"0.2\">%*</font>"):format("heartbeat", "[physics]")
        },
        {
            ["color"] = Color3.fromHex("#1a53ff"),
            ["text"] = ("%*  <font transparency=\"0.2\">%*</font>"):format("postsim", "[luau heartbeat]")
        },
        {
            ["color"] = Color3.fromRGB(178.5, 178.5, 61.599999999999994),
            ["text"] = "loading (background)",
            ["transparency"] = 0.3
        }
    })
    v_u_96.set_label_y("240", 0.0625, "240")
    v_u_96.set_label_y("120", 0.125, "120")
    v_u_96.set_label_y("60", 0.25, "60")
    v_u_96.set_label_y("30", 0.5, "30")
    v_u_96.set_label_y("24", 0.625, "24")
    v_u_96.set_label_y("15", 1, "15")
    v_u_96.set_guide_y("240", 0.0625)
    v_u_96.set_guide_y("120", 0.125)
    v_u_96.set_guide_y("60", 0.25)
    v_u_96.set_guide_y("30", 0.5)
    v_u_96.set_guide_y("24", 0.625)
    v_u_96.set_guide_y("15", 1)
    v_u_96.set_label_x("min", 1, "0s")
    v_u_96.set_label_x("max", 0, "?s")
    task.spawn(function()
        if not v_u_5.use_production_behavior() then
            v_u_6.mutate_settings({
                ["enabled"] = true,
                ["mode_detailed"] = true
            })
        end
        local v97 = v_u_6.get_frametimes().global
        while true do
            v_u_93()
            for _ = 1, v_u_95 do
                v_u_2.Heartbeat:Wait()
            end
            if v97.roundtrip.sum_all ~= 0 then
                local v98 = v97.prerender
                local v99 = #v98.frames_delta - v_u_95
                local v100 = 0
                local v101 = 0
                for v102 = math.max(1, v99), #v98.frames_delta do
                    v100 = v100 + v98.frames_delta[v102]
                    v101 = v101 + 1
                end
                local v103
                if v101 == 0 then
                    v103 = nil
                else
                    v103 = v100 / v101
                end
                local v104 = v97.preanim
                local v105 = #v104.frames_delta - v_u_95
                local v106 = 0
                local v107 = 0
                for v108 = math.max(1, v105), #v104.frames_delta do
                    v106 = v106 + v104.frames_delta[v108]
                    v107 = v107 + 1
                end
                local v109
                if v107 == 0 then
                    v109 = nil
                else
                    v109 = v106 / v107
                end
                local v110 = v97.presim
                local v111 = #v110.frames_delta - v_u_95
                local v112 = 0
                local v113 = 0
                for v114 = math.max(1, v111), #v110.frames_delta do
                    v112 = v112 + v110.frames_delta[v114]
                    v113 = v113 + 1
                end
                local v115
                if v113 == 0 then
                    v115 = nil
                else
                    v115 = v112 / v113
                end
                local v116 = v97.postsim
                local v117 = #v116.frames_delta - v_u_95
                local v118 = 0
                local v119 = 0
                for v120 = math.max(1, v117), #v116.frames_delta do
                    v118 = v118 + v116.frames_delta[v120]
                    v119 = v119 + 1
                end
                local v121
                if v119 == 0 then
                    v121 = nil
                else
                    v121 = v118 / v119
                end
                local v122 = v97.heartbeat
                local v123 = #v122.frames_delta - v_u_95
                local v124 = 0
                local v125 = 0
                for v126 = math.max(1, v123), #v122.frames_delta do
                    v124 = v124 + v122.frames_delta[v126]
                    v125 = v125 + 1
                end
                local v127
                if v125 == 0 then
                    v127 = nil
                else
                    v127 = v124 / v125
                end
                if v103 ~= nil and (v109 ~= nil and (v115 ~= nil and v121 ~= nil)) then
                    local v128 = v_u_96.add_bar
                    local v129 = {
                        v103 / 0.06666666666666667,
                        v109 / 0.06666666666666667,
                        v115 / 0.06666666666666667,
                        v127 / 0.06666666666666667,
                        v121 / 0.06666666666666667
                    }
                    local v130
                    if v97.roundtrip.frames_type[#v97.roundtrip.frames_type] == 1 then
                        v130 = Color3.fromRGB(255, 255, 88)
                    else
                        v130 = nil
                    end
                    v128(v129, v130)
                    v_u_96.set_label_x("max", 0, string.format("%.3fs", v97.roundtrip.sum_all))
                end
            end
        end
    end)
    local v_u_131 = p_u_91.instance.Frame.Framerate.TextLabel
    task.spawn(function()
        if v_u_5.use_production_behavior() then
            v_u_93()
        end
        v_u_6.long_recording_start("graph_app_10sec", 10)
        v_u_6.long_recording_start("graph_app_1min", 60)
        v_u_6.long_recording_start("graph_app_5min", 300)
        v_u_6.very_long_recording_start("graph_app_forever")
        while true do
            v_u_93()
            local v132 = v_u_6.very_long_recording_get("graph_app_forever")
            local v133 = v132.sum_nonloading
            local v134 = v132.count_nonloading
            local v135 = 0
            local v136 = 0
            for _, v137 in v_u_6.long_recording_get("graph_app_10sec").segments do
                v135 = v135 + v137.nonloading.roundtrip
                v136 = v136 + v137.nonloading.count
            end
            local v138 = 0
            local v139 = 0
            for _, v140 in v_u_6.long_recording_get("graph_app_1min").segments do
                v138 = v138 + v140.nonloading.roundtrip
                v139 = v139 + v140.nonloading.count
            end
            local v141 = 0
            local v142 = 0
            for _, v143 in v_u_6.long_recording_get("graph_app_5min").segments do
                v141 = v141 + v143.nonloading.roundtrip
                v142 = v142 + v143.nonloading.count
            end
            v_u_131.Text = "fps:\n" .. ("%* last ~10s\n"):format(v136 == 0 and "N/A" or string.format("%.2f", v136 / v135)) .. ("%* last ~1m \n"):format(v139 == 0 and "N/A" or string.format("%.2f", v139 / v138)) .. ("%* last ~5m \n"):format(v142 == 0 and "N/A" or string.format("%.2f", v142 / v141)) .. ("%* session  \n"):format(v134 == 0 and "N/A" or string.format("%.2f", v134 / v133)) .. "(loading excluded)"
            task.wait()
        end
    end)
    v_u_96.instance.Parent = p_u_91.instance.Frame
end
return v86