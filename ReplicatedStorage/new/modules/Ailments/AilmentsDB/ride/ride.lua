--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.ride (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.PreferenceHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v23 = v1.new({
    ["kind"] = "ride",
    ["category"] = "DEFAULT",
    ["reward"] = 10,
    ["not_for_babies"] = true,
    ["create_description"] = function(_)
        return {
            ["name"] = "Ride",
            ["display_text"] = "Take your pet for a ride!",
            ["image"] = "rbxassetid://18861582601",
            ["large_image"] = "rbxassetid://18861492240",
            ["speech_bubble"] = "Let\'s go for a ride! \240\159\154\151\240\159\154\178\240\159\154\129",
            ["cleared_text"] = "%s enjoyed the ride!"
        }
    end,
    ["create_action"] = function(p4)
        local v5 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v6 = require(v5.ActionChoice)
        local v7 = require(v5.ActionQueue)
        local v8 = require(v5.BackpackSelectAction)
        local v9 = require(v5.NavigationAction)
        local v10 = v_u_2.get_preference(p4)
        local v11 = v7.new
        local v12 = {}
        local v13 = v8.new({
            ["categories"] = { "transport", "strollers" }
        })
        local v14 = v6.new
        local v15 = {}
        local v16 = {
            ["text"] = "Get a Vehicle at the Vehicle Dealership",
            ["action"] = v9.new({
                ["final_destination"] = "AutoShop"
            })
        }
        __set_list(v15, 1, {v16})
        __set_list(v12, 1, {v13, v14(v15)})
        local v17 = v11(v12)
        if not v10 then
            return v17
        end
        local v18 = v_u_2.get_preference_choices(v10, "Equip %s")
        return v6.new(v_u_3.List.join(v18, {
            {
                ["text"] = "Choose Item",
                ["action"] = v17
            }
        }))
    end,
    ["create_server_components"] = function(_, _, p19)
        local v20 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v21 = {}
        local v22 = {
            ["ailment_key"] = p19,
            ["total_time"] = 30,
            ["valid_player_states"] = {
                ["PlayerRidingPet"] = true,
                ["SitInVehicle"] = true,
                ["ParentPutBabyOnStroller"] = true
            },
            ["valid_pet_states"] = {
                ["BabyBeingHeld"] = true,
                ["PetBeingRidden"] = true,
                ["PetBeingFlown"] = true,
                ["SitInVehicle"] = true,
                ["BabyOnStroller"] = true
            }
        }
        v21.rate_movement = require(v20.RateMovement).new(v22)
        return v21
    end
})
return v_u_2.wrap(v23, {
    ["item_categories"] = { "transport", "strollers" },
    ["speech_bubble_format_string"] = "How about in %s?",
    ["not_mutually_exclusive"] = true
})