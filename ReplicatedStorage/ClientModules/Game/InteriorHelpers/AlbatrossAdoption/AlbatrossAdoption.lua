--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.AlbatrossAdoption (ModuleScript)

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
    { "AHHHHHH I HAVE THE ZOOMIES", 5 },
    { "Zoom! Bet you didn\'t see that one coming", 5 },
    { "Look out! Get out the way! Coming in hot!", 5 },
    { "Pffft! Bet you haven\'t seen any other birds with wings this big!", 5 }
}
local v_u_19 = {
    ["snow_2022_albatross"] = 10,
    ["snow_2022_golden_albatross"] = 1,
    ["snow_2022_diamond_albatross"] = 1
}
local v_u_20 = v_u_3.pets.snow_2022_albatross.anims.eating
local v_u_21 = v11.new()
local v_u_22 = nil
local v_u_23 = false
local v_u_24 = {}
local v_u_25 = {}
local v_u_26 = nil
local v_u_27 = nil
local function v_u_35(p28)
    local v29 = p28.ThrowZones
    for _, v30 in ipairs(v29:GetChildren()) do
        local v31 = game.Players.LocalPlayer.Character
        if v31 then
            v31 = v31:FindFirstChild("HumanoidRootPart")
        end
        if not v31 then
            return false
        end
        local v32 = v30.CFrame:PointToObjectSpace(v31.Position)
        local v33 = v32.X
        if math.abs(v33) < v30.Size.X / 2 then
            local v34 = v32.Z
            if math.abs(v34) < v30.Size.Z / 2 then
                return true, nil
            end
        end
    end
    return false, "You need to get closer to the albatrosses to use this"
