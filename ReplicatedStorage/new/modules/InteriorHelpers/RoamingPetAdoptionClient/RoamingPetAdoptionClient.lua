--// ReplicatedStorage.new.modules.InteriorHelpers.RoamingPetAdoptionClient (ModuleScript)

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.SharedModules.Maid)
local v_u_4 = require(v2.SharedPackages.Promise)
local v_u_5 = require(v2.SharedPackages.Sift)
local v6 = require(game.ReplicatedStorage.Fsys).load
local v_u_7 = v6("KindDB")
local v_u_8 = v6("PetPerformanceName")
local v_u_9 = v6("PetMovementTarget")
local v_u_10 = v6("PetEntityManager")
local v_u_11 = v6("CollisionsClient")
local v_u_12 = v6("PositionProvider")
local v_u_13 = v6("InteriorsM")
local v_u_14 = v6("UIManager")
local v_u_15 = v6("BeeSwarm")
local v_u_16 = v6("RouterClient")
local v_u_17 = v6("Utilities")
local v_u_18 = v6("PetEntityHelper")
local v_u_19 = v6("DownloadClient")
local v_u_20 = v6("PublicLootBoxRewards")
local v_u_21 = v6("new:PetRigs")
local v_u_22 = v6("LiveOpsTime")
local v_u_23 = {}
local v_u_25 = v_u_5.Dictionary.map({ "butterfly_2025_snapdragon_flower", "butterfly_2025_goldenrod_flower", "butterfly_2025_bluebell_flower" }, function(p24)
    return {
        ["required_interior"] = {
            ["interior_name"] = "Butterfly2025Sanctuary",
            ["invalid_interior_message"] = "You need to be in the Butterfly Sanctuary to use this"
        },
        ["custom_requirement_callback"] = p24 == "butterfly_2025_snapdragon_flower" and function()
            return v_u_22.get_is_day() and true or false
        end or nil
    }, p24
end)
local v_u_26 = v1.LocalPlayer
local v_u_27 = {}
local v_u_28 = {}
local v_u_29 = {}
local function v_u_34(p30)
    return v_u_19.promise_download_copy_many(v_u_5.Dictionary.map(p30, function(p31)
        return { "Pets", p31 }, p31
    end)):andThen(function(p32)
        for _, v33 in p32 do
            v_u_11.set_model_collision_group(v33, "no_collisions")
            v33:FindFirstChild("HumanoidRootPart").Anchored = false
        end
        return p32
    end)
end
local function v_u_41(p35)
    local v36 = v_u_20.request():expect()[p35]
    if v36 then
        local v37 = {}
        for _, v38 in v36.possible_loot do
            for _, v39 in v38.rewards do
                local v40 = v_u_7[v39.kind]
                if v40 and v40.category == "pets" then
                    v37[v40.kind] = true
                end
            end
        end
        return v37
    end
