--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.HamsterAdoption (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("Utilities")
local v_u_7 = v1("Debug")
local v_u_8 = v1("TableUtil")
local v_u_9 = v1("InteractionsEngine")
local v_u_10 = v1("PetEntityManager")
local v_u_11 = v1("PetEntityHelper")
local v_u_12 = v1("PetMovementTarget")
local v_u_13 = v1("CollisionsClient")
local v_u_14 = v1("package:Sift")
local v15 = {}
local v_u_16 = v1("Maid").new()
local v_u_17 = {
    { "*squeak*", 3 },
    { "*SQUEAK*", 3 },
    { "*squeak!*", 3 },
    { "*SQUEAK!!!*", 3 },
    { "Timmy is here. Martha is here. Bob, Clobbo and Zam are here. Where\'s Boo?", 6 },
    { "Hey, hey, get out of my way! Today is the day for...I forgot what I was going to say...", 6 },
    { "Have you heard of the invisible purple hamster? No? Huh.", 5 },
    { "What time is it?", 4 },
    { "Oooh yummy! Golden Corn!", 4 }
}
local v_u_18 = Random.new()
local v_u_19 = {}
local v_u_20 = {
    ["hamstertime_2024_hamster"] = {},
    ["hamstertime_2024_golden_hamster"] = {},
    ["hamstertime_2024_diamond_hamster"] = {}
}
local function v_u_32(p21, p22)
    local v23 = tick()
    while true do
        local v24 = {}
        for _, v25 in ipairs(p21) do
            if (p22.Head.Position - v25.base.root.Position).Magnitude > 20 then
                table.insert(v24, v25)
            end
        end
        if #v24 == 0 then
            return
        end
        if tick() - v23 > 7 then
            for _, v26 in pairs(v24) do
                local v27 = v26.base.root
                local v28 = CFrame.new
                local v29 = p22.Head.Position
                local v30 = math.random(-20, 20) / 10
                local v31 = math.random(-20, 20) / 10
                v27.CFrame = v28(v29 + Vector3.new(v30, 5, v31))
            end
            return
        end
        task.wait(0.3)
    end
end
function v15.start(p_u_33)
    for _, v34 in ipairs(p_u_33.PetGates:GetChildren()) do
        v34.CollisionGroup = "roaming_pet_gate"
    end
    local v_u_35 = p_u_33.AdoptablePets:Clone()
    v_u_16:GiveTask(function()
        p_u_33.AdoptablePets:Destroy()
        v_u_35.Parent = p_u_33
    end)
    for _, v36 in pairs(p_u_33.AdoptablePets:GetChildren()) do
        v_u_13.set_model_collision_group(v36, "roaming_pets")
        local v37 = v36.Name
        local v38 = v_u_20[v37]
        assert(v38, ("%s is not a valid adoptable pet kind"):format(v37))
        local v39 = v_u_8.deep_copy(v_u_2.pets[v37])
        v39.anims.running = "Hamstertime2024HamsterRun"
        local v40 = v_u_10.create_pet_entity(v36, v39)
        v_u_11.stage_performance(v40, {
            ["name"] = v_u_3.WanderAimlessly
        })
        local v41 = v_u_19
        table.insert(v41, v40)
        local v42 = v_u_20[v37]
        table.insert(v42, v40)
    end
end
function v15.stop(_)
    for _, v43 in ipairs(v_u_19) do
        v_u_10.remove_pet_entity_by_entity(v43)
    end
    v_u_19 = {}
    for v44, _ in pairs(v_u_20) do
        v_u_20[v44] = {}
    end
    v_u_16:DoCleaning()
end
local function v_u_53(p45)
    local v46 = p45.ThrowZones
    for _, v47 in ipairs(v46:GetChildren()) do
        local v48 = game.Players.LocalPlayer.Character
        if v48 then
            v48 = v48:FindFirstChild("HumanoidRootPart")
        end
        if not v48 then
            return false
        end
        local v49 = v47.CFrame:PointToObjectSpace(v48.Position)
        local v50 = v49.X
        if math.abs(v50) < v47.Size.X / 2 then
            local v51 = v49.Y
            if math.abs(v51) < v47.Size.Y / 2 then
                local v52 = v49.Z
                if math.abs(v52) < v47.Size.Z / 2 then
                    return true, nil
                end
            end
        end
    end
    return false, "You need to get closer to the hamsters to use this"
end
local function v_u_85(p54, p55)
    local v56 = workspace:WaitForChild("Interiors"):FindFirstChild("PetShop")
    if v56 then
        local v57, v58 = v_u_53(v56)
        if v57 then
            local v59 = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v60 = p54:Clone()
            p54:Destroy()
            v60.Parent = workspace
            v60:BreakJoints()
            v_u_13.set_model_collision_group(v60, "roaming_pets")
            for _, v61 in ipairs(v60:GetDescendants()) do
                if v61:IsA("BasePart") then
                    v_u_6.weld(v61, v60.Head)
                    v61.CanCollide = true
                end
            end
            v60.Head.Velocity = v59.CFrame.LookVector * 30 + Vector3.new(0, 20, 0)
            local v62 = v60.Head
            local v63 = math.random()
            local v64 = math.random()
            local v65 = math.random
            v62.RotVelocity = Vector3.new(v63, v64, v65()) * 12
            task.wait(0.5)
            local v66 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("hamstertime_2024_golden_corn", p55)
            if v66 then
                local v67 = v66[1]
                local v68 = v67.kind
                local v69 = v67.unique
                local v70 = v_u_20[v68]
                local v71 = v70[v_u_18:NextInteger(1, #v70)]
                local v72 = v71.base.root.CFrame
                for _, v73 in ipairs(v_u_19) do
                    local v74 = v60.Head
                    local v75 = 4 + 10 * math.random()
                    v_u_11.end_performance(v73, v_u_3.WanderAimlessly)
                    local v76 = v_u_11.stage_performance
                    local v77 = {
                        ["name"] = v_u_3.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_12.from_target_and_follow_distance(v74, v75)
                        }
                    }
                    v76(v73, v77)
                end
                v_u_32(v_u_19, v60)
                for _, v78 in ipairs(v60:GetDescendants()) do
                    if v78:IsA("BasePart") then
                        v78.CanCollide = false
                        v78.Anchored = true
                    end
                end
                task.wait(2)
                local v79 = v_u_11.stage_performance
                local v80 = {
                    ["name"] = v_u_3.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_12.from_target_and_follow_distance(v60.Head, 1)
                    }
                }
                v79(v71, v80)
                v71.base.humanoid.Jump = true
                v_u_4.apps.SpeechBubbleApp:create(v71.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                task.wait(1)
                local v81 = v_u_11.stage_performance
                local v82 = {
                    ["name"] = v_u_3.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = "Hamstertime2024HamsterEat"
                    }
                }
                v81(v71, v82)
                task.wait(1)
                v_u_11.stage_performance(v71, {
                    ["name"] = v_u_3.AnchorInPlace
                })
                for _, v83 in ipairs(v_u_19) do
                    if v83 ~= v71 then
                        v_u_11.end_performance(v83, v_u_3.TargetProvider)
                        v_u_11.stage_performance(v83, {
                            ["name"] = v_u_3.WanderAimlessly
                        })
                    end
                end
                task.wait(6)
                v_u_11.end_performance(v71, v_u_3.AnchorInPlace)
                v_u_11.end_performance(v71, v_u_3.AnimationProvider)
                v60:Destroy()
                v_u_11.stage_performance(v71, {
                    ["name"] = v_u_3.WanderAimlessly
                })
                local v84 = v71.base.root.CFrame
                v71.base.root.CFrame = v72
                v_u_5.get("ToolAPI/Equip"):InvokeServer(v69, {
                    ["spawn_cframe"] = v84
                })
            end
        else
            v_u_4.apps.DialogApp:dialog({
                ["text"] = v58,
                ["button"] = "Okay"
            })
            return
        end
    else
        v_u_4.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Pet Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
local v_u_86 = false
function v15.throw_food(...)
    if not v_u_86 then
        v_u_86 = true
        local v_u_87 = { ... }
        v_u_7.pcall_warn_error(function()
            local v88 = v_u_87
            v_u_85(unpack(v88))
        end)
        v_u_86 = false
    end
end
function v15.add_dialog(p_u_89)
    local function v94()
        local v90 = v_u_10.get_pet_entity(p_u_89)
        v_u_11.stage_performance(v90, {
            ["name"] = v_u_3.AnchorInPlace
        })
        local v91 = v_u_14.List.concat(v_u_17)
        local v92 = v91[math.random(1, #v91)]
        for _, v_u_93 in pairs(v92) do
            if typeof(v_u_93) == "string" then
                pcall(function()
                    v_u_4.apps.SpeechBubbleApp:create(p_u_89.PetModel.Head, v_u_93)
                end)
            else
                task.wait(v_u_93)
            end
        end
        v_u_11.end_performance(v90, v_u_3.AnchorInPlace)
    end
    return v_u_9:register({
        ["text"] = "Talk",
        ["part"] = p_u_89.PetModel.HumanoidRootPart,
        ["on_selected"] = v94,
        ["offset"] = Vector3.new(0, 0, 0),
        ["is_visible"] = function()
            return not v_u_86
        end
    })
end
return v15