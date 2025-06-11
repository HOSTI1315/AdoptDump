--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.AmazonAdoption (ModuleScript)

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v3 = require(game.ReplicatedStorage.Fsys).load
local v_u_4 = v3("InventoryDB")
local v_u_5 = v3("UIManager")
local v_u_6 = v3("RouterClient")
local v_u_7 = v3("Utilities")
local v_u_8 = v3("InteractionsEngine")
local v_u_9 = v3("ClientData")
local v_u_10 = v3("BeeSwarm")
local v_u_11 = v3("CollisionsClient")
local v12 = v3("Maid")
local v_u_13 = v3("PetEntityManager")
local v_u_14 = v3("PetEntityHelper")
local v_u_15 = v3("PositionProvider")
local v_u_16 = v3("PetMovementTarget")
local v_u_17 = v3("PetPerformanceName")
local v_u_18 = v3("package:Promise")
local v19 = v3("Signal")
local v_u_20 = Random.new()
local v_u_21 = v19.new()
local v_u_22 = {
    { "Squawk!!! Repeat after me, repeat after you!", 4 },
    { "Ever get bored of the rain? I wanna see the leaves fall instead!! ", 5 },
    { "I\'m collecting our colorful feathers for an art project, I can\'t wait to show everyone...", 6 },
    { "Pirate Parrot! Pirate Parrot!", 4 },
    { "No love birds here, only me hearties!", 4 },
    { "This parrot can\'t be contained in an egg! I already hatched from one!", 5 },
    { "Living in the rainforest is great if you prefer a bird shower over a bird bath!", 6 },
    { "Repeating someone\'s joke louder is so annoying!", 4 },
    { "REPEATING SOMEONE\'S JOKE LOUDER IS SO ANNOYING!", 4 },
    { "You got a Golden Plantain? Me want a Golden Plantain!!", 4 },
    { "Hold on, is that a banana? I want a Golden Plantain!", 4 }
}
local v_u_23 = v_u_4.pets.rain_2023_green_amazon.anims.running
local v_u_24 = v_u_4.pets.rain_2023_green_amazon.anims.eating
local v_u_25 = v_u_4.pets.rain_2023_green_amazon.anims.sit
local v_u_26 = {}
local v_u_27 = v12.new()
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = false
local v_u_31 = {}
local v_u_32 = {}
local v_u_33 = {}
local v_u_34 = nil
local v_u_35 = game.Players.LocalPlayer.Character.HumanoidRootPart
local function v_u_41(p36)
    v_u_34 = p36.PetTemplates
    v_u_34.Parent = nil
    v_u_11.set_model_collision_group(v_u_34.rain_2023_white_amazon, "no_collisions")
    v_u_11.set_model_collision_group(v_u_34.rain_2023_green_amazon, "no_collisions")
    v_u_11.set_model_collision_group(v_u_34.rain_2023_diamond_amazon, "no_collisions")
    local v37 = {
        { v_u_34.rain_2023_white_amazon:Clone(), v_u_34.rain_2023_green_amazon:Clone(), v_u_34.rain_2023_diamond_amazon:Clone() },
        { v_u_34.rain_2023_white_amazon:Clone(), v_u_34.rain_2023_green_amazon:Clone(), v_u_34.rain_2023_diamond_amazon:Clone() },
        { v_u_34.rain_2023_white_amazon:Clone(), v_u_34.rain_2023_green_amazon:Clone(), v_u_34.rain_2023_diamond_amazon:Clone() },
        { v_u_34.rain_2023_white_amazon:Clone(), v_u_34.rain_2023_white_amazon:Clone(), v_u_34.rain_2023_green_amazon:Clone() },
        { v_u_34.rain_2023_white_amazon:Clone(), v_u_34.rain_2023_green_amazon:Clone(), v_u_34.rain_2023_green_amazon:Clone() }
    }
    for _, v38 in v37 do
        for _, v39 in v38 do
            v39.Parent = workspace
            local v40 = v_u_26.add_dialog(v39)
            v_u_27:GiveTask(v39)
            v_u_27:GiveTask(v40)
        end
    end
    return v37
end
local function v_u_45(p42)
    local v43 = {}
    for _, v44 in p42.AmazonSeats:GetChildren() do
        table.insert(v43, {
            ["Part"] = v44,
            ["Occupant"] = nil,
            ["Weld"] = nil
        })
    end
    return v43
