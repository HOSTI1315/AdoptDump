--// ReplicatedStorage.ClientModules.Game.Tutorial.LegacyTutorial (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("PlatformM")
local v_u_5 = v_u_1("InteractionsEngine")
local v_u_6 = v_u_1("package:Promise")
local v7 = v_u_1("Signal")
local v_u_8 = v_u_1("new:TutorialHelper")
local v_u_9 = v_u_1("new:TutorialAB")
local v_u_10 = game:GetService("RunService")
local v_u_11 = {
    ["nursery_tutorial_running"] = false,
    ["avatar_tutorial_running"] = false,
    ["housing_tutorial_running"] = false,
    ["spoken_with_sir_woofington"] = false
}
local v_u_12 = v7.new()
local v_u_13 = false
local function v_u_15(p14)
    if v_u_13 then
        return v_u_6.resolve()
    else
        return v_u_6.race({ v_u_6.delay(p14), v_u_6.fromEvent(v_u_12) })
    end
end
local function v_u_18(p_u_16)
    local v_u_17 = v_u_1("UIManager")
    if v_u_13 or not v_u_17.is_visible(p_u_16) then
        return v_u_6.resolve()
    else
        return v_u_6.race({ v_u_6.fromEvent(v_u_12), v_u_6.fromEvent(v_u_17.app_visibilities_changed, function()
                return not v_u_17.is_visible(p_u_16)
            end) })
    end
end
local function v_u_22(p_u_19)
    local v20 = v_u_1("InteriorsM")
    if v_u_13 or (v20.get_current_location() or {}).destination_id ~= p_u_19 then
        return v_u_6.resolve()
    else
        return v_u_6.race({ v_u_6.fromEvent(v_u_12), v_u_6.fromEvent(v20.on_location_changed, function(p21)
                return p21.destination_id ~= p_u_19
            end) })
    end
end
local function v_u_28(p_u_23)
    local v24 = v_u_1("UIManager")
    if v_u_13 then
        return v_u_6.resolve(p_u_23.button)
    end
    local v25, v_u_26 = v24.apps.DialogApp:queue_with_override(p_u_23)
    local v_u_27 = v_u_6.fromEvent(v_u_12):andThen(function()
        v_u_26(p_u_23.button)
    end)
    return v25:andThen(function(...)
        v_u_27:cancel()
        return ...
    end)
end
local function v_u_29(...)
    if not v_u_13 then
        v_u_2.get("LegacyTutorialAPI/StashTutorialStatus"):FireServer(...)
    end
end
local function v_u_31(p30)
    return UDim2.new(0, p30.AbsolutePosition.X + p30.AbsoluteSize.X / 2, 0, p30.AbsolutePosition.Y + p30.AbsoluteSize.Y / 2) + UDim2.new(0, 0, 0, 40)
end
local function v_u_36()
    local v32 = v_u_1("UIManager")
    if not v32.is_visible("AvatarEditorApp") then
        v32.apps.NavigatorApp:mobile_toggle_expansion(true)
        local v33 = v32.apps.NavigatorApp.instance.Frame.Buttons.AvatarFrame.Avatar
        local v34 = v_u_31(v33)
        local v35 = v34 - UDim2.new(0, v33.Size.X.Offset / 2 + 20, 0, 0)
        v32.apps.SpotlightApp:set_spotlight(v34, v33.Size + UDim2.new(0, 80, 0, 80))
        v32.apps.SpotlightApp:set_arrow(v35, UDim2.new(0, -50, 0, 0), "right")
        v_u_6.race({ v_u_6.fromEvent(v33[v_u_4.mouse_down_or_click()]), v_u_6.fromEvent(v_u_12) }):await()
        v32.apps.SpotlightApp:clear_spotlight()
        v32.apps.SpotlightApp:stop_arrow()
    end
end
local function v_u_43()
    local v37 = v_u_1("UIManager")
    local v38 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("HouseEditorApp")
    if v38 then
        v38 = v38:FindFirstChild("base_frame")
    end
    if v38 then
        v38 = v38:FindFirstChild("furniture_top_nav")
    end
    if v38 then
        v38 = v38:FindFirstChild("Edit")
    end
    if v38 ~= nil then
        local v39 = v_u_31(v38)
        local v40 = v39 + UDim2.new(0, 0, 0, v38.Size.Y.Offset / 2 + 20)
        local v41 = v38.Size + UDim2.new(0, 80, 0, 80)
        local v42 = UDim2.new(0, v41.X.Offset, 0, v41.X.Offset)
        v37.apps.SpotlightApp:set_spotlight(v39, v42)
        v37.apps.SpotlightApp:set_arrow(v40, UDim2.new(0, 0, 0, 50), "up")
        v_u_6.race({ v_u_6.fromEvent(v38.MouseButton1Click), v_u_6.fromEvent(v_u_12) }):await()
        v37.apps.SpotlightApp:clear_spotlight()
        v37.apps.SpotlightApp:stop_arrow()
    end
