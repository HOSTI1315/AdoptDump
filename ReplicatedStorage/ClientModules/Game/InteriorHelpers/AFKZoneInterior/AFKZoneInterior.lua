--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.AFKZoneInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ThemedServersHelper")
local v_u_3 = v_u_1("InteractionsEngine")
local v_u_4 = v_u_1("ClientToolManager")
local v_u_5 = v_u_1("SharedConstants")
local v_u_6 = v_u_1("TerrainHelper")
local v_u_7 = v_u_1("EquippedPets")
local v_u_8 = v_u_1("RouterClient")
local v_u_9 = v_u_1("ClientData")
local v_u_10 = v_u_1("InteriorsM")
local v_u_11 = v_u_1("UIManager")
local v12 = v_u_1("Signal")
local v13 = v_u_1("Maid")
local v_u_14 = v_u_1("package:Promise")
local v_u_15 = game:GetService("Players")
local v_u_16 = game:GetService("TeleportService")
local v_u_17 = { "pets" }
local v18 = {}
local v_u_19 = v13.new()
local v_u_20 = v12.new()
local function v_u_35(p21, p22, p23)
    local v24 = v_u_1("PetEntityManager")
    local v25 = v_u_1("PetPerformanceName")
    local v26 = v_u_1("PetEntityHelper")
    local v27 = v_u_1("PetMovementTarget")
    for _, v28 in v24.get_local_owned_pet_entities() do
        if p23() then
            v_u_11.apps.SpeechBubbleApp:create_for_character(v28.base.char, "Time to have fun!")
        end
        local v29 = v26.stage_performance
        local v30 = {
            ["name"] = v25.RunInCircles,
            ["should_end_performance"] = p22
        }
        local v31 = {
            ["target"] = v27.new({
                ["target"] = p21
            }),
            ["walkspeed"] = 16,
            ["radius"] = 10,
            ["duration"] = (1 / 0),
            ["effects"] = { "smoke_trail", "emit_smoke" },
            ["eyes_id"] = "super_squinting_eyes",
            ["looping_sounds"] = { "FetchingRunLoop" },
            ["play_sounds"] = { "FetchingRunStart" }
        }
        v30.options = v31
        v29(v28, v30)
        local v32 = v26.stage_performance
        local v33 = {
            ["name"] = v25.ModifiersProvider,
            ["should_end_performance"] = p22
        }
        local v34 = {
            ["modifiers"] = {
                ["teleporting_disabled"] = true
            }
        }
        v33.options = v34
        v32(v28, v33)
    end
end
local function v_u_43(p_u_36)
    local v_u_37 = true
    local function v_u_38()
        return not v_u_37
    end
    local v_u_39 = true
    local function v_u_41()
        local v40 = v_u_39
        v_u_39 = false
        return v40
    end
    v_u_35(p_u_36, v_u_38, v_u_41)
    local v_u_42 = v_u_9.register_callback("pet_char_wrappers", function()
        v_u_35(p_u_36, v_u_38, v_u_41)
    end)
    return function()
        v_u_42()
        v_u_37 = false
    end
end
local function v_u_46(p44, p45)
    v_u_11.apps.AFKZoneApp:set_timer_text("Teleporting...")
    v_u_8.get("ThemedServersAPI/RequestTeleport"):FireServer(p44, p45)
    v_u_11.set_app_visibility("ThemedServersApp", true)
    v_u_11.apps.ThemedServersApp:show_teleport_message()
end
function v18.force_exit()
    v_u_20:Fire()
end
function v18.interactions(_, _)
    return {}
