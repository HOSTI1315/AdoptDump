--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.FurnitureUseHelperLegacy (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.new.modules.Utf8Tools)
local v_u_3 = require(v1:WaitForChild("Fsys")).load
local v_u_4 = v_u_3("AnimationManager")
local v_u_5 = v_u_3("SharedConstants")
local v_u_6 = v_u_3("SettingsHelper")
local v_u_7 = v_u_3("EquippedPets")
local v_u_8 = v_u_3("PolicyHelper")
local v_u_9 = v_u_3("TweenPromise")
local v_u_10 = v_u_3("InventoryDB")
local v_u_11 = v_u_3("Utilities")
local v_u_12 = v_u_3("NPCHelper")
local v_u_13 = v_u_3("NPCDB")
local v_u_14 = v_u_3("package:Sift")
local v_u_15 = v_u_3("package:Promise")
local v_u_16 = game:GetService("Players")
local v_u_17 = game:GetService("RunService")
local v_u_18 = game:GetService("TweenService")
local v_u_19 = {}
local v_u_20 = Random.new()
v_u_19.FAN_ANIMATION = {
    ["post_render"] = function(_, p21)
        p21.AnimationController:LoadAnimation(v_u_4.get_track("FanSpin")):Play()
    end
}
v_u_19.RADIO = {
    ["plays_music"] = true,
    ["use_text"] = "Change Music",
    ["client_use"] = function()
        v_u_3("ClientStore").store:dispatch({
            ["type"] = "set_window_visibility",
            ["window_name"] = "radio",
            ["visible"] = true
        })
    end
}
v_u_19.FUSION_DEVICE = v_u_3("NeonFusionDevice")
function v_u_19.INTERIOR_DOOR(p22)
    local v_u_23 = p22 or {}
    local function v_u_28(p24, p25)
        if v_u_23.double_door then
            local v26 = p24:FindFirstChild("Doors")
            if v26 then
                for _, v27 in v26:GetChildren() do
                    p25(v27)
                end
            end
        else
            p25(p24)
            return
        end
    end
    function v_u_23.use_text(p29)
        local v30 = p29.door_position
        return v30 == "Closed" and "Open Door" or (v30 and "Close Door" or "Open Door")
    end
    v_u_23.use_permissions = "EVERYONE"
    v_u_23.interaction_tag = "InteriorDoor"
    v_u_23.usable_in_preview_housing = true
    function v_u_23.init(p31)
        if not p31.door_position then
            p31.door_position = "Closed"
        end
    end
    function v_u_23.client_get_data_for_server_use(p32, _, p33)
        local v34 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local v35 = p33.UseBlocks.UseBlock
        if v34 and v35 then
            local v36 = v34.Position
            local v37 = (v35.CFrame * CFrame.new(0, 0, 1)).Position
            local v38 = (v35.CFrame * CFrame.new(0, 0, -1)).Position
            return (p32.door_position or "Closed") == "Closed" and ((v36 - v37).Magnitude < (v36 - v38).Magnitude and "Outward" or "Inward") or "Closed"
        end
    end
    function v_u_23.server_use(_, p_u_39, p_u_40, p41)
        if p41 == "Closed" or (p41 == "Inward" or p41 == "Outward") then
            if p41 and p41 ~= p_u_39.door_position then
                p_u_39.last_position = p_u_39.door_position
                p_u_39.door_position = p41
                if v_u_23.seconds_until_automatic_close then
                    if p_u_39.automatic_close_promise then
                        p_u_39.automatic_close_promise:cancel()
                        p_u_39.automatic_close_promise = nil
                    end
                    if p41 == "Inward" or p41 == "Outward" then
                        p_u_39.automatic_close_promise = v_u_15.delay(v_u_23.seconds_until_automatic_close):andThen(function()
                            p_u_39.last_position = p_u_39.door_position
                            p_u_39.door_position = "Closed"
                            p_u_40()
                        end)
                    end
                end
            end
        end
    end
    function v_u_23.unrender(_, p42, _, p_u_43)
        v_u_28(p42, function(p44)
            if p44 and p44:FindFirstChild("WorkingParts") then
                if not p_u_43.previous_door_part_cframes then
                    p_u_43.previous_door_part_cframes = {}
                end
                p_u_43.previous_door_part_cframes[p44.Name] = p44.WorkingParts.DoorPart.CFrame
            end
        end)
    end
    function v_u_23.render(p45, p46, _, _, p47)
        local v48 = p47:get_house_owner()
        local v_u_49
        if p45.collidable == nil then
            v_u_49 = v48 == nil
        else
            v_u_49 = p45.collidable
        end
        v_u_28(p46, function(p50)
            if v_u_49 then
                for _, v51 in p50.DoorParts:GetDescendants() do
                    if v51:IsA("BasePart") then
                        v51.CanCollide = true
                    end
                end
            else
                for _, v52 in p50:GetDescendants() do
                    if v52:IsA("BasePart") then
                        v52.CanCollide = false
                    end
                end
            end
            p50.WorkingParts.DoorPart.Anchored = false
        end)
    end
    function v_u_23.post_render(p_u_53, p_u_54, _, p_u_55, p_u_56)
        if p_u_55 then
            p_u_55 = p_u_55.door_position ~= p_u_53.door_position
        end
        v_u_28(p_u_54, function(p_u_57)
            local v58 = p_u_53.last_position or "Closed"
            local v59 = p_u_53.door_position or "Closed"
            if v_u_23.double_door and p_u_57.Name == "Left" then
                v58 = v58 ~= "Closed" and (v58 == "Inward" and "Outward" or "Inward") or v58
                if v59 ~= "Closed" then
                    if v59 == "Inward" then
                        v59 = "Outward"
                    else
                        v59 = "Inward"
                    end
                end
            end
            local v60 = p_u_57:FindFirstChild("UseBlocks")
            if v60 then
                v60 = p_u_57.UseBlocks.UseBlock
            end
            local v61 = p_u_57.WorkingParts
            local v_u_62 = v61.DoorPart
            local v63 = p_u_57.DoorParts
            local v_u_64 = v61.AnimationController
            local v_u_65 = v_u_62.CFrame
            local v66 = p_u_56.previous_door_part_cframes
            if p_u_54:FindFirstChild("AnyoneCanOpenFromThisDirection") and p_u_54.AnyoneCanOpenFromThisDirection:FindFirstChild("SurfaceGui") then
                p_u_54.AnyoneCanOpenFromThisDirection.SurfaceGui:Destroy()
            end
            local v69 = v_u_14.List.filter(p_u_57.DoorParts:GetDescendants(), function(p67)
                local v68 = p67:IsA("BasePart")
                if v68 then
                    v68 = p67.CanCollide
                end
                return v68
            end)
            for _, v70 in ipairs(v69) do
                local v71
                if v59 == "Closed" then
                    v71 = p_u_53.collidable ~= false
                else
                    v71 = false
                end
                v70.CanCollide = v71
            end
            local v_u_72 = v_u_62:Clone()
            v_u_72.Name = "IntermediaryDoorPart"
            v_u_72.Parent = p_u_57
            if v60 then
                assert(v60 and v_u_72, "Missing part")
                v60.Anchored = false
                local v73 = Instance.new("WeldConstraint")
                v73.Part0 = v60
                v73.Part1 = v_u_72
                v73.Parent = v60
            end
            for _, v74 in pairs(v63:GetDescendants()) do
                if v74:IsA("BasePart") then
                    assert(v74 and v_u_72, "Missing part")
                    v74.Anchored = false
                    local v75 = Instance.new("WeldConstraint")
                    v75.Part0 = v74
                    v75.Part1 = v_u_72
                    v75.Parent = v74
                end
            end
            local v78 = (function()
                local v76 = {}
                for _, v77 in pairs({
                    "DoorOpenOutward",
                    "DoorOpenInward",
                    "DoorCloseOutward",
                    "DoorCloseInward",
                    "DoorIdleOutward",
                    "DoorIdleInward"
                }) do
                    v76[v77] = v_u_64:LoadAnimation(v_u_4.get_track(v77))
                end
                return v76
            end)()
            if v59 == "Closed" then
                if p_u_55 then
                    (v58 ~= v59 and v78["DoorClose" .. v58] or v78.DoorCloseOutward):Play(0)
                end
            else
                local v79 = v59 == "Inward" and v78.DoorOpenInward or v78.DoorOpenOutward
                local v80 = v59 == "Inward" and v78.DoorIdleInward or v78.DoorIdleOutward
                v80.Looped = true
                v80.Priority = Enum.AnimationPriority.Idle
                v79.Priority = Enum.AnimationPriority.Action
                if p_u_55 then
                    v79:Play(0)
                end
                v80:Play(0)
            end
            if v66 and v66[p_u_57.Name] then
                v_u_72.Anchored = true
                v_u_72.CFrame = v66[p_u_57.Name]
                task.spawn(function()
                    local v81 = os.clock()
                    while os.clock() - v81 < 0.5 do
                        if not (p_u_57.Parent and p_u_57:IsDescendantOf(workspace)) then
                            return
                        end
                        if v_u_62.CFrame ~= v_u_65 then
                            break
                        end
                        v_u_17.RenderStepped:Wait()
                    end
                    v_u_72.Anchored = false
                    v_u_72.CFrame = v_u_62.CFrame
                    local v82 = v_u_72
                    local v83 = v_u_62
                    assert(v82 and v83, "Missing part")
                    v82.Anchored = false
                    local v84 = Instance.new("WeldConstraint")
                    v84.Part0 = v82
                    v84.Part1 = v83
                    v84.Parent = v82
                end)
            else
                assert(v_u_72 and v_u_62, "Missing part")
                v_u_72.Anchored = false
                local v85 = Instance.new("WeldConstraint")
                v85.Part0 = v_u_72
                v85.Part1 = v_u_62
                v85.Parent = v_u_72
            end
        end)
    end
    return v_u_23
