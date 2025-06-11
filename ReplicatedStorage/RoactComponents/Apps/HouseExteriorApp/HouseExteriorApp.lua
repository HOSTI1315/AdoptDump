--// ReplicatedStorage.RoactComponents.Apps.HouseExteriorApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("Roact")
local v_u_3 = v_u_1("RoactRodux")
local v_u_4 = v_u_1("HouseDB")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = v_u_1("AnimationManager")
local v_u_7 = v_u_1("DoorsM")
local v_u_8 = v_u_1("InteractionsEngine")
local v_u_9 = v_u_1("HouseClient")
local v_u_10 = v_u_1("TableUtil")
local v_u_11 = v_u_1("HouseRenderHelper")
local v_u_12 = v_u_1("VehicleBlockerHelper")
local v_u_13 = v_u_1("ClientToolManager")
local v_u_14 = v_u_1("InteriorsM")
local v_u_15 = v_u_1("TradeLicenseHelper")
local v_u_16 = v_u_1("TranslationHelper")
local v_u_17 = v_u_1("FamilyHelper")
local v_u_18 = v_u_1("package:Sift")
local v_u_19 = v_u_1("Maid")
v_u_1("SharedConstants")
v_u_1("package:Promise")
v_u_1("TweenPromise")
local v_u_20 = game:GetService("RunService")
local v_u_21 = game:GetService("CollectionService")
game:GetService("ContentProvider")
game:GetService("Players")
local v_u_22 = game:GetService("ReplicatedStorage")
local v23 = {}
local v_u_24 = v_u_2.createElement
local v_u_25 = v_u_2.PureComponent:extend("HouseExterior")
local function v_u_26()
    v_u_1("UIManager").set_app_visibility("HouseChooserApp", true)
end
local function v_u_29()
    local v27 = v_u_1("UIManager")
    local v28 = v_u_1("RouterClient")
    if v27.apps.DialogApp:dialog({
        ["text"] = "Unlist house for trade?",
        ["left"] = "No",
        ["right"] = "Yes"
    }) == "Yes" then
        v28.get("HousingAPI/UnlistHouse"):InvokeServer()
    end
end
local function v_u_35(p30)
    local v31 = v_u_1("UIManager")
    local v32 = v_u_1("RouterClient")
    local v33 = v32.get("HousingAPI/GetNonTradeableFurniture"):InvokeServer(p30)
    if not v33 or next(v33) == nil or v31.apps.DialogApp:dialog({
        ["dialog_type"] = "ScrollingDialog",
        ["labels"] = {
            {
                ["text"] = "Listing this house will remove:",
                ["size"] = 34,
                ["padding"] = 20
            },
            {
                ["text"] = table.concat(v_u_18.List.map(v33, function(p34)
                    return v_u_16.translate(game, p34.name)
                end), ", "),
                ["size"] = 24,
                ["already_translated"] = true
            }
        },
        ["left"] = "Cancel",
        ["right"] = "Continue"
    }) == "Continue" then
        v32.get("HousingAPI/ListHouse"):InvokeServer()
    end
end
local function v_u_39(p36, p37)
    local v38 = v_u_1("UIManager")
    if p37.donatable then
        if v_u_15.player_has_trade_license() then
            if #(v_u_5.get("house_manager") or {}) <= 1 then
                v38.apps.DialogApp:dialog({
                    ["text"] = "You can\'t trade your only house! Otherwise where would you live?",
                    ["button"] = "Okay"
                })
            elseif v38.apps.DialogApp:dialog({
                ["text"] = "List this house?",
                ["left"] = "Cancel",
                ["right"] = "Yes"
            }) == "Yes" then
                v_u_35(p36)
            end
        else
            v38.apps.DialogApp:dialog({
                ["text"] = v_u_15.HOUSE_FAILURE_MESSAGE,
                ["button"] = "Okay"
            })
            v38.apps.TradeApp:prompt_safety_hub_navigation()
            return
        end
    else
        v38.apps.DialogApp:dialog({
            ["text"] = "You can\'t trade this house.",
            ["button"] = "Okay"
        })
        return
    end
