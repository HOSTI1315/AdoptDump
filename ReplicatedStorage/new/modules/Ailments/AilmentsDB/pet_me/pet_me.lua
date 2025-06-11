--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.pet_me (ModuleScript)

return require(script.Parent.Parent.AilmentEntry).new({
    ["kind"] = "pet_me",
    ["category"] = "DEFAULT",
    ["reward"] = 10,
    ["not_for_babies"] = true,
    ["not_for_dolls"] = true,
    ["create_description"] = function(_)
        return {
            ["name"] = "Pet Me",
            ["display_text"] = "Pet your pet!",
            ["image"] = "rbxassetid://109582930276834",
            ["large_image"] = "rbxassetid://101751130847006",
            ["speech_bubble"] = "Pet me! \240\159\145\139\240\159\146\149",
            ["cleared_text"] = "%s is feeling loved!"
        }
    end,
    ["create_action"] = function(_)
        local v1 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v2 = require(v1.InlineAction)
        local v_u_3 = require(game.ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialHelper)
        local v4 = require(script.Parent.Parent.Parent.LegacyLoad)
        local v_u_5 = v4("RouterClient")
        local v_u_6 = v4("UIManager")
        return v2.new(function()
            if v_u_3.is_new_tutorial_running() then
                v_u_5.get("TutorialAPI/ReportDiscreteStep"):FireServer("selected_pet_me_ailment")
            end
            local v7 = v_u_6.apps.FocusPetApp.petting_handler
            v7:show_example()
            v7:start_petting()
            return true
        end)
    end,
    ["create_server_components"] = function(_, _)
        return {}
    end
})