end
local v_u_42 = {}
v_u_42.__index = v_u_42
function v_u_42.new(_, p43)
    local v44 = {
        ["maid"] = v_u_3.new(),
        ["capture_barks"] = p43.capture_barks,
        ["pet_entities_by_kind"] = {},
        ["pet_swarms_by_entity"] = {},
        ["debounce"] = false,
        ["debounce_promise"] = v_u_4.resolve()
    }
    local v45 = v_u_42
    local v_u_46 = setmetatable(v44, v45)
    local v47 = {}
    for _, v48 in p43.swarm_locations do
        local v49 = {
            ["center_target"] = v_u_12.new(v48),
            ["radius"] = v48:GetAttribute("SwarmRadius"),
            ["radians_per_second"] = 24 / (v48:GetAttribute("SwarmRadius") or 1),
            ["max_elevation_offset"] = v48:GetAttribute("SwarmMaxElevationOffset"),
            ["weight"] = v48:GetAttribute("SwarmWeight"),
            ["max_radial_offset"] = v48:GetAttribute("SwarmMaxRadialOffset")
        }
        table.insert(v47, v49)
    end
    for v50, v51 in v_u_34(v_u_5.Dictionary.keys(p43.pets_to_spawn)):expect() do
        v_u_46.pet_entities_by_kind[v50] = {}
        for _ = 1, p43.pets_to_spawn[v50] do
            local v_u_52 = v51:Clone()
            v_u_52:PivotTo(CFrame.new(v47[math.random(1, #v47)].center_target:get_position()))
            v_u_52.Parent = workspace
            local v_u_53 = v_u_10.create_pet_entity(v_u_52, v_u_7[v50])
            v_u_28[v_u_53] = v_u_46
            local v54 = v_u_46.pet_entities_by_kind[v50]
            table.insert(v54, v_u_53)
            local v55 = v_u_15.new({ v_u_53 }, {
                ["fly_speed"] = 24,
                ["only_randomize_initial_rotations"] = true
            })
            v_u_46.pet_swarms_by_entity[v_u_53] = v55
            v55:swarm_on_locations_randomly(v47)
            v55:stage_swarm_performances()
            local v56 = v_u_18.stage_performance
            local v57 = {
                ["name"] = v_u_8.AnimationProvider,
                ["options"] = {
                    ["anim_name"] = v_u_53.base.entry.anims.running
                }
            }
            v56(v_u_53, v57)
            v_u_46.maid:GiveTask(v_u_52)
            v_u_46.maid:GiveTask(function()
                v_u_10.remove_pet_entity_by_char(v_u_52)
                v_u_28[v_u_53] = nil
            end)
            v_u_46.maid:GiveTask(v55)
        end
    end
    v_u_27[v_u_46] = true
    v_u_46.maid:GiveTask(function()
        v_u_27[v_u_46] = nil
    end)
    return v_u_46
end
function v_u_42.surround_treat_promise(p_u_58, p_u_59, p_u_60)
    return v_u_4.new(function(_, _, p61)
        local v62 = {
            ["center_target"] = v_u_12.new(function()
                return p_u_60 or v_u_26
            end),
            ["center_offset"] = Vector3.new(0, 4, 0),
            ["radius"] = 8,
            ["radians_per_second"] = 3,
            ["max_elevation_offset"] = 4
        }
        local v_u_63 = p_u_58.pet_swarms_by_entity[p_u_59]
        local v_u_64 = v_u_63:get_current_destination_list()
        p61(function()
            v_u_63:swarm_on_locations_randomly(v_u_64)
        end)
        v_u_63:swarm_on_locations_randomly({ v62 })
    end)
end
function v_u_42.chosen_entity_approach_promise(p_u_65, p_u_66, p_u_67)
    return v_u_4.new(function(_, _, p68)
        v_u_18.end_performance(p_u_66, v_u_8.Swarm)
        local v69 = v_u_18.stage_performance
        local v70 = p_u_66
        local v71 = {
            ["name"] = v_u_8.TargetProvider,
            ["options"] = {
                ["movement_target"] = v_u_9.from_target_and_follow_distance(p_u_67.PrimaryPart, 1.5)
            }
        }
        v69(v70, v71)
        p68(function()
            v_u_18.end_performance(p_u_66, v_u_8.AnimationProvider)
            v_u_18.end_performance(p_u_66, v_u_8.TargetProvider)
            local v72 = v_u_18.stage_performance
            local v73 = p_u_66
            local v74 = {
                ["name"] = v_u_8.AnimationProvider,
                ["options"] = {
                    ["anim_name"] = p_u_66.base.entry.anims.running
                }
            }
            v72(v73, v74)
            p_u_65.pet_swarms_by_entity[p_u_66]:stage_swarm_performances()
        end)
    end)
end
function v_u_42.is_debounced(p75)
    return p75.debounce
end
function v_u_42.chain_debounce_promise(p_u_76, p77)
    p_u_76.debounce = true
    p_u_76.debounce_promise = p77:finally(function()
        p_u_76.debounce = false
    end)
    return p_u_76.debounce_promise
end
function v_u_42.destroy(p78)
    p78.maid:Destroy()
end
v_u_29.register_swarm = v_u_42.new
function v_u_29.can_use_treat(p79)
    local v80 = v_u_13.get_current_location().interior.Name
    local v81 = v_u_25[p79] or v_u_23
    if v81.required_interior and v80 ~= v81.required_interior.interior_name then
        return false, v81.required_interior.invalid_interior_message
    end
    if v81.custom_requirement_callback then
        local v82, v83 = v81.custom_requirement_callback()
        if not v82 then
            return false, v83 or "You can\'t use this right now!"
        end
    end
    local v84 = v_u_41(p79)
    local v85 = false
    for v86 in v_u_27 do
        for v87 in v86.pet_entities_by_kind do
            if v84 and v84[v87] then
                if v86:is_debounced() then
                    return false
                end
                v85 = true
            end
        end
    end
    return v85 and true or false
end
function v_u_29.exchange_item_promise(p_u_88, p_u_89, p90)
    local v91 = v_u_16.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer(p_u_89.kind, p90)
    if not v91 then
        return v_u_4.reject("Failed to exchange item")
    end
    local v92 = v91[1]
    local v93 = v92.kind
    local v_u_94 = v92.unique
    local v95 = v_u_41(p_u_89.kind)
    local v96 = {}
    local v97 = {}
    local v98 = {}
    for v99 in v_u_27 do
        for v100, v101 in v99.pet_entities_by_kind do
            if not v95 or v95[v100] then
                v96[v99] = true
                for _, v102 in v101 do
                    if v100 == v93 then
                        table.insert(v97, v102)
                    end
                    table.insert(v98, v102)
                end
            end
        end
    end
    local v_u_103 = v97[math.random(1, #v97)]
    local v_u_104 = v_u_103.base.root.CFrame
    local v_u_105 = v_u_4.resolve()
    local v_u_107 = v_u_5.Array.map(v98, function(p106)
        return v_u_28[p106]:surround_treat_promise(p106, p_u_88)
    end)
    local v_u_117 = v_u_4.delay(4.5):andThen(function()
        v_u_11.set_model_collision_group(v_u_103.base.char, "pets")
        local v108 = v_u_28[v_u_103]
        v_u_105 = v108:chosen_entity_approach_promise(v_u_103, p_u_88)
        if v108.capture_barks then
            local v109 = v_u_103.base.char.PetModel
            local v110 = v_u_21.get(v109).get_part(v109, "Head")
            local v111 = v108.capture_barks[math.random(1, #v108.capture_barks)]
            v_u_14.apps.SpeechBubbleApp:create(v110, (v111:gsub("%$%w+", {
                ["$FOOD"] = p_u_89.name
            })))
        end
        return v_u_4.delay(1)
    end):andThen(function()
        v_u_18.end_performance(v_u_103, v_u_8.AnimationProvider)
        local v112 = v_u_18.stage_performance
        local v113 = v_u_103
        local v114 = {
            ["name"] = v_u_8.AnimationProvider,
            ["options"] = {
                ["anim_name"] = v_u_103.base.entry.anims.eating
            }
        }
        v112(v113, v114)
        return v_u_4.delay(6)
    end):andThen(function()
        v_u_11.set_model_collision_group(v_u_103.base.char, "no_collisions")
        local v115 = v_u_103.base.root.CFrame
        v_u_103.base.root.CFrame = v_u_104
        v_u_105:cancel()
        for _, v116 in v_u_107 do
            v116:cancel()
        end
        v_u_16.get("ToolAPI/Equip"):InvokeServer(v_u_94, {
            ["spawn_cframe"] = v115
        })
    end)
    return v_u_4.all(v_u_5.Array.map(v_u_5.Set.toArray(v96), function(p118)
        return p118:chain_debounce_promise(v_u_117)
    end))
end
function v_u_29.throw_food_tool(p_u_119, p120)
    local v_u_121 = p120.tool.ModelHandle
    local v122 = p120.item_data.unique
    local v123, v124 = v_u_29.can_use_treat(p_u_119.kind)
    if v123 then
        local v_u_125 = v_u_121:Clone()
        v_u_4.all({ v_u_29.exchange_item_promise(v_u_125, p_u_119, v122), v_u_4.try(function()
                v_u_121:Destroy()
                v_u_125.Name = p_u_119.kind
                v_u_125.Parent = workspace
                v_u_125:BreakJoints()
                for _, v126 in v_u_125:GetDescendants() do
                    if v126:IsA("BasePart") then
                        v_u_17.weld(v126, v_u_125.PrimaryPart)
                        v126.CanCollide = true
                    end
                end
                local v127 = v_u_26.Character.HumanoidRootPart
                v_u_125.PrimaryPart.Velocity = v127.CFrame.LookVector * 25 + Vector3.new(0, 70, 0)
                local v128 = v_u_125.PrimaryPart
                local v129 = math.random()
                local v130 = math.random()
                local v131 = math.random
                v128.RotVelocity = Vector3.new(v129, v130, v131()) * 12
            end) }):done(function()
            v_u_125:Destroy()
        end)
    elseif v124 then
        v_u_14.apps.DialogApp:dialog({
            ["text"] = v124,
            ["button"] = "Okay"
        })
    end
end
return v_u_29