end
function v_u_19.CAULDRON(_)
    return {
        ["use_text"] = function(p86)
            local v87 = p86.temp_state or "idle"
            if v87 == "brewed" then
                return "Take Potion"
            end
            if v87 == "idle" then
                return "Brew Potion"
            end
        end,
        ["server_use"] = function(p_u_88, p_u_89, p_u_90)
            p_u_89.temp_state = p_u_89.temp_state or "idle"
            local v91 = v_u_3("DataM")
            local v_u_92 = v_u_3("ServerRouter")
            local v_u_93 = v_u_3("InventoryDB")
            local v_u_94 = {
                ["bigheadcauldron"] = "big_head_potion",
                ["antigravcauldron"] = "nograv_potion",
                ["speedcauldron"] = "hyperspeed_potion"
            }
            local function v100(p95)
                local v96 = p95 / 60
                local v97 = math.floor(v96)
                local v98 = (p95 + 60) % 60
                local v99 = math.floor(v98)
                if v97 == 0 then
                    if v99 == 1 then
                        return string.format("%d second", v99)
                    else
                        return string.format("%d seconds", v99)
                    end
                elseif v97 == 1 then
                    if v99 == 0 then
                        return string.format("%d minute", v97)
                    elseif v99 == 1 then
                        return string.format("%d minute and %d second", v97, v99)
                    else
                        return string.format("%d minute and %d seconds", v97, v99)
                    end
                elseif v99 == 0 then
                    return string.format("%d minutes", v97)
                elseif v99 == 1 then
                    return string.format("%d minutes and %d second", v97, v99)
                else
                    return string.format("%d minutes and %d seconds", v97, v99)
                end
            end
            local v101 = v_u_5.cauldron_brew_times[p_u_89.id]
            if p_u_89.temp_state == "idle" then
                p_u_89.temp_state = "brewing"
                local v102 = {
                    ["text"] = string.format("Brewing the %s will take %s...", v_u_93.food[v_u_94[p_u_89.id]].name, v100(v101)),
                    ["length"] = 5
                }
                v_u_92.get("MsgAPI/HintSent"):FireClient(p_u_88, v102)
                delay(v101, function()
                    p_u_89.temp_state = "brewed"
                    v_u_92.get("MsgAPI/HintSent"):FireClient(p_u_88, {
                        ["text"] = string.format("Your %s has finished brewing!", v_u_93.food[v_u_94[p_u_89.id]].name),
                        ["length"] = 5
                    })
                    p_u_90()
                end)
                return
            elseif p_u_89.temp_state == "brewing" then
                v_u_92.get("MsgAPI/HintSent"):FireClient(p_u_88, {
                    ["text"] = "This potion is still brewing...",
                    ["length"] = 5
                })
            elseif p_u_89.temp_state == "brewed" then
                p_u_89.temp_state = "idle"
                local v103 = p_u_89.id
                if v103 == "bigheadcauldron" then
                    local v104 = v91.get_store(p_u_88)
                    local v105 = v104:get("inventory")
                    v104:get("equip_manager"):equip((v105:add_item(v_u_93.food.big_head_potion)))
                    return
                end
                if v103 == "antigravcauldron" then
                    local v106 = v91.get_store(p_u_88)
                    local v107 = v106:get("inventory")
                    v106:get("equip_manager"):equip((v107:add_item(v_u_93.food.nograv_potion)))
                    return
                end
                if v103 == "speedcauldron" then
                    local v108 = v91.get_store(p_u_88)
                    local v109 = v108:get("inventory")
                    v108:get("equip_manager"):equip((v109:add_item(v_u_93.food.hyperspeed_potion)))
                end
            end
        end,
        ["render"] = function(p110, p_u_111)
            local v_u_112 = p110.temp_state
            local function v121(p113, p114)
                local v115 = p113.r + (255 - p113.r) * p114
                local v116 = math.clamp(v115, 0, 255)
                local v117 = p113.g + (255 - p113.g) * p114
                local v118 = math.clamp(v117, 0, 255)
                local v119 = p113.b + (255 - p113.b) * p114
                local v120 = math.clamp(v119, 0, 255)
                return Color3.fromRGB(v116, v118, v120)
            end
            local v122 = p_u_111.ParticlePart.Bubbles
            local v123 = p_u_111.Msg.BillboardGui
            local v_u_124 = p_u_111.Main
            v122.Enabled = v_u_112 == "brewed"
            if v_u_112 == "brewing" then
                local v_u_125 = v_u_124.Color
                local v_u_126 = v121(v_u_125, 0.8)
                spawn(function()
                    while p_u_111.Parent and v_u_112 == "brewing" do
                        local v127 = {
                            ["Color"] = v_u_126
                        }
                        v_u_18:Create(v_u_124, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 1, true), v127):Play()
                        wait(2)
                        v_u_124.Color = v_u_125
                    end
                    if p_u_111.Parent then
                        local v128 = {
                            ["Color"] = v_u_125
                        }
                        v_u_18:Create(v_u_124, TweenInfo.new(1), v128):Play()
                    end
                end)
                v123.Enabled = true
            end
        end
    }
end
function v_u_19.CHECK_FURNITURE_STATE_FOR_ROLEPLAY_REQUIREMENTS(p129, _, _)
    if p129.building_id ~= nil or p129.role_id ~= nil then
        return {
            ["building_id"] = p129.building_id,
            ["role_id"] = p129.role_id,
            ["navigation_preferred_role_id"] = p129.navigation_preferred_role_id
        }
    end
end
function v_u_19.TOGGLEABLE(p_u_130)
    return {
        ["use_text"] = function(p131)
            return p131.on and "Turn Off" or "Turn On"
        end,
        ["use_permissions"] = "FAMILY",
        ["init"] = function(p132)
            if p132.on == nil then
                p132.on = true
            end
        end,
        ["server_use"] = function(_, p133)
            p133.on = not p133.on
        end,
        ["post_render"] = function(p134, p135)
            local v136 = p134.on
            if p_u_130 == "discoball" then
                if v136 then
                    p135.AnimationController:LoadAnimation(v_u_4.get_track("DiscoballSpin")):Play()
                    return
                end
                for _, v137 in pairs(p135:GetChildren()) do
                    if v137.Name == "EnhancedCone" then
                        v137.Transparency = 1
                    end
                end
            end
        end,
        ["roleplay_role_requirements"] = v_u_19.CHECK_FURNITURE_STATE_FOR_ROLEPLAY_REQUIREMENTS
    }
end
function v_u_19.TOGGLEABLE_EFFECTS(p138)
    local v139 = v_u_19.TOGGLEABLE(p138)
    function v139.render(p140, p141)
        local v142 = p140.on
        for _, v143 in pairs(p141:GetDescendants()) do
            if v143:IsA("ParticleEmitter") or v143:IsA("Beam") then
                v143.Enabled = v142 == true
            elseif v143:IsA("Sound") then
                if v142 then
                    v143:Play()
                else
                    v143:Stop()
                end
            end
        end
    end
    return v139
end
function v_u_19.LIGHT(p144)
    local v145 = v_u_19.TOGGLEABLE(p144)
    function v145.render(p146, p147)
        local v148 = p146.on
        for _, v149 in pairs(p147:GetChildren()) do
            if v149.Name == "LightPart" or v149:GetAttribute("LightPart") == true then
                local v150 = v149:FindFirstChildWhichIsA("Light", true)
                if v150 then
                    v150.Enabled = v148 == true
                end
                if v148 then
                    v149.Material = "Neon"
                    v149.Reflectance = 0
                else
                    v149.Color = Color3.fromRGB(27, 42, 53)
                    v149.Material = "SmoothPlastic"
                    v149.Reflectance = 0.15
                end
            end
        end
    end
    return v145
end
function v_u_19.LIGHT_WITH_PARTICLES(p151)
    local v152 = v_u_19.LIGHT(p151)
    local v_u_153 = v152.render
    function v152.render(p154, p155)
        v_u_153(p154, p155)
        for _, v156 in pairs(p155:GetDescendants()) do
            if v156:IsA("ParticleEmitter") then
                v156.Enabled = p154.on
            end
        end
    end
    return v152
end
local v_u_166 = {
    ["on"] = {
        ["BasePart"] = function(p157, p158)
            p157.Color = p158
        end,
        ["ParticleEmitter"] = function(p159, p160)
            p159.Color = ColorSequence.new(p160)
        end,
        ["Light"] = function(p161, p162)
            p161.Color = p162
        end
    },
    ["off"] = {
        ["BasePart"] = function(p163)
            p163.Color = Color3.fromRGB(27, 42, 53)
            p163.Material = "SmoothPlastic"
            p163.Reflectance = 0.15
        end,
        ["ParticleEmitter"] = function(p164)
            p164.Transparency = NumberSequence.new(1)
        end,
        ["Light"] = function(p165)
            p165.Brightness = 0
        end
    }
}
function v_u_19.COLORABLE_LIGHT(p167, p168)
    local v_u_169 = p168 or {}
    local v170 = v_u_19.TOGGLEABLE(p167)
    function v170.render(p171, p172)
        local v173 = p171.on == true
        local v174 = p171.colors and p171.colors[1] or v_u_169.default_color
        local v175 = v173 and v_u_166.on or v_u_166.off
        for _, v176 in ipairs(p172:GetDescendants()) do
            if v176.Name == "Colorable" then
                for v177, v178 in pairs(v175) do
                    if v176:IsA(v177) then
                        v178(v176, v174)
                        break
                    end
                end
            end
        end
    end
    v170.available_colors = v_u_169.available_colors
    return v170
end
function v_u_19.SCREEN(p179, p180)
    local v_u_181 = p180 or {}
    local v182 = v_u_19.TOGGLEABLE(p179)
    function v182.render(p183, p184)
        local v185 = p183.on
        local v186 = {}
        if p184:FindFirstChild("Screen") then
            local v187 = p184.Screen
            table.insert(v186, v187)
        end
        if p184:FindFirstChild("Screens") then
            for _, v188 in p184.Screens:GetChildren() do
                if v188:IsA("BasePart") then
                    table.insert(v186, v188)
                end
            end
        end
        if v185 then
            for _, v189 in v186 do
                v189.Color = v_u_181.on_color or Color3.fromRGB(85, 161, 202)
            end
        else
            for _, v190 in v186 do
                local v191 = v190:FindFirstChildWhichIsA("Light")
                if v191 then
                    v191.Enabled = false
                end
            end
        end
    end
    return v182
end
function v_u_19.FOGMACHINE(p192)
    local v193 = v_u_19.TOGGLEABLE(p192)
    function v193.render(p194, p195)
        local v196 = p194.on
        if p195:FindFirstChild("FogPart") then
            local v197 = p195.FogPart:FindFirstChild("Smoke")
            v197.Color = ColorSequence.new(p194.colors and p194.colors[1] or Color3.fromRGB(255, 247, 0))
            v197.Enabled = v196 == true
        end
    end
    return v193
end
function v_u_19.FIREPLACE(p198)
    local v199 = v_u_19.TOGGLEABLE(p198)
    function v199.render(p200, p201)
        local v202 = p200.on
        if p201:FindFirstChild("FirePart") then
            for _, v203 in pairs(p201.FirePart:GetChildren()) do
                v203.Enabled = v202 == true
            end
            if p201.FirePart.Material == Enum.Material.Neon and not v202 then
                p201.FirePart.Transparency = 1
            end
        end
    end
    return v199
end
function v_u_19.TV_SCREEN(p204)
    local v205 = v_u_19.TOGGLEABLE(p204)
    function v205.render(p206, p_u_207)
        local v208 = p206.on
        local v209 = {}
        if p_u_207:FindFirstChild("Screen") then
            local v210 = p_u_207.Screen
            table.insert(v209, v210)
        end
        if p_u_207:FindFirstChild("Screens") then
            for _, v211 in p_u_207.Screens:GetChildren() do
                if v211:IsA("BasePart") then
                    table.insert(v209, v211)
                end
            end
        end
        if v208 then
            for _, v_u_212 in v209 do
                spawn(function()
                    v_u_212.Material = Enum.Material.Neon
                    v_u_212.Reflectance = 0
                    v_u_212.Transparency = 0
                    v_u_212.Color = Color3.fromHSV(v_u_20:NextNumber(), v_u_20:NextNumber(), 0.8823529411764706)
                    repeat
                        local v213 = v_u_18:Create(v_u_212, TweenInfo.new(v_u_20:NextInteger(10, 15), Enum.EasingStyle.Linear), {
                            ["Color"] = Color3.fromHSV(v_u_20:NextNumber(), v_u_20:NextNumber(), 0.8823529411764706)
                        })
                        v213:Play()
                        v213.Completed:Wait()
                    until p_u_207 == nil or p_u_207.Parent == nil
                end)
            end
        else
            for _, v214 in v209 do
                local v215 = v214:FindFirstChildWhichIsA("Light")
                if v215 then
                    v215.Enabled = false
                end
            end
        end
    end
    return v205