end
local function v_u_50()
    local v44 = v_u_1("UIManager")
    local v45 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestIconApp")
    if v45 then
        v45 = v45:FindFirstChild("ImageButton")
    end
    if v45 ~= nil then
        local v46 = v_u_31(v45)
        local v47 = v46 + UDim2.new(0, 0, 0, v45.Size.Y.Offset / 2 + 20)
        local v48 = v45.Size + UDim2.new(0, 80, 0, 80)
        local v49 = UDim2.new(0, v48.X.Offset, 0, v48.X.Offset)
        v44.apps.SpotlightApp:set_spotlight(v46, v49)
        v44.apps.SpotlightApp:set_arrow(v47, UDim2.new(0, 0, 0, 50), "up")
        while not (v44.is_visible("QuestApp") or v_u_13) do
            task.wait()
        end
        v44.apps.SpotlightApp:clear_spotlight()
        v44.apps.SpotlightApp:stop_arrow()
    end
end
function v_u_11.enter_pet_avatar_editor()
    local v_u_51 = v_u_1("UIManager")
    v_u_36()
    task.wait(1)
    if v_u_51.apps.AvatarEditorApp:is_focusing_player() then
        local v_u_52 = v_u_51.apps.AvatarEditorApp:get_focus_switcher_instance()
        local v53 = v_u_31(v_u_52)
        local v54 = v53 - UDim2.new(0, 0, 0, v_u_52.Size.Y.Offset / 2 + 5)
        v_u_51.apps.SpotlightApp:set_spotlight(v53, v_u_52.Size + UDim2.new(0, 30, 0, 30))
        v_u_51.apps.SpotlightApp:set_arrow(v54, UDim2.new(0, 0, 0, -50), "down")
        local function v55()
            return not (v_u_51.is_visible("AvatarEditorApp") and v_u_52.Visible)
        end
        v_u_6.race({ v_u_6.fromEvent(v_u_52.MouseButton1Down), v_u_6.fromEvent(v_u_10.Heartbeat, v55) }):expect()
        v_u_51.apps.SpotlightApp:clear_spotlight()
        v_u_51.apps.SpotlightApp:stop_arrow()
        v_u_6.race({ v_u_6.fromEvent(v_u_10.Heartbeat, function()
                return v_u_51.apps.AvatarEditorApp:is_focusing_pet()
            end), v_u_6.fromEvent(v_u_10.Heartbeat, v55) }):expect()
        if not (v_u_51.is_visible("AvatarEditorApp") and v_u_52.Visible) then
            return false
        end
    end
    return true
end
function v_u_11.name_pet_mini_tutorial()
    local v_u_56 = v_u_1("UIManager")
    if not v_u_11.enter_pet_avatar_editor() then
        return false
    end
    v_u_56.apps.DialogApp:dialog({
        ["text"] = "Let\'s give your pet a new name.",
        ["button"] = "Next"
    })
    local v_u_57 = v_u_56.apps.AvatarEditorApp:get_nickname_instance()
    local v58 = v_u_31(v_u_57)
    local v59 = v58 + UDim2.new(0, 0, 0, v_u_57.Size.Y.Offset / 2 + 15)
    v_u_56.apps.SpotlightApp:set_spotlight(v58, v_u_57.Size + UDim2.new(0, 80, 0, 80))
    v_u_56.apps.SpotlightApp:set_arrow(v59, UDim2.new(0, 0, 0, 50), "up")
    v_u_6.race({ v_u_6.fromEvent(v_u_57.MouseButton1Down), v_u_6.fromEvent(v_u_10.Heartbeat, function()
            return not (v_u_56.is_visible("AvatarEditorApp") and (v_u_57.Visible and v_u_56.apps.AvatarEditorApp:is_focusing_pet()))
        end) }):expect()
    v_u_56.apps.SpotlightApp:clear_spotlight()
    v_u_56.apps.SpotlightApp:stop_arrow()
    return true
