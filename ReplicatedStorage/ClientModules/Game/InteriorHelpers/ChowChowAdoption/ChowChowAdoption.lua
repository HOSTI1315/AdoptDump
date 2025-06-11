--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.ChowChowAdoption (ModuleScript)

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
local v14 = {}
local v_u_15 = v1("Maid").new()
local v_u_16 = {
    { "This is the VIP section! Very Important Paws only!! ", 4 },
    { "Where are the blue slushies? My tongue needs a touch up!", 4 },
    { "On Thursdays, we play Bingo with the Retired Eggs. They always cheat!", 4 },
    { "Regular dogs can keep their regular bones, I want a Golden Bone!", 4 },
    { "No touching, only feeding!!", 4 },
    { "Our ancestors worked so hard... I much prefer the VIP treatment!", 4 },
    { "CHOW, CHOW!! CHOW-CHOW CHOOOOWW!!!", 4 },
    { "I can be brown, my tongue is blue, where are the vi-o-let skies?", 4 },
    { "Not a bad place to retire, the luxury!", 4 }
}
local v_u_17 = Random.new()
local v_u_18 = {}
local v_u_19 = {
    ["vip_2022_chow_chow_light_brown"] = {},
    ["vip_2022_chow_chow_dark_brown"] = {},
    ["vip_2022_chow_chow_black"] = {},
    ["vip_2022_chow_chow_gold"] = {}
}
local function v_u_31(p20, p21)
    local v22 = tick()
    while true do
        local v23 = {}
        for _, v24 in ipairs(p20) do
            if (p21.Head.Position - v24.base.root.Position).Magnitude > 20 then
                table.insert(v23, v24)
            end
        end
        if #v23 == 0 then
            return
        end
        if tick() - v22 > 7 then
            for _, v25 in pairs(v23) do
                local v26 = v25.base.root
                local v27 = CFrame.new
                local v28 = p21.Head.Position
                local v29 = math.random(-20, 20) / 10
                local v30 = math.random(-20, 20) / 10
                v26.CFrame = v27(v28 + Vector3.new(v29, 5, v30))
            end
            return
        end
        task.wait(0.3)
    end
end
function v14.start(p_u_32)
    for _, v33 in ipairs(p_u_32.PetGates:GetChildren()) do
        v33.CollisionGroup = "roaming_pet_gate"
    end
    local v_u_34 = p_u_32.AdoptablePets:Clone()
    v_u_15:GiveTask(function()
        p_u_32.AdoptablePets:Destroy()
        v_u_34.Parent = p_u_32
    end)
    for _, v35 in pairs(p_u_32.AdoptablePets:GetChildren()) do
        v_u_13.set_model_collision_group(v35, "roaming_pets")
        local v36 = v35.Name
        local v37 = v_u_19[v36]
        assert(v37, ("%s is not a valid adoptable pet kind"):format(v36))
        local v38 = v_u_8.deep_copy(v_u_2.pets[v36])
        v38.anims.running = "ChowChowRun"
        local v39 = v_u_10.create_pet_entity(v35, v38)
        v_u_11.stage_performance(v39, {
            ["name"] = v_u_3.WanderAimlessly
        })
        local v40 = v_u_18
        table.insert(v40, v39)
        local v41 = v_u_19[v36]
        table.insert(v41, v39)
    end
end
function v14.stop(_)
    for _, v42 in ipairs(v_u_18) do
        v_u_10.remove_pet_entity_by_entity(v42)
    end
    v_u_18 = {}
    for v43, _ in pairs(v_u_19) do
        v_u_19[v43] = {}
    end
    v_u_15:DoCleaning()
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
    return false, "You need to get closer to the chow-chows to use this"