end
function v_u_19.DRAWING_BOARD(p216, p217)
    local v_u_218 = p216 or ""
    local v_u_219 = p217 or 80
    return {
        ["use_text"] = "Change Text",
        ["init"] = function(p_u_220, p_u_221, p222)
            p222.player_removing = v_u_16.PlayerRemoving:Connect(function(p223)
                if p223.Name == p_u_220.author_name then
                    p_u_220.text = nil
                    p_u_220.author_name = nil
                    p_u_221()
                end
            end)
        end,
        ["server_furniture_deactivated"] = function(p224)
            p224.player_removing:Disconnect()
        end,
        ["client_get_data_for_server_use"] = function(p225, _, _)
            local v226 = v_u_3("UIManager")
            local v227 = {
                ["left"] = "Cancel",
                ["right"] = "Save",
                ["existing_text"] = p225.text,
                ["max_length"] = v_u_219,
                ["use_utf8_length"] = true
            }
            local v228, v229 = v226.apps.DialogApp:paragraph_dialog(v227)
            if v228 == "Save" then
                return v229
            end
        end,
        ["server_use"] = function(p230, p231, _, p232, p233)
            if typeof(p232) == "string" then
                local v234 = {
                    ["limit_graphemes"] = v_u_219
                }
                local v235, v236 = v_u_2.sanitize_and_check_length(p232, v234)
                if v235 then
                    p231.text = game:GetService("TextService"):FilterStringAsync(v236, p230.UserId):GetNonChatStringForBroadcastAsync()
                    if p230 ~= p233 then
                        p231.author_name = p230.Name
                    end
                end
            else
                return
            end
        end,
        ["render"] = function(p237, p238)
            local v239 = p237.text or v_u_218
            local v240 = p237.author_name
            local v241 = p238.Board.SurfaceGui.TextLabel
            p238.Board.SurfaceGui.AutoLocalize = false
            v241.Text = v239
            if v240 then
                v241.Size = v241.Size - UDim2.fromOffset(0, 32)
                local v242 = Instance.new("Frame")
                v242.BackgroundTransparency = 1
                v242.Size = UDim2.fromScale(1, 1)
                v242.ZIndex = 256
                v242.Parent = p238.Board.SurfaceGui
                local v243 = Instance.new("UIListLayout")
                v243.HorizontalAlignment = Enum.HorizontalAlignment.Right
                v243.VerticalAlignment = Enum.VerticalAlignment.Bottom
                v243.FillDirection = Enum.FillDirection.Horizontal
                v243.SortOrder = Enum.SortOrder.LayoutOrder
                v243.Padding = UDim.new(0, 4)
                v243.Parent = v242
                local v244 = Instance.new("TextButton")
                v244.BackgroundColor3 = Color3.new(1, 0, 0)
                v244.TextColor3 = Color3.new(1, 1, 1)
                v244.Size = UDim2.fromOffset(96, 32)
                v244.LayoutOrder = 1
                v244.Font = Enum.Font.GothamBold
                v244.Text = "Report"
                v244.TextSize = 20
                v244.Activated:Connect(function()
                    v_u_3("UIManager").apps.DialogApp:dialog({
                        ["text"] = "Report bad content on this board using the Roblox menu!",
                        ["button"] = "Okay"
                    })
                end)
                v244.Parent = v242
                local v245 = Instance.new("UICorner")
                v245.CornerRadius = UDim.new(0, 4)
                v245.Parent = v244
                local v246 = Instance.new("TextLabel")
                for _, v247 in { "TextColor3", "TextStrokeColor3", "TextStrokeTransparency" } do
                    v246[v247] = v241[v247]
                end
                v246.BackgroundTransparency = 1
                v246.AutoLocalize = false
                v246.Text = string.format("@%s", v240)
                v246.Font = Enum.Font.Gotham
                v246.TextSize = 20
                v246.Size = UDim2.fromOffset(256, 32)
                v246.LayoutOrder = 0
                v246.TextXAlignment = Enum.TextXAlignment.Right
                v246.Parent = v242
            end
        end
    }
end
function v_u_19.TELEPORTER(p_u_248, p_u_249)
    return {
        ["use_text"] = "Tele to Sky Castle",
        ["use_permissions"] = "EVERYONE",
        ["client_use"] = function()
            local v250 = v_u_3("UIManager")
            local v251 = v_u_3("InteriorsM")
            v250.apps.TransitionsApp:transition({
                ["length"] = 0.5,
                ["start_transparency"] = 1,
                ["end_transparency"] = 0,
                ["color"] = Color3.new(1, 1, 1)
            })
            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
                wait(0.1)
            end
            v251.enter(p_u_248, p_u_249, {
                ["studs_ahead_of_door"] = 6
            })
            v250.apps.TransitionsApp:transition({
                ["length"] = 0.5,
                ["start_transparency"] = 0,
                ["end_transparency"] = 1,
                ["color"] = Color3.new(1, 1, 1)
            })
        end
    }
end
function v_u_19.EXAMINABLE(p_u_252)
    return {
        ["use_text"] = "Examine",
        ["use_permissions"] = "EVERYONE",
        ["client_use"] = function()
            local v253 = {
                ["text"] = p_u_252,
                ["overridable"] = true,
                ["yields"] = false
            }
            v_u_3("UIManager").apps.HintApp:hint(v253)
        end
    }
end
local v_u_254 = false
local v_u_255 = nil
local v_u_256 = nil
v_u_19.MAGICALSHARD = {
    ["use_text"] = function()
        return v_u_254 and "Deactivate" or "Activate"
    end,
    ["use_permissions"] = "EVERYONE",
    ["client_use"] = function()
        v_u_256 = v_u_256 or v_u_3("TimerAction").new()
        local v_u_257 = v_u_3("UIManager")
        if v_u_254 then
            v_u_254 = false
            workspace.Gravity = v_u_255
            spawn(function()
                v_u_257.apps.HintApp:hint({
                    ["overridable"] = true,
                    ["text"] = "The Shard\'s effects wore off",
                    ["length"] = 5
                })
            end)
        else
            v_u_254 = true
            v_u_255 = workspace.Gravity
            workspace.Gravity = 90
            spawn(function()
                v_u_257.apps.HintApp:hint({
                    ["overridable"] = true,
                    ["text"] = "The Shard\'s magical powers make you light as a feather!",
                    ["length"] = 7
                })
            end)
            v_u_256:restart(120, function()
                v_u_254 = false
                workspace.Gravity = v_u_255
                spawn(function()
                    v_u_257.apps.HintApp:hint({
                        ["overridable"] = true,
                        ["text"] = "The Shard\'s effects wore off",
                        ["length"] = 5
                    })
                end)
            end)
        end
    end
}
v_u_19.TENT = {
    ["use_text"] = function(p258)
        return p258.open and "Close tent" or "Open tent"
    end,
    ["use_permissions"] = "EVERYONE",
    ["init"] = function(p259)
        if p259.open == nil then
            p259.open = true
        end
    end,
    ["server_use"] = function(_, p260, _)
        p260.open = not p260.open
    end,
    ["render"] = function(p261, p262)
        for _, v263 in pairs(p262.TentOpenParts:GetChildren()) do
            v263.Transparency = p261.open and 1 or 0
        end
    end
}
v_u_19.DANCE_FLOOR = {
    ["render"] = function(_, p_u_264)
        spawn(function()
            while true do
                for _, v265 in pairs(p_u_264.ChangingColors:GetChildren()) do
                    v265.Color = Color3.fromHSV(math.random(0, 359) / 360, 0.5686274509803921, 0.6666666666666666)
                end
                wait(1)
                if p_u_264 == nil or p_u_264.Parent == nil then
                    return
                end
            end
        end)
    end
}
function v_u_19.TRADE_HISTORY_NPC(p266, p267)
    local v_u_268 = v_u_13[p266]
    local v269, v_u_270 = v_u_12.NPC(v_u_268, p267)
    function v269.client_use()
        if v_u_3("TradeLicenseHelper").player_has_trade_license() then
            v_u_268 = v_u_13.agent_lily_has_license
        end
        v_u_270.play_focused_dialog(v_u_268.dialogs[1])
    end
    return v269
end
function v_u_19.LICENSE_TEST_INFORMATION_NPC(p271, p272)
    local v_u_273 = v_u_13[p271]
    local v274, v_u_275 = v_u_12.NPC(v_u_273, p272)
    function v274.client_use()
        v_u_3("RouterClient").get("SettingsAPI/SetBooleanFlag"):FireServer("has_talked_to_trade_quest_npc", true)
        if v_u_3("TradeLicenseHelper").player_has_trade_license() then
            v_u_273 = v_u_13.agent_jake_has_license
        end
        v_u_275.play_focused_dialog(v_u_273.dialogs[1])
    end
    return v274
end
function v_u_19.BEGIN_LICENSE_TEST_NPC(p276, p277)
    local v_u_278 = v_u_13[p276]
    local v279, v_u_280 = v_u_12.NPC(v_u_278, p277)
    local v_u_281 = v279.render
    function v279.client_use()
        local v282 = v_u_3("UIManager")
        local v283 = v_u_3("RouterClient")
        v_u_280.play_focused_dialog(v_u_278.dialogs[1])
        if v282.apps.DialogApp:dialog({
            ["text"] = "Begin the Trade License test?",
            ["left"] = "No",
            ["right"] = "Yes"
        }) == "Yes" then
            v283.get("TradeAPI/BeginQuiz"):FireServer()
        end
    end
    function v279.render(p284, p285)
        v_u_3("TradeLicenseClient").set_trade_license_agent_model(p285)
        v_u_281(p284, p285)
    end
    return v279
end
function v_u_19.GAMEPASS_PET(p_u_286, p_u_287)
    local v288 = v_u_12.NPC_SIMPLE(p_u_286, p_u_287)
    v288.use_text = "Unlock"
    function v288.client_use()
        local v289 = v_u_3("UIManager")
        if p_u_286 == "royal_palace_2022_spaniel" and not v_u_3("ClientDeveloperProductHelper").should_hide("tutorial_2025_royal_palace_spaniel") then
            v289.apps.DialogApp:dialog({
                ["product_id"] = "tutorial_2025_royal_palace_spaniel",
                ["dialog_type"] = "RobuxProductDialog"
            })
        else
            v289.apps.DialogApp:dialog({
                ["product_id"] = p_u_287.gamepass_id or p_u_286,
                ["dialog_type"] = "RobuxProductDialog"
            })
        end
    end
    return v288
end
function v_u_19.IDLE_PET(p290, p291)
    local v292 = v_u_12.NPC_SIMPLE(p290, p291)
    v292.use_text = nil
    v292.client_use = nil
    return v292
end
function v_u_19.CURRENCY_PET(p_u_293, p294)
    local v_u_295 = v_u_10.pets[p_u_293]
    if v_u_295.cost ~= nil then
        local v296 = v_u_12.NPC_SIMPLE(p_u_293, p294)
        function v296.use_text()
            return v_u_3("ShopM").get_interaction_text(v_u_295)
        end
        function v296.client_use()
            local v297 = {
                ["category"] = "pets",
                ["id"] = p_u_293
            }
            v_u_3("ShopM").buy_item(p_u_293, v297)
        end
        return v296
    end
