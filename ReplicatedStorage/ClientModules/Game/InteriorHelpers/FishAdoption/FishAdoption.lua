--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.FishAdoption (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("PetPerformanceName")
local v_u_3 = v1("InteractionsEngine")
local v_u_4 = v1("ClientToolManager")
local v_u_5 = v1("PetMovementTarget")
local v_u_6 = v1("PetEntityManager")
local v_u_7 = v1("CollisionsClient")
local v_u_8 = v1("ToolHandleHelper")
local v_u_9 = v1("PetEntityHelper")
local v_u_10 = v1("RouterClient")
local v_u_11 = v1("InventoryDB")
local v_u_12 = v1("ClientData")
local v_u_13 = v1("UIManager")
local v_u_14 = v1("TableUtil")
local v_u_15 = v1("Utilities")
local v_u_16 = v1("Debug")
local v17 = v1("Maid")
local v_u_18 = v1("package:Promise")
local v_u_19 = {
    { "Splish splish, I\'m a fish! Who...are you?", 5 },
    { "Who said I\'m all scaly? What a fish-ous rumor.", 5.5 },
    { "I\'m hooked!", 2 },
    { "Do you come from Finland?", 3 },
    { "Don\226\128\153t be koi, tell me your best fish joke.", 5 },
    { "I found him! Wait...no, that\'s a different guy.", 5.5 },
    { "Swim swim, turn! Swim, swim, turn!", 4.5 },
    { "*Ouch, I think I pulled a mussel.", 4 },
    { "Do you have food?!", 2.5 },
    { "Fish me up outta here! There so much more of the world I want to see!", 7 },
    { "I\'m a flying fish! ooff...okay, no I\'m not.", 5.5 }
}
local v_u_20 = Random.new()
local v_u_21 = {}
local v_u_22 = {
    ["beach_2024_mahi_mahi"] = {},
    ["beach_2024_gold_mahi_mahi"] = {},
    ["beach_2024_diamond_mahi_mahi"] = {}
}
local v_u_23 = v17.new()
local v24 = {}
local function v_u_36(p25, p26)
    local v27 = tick()
    while true do
        local v28 = {}
        for _, v29 in p25 do
            if (p26.PrimaryPart.Position - v29.base.root.Position).Magnitude > 20 then
                table.insert(v28, v29)
            end
        end
        if #v28 == 0 then
            return
        end
        if tick() - v27 > 7 then
            for _, v30 in v28 do
                local v31 = v30.base.root
                local v32 = CFrame.new
                local v33 = p26.PrimaryPart.Position
                local v34 = math.random(-20, 20) / 10
                local v35 = math.random(-20, 20) / 10
                v31.CFrame = v32(v33 + Vector3.new(v34, 5, v35))
            end
            return
        end
        task.wait(0.3)
    end
end
local function v_u_44(p37)
    for _, v38 in p37.ThrowZones:GetChildren() do
        local v39 = game.Players.LocalPlayer.Character
        if v39 then
            v39 = v39:FindFirstChild("HumanoidRootPart")
        end
        if not v39 then
            return false
        end
        local v40 = v38.CFrame:PointToObjectSpace(v39.Position)
        local v41 = v40.X
        if math.abs(v41) < v38.Size.X / 2 then
            local v42 = v40.Y
            if math.abs(v42) < v38.Size.Y / 2 then
                local v43 = v40.Z
                if math.abs(v43) < v38.Size.Z / 2 then
                    return true, nil
                end
            end
        end
    end
    return false, ("You need to get closer to the %s to use this"):format("Mahi Mahi")
end
local function v_u_92(p_u_45)
    local v_u_46 = workspace:WaitForChild("Interiors"):FindFirstChild("BeachShop")
    if v_u_46 then
        local v47, v48 = v_u_44(v_u_46)
        if v47 then
            local v_u_49 = nil
            local v_u_50 = nil
            local v_u_51 = nil
            local v_u_52 = nil
            v_u_18.try(function()
                for _, v_u_53 in v_u_12.get("inventory").food do
                    if v_u_53.kind == "beach_2024_mahi_spinning_rod_temporary" then
                        v_u_49 = v_u_53
                        return v_u_18.all({ v_u_4.get_equip_manager_changed_promise(function(p54)
                                local v55 = false
                                for _, v56 in p54 do
                                    for _, v57 in v56 do
                                        if v57.kind == "beach_2024_mahi_spinning_rod_temporary" then
                                            v55 = true
                                        elseif v57.kind == "beach_2024_mahi_spinning_rod" then
                                            return false
                                        end
                                    end
                                end
                                return v55 and true or false
                            end), v_u_18.new(function(p58, p59)
                                local v60, v61 = v_u_4.equip(v_u_53)
                                if v60 then
                                    p58()
                                else
                                    p59("FishAdoption Error: " .. v61)
                                end
                            end) }):timeout(3, "FishAdoption Timeout: Failed to equip beach_2024_mahi_spinning_rod_temporary")
                    end
                end
                return v_u_18.reject("FishAdoption Error: beach_2024_mahi_spinning_rod_temporary not found in inventory")
            end):andThen(function()
                v_u_50 = v_u_8.get_equipped_tool_model_handle()
                if v_u_50 then
                    return v_u_18.resolve()
                else
                    return v_u_18.fromEvent(game.Players.LocalPlayer.Character.ChildAdded, function(p62)
                        v_u_50 = p62:IsA("Tool") and p62:FindFirstChild("ModelHandle")
                        return v_u_50 and true or false
                    end):timeout(3, "FishAdoption Timeout: beach_2024_mahi_spinning_rod_temporary model handle was never equipped")
                end
            end):andThen(function()
                local v63 = game.Players.LocalPlayer.Character.HumanoidRootPart
                v_u_51 = v_u_50.Bobber:Clone()
                v_u_50.Bobber:Destroy()
                v_u_52 = v_u_51.PrimaryPart
                v_u_51.Parent = workspace
                v_u_51:BreakJoints()
                v_u_7.set_model_collision_group(v_u_51, "players")
                for _, v64 in v_u_51:GetDescendants() do
                    if v64:IsA("BasePart") then
                        v_u_15.weld(v64, v_u_52)
                        v64.CanCollide = true
                        v64.Massless = false
                    end
                end
                v_u_52.Velocity = v63.CFrame.LookVector * 30 + Vector3.new(0, 20, 0)
                local v65 = v_u_52
                local v66 = math.random()
                local v67 = math.random()
                local v68 = math.random
                v65.RotVelocity = Vector3.new(v66, v67, v68()) * 12
                local v69 = Instance.new("Beam")
                v69.Color = ColorSequence.new(Color3.new(0.93, 0.918, 0.918))
                v69.FaceCamera = true
                v69.Transparency = NumberSequence.new(0)
                v69.Width0 = 0.08
                v69.Width1 = 0.08
                v69.CurveSize0 = 0.1
                v69.CurveSize1 = -0.1
                v69.Attachment0 = v_u_50.Rod.RopePartStart.RopeAttachment
                v69.Attachment1 = v_u_51.RopePartEnd.RopeAttachment
                v69.Parent = v_u_50.Rod.RopePartStart
                return v_u_18.race({ v_u_18.fromEvent(v_u_52.Touched, function(p70)
                        local v71
                        if p70.Name == "CatchZone" then
                            v71 = p70.Parent == v_u_46.CatchZones
                        else
                            v71 = false
                        end
                        return v71
                    end), v_u_18.delay(3):andThen(function()
                        v_u_13.apps.DialogApp:dialog({
                            ["text"] = "The Mahi Mahi can\'t reach your bait!",
                            ["button"] = "Okay",
                            ["yields"] = false
                        })
                        return v_u_18.reject()
                    end) })
            end):andThen(function()
                task.wait(0.5)
                local v72 = v_u_10.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("beach_2024_mahi_spinning_rod", p_u_45)
                if not v72 then
                    return v_u_18.reject("FishAdoption Error: ExchangeItemForReward returned nil")
                end
                local v73 = v72[1]
                local v74 = v73.kind
                local v75 = v73.unique
                local v76 = v_u_22[v74]
                local v77 = v76[v_u_20:NextInteger(1, #v76)]
                local v78 = v77.base.root.CFrame
                for _, v79 in v_u_21 do
                    local v80 = v_u_52
                    local v81 = 4 + 10 * math.random()
                    v_u_9.end_performance(v79, v_u_2.WanderAimlessly)
                    local v82 = v_u_9.stage_performance
                    local v83 = {
                        ["name"] = v_u_2.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_5.from_target_and_follow_distance(v80, v81)
                        }
                    }
                    v82(v79, v83)
                end
                v_u_36(v_u_21, v_u_51)
                for _, v84 in v_u_51:GetDescendants() do
                    if v84:IsA("BasePart") then
                        v84.CanCollide = false
                        v84.Anchored = true
                    end
                end
                task.wait(2)
                local v85 = v_u_9.stage_performance
                local v86 = {
                    ["name"] = v_u_2.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_5.from_target_and_follow_distance(v_u_52, 1)
                    }
                }
                v85(v77, v86)
                v77.base.humanoid.Jump = true
                v_u_13.apps.SpeechBubbleApp:create(v77.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                task.wait(1)
                local v87 = v_u_9.stage_performance
                local v88 = {
                    ["name"] = v_u_2.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = "Beach2024MahiMahiEat"
                    }
                }
                v87(v77, v88)
                task.wait(1)
                v_u_9.stage_performance(v77, {
                    ["name"] = v_u_2.AnchorInPlace
                })
                for _, v89 in v_u_21 do
                    if v89 ~= v77 then
                        v_u_9.end_performance(v89, v_u_2.TargetProvider)
                        v_u_9.stage_performance(v89, {
                            ["name"] = v_u_2.WanderAimlessly
                        })
                    end
                end
                task.wait(6)
                v_u_9.end_performance(v77, v_u_2.AnchorInPlace)
                v_u_9.end_performance(v77, v_u_2.AnimationProvider)
                v_u_9.stage_performance(v77, {
                    ["name"] = v_u_2.WanderAimlessly
                })
                local v90 = v77.base.root.CFrame
                v77.base.root.CFrame = v78
                v_u_10.get("ToolAPI/Equip"):InvokeServer(v75, {
                    ["spawn_cframe"] = v90
                })
                return v_u_18.resolve()
            end):catch(function(p91)
                if p91 then
                    warn((tostring(p91)))
                end
            end):finally(function()
                if v_u_51 then
                    v_u_51:Destroy()
                end
                if not v_u_10.get("ToolAPI/Equip"):InvokeServer(p_u_45) then
                    v_u_10.get("ToolAPI/Unequip"):InvokeServer(v_u_49.unique)
                end
            end)
        else
            v_u_13.apps.DialogApp:dialog({
                ["text"] = v48,
                ["button"] = "Okay"
            })
        end
    else
        v_u_13.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Beach Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
function v24.render(p_u_93)
    for _, v94 in p_u_93.PetGates:GetChildren() do
        v94.CollisionGroup = "roaming_pet_gate"
    end
    local v_u_95 = p_u_93.AdoptablePets:Clone()
    v_u_23:GiveTask(function()
        p_u_93.AdoptablePets:Destroy()
        v_u_95.Parent = p_u_93
    end)
    for _, v96 in p_u_93.AdoptablePets:GetChildren() do
        v_u_7.set_model_collision_group(v96, "roaming_pets")
        v96.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
        local v97 = v96.Name
        local v98 = v_u_22[v97]
        assert(v98, ("%s is not a valid adoptable pet kind"):format(v97))
        local v99 = v_u_14.deep_copy(v_u_11.pets[v97])
        v99.anims.running = "Beach2024MahiMahiRun"
        local v100 = v_u_6.create_pet_entity(v96, v99)
        v_u_9.stage_performance(v100, {
            ["name"] = v_u_2.WanderAimlessly
        })
        local v101 = v_u_21
        table.insert(v101, v100)
        local v102 = v_u_22[v97]
        table.insert(v102, v100)
    end
end
function v24.cleanup(_)
    for _, v103 in v_u_21 do
        v_u_6.remove_pet_entity_by_entity(v103)
    end
    v_u_21 = {}
    for v104, _ in v_u_22 do
        v_u_22[v104] = {}
    end
    v_u_23:DoCleaning()
end
local v_u_105 = false
function v24.go_fishing(...)
    if not v_u_105 then
        v_u_105 = true
        local v_u_106 = { ... }
        v_u_16.pcall_warn_error(function()
            local v107 = v_u_106
            v_u_92(unpack(v107))
        end)
        v_u_105 = false
    end
end
function v24.add_dialog(p_u_108)
    local function v111()
        local v109 = v_u_6.get_pet_entity(p_u_108)
        v_u_9.stage_performance(v109, {
            ["name"] = v_u_2.AnchorInPlace
        })
        for _, v_u_110 in v_u_19[math.random(1, #v_u_19)] do
            if typeof(v_u_110) == "string" then
                pcall(function()
                    v_u_13.apps.SpeechBubbleApp:create(p_u_108.PetModel.Head, v_u_110)
                end)
            else
                task.wait(v_u_110)
            end
        end
        v_u_9.end_performance(v109, v_u_2.AnchorInPlace)
    end
    return v_u_3:register({
        ["text"] = "Talk",
        ["part"] = p_u_108.PetModel.HumanoidRootPart,
        ["on_selected"] = v111,
        ["offset"] = Vector3.new(0, 0, 0),
        ["is_visible"] = function()
            return not v_u_105
        end
    })
end
return v24