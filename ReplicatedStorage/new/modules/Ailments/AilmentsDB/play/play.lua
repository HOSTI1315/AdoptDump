--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.play (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.PreferenceHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = {
    ["ChewToyTool"] = true,
    ["FlyingDiscTool"] = true,
    ["ThrowToyTool"] = true,
    ["SqueakyToyTool"] = true
}
local function v_u_6(p5)
    return v_u_4[p5.tool] or false
end
local v24 = v1.new({
    ["kind"] = "play",
    ["category"] = "DEFAULT",
    ["reward"] = 10,
    ["not_for_babies"] = true,
    ["not_for_eggs"] = true,
    ["create_description"] = function(_)
        return {
            ["name"] = "Catch",
            ["display_text"] = "Throw a toy for your pet!",
            ["image"] = "rbxassetid://18861600682",
            ["large_image"] = "rbxassetid://18861483329",
            ["speech_bubble"] = "Let\'s play catch! \240\159\142\190\240\159\165\143",
            ["cleared_text"] = "%s had fun playing catch!"
        }
    end,
    ["create_action"] = function(p7)
        local v8 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v9 = require(v8.ActionChoice)
        local v10 = require(v8.ActionQueue)
        local v11 = require(v8.BackpackSelectAction)
        local v12 = require(v8.NavigationAction)
        local v13 = require(game.ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialHelper)
        if v13.is_new_tutorial_running() then
            return v13.create_tutorial_play_action(v_u_6)
        end
        local v14 = v_u_2.get_preference(p7)
        local v15 = v10.new
        local v16 = {}
        local v17 = {
            ["category"] = "toys",
            ["filter_callback"] = v_u_6
        }
        local v18 = v11.new(v17)
        local v19 = v9.new
        local v20 = {}
        local v21 = {
            ["text"] = "Get a Toy at the Pet Shop",
            ["action"] = v12.new({
                ["final_destination"] = "PetShop"
            })
        }
        __set_list(v20, 1, {v21})
        __set_list(v16, 1, {v18, v19(v20)})
        local v22 = v15(v16)
        if not v14 then
            return v22
        end
        local v23 = v_u_2.get_preference_choices(v14, "Equip %s")
        return v9.new(v_u_3.List.join(v23, {
            {
                ["text"] = "Choose Item",
                ["action"] = v22
            }
        }))
    end,
    ["create_server_components"] = function(_, _)
        return {}
    end
})
return v_u_2.wrap(v24, {
    ["item_category"] = "toys",
    ["filter_callback"] = v_u_6,
    ["speech_bubble_format_string"] = "Can you throw %s?"
})