end
function v_u_19.DOCTOR(p298)
    local v299 = v_u_13[p298]
    local v300, v_u_301 = v_u_12.NPC(v299)
    v300.dont_automatically_mark_furniture_change_after_use = true
    function v300.client_use() end
    function v300.client_get_data_for_server_use(_, _, _)
        local v_u_302 = v_u_3("UIManager")
        local v_u_303 = false
        v_u_301.take_focus({}, function(p304)
            local v305 = {
                ["dialog"] = {
                    {
                        ["text"] = ("It\'s nice to see you again, %s!"):format(game.Players.LocalPlayer.Name),
                        ["length"] = 2
                    }
                }
            }
            p304:play_speech(v305):expect()
            v_u_303 = v_u_302.apps.DialogApp:dialog({
                ["text"] = "Ask Doctor Heart to heal your family?",
                ["left"] = "No",
                ["right"] = "Yes"
            })
            local v306 = {
                ["dialog"] = {
                    {
                        ["text"] = "Come back if you ever feel sick!",
                        ["length"] = 1.5
                    }
                }
            }
            p304:play_speech(v306):expect()
        end)
        local v307
        if v_u_303 == "Yes" then
            v307 = v_u_303
        else
            v307 = nil
        end
        return v307
    end
    function v300.server_use(_, _, _, _, _, p308)
        local v_u_309 = v_u_3("new:AilmentsServer")
        local v_u_310 = v_u_3("CharacterWrapper")
        local v311 = v_u_3("ServerRouter")
        local v312 = v_u_3("new:StreamingHelper")
        local v313 = p308 and p308:FindFirstChild("HumanoidRootPart")
        if v313 then
            v313 = p308.HumanoidRootPart.Position
        end
        if v313 then
            local v314 = {}
            for _, v315 in game.Players:GetPlayers() do
                local v316 = v315.Character and v315.Character:FindFirstChild("HumanoidRootPart")
                if v316 then
                    v316 = v315.Character.HumanoidRootPart.Position
                end
                if v316 and (v316 - v313).magnitude < 25 then
                    table.insert(v314, v315)
                end
            end
            local v_u_317 = {}
            for _, v318 in v_u_310.get_all_char_wrappers() do
                local v319 = v318.char
                if v319 then
                    v319 = v318.char:FindFirstChild("HumanoidRootPart")
                end
                if v319 and (v319.Position - v313).magnitude < 25 then
                    local v320 = v318.char
                    table.insert(v_u_317, v320)
                end
            end
            for _, v321 in v314 do
                v311.get("AilmentsAPI/ShowHealingEffect"):FireClient(v321, v312.as_id_table(v_u_317))
            end
            task.delay(3, function()
                for _, v322 in v_u_317 do
                    local v323 = v_u_310.get(v322)
                    if v323 then
                        v_u_309.add_progress(v323, "sick", 1)
                    end
                end
            end)
        end
    end
    return v300
end
function v_u_19.PET_TRAINER(p324)
    local v325 = v_u_13[p324]
    local v326, v_u_327 = v_u_12.NPC(v325)
    function v326.client_use(_, _, p_u_328)
        local v_u_329 = v_u_3("UIManager")
        v_u_3("RouterClient")
        local v_u_330 = v_u_3("ClientData")
        local v_u_331 = v_u_3("PetTrickParser")
        local v_u_332 = v_u_3("PetEntityHelper")
        local v333 = v_u_3("PetEntityManager")
        local v_u_334 = v_u_3("StateManagerClient")
        local v_u_335 = v_u_3("PetReactionName")
        local v_u_336 = v_u_7.choose_wrapper()
        local v_u_337
        if v_u_336 then
            v_u_337 = v_u_336.pet_id
        else
            v_u_337 = v_u_336
        end
        if v_u_337 then
            v_u_337 = v_u_10.pets[v_u_337]
        end
        local v_u_338
        if v_u_336 then
            v_u_338 = v333.get_pet_entity(v_u_336.char) or nil
        else
            v_u_338 = nil
        end
        if v_u_338 or #v_u_7.get_my_equipped() <= 0 then
            local v_u_339 = p_u_328.NPC.Head
            v_u_327.take_focus({}, function(p340)
                if v_u_337 then
                    if v_u_337.is_doll then
                        p340:play_speech({
                            ["dialog"] = {
                                {
                                    ["text"] = "G\'day mate, want me to train your creature...",
                                    ["length"] = 3.5
                                },
                                {
                                    ["text"] = "Oh wait that\'s a doll. Nevermind, comeback when you have a pet with ya.",
                                    ["length"] = 4.5
                                }
                            }
                        }):expect()
                        return
                    elseif v_u_337.is_egg then
                        p340:play_speech({
                            ["dialog"] = {
                                {
                                    ["text"] = "G\'day mate, come back when your egg has hatched!",
                                    ["length"] = 4
                                }
                            }
                        }):expect()
                    else
                        local v341 = false
                        local v342 = {}
                        local v343 = {
                            {
                                ["text"] = ("G\'day mate, want me to train your %s?"):format(v_u_337.name),
                                ["length"] = 2.5
                            }
                        }
                        if v_u_336.pet_trick_level >= #v_u_337.tricks then
                            local v344 = {
                                ["text"] = ("Looks like your %s already knows every trick in the book!"):format(v_u_337.name),
                                ["length"] = 3.5
                            }
                            table.insert(v343, v344)
                        else
                            v342 = v_u_331.get_learnable_tricks(v_u_337.tricks, v_u_336.pet_trick_level, v_u_336.pet_progression.age, v_u_336.neon)
                            if #v342 == 0 then
                                local v345 = {
                                    ["text"] = ("Well mate, I wanna train your %s..."):format(v_u_337.name),
                                    ["length"] = 2.5
                                }
                                table.insert(v343, v345)
                                table.insert(v343, {
                                    ["text"] = "But it\'s just too young to learn any more.",
                                    ["length"] = 2.5
                                })
                                table.insert(v343, {
                                    ["text"] = "Come back again when it ain\'t so little.",
                                    ["length"] = 2.5
                                })
                            else
                                v341 = true
                            end
                        end
                        p340:play_speech({
                            ["dialog"] = v343
                        }):expect()
                        if v341 and v_u_329.apps.DialogApp:dialog({
                            ["text"] = "Ask Pet Trainer to teach your pet new tricks?",
                            ["left"] = "No",
                            ["right"] = "Yes"
                        }) == "Yes" then
                            v_u_334.exit_seat_states()
                            v_u_332.stage_reaction(v_u_338, {
                                ["name"] = v_u_335.LearnTricksReaction,
                                ["options"] = {
                                    ["head"] = v_u_339,
                                    ["learnable_tricks"] = v342,
                                    ["furniture_model"] = p_u_328,
                                    ["speech_bubble_options_func"] = function(p346)
                                        return {
                                            ["always_on_top"] = true,
                                            ["skippable_time"] = p346,
                                            ["TextColor3"] = Color3.fromRGB(59, 0, 255)
                                        }
                                    end
                                }
                            })
                        end
                    end
                elseif #v_u_334.get_chars_connected_to_me(v_u_330.get("state_manager")) == 0 then
                    p340:play_speech({
                        ["dialog"] = {
                            {
                                ["text"] = "I\'ll train even the most stubborn pets to do incredible tricks!",
                                ["length"] = 3.5
                            },
                            {
                                ["text"] = "So bring your pets next time!",
                                ["length"] = 2.5
                            }
                        }
                    }):expect()
                else
                    p340:play_speech({
                        ["dialog"] = {
                            {
                                ["text"] = "G\'day mate, want me to train your creature...",
                                ["length"] = 3.5
                            },
                            {
                                ["text"] = "Oh wait that\'s a child. Nevermind, comeback when you have a pet with ya.",
                                ["length"] = 4.5
                            }
                        }
                    }):expect()
                end
            end)
        end
    end
    return v326
end
function v_u_19.PET_PATH_ANIM(p347)
    return {
        ["use_text"] = p347,
        ["render"] = function(_, p348, _)
            local v349 = v_u_3("CollisionsClient")
            for _, v350 in ipairs({ "Path", "SuccessPath", "FailPath" }) do
                local v351 = p348:FindFirstChild(v350)
                if v351 then
                    for _, v352 in ipairs(v351:GetChildren()) do
                        if v352:IsA("BasePart") then
                            v352.Transparency = 1
                            v352.CanCollide = false
                        end
                    end
                end
            end
            local v353 = p348:FindFirstChild("CollidesWithDefaultGroupOnly")
            if v353 then
                v349.set_model_collision_group(v353, "noncollide")
            end
        end,
        ["client_use"] = function(p_u_354, _, p355)
            if p_u_354.in_use then
                return
            else
                local v_u_356 = v_u_3("package:Promise")
                local v_u_357 = v_u_3("PetEntityManager")
                local v_u_358 = v_u_3("PetEntityHelper")
                local v359 = v_u_3("UIManager")
                local v_u_360 = v_u_3("CollisionsClient")
                local v_u_361 = v_u_3("RouterClient")
                local v_u_362 = v_u_3("PetPerformanceName")
                local v363 = v_u_3("PetReactionName")
                local v_u_364 = v_u_7.choose_wrapper()
                local v_u_365
                if v_u_364 then
                    v_u_365 = v_u_364.char
                else
                    v_u_365 = v_u_364
                end
                if v_u_365 then
                    if v_u_361.get("PetAPI/StartPathAnim"):InvokeServer(true, v_u_364.pet_unique) then
                        local v366 = p355:FindFirstChild("SuccessPath") or p355:FindFirstChild("Path")
                        if v366 then
                            v_u_360.set_model_collision_group(v_u_365, "noncollide")
                            local v367 = p355:FindFirstChild("FailPath")
                            if v367 then
                                local v368 = v_u_20:NextNumber()
                                local v369 = v_u_364.pet_progression.age + 2
                                if v368 >= 1 / math.clamp(v369, 3, 10) then
                                    v367 = v366
                                end
                            else
                                v367 = v366
                            end
                            local v370 = v367:GetChildren()
                            table.sort(v370, function(p371, p372)
                                local v373 = p371.Name
                                local v374 = tonumber(v373) or -1
                                local v375 = p372.Name
                                return v374 < (tonumber(v375) or -1)
                            end)
                            local v376 = {}
                            for v377, v378 in ipairs(v370) do
                                local v379 = v378:FindFirstChild("Action")
                                local v380 = v378:FindFirstChild("Wait")
                                local v381 = v378:FindFirstChild("JumpHeight")
                                local v382 = {
                                    ["position"] = v378.Position
                                }
                                if v379 then
                                    v379 = v379.Value
                                end
                                v382.action = v379
                                if v380 then
                                    v380 = v380.Value
                                end
                                v382.wait_time = v380
                                if v381 then
                                    v381 = v381.Value
                                end
                                v382.jump_height = v381
                                v376[v377] = v382
                            end
                            local v383 = p355:FindFirstChild("CollisionsDisableOnUse")
                            local v_u_384 = v383 and v383:GetChildren() or {}
                            for _, v385 in ipairs(v_u_384) do
                                v385.CanCollide = false
                            end
                            p_u_354.in_use = true
                            local function v_u_387()
                                if p_u_354.in_use then
                                    p_u_354.in_use = false
                                    for _, v386 in ipairs(v_u_384) do
                                        v386.CanCollide = true
                                    end
                                    v_u_360.set_model_collision_group(v_u_365, "pets")
                                    v_u_361.get("PetAPI/FinishPathAnim"):InvokeServer(true, v_u_364.pet_unique)
                                end
                            end
                            local v388 = v_u_357.get_pet_entity(v_u_365)
                            v_u_358.stage_reaction(v388, {
                                ["name"] = v363.FollowPresetPathReaction,
                                ["options"] = {
                                    ["path"] = v376,
                                    ["finish_use_callback"] = v_u_387
                                }
                            })
                            coroutine.wrap(function()
                                while v_u_356.delay(0.1):await() do
                                    local v389 = v_u_357.get_pet_entity(v_u_365)
                                    if not (v389 and v_u_358.has_performance(v389, v_u_362.FollowPresetPath)) then
                                        break
                                    end
                                end
                                v_u_387()
                            end)()
                        else
                            warn("[FurnitureUseDB] [PET_PATH_ANIM] " .. p_u_354.id .. " is missing a SuccessPath or Path")
                        end
                    else
                        return
                    end
                else
                    if #v_u_7.get_my_equipped() == 0 then
                        v359.apps.HintApp:hint({
                            ["overridable"] = true,
                            ["text"] = "Equip a pet to use this!",
                            ["length"] = 4,
                            ["yields"] = false
                        })
                    end
                    return
                end
            end
        end
    }