end
local function v_u_41()
    local v40 = v_u_1("RouterClient")
    if v_u_1("UIManager").apps.DialogApp:dialog({
        ["text"] = "You can\'t lock your door while your house is listed for trade.",
        ["right"] = "Unlist for Trade",
        ["left"] = "Cancel"
    }) == "Cancel" then
        return false
    else
        return v40.get("HousingAPI/UnlistHouse"):InvokeServer()
    end
end
function v_u_25.add_mailbox(p_u_42)
    local v43 = p_u_42.house
    local v_u_44 = v_u_4[p_u_42.props.building_type]
    local v45 = v_u_44.mailbox_offset or CFrame.new(0, 0, 0)
    local v46 = v_u_22:WaitForChild("Resources"):WaitForChild("Mailbox")
    v46:WaitForChild("Plot")
    v46:WaitForChild("Top"):WaitForChild("BillboardGui"):WaitForChild("TextLabel")
    local v_u_47 = v46:clone()
    v_u_47.PrimaryPart = v_u_47:WaitForChild("Plot")
    v_u_47:SetPrimaryPartCFrame(v43.Plot.CFrame * v45)
    v_u_47.Top.BillboardGui.TextLabel.Text = (p_u_42.props.player_name or "N/A") .. "\'s House"
    v_u_47.Plot:Destroy()
    if p_u_42.props.player_name == game.Players.LocalPlayer.Name then
        game:GetService("CollectionService"):AddTag(v_u_47, "MyMailbox")
        local v48 = {
            {
                ["text"] = "Change House",
                ["on_selected"] = v_u_26
            },
            {
                ["text"] = "Throw Party",
                ["on_selected"] = function()
                    v_u_9.throw_party()
                end
            },
            {
                ["text"] = function()
                    return v_u_9.is_door_locked() and "Unlock Door" or "Lock Door"
                end,
                ["on_selected"] = function()
                    if not p_u_42.props.listed_for_trade or v_u_41() then
                        v_u_9.lock_door()
                    end
                end
            },
            {
                ["text"] = p_u_42.props.listed_for_trade and "Unlist for Trade" or "List for Trade",
                ["on_selected"] = function()
                    if p_u_42.props.listed_for_trade then
                        v_u_29()
                    else
                        v_u_39(p_u_42.props.house_id, v_u_44)
                    end
                end
            }
        }
        local v49 = p_u_42.custom_interactions
        local v50 = v_u_8
        local v51 = {
            ["part"] = v_u_47.Top,
            ["on_selected"] = v48
        }
        table.insert(v49, v50:register(v51))
    end
    local v52 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("DailyCounter")
    v52:WaitForChild("Plot")
    v52:WaitForChild("Counter"):WaitForChild("SurfaceGui"):WaitForChild("TextLabel")
    local v53 = v52:clone()
    v53.PrimaryPart = v53:WaitForChild("Plot")
    v53:SetPrimaryPartCFrame(v43.Plot.CFrame * v45)
    v53.Counter.SurfaceGui.TextLabel.Text = p_u_42.props.streak
    v53.Plot:Destroy()
    if p_u_42.props.player_name == game.Players.LocalPlayer.Name then
        v_u_5.update("house_exterior_model", v43)
    end
    local v_u_54
    if p_u_42.props.player_name == game.Players.LocalPlayer.Name then
        v_u_54 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("HomeBillboard"):clone()
        v_u_54.Parent = v_u_47
    else
        v_u_54 = nil
    end
    local v55
    if p_u_42.props.listed_for_trade then
        v55 = game.ReplicatedStorage:WaitForChild("Resources"):WaitForChild("ForTradeSign"):Clone()
        v55.PrimaryPart = v55:WaitForChild("Plot")
        v55:SetPrimaryPartCFrame(v43.Plot.CFrame * v45)
        v55.Plot:Destroy()
        local v_u_56 = game.Players.LocalPlayer.Name == p_u_42.props.player_name
        local v57 = p_u_42.custom_interactions
        local v58 = v_u_8
        local v62 = {
            ["part"] = v55.PromptLocation,
            ["text"] = v_u_56 and "Unlist for Trade" or "Learn More",
            ["on_selected"] = function()
                local v59 = v_u_1("UIManager")
                if v_u_56 then
                    v_u_29()
                    return
                elseif v59.apps.DialogApp:dialog({
                    ["text"] = string.format("This house is for trade. Do you want to view it?"),
                    ["left"] = "Cancel",
                    ["right"] = "View"
                }) == "Cancel" then
                    return
                else
                    local v60 = game.Players:FindFirstChild(p_u_42.props.player_name or "")
                    if v60 then
                        local v61 = v_u_5.get("dev_watchmode")
                        if v_u_5.get_server(v60, "door_locked") and not (v61 or v_u_17.is_my_friend_or_family(v60)) then
                            v59.apps.HintApp:hint({
                                ["text"] = ("%s locked their house."):format(v60.Name),
                                ["length"] = 4
                            })
                        else
                            v_u_14.enter_smooth("housing", "MainDoor", {
                                ["house_owner"] = v60
                            })
                        end
                    else
                        return
                    end
                end
            end
        }
        table.insert(v57, v58:register(v62))
    else
        v55 = nil
    end
    v_u_47.Parent = v43
    v53.Parent = v43
    if v55 then
        v55.Parent = v43
    end
    delay(1.5, function()
        while v_u_47 and (v_u_47.Parent and v_u_54) do
            if v_u_54.Enabled == false and (v_u_47.Top.Position - workspace.Camera.CoordinateFrame.p).magnitude > 90 then
                v_u_54.Enabled = true
            elseif v_u_54.Enabled == true and (v_u_47.Top.Position - workspace.Camera.CoordinateFrame.p).magnitude < 60 then
                v_u_54.Enabled = false
            end
            wait(0.2)
        end
    end)
