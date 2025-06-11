--// ReplicatedStorage.new.modules.SpawnSequenceClient.SpawnSequenceHelper (ModuleScript)

local v_u_1 = require(script.Parent.Parent.ABTest.ABTests.ChooseSpawnAB)
local v_u_2 = require(script.Parent.Parent.LegacyLoad)
local v_u_3 = v_u_2("ClientData")
local v_u_4 = v_u_2("ClientStore")
local v_u_5 = v_u_2("EquippedPets")
local v_u_6 = v_u_2("FeedbackSurveyHelper")
local v_u_7 = v_u_2("InteriorsM")
local v_u_8 = v_u_2("InventoryDB")
local v_u_9 = v_u_2("LegacyTutorial")
local v_u_10 = v_u_2("RouterClient")
local v_u_11 = v_u_2("ServerType")
local v_u_12 = v_u_2("SettingsHelper")
local v_u_13 = v_u_2("new:StreamingPauseState")
local v_u_14 = v_u_2("new:SubscriptionsClient")
local v_u_15 = v_u_2("UIManager")
local v_u_16 = false
local v_u_48 = {
    ["pick_theme_color"] = function()
        local v17 = v_u_2("SettingsDB").by_id.theme_color
        if not v_u_12.get_setting_server({
            ["setting_id"] = "theme_color",
            ["use_default"] = false
        }) then
            local v18 = v_u_15.apps.DialogApp:set_display_order(32)
            local _, v19 = v_u_15.apps.DialogApp:dialog({
                ["dialog_type"] = "ThemeColorDialog"
            })
            v18()
            v_u_12.set_setting_client({
                ["setting_id"] = "theme_color",
                ["value"] = v19
            })
            if v19 == v17.default then
                v_u_10.get("SettingsAPI/SetSetting"):FireServer("theme_color", v19)
            end
        end
    end,
    ["get_saved_spawn"] = function()
        return not v_u_1:get_value("show_dialog") and "Home" or v_u_12.get_setting_server({
            ["setting_id"] = "spawn_location"
        })
    end,
    ["choose_spawn"] = function()
        if not v_u_1:get_value("show_dialog") then
            return "Home"
        end
        local v20 = v_u_2("SettingsDB")
        local v21 = v_u_12.get_setting_server({
            ["setting_id"] = "show_spawn_location_dialog"
        })
        local v22 = v_u_48.get_saved_spawn()
        if not v21 then
            return v22
        end
        local v23 = v_u_15.apps.DialogApp:set_display_order(32)
        local v24, v25 = v_u_15.apps.DialogApp:dialog({
            ["dialog_type"] = "SpawnChooserDialog",
            ["exit_button"] = true
        })
        v23()
        local v26 = v24 or v22
        local v27 = v20.by_id.spawn_location
        local v28 = {
            ["setting_id"] = "spawn_location",
            ["value"] = table.find(v27.element_options.choices, v26)
        }
        v_u_12.set_setting_client(v28)
        if v25 then
            v_u_12.set_setting_client({
                ["setting_id"] = "show_spawn_location_dialog",
                ["value"] = false
            })
        end
        return v26
    end,
    ["show_promos"] = function()
        if v_u_6.can_show_survey() then
            v_u_6.show_survey()
        end
    end,
    ["run_legacy_tutorial"] = function()
        v_u_15.apps.QuestIconApp:enable_animations()
        if v_u_9.is_legacy_housing_tutorial_done() then
            v_u_15.set_app_visibility("DailyLoginApp", true)
        else
            v_u_9.run_avatar_tutorial()
            v_u_9.run_housing_tutorial()
        end
        v_u_9.run_nursery_tutorial()
        v_u_9.run_ailment_tutorial()
    end,
    ["get_should_skip_tutorial"] = function()
        if not v_u_11.use_production_behavior() then
            local v29 = v_u_15.apps.DialogApp:set_display_order(32)
            local v30 = v_u_15.apps.DialogApp:dialog({
                ["text"] = "Skip Tutorial?",
                ["right"] = "Yes",
                ["left"] = "No"
            })
            v29()
            if v30 == "Yes" then
                return true
            end
        end
        return false
    end,
    ["spawn_last_equipped_pets"] = function()
        local v31 = v_u_3.get("last_equipped_pets") or {}
        local v32 = v_u_2("PetEntityManager")
        local v33 = v_u_2("PetEntityHelper")
        local v34 = v_u_2("PetReactionName")
        local v35 = v_u_2("ClientToolManager")
        if v31 and #v31 ~= 0 then
            local v36 = v_u_3.get("inventory") or {}
            for _, v37 in v31 do
                local v38 = v36.pets[v37]
                if v38 and v_u_5.get_max_equip_count() > #v_u_5.get_my_equipped() then
                    v35.equip(v38, {
                        ["equip_as_last"] = true
                    })
                end
            end
            for _, v39 in v32.wait_for_local_owned_pet_entities() do
                v33.stage_reaction(v39, {
                    ["name"] = v34.GreetOnJoinReaction
                })
            end
            return true
        end
    end,
    ["present_ugc_linked_items"] = function()
        local v40 = v_u_3.get("ugc_linked_items_manager")
        if v40 and v40.just_claimed_items then
            local v41 = v_u_2("ClientToolManager")
            local v42 = false
            for _, v43 in v40.just_claimed_items do
                local v44 = v_u_8[v43.category][v43.kind]
                if v44 then
                    if not (v42 or v41.is_equipped(v43)) then
                        v41.equip(v43)
                        v42 = true
                    end
                    v_u_15.apps.DialogApp:dialog({
                        ["text"] = "You\'ve been given a " .. v44.name .. " for redeeming an Adopt Me UGC item! Redeeming the same UGC item again will not reward another in-game item!",
                        ["button"] = "Okay"
                    })
                end
            end
        end
    end,
    ["equip_bees_blaster"] = function()
        local v45 = v_u_2("ClientToolManager")
        if not v_u_3.get("bees_blaster_redeemed") then
            return
        end
        local v46 = nil
        for _, v47 in (v_u_3.get("inventory") or {}).toys do
            if v47.kind == "bees_blaster" then
                v46 = v47
                break
            end
        end
        if v46 then
            v45.equip(v46)
            v_u_15.apps.DialogApp:dialog({
                ["text"] = "A Legendary BEES! Blaster has been added to your backpack because of your NERF X Adopt Me digital promo code.",
                ["button"] = "Okay"
            })
            v_u_15.apps.DialogApp:dialog({
                ["text"] = "Launch honey to feed your pets!",
                ["button"] = "Okay"
            })
        end
    end,
    ["get_intro_fade_color"] = function()
        return Color3.new(1, 1, 1)
    end
}
local function v_u_53()
    local v49 = workspace.CurrentCamera.CFrame
    local v50 = v49.Position
    local v51 = RaycastParams.new()
    v51.RespectCanCollide = false
    v51.IgnoreWater = false
    local v52 = workspace:Raycast(v49.Position, v49.LookVector * 1000, v51)
    if v52 and v52.Instance then
        v50 = v52.Position
    end
    v_u_10.get("ReplicationFocusAPI/UpdateReplicationFocusForMainMenu"):FireServer(v50)
