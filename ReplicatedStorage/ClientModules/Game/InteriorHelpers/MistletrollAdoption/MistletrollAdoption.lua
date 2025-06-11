--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.MistletrollAdoption (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("MinigameClientManager")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("PetMovementTarget")
local v_u_5 = v1("PetEntityManager")
local v_u_6 = v1("CollisionsClient")
v1("PositionProvider")
local v_u_7 = v1("PetEntityHelper")
local v_u_8 = v1("DownloadClient")
local v_u_9 = v1("RouterClient")
local v_u_10 = v1("InventoryDB")
local v_u_11 = v1("ClientData")
local v_u_12 = v1("InteriorsM")
local v_u_13 = v1("UIManager")
local v_u_14 = v1("Utilities")
v1("BeeSwarm")
local v_u_15 = v1("HouseDB")
local v_u_16 = v1("Debug")
local v17 = v1("Maid")
local v_u_18 = v1("GameplayFX")
local v_u_19 = v1("package:Promise")
local v_u_20 = Random.new()
local v_u_21 = v17.new()
local v_u_22 = {}
local v_u_23 = {
    ["winter_2024_merry_mistletroll"] = {},
    ["winter_2024_royal_mistletroll"] = {},
    ["winter_2024_naughty_mistletroll"] = {}
}
local v_u_24 = {}
local v_u_25 = {
    ["MainMap"] = true,
    ["Neighborhood"] = true,
    ["housing!sandbox_island"] = true,
    ["housing!castle_house"] = true,
    ["housing!racetrack_house"] = true,
    ["Winter2024Shop"] = true
}
local function v_u_30()
    local v26 = game.Players.LocalPlayer.Character
    if v26 then
        v26 = v26:FindFirstChild("HumanoidRootPart")
    end
    if v26 then
        for _, v27 in v_u_2.get_all() do
            if v27.is_participating then
                return false, "You can\'t use this during a minigame!"
            end
        end
        local v28 = v_u_12.get_current_location()
        if v28 then
            v28 = v28.destination_id
        end
        if v28 == "housing" then
            local v29 = v_u_15[(v_u_11.get("house_interior") or {}).building_type]
            if v29 then
                v28 = v28 .. "!" .. v29.id
            end
        end
        if v28 and v_u_25[v28] then
            return true, nil
        else
            return false, "You must be outside to use this!"
        end
    else
        return false
    end
end
local function v_u_42(p31, p32)
    local v33 = tick()
    while true do
        local v34 = {}
        for _, v35 in p31 do
            if (p32.Head.Position - v35.base.root.Position).Magnitude > 20 then
                table.insert(v34, v35)
            end
        end
        if #v34 == 0 then
            return
        end
        if tick() - v33 > 7 then
            for _, v36 in pairs(v34) do
                local v37 = v36.base.root
                local v38 = CFrame.new
                local v39 = p32.Head.Position
                local v40 = math.random(-20, 20) / 10
                local v41 = math.random(-20, 20) / 10
                v37.CFrame = v38(v39 + Vector3.new(v40, 5, v41))
            end
            return
        end
        task.wait(0.3)
    end
end
function create_pets(p43)
    v_u_21:GiveTask(function()
        for _, v44 in v_u_22 do
            v_u_5.remove_pet_entity_by_entity(v44)
        end
        for v45, _ in v_u_23 do
            v_u_23[v45] = {}
        end
        v_u_22 = {}
    end)
    for _ = 1, 3 do
        for v46, _ in v_u_23 do
            local v47 = v_u_24.get_pet_model(v46)
            if v47 then
                local v_u_48 = v47:Clone()
                v_u_21:GiveTask(function()
                    local v49 = v_u_48:GetPivot().Position
                    v_u_18.emit_poof(v49, 15, 1)
                    v_u_48:Destroy()
                end)
                local v50 = p43:GetPivot().Position
                local v51 = v_u_20:NextInteger(-10, 10)
                local v52 = v_u_20
                local v53 = v50 + Vector3.new(v51, 0, v52:NextInteger(-10, 10))
                v_u_48:PivotTo(CFrame.new(v53))
                v_u_48.Parent = workspace
                v_u_18.emit_poof(v53, 15, 1)
                v_u_6.set_model_collision_group(v_u_48, "roaming_pets")
                local v54 = v_u_5.create_pet_entity(v_u_48, v_u_10.pets[v46])
                local v55 = v_u_22
                table.insert(v55, v54)
                local v56 = v_u_23[v46]
                table.insert(v56, v54)
                task.wait()
            end
        end
    end
    for _, v57 in v_u_22 do
        local v58 = p43.Head
        local v59 = 4 + 10 * math.random()
        local v60 = v_u_7.stage_performance
        local v61 = {
            ["name"] = v_u_3.TargetProvider,
            ["options"] = {
                ["movement_target"] = v_u_4.from_target_and_follow_distance(v58, v59)
            }
        }
        v60(v57, v61)
    end
end
local function v_u_88(p62, p63)
    local v64, v65 = v_u_30()
    if v64 then
        local v66 = game.Players.LocalPlayer.Character.HumanoidRootPart
        local v_u_67 = p62:Clone()
        v_u_21:GiveTask(v_u_67)
        p62:Destroy()
        v_u_67.Parent = workspace
        v_u_67:BreakJoints()
        v_u_6.set_model_collision_group(v_u_67, "roaming_pets")
        for _, v68 in v_u_67:GetDescendants() do
            if v68:IsA("BasePart") then
                v_u_14.weld(v68, v_u_67.Head)
                v68.CanCollide = true
            end
        end
        v_u_67.Head.Velocity = v66.CFrame.LookVector * 20 + Vector3.new(0, 20, 0)
        local v69 = v_u_67.Head
        local v70 = math.random()
        local v71 = math.random()
        local v72 = math.random
        v69.RotVelocity = Vector3.new(v70, v71, v72()) * 6
        task.wait(0.5)
        local v73 = v_u_9.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("winter_2024_golden_mistletoe", p63)
        if v73 then
            local v74 = v73[1]
            local v75 = v74.kind
            local v_u_76 = v74.unique
            create_pets(v_u_67)
            local v77 = v_u_23[v75]
            local v_u_78 = v77[v_u_20:NextInteger(1, #v77)]
            v_u_42(v_u_22, v_u_67)
            for _, v79 in v_u_67:GetDescendants() do
                if v79:IsA("BasePart") then
                    v79.CanCollide = false
                    v79.Anchored = true
                end
            end
            return v_u_19.delay(5):andThen(function()
                v_u_6.set_model_collision_group(v_u_78.base.char, "pets")
                local v80 = v_u_7.stage_performance
                local v81 = v_u_78
                local v82 = {
                    ["name"] = v_u_3.TargetProvider,
                    ["options"] = {
                        ["movement_target"] = v_u_4.from_target_and_follow_distance(v_u_67, 1.5)
                    }
                }
                v80(v81, v82)
                v_u_13.apps.SpeechBubbleApp:create(v_u_78.base.char.PetModel.Head, "Yummy! \240\159\146\149 Thanks " .. game.Players.LocalPlayer.Name)
                return v_u_19.delay(2)
            end):andThen(function()
                local v83 = v_u_7.stage_performance
                local v84 = v_u_78
                local v85 = {
                    ["name"] = v_u_3.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = v_u_10.pets.winter_2024_mistletroll.anims.eating
                    }
                }
                v83(v84, v85)
                return v_u_19.delay(2)
            end):andThen(function()
                v_u_67:Destroy()
                local v86 = v_u_78.base.root.CFrame
                v_u_7.end_performance(v_u_78, v_u_3.AnimationProvider)
                v_u_7.end_performance(v_u_78, v_u_3.TargetProvider)
                v_u_9.get("ToolAPI/Equip"):InvokeServer(v_u_76, {
                    ["spawn_cframe"] = v86
                })
                v_u_78.base.char:Destroy()
                return v_u_19.delay(3)
            end):catch(function(p87)
                warn("Something went wrong:", p87)
            end)
        end
    else
        v_u_13.apps.DialogApp:dialog({
            ["text"] = v65 or "You can\'t use this right now!",
            ["button"] = "Okay"
        })
    end
end
local v_u_89 = false
function v_u_24.throw_food(...)
    if not v_u_89 then
        v_u_89 = true
        local v_u_90 = { ... }
        v_u_16.pcall_warn_error(function()
            local v91 = v_u_90
            local v92 = v_u_88(unpack(v91))
            if v92 then
                v92:await()
            end
        end)
        v_u_24.cleanup()
        v_u_89 = false
    end
end
function v_u_24.cleanup()
    v_u_21:DoCleaning()
end
function v_u_24.get_pet_model(p93)
    v_u_24.pet_models = v_u_24.pet_models or {}
    if v_u_24.pet_models[p93] then
        return v_u_24.pet_models[p93]
    end
    v_u_24.pet_models[p93] = v_u_8.promise_download_copy("Pets", p93):expect()
    return v_u_24.pet_models[p93]
end
return v_u_24