end
function v_u_25.add_house_owner_image(p63)
    local v64 = game.Players:FindFirstChild(p63.props.player_name or "")
    if v64 ~= nil then
        if p63.house:FindFirstChild("OwnerDetails") then
            local v65 = "https://www.roblox.com/headshot-thumbnail/image?width=150&height=150&format=png&userid=" .. v64.UserId
            if p63.house.OwnerDetails:FindFirstChild("SurfaceGui") then
                p63.house.OwnerDetails.SurfaceGui.Avatar.Image = v65
                return
            end
            if p63.house.OwnerDetails:FindFirstChild("Avatar") then
                p63.house.OwnerDetails.Avatar.Texture = v65
            end
        end
    end
end
function v_u_25.add_custom_signs(p_u_66)
    if not p_u_66.props.listed_for_trade then
        local v67 = p_u_66.house:FindFirstChild("CustomSigns")
        if v67 then
            for _, v68 in pairs(v67:GetChildren()) do
                v68.SurfaceGui.ImageLabel.Image = p_u_66.props.custom_sign_image or v68.SurfaceGui.ImageLabel.Image
                if p_u_66.props.player_name == game.Players.LocalPlayer.Name then
                    local v69 = p_u_66.custom_interactions
                    local v70 = v_u_8
                    local v74 = {
                        ["part"] = v68:FindFirstChild("UseBlock") or v68,
                        ["text"] = "Change Sign",
                        ["on_selected"] = function()
                            local v71 = v_u_1("UIManager")
                            local v72 = v_u_1("RouterClient")
                            local v73 = v71.apps.BackpackApp:pick_item()
                            if v73 then
                                v72.get("HousingAPI/ChangeCustomSign"):FireServer(p_u_66.props.house_id, v73.category, v73.id)
                            end
                        end
                    }
                    table.insert(v69, v70:register(v74))
                end
            end
        end
    end
