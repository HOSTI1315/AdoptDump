--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.SirWoofingtonNoEggTemp (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_5 = v_u_4("ClientData")
local v_u_6 = v_u_4("Maid")
local function v_u_11(p7, p8)
    local v9 = v_u_4("RouterClient")
    local v10 = v_u_4("UIManager")
    p7:destroy()
    v9.get("LegacyTutorialAPI/ChoosePet"):FireServer(p8)
    v10.set_app_visibility("MannequinPurchaseApp", false)
end
local function v_u_18(p_u_12, p_u_13)
    local v14 = v_u_4("PetMannequin")
    local v15 = p_u_12.model:FindFirstChildWhichIsA("Model"):Clone()
    v15:FindFirstChild("HumanoidRootPart").Anchored = true
    v15.Parent = workspace
    local v16 = p_u_12.model.PetModel.HumanoidRootPart:GetPivot()
    local v17 = {
        ["pet_kind"] = p_u_13,
        ["on_buy"] = function()
            v_u_11(p_u_12, p_u_13)
        end
    }
    return v14.new(v16, v15, p_u_13, v17)
end
local function v_u_22(p19, p20)
    for _, v21 in p19:GetDescendants() do
        if v21:IsA("BasePart") then
            p20[v21] = v21.LocalTransparencyModifier
            v21.LocalTransparencyModifier = 1
        end
    end
end
return function()
    return {
        ["is_critical"] = true,
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["use_text"] = "Talk",
        ["client_use"] = function(p_u_23, _, p_u_24, _, p_u_25)
            local v_u_26 = require(script.Parent.TutorialHelper)
            local v27 = v_u_4("NPCManager")
            local v_u_28 = v_u_4("UIManager")
            local v_u_29 = p_u_23.controllers
            if v_u_29 then
                v_u_29 = p_u_23.controllers.sir_woofington
            end
            local v30 = v_u_29.model:FindFirstChild("HumanoidRootPart", true)
            local v31 = v30.CFrame * Vector3.new(0, 5, -8.8)
            local v32 = v30.CFrame * Vector3.new(0, 3.6, 0)
            local v33 = v27.create
            local v34 = {
                ["model"] = v_u_29.model,
                ["speech_bubble_part"] = v_u_29.model:FindFirstChild("PetModel", true):FindFirstChild("Head"),
                ["speech_focus_positions"] = {
                    ["camera_origin"] = v31,
                    ["camera_target"] = v32
                }
            }
            local v_u_35 = v33(v34)
            p_u_23.interaction_maid:GiveTask(v_u_2.try(function()
                p_u_23.interaction_maid:GiveTask(v_u_26.run_dialog(v_u_29, v_u_35, p_u_24.UseBlocks[p_u_25], 5, {
                    ["play_now"] = true
                }))
            end):andThen(function()
                local v_u_36 = {}
                for _, v37 in v_u_1:get_value("valid_pet_kinds_sorted") do
                    local v38 = v_u_18(p_u_23.controllers[v37], v37)
                    table.insert(v_u_36, v38)
                    p_u_23.interaction_maid:GiveTask(v38)
                    p_u_23.interaction_maid:GiveTask(v38.model)
                end
                local v39 = v_u_28.apps.MannequinPurchaseApp:get_visibility_changed_signal()
                local v_u_40 = {}
                p_u_23.interaction_maid:GiveTask(v39:Connect(function(p41)
                    for v42, v43 in v_u_40 do
                        v42.LocalTransparencyModifier = v43
                    end
                    v_u_40 = {}
                    if p41 then
                        for _, v44 in p_u_23.controllers do
                            v_u_22(v44.model, v_u_40)
                        end
                    else
                        for _, v45 in v_u_36 do
                            v_u_22(v45.model, v_u_40)
                        end
                    end
                end))
                v_u_28.apps.MannequinPurchaseApp:set_mannequin_list(v_u_36)
                v_u_28.apps.MannequinPurchaseApp:hide_cancel_button()
                v_u_28.apps.MannequinPurchaseApp:enter(v_u_1:get_value("valid_pet_kinds_sorted")[1])
                p_u_23.interaction_maid:GiveTask(function()
                    v_u_28.set_app_visibility("MannequinPurchaseApp", false)
                    v_u_28.apps.MannequinPurchaseApp:set_mannequin_list({})
                    v_u_28.apps.MannequinPurchaseApp:show_cancel_button()
                    for v46, v47 in v_u_40 do
                        v46.LocalTransparencyModifier = v47
                    end
                end)
            end):andThen(function()
                return v_u_2.fromEvent(v_u_28.apps.MannequinPurchaseApp:get_visibility_changed_signal(), function(p48)
                    return not p48
                end)
            end):finally(function()
                p_u_23.interaction_maid:DoCleaning()
            end))
        end,
        ["post_render"] = function(p_u_49, p_u_50)
            p_u_49.maid = p_u_49.maid or v_u_6.new()
            p_u_49.interaction_maid = p_u_49.interaction_maid or v_u_6.new()
            p_u_49.maid:DoCleaning()
            p_u_49.interaction_maid:DoCleaning()
            if v_u_4("LegacyTutorial").is_nursery_tutorial_running() then
                local v_u_51 = require(script.Parent.Parent.Parent.NPCBehaviors.NPCController)
                p_u_49.controllers = {}
                v_u_5.update("tutorial_sir_woofington_furniture_model", p_u_50)
                p_u_50.Egg:Destroy()
                local v52 = v_u_1:get_value("valid_pet_kinds")
                v_u_2.try(function()
                    local v_u_53 = v_u_51.create_from_npc_kind_async("sir_woofington", {
                        ["pet_kind"] = "dog"
                    })
                    local v54 = v_u_53.model:FindFirstChild("PlacementBlock")
                    v_u_53.model.PrimaryPart = v54
                    v_u_53.model:PivotTo(p_u_50.NoEgg.PlacementBlocks.sir_woofington.CFrame)
                    v54:Destroy()
                    p_u_49.controllers.sir_woofington = v_u_53
                    v_u_53:do_action(function()
                        return v_u_53:look_at_player_promise()
                    end)
                    p_u_49.maid:GiveTask(v_u_53)
                end)
                v_u_3.List.map(v_u_3.Dictionary.keys(v52), function(p_u_55)
                    return v_u_2.try(function()
                        local v_u_56 = v_u_51.create_from_pet_kind_async(p_u_55)
                        v_u_56.model:PivotTo(p_u_50.NoEgg.PlacementBlocks[p_u_55].CFrame)
                        p_u_49.controllers[p_u_55] = v_u_56
                        v_u_56:do_action(function()
                            return v_u_56:look_at_player_promise()
                        end)
                        p_u_49.maid:GiveTask(v_u_56)
                    end)
                end)
                p_u_50.UseBlocks.UseBlock:PivotTo(p_u_50.NoEgg.UseBlocks.sir_woofington.CFrame)
            else
                p_u_50:Destroy()
            end
        end,
        ["unrender"] = function(p57)
            if p57.maid then
                p57.maid:DoCleaning()
            end
            if p57.interaction_maid then
                p57.interaction_maid:DoCleaning()
            end
        end
    }
end