end
local function v_u_53(p46)
    local v47 = p46.Occupant
    v_u_14.end_performance(v47, v_u_17.AnchorInPlace)
    v_u_14.end_performance(v47, v_u_17.AnimationProvider)
    local v48 = v_u_33[v47]
    local v49 = table.find(v48.pet_entities, v47)
    local v50 = 6.283185307179586 / #v48.pet_entities * v49
    local v51 = v_u_14.stage_performance
    local v52 = {
        ["name"] = v_u_17.Swarm,
        ["options"] = {
            ["this_bee_rotation_offset"] = v50,
            ["bee_swarm"] = v48
        }
    }
    v51(v47, v52)
    table.remove(v_u_32, table.find(v_u_32, v47))
    p46.Occupant = nil
end
local function v_u_86(p_u_54, p_u_55, p56)
    local v_u_57 = {}
    function amazon_bezier(p58)
        local v59 = p_u_55.base.root.Position
        local v60 = p_u_54.Part.Position + Vector3.new(0, 50, 0)
        local v61 = p_u_54.Part.Position
        return (1 - p58) ^ 2 * v59 + 2 * (1 - p58) * p58 * v60 + p58 ^ 2 * v61
    end
    local v62 = amazon_bezier(0.2)
    table.insert(v_u_57, v62)
    local v63 = amazon_bezier(0.4)
    table.insert(v_u_57, v63)
    local v64 = amazon_bezier(0.6)
    table.insert(v_u_57, v64)
    local v65 = amazon_bezier(0.8)
    table.insert(v_u_57, v65)
    p_u_54.Occupant = p_u_55
    local v66 = v_u_32
    table.insert(v66, p_u_55)
    local v_u_85 = v_u_18.delay(p56):andThen(function()
        return v_u_18.new(function(p67, _, p68)
            v_u_14.end_performance(p_u_55, v_u_17.Swarm)
            local v69 = v_u_14.stage_performance
            local v70 = p_u_55
            local v71 = {
                ["name"] = v_u_17.AnimationProvider,
                ["options"] = {
                    ["anim_name"] = v_u_23
                }
            }
            v69(v70, v71)
            local v72 = TweenInfo.new(0.75, Enum.EasingStyle.Linear)
            for _, v73 in v_u_57 do
                if p68() then
                    return
                end
                v_u_2:Create(p_u_55.base.root, v72, {
                    ["CFrame"] = CFrame.new(v73, p_u_54.Part.Position)
                }):Play()
                task.wait(0.2)
            end
            p67()
        end)
    end):andThen(function()
        local v74 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
        local v75 = v_u_2:Create(p_u_55.base.root, v74, {
            ["CFrame"] = p_u_54.Part.CFrame
        })
        v75:Play()
        v75.Completed:wait()
    end):andThen(function()
        local v76 = v_u_14.stage_performance
        local v77 = p_u_55
        local v78 = {
            ["name"] = v_u_17.AnchorInPlace,
            ["options"] = {
                ["custom_cframe"] = p_u_54.Part.CFrame
            }
        }
        v76(v77, v78)
        v_u_14.end_performance(p_u_55, v_u_17.AnimationProvider)
        local v79 = v_u_14.stage_performance
        local v80 = p_u_55
        local v81 = {
            ["name"] = v_u_17.AnimationProvider,
            ["options"] = {
                ["anim_name"] = v_u_25
            }
        }
        v79(v80, v81)
        return v_u_18.delay(v_u_20:NextInteger(10, 45))
    end):andThen(function()
        local v82 = (v_u_9.get("equip_manager") or {}).food[1]
        if v82 then
            v82 = v82.id == "rain_2023_golden_plantain"
        end
        if v82 then
            while true do
                task.wait(1)
                local v83 = (v_u_9.get("equip_manager") or {}).food[1]
                if v83 then
                    v83 = v83.id == "rain_2023_golden_plantain"
                end
                if not v83 then
                    goto l8
                end
            end
        else
            ::l8::
            return
        end
    end):andThen(function()
        local v84 = workspace:WaitForChild("Interiors"):FindFirstChild("RainPetShop")
        if p_u_54.Occupant == p_u_55 and v84 then
            v_u_53(p_u_54)
        end
    end)
    v_u_18.fromEvent(v_u_21, function()
        v_u_85:cancel()
        return true
    end)
