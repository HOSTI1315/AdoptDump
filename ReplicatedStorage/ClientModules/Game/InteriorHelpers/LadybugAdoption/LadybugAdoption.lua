--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.LadybugAdoption (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v2("InventoryDB")
local v_u_4 = v2("UIManager")
local v_u_5 = v2("RouterClient")
local v_u_6 = v2("Utilities")
local v_u_7 = v2("InteractionsEngine")
local v_u_8 = v2("ClientData")
local v_u_9 = v2("BeeSwarm")
local v_u_10 = v2("CollisionsClient")
local v11 = v2("Maid")
local v_u_12 = v2("PetEntityManager")
local v_u_13 = v2("PetEntityHelper")
local v_u_14 = v2("PositionProvider")
local v_u_15 = v2("PetMovementTarget")
local v_u_16 = v2("PetPerformanceName")
local v_u_17 = v2("package:Promise")
local v_u_18 = {
    { "What\226\128\153s purple and sweet, and we like to eat? Lavender!", 5 },
    { "Ladybug, ladybird? Never mind, it\226\128\153s only a word!", 5 },
    { "We want some lavender to munch. Go ahead and feed us a bunch!", 5 },
    { "Wish upon our little spots, we will grant you lots and lots.", 5 }
}
local v_u_19 = {
    ["ladybug"] = 10,
    ["golden_ladybug"] = 1,
    ["diamond_ladybug"] = 1
}
local v_u_20 = v11.new()
local v_u_21 = nil
local v_u_22 = false
local v_u_23 = {}
local v_u_24 = {}
local v_u_25 = nil
local v_u_26 = nil
local function v_u_34(p_u_27)
    local function v31()
        local v28 = v_u_12.get_pet_entity(p_u_27)
        if v28 then
            v_u_13.stage_performance(v28, {
                ["name"] = v_u_16.AnchorInPlace
            })
            local v29 = v_u_18[math.random(1, #v_u_18)]
            for _, v_u_30 in ipairs(v29) do
                if typeof(v_u_30) == "string" then
                    pcall(function()
                        v_u_4.apps.SpeechBubbleApp:create(p_u_27.PetModel.Head, v_u_30)
                    end)
                else
                    v_u_17.delay(v_u_30):await()
                end
            end
            if p_u_27.Parent then
                v_u_13.end_performance(v28, v_u_16.AnchorInPlace)
            end
        end
    end
    return v_u_7:register({
        ["text"] = "Talk",
        ["part"] = p_u_27.PetModel.HumanoidRootPart,
        ["on_selected"] = v31,
        ["offset"] = Vector3.new(0, 3, 0),
        ["is_visible"] = function()
            local v32 = not v_u_22
            if v32 then
                local v33 = (v_u_8.get("equip_manager") or {}).food[1]
                if v33 then
                    v33 = v33.id == "diamond_lavender"
                end
                v32 = not v33
            end
            return v32
        end
    })
end
local v59 = {
    ["start"] = function(p35, p_u_36)
        v_u_26 = p35.PetTemplates
        v_u_26.Parent = nil
        for _, v37 in ipairs(v_u_26:GetChildren()) do
            v_u_10.set_model_collision_group(v37, "no_collisions")
        end
        local v_u_38 = {}
        for _, v39 in ipairs(p35.SwarmAreas:GetChildren()) do
            local v40 = {
                ["center_target"] = v_u_14.new(v39)
            }
            local v41 = v39.Size.X
            local v42 = v39.Size.Z
            v40.radius = math.min(v41, v42) / 2
            local v43 = math.random(75, 150)
            v40.radians_per_second = math.rad(v43)
            v40.max_elevation_offset = v39.Size.Y / 2
            table.insert(v_u_38, v40)
        end
        local v_u_44 = {}
        local function v51(p45)
            local v_u_46 = v_u_26:FindFirstChild(p45):Clone()
            v_u_46.Parent = workspace
            v_u_20:GiveTask(v_u_46)
            v_u_20:GiveTask((v_u_34(v_u_46)))
            local v47 = v_u_12.create_pet_entity(v_u_46, v_u_3.pets[v_u_46.Name])
            v_u_20:GiveTask(function()
                v_u_12.remove_pet_entity_by_char(v_u_46)
            end)
            local v48 = v_u_23
            table.insert(v48, v47)
            local v49 = v_u_9.new({ v47 })
            v_u_24[v47] = v49
            v49:swarm_on_locations_randomly(v_u_38)
            v49:stage_swarm_performances()
            v_u_20:GiveTask(v49)
            local v50 = v_u_44
            table.insert(v50, v49)
        end
        for v52, v53 in pairs(v_u_19) do
            for _ = 1, v53 do
                v51(v52)
            end
        end
        v_u_17.try(function()
            local v54 = false
            while not p_u_36:is_exited() do
                local v55 = (v_u_8.get("equip_manager") or {}).food[1]
                if v55 then
                    v55 = v55.id == "diamond_lavender"
                end
                local v56 = nil
                if v55 or v_u_25 ~= nil then
                    if not v54 then
                        v56 = {
                            {
                                ["center_target"] = v_u_14.new(function()
                                    return v_u_25 or v_u_1.LocalPlayer
                                end),
                                ["center_offset"] = Vector3.new(0, 4, 0),
                                ["radius"] = 8,
                                ["radians_per_second"] = 4.537856055185257,
                                ["max_elevation_offset"] = 4
                            }
                        }
                        v54 = true
                    end
                elseif v54 then
                    v56 = v_u_38
                    v54 = false
                end
                if v56 then
                    for _, v57 in ipairs(v_u_44) do
                        v57:swarm_on_locations_randomly(v56)
                    end
                end
                v_u_17.delay(0.2):await()
            end
        end)
    end,
    ["stop"] = function(p58)
        v_u_20:DoCleaning()
        if v_u_21 then
            v_u_21:cancel()
        end
        v_u_23 = {}
        v_u_24 = {}
        v_u_26.Parent = p58
    end
}
local function v_u_63(p60)
    local v61 = {}
    for _, v62 in pairs(v_u_23) do
        if v62.base.entry.id == p60 then
            table.insert(v61, v62)
        end
    end
    return v61[math.random(1, #v61)]
end
local function v_u_87(p64, p65)
    if workspace:WaitForChild("Interiors"):FindFirstChild("FarmShop") then
        local v_u_66 = p64:Clone()
        local v67 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("diamond_lavender", p65)
        if v67 then
            local v68 = v67[1]
            local v69 = v68.kind
            local v_u_70 = v68.unique
            p64:Destroy()
            v_u_66.Parent = workspace
            v_u_66:BreakJoints()
            v_u_25 = v_u_66
            for _, v71 in ipairs(v_u_66:GetDescendants()) do
                if v71:IsA("BasePart") then
                    v_u_6.weld(v71, v_u_66.Core)
                    v71.CanCollide = true
                end
            end
            local v72 = game.Players.LocalPlayer.Character.HumanoidRootPart
            v_u_66.Core.Velocity = v72.CFrame.LookVector * 25 + Vector3.new(0, 70, 0)
            local v73 = v_u_66.Core
            local v74 = math.random()
            local v75 = math.random()
            local v76 = math.random
            v73.RotVelocity = Vector3.new(v74, v75, v76()) * 12
            local v_u_77 = v_u_63(v69)
            local v_u_78 = v_u_77.base.root.CFrame
            local function v_u_80()
                v_u_21 = nil
                v_u_25 = nil
                v_u_66:Destroy()
                v_u_10.set_model_collision_group(v_u_77.base.char, "no_collisions")
                v_u_24[v_u_77]:stage_swarm_performances()
                local v79 = v_u_77.base.root.CFrame
                v_u_77.base.root.CFrame = v_u_78
                v_u_5.get("ToolAPI/Equip"):InvokeServer(v_u_70, {
                    ["spawn_cframe"] = v79
                })
            end
            v_u_21 = v_u_17.delay(4.5):andThen(function()
                v_u_10.set_model_collision_group(v_u_77.base.char, "pets")
                v_u_13.end_performance(v_u_77, v_u_16.Swarm)
                local v81 = v_u_13.stage_performance
                local v82 = v_u_77
                local v83 = {
                    ["name"] = v_u_16.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_15.from_target_and_follow_distance(v_u_66.Core, 1.5)
                    }
                }
                v81(v82, v83)
                v_u_4.apps.SpeechBubbleApp:create(v_u_77.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. v_u_1.LocalPlayer.Name)
                return v_u_17.delay(1)
            end):andThen(function()
                v_u_25 = nil
                local v84 = v_u_13.stage_performance
                local v85 = v_u_77
                local v86 = {
                    ["name"] = v_u_16.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = v_u_3.pets.ladybug.anims.eating
                    }
                }
                v84(v85, v86)
                return v_u_17.delay(6)
            end):andThen(function()
                v_u_13.end_performance(v_u_77, v_u_16.AnimationProvider)
                v_u_13.end_performance(v_u_77, v_u_16.TargetProvider)
            end):finally(function()
                v_u_80()
            end)
            return v_u_21
        end
    else
        v_u_4.apps.DialogApp:dialog({
            ["text"] = "You need to be in the Farm Shop to use this",
            ["button"] = "Okay"
        })
    end
end
function v59.throw_treat(p88, p89)
    if not v_u_22 then
        v_u_22 = true
        v_u_17.try(v_u_87, p88, p89):await()
        v_u_22 = false
    end
end
return v59