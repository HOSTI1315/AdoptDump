--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.PenguinAdoption (ModuleScript)

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
game:GetService("PhysicsService")
local v15 = {}
local v_u_16 = {
    {
        "Hey wise guy, get me a Golden Goldfish.",
        5,
        "They\'re behind the girl in the ice cream tub",
        5
    },
    {
        "Oh my god, hey there. I would totes love if you could get me a Golden Goldfish.",
        6,
        "You can buy one for me from that goldfish on the wall back there.",
        6
    },
    {
        "I want a Golden Goldfish NOWWWWWWWWWWWWW!",
        4,
        "I WANT A GOLDEN GOLDFISH PLEASEEEEEEEEEEEEEEEE",
        4,
        "They\'re behind the icecream tub...",
        3.6,
        "GIMMEEEEEEEEE GOLDY FISH",
        3
    }
}
local v_u_17 = {
    "Is that a golden goldfish?",
    3,
    "Please toss it here already!",
    4
}
local v_u_18 = Random.new()
local v_u_19 = {}
local v_u_20 = {
    ["ice_cream_refresh_2022_king_penguin"] = {},
    ["ice_cream_refresh_2022_golden_king_penguin"] = {},
    ["ice_cream_refresh_2022_diamond_king_penguin"] = {}
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
    for _, v34 in pairs(p33.AdoptablePets:GetChildren()) do
        v_u_14.set_model_collision_group(v34, "pets")
        local v35 = v34.Name
        local v36 = v_u_20[v35]
        assert(v36, ("%s is not a valid adoptable pet kind"):format(v35))
        local v37 = v_u_8.deep_copy(v_u_2.pets[v35])
        v37.anims.running = "KingPenguinRun"
        local v38 = v_u_11.create_pet_entity(v34, v37)
        v_u_12.stage_performance(v38, {
            ["name"] = v_u_3.WanderAimlessly
        })
        local v39 = v_u_19
        table.insert(v39, v38)
        local v40 = v_u_20[v35]
        table.insert(v40, v38)
    end
end
function v15.stop(_)
    for _, v41 in ipairs(v_u_19) do
        v_u_11.remove_pet_entity_by_entity(v41)
    end
    v_u_19 = {}
    for v42, _ in pairs(v_u_20) do
        v_u_20[v42] = {}
    end
end
local function v_u_68(p43, p44)
    if workspace:WaitForChild("Interiors"):FindFirstChild("IceCream") then
        local v45 = game.Players.LocalPlayer.Character
        if v45 then
            v45 = v45:FindFirstChild("HumanoidRootPart")
        end
        local v46, v47
        if v45 then
            v46 = true
            v47 = nil
        else
            v46 = false
            v47 = "Cannot do this now"
        end
        if v46 then
            local v48 = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v49 = p43:Clone()
            p43:Destroy()
            v49.Parent = workspace
            v49:BreakJoints()
            v_u_14.set_model_collision_group(v49, "pets")
            for _, v50 in ipairs(v49:GetDescendants()) do
                if v50:IsA("BasePart") then
                    v_u_6.weld(v50, v49.Head)
                    v50.CanCollide = true
                end
            end
            v49.Head.Velocity = v48.CFrame.LookVector * 60 + Vector3.new(0, 20, 0)
            local v51 = v49.Head
            local v52 = math.random()
            local v53 = math.random()
            local v54 = math.random
            v51.RotVelocity = Vector3.new(v52, v53, v54()) * 12
            task.wait(0.5)
            local v55 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("golden_goldfish", p44)
            if v55 then
                local v56 = v55[1]
                local v57 = v56.kind
                local v58 = v56.unique
                local v59 = v_u_20[v57]
                local v60 = v59[v_u_18:NextInteger(1, #v59)]
                local v61 = v60.base.root.CFrame
                for _, v62 in ipairs(v_u_19) do
                    local v63 = v49.Head
                    local v64 = 4 + 10 * math.random()
                    v_u_12.end_performance(v62, v_u_3.WanderAimlessly)
                    v_u_12.stage_performance(v62, {
                        ["name"] = v_u_3.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_13.from_target_and_follow_distance(v63, v64)
                        }
                    })
                end
                v_u_32(v_u_19, v49)
                for _, v65 in ipairs(v49:GetDescendants()) do
                    if v65:IsA("BasePart") then
                        v65.CanCollide = false
                        v65.Anchored = true
                    end
                end
                task.wait(2)
                v_u_12.stage_performance(v60, {
                    ["name"] = v_u_3.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_13.from_target_and_follow_distance(v49.Head, 1)
                    }
                })
                v60.base.humanoid.Jump = true
                v_u_4.apps.SpeechBubbleApp:create(v60.base.char.PetModel.Head, ("Yummy! \240\159\146\149 Thanks %s"):format(game.Players.LocalPlayer.Name))
                task.wait(1)
                v_u_12.stage_performance(v60, {
                    ["name"] = v_u_3.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = "KingPenguinEat"
                    }
                })
                task.wait(1)
                v_u_12.stage_performance(v60, {
                    ["name"] = v_u_3.AnchorInPlace
                })
                for _, v66 in ipairs(v_u_19) do
                    if v66 ~= v60 then
                        v_u_12.end_performance(v66, v_u_3.TargetProvider)
                        v_u_12.stage_performance(v66, {
                            ["name"] = v_u_3.WanderAimlessly
                        })
                    end
                end
                task.wait(6)
                v_u_12.end_performance(v60, v_u_3.AnchorInPlace)
                v_u_12.end_performance(v60, v_u_3.AnimationProvider)
                v49:Destroy()
                v_u_12.stage_performance(v60, {
                    ["name"] = v_u_3.WanderAimlessly
                })
                local v67 = v60.base.root.CFrame
                v60.base.root.CFrame = v61
                v_u_5.get("ToolAPI/Equip"):InvokeServer(v58, {
                    ["spawn_cframe"] = v67
                })
            end
        else
            v_u_4.apps.DialogApp:dialog({
                ["text"] = v47,
                ["button"] = "Okay"
            })
            return
        end
    else
        v_u_4.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Ice Cream Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
local v_u_69 = false
function v15.throw_food(...)
    if not v_u_69 then
        v_u_69 = true
        local v_u_70 = { ... }
        v_u_7.pcall_warn_error(function()
            local v71 = v_u_70
            v_u_68(unpack(v71))
        end)
        v_u_69 = false
    end
end
function v15.add_dialog(p_u_72)
    local function v77()
        local v73 = v_u_11.get_pet_entity(p_u_72)
        v_u_12.stage_performance(v73, {
            ["name"] = v_u_3.AnchorInPlace
        })
        local v74 = (v_u_10.get("equip_manager") or {}).food[1]
        local v75
        if v74 and v74.id == "golden_goldfish" then
            v75 = v_u_17
        else
            v75 = v_u_16[math.random(1, #v_u_16)]
        end
        for _, v_u_76 in pairs(v75) do
            if typeof(v_u_76) == "string" then
                pcall(function()
                    v_u_4.apps.SpeechBubbleApp:create(p_u_72.PetModel.Head, v_u_76)
                end)
            else
                task.wait(v_u_76)
            end
        end
        v_u_12.end_performance(v73, v_u_3.AnchorInPlace)
    end
    return v_u_9:register({
        ["text"] = "Talk",
        ["part"] = p_u_72.PetModel.HumanoidRootPart,
        ["on_selected"] = v77,
        ["offset"] = Vector3.new(0, 2, 0),
        ["is_visible"] = function()
            return not v_u_69
        end
    })
end
return v15