end
function v_u_19.ADD_TOPPING(p390, p_u_391)
    local v394 = p_u_391:gsub("_", " "):gsub("(%l)(%w*)", function(p392, p393)
        return string.upper(p392) .. p393
    end)
    local v395 = typeof(p390) ~= "table" and { p390 } or p390
    local v_u_396 = v_u_14.Set.fromArray(v395)
    local v_u_397 = v395[1]
    return {
        ["use_text"] = "Add " .. v394,
        ["use_permissions"] = "EVERYONE",
        ["client_use"] = function()
            v_u_3("ToppingsHelper").buy_topping(v_u_397, v_u_396, p_u_391)
        end
    }
end
function v_u_19.BAKE_ITEM(p398)
    local v399 = typeof(p398) ~= "table" and { p398 } or p398
    local v_u_400 = v_u_14.Set.fromArray(v399)
    local v_u_401 = v399[1]
    return {
        ["use_text"] = "Bake " .. v_u_10.food[v_u_401].name,
        ["use_permissions"] = "EVERYONE",
        ["client_use"] = function(_, _, p402)
            v_u_3("ToppingsHelper").bake(v_u_401, v_u_400, p402.UseBlocks.UseBlock)
        end
    }
end
function v_u_19.COLOR_ITEM(p403, p404, p405)
    if p403.colorable then
        local v406 = p404.colors
        if v406 then
            v406 = p404.colors[1]
        end
        if not v406 then
            return
        end
        p405.properties.color = { v406.R, v406.G, v406.B }
    end
end
function v_u_19.GRAB_TRANSPORT(p407, p408)
    local v_u_409 = v_u_10.transport[p407]
    return {
        ["use_text"] = "Drive " .. v_u_409.name,
        ["use_permissions"] = "EVERYONE",
        ["items_to_acquire"] = { p407 },
        ["server_use"] = function(p410)
            local v411 = v_u_3("MsgBridge")
            local v412 = v_u_3("DataM").get_store(p410):get("inventory")
            v411.dialog(p410, {
                ["text"] = string.format("%s was added to your inventory!", v_u_409.name),
                ["button"] = "Okay"
            })
            if #v412:get_items_with_id(v_u_409.id) <= 0 then
                v412:add_item(v_u_409)
            end
        end,
        ["roleplay_role_requirements"] = p408
    }
end
function v_u_19.GRAB_ITEM(p413, p414, p_u_415, p_u_416, p417, p418)
    local v_u_419 = v_u_10[p413][p414]
    local v420 = v_u_419.cost == 0
    local v421 = string.format
    assert(v420, v421("GRAB_ITEM item %s has a non-zero cost.", p414))
    return {
        ["use_text"] = p418 or "Grab " .. v_u_419.name,
        ["interaction_tag"] = p413 .. ":" .. p414,
        ["use_permissions"] = "EVERYONE",
        ["items_to_acquire"] = { p414 },
        ["server_use"] = function(p422, p_u_423, _)
            local v424 = v_u_3("DataM").get_store(p422)
            local v425 = v424:get("inventory")
            local v_u_426 = v424:get("equip_manager")
            local v_u_427 = v_u_3("package:Promise")
            local function v431(p_u_428)
                local v429 = v_u_426:get_equipped()
                local v430
                if v429 and v429.toys then
                    v_u_426:unequip(v429.toys)
                    v430 = 0.3
                else
                    v430 = 0
                end
                v_u_19.COLOR_ITEM(v_u_419, p_u_423, p_u_428)
                v_u_427.delay(v430):andThen(function()
                    v_u_426:equip(p_u_428)
                end)
            end
            local v432 = v425:get_items_with_id(v_u_419.id)
            if p_u_415 and p_u_415 <= #v432 then
                v431(v432[1])
            else
                local v433 = p_u_416
                local v434
                if typeof(v433) == "function" then
                    v434 = p_u_416(p422)
                else
                    v434 = p_u_416
                end
                v431((v425:add_item(v_u_419, v434)))
            end
        end,
        ["roleplay_role_requirements"] = p417 or v_u_19.CHECK_FURNITURE_STATE_FOR_ROLEPLAY_REQUIREMENTS
    }
end
v_u_19.CASH_REGISTER = {
    ["use_text"] = "Pay Owner",
    ["use_permissions"] = "EVERYONE",
    ["client_get_data_for_server_use"] = function(_, _, _, p435)
        local v436 = v_u_3("ClientData")
        local v437 = v_u_3("UIManager")
        if not v436.get("showed_cash_register_warning") then
            v436.update("showed_cash_register_warning", true)
            v437.apps.DialogApp:dialog({
                ["text"] = "Don\'t use Cash Registers to pay Bucks for Pets / items or you may get scammed. Stay safe!",
                ["button"] = "Okay"
            })
        end
        local v438, v439 = v437.apps.DialogApp:free_response_dialog({
            ["text"] = "Enter amount to pay " .. p435.Name .. " (limit is $50):",
            ["left"] = "Cancel",
            ["right"] = "Pay",
            ["placeholder_text"] = "Insert Amount Here"
        })
        if v438 == "Pay" then
            return tonumber(v439) or 0
        end
    end,
    ["server_use"] = function(p440, _, _, p441, p442)
        local v443 = v_u_3("PlayerToPlayerTransaction")
        if typeof(p441) == "number" then
            if p441 == p441 then
                if v443.player_can_make_transaction_with_owner(p440, p442) then
                    if v_u_8.is_all_trading_disabled() then
                        local _, v444 = v_u_8.is_all_trading_disabled()
                        v_u_3("MsgBridge").dialog(p440, {
                            ["text"] = v444,
                            ["button"] = "Okay"
                        })
                        return
                    elseif p441 > 50 then
                        v_u_3("MsgBridge").dialog(p440, {
                            ["text"] = "The maximum you can pay is $50!",
                            ["button"] = "Okay"
                        })
                        return
                    else
                        local v445 = math.min(50, p441)
                        if v445 <= 0 then
                            v_u_3("MsgBridge").dialog(p440, {
                                ["text"] = "Please enter an amount greater than zero!",
                                ["button"] = "Okay"
                            })
                        else
                            v443.pay_player(p440, p442, v445, "Donate", "CashRegister")
                        end
                    end
                else
                    v_u_3("MsgBridge").dialog(p440, {
                        ["text"] = "This register seems overloaded right now! Try again later.",
                        ["button"] = "Okay"
                    })
                    return
                end
            else
                return
            end
        else
            return
        end
    end
}
function v_u_19.THREEDTEXT_SIGN(p446)
    local v_u_447 = p446.font_id
    local v_u_448 = p446.scale
    local v_u_449 = p446.thickness
    local v_u_450 = p446.max_length
    local v_u_451 = p446.default_text
    local v_u_452 = p446.empty_text
    local v_u_453 = p446.material
    local v_u_454 = p446.default_color
    local v_u_455 = p446.emit_light
    return {
        ["use_text"] = function()
            return "Change Text"
        end,
        ["client_get_data_for_server_use"] = function(p456, _, _)
            local v457 = v_u_3("UIManager")
            local v458 = {
                ["left"] = "Cancel",
                ["right"] = "Save",
                ["existing_text"] = p456.text,
                ["max_length"] = v_u_450,
                ["use_utf8_length"] = true
            }
            local v459, v460 = v457.apps.DialogApp:paragraph_dialog(v458)
            if v459 == "Save" then
                return v460
            end
        end,
        ["server_use"] = function(p461, p462, _, p463)
            if typeof(p463) == "string" then
                local v464 = {
                    ["limit_graphemes"] = v_u_450
                }
                local v465, v466 = v_u_2.sanitize_and_check_length(p463, v464)
                if v465 then
                    p462.text = game:GetService("TextService"):FilterStringAsync(v466, p461.UserId):GetNonChatStringForBroadcastAsync()
                end
            else
                return
            end
        end,
        ["render"] = function(p467, p468)
            local v469 = v_u_3("ThreeDFonts")
            local v470 = p467.text or v_u_451
            local v471 = p468.TextOrigin
            local v472 = p467.colors and p467.colors[1] or v_u_454
            local v473 = p467.scale or 1
            local v474 = Instance.new("Model", p468)
            local v475 = {
                ["parent"] = v474,
                ["thickness"] = v_u_449,
                ["scale"] = v_u_448 * v473,
                ["anchorX"] = 0.5,
                ["anchorZ"] = 0,
                ["partProperties"] = {
                    ["Color"] = v472,
                    ["CanCollide"] = false,
                    ["Material"] = v_u_453
                }
            }
            local v476 = v469.render_single_line_text(v_u_447, v470, v471.CFrame, v475)
            if next(v476.parts) == nil then
                v469.render_single_line_text(v_u_447, v_u_452, v471.CFrame, v475)
            end
            if v_u_455 then
                local v477, v478 = v474:GetBoundingBox()
                local v479 = Instance.new("Part")
                v479.CFrame = v477
                v479.Size = v478
                v479.Parent = p468
                v479.Anchored = true
                v479.CanCollide = false
                v479.Transparency = 1
                local v480 = Instance.new("SurfaceLight")
                v480.Angle = 90
                v480.Color = v472
                v480.Face = Enum.NormalId.Front
                v480.Range = 6
                v480.Brightness = 1
                v480.Parent = v479
            end
        end
    }
