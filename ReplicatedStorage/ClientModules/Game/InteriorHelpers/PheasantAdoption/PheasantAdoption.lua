--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.PheasantAdoption (ModuleScript)

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
    { "Pheasants, stay pleasant!", 4 },
    { "Turkeys make a whole lot of noise about themselves... gobble this, gobble that", 7 },
    { "My tailfeather\'s almost as long as the word tailfeather!", 5 },
    { "Try to keep up, we\'re a fast bird!", 6 },
    { "They say pheasants are good luck, why not try your odds?", 6 },
    { "Isn\'t this just the coziest weather?", 5 },
    { "LET ME HAVE A GOLDEN WHEAT STALK!!!", 5 },
    { "*gobble gobble gobble*... that was my Turkey impression!", 6 },
    { "The way to my heart is with a Golden Wheat Stalk!", 6 },
    { "I just want to sunbathe in a wheat field! Is that so much to ask for?", 7 }
}
local v_u_18 = {
    ["fall_2022_pheasant_black"] = {
        { "It\'s not just a phase, mom! Goth for life!", 6 }
    }
}
local v_u_19 = Random.new()
local v_u_20 = {}
local v_u_21 = {
    ["fall_2022_pheasant_brown"] = {},
    ["fall_2022_pheasant_green"] = {},
    ["fall_2022_pheasant_black"] = {}
}
local function v_u_33(p22, p23)
    local v24 = tick()
    while true do
        local v25 = {}
        for _, v26 in ipairs(p22) do
            if (p23.Head.Position - v26.base.root.Position).Magnitude > 20 then
                table.insert(v25, v26)
            end
        end
        if #v25 == 0 then
            return
        end
        if tick() - v24 > 7 then
            for _, v27 in pairs(v25) do
                local v28 = v27.base.root
                local v29 = CFrame.new
                local v30 = p23.Head.Position
                local v31 = math.random(-20, 20) / 10
                local v32 = math.random(-20, 20) / 10
                v28.CFrame = v29(v30 + Vector3.new(v31, 5, v32))
            end
            return
        end
        task.wait(0.3)
    end
end
function v15.start(p_u_34)
    for _, v35 in ipairs(p_u_34.PetGates:GetChildren()) do
        v35.CollisionGroup = "roaming_pet_gate"
    end
    local v_u_36 = p_u_34.AdoptablePets:Clone()
    v_u_16:GiveTask(function()
        p_u_34.AdoptablePets:Destroy()
        v_u_36.Parent = p_u_34
    end)
    for _, v37 in pairs(p_u_34.AdoptablePets:GetChildren()) do
        v_u_13.set_model_collision_group(v37, "roaming_pets")
        local v38 = v37.Name
        local v39 = v_u_21[v38]
        assert(v39, ("%s is not a valid adoptable pet kind"):format(v38))
        local v40 = v_u_8.deep_copy(v_u_2.pets[v38])
        v40.anims.running = "PheasantRun"
        local v41 = v_u_10.create_pet_entity(v37, v40)
        v_u_11.stage_performance(v41, {
            ["name"] = v_u_3.WanderAimlessly
        })
        local v42 = v_u_20
        table.insert(v42, v41)
        local v43 = v_u_21[v38]
        table.insert(v43, v41)
    end
end
function v15.stop(_)
    for _, v44 in ipairs(v_u_20) do
        v_u_10.remove_pet_entity_by_entity(v44)
    end
    v_u_20 = {}
    for v45, _ in pairs(v_u_21) do
        v_u_21[v45] = {}
    end
    v_u_16:DoCleaning()
end
local function v_u_54(p46)
    local v47 = p46.ThrowZones
    for _, v48 in ipairs(v47:GetChildren()) do
        local v49 = game.Players.LocalPlayer.Character
        if v49 then
            v49 = v49:FindFirstChild("HumanoidRootPart")
        end
        if not v49 then
            return false
        end
        local v50 = v48.CFrame:PointToObjectSpace(v49.Position)
        local v51 = v50.X
        if math.abs(v51) < v48.Size.X / 2 then
            local v52 = v50.Y
            if math.abs(v52) < v48.Size.Y / 2 then
                local v53 = v50.Z
                if math.abs(v53) < v48.Size.Z / 2 then
                    return true, nil
                end
            end
        end
    end
    return false, "You need to get closer to the pheasants to use this"