end
function v_u_25.add_text_signs(p_u_75)
    local v76 = p_u_75.house:FindFirstChild("TextSigns")
    if v76 then
        for _, v77 in pairs(v76:GetChildren()) do
            local v_u_78 = v77.Name
            local v79 = v77:FindFirstChild("SignTextLabel", true)
            local v80 = v_u_4[p_u_75.props.building_type].text_signs[v_u_78]
            local v_u_81 = v80.default_text
            local v_u_82 = v80.max_length
            local v83 = #v_u_81 <= v_u_82
            assert(v83)
            if p_u_75.props.listed_for_trade then
                v79.Text = v_u_81
            else
                if p_u_75.props.text_sign_texts then
                    v_u_81 = p_u_75.props.text_sign_texts[v_u_78] or v_u_81
                end
                v79.Text = v_u_81
                if p_u_75.props.player_name == game.Players.LocalPlayer.Name then
                    local v84 = p_u_75.custom_interactions
                    local v85 = v_u_8
                    local v91 = {
                        ["part"] = v77:FindFirstChild("UseBlock") or v77,
                        ["text"] = "Change Sign",
                        ["on_selected"] = function()
                            local v86 = v_u_1("UIManager")
                            local v87 = v_u_1("RouterClient")
                            local v88 = {
                                ["left"] = "Cancel",
                                ["right"] = "Save",
                                ["existing_text"] = v_u_81,
                                ["max_length"] = v_u_82,
                                ["multiline"] = true,
                                ["use_utf8_length"] = true
                            }
                            local v89, v90 = v86.apps.DialogApp:paragraph_dialog(v88)
                            if v89 == "Save" and v90 then
                                v87.get("HousingAPI/ChangeTextSignText"):FireServer(p_u_75.props.house_id, v_u_78, v90)
                            end
                        end
                    }
                    table.insert(v84, v85:register(v91))
                end
            end
        end
    end
end
function v_u_25.add_animations(p92)
    local v93 = p92.house
    if v93:FindFirstChild("Spotlights") then
        for v94, v95 in pairs(v93.Spotlights:GetChildren()) do
            local v96 = v95.AnimationController:LoadAnimation(v_u_6.get_track("PartySpotlight"))
            v96:Play(0)
            v96.TimePosition = (v94 - 1) * 3
        end
    end
    if v93:FindFirstChild("Dragon") then
        local v97 = v93.Dragon.Head
        local v98 = v93.Dragon.Torso1
        local v_u_99 = v97.CFrame
        local _ = (v98.NeckAttachment.WorldPosition - v97.CFrame.p).Magnitude
        local v_u_100 = game.Players.LocalPlayer
        local v_u_101 = v93.WindmillBig
        local v_u_102 = v93.WindmillSmall
        local v_u_103 = Instance.new("Motor6D")
        v_u_103.Part0 = v98
        v_u_103.Part1 = v97
        v_u_103.C0 = v98.NeckAttachment.CFrame
        v_u_103.C1 = v97.NeckAttachment.CFrame
        v_u_103.Parent = v98
        v97.Anchored = false
        local v_u_104 = CFrame.new(v_u_99.p, v_u_99.p + v_u_99.LookVector)
        local v_u_105 = v_u_104
        local v_u_106 = 0.5
        local v_u_107 = 0
        local v_u_108 = 0
        local v_u_109 = 0
        local v_u_110 = (v98.CFrame - v98.CFrame.p):inverse()
        local function v118(p111)
            v_u_106 = v_u_106 + p111
            if v_u_106 > 0.5 then
                v_u_106 = v_u_106 - 0.5
                local v112 = v_u_100.Character
                if v112 then
                    v112 = v_u_100.Character:GetPrimaryPartCFrame().p
                end
                if v112 then
                    local v113 = v112 - v_u_99.p
                    local v114 = v_u_110 * CFrame.new(Vector3.new(0, 0, 0), v113)
                    local v115, v116, v117 = v114:toEulerAnglesXYZ()
                    v_u_107 = math.clamp(v115, -0.8726646259971648, 0)
                    v_u_108 = math.clamp(v116, -0.8726646259971648, 0.8726646259971648)
                    v_u_109 = math.clamp(v117, -0.2617993877991494, 0.2617993877991494)
                    v_u_105 = v_u_103.Transform
                    v_u_104 = CFrame.new(v114.p) * CFrame.Angles(v_u_107, v_u_108, v_u_109)
                end
            end
            v_u_103.Transform = v_u_105:lerp(v_u_104, v_u_106 * 2)
            v_u_102:SetPrimaryPartCFrame(v_u_102.PrimaryPart.CFrame * CFrame.Angles(0.003, 0, 0))
            v_u_101:SetPrimaryPartCFrame(v_u_101.PrimaryPart.CFrame * CFrame.Angles(0.003, 0, 0))
        end
        p92.maid:GiveTask(v_u_20.Heartbeat:Connect(v118))
    end
