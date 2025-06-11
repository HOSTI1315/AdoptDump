--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.hungry (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.PreferenceHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local function v_u_5(p4)
    return p4.ailment_to_boost == "hungry"
end
local v45 = v1.new({
    ["kind"] = "hungry",
    ["category"] = "DEFAULT",
    ["reward"] = 10,
    ["create_description"] = function(_)
        return {
            ["name"] = "Hungry",
            ["display_text"] = "Feed your pet!",
            ["image"] = "rbxassetid://18861587647",
            ["large_image"] = "rbxassetid://18861496156",
            ["speech_bubble"] = "I\'m hungry! \240\159\141\166\240\159\141\149\240\159\141\148",
            ["cleared_text"] = "%s is full!"
        }
    end,
    ["create_action"] = function(p6)
        local v7 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v_u_8 = require(v7.ActionChoice)
        local v9 = require(v7.ActionQueue)
        local v10 = require(v7.ActionSequence)
        local v11 = require(v7.BackpackSelectAction)
        local v12 = require(v7.InlineAction)
        local v13 = require(v7.NavigateOrBuyFurnitureAction)
        local v14 = require(v7.NavigationAction)
        local v_u_15 = require(game.ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialHelper)
        local v_u_16 = require(v7.UseItemAction)
        local v17 = require(script.Parent.Parent.Parent.LegacyLoad)
        local v_u_18 = v17("CharWrapperClient")
        local v_u_19 = v17("ClientToolManager")
        local v_u_20 = v17("InventoryDB")
        local v_u_21 = v17("RouterClient")
        local v22 = v_u_2.get_preference(p6)
        local v_u_23 = v13.new({
            ["ailment_to_boost"] = "hungry",
            ["kind"] = "ailments_refresh_2024_cheap_food_bowl"
        })
        local v24 = v9.new
        local v25 = {}
        local v26 = {
            ["category"] = "food",
            ["filter_callback"] = v_u_5
        }
        local v27 = v11.new(v26)
        local v28 = v_u_8.new
        local v29 = {}
        local v30 = {
            ["text"] = "Get Food at the Supermarket",
            ["action"] = v14.new({
                ["final_destination"] = "Supermarket"
            })
        }
        __set_list(v29, 1, {v30})
        __set_list(v25, 1, {v27, v28(v29)})
        local v_u_31 = v24(v25)
        if v_u_15.is_completed() then
            if not v22 then
                return v12.new(function()
                    local v32 = v_u_19.get_equipped_by_category("food")[1]
                    local v_u_33
                    if v32 then
                        v_u_33 = v_u_20.food[v32.kind]
                    else
                        v_u_33 = nil
                    end
                    local v34 = v32 and {
                        ["text"] = ("Give %*"):format(v_u_33.name),
                        ["action"] = v_u_16.new({
                            ["category"] = v32.category,
                            ["kind"] = v32.kind,
                            ["unique"] = v32.unique
                        }),
                        ["is_valid"] = function(_)
                            return v_u_33.ailment_to_boost == "hungry"
                        end
                    } or nil
                    local v36 = {
                        {
                            ["text"] = "Go to the Nearest Food Bowl",
                            ["action"] = v_u_23,
                            ["is_valid"] = function(p35)
                                return not v_u_18.is_doll(p35.char)
                            end
                        },
                        {
                            ["text"] = "Choose Item",
                            ["action"] = v_u_31
                        }
                    }
                    return v_u_8.new(v_u_3.List.join({ v34 }, v36))
                end)
            end
            local v37 = v_u_2.get_preference_choices(v22)
            return v_u_8.new(v_u_3.List.join(v37, {
                {
                    ["text"] = "Go to the Nearest Food Bowl",
                    ["action"] = v_u_23,
                    ["is_valid"] = function(p38)
                        return not v_u_18.is_doll(p38.char)
                    end
                },
                {
                    ["text"] = "Choose Item",
                    ["action"] = v_u_31
                }
            }))
        end
        local v39 = v10.new
        local v40 = {}
        local v41 = v12.new(function()
            if v_u_15.is_new_tutorial_running() then
                v_u_21.get("TutorialAPI/ReportDiscreteStep"):FireServer("selected_hungry_ailment")
            end
            return true
        end)
        local v42 = v9.new
        local v43 = {}
        local v44 = {
            ["category"] = "food",
            ["filter_callback"] = v_u_5
        }
        __set_list(v43, 1, {v11.new(v44), v_u_23})
        __set_list(v40, 1, {v41, v42(v43)})
        return v39(v40)
    end,
    ["create_server_components"] = function(_, _)
        return {}
    end
})
return v_u_2.wrap(v45, {
    ["item_category"] = "food",
    ["filter_callback"] = v_u_5,
    ["items_are_consumable"] = true
})