end
function v_u_48.preload_house()
    v_u_7.enter("housing", "MainDoor", {
        ["house_owner"] = game.Players.LocalPlayer
    })
    v_u_7.set_allow_non_character_teleports(false)
    v_u_4.store:dispatch({
        ["type"] = "set_house_edit_mode",
        ["value"] = "Disabled"
    })
    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    workspace.CurrentCamera.CoordinateFrame = workspace:WaitForChild("HouseInteriors"):WaitForChild("blueprint"):GetChildren()[1].SpecialParts.CameraPos.CFrame
    v_u_53()
end
function v_u_48.preload_main_map(p54)
    v_u_7.enter(p54 or "MainMap", "MainDoor")
    v_u_7.set_allow_non_character_teleports(false)
    v_u_4.store:dispatch({
        ["type"] = "set_house_edit_mode",
        ["value"] = "Disabled"
    })
    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    if p54 then
        local v55 = v_u_7.get_current_location().interior
        workspace.CurrentCamera.CoordinateFrame = v55:WaitForChild("Town").CFrame
    else
        workspace.CurrentCamera.CoordinateFrame = workspace:WaitForChild("StaticMap"):WaitForChild("TeleportLocations"):WaitForChild("Town").CFrame
    end
    v_u_53()
end
function v_u_48.enter_starting_interior(p56)
    v_u_10.get("TeamAPI/ChooseTeam"):InvokeServer("Parents", {
        ["source_for_logging"] = "intro_sequence",
        ["dont_enter_location"] = true
    })
    p56()
    v_u_10.get("ReplicationFocusAPI/ResetReplicationFocus"):FireServer()
