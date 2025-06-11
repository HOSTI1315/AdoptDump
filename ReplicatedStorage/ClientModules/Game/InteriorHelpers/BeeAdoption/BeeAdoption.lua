--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.BeeAdoption (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
v1("AnimationManager")
local v_u_3 = v1("UIManager")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("Utilities")
local v_u_6 = v1("Debug")
local v_u_7 = v1("InteractionsEngine")
local v_u_8 = v1("ClientData")
local v_u_9 = v1("BeeSwarm")
local v_u_10 = v1("CollisionsClient")
local v11 = v1("Maid")
local v_u_12 = v1("PetEntityManager")
local v_u_13 = v1("PetEntityHelper")
local v_u_14 = v1("PositionProvider")
local v_u_15 = v1("PetMovementTarget")
local v_u_16 = v1("PetPerformanceName")
v1("Debug").create_log()
local v_u_17 = Random.new()
local v_u_18 = {
    { "STRIKE STRIKE STRIKE", 4 },
    { "GIVE ME MY HONEY!", 4 },
    { "BZZZZZZZZZZZZZZZZZZZZZ", 4 },
    { "HONEY ISNT FUNNY IT BELONGS IN MY TUMMY!", 4 },
    { "Who would have guessed there was an island around the coffee shop...", 4 },
    { "FAIR WAGES FOR WORKER BEES", 4 },
    { "I can only make so much of a buzz by myself...", 4 }
}
local v_u_19 = {}
local v_u_20 = v11.new()
local v_u_21 = nil
local v_u_22 = false
local v_u_23 = {}
local v_u_24 = {}
local v_u_25 = nil
local function v_u_31(p26)
    v_u_25 = p26.TemplateBees
    v_u_25.Parent = nil
    v_u_10.set_model_collision_group(v_u_25.bee, "no_collisions")
    v_u_10.set_model_collision_group(v_u_25.king_bee, "no_collisions")
    v_u_10.set_model_collision_group(v_u_25.queen_bee, "no_collisions")
    local v27 = {
        {
            v_u_25.bee:Clone(),
            v_u_25.bee:Clone(),
            v_u_25.bee:Clone(),
            v_u_25.bee:Clone()
        },
        {
            v_u_25.queen_bee:Clone(),
            v_u_25.bee:Clone(),
            v_u_25.bee:Clone(),
            v_u_25.bee:Clone()
        },
        {
            v_u_25.king_bee:Clone(),
            v_u_25.bee:Clone(),
            v_u_25.bee:Clone(),
            v_u_25.bee:Clone()
        }
    }
    for _, v28 in pairs(v27) do
        for _, v29 in pairs(v28) do
            v29.Parent = workspace
            local v30 = v_u_19.add_dialog(v29)
            v_u_20:GiveTask(v29)
            v_u_20:GiveTask(v30)
        end
    end
    return v27
end
function v_u_19.start(p32, p_u_33)
    local v_u_34 = {
        {
            ["center_target"] = v_u_14.new(p32.Hive1.Center),
            ["radius"] = 15,
            ["radians_per_second"] = 3.490658503988659,
            ["max_elevation_offset"] = 6
        },
        {
            ["center_target"] = v_u_14.new(p32.Hive2.Center),
            ["radius"] = 15,
            ["radians_per_second"] = 3.490658503988659,
            ["max_elevation_offset"] = 6
        },
        {
            ["center_target"] = v_u_14.new(p32.BrokenCoffeeCupCenter),
            ["radius"] = 25,
            ["radians_per_second"] = 1.7453292519943295,
            ["max_elevation_offset"] = 4
        },
        {
            ["center_target"] = v_u_14.new(p32.DockCenter),
            ["radius"] = 17,
            ["radians_per_second"] = 1.7453292519943295,
            ["max_elevation_offset"] = 4
        },
        {
            ["center_target"] = v_u_14.new(p32.HiveCenter),
            ["radius"] = 18,
            ["radians_per_second"] = 1.7453292519943295,
            ["max_elevation_offset"] = 4
        }
    }
    local v35 = v_u_31(p32)
    local v_u_36 = {}
    for _, v37 in pairs(v35) do
        local v38 = {}
        local v39 = v_u_9.new(v38)
        for _, v_u_40 in pairs(v37) do
            local v41 = v_u_12.create_pet_entity(v_u_40, v_u_2.pets[v_u_40.Name])
            v_u_24[v41] = v39
            v_u_20:GiveTask(function()
                v_u_12.remove_pet_entity_by_char(v_u_40)
            end)
            table.insert(v38, v41)
            local v42 = v_u_23
            table.insert(v42, v41)
        end
        v39:swarm_on_locations_randomly(v_u_34)
        v39:stage_swarm_performances()
        v_u_20:GiveTask(v39)
        table.insert(v_u_36, v39)
    end
    coroutine.wrap(function()
        local v43 = false
        while not p_u_33:is_exited() do
            local v44 = (v_u_8.get("equip_manager") or {}).food[1]
            if v44 then
                v44 = v44.id == "honey"
            end
            if v44 or v_u_22 and (v_u_21 and v_u_21:IsDescendantOf(workspace)) then
                if v43 == false then
                    v43 = true
                    for _, v45 in pairs(v_u_36) do
                        v45:swarm_on_locations_randomly({
                            {
                                ["center_target"] = v_u_14.new(function()
                                    if v_u_22 and (v_u_21 and v_u_21:IsDescendantOf(workspace)) then
                                        return v_u_21.Core
                                    else
                                        return game.Players.LocalPlayer
                                    end
                                end),
                                ["center_offset"] = Vector3.new(0, 4, 0),
                                ["radius"] = 8,
                                ["radians_per_second"] = 4.537856055185257,
                                ["max_elevation_offset"] = 4
                            }
                        })
                    end
                end
            elseif v43 == true then
                v43 = false
                for _, v46 in pairs(v_u_36) do
                    v46:swarm_on_locations_randomly(v_u_34)
                end
            end
            wait(0.2)
        end
    end)()
end
function v_u_19.stop(p47)
    v_u_20:DoCleaning()
    v_u_23 = {}
    v_u_24 = {}
    v_u_21 = nil
    v_u_22 = false
    v_u_25.Parent = p47
end
local function v_u_51(p48)
    local v49 = {}
    for _, v50 in pairs(v_u_23) do
        if v50.base.entry.id == p48 then
            table.insert(v49, v50)
        end
    end
    return v49[v_u_17:NextInteger(1, #v49)]
end
local function v_u_72(p52, p53)
    if workspace:WaitForChild("Interiors"):FindFirstChild("CoffeeShop") then
        local v54 = game.Players.LocalPlayer.Character.HumanoidRootPart
        local v55 = p52:Clone()
        v_u_22 = true
        v_u_21 = v55
        p52:Destroy()
        v55.Parent = workspace
        v55:BreakJoints()
        for _, v56 in pairs(v55:GetDescendants()) do
            if v56:IsA("BasePart") then
                v_u_5.weld(v56, v55.Core)
                v56.CanCollide = true
            end
        end
        v55.Core.Velocity = v54.CFrame.LookVector * 25 + Vector3.new(0, 70, 0)
        local v57 = v55.Core
        local v58 = math.random()
        local v59 = math.random()
        local v60 = math.random
        v57.RotVelocity = Vector3.new(v58, v59, v60()) * 12
        wait(0.5)
        local v61 = v_u_4.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("honey", p53)
        if v61 then
            local v62 = v61[1]
            local v63 = v62.kind
            local v64 = v62.unique
            local v65 = v_u_51(v63)
            local v66 = v65.base.root.CFrame
            wait(4)
            v_u_10.set_model_collision_group(v65.base.char, "pets")
            v_u_13.end_performance(v65, v_u_16.Swarm)
            local v67 = v_u_13.stage_performance
            local v68 = {
                ["name"] = v_u_16.TargetProvider,
                ["options"] = {
                    ["movement_target"] = v_u_15.from_target_and_follow_distance(v55.Core, 1.5)
                }
            }
            v67(v65, v68)
            v_u_3.apps.SpeechBubbleApp:create(v65.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
            wait(1)
            local v69 = v_u_13.stage_performance
            local v70 = {
                ["name"] = v_u_16.AnimationProvider,
                ["options"] = {
                    ["anim_name"] = v_u_2.pets.bee.anims.eating
                }
            }
            v69(v65, v70)
            wait(1)
            v_u_22 = false
            wait(6)
            v_u_13.end_performance(v65, v_u_16.AnimationProvider)
            v_u_13.end_performance(v65, v_u_16.TargetProvider)
            v_u_24[v65]:stage_swarm_performances()
            v55:Destroy()
            v_u_10.set_model_collision_group(v65.base.char, "no_collisions")
            local v71 = v65.base.root.CFrame
            v65.base.root.CFrame = v66
            v_u_4.get("ToolAPI/Equip"):InvokeServer(v64, {
                ["spawn_cframe"] = v71
            })
        end
    else
        v_u_3.apps.DialogApp:dialog({
            ["text"] = "You need to be in the Coffee Shop to use this",
            ["button"] = "Okay"
        })
        return
    end
end
local v_u_73 = false
function v_u_19.throw_honey(...)
    if not v_u_73 then
        v_u_73 = true
        local v_u_74 = { ... }
        v_u_6.pcall_warn_error(function()
            local v75 = v_u_74
            v_u_72(unpack(v75))
        end)
        v_u_73 = false
    end
end
function v_u_19.add_dialog(p_u_76)
    local function v80()
        local v77 = v_u_12.get_pet_entity(p_u_76)
        if v77 then
            v_u_13.stage_performance(v77, {
                ["name"] = v_u_16.AnchorInPlace
            })
            local v78 = v_u_18[math.random(1, #v_u_18)]
            for _, v_u_79 in pairs(v78) do
                if typeof(v_u_79) == "string" then
                    pcall(function()
                        v_u_3.apps.SpeechBubbleApp:create(p_u_76.PetModel.Head, v_u_79)
                    end)
                else
                    wait(v_u_79)
                end
            end
            if p_u_76.Parent then
                v_u_13.end_performance(v77, v_u_16.AnchorInPlace)
            end
        end
    end
    return v_u_7:register({
        ["text"] = "Talk",
        ["part"] = p_u_76.PetModel.HumanoidRootPart,
        ["on_selected"] = v80,
        ["offset"] = Vector3.new(0, 3, 0),
        ["is_visible"] = function()
            local v81 = (v_u_8.get("equip_manager") or {}).food[1]
            if v81 then
                v81 = v81.id == "honey"
            end
            local v82 = not (v_u_73 or v81)
            if v82 then
                v82 = not v_u_22
            end
            return v82
        end
    })
end
return v_u_19