end
local function v_u_43(p_u_36)
    local function v40()
        local v37 = v_u_12.get_pet_entity(p_u_36)
        if v37 then
            v_u_13.stage_performance(v37, {
                ["name"] = v_u_16.AnchorInPlace
            })
            local v38 = v_u_18[math.random(1, #v_u_18)]
            for _, v_u_39 in ipairs(v38) do
                if typeof(v_u_39) == "string" then
                    pcall(function()
                        v_u_4.apps.SpeechBubbleApp:create(p_u_36.PetModel.Head, v_u_39)
                    end)
                else
                    v_u_17.delay(v_u_39):await()
                end
            end
            if p_u_36.Parent then
                v_u_13.end_performance(v37, v_u_16.AnchorInPlace)
            end
        end
    end
    return v_u_7:register({
        ["text"] = "Talk",
        ["part"] = p_u_36.PetModel.HumanoidRootPart,
        ["on_selected"] = v40,
        ["offset"] = Vector3.new(0, 3, 0),
        ["is_visible"] = function()
            local v41 = not v_u_23
            if v41 then
                local v42 = (v_u_8.get("equip_manager") or {}).food[1]
                if v42 then
                    v42 = v42.kind == "snow_2022_golden_clam"
                end
                v41 = not v42
            end
            return v41
        end
    })
end
local v64 = {
    ["start"] = function(p44, p_u_45)
        v_u_27 = p44.PetTemplates
        v_u_27.Parent = nil
        for _, v46 in ipairs(v_u_27:GetChildren()) do
            v_u_10.set_model_collision_group(v46, "no_collisions")
        end
        local v_u_47 = {}
        for _, v48 in ipairs(p44.SwarmAreas:GetChildren()) do
            local v49 = {
                ["center_target"] = v_u_14.new(v48),
                ["radius"] = v48:GetAttribute("SwarmRadius"),
                ["radians_per_second"] = 24 / v48:GetAttribute("SwarmRadius"),
                ["max_elevation_offset"] = v48:GetAttribute("SwarmMaxElevationOffset"),
                ["weight"] = v48:GetAttribute("SwarmWeight"),
                ["max_radial_offset"] = v48:GetAttribute("SwarmMaxRadialOffset")
            }
            table.insert(v_u_47, v49)
        end
        local v_u_50 = {}
        local function v57(p51)
            local v_u_52 = v_u_27:FindFirstChild(p51):Clone()
            v_u_52.HumanoidRootPart.Anchored = false
            v_u_52.Parent = workspace
            v_u_21:GiveTask(v_u_52)
            v_u_21:GiveTask((v_u_43(v_u_52)))
            local v53 = v_u_12.create_pet_entity(v_u_52, v_u_3.pets[v_u_52.Name])
            v_u_21:GiveTask(function()
                v_u_12.remove_pet_entity_by_char(v_u_52)
            end)
            local v54 = v_u_24
            table.insert(v54, v53)
            local v55 = v_u_9.new({ v53 }, {
                ["fly_speed"] = 24,
                ["only_randomize_initial_rotations"] = true
            })
            v_u_25[v53] = v55
            v55:swarm_on_locations_randomly(v_u_47)
            v55:stage_swarm_performances()
            v_u_21:GiveTask(v55)
            local v56 = v_u_50
            table.insert(v56, v55)
        end
        for v58, v59 in pairs(v_u_19) do
            for _ = 1, v59 do
                v57(v58)
            end
        end
        v_u_17.try(function()
            local v60 = false
            while not p_u_45:is_exited() do
                local v61 = nil
                if v_u_26 ~= nil then
                    if not v60 then
                        v61 = {
                            {
                                ["center_target"] = v_u_14.new(function()
                                    return v_u_26 or v_u_1.LocalPlayer
                                end),
                                ["center_offset"] = Vector3.new(0, 4, 0),
                                ["radius"] = 8,
                                ["radians_per_second"] = 3,
                                ["max_elevation_offset"] = 4
                            }
                        }
                        v60 = true
                    end
                elseif v60 then
                    v61 = v_u_47
                    v60 = false
                end
                if v61 then
                    for _, v62 in ipairs(v_u_50) do
                        v62:swarm_on_locations_randomly(v61)
                    end
                end
                v_u_17.delay(0.2):await()
            end
        end)
    end,
    ["stop"] = function(p63)
        v_u_21:DoCleaning()
        if v_u_22 then
            v_u_22:cancel()
        end
        v_u_24 = {}
        v_u_25 = {}
        v_u_27.Parent = p63
    end
}
local function v_u_68(p65)
    local v66 = {}
    for _, v67 in pairs(v_u_24) do
        if v67.base.entry.id == p65 then
            table.insert(v66, v67)
        end
    end
    return v66[math.random(1, #v66)]
end
local function v_u_95(p69, p70)
    local v71 = workspace:WaitForChild("Interiors"):FindFirstChild("SnowShop")
    if v71 then
        local v72, v73 = v_u_35(v71)
        if v72 then
            local v_u_74 = p69:Clone()
            local v75 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("snow_2022_golden_clam", p70)
            if v75 then
                local v76 = v75[1]
                local v77 = v76.kind
                local v_u_78 = v76.unique
                p69:Destroy()
                v_u_74.Parent = workspace
                v_u_74:BreakJoints()
                v_u_26 = v_u_74
                for _, v79 in ipairs(v_u_74:GetDescendants()) do
                    if v79:IsA("BasePart") then
                        v_u_6.weld(v79, v_u_74.Core)
                        v79.CanCollide = true
                    end
                end
                local v80 = game.Players.LocalPlayer.Character.HumanoidRootPart
                v_u_74.Core.Velocity = v80.CFrame.LookVector * 25 + Vector3.new(0, 70, 0)
                local v81 = v_u_74.Core
                local v82 = math.random()
                local v83 = math.random()
                local v84 = math.random
                v81.RotVelocity = Vector3.new(v82, v83, v84()) * 12
                local v_u_85 = v_u_68(v77)
                local v_u_86 = v_u_85.base.root.CFrame
                local function v_u_88()
                    v_u_22 = nil
                    v_u_26 = nil
                    v_u_74:Destroy()
                    v_u_10.set_model_collision_group(v_u_85.base.char, "no_collisions")
                    v_u_25[v_u_85]:stage_swarm_performances()
                    local v87 = v_u_85.base.root.CFrame
                    v_u_85.base.root.CFrame = v_u_86
                    v_u_5.get("ToolAPI/Equip"):InvokeServer(v_u_78, {
                        ["spawn_cframe"] = v87
                    })
                end
                v_u_22 = v_u_17.delay(4.5):andThen(function()
                    v_u_10.set_model_collision_group(v_u_85.base.char, "pets")
                    v_u_13.end_performance(v_u_85, v_u_16.Swarm)
                    local v89 = v_u_13.stage_performance
                    local v90 = v_u_85
                    local v91 = {
                        ["name"] = v_u_16.TargetProvider,
                        ["options"] = {
                            ["movement_target"] = v_u_15.from_target_and_follow_distance(v_u_74.Core, 1.5)
                        }
                    }
                    v89(v90, v91)
                    v_u_4.apps.SpeechBubbleApp:create(v_u_85.base.char.PetModel.Head, "Mmmmm, clams...")
                    return v_u_17.delay(1)
                end):andThen(function()
                    v_u_26 = nil
                    local v92 = v_u_13.stage_performance
                    local v93 = v_u_85
                    local v94 = {
                        ["name"] = v_u_16.AnimationProvider,
                        ["options"] = {
                            ["anim_name"] = v_u_20
                        }
                    }
                    v92(v93, v94)
                    return v_u_17.delay(6)
                end):andThen(function()
                    v_u_13.end_performance(v_u_85, v_u_16.AnimationProvider)
                    v_u_13.end_performance(v_u_85, v_u_16.TargetProvider)
                end):finally(function()
                    v_u_88()
                end)
                return v_u_22
            end
        else
            v_u_4.apps.DialogApp:dialog({
                ["text"] = v73,
                ["button"] = "Okay"
            })
        end
    else
        v_u_4.apps.DialogApp:dialog({
            ["text"] = ("You need to be in the %s to use this"):format("Snowy Igloo Shop"),
            ["button"] = "Okay"
        })
        return
    end
end
function v64.throw_treat(p96, p97)
    if not v_u_23 then
        v_u_23 = true
        v_u_17.try(v_u_95, p96, p97):await()
        v_u_23 = false
    end
end
return v64