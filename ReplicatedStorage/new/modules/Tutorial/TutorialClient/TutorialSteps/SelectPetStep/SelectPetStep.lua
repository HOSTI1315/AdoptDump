--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.SelectPetStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
require(script.Parent.Parent.Parent.Parent.NPCBehaviors.NPCController)
local v_u_2 = require(script.Parent.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_3 = require(script.Parent.Parent.TutorialHelper)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v5 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v5("ClientData")
local v_u_7 = v5("ClientToolManager")
local v_u_8 = v5("ContentPackHelper").load_module("Tutorial2025", "Dialog")
local v_u_9 = v5("MinigameForcedState")
local v_u_10 = v5("NPCManager")
local v_u_11 = v5("PetMannequin")
local v_u_12 = v5("RouterClient")
local v_u_13 = v5("UIManager")
local v_u_14 = {}
v_u_14.__index = v_u_14
setmetatable(v_u_14, v1)
function v_u_14.new(p15)
    local v16 = v_u_14
    local v17 = setmetatable({
        ["tutorial"] = p15,
        ["_old_transparencies"] = {},
        ["_interacted_with_anything"] = false
    }, v16)
    v17:init()
    return v17
end
function v_u_14.start(p_u_18)
    p_u_18:_update_minigame_forced_state()
    local v_u_19 = p_u_18.tutorial.memory.controllers
    p_u_18:_setup_sir_woofington(v_u_19.sir_woofington)
    local v_u_20 = {}
    for _, v21 in v_u_2:get_value("valid_pet_kinds_sorted") do
        local v22 = v_u_19[v21]
        table.insert(v_u_20, p_u_18:_setup_pet(v22, v21))
    end
    v_u_13.apps.MannequinPurchaseApp:set_mannequin_list(v_u_20)
    for _, v23 in v_u_20 do
        p_u_18:_hide_model(v23.model)
    end
    local v24 = v_u_13.apps.MannequinPurchaseApp:get_visibility_changed_signal()
    local v_u_25 = false
    p_u_18.maid:GiveTask(v24:Connect(function(p26)
        v_u_25 = p26
        for v27, v28 in p_u_18._old_transparencies do
            v27.LocalTransparencyModifier = v28
        end
        p_u_18._old_transparencies = {}
        if p26 then
            for _, v29 in v_u_19 do
                p_u_18:_hide_model(v29.model)
            end
        else
            for _, v30 in v_u_20 do
                p_u_18:_hide_model(v30.model)
            end
        end
    end))
    p_u_18.maid:GiveTask(function()
        v_u_13.set_app_visibility("MannequinPurchaseApp", false)
        v_u_13.apps.MannequinPurchaseApp:set_mannequin_list({})
        v_u_13.apps.MannequinPurchaseApp:show_cancel_button()
        for _, v31 in v_u_20 do
            v31.model:Destroy()
            v31:destroy()
        end
        if v_u_25 then
            for v32, v33 in p_u_18._old_transparencies do
                v32.LocalTransparencyModifier = v33
            end
            p_u_18._old_transparencies = {}
        end
        for v34, v35 in v_u_19 do
            if v34 ~= "sir_woofington" then
                v35:stop_action()
            end
        end
    end)
    p_u_18.maid:GiveTask(v_u_3.run_fireworks(p_u_18.tutorial.shared_model))
    v_u_13.apps.MannequinPurchaseApp:hide_cancel_button()
    v_u_13.apps.MannequinPurchaseApp:enter(v_u_2:get_value("valid_pet_kinds_sorted")[1])
    local v36 = v_u_8[1]
    v_u_13.apps.DialogApp:dialog({
        ["text"] = v36[2].text,
        ["button"] = "Let\'s Go!"
    })
    v_u_12.get("TutorialAPI/ReportDiscreteStep"):FireServer("npc_interaction")
end
function v_u_14._update_minigame_forced_state(_)
    v_u_9.disable()
    local v37 = v_u_9.enable
    local v38 = v_u_4.Dictionary.mergeDeep
    local v39 = v_u_9.RESTRICT_ALL
    local v41 = {
        ["app_visibility"] = {
            ["app_names"] = { "MannequinPurchaseApp", "GuideArrowApp" }
        },
        ["forced_equips"] = v_u_4.None,
        ["filter_equips"] = function(p40)
            return v_u_2:get_value("valid_pet_kinds")[p40.kind] or false
        end
    }
    v37(v38(v39, v41))
end
function v_u_14._create_sir_woofington_npc(p42, p43)
    local v44 = p43.model:FindFirstChild("HumanoidRootPart", true)
    local v45 = v44.CFrame * Vector3.new(0, 5, -8.8)
    local v46 = v44.CFrame * Vector3.new(0, 3.6, 0)
    local v47 = v_u_10.create
    local v48 = {
        ["model"] = p43.model,
        ["speech_bubble_part"] = p43.model:FindFirstChild("PetModel", true):FindFirstChild("Head"),
        ["speech_focus_positions"] = {
            ["camera_origin"] = v45,
            ["camera_target"] = v46
        }
    }
    local v49 = v47(v48)
    p42.tutorial.memory.sir_woofington = v49
    return v49
end
function v_u_14._setup_sir_woofington(p50, p_u_51)
    p50:_create_sir_woofington_npc(p_u_51)
    p_u_51:do_action(function()
        return p_u_51:look_at_player_promise()
    end)
end
function v_u_14._setup_pet(p_u_52, p_u_53, p_u_54)
    p_u_53:do_action(function()
        return p_u_53:look_at_player_promise()
    end)
    local v55 = p_u_52.tutorial.memory.model_cache[p_u_54]:FindFirstChildWhichIsA("Model"):Clone()
    v55:FindFirstChild("HumanoidRootPart").Anchored = true
    v55.Parent = workspace
    local v56 = p_u_53.model.PetModel.HumanoidRootPart:GetPivot()
    return v_u_11.new(v56, v55, p_u_54, {
        ["pet_kind"] = p_u_54,
        ["on_buy"] = function()
            p_u_52:_on_pet_selected(p_u_54)
        end
    })
end
function v_u_14._hide_model(p57, p58)
    for _, v59 in p58:GetDescendants() do
        if v59:IsA("BasePart") then
            p57._old_transparencies[v59] = v59.LocalTransparencyModifier
            v59.LocalTransparencyModifier = 1
        end
    end
end
function v_u_14._on_pet_selected(p60, p61)
    if not p60.tutorial.memory.pet_kind then
        p60.tutorial.memory.pet_kind = p61
        local v62 = p60.tutorial.memory.controllers
        v62[p61]:destroy()
        v62[p61] = nil
        v_u_12.get("TutorialAPI/ChoosePet"):FireServer(p61)
        p60.signal:Fire({
            ["chosen_pet"] = p61
        })
    end
end
function v_u_14.skip(p63)
    p63:_update_minigame_forced_state()
    local v64 = p63.tutorial.memory.pet_kind
    local v65 = p63.tutorial.memory.controllers
    v65[v64]:destroy()
    v65[v64] = nil
    p63:_create_sir_woofington_npc(v65.sir_woofington)
    for _, v66 in (v_u_6.get("inventory") or {}).pets or {} do
        if v66.kind == v64 then
            v_u_7.equip(v66)
            break
        end
    end
    p63.signal:Fire()
end
return v_u_14