--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialHelper (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.Ailments.Helpers.ActionHelper)
require(script.Parent.Parent.Parent.Ailments.AilmentAction)
local v_u_2 = require(script.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v3 = require(script.Parent.TutorialFlags)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_6 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_7 = v_u_6("ClientData")
local v8 = v_u_6("Signal")
local v_u_9 = {
    ["flags"] = v3
}
local v_u_10 = v8.new()
local v_u_11 = v8.new()
function v_u_9.is_completed()
    if v_u_9.flags.get("completed_this_session") then
        return true
    end
    local v12 = v_u_7.get("tutorial_manager")
    local v13
    if v12 then
        v13 = v12.completed
    else
        v13 = false
    end
    if not v13 then
        local v14 = v_u_7.get("boolean_flags")
        if not v14 then
            return false
        end
        local v15 = v14.tutorial_v3_completed or v14.tutorial_v2_completed
        v13 = v15 or false
    end
    return v13
end
function v_u_9.is_new_tutorial_running()
    if v_u_2:get_value("use_new_tutorial") then
        return not v_u_9.is_completed()
    else
        return false
    end
end
function v_u_9.new_tutorial_completed_promise()
    return v_u_4.fromEvent(v_u_10):andThenReturn()
end
function v_u_9.get_completed_signal()
    return v_u_10
end
function v_u_9.get_unequipped_signal()
    return v_u_11
end
function v_u_9.run_legacy_housing_tutorial()
    local v16 = v_u_6("InteriorsM")
    local v17 = v_u_6("LegacyTutorial")
    local v18 = v_u_6("RouterClient")
    local v19 = v_u_6("UIManager")
    v19.set_app_visibility("QuestApp", false)
    local v20 = v16.get_current_location() or {}
    local v21
    if v20.destination_id == "housing" then
        v21 = v20.house_owner == game.Players.LocalPlayer
    else
        v21 = false
    end
    if v21 or v19.apps.GuideArrowApp:navigate_promise({
        ["final_destination"] = {
            ["destination_id"] = "housing",
            ["destination_house_owner"] = game.Players.LocalPlayer
        }
    }):await() then
        v17.prompt_housing_edit_mode()
        v18.get("TutorialAPI/ReportDiscreteStep"):FireServer("house_decorating_prompt")
    end
end
function v_u_9.is_hidden_by_tutorial(p22)
    if v_u_9.is_completed() then
        return false
    elseif v_u_2:get_value("use_new_tutorial") then
        if p22.category == "pets" then
            return not v_u_2:get_value("valid_pet_kinds")[p22.kind]
        elseif p22.category == "food" then
            return p22.kind ~= "pet_treat"
        else
            return p22.category ~= "toys" and true or p22.kind ~= "squeaky_bone_default"
        end
    else
        return v_u_6("LegacyTutorial").is_hidden_by_tutorial(p22)
    end
end
function v_u_9.highlight(p_u_23, p24)
    local v_u_25 = p24 or 0
    local v26 = v_u_6("UIManager")
    local v_u_27 = false
    local v_u_28 = tick() + v_u_25
    local v_u_29 = nil
    local function v32()
        local v30, v31 = p_u_23()
        if v30 == nil or v_u_29 ~= nil and v30 ~= v_u_29 then
            v_u_28 = tick() + v_u_25
        end
        v_u_29 = v30
        if not v_u_25 or tick() >= v_u_28 then
            return v30, v31
        end
        v_u_29 = nil
        return nil, nil
    end
    local v_u_33 = v26.apps.NewSpotlightApp:target(v32)
    return function()
        if not v_u_27 then
            v_u_27 = true
            v_u_33()
        end
    end
end
function v_u_9.highlight_ailment(p_u_34, p35)
    local v_u_36 = v_u_6("EquippedPets")
    local v_u_37 = v_u_6("PlatformM")
    local v_u_38 = v_u_6("UIManager")
    local function v49()
        local v39 = v_u_38.apps.FocusPetApp
        local v40 = v39.ailments
        local v_u_41 = v39.tooltip
        if v_u_38.is_visible("QuestApp") then
            return nil
        elseif v_u_38.is_visible("FocusPetApp") then
            local v42 = v_u_37.run({
                ["phone"] = function()
                    if v_u_41.visible then
                        return v_u_41.instance:FindFirstChild("AilmentCard")
                    else
                        return nil
                    end
                end,
                ["tablet"] = "phone"
            })
            if v42 then
                return v42, Vector2.xAxis
            elseif v39.ailments.hidden or v_u_1.has_exclusive_tag("dialog") then
                return nil
            else
                local v43 = v40.ailments_list
                local v45 = v_u_5.List.findWhere(v43, function(p44)
                    return p44.kind == p_u_34
                end)
                if v45 then
                    return v40.ailments[v45].instance, Vector2.xAxis
                else
                    return nil
                end
            end
        else
            local v46 = v_u_36.get_my_equipped_char_wrappers()
            local v47
            if v46[1] then
                v47 = v46[1].char
            else
                v47 = nil
            end
            if v47 then
                for _, v48 in v_u_38.apps.InteractionsApp.interactions:tolist() do
                    if v48.visible and v48.gui.adornee:IsDescendantOf(v47) then
                        return v48.gui.instance.TapButton, -Vector2.yAxis
                    end
                end
            end
            return nil
        end
    end
    return v_u_9.highlight(v49, p35)
end
function v_u_9.run_fireworks(p_u_50, p_u_51)
    local v_u_60 = v_u_4.delay(3.5):andThen(function()
        local v52 = p_u_50:FindFirstChild("Fireworks", true)
        local v53 = v52:FindFirstChild("FW1")
        local v54 = v52:FindFirstChild("FW2")
        local v55 = v52:FindFirstChild("FW3")
        return {
            ["fw1"] = v53:FindFirstChild("Fireworks", true),
            ["fw2"] = v54:FindFirstChild("Fireworks", true),
            ["fw3"] = v55:FindFirstChild("Fireworks", true),
            ["dog"] = v55:FindFirstChild("Dog", true),
            ["cat"] = v55:FindFirstChild("Cat", true)
        }
    end):tap(function(p56)
        p56.fw1:Emit(50)
        task.wait(0.2)
    end):tap(function(p57)
        p57.fw2:Emit(50)
        task.wait(0.4)
    end):tap(function(p58)
        p58.fw3:Emit(50)
        task.wait(0.2)
    end):tap(function(p59)
        if p_u_51 and p59[p_u_51] then
            p59[p_u_51]:Emit(1)
        end
    end)
    return function()
        v_u_60:cancel()
    end
end
function v_u_9.spawn_ailment(p_u_61, p62)
    local v63 = v_u_6("new:AilmentsClient")
    local v_u_64 = v_u_6("EquippedPets")
    local v65 = v_u_6("RouterClient")
    v_u_4.fromEvent(v63.get_early_ailment_completed_signal(), function(p66, p67)
        local v68
        if p66.kind == p_u_61 then
            v68 = v_u_64.is_equipped({
                ["unique"] = p67
            })
        else
            v68 = false
        end
        return v68
    end):andThen(p62)
    v65.get("TutorialAPI/SpawnTutorialAilment"):FireServer(p_u_61)
end
function v_u_9.run_dialog(p_u_69, p_u_70, p71, p72, p_u_73)
    local v74 = v_u_6("ContentPackHelper").load_module("Tutorial2025", "Dialog")
    local v75 = v_u_6("InteractionsEngine")
    local v_u_76 = v_u_6("InventoryDB")
    local v_u_77 = v_u_6("NonFurnitureNPC")
    local v_u_78 = v_u_6("NPCManager")
    local v_u_79 = v_u_6("package:t")
    local v80 = v74[p72]
    local v_u_83 = v_u_5.List.map(v80, function(p81)
        if v_u_79.string(p81.text) then
            return p81
        end
        if p_u_73.pet_name then
            return {
                ["text"] = p81.text.named:gsub("PET", p_u_73.pet_name),
                ["length"] = p81.length
            }
        end
        local v82 = v_u_76.pets[p_u_73.pet_kind].name
        return {
            ["text"] = p81.text.unnamed:gsub("PET", v82),
            ["length"] = p81.length
        }
    end)
    local function v84()
        if p_u_73.callback then
            p_u_73.callback()
        end
        p_u_69:stop_action()
        v_u_78.take_focus(p_u_70, {
            ["hide_my_character"] = false,
            ["hide_my_pet"] = false,
            ["hide_other_characters"] = true,
            ["hide_other_pets"] = true
        }, function()
            p_u_70:play_speech({
                ["dialog"] = v_u_83
            }):expect()
            p_u_69:do_action(function()
                return p_u_69:look_at_player_promise()
            end)
            if p_u_73.post_callback then
                p_u_73.post_callback()
            end
        end)
    end
    local v_u_85 = v75:register({
        ["text"] = "Talk",
        ["tag"] = "MinigameForcedStateOverride",
        ["part"] = p71,
        ["on_selected"] = v84
    })
    local function v87()
        v_u_85:destroy()
        local v86 = v_u_77.get_focused_npc()
        if v86 then
            v86:cancel_actions()
        end
    end
    if p_u_73.play_now then
        v84()
    end
    return v87
end
function v_u_9.create_tutorial_play_action(p_u_88)
    local v89 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
    local v_u_90 = require(v89.ActionChoice)
    local v_u_91 = require(v89.ActionSequence)
    local v_u_92 = require(v89.BackpackSelectAction)
    local v_u_93 = require(v89.InlineAction)
    local v_u_94 = require(v89.NavigationAction)
    local v_u_95 = v_u_6("InteriorsM")
    local v_u_96 = v_u_6("PetReactionName")
    local v_u_97 = v_u_6("RouterClient")
    local v_u_98 = v_u_6("ThrowToyHelper")
    local v_u_99 = v_u_6("UIManager")
    return v_u_93.new(function()
        if v_u_9.flags.get("picked_up_squeaky_bone") then
            local v100 = {
                ["category"] = "toys",
                ["filter_callback"] = p_u_88
            }
            return v_u_92.new(v100)
        end
        local v101 = v_u_95.get_current_location().destination_id
        local v_u_102 = workspace:WaitForChild("Interiors"):FindFirstChild(v101)
        local v_u_103 = v_u_102.SqueakyBone.PlacementBlock:GetPivot()
        local v104 = v_u_90.new
        local v105 = {}
        local v109 = {
            ["text"] = "Go Play Catch",
            ["action"] = v_u_91.new({ v_u_93.new(function()
                    v_u_9.flags.set("started_playground_nav", true)
                    return true
                end), v_u_94.new({
                    ["final_destination"] = v101,
                    ["custom_position_or_method"] = v_u_103.Position,
                    ["not_overridable"] = true
                }), v_u_93.new(function()
                    v_u_97.get("TutorialAPI/ReportDiscreteStep"):FireServer("reached_playground")
                    v_u_9.flags.set("picked_up_squeaky_bone", true)
                    v_u_99.apps.FocusPetApp:release_focus()
                    local v106 = v_u_7.get("inventory")
                    if not v106 then
                        return false
                    end
                    local v107 = nil
                    for _, v108 in v106.toys do
                        if v108.kind == "squeaky_bone_default" then
                            v107 = v108
                            break
                        end
                    end
                    v_u_98.generic_throw_toy_use(v107, nil, {
                        ["reaction_name"] = v_u_96.ThrowToyReaction,
                        ["spawn_cframe"] = v_u_103,
                        ["custom_throw_function"] = function(_, _)
                            v_u_102.SqueakyBone.Placeholder.Transparency = 1
                        end
                    })
                    return true
                end) })
        }
        __set_list(v105, 1, {v109})
        return v104(v105)
    end)
end
function v_u_9.render_sir_woofington(p_u_110)
    local v111 = v_u_6("InventoryDB")
    local v112 = v_u_6("NPCHelper")
    if v_u_2:get_value("no_starter_egg") and p_u_110 == "tutorial_sir_woofington" then
        return v_u_6("new:SirWoofingtonNoEggTemp")()
    end
    local v113 = v112.NPC_SIMPLE(p_u_110, {
        ["talking_to_anim"] = v111.pets.dog.anims.sit,
        ["idle_anim"] = v111.pets.dog.anims.sit
    })
    local v_u_114 = v113.render
    local v_u_115 = v113.post_render
    function v113.render(p116, p117)
        if p_u_110 == "tutorial_sir_woofington" then
            v_u_7.update("tutorial_sir_woofington_furniture_model", p117)
            p117.NoEgg:Destroy()
            for _, v118 in p117.Egg:GetChildren() do
                v118.Parent = p117
            end
            if v_u_2:get_value("woofington_outside_house") then
                local v119 = v_u_6("InteriorsM").get_current_location()
                local v120 = v119.interior
                if not v119 or v119.destination_id ~= "Neighborhood" then
                    return
                end
                local v121 = nil
                for _, v122 in v_u_7.get("house_exteriors") do
                    if v122.player == game.Players.LocalPlayer then
                        v121 = v122
                        break
                    end
                end
                if not v121 then
                    return
                end
                p117:SetPrimaryPartCFrame(v120.Plots:FindFirstChild(v121.plot_name).CFrame * CFrame.new(0, -1, -35) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 3.141592653589793))
            end
        end
        v_u_114(p116, p117)
    end
    function v113.post_render(p123, p124)
        local v125 = v_u_6("LegacyTutorial")
        local v126 = v125.is_nursery_tutorial_running()
        local v127 = v125.has_spoken_with_sir_woofington()
        if v_u_2:get_value("woofington_outside_house") and (p_u_110 == "tutorial_sir_woofington" and v127) then
            p124:Destroy()
            return
        elseif v126 and p_u_110 == "sir_woofington" or not v126 and p_u_110 == "tutorial_sir_woofington" then
            p124:Destroy()
        else
            v_u_115(p123, p124)
        end
    end
    return v113
end
return v_u_9