end
function v_u_11.run_avatar_tutorial()
    if not v_u_13 then
        local v60 = v_u_1("UIManager")
        v_u_11.avatar_tutorial_running = true
        v_u_29("Avatar Tutorial Started")
        v_u_28({
            ["text"] = "Welcome to Adopt Me!",
            ["button"] = "Next"
        }):await()
        v_u_28({
            ["text"] = "Let\'s start the day off right - by dressing fashionably, of course!",
            ["button"] = "Start"
        }):await()
        if not v_u_13 then
            v_u_36()
        end
        v_u_29("Avatar Editor Opened")
        v_u_15(3):await()
        v_u_28({
            ["text"] = "There are thousands of outfits to choose from!",
            ["button"] = "Next"
        }):await()
        v_u_28({
            ["text"] = "Can you find something stylish to put on?",
            ["button"] = "Start"
        }):await()
        if v_u_13 then
            if v60.is_visible("AvatarEditorApp") then
                v60.set_app_visibility("AvatarEditorApp", false)
            end
        else
            v_u_18("AvatarEditorApp"):await()
        end
        v_u_29("Avatar Editor Closed")
        v_u_28({
            ["text"] = v_u_3.get("gender") == "female" and "Wow! You look beautiful!" or "Wow! You look incredible!",
            ["button"] = "Next"
        }):await()
        v_u_15(3):await()
        v_u_11.avatar_tutorial_running = false
    end
end
function v_u_11.prompt_housing_edit_mode()
    v_u_28({
        ["text"] = "Right now, you\'re standing in your house",
        ["button"] = "Next"
    }):await()
    v_u_28({
        ["text"] = "You can customize it to make it feel more like home",
        ["button"] = "Start"
    }):await()
    if not v_u_13 then
        v_u_43()
    end
end
function v_u_11.run_housing_tutorial()
    if not v_u_13 then
        v_u_11.housing_tutorial_running = true
        v_u_29("Housing Tutorial Started")
        v_u_11.prompt_housing_edit_mode()
        v_u_29("Housing Editor Opened")
        v_u_1("new:SpawnSequenceHelper").enable_house_exit()
        coroutine.wrap(function()
            task.wait(30)
            local v61 = v_u_1("InteriorsM").get_current_location()
            if v61 and v61.destination_id == "housing" then
                v_u_28({
                    ["text"] = "Whenever you\'re ready, exit out of your front door.",
                    ["button"] = "Okay"
                }):await()
            end
        end)()
        v_u_11.housing_tutorial_running = false
    end
end
function v_u_11.run_nursery_tutorial()
    local v62 = v_u_1("UIManager")
    local v63 = v_u_9:get_value("woofington_outside_house")
    v_u_11.nursery_tutorial_running = true
    v_u_22("housing"):await()
    v_u_29("House Exited")
    if not v_u_11.is_legacy_housing_tutorial_done() then
        v62.set_app_visibility("DailyLoginApp", true)
    end
    v_u_18("DailyLoginApp"):await()
    v_u_29("Nursery Tutorial Started")
    if not v63 then
        v_u_15(2):await()
        v_u_28({
            ["text"] = "Ready to adopt a fluffy puppy or cuddly kitten?",
            ["right"] = "Yes!"
        }):await()
        v_u_28({
            ["text"] = "Great! Let\'s go to the Nursery!",
            ["right"] = "Go!"
        }):await()
        if v_u_13 then
            v_u_11.spoken_with_sir_woofington = true
            v_u_11.nursery_tutorial_running = false
            return
        end
        v62.apps.GuideArrowApp:navigate("Nursery", nil, nil, true)
    end
    v_u_29("Nursery Entered")
    if not v63 then
        v_u_28({
            ["text"] = "Welcome to the Nursery!",
            ["button"] = "Next"
        }):await()
        v_u_28({
            ["text"] = "This is where you adopt pets and family!",
            ["button"] = "Okay"
        }):await()
        if not v_u_13 then
            v62.apps.GuideArrowApp:navigate("Nursery", function()
                if workspace.Interiors:FindFirstChild("Nursery") then
                    return workspace.Interiors.Nursery.ArrivalLocation.Position
                end
            end, nil, true)
        end
    end
    v_u_11.spoken_with_sir_woofington = true
    v62.apps.BackpackApp:refresh_rendered_items()
    local v64 = v_u_3.get("tutorial_sir_woofington_furniture_model")
    local v65 = nil
    for _, v66 in v_u_5:get_interactions() do
        if v66.part:IsDescendantOf(v64) then
            v65 = v66
        end
    end
    v62.apps.InteractionsApp:call_on_selected(v65)
    v_u_5:__deregister(v65)
    if v_u_9:get_value("no_starter_egg") then
        v_u_6.fromEvent(v62.apps.MannequinPurchaseApp:get_visibility_changed_signal(), function(p67)
            return not p67
        end):expect()
    else
        v64.TutorialEgg:Destroy()
        v_u_2.get("LegacyTutorialAPI/EquipTutorialEgg"):FireServer()
        v_u_29("Started Egg Received")
    end
    v_u_15(3):await()
    v_u_2.get("TutorialAPI/AddTutorialQuest"):FireServer()
    v_u_29("Quest Tutorial Started")
    v_u_28({
        ["text"] = ("Now that you have your %*, let\'s find some things to do!"):format(v_u_9:get_value("no_starter_egg") and "pet" or "egg"),
        ["button"] = "Okay!"
    }):await()
    v62.set_app_visibility("FocusPetApp", false)
    v_u_50()
    v_u_29("Quest App Opened")
    v_u_28({
        ["text"] = "This is your personal task board.",
        ["button"] = "Next"
    }):await()
    v_u_28({
        ["text"] = "Complete tasks to earn Bucks!",
        ["button"] = "Okay!"
    }):await()
    v_u_18("quest_app"):await()
    v_u_29("Quest App Closed")
    v_u_11.nursery_tutorial_running = false