end
function v_u_19.BASIC_FURNITURE(p_u_481)
    p_u_481.use_text = p_u_481.use_text or "Sit"
    p_u_481.use_permissions = p_u_481.use_permissions or "EVERYONE"
    p_u_481.is_basic_use = true
    if p_u_481.caregiver_assist == nil then
        p_u_481.caregiver_assist = true
    end
    local v_u_482 = p_u_481.client_use
    function p_u_481.client_use(p483, p484, p485, p486)
        local v487 = v_u_3("PetEntityManager")
        local v488 = v_u_3("UIManager")
        local v489 = v487.get_pet_entity(p486)
        if v489 and v489.modifier_values_from_performances.dont_allow_sit_states then
            v488.apps.HintApp:hint({
                ["text"] = "Your pet can\'t use this right now!",
                ["yields"] = false
            })
        end
        if v_u_482 then
            v_u_482(p483, p484, p485, p486)
        end
    end
    p_u_481.server_use = p_u_481.server_use or function(p_u_490, p_u_491, p_u_492, p_u_493, p_u_494, p_u_495, p_u_496, p_u_497)
        local v_u_498 = v_u_3("new:AilmentsServer")
        local v499 = v_u_3("CharacterWrapper")
        local v500 = v_u_3("PetEntityManagerServer")
        local v_u_501 = v_u_3("NotificationManager")
        local v502 = v_u_3("new:StreamingHelper")
        local v_u_503 = v_u_3("ErrorLog")
        local v_u_504 = v499.get(p_u_495)
        if v_u_504 then
            local v505 = v500.get_pet_entity(p_u_495)
            if not (v505 and v505.modifiers.dont_allow_sit_states) then
                if p_u_493 then
                    local v506 = p_u_493.cframe
                    if typeof(v506) == "CFrame" then
                        p_u_491.occupied = p_u_491.occupied or {}
                        if not p_u_491.occupied[p_u_496] then
                            p_u_491.occupied[p_u_496] = v502.as_id(v_u_504.char)
                            if p_u_481.has_animated_seat then
                                p_u_491.char_offset = p_u_481.char_offset
                                p_u_491.animated_seats = p_u_491.animated_seats or {}
                                p_u_491.animated_seats[p_u_496] = v502.as_id(v_u_504.char)
                            end
                            p_u_492()
                            v_u_15.try(function()
                                if p_u_481.exit_all_states then
                                    v_u_504.state_manager:exit_all_states()
                                end
                                local v507 = p_u_481.animation
                                local v508
                                if typeof(v507) == "table" then
                                    v508 = p_u_481.animation[v_u_504:get_team()]
                                else
                                    v508 = p_u_481.animation
                                end
                                if typeof(v508) == "function" then
                                    v508 = v508(p_u_490, p_u_491, p_u_492, p_u_493, p_u_494, p_u_495, p_u_496)
                                end
                                local v509 = p_u_481.is_human_standing
                                if typeof(v509) == "function" then
                                    v509 = v509(p_u_490, p_u_491, p_u_492, p_u_493, p_u_494, p_u_495, p_u_496)
                                end
                                local v510 = nil
                                local v511 = p_u_481.char_offset
                                if typeof(v511) == "CFrame" then
                                    v510 = p_u_481.char_offset
                                else
                                    local v512 = p_u_481.char_offset
                                    if typeof(v512) == "table" then
                                        v510 = p_u_481.char_offset[v_u_504:get_team()]
                                    end
                                end
                                local v513 = v_u_504.state_manager
                                local v514 = {
                                    ["id"] = "UseFurniture",
                                    ["params"] = {
                                        ["animation"] = v508,
                                        ["teleport_character_back"] = p_u_481.teleport_character_back,
                                        ["cframe"] = p_u_493.cframe * (v510 or CFrame.new()),
                                        ["furniture_id"] = p_u_491.id,
                                        ["furniture_use_id"] = p_u_481.use_id,
                                        ["is_human_standing"] = v509
                                    }
                                }
                                local v_u_515 = v513:enter(v514)
                                if v_u_515 then
                                    local v516
                                    if p_u_481.ailment_to_boost then
                                        v516 = p_u_481.ailment_to_boost[1]
                                    else
                                        v516 = nil
                                    end
                                    local v517
                                    if v_u_504.is_pet then
                                        v517 = v_u_504:get_property("pet_unique")
                                    else
                                        v517 = nil
                                    end
                                    if v516 then
                                        v_u_498.add_rate(v_u_504, v516, p_u_481.ailment_to_boost[2])
                                        if v517 then
                                            v_u_501.indicate_event({
                                                ["player"] = p_u_490,
                                                ["name"] = "player_interacted_with_pet",
                                                ["options"] = {
                                                    ["unique_id"] = v517,
                                                    ["furniture_id"] = p_u_491.id
                                                }
                                            })
                                        end
                                    end
                                    if p_u_481.basic_server_use_core then
                                        p_u_481.basic_server_use_core(p_u_490, p_u_491, p_u_492, p_u_493, p_u_494, p_u_495, p_u_496, p_u_497, v_u_515)
                                    end
                                    local v518 = v_u_15.resolve()
                                    if v516 and v_u_504.is_pet then
                                        v518 = v_u_498.ailment_completed_promise(v_u_504, v516):andThen(function()
                                            local v519 = {
                                                ["player"] = v_u_504:get_property("entity_controller") or v_u_504.player,
                                                ["setting_id"] = "pet_can_auto_exit_furniture"
                                            }
                                            local v520, v521 = v_u_6.get_setting_server(v519)
                                            if v520 and v521 then
                                                v_u_515:exit()
                                            end
                                        end)
                                    end
                                    v_u_515:yield_until_exit()
                                    v518:cancel()
                                    if v516 then
                                        v_u_498.clear_rate(v_u_504, v516)
                                    end
                                    if p_u_481.basic_server_use_post then
                                        p_u_481.basic_server_use_post(p_u_490, p_u_491, p_u_492, p_u_493, p_u_494, p_u_495, p_u_496, p_u_497)
                                    end
                                end
                            end):catch(function(p522)
                                warn(p522)
                                v_u_503.log({
                                    ["origin"] = "Furniture error (BASIC_FURNITURE)",
                                    ["error"] = p522
                                })
                            end):await()
                            if p_u_491.animated_seats then
                                p_u_491.animated_seats[p_u_496] = nil
                            end
                            p_u_491.occupied[p_u_496] = nil
                        end
                    end
                end
            end
        else
            return
        end
    end
    local v_u_523 = p_u_481.client_get_data_for_server_use
    function p_u_481.client_get_data_for_server_use(p524, p525, p526, p527, p528, p529, p530)
        local v531 = not v_u_523 and {} or v_u_523(p524, p525, p526, p527, p528, p529, p530)
        if v531 then
            v531.cframe = p528.CFrame * CFrame.new(0, p528.Size.Y / 2, 0)
        end
        return v531
    end
    local v_u_532 = p_u_481.render
    function p_u_481.render(p533, p534)
        local v535 = v_u_3("EffectsToggleHelper")
        if v_u_532 then
            v_u_532(p533, p534)
        end
        if p_u_481.enable_effects_when_occupied then
            local v536
            if p533.occupied == nil then
                v536 = false
            else
                v536 = next(p533.occupied) ~= nil
            end
            v535.toggle_effects(p534:GetDescendants(), v536)
        end
    end
    if not p_u_481.roleplay_role_requirements then
        p_u_481.roleplay_role_requirements = v_u_19.CHECK_FURNITURE_STATE_FOR_ROLEPLAY_REQUIREMENTS
    end
    return p_u_481
end
function v_u_19.PROCESSING_STATION(p537)
    local v_u_538 = p537.processing_time
    local v_u_539 = p537.on_started
    local v_u_540 = p537.on_canceled
    local v_u_541 = p537.on_finished
    if typeof(v_u_538) == "function" then
        v_u_538 = v_u_538()
    end
    p537.caregiver_assist = false
    p537.team_whitelist = p537.team_whitelist or { "Parents", "Babies" }
    function p537.init(p542)
        p542.is_processing = false
        p542.processing_time = v_u_538
    end
    function p537.basic_server_use_core(p_u_543, p_u_544, p_u_545, p_u_546, p_u_547, p_u_548, p_u_549, p_u_550, p_u_551)
        if v_u_539 then
            v_u_539(p_u_543, p_u_544, p_u_545, p_u_546, p_u_547, p_u_548, p_u_549)
        end
        local v_u_552 = string.format("__processing_station_promise_%s", p_u_549)
        p_u_550[v_u_552] = v_u_15.delay(v_u_538):andThen(function()
            p_u_550[v_u_552] = nil
            p_u_551:exit()
            if v_u_541 then
                v_u_541(p_u_543, p_u_544, p_u_545, p_u_546, p_u_547, p_u_548, p_u_549)
            end
        end)
        p_u_544.is_processing = true
        p_u_545()
    end
    function p537.basic_server_use_post(p553, p554, p555, p556, p557, p558, p559, p560)
        local v561 = string.format("__processing_station_promise_%s", p559)
        local v562 = p560[v561]
        if v562 then
            p560[v561] = nil
            v562:cancel()
            if v_u_540 then
                v_u_540(p553, p554, p555, p556, p557, p558, p559)
            end
        end
        p554.is_processing = false
        p555()
    end
    return v_u_19.BASIC_FURNITURE(p537)
end
function v_u_19.TEA_CUP(p_u_563)
    return {
        ["use_text"] = "Grab Tea Cup",
        ["use_permissions"] = "EVERYONE",
        ["items_to_acquire"] = { p_u_563 },
        ["server_use"] = function(p564, _, _)
            local v565 = v_u_3("DataM")
            local v566 = v_u_3("InventoryDB")
            local v567 = v565.get_store(p564)
            local v568 = v567:get("inventory")
            local v569 = v567:get("equip_manager")
            local v570 = v568:get_items_with_id(p_u_563)
            if #v570 > 0 then
                local v571 = v569:get_equipped().food
                if not v571 or v571.id ~= p_u_563 then
                    v571 = v570[1]
                    v569:equip(v571)
                end
                v571.properties.uses_left = 0
                v571:mark_updated()
                v571:server_render()
            else
                v569:equip((v568:add_item(v566.food[p_u_563], {
                    ["uses_left"] = 0
                })))
            end
        end
    }
