--// ReplicatedStorage.ClientModules.Game.FurnitureHeistClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("UIManager")
local v_u_3 = v1("TableUtil")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("InteractionsEngine")
local v_u_6 = v1("RouterClient")
local v_u_7 = v1("CollisionsClient")
local v_u_8 = v1("AnimationManager")
local v_u_9 = v1("InteriorsM")
local v_u_10 = v1("new:StreamingHelper")
local v_u_11 = game:GetService("CollectionService")
local v_u_12 = game:GetService("RunService")
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = false
local v_u_17 = false
local v_u_18 = false
local v_u_19 = nil
local v_u_20 = nil
local function v_u_23()
    local v21 = game.Players:GetPlayers()
    v_u_3.shuffle(v21)
    for _, v22 in ipairs(v21) do
        if v22 ~= game.Players.LocalPlayer and not v_u_4.get_server(v22, "door_locked") then
            return v22
        end
    end
end
local function v_u_28(p24)
    v_u_2.apps.HintApp:hint({
        ["text"] = "Wearing these Heist Gloves, you can rob other people\'s homes.",
        ["overridable"] = true,
        ["length"] = 5,
        ["yields"] = false
    })
    if p24 then
        return
    else
        local v_u_25 = v_u_23()
        if v_u_25 then
            local v26 = v_u_9.get_current_location()
            if v26 then
                if v26.destination_id ~= "housing" or v26.destination_id == "housing" and v26.house_owner == game.Players.LocalPlayer then
                    task.spawn(function()
                        local v27 = {
                            ["destination_id"] = "housing",
                            ["destination_house_owner"] = v_u_25
                        }
                        v_u_2.apps.GuideArrowApp:navigate(v27, nil, nil, nil, "heist_gloves_navigation")
                    end)
                end
            end
        else
            return
        end
    end
end
local function v_u_35(p29, p30)
    local v31 = p30.CFrame:PointToObjectSpace(p29)
    local v32 = v31.X
    if math.abs(v32) > p30.Size.X / 2 then
        return false
    end
    local v33 = v31.Y
    if math.abs(v33) > p30.Size.Y / 2 then
        return false
    end
    local v34 = v31.Z
    return math.abs(v34) <= p30.Size.Z / 2
end
local function v_u_39(p36)
    local v37 = p36:FindFirstChild("PlacementBlock")
    if not v37 then
        return
    end
    for _, v38 in ipairs(v_u_11:GetTagged("vehicle")) do
        if v38:GetAttribute("vehicle_kind") == "moving_truck" and (v38:FindFirstChild("FurnitureWeldBox") and v_u_35(v37.Position, v38.FurnitureWeldBox)) then
            v_u_6.get("RoleplayAPI/WeldFurnitureToMovingTruck"):InvokeServer(p36, v38)
            break
        end
    end
    v37.Anchored = false
end
local function v_u_41()
    if v_u_18 then
        local v40 = game.Players.LocalPlayer.Character
        if v40 then
            v40 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        end
        if v_u_19 and v_u_19.Parent ~= nil then
            if v_u_19:FindFirstChild("HandToFurnitureWeld") and v_u_19:FindFirstChild("PlacementBlock") then
                v_u_20:Stop()
                v_u_19.HandToFurnitureWeld:Destroy()
                if v40 then
                    v_u_19.PlacementBlock.Velocity = v40.CFrame.LookVector * 30 + Vector3.new(0, 20, 0)
                end
                v_u_7.set_model_collision_group(v_u_19, "Default")
                v_u_6.get("RoleplayAPI/ThrowFurniture"):InvokeServer(v_u_19)
                task.delay(3, function()
                    v_u_39(v_u_19)
                end)
                v_u_18 = false
            end
        else
            return
        end
    else
        return
    end
end
local function v_u_45(p_u_42)
    if (v_u_4.get("roleplay_role") or {}).building_id == "criminal_base" then
        p_u_42:SetPrimaryPartCFrame(p_u_42.PrimaryPart.CFrame + Vector3.new(0, 50000, 0))
        return
    elseif not v_u_16 then
        for _, v43 in ipairs(p_u_42:GetDescendants()) do
            if v43:IsA("BasePart") and v43.Transparency < 0.8 then
                v43:SetAttribute("original_transparency", v43.Transparency)
                v43.Transparency = 0.8
            end
        end
        task.delay(20, function()
            for _, v44 in ipairs(p_u_42:GetDescendants()) do
                if v44:IsA("BasePart") and v44:GetAttribute("original_transparency") ~= nil then
                    v44.Transparency = v44:GetAttribute("original_transparency")
                    v44:SetAttribute("original_transparency", nil)
                end
            end
        end)
    end
end
local function v_u_49(p46, p47)
    for _, v48 in ipairs(v_u_15) do
        if v48.furniture_id == p47 and p46.PlacementBlock.Position:FuzzyEq(v48.position) then
            return true
        end
    end
    return false
end
local function v_u_53(p50)
    if v_u_11:HasTag(p50, "is_being_crushed") then
        return false
    end
    local v51 = v_u_14[p50]
    if not v51 then
        return false
    end
    if v51.house_owner == game.Players.LocalPlayer and not v_u_12:IsStudio() then
        return false
    end
    local v52 = v_u_11:HasTag(p50, "is_stolen_furniture_dropped_on_ground")
    return (v51.house_owner ~= nil or v52) and true or false
