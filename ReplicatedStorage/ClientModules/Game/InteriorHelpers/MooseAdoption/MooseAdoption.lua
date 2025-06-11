--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.MooseAdoption (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("CollisionsClient")
local v_u_3 = v1("Debug")
local v_u_4 = v1("DownloadClient")
local v_u_5 = v1("InteractionsEngine")
local v_u_6 = v1("KindDB")
local v7 = v1("Maid")
local v_u_8 = v1("MinigameHelper")
local v_u_9 = v1("PetEntityHelper")
local v_u_10 = v1("PetEntityManager")
local v_u_11 = v1("PetMovementTarget")
local v_u_12 = v1("PetPerformanceName")
local v_u_13 = v1("RouterClient")
local v_u_14 = v1("UIManager")
local v_u_15 = v1("Utilities")
local v_u_16 = v1("package:Promise")
local v_u_17 = v1("package:Sift")
local v_u_18 = Random.new()
local v_u_19 = { "camping_2025_mama_moose", "camping_2025_moose_calf", "camping_2025_papa_moose" }
local v_u_20 = {
    { "Mmmmm... Maple Syrup, eh?", 4 },
    { "Oh, sorry, excuse me, so sorry...", 4 },
    { "Yeah, no, I love Maple Leaf Treats!", 4 },
    { "It always surprises me how small humans are.", 5 },
    { "A polite herd this one, eh?", 4 },
    { "A herd of moose? Yeah, I\'ve heard of \'em.", 4 },
    { "I am Moose, eater of twigs.", 4 },
    { "One time, I swear... I saw that Burt... but a horse? Weird dream...", 6 }
}
local v_u_21 = {
    ["camping_2025_moose_calf"] = {
        { "Momma Moose! Papa! Watch me zoom!", 4 }
    },
    ["camping_2025_papa_moose"] = {
        { "Impressive antlers, eh?", 4 }
    }
}
local v_u_22 = v7.new()
local v_u_23 = {}
local v_u_24 = {
    ["camping_2025_mama_moose"] = {},
    ["camping_2025_papa_moose"] = {},
    ["camping_2025_moose_calf"] = {}
}
local v_u_25 = {}
local function v_u_34(p26)
    local v27 = p26.ThrowZones
    for _, v28 in ipairs(v27:GetChildren()) do
        local v29 = game.Players.LocalPlayer.Character
        if v29 then
            v29 = v29:FindFirstChild("HumanoidRootPart")
        end
        if not v29 then
            return false
        end
        local v30 = v28.CFrame:PointToObjectSpace(v29.Position)
        local v31 = v30.X
        if math.abs(v31) < v28.Size.X / 2 then
            local v32 = v30.Y
            if math.abs(v32) < v28.Size.Y / 2 then
                local v33 = v30.Z
                if math.abs(v33) < v28.Size.Z / 2 then
                    return true, nil
                end
            end
        end
    end
    return false, "You need to get closer to the moose to use this"
end
local function v_u_46(p35, p36)
    local v37 = tick()
    while true do
        local v38 = {}
        for _, v39 in p35 do
            if (p36.Head.Position - v39.base.root.Position).Magnitude > 20 then
                table.insert(v38, v39)
            end
        end
        if #v38 == 0 then
            return
        end
        if tick() - v37 > 7 then
            for _, v40 in pairs(v38) do
                local v41 = v40.base.root
                local v42 = CFrame.new
                local v43 = p36.Head.Position
                local v44 = math.random(-20, 20) / 10
                local v45 = math.random(-20, 20) / 10
                v41.CFrame = v42(v43 + Vector3.new(v44, 5, v45))
            end
            return
        end
        task.wait(0.3)
    end
end
local function v_u_78(p47, p48)
    local v49 = workspace:WaitForChild("Interiors"):FindFirstChild("CampingShop")
    if v49 then
        local v50, v51 = v_u_34(v49)
        if v50 then
            local v52 = game.Players.LocalPlayer.Character.HumanoidRootPart
            local v53 = p47:Clone()
            p47:Destroy()
            v53.Parent = workspace
            v53:BreakJoints()
            v_u_2.set_model_collision_group(v53, "roaming_pets")
            for _, v54 in ipairs(v53:GetDescendants()) do
                if v54:IsA("BasePart") then
                    v_u_15.weld(v54, v53.Head)
                    v54.CanCollide = true
                end
            end
            v53.Head.Velocity = v52.CFrame.LookVector * 30 + Vector3.new(0, 20, 0)
            local v55 = v53.Head
            local v56 = math.random()
            local v57 = math.random()
            local v58 = math.random
            v55.RotVelocity = Vector3.new(v56, v57, v58()) * 12
            task.wait(0.5)
            local v59 = v_u_13.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("camping_2025_maple_leaf_treat", p48)
            if v59 then
                local v60 = v59[1]
                local v61 = v60.kind
                local v62 = v60.unique
                local v63 = v_u_24[v61]
                local v64 = v63[v_u_18:NextInteger(1, #v63)]
                local v65 = v64.base.root.CFrame
                for _, v66 in ipairs(v_u_23) do
                    local v67 = v53.Head
                    local v68 = 4 + 10 * math.random()
                    v_u_9.end_performance(v66, v_u_12.WanderAimlessly)
                    local v69 = v_u_9.stage_performance
                    local v70 = {
                        ["name"] = v_u_12.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_11.from_target_and_follow_distance(v67, v68)
                        }
                    }
                    v69(v66, v70)
                end
                v_u_46(v_u_23, v53)
                for _, v71 in ipairs(v53:GetDescendants()) do
                    if v71:IsA("BasePart") then
                        v71.CanCollide = false
                        v71.Anchored = true
                    end
                end
                task.wait(2)
                local v72 = v_u_9.stage_performance
                local v73 = {
                    ["name"] = v_u_12.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_11.from_target_and_follow_distance(v53.Head, 1)
                    }
                }
                v72(v64, v73)
                v64.base.humanoid.Jump = true
                v_u_14.apps.SpeechBubbleApp:create(v64.base.char.PetModel.Head_Geo, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                task.wait(1)
                local v74 = v_u_9.stage_performance
                local v75 = {
                    ["name"] = v_u_12.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = v64.base.entry.anims.eating
                    }
                }
                v74(v64, v75)
                task.wait(1)
                v_u_9.stage_performance(v64, {
                    ["name"] = v_u_12.AnchorInPlace
                })
                for _, v76 in ipairs(v_u_23) do
                    if v76 ~= v64 then
                        v_u_9.end_performance(v76, v_u_12.TargetProvider)
                        v_u_9.stage_performance(v76, {
                            ["name"] = v_u_12.WanderAimlessly
                        })
                    end
                end
                task.wait(6)
                v_u_9.end_performance(v64, v_u_12.AnchorInPlace)
                v_u_9.end_performance(v64, v_u_12.AnimationProvider)
                v53:Destroy()
                v_u_9.stage_performance(v64, {
                    ["name"] = v_u_12.WanderAimlessly
                })
                local v77 = v64.base.root.CFrame
                v64.base.root.CFrame = v65
                v_u_13.get("ToolAPI/Equip"):InvokeServer(v62, {
                    ["spawn_cframe"] = v77
                })
            end
        else
            v_u_14.apps.DialogApp:dialog({
                ["text"] = v51,
                ["button"] = "Okay"
            })
            return
        end
    else
        v_u_14.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Camping Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
function v_u_25.start(p_u_79)
    for _, v80 in ipairs(p_u_79.PetGates:GetChildren()) do
        v80.CollisionGroup = "roaming_pet_gate"
    end
    local v_u_81 = p_u_79.MooseSpawnPart
    local v_u_83 = v_u_17.List.map(v_u_8.generate_spawn_point_offsets({
        ["player_count"] = 12,
        ["max_players_per_column"] = 4,
        ["spawn_spacing"] = 5
    }), function(p82)
        return v_u_81:GetPivot() * p82
    end)
    v_u_22.moose_download_promise = v_u_16.all(v_u_17.List.map(v_u_19, function(p84)
        return v_u_4.promise_download_copy("Pets", p84)
    end)):andThen(function(p85)
        for _, v86 in p85 do
            for _, v87 in v86:GetDescendants() do
                if v87:IsA("BasePart") then
                    v87.CollisionGroup = "roaming_pets"
                end
            end
        end
        for v88 = 1, 12 do
            local v89 = v88 % #v_u_19 + 1
            local v90 = v_u_19[v89]
            local v91 = p85[v89]:Clone()
            v91:PivotTo(v_u_83[v88])
            v91.Parent = p_u_79.WanderingPets
            local v92 = v_u_6[v90]
            local v93 = v_u_10.create_pet_entity(v91, v92)
            v_u_25.add_dialog(v93)
            local v94 = v_u_23
            table.insert(v94, v93)
            local v95 = v_u_24[v90]
            table.insert(v95, v93)
            v_u_9.stage_performance(v93, {
                ["name"] = v_u_12.WanderAimlessly
            })
        end
    end)
end
local v_u_96 = false
function v_u_25.throw_food(...)
    if not v_u_96 then
        v_u_96 = true
        local v_u_97 = { ... }
        v_u_3.pcall_warn_error(function()
            local v98 = v_u_97
            v_u_78(unpack(v98))
        end)
        v_u_96 = false
    end
end
function v_u_25.add_dialog(p_u_99)
    local function v106()
        v_u_9.stage_performance(p_u_99, {
            ["name"] = v_u_12.AnchorInPlace
        })
        local v100 = v_u_9.stage_performance
        local v101 = p_u_99
        local v102 = {
            ["name"] = v_u_12.AnimationProvider,
            ["options"] = {
                ["anim_name"] = p_u_99.base.entry.tricks[3][2]
            }
        }
        v100(v101, v102)
        local v103 = v_u_17.List.concat(v_u_20, v_u_21[p_u_99.base.entry.kind])
        local v104 = v103[math.random(1, #v103)]
        for _, v_u_105 in pairs(v104) do
            if typeof(v_u_105) == "string" then
                pcall(function()
                    v_u_14.apps.SpeechBubbleApp:create(p_u_99.base.pet_model.MockParts.Head, v_u_105)
                end)
            else
                task.wait(v_u_105)
            end
        end
        v_u_9.end_performance(p_u_99, v_u_12.AnchorInPlace)
        v_u_9.end_performance(p_u_99, v_u_12.AnimationProvider)
    end
    local v107 = v_u_5:register({
        ["text"] = "Talk",
        ["part"] = p_u_99.base.pet_model.HumanoidRootPart,
        ["on_selected"] = v106,
        ["offset"] = Vector3.new(0, 0, 0),
        ["is_visible"] = function()
            return not v_u_96
        end
    })
    v_u_22:GiveTask(v107)
    return v107
end
function v_u_25.cleanup()
    for _, v108 in ipairs(v_u_23) do
        v_u_10.remove_pet_entity_by_entity(v108)
    end
    v_u_23 = {}
    for v109, _ in pairs(v_u_24) do
        v_u_24[v109] = {}
    end
    v_u_22:DoCleaning()
end
return v_u_25