end
local function v_u_77()
    local v68 = v_u_1("UIManager")
    local v69 = v_u_1("new:AilmentsClient")
    local v_u_70 = v_u_1("EquippedPets")
    v_u_29("Tutorial Ailment Spawned")
    v_u_2.get("LegacyTutorialAPI/AddHungryAilment"):FireServer()
    if not v68.is_visible("FocusPetApp") then
        v_u_6.race({ v_u_6.fromEvent(v68.app_visibilities_changed, function(p71, p72)
                if p72 then
                    p72 = p71 == "FocusPetApp"
                end
                return p72
            end), v_u_15(4):andThen(function()
                return v_u_28({
                    ["text"] = ("Your %* is hungry! Tap them to feed them"):format(v_u_9:get_value("no_starter_egg") and "pet" or "egg"),
                    ["button"] = "Okay"
                })
            end) }):await()
    end
    v68.set_app_visibility("QuestApp", false)
    local v_u_73 = v_u_8.highlight_ailment("hungry")
    v_u_6.fromEvent(v69.get_ailment_completed_signal(), function(p74, p75)
        local v76
        if p74.kind == "hungry" then
            v76 = v_u_70.is_equipped({
                ["unique"] = p75
            })
        else
            v76 = false
        end
        return v76
    end):andThen(function()
        v_u_73()
    end):expect()
end
function v_u_11.run_ailment_tutorial()
    if not v_u_13 then
        local v78 = v_u_1("EquippedPets")
        v_u_15(1):await()
        if v78.get_my_equipped_char_wrappers()[1] then
            v_u_77()
        end
        v_u_2.get("LegacyTutorialAPI/MarkTutorialCompleted"):FireServer()
        v_u_22("Nursery"):await()
        v_u_15(1.5):await()
    end
end
function v_u_11.is_nursery_tutorial_running()
    return v_u_11.nursery_tutorial_running
end
function v_u_11.is_tutorial_running()
    return v_u_11.nursery_tutorial_running or (v_u_11.avatar_tutorial_running or v_u_11.housing_tutorial_running)
end
function v_u_11.has_spoken_with_sir_woofington()
    return v_u_11.spoken_with_sir_woofington
end
function v_u_11.cancel_tutorial()
    local v79 = v_u_1("UIManager")
    if v_u_11.is_tutorial_completed() or not v_u_11.is_tutorial_running() then
        return false
    end
    v_u_13 = true
    v_u_12:Fire()
    v79.apps.SpotlightApp:clear_spotlight()
    v79.apps.SpotlightApp:stop_arrow()
    return true
end
local v_u_80 = false
function v_u_11.force_tutorial_completed()
    v_u_80 = true
end
function v_u_11.is_tutorial_completed()
    return v_u_80 or v_u_8.is_completed()
end
function v_u_11.is_legacy_housing_tutorial_done()
    return v_u_3.get("boolean_flags").tutorial_v2_completed or false
end
function v_u_11.is_hidden_by_tutorial(p81)
    if p81.category ~= "pets" or p81.id ~= "starter_egg" then
        return false
    end
    local v82 = v_u_11.is_tutorial_running() or not v_u_11.is_tutorial_completed()
    if v82 then
        v82 = not v_u_11.has_spoken_with_sir_woofington()
    end
    return v82
end
return v_u_11