end
function v_u_25.add_color(p119)
    local v120 = p119.house
    local v121 = p119.props.color or Color3.new()
    v_u_11.color_house_exterior(v120, v121)
end
local function v_u_128(p122, p123)
    if p122.Parent and p122:IsA("Model") then
        if p123 then
            for _, v124 in pairs(p122.ForRentSign:GetChildren()) do
                v124.Transparency = 0
                v124.CanCollide = true
            end
            for _, v125 in pairs(p122.Perimeter:GetChildren()) do
                v125.Beam.Enabled = true
                v125.Transparency = 0
            end
            p122.ForRentSign.Sign.DecalA.Transparency = 0
            p122.ForRentSign.Sign.DecalB.Transparency = 0
            return
        end
        for _, v126 in pairs(p122.ForRentSign:GetChildren()) do
            v126.Transparency = 1
            v126.CanCollide = false
        end
        for _, v127 in pairs(p122.Perimeter:GetChildren()) do
            v127.Beam.Enabled = false
            v127.Transparency = 1
        end
        p122.ForRentSign.Sign.DecalA.Transparency = 1
        p122.ForRentSign.Sign.DecalB.Transparency = 1
    end
end
function v_u_25.clean_custom_interactions(p129)
    if p129.custom_interactions then
        for _, v130 in pairs(p129.custom_interactions) do
            v130:destroy()
        end
    end
    p129.custom_interactions = {}
end
function v_u_25.update_exterior(p131)
    if p131.house then
        p131.house:Destroy()
    end
    if p131.maid then
        p131.maid:DoCleaning()
    else
        p131.maid = v_u_19.new()
    end
    if p131.props.building_type and p131.props.physical_plot then
        local v132 = v_u_4[p131.props.building_type]
        local v133 = p131.props.physical_plot
        if v133 == nil or (v133.Parent == nil or v133:IsA("Model") and v133:FindFirstChild("Plot") == nil) then
            return
        end
        p131.physical_plot = p131.props.physical_plot
        v_u_128(p131.physical_plot, false)
        p131:clean_custom_interactions()
        local v134, v135 = v132.get_exterior()
        p131.house = v134:Clone()
        p131.house.Plot.Transparency = 1
        p131.house.PrimaryPart = p131.house.Plot
        if v133:IsA("Model") then
            v133 = v133.Plot or v133
        end
        p131.house:SetPrimaryPartCFrame(v133.CFrame - Vector3.new(0, 1, 0))
        local v136 = { "MainDoor" }
        if not v135 then
            if v132.additional_doors then
                v136 = v_u_10.combine(v136, v132.additional_doors)
            end
            if v132.addons then
                local v137 = v_u_11.apply_addons_to_exterior(p131.house, v132, p131.props.active_addons)
                v136 = v_u_10.combine(v136, v137)
            end
        end
        p131:add_mailbox()
        p131:add_house_owner_image()
        p131:add_custom_signs()
        p131:add_text_signs()
        p131:add_color()
        for _, v138 in pairs(v136) do
            local v139 = p131.house:WaitForChild("Doors"):WaitForChild(v138)
            v_u_21:AddTag(v139, "Door")
            local v140 = v139:WaitForChild("WorkingParts"):WaitForChild("Configuration")
            local v141 = v140:FindFirstChild("destination_door_id")
            if not v141 or v141.Value == "" then
                local v142 = Instance.new("StringValue")
                v142.Name = "destination_door_id"
                v142.Value = v138
                v142.Parent = v140
            end
            local v143 = Instance.new("StringValue")
            v143.Name = "destination_id"
            v143.Value = "housing"
            v143.Parent = v140
            local v144 = Instance.new("StringValue")
            v144.Value = p131.props.player_name or ""
            v144.Name = "house_owner"
            v144.Parent = v140
            v_u_7.get_door(p131.house.Doors[v138])
        end
        p131.house.Parent = p131.folder
        p131:add_animations()
    end
    v_u_12.mark_house_exteriors_changed()
