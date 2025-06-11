--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.ScarabAdoption (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("Utilities")
local v_u_7 = v1("Debug")
local v_u_8 = v1("TableUtil")
local v_u_9 = v1("InteractionsEngine")
local v_u_10 = v1("ClientData")
local v_u_11 = v1("PetEntityManager")
local v_u_12 = v1("PetEntityHelper")
local v_u_13 = v1("PetMovementTarget")
local v_u_14 = v1("CollisionsClient")
local v15 = {}
local v_u_16 = {
    { "Ra, Ra, Ra ra ra ra...", 4 },
    { "Beetle like mud ball... mud ball perfect for scarab beetle...", 7 },
    { "Number 2 is the number 1 for me...", 5 },
    { "Morning sun rises with the scarab beetles!", 6 }
}
local v_u_17 = { "What\'s that smell? Mmm... delicious", 5 }
local v_u_18 = Random.new()
local v_u_19 = {}
local v_u_20 = {
    ["desert_2022_black_scarab"] = {},
    ["desert_2022_gold_scarab"] = {},
    ["desert_2022_blue_scarab"] = {}
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
function v15.start(p33)
    for _, v34 in ipairs(p33.PetGates:GetChildren()) do
        v34.CollisionGroup = "roaming_pet_gate"
    end
    for _, v35 in pairs(p33.AdoptablePets:GetChildren()) do
        v_u_14.set_model_collision_group(v35, "roaming_pets")
        local v36 = v35.Name
        local v37 = v_u_20[v36]
        assert(v37, ("%s is not a valid adoptable pet kind"):format(v36))
        local v38 = v_u_8.deep_copy(v_u_2.pets[v36])
        v38.anims.running = "ScarabRun"
        local v39 = v_u_11.create_pet_entity(v35, v38)
        v_u_12.stage_performance(v39, {
            ["name"] = v_u_3.WanderAimlessly
        })
        local v40 = v_u_19
        table.insert(v40, v39)
        local v41 = v_u_20[v36]
        table.insert(v41, v39)
    end
end
function v15.stop(_)
    for _, v42 in ipairs(v_u_19) do
        v_u_11.remove_pet_entity_by_entity(v42)
    end
    v_u_19 = {}
    for v43, _ in pairs(v_u_20) do
        v_u_20[v43] = {}
    end
end
local function v_u_50(p44)
    local v45 = p44.ThrowZone
    local v46 = game.Players.LocalPlayer.Character
    if v46 then
        v46 = v46:FindFirstChild("HumanoidRootPart")
    end
    if not v46 then
        return false
    end
    local v47 = v45.CFrame:PointToObjectSpace(v46.Position)
    local v48 = v47.X
    if math.abs(v48) < v45.Size.X / 2 then
        local v49 = v47.Z
        if math.abs(v49) < v45.Size.Z / 2 then
            return true, nil
        end
    end
    return false, "You need to get closer to the scarabs to use this"
end
local function v_u_82(p51, p52)
    local v53 = workspace:WaitForChild("Interiors"):FindFirstChild("DesertShop")
    if v53 then
        local v54, v55 = v_u_50(v53)
        if v54 then
            local v56 = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v57 = p51:Clone()
            p51:Destroy()
            v57.Parent = workspace
            v57:BreakJoints()
            v_u_14.set_model_collision_group(v57, "roaming_pets")
            for _, v58 in ipairs(v57:GetDescendants()) do
                if v58:IsA("BasePart") then
                    v_u_6.weld(v58, v57.Head)
                    v58.CanCollide = true
                end
            end
            v57.Head.Velocity = v56.CFrame.LookVector * 60 + Vector3.new(0, 20, 0)
            local v59 = v57.Head
            local v60 = math.random()
            local v61 = math.random()
            local v62 = math.random
            v59.RotVelocity = Vector3.new(v60, v61, v62()) * 12
            task.wait(0.5)
            local v63 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("desert_2022_mud_ball", p52)
            if v63 then
                local v64 = v63[1]
                local v65 = v64.kind
                local v66 = v64.unique
                local v67 = v_u_20[v65]
                local v68 = v67[v_u_18:NextInteger(1, #v67)]
                local v69 = v68.base.root.CFrame
                for _, v70 in ipairs(v_u_19) do
                    local v71 = v57.Head
                    local v72 = 4 + 10 * math.random()
                    v_u_12.end_performance(v70, v_u_3.WanderAimlessly)
                    local v73 = v_u_12.stage_performance
                    local v74 = {
                        ["name"] = v_u_3.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_13.from_target_and_follow_distance(v71, v72)
                        }
                    }
                    v73(v70, v74)
                end
                v_u_32(v_u_19, v57)
                for _, v75 in ipairs(v57:GetDescendants()) do
                    if v75:IsA("BasePart") then
                        v75.CanCollide = false
                        v75.Anchored = true
                    end
                end
                task.wait(2)
                local v76 = v_u_12.stage_performance
                local v77 = {
                    ["name"] = v_u_3.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_13.from_target_and_follow_distance(v57.Head, 1)
                    }
                }
                v76(v68, v77)
                v68.base.humanoid.Jump = true
                v_u_4.apps.SpeechBubbleApp:create(v68.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                task.wait(1)
                local v78 = v_u_12.stage_performance
                local v79 = {
                    ["name"] = v_u_3.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = "ScarabEat"
                    }
                }
                v78(v68, v79)
                task.wait(1)
                v_u_12.stage_performance(v68, {
                    ["name"] = v_u_3.AnchorInPlace
                })
                for _, v80 in ipairs(v_u_19) do
                    if v80 ~= v68 then
                        v_u_12.end_performance(v80, v_u_3.TargetProvider)
                        v_u_12.stage_performance(v80, {
                            ["name"] = v_u_3.WanderAimlessly
                        })
                    end
                end
                task.wait(6)
                v_u_12.end_performance(v68, v_u_3.AnchorInPlace)
                v_u_12.end_performance(v68, v_u_3.AnimationProvider)
                v57:Destroy()
                v_u_12.stage_performance(v68, {
                    ["name"] = v_u_3.WanderAimlessly
                })
                local v81 = v68.base.root.CFrame
                v68.base.root.CFrame = v69
                v_u_5.get("ToolAPI/Equip"):InvokeServer(v66, {
                    ["spawn_cframe"] = v81
                })
            end
        else
            v_u_4.apps.DialogApp:dialog({
                ["text"] = v55,
                ["button"] = "Okay"
            })
            return
        end
    else
        v_u_4.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Desert Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
local v_u_83 = false
function v15.throw_food(...)
    if not v_u_83 then
        v_u_83 = true
        local v_u_84 = { ... }
        v_u_7.pcall_warn_error(function()
            local v85 = v_u_84
            v_u_82(unpack(v85))
        end)
        v_u_83 = false
    end
end
function v15.add_dialog(p_u_86)
    local function v91()
        local v87 = v_u_11.get_pet_entity(p_u_86)
        v_u_12.stage_performance(v87, {
            ["name"] = v_u_3.AnchorInPlace
        })
        local v88 = (v_u_10.get("equip_manager") or {}).food[1]
        local v89
        if v88 and v88.id == "desert_2022_mud_ball" then
            v89 = v_u_17
        else
            v89 = v_u_16[math.random(1, #v_u_16)]
        end
        for _, v_u_90 in pairs(v89) do
            if typeof(v_u_90) == "string" then
                pcall(function()
                    v_u_4.apps.SpeechBubbleApp:create(p_u_86.PetModel.Head, v_u_90)
                end)
            else
                task.wait(v_u_90)
            end
        end
        v_u_12.end_performance(v87, v_u_3.AnchorInPlace)
    end
    return v_u_9:register({
        ["text"] = "Talk",
        ["part"] = p_u_86.PetModel.HumanoidRootPart,
        ["on_selected"] = v91,
        ["offset"] = Vector3.new(0, 2, 0),
        ["is_visible"] = function()
            return not v_u_83
        end
    })
end
return v15