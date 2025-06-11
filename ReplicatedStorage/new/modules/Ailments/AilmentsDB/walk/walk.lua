--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.walk (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.PreferenceHelper)
local v13 = v1.new({
    ["kind"] = "walk",
    ["category"] = "DEFAULT",
    ["reward"] = 10,
    ["not_for_babies"] = true,
    ["create_description"] = function(_)
        return {
            ["name"] = "Walk",
            ["display_text"] = "Take your pet for a walk!",
            ["image"] = "rbxassetid://18861603059",
            ["large_image"] = "rbxassetid://18861485413",
            ["speech_bubble"] = "Let\'s go for a walk! \240\159\145\159",
            ["cleared_text"] = "%s enjoyed the walk!"
        }
    end,
    ["create_action"] = function(p3)
        local v4 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v5 = require(v4.ActionChoice)
        local v6 = require(v4.DialogAction)
        local v7 = v_u_2.get_preference(p3)
        if not v7 then
            return v6.new({
                ["text"] = "Walk or carry your pet to finish this need."
            })
        end
        local v8 = v_u_2.get_preference_choices(v7, "Equip %s")
        return v5.new(v8)
    end,
    ["create_server_components"] = function(_, _, p9)
        local v10 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v11 = {}
        local v12 = {
            ["ailment_key"] = p9,
            ["total_time"] = 30,
            ["empty_player_state_is_valid"] = true,
            ["empty_pet_state_is_valid"] = true,
            ["valid_player_states"] = {
                ["HoldingBaby"] = true,
                ["ParentPutBabyOnStroller"] = true,
                ["ParentWalkingPet"] = true
            },
            ["valid_pet_states"] = {
                ["BabyBeingHeld"] = true,
                ["PetOnLeash"] = true
            },
            ["invalid_player_states"] = {
                ["PlayerRidingPet"] = true
            },
            ["invalid_pet_states"] = {
                ["SitInVehicle"] = true
            }
        }
        v11.rate_movement = require(v10.RateMovement).new(v12)
        return v11
    end
})
return v_u_2.wrap(v13, {
    ["item_category"] = "toys",
    ["filter_callback"] = function(p14)
        return p14.tool == "PetLeash"
    end,
    ["speech_bubble_format_string"] = "Can we use %s?",
    ["not_mutually_exclusive"] = true
})