end
local v_u_572 = false
function v_u_19.TEA_KETTLE(p_u_573)
    return {
        ["use_text"] = "Fill Tea Cup",
        ["use_permissions"] = "EVERYONE",
        ["server_use"] = function(p574, p575, _)
            local v576 = v_u_3("DataM")
            local v577 = v_u_3("MsgBridge")
            local v578 = v576.get_store(p574):get("equip_manager"):get_equipped().food
            if v578 and v578.id:match("tea_cup$") then
                v578.properties.uses_left = 3
                v578.properties.flavor = p575.id
                v578:mark_updated()
                v578:server_render()
            else
                v577.hint(p574, {
                    ["text"] = "You need to hold a tea cup first!",
                    ["length"] = 2.5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
            end
        end,
        ["client_use"] = function(_, _, p579)
            local v_u_580 = game:GetService("TweenService")
            local v581 = v_u_3("ClientData")
            local v582 = v_u_3("Spring")
            if v_u_572 then
                return
            else
                local v583 = v581.get("equip_manager").food[1]
                if v583 and v583.id:match("tea_cup$") then
                    v_u_572 = true
                    local v_u_584 = p579:Clone()
                    v_u_584.Parent = workspace
                    for _, v585 in ipairs(v_u_584:GetDescendants()) do
                        if v585:IsA("BasePart") then
                            v585.CanCollide = false
                        end
                    end
                    local v_u_586 = v_u_584.PrimaryPart.CFrame
                    local v_u_587 = v_u_584.Body.Attachment0
                    local v_u_588 = v_u_587.Stream
                    local v589 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if v589 then
                        if v589.Name == "TeaCupTool" then
                            v589 = v589:FindFirstChild("KettleBeamAttachment", true)
                        else
                            v589 = false
                        end
                    end
                    if v589 then
                        v_u_588.Attachment1 = v589
                    end
                    local v590 = v_u_584.AnimationController:LoadAnimation(v_u_4.get_track(p_u_573))
                    v590:GetMarkerReachedSignal("KettleBeamStart"):Connect(function()
                        v_u_588.Width0 = 0
                        v_u_588.Width1 = 0
                        v_u_588.Enabled = true
                        v_u_587.Cloud1.Enabled = true
                        v_u_587.Cloud2.Enabled = true
                        v_u_580:Create(v_u_588, TweenInfo.new(0.25), {
                            ["Width0"] = 0.1
                        }):Play()
                        delay(0.1, function()
                            v_u_580:Create(v_u_588, TweenInfo.new(0.25), {
                                ["Width1"] = 0.3
                            }):Play()
                        end)
                    end)
                    v590:GetMarkerReachedSignal("KettleBeamEnd"):Connect(function()
                        v_u_587.Cloud1.Enabled = false
                        v_u_587.Cloud2.Enabled = false
                        v_u_580:Create(v_u_588, TweenInfo.new(0.15), {
                            ["Width1"] = 0
                        }):Play()
                        delay(0.1, function()
                            local v591 = v_u_580:Create(v_u_588, TweenInfo.new(0.15), {
                                ["Width0"] = 0
                            })
                            v591:Play()
                            v591.Completed:Wait()
                            v_u_588.Enabled = false
                        end)
                    end)
                    local v_u_592 = game.Players.LocalPlayer.Character.RightMount
                    local v_u_593 = v582.new(0.75, 1.5, v_u_584.PrimaryPart.Position)
                    local v_u_594 = v582.new(0.75, 1, v_u_584.PrimaryPart.CFrame.LookVector)
                    local v_u_595 = 0
                    local v_u_596 = false
                    local v_u_597 = tick()
                    connection = game:GetService("RunService").Heartbeat:Connect(function(p598)
                        local v599
                        if v_u_596 then
                            v599 = v_u_586
                        else
                            v599 = v_u_592.CFrame * CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0) * CFrame.new(-3, 0.25, 0.5)
                        end
                        v_u_593:set_goal(v599.Position)
                        v_u_593:update(p598)
                        local v600 = v_u_593:get_position()
                        v_u_594:set_goal(v599.LookVector)
                        v_u_594:update(p598)
                        local v601 = v_u_594:get_position()
                        local v602 = v_u_595 + p598 * 4
                        v_u_595 = math.clamp(v602, 0, 1)
                        if not v_u_596 then
                            local v603 = tick() * 3
                            local v604 = math.sin(v603) * 0.5 * v_u_595
                            v600 = v600 + Vector3.new(0, v604, 0)
                        end
                        v_u_584:SetPrimaryPartCFrame(CFrame.new(v600, v600 + v601))
                        if v_u_596 and ((v_u_584.PrimaryPart.Position - v_u_586.Position).Magnitude < 0.2 or tick() - v_u_597 > 10) then
                            connection:Disconnect()
                            v_u_584:Destroy()
                            v_u_572 = false
                        end
                    end)
                    v590:Play()
                    v590.Stopped:Wait()
                    v_u_596 = true
                end
            end
        end
    }
end
local v_u_605 = {
    Color3.fromRGB(13, 105, 172),
    Color3.fromRGB(155, 201, 220),
    Color3.fromRGB(110, 153, 202),
    Color3.fromRGB(159, 243, 233),
    Color3.fromRGB(116, 117, 126),
    Color3.fromRGB(161, 161, 161),
    Color3.fromRGB(98, 37, 209),
    Color3.fromRGB(56, 58, 67),
    Color3.fromRGB(218, 134, 122),
    Color3.fromRGB(177, 168, 153),
    Color3.fromRGB(245, 159, 245),
    Color3.fromRGB(248, 248, 248),
    Color3.fromRGB(117, 0, 0),
    Color3.fromRGB(217, 149, 66),
    Color3.fromRGB(255, 148, 148),
    Color3.fromRGB(160, 132, 79),
    Color3.fromRGB(161, 196, 140),
    Color3.fromRGB(203, 166, 91),
    Color3.fromRGB(239, 184, 56),
    Color3.fromRGB(91, 68, 49),
    Color3.fromRGB(255, 102, 204),
    Color3.fromRGB(211, 203, 88),
    Color3.fromRGB(255, 206, 183),
    Color3.fromRGB(110, 148, 67),
    Color3.fromRGB(16, 42, 220),
    Color3.fromRGB(68, 127, 37),
    Color3.fromRGB(90, 90, 90),
    Color3.fromRGB(153, 139, 126),
    Color3.fromRGB(220, 214, 207),
    Color3.fromRGB(95, 211, 95),
    Color3.fromRGB(168, 144, 117),
    Color3.fromRGB(52, 97, 28),
    Color3.fromRGB(30, 30, 30),
    Color3.fromRGB(208, 146, 183),
    Color3.fromRGB(203, 166, 91),
    Color3.fromRGB(148, 136, 214),
    Color3.fromRGB(245, 205, 48),
    Color3.fromRGB(124, 92, 70),
    Color3.fromRGB(173, 90, 79)
}
v_u_19.COLORED_HAIR_SPRAY_SHELF = {
    ["items_to_acquire"] = { "colored_hair_spray" },
    ["use_text"] = "Grab Colored Hair Spray",
    ["client_get_data_for_server_use"] = function(_, _, _)
        return v_u_3("UIManager").apps.ColorPickerApp:pick_color({
            ["request_source"] = "hairspray_shelf",
            ["no_cancel"] = true,
            ["no_advanced"] = true,
            ["forced_colors"] = v_u_605,
            ["starter_color"] = v_u_605[1]
        })
    end,
    ["server_use"] = function(p606, _, _, p607)
        local v608 = v_u_3("DataM")
        if typeof(p607) == "Color3" then
            local v609 = false
            for _, v610 in ipairs(v_u_605) do
                if p607 == v610 then
                    v609 = true
                end
            end
            if v609 then
                local v611 = v608.get_store(p606)
                if v611 then
                    local v612 = v611:get("equip_manager")
                    local v613 = v611:get("inventory")
                    local v614 = {
                        ["color"] = { p607.R, p607.G, p607.B }
                    }
                    v612:equip((v613:add_item(v_u_10.roleplay.colored_hair_spray, v614)))
                end
            else
                return
            end
        else
            return
        end
    end
}
function v_u_19.RANDOM_ANIMATION(p615, p_u_616)
    local v617 = typeof(p_u_616) == "table"
    assert(v617, "Incorrect parameter")
    local v618 = #p_u_616 > 0
    assert(v618, "No animations specified")
    local v619 = p615 ~= nil
    assert(v619, "No entry specified")
    local v620 = p615.animation == nil
    assert(v620, "Animation already specified")
    function p615.animation()
        return p_u_616[math.random(1, #p_u_616)]
    end
    return p615
end
v_u_19.ROLE_AUTHENTICATED_LOCKED_DOOR_WITH_ONE_WAY_ALWAYS_UNLOCKED_EXIT = v_u_19.INTERIOR_DOOR({
    ["seconds_until_automatic_close"] = 5,
    ["roleplay_role_requirements"] = function(p621, _, p622)
        local v623 = game.Players.LocalPlayer.Character
        if v623 then
            v623 = v623:FindFirstChild("HumanoidRootPart")
        end
        if v623 then
            local v624 = p622.WorkingParts.Hinge.CFrame:ToObjectSpace(v623.CFrame).Z
            local v625 = math.sign(v624)
            local v626 = p622.WorkingParts.Hinge.CFrame:ToObjectSpace(p622.AnyoneCanOpenFromThisDirection.CFrame).Z
            if v625 * math.sign(v626) ~= 1 then
                if (p621.door_position or "Closed") == "Closed" then
                    return {
                        ["building_id"] = p621.building_id,
                        ["role_id"] = p621.role_id
                    }
                end
            end
        else
            return
        end
    end
})
function v_u_19.PLAYER_FEATURING_POSTER(p627)
    local v_u_628 = p627 or {}
    return {
        ["use_text"] = "Change",
        ["server_use"] = function(p629, p630)
            local v_u_631 = v_u_3("RoleplayRolesManager")
            local v632 = v_u_3("MsgBridge")
            local v_u_633 = v_u_628.target_building_id or p630.target_building_id
            local v634 = v_u_628.no_qualified_candidates_text or "No qualified candidates."
            local v636 = v_u_14.List.filter(game.Players:GetPlayers(), function(p635)
                return v_u_633 == nil and true or v_u_631.does_player_work_at_building(p635, v_u_633)
            end)
            if #v636 == 0 then
                v632.hint(p629, {
                    ["text"] = v634,
                    ["length"] = 4.5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
                return
            else
                table.sort(v636, function(p637, p638)
                    return p637.UserId < p638.UserId
                end)
                local v639 = nil
                if p630.picked_candidate_name then
                    local v640 = game.Players:FindFirstChild(p630.picked_candidate_name)
                    if v640 then
                        v639 = table.find(v636, v640)
                    end
                end
                if v639 then
                    local v641 = v639 + 1
                    p630.picked_candidate_name = v636[#v636 < v641 and 1 or v641].Name
                else
                    p630.picked_candidate_name = v636[math.random(1, #v636)].Name
                end
            end
        end,
        ["post_render"] = function(p642, p_u_643, _, _, p644)
            if p642.picked_candidate_name then
                local v645 = game.Players:FindFirstChild(p642.picked_candidate_name)
                if v645 then
                    local v646 = v645.Character
                    if v646 then
                        if v646:FindFirstChild("HumanoidRootPart") then
                            if v646:FindFirstChild("Humanoid") then
                                local v647 = p_u_643.Board
                                local v_u_648 = v647.SurfaceGui
                                v_u_648.Name = "FurnitureBoardSurfaceGui"
                                v_u_648.Adornee = v647
                                v_u_648.Parent = game.Players.LocalPlayer.PlayerGui
                                p644.surface_gui = v_u_648
                                v_u_648.PlayerName.Text = p642.picked_candidate_name
                                v646.Archivable = true
                                local v_u_649 = v646:Clone()
                                v646.Archivable = false
                                v_u_649.HumanoidRootPart.Anchored = true
                                v_u_649.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                                v_u_649.Parent = workspace
                                v_u_649.PrimaryPart = v_u_649.HumanoidRootPart
                                v_u_649:SetPrimaryPartCFrame(CFrame.new())
                                local v650 = Instance.new("Camera")
                                v650.CFrame = CFrame.new(Vector3.new(0, 0.5, -6), (Vector3.new()))
                                v650.Parent = v_u_648.ViewportFrame
                                v_u_648.ViewportFrame.CurrentCamera = v650
                                task.spawn(function()
                                    task.wait()
                                    if p_u_643.Parent then
                                        v_u_649.Parent = v_u_648.ViewportFrame
                                    else
                                        v_u_649:Destroy()
                                    end
                                end)
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        end,
        ["unrender"] = function(_, _, _, p651)
            if p651.surface_gui then
                p651.surface_gui:Destroy()
            end
        end,
        ["roleplay_role_requirements"] = v_u_19.CHECK_FURNITURE_STATE_FOR_ROLEPLAY_REQUIREMENTS
    }
end
function v_u_19.GENERIC_SHOWER(p652)
    local v653 = p652 or {}
    return v_u_19.BASIC_FURNITURE({
        ["use_id"] = "generic_shower",
        ["use_text"] = "Take shower",
        ["ailment_to_boost"] = { "dirty", v_u_5.full_shower_duration },
        ["teleport_character_back"] = true,
        ["exit_all_states"] = true,
        ["basic_server_use_core"] = function(_, _, _, _, _, p654, _)
            local v655 = v_u_3("CharacterWrapper").get(p654)
            if v655 then
                if v655:get_team() == "Parents" then
                    v655.state_manager:lock()
                end
            end
        end,
        ["basic_server_use_post"] = function(_, _, _, _, _, p656, _)
            local v657 = v_u_3("CharacterWrapper").get(p656)
            if v657 then
                v657.state_manager:unlock()
            end
        end,
        ["client_use"] = function(_, _, _, p658)
            local v659 = v_u_3("UIManager")
            local v660 = v_u_3("WeatherClient")
            local v661 = v_u_3("Camera")
            local v662 = v_u_3("InteractionsEngine")
            if p658 == game.Players.LocalPlayer.Character then
                local v663 = game.Players.LocalPlayer.Character.Humanoid
                local v664 = game.Players.LocalPlayer.Character.HumanoidRootPart
                local v665 = v662:generate_handle()
                v662:disable(v665)
                v659.apps.TransitionsApp:transition({
                    ["length"] = 1,
                    ["end_transparency"] = 0
                })
                v659.apps.TransitionsApp:set_blur("Shower", 20, 0)
                v660.add_interior_lighting(5, "SHOWER")
                local v666 = v_u_17.Heartbeat:Connect(function()
                    game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
                end)
                v659.apps.TransitionsApp:transition({
                    ["length"] = 1,
                    ["end_transparency"] = 0.9
                })
                local v667 = tick()
                while tick() - v667 < v_u_5.full_shower_duration and (v663.Sit and v664.Velocity.Magnitude <= 0.1) do
                    wait(0.1)
                end
                local v668 = tick() - v667 >= v_u_5.full_shower_duration
                if v668 then
                    v659.apps.TransitionsApp:transition({
                        ["length"] = 1,
                        ["end_transparency"] = 0
                    })
                end
                v666:Disconnect()
                game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
                v661.set_zoom_distance(12)
                v660.remove_lighting(5)
                if v668 then
                    v663.Jump = true
                end
                v659.apps.TransitionsApp:clear_blur("Shower")
                if v668 then
                    v659.apps.TransitionsApp:transition({
                        ["length"] = 2,
                        ["end_transparency"] = 1
                    })
                end
                v662:enable(v665)
            end
        end,
        ["render"] = function(p669, p670)
            p670.PrimaryPart = p670.Center
            game:GetService("CollectionService"):AddTag(p670, "ShowerFurniture")
            local v671 = p669.occupied or {}
            p670.Center.Smoke.Enabled = v671.UseBlock or false
        end,
        ["post_render"] = v653.post_render,
        ["unrender"] = v653.unrender
    })
end
function v_u_19.SHOWER_WITH_FADING_DOOR()
    local v672 = v_u_19.GENERIC_SHOWER()
    local v_u_673 = v672.render
    local v_u_674 = v_u_15.resolve()
    function v672.render(p675, p676)
        v_u_673(p675, p676)
        local v677 = (p675.occupied or {}).UseBlock and true or false
        local v_u_680 = v_u_14.List.filter(p676:GetDescendants(), function(p678)
            local v679 = p678:IsA("BasePart")
            if v679 then
                v679 = p678:GetAttribute("ShouldFade")
            end
            return v679
        end)
        local v_u_681 = {}
        for v682, v683 in ipairs(v_u_680) do
            v_u_681[v682] = { v677 and (v683.Transparency or 0) or 0, v677 and 0 or v683.Transparency }
        end
        v_u_674:cancel()
        v_u_674 = v_u_9.callback(0, 1, TweenInfo.new(0.2), function(p684)
            for v685, v686 in ipairs(v_u_680) do
                local v687 = v_u_681[v685]
                local v688, v689 = unpack(v687)
                v686.Transparency = (1 - p684) * v688 + p684 * v689
            end
        end)
    end
    return v672
end
v_u_19.CAMERA_PEEK = {
    ["post_render"] = function(p_u_690, p_u_691, _, _, _)
        local v_u_692 = v_u_3("ClientData")
        local v_u_693 = v_u_3("UIManager")
        local v_u_694 = v_u_3("PlatformM")
        local v_u_695 = {}
        for _, v696 in p_u_691:GetChildren() do
            if v696.Name == "CameraPart" then
                table.insert(v_u_695, v696)
                v696.Transparency = 1
                v696.CanCollide = false
            end
        end
        if #v_u_695 == 0 then
            error("Missing CameraPart(s).")
        end
        p_u_691.ActiveRegion.Transparency = 1
        p_u_691.ActiveRegion.CanCollide = false
        local function v_u_702()
            local v697 = (1 / 0)
            local v698 = nil
            for _, v699 in v_u_695 do
                local v700 = (workspace.Camera.CFrame.Position - v699.Position).Magnitude
                if v700 < v697 then
                    v698 = v699
                    v697 = v700
                end
            end
            local v701 = v698.CFrame
            if v698:FindFirstChild("field_of_view") then
                return v701, v698.field_of_view.Value
            else
                return v701, 70
            end
        end
        local function v_u_704()
            local v703 = game.Players.LocalPlayer.Character
            if v703 then
                v703 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            if v703 then
                return v_u_11.point_in_points(v703.Position, { v_u_11.get_corners(p_u_691.ActiveRegion, true) }, nil, true)
            else
                return false
            end
        end
        local function v711()
            local v705 = game.Players.LocalPlayer.Character
            if v705 then
                v705 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            local v706 = game.Players.LocalPlayer.Character
            if v706 then
                v706 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            end
            if v705 and v706 then
                if p_u_690.building_id or p_u_690.role_id then
                    local v707 = v_u_692.get("roleplay_role") or {}
                    if p_u_690.building_id and v707.building_id ~= p_u_690.building_id then
                        return
                    end
                    if p_u_690.role_id and v707.role_id ~= p_u_690.role_id then
                        return
                    end
                end
                if p_u_690.disable_console and v_u_694.is_using_gamepad() then
                    return
                elseif v_u_704() and v705.AssemblyLinearVelocity.Magnitude <= 1.5 then
                    workspace.Camera.CameraType = Enum.CameraType.Scriptable
                    local v708, v709 = v_u_702()
                    local v710 = v_u_18:Create(workspace.Camera, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        ["CFrame"] = v708,
                        ["FieldOfView"] = v709
                    })
                    v710:Play()
                    v_u_693.apps.HideGuiApp:hide_all("camera_peek", { "InteractionsApp" })
                    v_u_693.apps.CoreGuiApp:set_coregui_disabled("camera_peek", Enum.CoreGuiType.Chat)
                    task.wait(0.25)
                    while v705.Parent and v705.AssemblyLinearVelocity.Magnitude <= 3 do
                        task.wait()
                    end
                    v710:Cancel()
                    workspace.Camera.CameraType = Enum.CameraType.Custom
                    workspace.Camera.FieldOfView = 70
                    v_u_693.apps.HideGuiApp:unhide_all("camera_peek")
                    v_u_693.apps.CoreGuiApp:reenable_coregui("camera_peek", Enum.CoreGuiType.Chat)
                    task.wait(0.5)
                end
            else
                return
            end
        end
        while p_u_691.Parent do
            v711()
            task.wait(0.1)
        end
    end
}
function v_u_19.BLINDS(p712)
    local v713 = v_u_19.TOGGLEABLE(p712)
    function v713.post_render(p714, p715, _, p716, _)
        local v717 = p714.on
        local v718 = p716 == nil and true or p716.on ~= v717
        local v719 = p715.Blinds:GetChildren()
        local v720 = -0.7853981633974483
        if v718 then
            if not v717 then
                for _, v721 in v719 do
                    v721.CFrame = v721.CFrame * CFrame.Angles(v720, 0, 0)
                end
                v720 = v720 * -1
            end
            for _, v722 in v719 do
                v_u_18:Create(v722, TweenInfo.new(0.8), {
                    ["CFrame"] = v722.CFrame * CFrame.Angles(v720, 0, 0)
                }):Play()
            end
        elseif v717 then
            for _, v723 in v719 do
                v723.CFrame = v723.CFrame * CFrame.Angles(v720, 0, 0)
            end
        end
    end
    function v713.use_text(p724)
        return p724.on and "Close" or "Open"
    end
    return v713
end
function v_u_19.PAINT_SEALER(p725, p726)
    local v727 = v_u_13[p725]
    local v728, v_u_729 = v_u_12.NPC(v727, p726)
    function v728.client_use(_, _, _)
        local v_u_730 = v_u_3("UIManager")
        local v_u_731 = v_u_3("RouterClient")
        local v_u_732 = v_u_3("PetColorHelper")
        v_u_729.take_focus({
            ["hide_other_characters"] = true,
            ["hide_other_pets"] = true
        }, function(p733)
            local v734 = false
            local v735 = false
            for _, v736 in v_u_7.get_my_equipped() do
                local v737 = v_u_7.get_wrapper_from_item(v736)
                v734 = not v734 and v_u_732.has_salon_colors_applied(v737) and true or v734
                v735 = not v735 and v_u_732.color_is_sealed(v737) and true or v735
                if v735 and v734 then
                    break
                end
            end
            if v735 then
                p733:play_speech({
                    ["dialog"] = {
                        {
                            ["text"] = ("Welcome back, %s!"):format(game.Players.LocalPlayer.Name),
                            ["length"] = 1.5
                        },
                        {
                            ["text"] = "Your pet\'s fur was sealed with the Paint Sealer, do I see that right?",
                            ["length"] = 2
                        },
                        {
                            ["text"] = "Love the color combination!",
                            ["length"] = 1.5
                        },
                        {
                            ["text"] = "Are you bored of this look? We can wipe it right off!",
                            ["length"] = 2
                        }
                    }
                }):expect()
                if v_u_730.apps.DialogApp:dialog({
                    ["text"] = "Want to remove the Sealed Fur Paint?",
                    ["left"] = "No",
                    ["right"] = "Yes",
                    ["accept_delay"] = 3
                }) == "Yes" then
                    local v740 = v_u_7.choose_equipped(function(p738)
                        local v739 = v_u_7.get_wrapper_from_item(p738)
                        return v_u_732.color_is_sealed(v739)
                    end)
                    local v741 = v_u_7.get_wrapper_from_item(v740)
                    if v741 == nil then
                        return
                    end
                    if v_u_730.apps.DialogApp:dialog({
                        ["text"] = "Are you sure you want to wipe it off? This action is permanent.",
                        ["left"] = "No",
                        ["right"] = "Yes",
                        ["accept_delay"] = 3
                    }) == "Yes" then
                        p733:play_speech({
                            ["dialog"] = {
                                {
                                    ["text"] = "Blank slate coming in 1... 2... 3!",
                                    ["length"] = 1.5
                                }
                            }
                        }):expect()
                        v_u_731.get("PetAPI/WipeColoredHairSpray"):FireServer(v741.char)
                        return
                    end
                end
            else
                if v734 then
                    p733:play_speech({
                        ["dialog"] = {
                            {
                                ["text"] = "Look at you! And your pet!",
                                ["length"] = 2
                            },
                            {
                                ["text"] = "Obsessed with the color combination.",
                                ["length"] = 2
                            },
                            {
                                ["text"] = "Want your pet to stay this way? The sky\'s the limit!",
                                ["length"] = 3
                            }
                        }
                    }):expect()
                end
                p733:play_speech({
                    ["dialog"] = {
                        {
                            ["text"] = "Grab a Paint Sealer and let it work its magic to lock in the look!",
                            ["length"] = 3
                        },
                        {
                            ["text"] = "The Sealer wears off after trading, so no tricky business...",
                            ["length"] = 2
                        },
                        {
                            ["text"] = "If you change your mind after using the Paint Sealer,",
                            ["length"] = 2
                        },
                        {
                            ["text"] = "come back with your colorful pet equipped, and we\'ll get the color right off.",
                            ["length"] = 3
                        },
                        {
                            ["text"] = "Sometimes you just need a blank slate!",
                            ["length"] = 2
                        }
                    }
                }):expect()
            end
        end)
    end
    return v728
end
return v_u_19