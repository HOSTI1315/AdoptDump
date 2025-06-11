--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.thirsty (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.PreferenceHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local function v_u_5(p4)
    return p4.ailment_to_boost == "thirsty"
end
local v36 = v1.new({
    ["kind"] = "thirsty",
    ["category"] = "DEFAULT",
    ["reward"] = 10,
    ["create_description"] = function(_)
        return {
            ["name"] = "Thirsty",
            ["display_text"] = "Give your pet a drink!",
            ["image"] = "rbxassetid://18861586659",
            ["large_image"] = "rbxassetid://18861494900",
            ["speech_bubble"] = "I\'m thirsty! \240\159\165\164",
            ["cleared_text"] = "%s is not thirsty anymore!"
        }
    end,
    ["create_action"] = function(p6)
        local v7 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v_u_8 = require(v7.ActionChoice)
        local v9 = require(v7.ActionQueue)
        local v10 = require(v7.BackpackSelectAction)
        local v11 = require(v7.InlineAction)
        local v12 = require(v7.NavigateOrBuyFurnitureAction)
        local v13 = require(v7.NavigationAction)
        local v_u_14 = require(v7.UseItemAction)
        local v15 = require(script.Parent.Parent.Parent.LegacyLoad)
        local v_u_16 = v15("CharWrapperClient")
        local v_u_17 = v15("ClientToolManager")
        local v_u_18 = v15("InventoryDB")
        local v19 = v_u_2.get_preference(p6)
        local v_u_20 = v12.new({
            ["ailment_to_boost"] = "thirsty",
            ["kind"] = "ailments_refresh_2024_cheap_water_bowl"
        })
        local v21 = v9.new
        local v22 = {}
        local v23 = {
            ["category"] = "food",
            ["filter_callback"] = v_u_5
        }
        local v24 = v10.new(v23)
        local v25 = v_u_8.new
        local v26 = {}
        local v27 = {
            ["text"] = "Get a Drink at the Supermarket",
            ["action"] = v13.new({
                ["final_destination"] = "Supermarket"
            })
        }
        __set_list(v26, 1, {v27})
        __set_list(v22, 1, {v24, v25(v26)})
        local v_u_28 = v21(v22)
        if not v19 then
            return v11.new(function()
                local v29 = v_u_17.get_equipped_by_category("food")[1]
                local v_u_30
                if v29 then
                    v_u_30 = v_u_18.food[v29.kind]
                else
                    v_u_30 = nil
                end
                local v31 = v29 and {
                    ["text"] = ("Give %*"):format(v_u_30.name),
                    ["action"] = v_u_14.new({
                        ["category"] = v29.category,
                        ["kind"] = v29.kind,
                        ["unique"] = v29.unique
                    }),
                    ["is_valid"] = function(_)
                        return v_u_30.ailment_to_boost == "thirsty"
                    end
                } or nil
                local v33 = {
                    {
                        ["text"] = "Go to the Nearest Water Bowl",
                        ["action"] = v_u_20,
                        ["is_valid"] = function(p32)
                            return not v_u_16.is_doll(p32.char)
                        end
                    },
                    {
                        ["text"] = "Choose Item",
                        ["action"] = v_u_28
                    }
                }
                return v_u_8.new(v_u_3.List.join({ v31 }, v33))
            end)
        end
        local v34 = v_u_2.get_preference_choices(v19)
        return v_u_8.new(v_u_3.List.join(v34, {
            {
                ["text"] = "Go to the Nearest Water Bowl",
                ["action"] = v_u_20,
                ["is_valid"] = function(p35)
                    return not v_u_16.is_doll(p35.char)
                end
            },
            {
                ["text"] = "Choose Item",
                ["action"] = v_u_28
            }
        }))
    end,
    ["create_server_components"] = function(_, _)
        return {}
    end
})
return v_u_2.wrap(v36, {
    ["item_category"] = "food",
    ["filter_callback"] = v_u_5,
    ["items_are_consumable"] = true
})