end
function v_u_48.enter_house()
    v_u_48.enter_starting_interior(function()
        v_u_7.enter("housing", "MainDoor", {
            ["house_owner"] = game.Players.LocalPlayer
        })
    end)
end
function v_u_48.enter_main_map(p_u_57)
    v_u_48.enter_starting_interior(function()
        v_u_7.enter(p_u_57 or "MainMap", "MainDoor", {
            ["spawn_cframe"] = workspace.StaticMap.TeleportLocations:FindFirstChild("Town").CFrame,
            ["move_camera"] = true
        })
    end)
end
function v_u_48.can_exit_house()
    return v_u_16
end
function v_u_48.enable_house_exit()
    v_u_16 = true
end
function v_u_48.callback_in_transition(p58)
    local v59 = v_u_15.apps.TransitionsApp:lock_transitions("spawn")
    local v60 = v_u_48.get_intro_fade_color()
    v_u_15.apps.TransitionsApp:transition_with_key("spawn", {
        ["length"] = 1,
        ["start_transparency"] = 1,
        ["end_transparency"] = 0,
        ["color"] = v60,
        ["cover_everything"] = true,
        ["yields"] = true
    })
    p58()
    v_u_15.apps.TransitionsApp:transition_with_key("spawn", {
        ["length"] = 1,
        ["start_transparency"] = 0,
        ["end_transparency"] = 1,
        ["color"] = v60,
        ["cover_everything"] = true,
        ["yields"] = true
    })
    v59()
end
function v_u_48.exit_loading_screen(p_u_61, p_u_62)
    p_u_61:tween_progress(1, 0.5)
    v_u_48.callback_in_transition(function()
        p_u_62()
        p_u_61:hide()
        v_u_13.await_unpaused()
        v_u_13.exit_loading_screen("InitialLoadingScreen")
    end)
end
function v_u_48.connect_apps()
    v_u_15.apps.DialogApp:connect_to_msg_bridge()
    v_u_15.apps.HintApp:connect_to_msg_bridge()
end
function v_u_48.show_intro_popups()
    v_u_14.show_expiration_and_renewal_notifications()
    if not v_u_11.use_production_behavior() and game:GetService("RunService"):IsStudio() == false then
        v_u_15.apps.DialogApp:dialog({
            ["text"] = "Warning: This is the Test Server, so nothing will save & servers will shut down frequently",
            ["button"] = "I understand"
        })
    end
    if (v_u_3.get("daily_login_manager") or {}).claimable then
        v_u_15.set_app_visibility("DailyLoginApp", true)
        v_u_15.apps.DailyLoginApp:yield_until_app_closed()
    end
    v_u_48.equip_bees_blaster()
    v_u_48.present_ugc_linked_items()
    v_u_48.show_promos()
end
function v_u_48.show_minigame_popups()
    v_u_2("MinigameJoinPopups").start_showing_popups()
end
function v_u_48.finish_sequence()
    v_u_48.spawn_last_equipped_pets()
    v_u_15.apps.QuestIconApp:enable_animations()
end
return v_u_48