end
function v18.render(p47, _)
    if v_u_2.is_afk_place() then
        v_u_3:set_tag_exclusive("feedback_center", true)
        v_u_3:set_tag_exclusive("afk_return_teleporter", true)
        v_u_11.set_app_visibility("AFKZoneApp", false)
        v_u_11.set_app_visibility("ThemedServersApp", false)
        v_u_11.apps.BackpackApp:set_promo_buttons_active(false)
        v_u_11.apps.BackpackApp.categories:set_visible_categories(v_u_17)
        v_u_11.apps.HideGuiApp:hide_all("afk", {
            "BackpackApp",
            "ToolApp",
            "ExtraButtonsApp",
            "ThemedServersApp",
            "AFKZoneApp",
            "DialogApp",
            "HintApp",
            "SpeechBubbleApp",
            "PlayerNameApp",
            "InteractionsApp"
        })
        local v_u_48 = nil
        local v_u_49 = v_u_14.resolve()
        local v_u_50 = v_u_20:Connect(function()
            v_u_49:cancel()
            if v_u_48 then
                v_u_48:hide()
            end
            v_u_46("main", false)
        end)
        local v51 = {
            ["priority"] = 1,
            ["text"] = "Exit AFK",
            ["mouse_button1_click"] = function()
                v_u_20:Fire()
            end
        }
        v_u_48 = v_u_11.apps.ExtraButtonsApp:register_button(v51)
        v_u_48:show()
        local v52 = v_u_16:GetLocalPlayerTeleportData()
        local v_u_53 = v52 and v52.prev_pet_uniques
        if v_u_53 then
            local v54 = v52.prev_pet_uniques
            local v55 = v_u_15.LocalPlayer.UserId
            v_u_53 = v54[tostring(v55)]
        end
        local v_u_56 = v_u_43(p47.CenterTarget)
        v_u_49 = v_u_14.try(function()
            if #v_u_7.get_my_equipped() == 0 then
                local v57 = {}
                if v_u_53 then
                    for _, v58 in v_u_53 do
                        local v59 = v_u_7.get_item_from_unique(v58)
                        if v59 then
                            table.insert(v57, v59)
                        end
                    end
                end
                if #v57 == 0 then
                    v_u_11.apps.DialogApp:dialog({
                        ["text"] = "Pick a pet to use in the Aging Zone (AFK)",
                        ["button"] = "Okay"
                    })
                    local v60 = nil
                    while not v60 do
                        v60 = v_u_11.apps.BackpackApp:pick_item({
                            ["visible_backpack_categories"] = { "pets" },
                            ["friendship_hidden"] = true
                        })
                        v_u_11.apps.BackpackApp.categories:set_visible_categories(v_u_17)
                        if v60 and (v60.properties.age == 6 and "nonparticipating" == "no_friendship") then
                            if v_u_11.apps.DialogApp:dialog({
                                ["text"] = "This pet is fully aged up! Are you sure you want to use it?",
                                ["left"] = "No",
                                ["right"] = "Yes"
                            }) == "No" then
                                v60 = nil
                            end
                        end
                    end
                    if v60 then
                        table.insert(v57, v60)
                    end
                end
                for _, v61 in v57 do
                    v_u_4.equip(v61)
                end
            end
        end):andThen(function()
            local v62, v63 = v_u_8.get("ThemedServersAPI/BeginAFKAilments"):InvokeServer()
            if v62 and v63 then
                return v_u_14.resolve(v62, v63)
            else
                return v_u_14.reject("No afk ailment spawn info was provided by the server.")
            end
        end):andThen(function(p64, p65)
            v_u_11.set_app_visibility("AFKZoneApp", true)
            v_u_11.apps.AFKZoneApp:set_timer_text("Starting...")
            local v66 = v_u_5.afk_zone.time_before_new_server
            return v_u_11.apps.AFKZoneApp:promise_countdown(p64, v66, p65)
        end):andThen(function()
            v_u_50:Disconnect()
            v_u_48:hide()
            v_u_46("afk", true)
        end)
        local v_u_67 = v_u_6.load_by_tagged_parts(p47, {
            ["WaterColor"] = Color3.fromRGB(49, 163, 211),
            ["WaterReflectance"] = 1,
            ["WaterTransparency"] = 0.3,
            ["WaterWaveSize"] = 0,
            ["WaterWaveSpeed"] = 4
        })
        v_u_19:GiveTask(function()
            v_u_49:cancel()
            v_u_3:set_tag_exclusive("feedback_center", false)
            v_u_3:set_tag_exclusive("afk_return_teleporter", false)
            v_u_11.apps.ExtraButtonsApp:unregister_button(v_u_48)
            v_u_67()
            if v_u_56 then
                v_u_56()
                v_u_56 = nil
            end
        end)
    else
        task.defer(function()
            v_u_10.enter_smooth("MainMap", "Neighborhood!MainDoor")
        end)
    end
end
function v18.cleanup(_, _)
    v_u_19:DoCleaning()
end
return v18