end
local function v_u_86(p55, p56)
    local v57 = workspace:WaitForChild("Interiors"):FindFirstChild("FallShop")
    if v57 then
        local v58, v59 = v_u_54(v57)
        if v58 then
            local v60 = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v61 = p55:Clone()
            p55:Destroy()
            v61.Parent = workspace
            v61:BreakJoints()
            v_u_13.set_model_collision_group(v61, "roaming_pets")
            for _, v62 in ipairs(v61:GetDescendants()) do
                if v62:IsA("BasePart") then
                    v_u_6.weld(v62, v61.Head)
                    v62.CanCollide = true
                end
            end
            v61.Head.Velocity = v60.CFrame.LookVector * 30 + Vector3.new(0, 20, 0)
            local v63 = v61.Head
            local v64 = math.random()
            local v65 = math.random()
            local v66 = math.random
            v63.RotVelocity = Vector3.new(v64, v65, v66()) * 12
            task.wait(0.5)
            local v67 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("fall_2022_golden_wheat_stalk", p56)
            if v67 then
                local v68 = v67[1]
                local v69 = v68.kind
                local v70 = v68.unique
                local v71 = v_u_21[v69]
                local v72 = v71[v_u_19:NextInteger(1, #v71)]
                local v73 = v72.base.root.CFrame
                for _, v74 in ipairs(v_u_20) do
                    local v75 = v61.Head
                    local v76 = 4 + 10 * math.random()
                    v_u_11.end_performance(v74, v_u_3.WanderAimlessly)
                    local v77 = v_u_11.stage_performance
                    local v78 = {
                        ["name"] = v_u_3.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_12.from_target_and_follow_distance(v75, v76)
                        }
                    }
                    v77(v74, v78)
                end
                v_u_33(v_u_20, v61)
                for _, v79 in ipairs(v61:GetDescendants()) do
                    if v79:IsA("BasePart") then
                        v79.CanCollide = false
                        v79.Anchored = true
                    end
                end
                task.wait(2)
                local v80 = v_u_11.stage_performance
                local v81 = {
                    ["name"] = v_u_3.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_12.from_target_and_follow_distance(v61.Head, 1)
                    }
                }
                v80(v72, v81)
                v72.base.humanoid.Jump = true
                v_u_4.apps.SpeechBubbleApp:create(v72.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                task.wait(1)
                local v82 = v_u_11.stage_performance
                local v83 = {
                    ["name"] = v_u_3.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = "PheasantEat"
                    }
                }
                v82(v72, v83)
                task.wait(1)
                v_u_11.stage_performance(v72, {
                    ["name"] = v_u_3.AnchorInPlace
                })
                for _, v84 in ipairs(v_u_20) do
                    if v84 ~= v72 then
                        v_u_11.end_performance(v84, v_u_3.TargetProvider)
                        v_u_11.stage_performance(v84, {
                            ["name"] = v_u_3.WanderAimlessly
                        })
                    end
                end
                task.wait(6)
                v_u_11.end_performance(v72, v_u_3.AnchorInPlace)
                v_u_11.end_performance(v72, v_u_3.AnimationProvider)
                v61:Destroy()
                v_u_11.stage_performance(v72, {
                    ["name"] = v_u_3.WanderAimlessly
                })
                local v85 = v72.base.root.CFrame
                v72.base.root.CFrame = v73
                v_u_5.get("ToolAPI/Equip"):InvokeServer(v70, {
                    ["spawn_cframe"] = v85
                })
            end
        else
            v_u_4.apps.DialogApp:dialog({
                ["text"] = v59,
                ["button"] = "Okay"
            })
            return
        end
    else
        v_u_4.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Fall Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
local v_u_87 = false
function v15.throw_food(...)
    if not v_u_87 then
        v_u_87 = true
        local v_u_88 = { ... }
        v_u_7.pcall_warn_error(function()
            local v89 = v_u_88
            v_u_86(unpack(v89))
        end)
        v_u_87 = false
    end
end
function v15.add_dialog(p_u_90)
    local function v95()
        local v91 = v_u_10.get_pet_entity(p_u_90)
        v_u_11.stage_performance(v91, {
            ["name"] = v_u_3.AnchorInPlace
        })
        local v92 = v_u_14.List.concat(v_u_17, v_u_18[v91.base.entry.kind])
        local v93 = v92[math.random(1, #v92)]
        for _, v_u_94 in pairs(v93) do
            if typeof(v_u_94) == "string" then
                pcall(function()
                    v_u_4.apps.SpeechBubbleApp:create(p_u_90.PetModel.Head, v_u_94)
                end)
            else
                task.wait(v_u_94)
            end
        end
        v_u_11.end_performance(v91, v_u_3.AnchorInPlace)
    end
    return v_u_9:register({
        ["text"] = "Talk",
        ["part"] = p_u_90.PetModel.HumanoidRootPart,
        ["on_selected"] = v95,
        ["offset"] = Vector3.new(0, 0, 0),
        ["is_visible"] = function()
            return not v_u_87
        end
    })
end
return v15