end
function v_u_13.steal_furniture(p54)
    local v55 = v_u_14[p54]
    assert(v55, "No furniture struct found")
    if v_u_18 then
        return
    else
        v_u_18 = true
        local v56 = v_u_11:HasTag(p54, "is_stolen_furniture_dropped_on_ground")
        local v57 = v_u_6.get("RoleplayAPI/StealFurniture")
        local v58 = {
            ["furniture_id"] = v55.furniture_id
        }
        local v59
        if v56 then
            v59 = p54
        else
            v59 = nil
        end
        v58.furniture_model_dropped_on_ground = v59
        v58.original_model_position = p54.PlacementBlock.Position
        v58.house_owner = v55.house_owner
        local v60 = v57:InvokeServer(v58)
        local v61 = v_u_10.await(v60)
        if typeof(v61) == "Instance" then
            v_u_19 = v61
            local v62 = v61:GetExtentsSize()
            local v63 = v62.X
            local v64 = v62.Y
            local v65 = v62.Z
            local v66 = math.min(v63, v64, v65) > 3
            local v67 = v_u_8.get_track(v66 and "CriminalFurnitureStealingHoldingBigObject" or "CriminalFurnitureStealingHoldingSmallObject")
            v_u_20 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v67)
            v_u_20:Play(0, nil, 0.2)
        else
            v_u_18 = false
        end
    end
end
function v_u_13.create_steal_interaction(p_u_68)
    local v69 = v_u_14[p_u_68]
    assert(v69, "No furniture struct found")
    local v70 = v69.steal_interaction == nil
    assert(v70, "Steal interaction already registered")
    local v71 = v_u_11:HasTag(p_u_68, "is_stolen_furniture_dropped_on_ground")
    if v_u_53(p_u_68) then
        local _, v72 = p_u_68:GetBoundingBox()
        local v73 = v72.Y - 1
        local v74 = v_u_5
        local v75 = {
            ["text"] = v71 and "Pick Up" or "Steal",
            ["part"] = p_u_68.PlacementBlock,
            ["on_selected"] = function()
                v_u_13.steal_furniture(p_u_68)
            end,
            ["is_visible"] = function()
                return not v_u_18
            end
        }
        local v76 = v73 / 2 + 0.5
        v75.offset_relative_to_part_rotation = Vector3.new(0, v76, 0)
        v69.steal_interaction = v74:register(v75)
    end
end
function v_u_13.destroy_steal_interaction(p77)
    local v78 = v_u_14[p77].steal_interaction
    if v78 then
        v78:destroy()
        v_u_14[p77].steal_interaction = nil
    end
end
function v_u_13.register_furniture(p_u_79, p_u_80, p_u_81)
    task.spawn(function()
        local v82 = not v_u_14[p_u_79]
        assert(v82, "Furniture already registered")
        v_u_14[p_u_79] = {
            ["furniture_id"] = p_u_80,
            ["house_owner"] = p_u_81
        }
        if v_u_49(p_u_79, p_u_80) then
            v_u_45(p_u_79)
        end
        if v_u_13.are_heist_gloves_equipped() then
            v_u_13.create_steal_interaction(p_u_79)
        end
    end)
end
function v_u_13.deregister_furniture(p_u_83)
    task.spawn(function()
        local v84 = v_u_14[p_u_83]
        assert(v84, "Unexpected missing furniture model")
        if v_u_17 then
            v_u_13.destroy_steal_interaction(p_u_83)
        end
        v_u_14[p_u_83] = nil
    end)
end
function v_u_13.are_heist_gloves_equipped()
    return v_u_17
end
function v_u_13.are_heist_gloves_active_on_furniture(p85)
    if v_u_13.are_heist_gloves_equipped() then
        return v_u_53(p85) and true or false
    else
        return false
    end
end
function v_u_13.heist_gloves_equipped()
    v_u_17 = true
    for v86, _ in pairs(v_u_14) do
        v_u_13.create_steal_interaction(v86)
    end
    v_u_28(true)
end
function v_u_13.heist_gloves_unequipped()
    v_u_17 = false
    for v87, _ in pairs(v_u_14) do
        v_u_13.destroy_steal_interaction(v87)
    end
    v_u_41()
    v_u_2.apps.GuideArrowApp:cancel_navigation("heist_gloves_navigation")
end
function v_u_13.heist_gloves_use()
    if v_u_18 then
        v_u_41()
    else
        v_u_28()
    end
end
local function v_u_92(p88)
    if p88:GetAttribute("stolen_furniture_house_owner_name") == game.Players.LocalPlayer.Name then
        local function v90(p89)
            if p89:IsA("BasePart") then
                if v_u_16 then
                    p89:SetAttribute("stolen_furniture_old_transparency", p89.Transparency)
                    p89.Transparency = 1
                    return
                end
                if p89.Transparency == 1 and p89:GetAttribute("stolen_furniture_old_transparency") then
                    p89.Transparency = p89:GetAttribute("stolen_furniture_old_transparency")
                    p89:SetAttribute("stolen_furniture_old_transparency", nil)
                end
            end
        end
        for _, v91 in ipairs(p88:GetDescendants()) do
            v90(v91)
        end
        if not p88:GetAttribute("is_furniture_descendant_tracking_on") then
            p88:SetAttribute("is_furniture_descendant_tracking_on", true)
            p88.DescendantAdded:Connect(v90)
        end
    end
end
function v_u_13.set_furniture_stealing_in_your_home_visuals_disabled(p93)
    v_u_16 = p93
    for _, v94 in ipairs(v_u_11:GetTagged("is_stolen_furniture")) do
        v_u_92(v94)
    end
end
function v_u_13.init() end
return v_u_13