--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.HummingbirdAdoption (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("MinigameClientManager")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("PetMovementTarget")
local v_u_5 = v1("PetEntityManager")
local v_u_6 = v1("CollisionsClient")
local v_u_7 = v1("PositionProvider")
local v_u_8 = v1("PetEntityHelper")
local v_u_9 = v1("DownloadClient")
local v_u_10 = v1("RouterClient")
local v_u_11 = v1("InventoryDB")
local v_u_12 = v1("ClientData")
local v_u_13 = v1("InteriorsM")
local v_u_14 = v1("UIManager")
local v_u_15 = v1("Utilities")
local v_u_16 = v1("BeeSwarm")
local v_u_17 = v1("HouseDB")
local v_u_18 = v1("Debug")
local v19 = v1("Maid")
local v_u_20 = v1("package:Promise")
local v_u_21 = Random.new()
local v_u_22 = v19.new()
local v_u_23 = {}
local v_u_24 = {}
local v_u_25 = {
    ["subscription_2024_hummingbird"] = {},
    ["subscription_2024_diamond_hummingbird"] = {},
    ["subscription_2024_gold_hummingbird"] = {}
}
local v_u_26 = {}
local v_u_27 = {
    ["MainMap"] = true,
    ["Neighborhood"] = true,
    ["housing!sandbox_island"] = true,
    ["housing!castle_house"] = true,
    ["housing!racetrack_house"] = true
}
local function v_u_32()
    local v28 = game.Players.LocalPlayer.Character
    if v28 then
        v28 = v28:FindFirstChild("HumanoidRootPart")
    end
    if v28 then
        for _, v29 in v_u_2.get_all() do
            if v29.is_participating then
                return false, "You can\'t use this during a minigame!"
            end
        end
        local v30 = v_u_13.get_current_location()
        if v30 then
            v30 = v30.destination_id
        end
        if v30 == "housing" then
            local v31 = v_u_17[(v_u_12.get("house_interior") or {}).building_type]
            if v31 then
                v30 = v30 .. "!" .. v31.id
            end
        end
        if v30 and v_u_27[v30] then
            return true, nil
        else
            return false, "You must be outside to use this!"
        end
    else
        return false
    end
end
local function v_u_44(p33, p34)
    local v35 = tick()
    while true do
        local v36 = {}
        for _, v37 in p33 do
            if (p34.Head.Position - v37.base.root.Position).Magnitude > 20 then
                table.insert(v36, v37)
            end
        end
        if #v36 == 0 then
            return
        end
        if tick() - v35 > 7 then
            for _, v38 in pairs(v36) do
                local v39 = v38.base.root
                local v40 = CFrame.new
                local v41 = p34.Head.Position
                local v42 = math.random(-20, 20) / 10
                local v43 = math.random(-20, 20) / 10
                v39.CFrame = v40(v41 + Vector3.new(v42, 5, v43))
            end
            return
        end
        task.wait(0.3)
    end
end
function create_pets(p45)
    v_u_22:GiveTask(function()
        for _, v46 in v_u_23 do
            v_u_5.remove_pet_entity_by_entity(v46)
        end
        for v47, _ in v_u_25 do
            v_u_25[v47] = {}
        end
        v_u_23 = {}
        v_u_24 = {}
    end)
    for _ = 1, 3 do
        for v48, _ in v_u_25 do
            local v49 = v_u_26.get_pet_model(v48)
            if v49 then
                local v50 = v49:Clone()
                v_u_22:GiveTask(v50)
                local v51 = CFrame.new
                local v52 = p45:GetPivot().Position
                local v53 = v_u_21:NextInteger(-10, 10)
                local v54 = v_u_21:NextInteger(20, 40)
                local v55 = v_u_21
                v50:PivotTo(v51(v52 + Vector3.new(v53, v54, v55:NextInteger(-10, 10))))
                v50.Parent = workspace
                v_u_6.set_model_collision_group(v50, "no_collisions")
                local v56 = v_u_5.create_pet_entity(v50, v_u_11.pets[v48])
                local v57 = v_u_23
                table.insert(v57, v56)
                local v58 = v_u_25[v48]
                table.insert(v58, v56)
                local v59 = v_u_16.new({ v56 })
                v_u_22:GiveTask(v59)
                v_u_24[v56] = v59
                local v60 = {
                    ["center_target"] = v_u_7.new(p45),
                    ["center_offset"] = Vector3.new(0, 10, 0),
                    ["radius"] = v_u_21:NextInteger(6, 12)
                }
                local v61 = v_u_21:NextInteger(180, 260)
                v60.radians_per_second = math.rad(v61)
                v60.max_elevation_offset = 8
                v59:set_swarm_destination(v60)
                v59:stage_swarm_performances(v_u_21:NextNumber(0.2, 0.5))
                task.wait()
            end
        end
    end
end
local function v_u_96(p62, p63)
    local v64, v65 = v_u_32()
    if v64 then
        local v_u_66 = game.Players.LocalPlayer.Character.HumanoidRootPart
        local v_u_67 = p62:Clone()
        v_u_22:GiveTask(v_u_67)
        p62:Destroy()
        v_u_67.Parent = workspace
        v_u_67:BreakJoints()
        v_u_6.set_model_collision_group(v_u_67, "roaming_pets")
        for _, v68 in v_u_67:GetDescendants() do
            if v68:IsA("BasePart") then
                v_u_15.weld(v68, v_u_67.Head)
                v68.CanCollide = true
            end
        end
        v_u_67.Head.Velocity = v_u_66.CFrame.LookVector * 20 + Vector3.new(0, 20, 0)
        local v69 = v_u_67.Head
        local v70 = math.random()
        local v71 = math.random()
        local v72 = math.random
        v69.RotVelocity = Vector3.new(v70, v71, v72()) * 6
        task.wait(0.5)
        local v73 = v_u_10.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("subscription_2024_golden_flower", p63)
        if v73 then
            local v74 = v73[1]
            local v75 = v74.kind
            local v_u_76 = v74.unique
            create_pets(v_u_67)
            local v77 = v_u_25[v75]
            local v_u_78 = v77[v_u_21:NextInteger(1, #v77)]
            v_u_44(v_u_23, v_u_67)
            for _, v79 in v_u_67:GetDescendants() do
                if v79:IsA("BasePart") then
                    v79.CanCollide = false
                    v79.Anchored = true
                end
            end
            return v_u_20.delay(5):andThen(function()
                v_u_6.set_model_collision_group(v_u_78.base.char, "pets")
                v_u_8.end_performance(v_u_78, v_u_3.Swarm)
                local v80 = v_u_8.stage_performance
                local v81 = v_u_78
                local v82 = {
                    ["name"] = v_u_3.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_4.from_target_and_follow_distance(v_u_67, 1.5)
                    }
                }
                v80(v81, v82)
                v_u_14.apps.SpeechBubbleApp:create(v_u_78.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                return v_u_20.delay(2)
            end):andThen(function()
                local v83 = v_u_8.stage_performance
                local v84 = v_u_78
                local v85 = {
                    ["name"] = v_u_3.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = v_u_11.pets.subscription_2024_hummingbird.anims.eating
                    }
                }
                v83(v84, v85)
                return v_u_20.delay(2)
            end):andThen(function()
                v_u_67:Destroy()
                local v86 = v_u_24[v_u_78]
                for v87, v88 in v_u_24 do
                    if v87 ~= v_u_78 then
                        local v89 = {
                            ["center_target"] = v_u_7.new(v_u_66)
                        }
                        local v90 = v_u_21:NextInteger(-200, 200)
                        local v91 = v_u_21:NextInteger(150, 350)
                        local v92 = v_u_21
                        v89.center_offset = Vector3.new(v90, v91, v92:NextInteger(-200, 200))
                        v89.radius = v_u_21:NextInteger(6, 15)
                        local v93 = v_u_21:NextInteger(80, 160)
                        v89.radians_per_second = math.rad(v93)
                        v89.max_elevation_offset = 6
                        v88:set_swarm_destination(v89)
                        v88:stage_swarm_performances()
                        task.wait(v_u_21:NextNumber(0.1, 0.4))
                    end
                end
                local v94 = v_u_78.base.root.CFrame
                v_u_8.end_performance(v_u_78, v_u_3.AnimationProvider)
                v_u_8.end_performance(v_u_78, v_u_3.TargetProvider)
                v_u_10.get("ToolAPI/Equip"):InvokeServer(v_u_76, {
                    ["spawn_cframe"] = v94
                })
                v86:destroy()
                v_u_78.base.char:Destroy()
                return v_u_20.delay(3)
            end):catch(function(p95)
                warn("Something went wrong:", p95)
            end)
        end
    else
        v_u_14.apps.DialogApp:dialog({
            ["text"] = v65 or "You can\'t use this right now!",
            ["button"] = "Okay"
        })
    end
end
local v_u_97 = false
function v_u_26.throw_food(...)
    if not v_u_97 then
        v_u_97 = true
        local v_u_98 = { ... }
        v_u_18.pcall_warn_error(function()
            local v99 = v_u_98
            local v100 = v_u_96(unpack(v99))
            if v100 then
                v100:await()
            end
        end)
        v_u_26.cleanup()
        v_u_97 = false
    end
end
function v_u_26.cleanup()
    v_u_22:DoCleaning()
end
function v_u_26.get_pet_model(p101)
    v_u_26.pet_models = v_u_26.pet_models or {}
    if v_u_26.pet_models[p101] then
        return v_u_26.pet_models[p101]
    end
    v_u_26.pet_models[p101] = v_u_9.promise_download_copy("Pets", p101):expect()
    return v_u_26.pet_models[p101]
end
return v_u_26