end
function v_u_25.check_collisions(p145)
    if p145.house then
        local v146 = OverlapParams.new()
        v146.FilterDescendantsInstances = { p145.house }
        v146.FilterType = Enum.RaycastFilterType.Include
        v146.RespectCanCollide = true
        v146.MaxParts = 1
        local v147 = game.Players.LocalPlayer.Character
        if v147 then
            v147 = v147:FindFirstChild("HumanoidRootPart")
        end
        if v147 and #workspace:GetPartsInPart(v147, v146) > 0 then
            local v148 = p145.props.physical_plot
            if v148:IsA("Model") then
                v148 = v148.Plot or v148
            end
            local v149 = v148.CFrame * CFrame.new(0, 5, -v148.Size.Z / 2 - 5)
            local v150 = v_u_14.get_current_location()
            if v150 then
                local v151 = v_u_13.get_equipped_by_category("transport")[1]
                if v151 then
                    task.spawn(v_u_13.backpack_equip, v151, {
                        ["forced_action"] = "unequip"
                    })
                end
                v_u_14.enter_smooth(v150.destination_id, v150.destination_door_id, {
                    ["fade_in_length"] = 0.1,
                    ["spawn_cframe"] = v149
                })
            end
        end
    end
end
function v_u_25.shouldUpdate(p152, p153, _)
    return (p152.props.player ~= p153.player or (p152.props.player_name ~= p153.player_name or (p152.props.building_type ~= p153.building_type or (p152.props.house_id ~= p153.house_id or (p152.props.color ~= p153.color or (p152.props.custom_sign_image ~= p153.custom_sign_image or (p152.props.text_sign_texts ~= p153.text_sign_texts or (p152.props.plot_name ~= p153.plot_name or p152.props.physical_plot ~= p153.physical_plot)))))))) and true or (p152.props.streak ~= p153.streak or not v_u_18.Dictionary.equals(p152.props.active_addons, p153.active_addons) or p152.props.listed_for_trade ~= p153.listed_for_trade)
end
function v_u_25.didUpdate(p_u_154, p155, _)
    p_u_154:update_exterior()
    if p155.building_type ~= p_u_154.props.building_type then
        task.spawn(function()
            p_u_154:check_collisions()
        end)
    end
end
function v_u_25.didMount(p_u_156)
    p_u_156:update_exterior()
    task.spawn(function()
        p_u_156:check_collisions()
    end)
end
function v_u_25.willUnmount(p157)
    if p157.house then
        p157.house:Destroy()
    end
    if p157.maid then
        p157.maid:DoCleaning()
    end
    p157:clean_custom_interactions()
    if p157.physical_plot then
        v_u_128(p157.physical_plot, true)
    end
    v_u_12.mark_house_exteriors_changed()
end
function v_u_25.render(p_u_158)
    return v_u_24("Folder", {
        [v_u_2.Ref] = function(p159)
            p_u_158.folder = p159
        end
    })
end
local v_u_168 = v_u_3.connect(function(p160)
    local v161 = p160:getState()
    return {
        ["house_exteriors"] = v161.house_exteriors,
        ["loaded_plots"] = v161.loaded_plots
    }
end)(function(p162)
    local v163 = p162.house_exteriors or {}
    local v164 = p162.loaded_plots or {}
    local v165 = {}
    for v166, v167 in pairs(v163) do
        v165[v166] = v_u_24(v_u_25, {
            ["player"] = v167.player,
            ["player_name"] = v167.player_name,
            ["building_type"] = v167.building_type,
            ["house_id"] = v167.house_id,
            ["color"] = v167.color,
            ["custom_sign_image"] = v167.custom_sign_image,
            ["text_sign_texts"] = v167.text_sign_texts,
            ["plot_name"] = v167.plot_name,
            ["physical_plot"] = v164[v167.plot_name],
            ["streak"] = v167.streak,
            ["active_addons"] = v167.active_addons,
            ["listed_for_trade"] = v167.listed_for_trade
        })
    end
    return v_u_24("Folder", {}, v165)
end)
function v23.init(p169)
    local v170 = v_u_24(v_u_3.StoreProvider, {
        ["store"] = p169
    }, {
        ["app"] = v_u_24(v_u_168)
    })
    v_u_2.mount(v170, workspace, "HouseExteriors")
end
return v23