end
local function v_u_90(p87)
    local v88 = {}
    for _, v89 in v_u_31 do
        if p87 and v89.base.entry.id == p87 or not (p87 or table.find(v_u_32, v89)) then
            table.insert(v88, v89)
        end
    end
    return v88[v_u_20:NextInteger(1, #v88)]
end
local function v_u_96(p91)
    local v_u_92 = (v_u_9.get("equip_manager") or {}).food[1]
    if v_u_92 then
        v_u_92 = v_u_92.id == "rain_2023_golden_plantain"
    end
    local v93 = v_u_92 and 850 or 1
    for _, v_u_94 in p91 do
        if not v_u_94.Occupant and v93 >= v_u_20:NextInteger(0, 850) then
            local v_u_95 = v_u_90()
            if v_u_95 then
                v_u_18.try(function()
                    v_u_86(v_u_94, v_u_95, v_u_92 and v_u_20:NextNumber(0, 2.5) or 0)
                end)
            end
        end
    end
end
function v_u_26.start(p97, p_u_98)
    local v_u_99 = {}
    for _, v100 in p97.FlockPoints:GetChildren() do
        local v101 = {
            ["center_target"] = v_u_15.new(v100),
            ["radius"] = 12,
            ["radians_per_second"] = 1.7453292519943295,
            ["max_elevation_offset"] = 6
        }
        table.insert(v_u_99, v101)
    end
    local v102 = v_u_41(p97)
    local v_u_103 = v_u_45(p97)
    local v_u_104 = {}
    for _, v105 in v102 do
        local v106 = {}
        local v107 = v_u_10.new(v106)
        for _, v_u_108 in v105 do
            local v109 = v_u_13.create_pet_entity(v_u_108, v_u_4.pets[v_u_108.Name])
            v_u_33[v109] = v107
            v_u_27:GiveTask(function()
                v_u_13.remove_pet_entity_by_char(v_u_108)
            end)
            table.insert(v106, v109)
            local v110 = v_u_31
            table.insert(v110, v109)
        end
        v107:swarm_on_locations_randomly(v_u_99)
        v107:stage_swarm_performances()
        v_u_27:GiveTask(v107)
        table.insert(v_u_104, v107)
    end
    v_u_18.try(function()
        local v111 = false
        while not p_u_98:is_exited() do
            local v112 = false
            local v_u_113 = nil
            if v_u_29 ~= nil then
                if not v111 then
                    v_u_113 = {
                        {
                            ["center_target"] = v_u_15.new(function()
                                return v_u_29 or v_u_1.LocalPlayer
                            end),
                            ["center_offset"] = Vector3.new(0, 4, 0),
                            ["radius"] = 8,
                            ["radians_per_second"] = 1.25,
                            ["max_elevation_offset"] = 4
                        }
                    }
                    v111 = true
                    for _, v_u_114 in v_u_103 do
                        if v_u_114.Occupant then
                            task.delay(v_u_20:NextNumber(0, 1), function()
                                v_u_53(v_u_114)
                            end)
                        end
                    end
                end
            elseif v111 then
                v_u_113 = v_u_99
                v112 = true
                v111 = false
            else
                v_u_96(v_u_103)
            end
            if v_u_113 then
                for _, v_u_115 in v_u_104 do
                    local v116 = v112 and v_u_20:NextNumber(0, 1) or 0
                    task.delay(v116, function()
                        v_u_115:swarm_on_locations_randomly(v_u_113)
                    end)
                end
            end
            v_u_18.delay(0.2):await()
        end
    end)
end
function v_u_26.stop(p117)
    v_u_27:DoCleaning()
    if v_u_28 then
        v_u_28:cancel()
    end
    v_u_31 = {}
    v_u_33 = {}
    v_u_29 = nil
    v_u_30 = false
    v_u_34.Parent = p117
end
local function v_u_143(p118, p119)
    local v120 = workspace:WaitForChild("Interiors"):FindFirstChild("RainPetShop")
    if v120 then
        local v121, v122
        if (v120.ThrowZone.Position - v_u_35.Position).magnitude <= 50 then
            v121 = true
            v122 = nil
        else
            v121 = false
            v122 = "You need to get closer to the amazon birds to use this"
        end
        if v121 then
            local v_u_123 = p118:Clone()
            v_u_21:Fire()
            v_u_30 = true
            v_u_29 = v_u_123
            p118:Destroy()
            v_u_123.Parent = workspace
            v_u_123:BreakJoints()
            for _, v124 in v_u_123:GetDescendants() do
                if v124:IsA("BasePart") then
                    v_u_7.weld(v124, v_u_123.GoldenPlantain)
                    v124.CanCollide = true
                end
            end
            v_u_123.GoldenPlantain.Velocity = v_u_35.CFrame.LookVector * 25 + Vector3.new(0, 70, 0)
            local v125 = v_u_123.GoldenPlantain
            local v126 = math.random()
            local v127 = math.random()
            local v128 = math.random
            v125.RotVelocity = Vector3.new(v126, v127, v128()) * 12
            wait(0.5)
            local v129 = v_u_6.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("rain_2023_golden_plantain", p119)
            if v129 then
                local v130 = v129[1]
                local v131 = v130.kind
                local v_u_132 = v130.unique
                local v_u_133 = v_u_90(v131)
                local v_u_134 = v_u_133.base.root.CFrame
                local function v_u_136()
                    v_u_28 = nil
                    v_u_29 = nil
                    v_u_123:Destroy()
                    v_u_11.set_model_collision_group(v_u_133.base.char, "no_collisions")
                    v_u_33[v_u_133]:stage_swarm_performances()
                    local v135 = v_u_133.base.root.CFrame
                    v_u_133.base.root.CFrame = v_u_134
                    v_u_6.get("ToolAPI/Equip"):InvokeServer(v_u_132, {
                        ["spawn_cframe"] = v135
                    })
                end
                v_u_28 = v_u_18.delay(4.5):andThen(function()
                    v_u_11.set_model_collision_group(v_u_133.base.char, "pets")
                    v_u_14.end_performance(v_u_133, v_u_17.Swarm)
                    local v137 = v_u_14.stage_performance
                    local v138 = v_u_133
                    local v139 = {
                        ["name"] = v_u_17.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_16.from_target_and_follow_distance(v_u_123.GoldenPlantain, 1.5)
                        }
                    }
                    v137(v138, v139)
                    v_u_5.apps.SpeechBubbleApp:create(v_u_133.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                    return v_u_18.delay(1)
                end):andThen(function()
                    v_u_29 = nil
                    v_u_30 = false
                    local v140 = v_u_14.stage_performance
                    local v141 = v_u_133
                    local v142 = {
                        ["name"] = v_u_17.AnimationProvider,
                        ["options"] = {
                            ["anim_name"] = v_u_24
                        }
                    }
                    v140(v141, v142)
                    return v_u_18.delay(6)
                end):andThen(function()
                    v_u_14.end_performance(v_u_133, v_u_17.AnimationProvider)
                    v_u_14.end_performance(v_u_133, v_u_17.TargetProvider)
                end):finally(function()
                    v_u_136()
                end)
                return v_u_28
            end
        else
            v_u_5.apps.DialogApp:dialog({
                ["text"] = v122,
                ["button"] = "Okay"
            })
        end
    else
        v_u_5.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Rain Pet Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
local v_u_144 = false
function v_u_26.throw_plantain(p145, p146)
    if not v_u_144 then
        v_u_144 = true
        v_u_18.try(v_u_143, p145, p146):await()
        v_u_144 = false
    end
end
function v_u_26.add_dialog(p_u_147)
    local function v149()
        if v_u_13.get_pet_entity(p_u_147) then
            for _, v_u_148 in v_u_22[math.random(1, #v_u_22)] do
                if typeof(v_u_148) == "string" then
                    pcall(function()
                        v_u_5.apps.SpeechBubbleApp:create(p_u_147.PetModel.Head, v_u_148)
                    end)
                else
                    wait(v_u_148)
                end
            end
        end
    end
    return v_u_8:register({
        ["text"] = "Talk",
        ["part"] = p_u_147.PetModel.HumanoidRootPart,
        ["on_selected"] = v149,
        ["offset"] = Vector3.new(0, 3, 0),
        ["is_visible"] = function()
            local v150 = (v_u_9.get("equip_manager") or {}).food[1]
            if v150 then
                v150 = v150.id == "rain_2023_golden_plantain"
            end
            local v151 = not (v_u_144 or (v150 or v_u_30))
            if v151 then
                v151 = not table.find(v_u_32, p_u_147)
            end
            return v151
        end
    })
end
return v_u_26