end
local function v_u_82(p51, p52)
    local v53 = workspace:WaitForChild("Interiors"):FindFirstChild("VIP")
    if v53 then
        local v54, v55 = v_u_50(v53)
        if v54 then
            local v56 = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v57 = p51:Clone()
            p51:Destroy()
            v57.Parent = workspace
            v57:BreakJoints()
            v_u_13.set_model_collision_group(v57, "roaming_pets")
            for _, v58 in ipairs(v57:GetDescendants()) do
                if v58:IsA("BasePart") then
                    v_u_6.weld(v58, v57.Head)
                    v58.CanCollide = true
                end
            end
            v57.Head.Velocity = v56.CFrame.LookVector * 40 + Vector3.new(0, 20, 0)
            local v59 = v57.Head
            local v60 = math.random()
            local v61 = math.random()
            local v62 = math.random
            v59.RotVelocity = Vector3.new(v60, v61, v62()) * 12
            task.wait(0.5)
            local v63 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("vip_2022_golden_bone", p52)
            if v63 then
                local v64 = v63[1]
                local v65 = v64.kind
                local v66 = v64.unique
                local v67 = v_u_19[v65]
                local v68 = v67[v_u_17:NextInteger(1, #v67)]
                local v69 = v68.base.root.CFrame
                for _, v70 in ipairs(v_u_18) do
                    local v71 = v57.Head
                    local v72 = 4 + 10 * math.random()
                    v_u_11.end_performance(v70, v_u_3.WanderAimlessly)
                    local v73 = v_u_11.stage_performance
                    local v74 = {
                        ["name"] = v_u_3.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_12.from_target_and_follow_distance(v71, v72)
                        }
                    }
                    v73(v70, v74)
                end
                v_u_31(v_u_18, v57)
                for _, v75 in ipairs(v57:GetDescendants()) do
                    if v75:IsA("BasePart") then
                        v75.CanCollide = false
                        v75.Anchored = true
                    end
                end
                task.wait(2)
                local v76 = v_u_11.stage_performance
                local v77 = {
                    ["name"] = v_u_3.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_12.from_target_and_follow_distance(v57.Head, 1)
                    }
                }
                v76(v68, v77)
                v68.base.humanoid.Jump = true
                v_u_4.apps.SpeechBubbleApp:create(v68.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                task.wait(1)
                local v78 = v_u_11.stage_performance
                local v79 = {
                    ["name"] = v_u_3.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = "ChowChowEat"
                    }
                }
                v78(v68, v79)
                task.wait(1)
                v_u_11.stage_performance(v68, {
                    ["name"] = v_u_3.AnchorInPlace
                })
                for _, v80 in ipairs(v_u_18) do
                    if v80 ~= v68 then
                        v_u_11.end_performance(v80, v_u_3.TargetProvider)
                        v_u_11.stage_performance(v80, {
                            ["name"] = v_u_3.WanderAimlessly
                        })
                    end
                end
                task.wait(6)
                v_u_11.end_performance(v68, v_u_3.AnchorInPlace)
                v_u_11.end_performance(v68, v_u_3.AnimationProvider)
                v57:Destroy()
                v_u_11.stage_performance(v68, {
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
            ["text"] = ("You need to be in the %s to use this"):format("VIP Lounge"),
            ["button"] = "Okay"
        })
        return
    end
end
local v_u_83 = false
function v14.throw_bone(...)
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
function v14.add_dialog(p_u_86)
    local function v90()
        local v87 = v_u_10.get_pet_entity(p_u_86)
        v_u_11.stage_performance(v87, {
            ["name"] = v_u_3.AnchorInPlace
        })
        local v88 = v_u_16[math.random(1, #v_u_16)]
        for _, v_u_89 in pairs(v88) do
            if typeof(v_u_89) == "string" then
                pcall(function()
                    v_u_4.apps.SpeechBubbleApp:create(p_u_86.PetModel.Head, v_u_89)
                end)
            else
                task.wait(v_u_89)
            end
        end
        v_u_11.end_performance(v87, v_u_3.AnchorInPlace)
    end
    return v_u_9:register({
        ["text"] = "Talk",
        ["part"] = p_u_86.PetModel.HumanoidRootPart,
        ["on_selected"] = v90,
        ["offset"] = Vector3.new(0, 2, 0),
        ["is_visible"] = function()
            return not v_u_83
        end
    })
end
return v14