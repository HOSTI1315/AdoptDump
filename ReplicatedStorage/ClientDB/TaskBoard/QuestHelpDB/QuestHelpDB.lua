--// ReplicatedStorage.ClientDB.TaskBoard.QuestHelpDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("ContentPackHelper")
local v_u_3 = v_u_1("new:NavigationHelper")
local function v_u_7(p4, p5)
    if p5.tutorial_messages then
        for _, v6 in ipairs(p5.tutorial_messages) do
            p4.apps.DialogApp:dialog({
                ["text"] = v6,
                ["button"] = "Next"
            })
        end
    end
    if p4.apps.DialogApp:dialog({
        ["text"] = p5.navigation_question,
        ["left"] = "No",
        ["right"] = "Yes"
    }) == "Yes" then
        p4.set_app_visibility("QuestApp", false)
        p4.apps.GuideArrowApp:navigate(p5.final_destination, p5.custom_position_or_method)
    end
end
local v26 = {
    ["complete_ailment_tutorial"] = function(_, p8)
        local v9 = v_u_1("new:TutorialAB"):get_value("no_starter_egg") and "pet" or "egg"
        p8.apps.DialogApp:dialog({
            ["text"] = ("Your %* sometimes has needs, such being hungry, thirsty, or tired."):format(v9),
            ["button"] = "Next",
            ["yields"] = false
        })
        p8.apps.DialogApp:dialog({
            ["text"] = ("To complete this task, help your %* when it needs you."):format(v9),
            ["button"] = "Okay"
        })
    end,
    ["buy_vehicle_tutorial"] = function(_, p10)
        v_u_7(p10, {
            ["tutorial_messages"] = { "You can buy new vehicles at the Vehicle Dealership!" },
            ["navigation_question"] = "Would you like to navigate to the Vehicle Dealership?",
            ["final_destination"] = "AutoShop"
        })
    end,
    ["learn_pet_trick_tutorial"] = function(_, p11)
        v_u_7(p11, {
            ["tutorial_messages"] = { "Talk to Shane in the school to teach your pet a new trick!" },
            ["navigation_question"] = "Would you like to navigate to the School?",
            ["final_destination"] = "School",
            ["custom_position_or_method"] = function()
                if workspace.Interiors:FindFirstChild("School") then
                    return workspace.Interiors.School.PetTrainerPos.Position
                else
                    return nil
                end
            end
        })
    end,
    ["save_new_pet_outfit_tutorial"] = function(_, p12)
        local v13 = v_u_1("LegacyTutorial")
        p12.set_app_visibility("QuestApp", false)
        if v13.enter_pet_avatar_editor() then
            p12.apps.DialogApp:dialog({
                ["text"] = "Here you can dress your pet and save/load custom outfits.",
                ["button"] = "Okay"
            })
        end
    end,
    ["buy_egg_tutorial"] = function(_, p14)
        v_u_7(p14, {
            ["tutorial_messages"] = { "You can visit the Nursery to adopt a new egg." },
            ["navigation_question"] = "Would you like to navigate to the Nursery?",
            ["final_destination"] = "Nursery"
        })
    end,
    ["hatch_egg_tutorial"] = function(_, p15)
        p15.apps.DialogApp:dialog({
            ["text"] = "Take care of your egg\'s needs and it will hatch when its ready.",
            ["button"] = "Okay"
        })
    end,
    ["age_up_pet_tutorial"] = function(_, p16)
        p16.apps.DialogApp:dialog({
            ["text"] = "Take care of your pet\'s needs and it will level up.",
            ["button"] = "Okay"
        })
    end,
    ["dirty_need_tutorial"] = function(_, p17)
        p17.apps.DialogApp:dialog({
            ["text"] = "When your pet is Dirty, you can wash them off at home.",
            ["button"] = "Okay"
        })
    end,
    ["edit_house_tutorial"] = function(_, _)
        v_u_1("new:TutorialHelper").run_legacy_housing_tutorial()
    end,
    ["name_pet_tutorial"] = function(_, p18)
        local v19 = v_u_1("LegacyTutorial")
        p18.set_app_visibility("QuestApp", false)
        v19.name_pet_mini_tutorial()
    end,
    ["mailbox_upgrade_house_tutorial"] = function(p_u_20, p21)
        p21.apps.DialogApp:dialog({
            ["text"] = "Visit the mailbox in front of your home to upgrade your house.",
            ["button"] = "Next"
        })
        if p21.apps.DialogApp:dialog({
            ["text"] = "Would you like to navigate to your mailbox?",
            ["left"] = "No",
            ["right"] = "Yes"
        }) == "Yes" then
            p21.set_app_visibility("QuestApp", false)
            if not p21.apps.GuideArrowApp:navigate(function()
                return v_u_3.get_house_location_for_player(p_u_20)
            end, function()
                local v22 = game:GetService("CollectionService"):GetTagged("MyMailbox")[1]
                if v22 then
                    return v22.Top.Position
                end
            end, function(p23, p24)
                if p24 then
                    return (p23 - p24).magnitude < 8
                else
                    return false
                end
            end) then
                return
            end
            task.wait(0.2)
            local v25 = false
            while not game.Players.LocalPlayer.PlayerGui.HouseChooserApp.visibility_wrapper.Visible do
                if not v25 then
                    p21.apps.DialogApp:dialog({
                        ["text"] = "Select your mailbox, then select Change House.",
                        ["button"] = "Okay"
                    })
                    v25 = true
                end
                task.wait()
            end
            task.wait(0.35)
            p21.apps.DialogApp:dialog({
                ["text"] = "Here you can buy a new house or customize an existing one.",
                ["button"] = "Okay"
            })
        end
    end
}
v2.merge("QuestHelp", v26)
return v26