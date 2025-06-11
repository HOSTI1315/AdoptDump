--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.toilet (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v3 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_4 = v3("SharedConstants")
local v_u_5 = v3("InventoryDB")
local v_u_6 = game:GetService("CollectionService")
local function v_u_14(p7)
    if v_u_5.pets[p7.pet_id].is_doll then
        return false
    end
    local v8 = p7.char
    local v9
    if v8 then
        v9 = v8:FindFirstChild("HumanoidRootPart")
    else
        v9 = nil
    end
    if not v9 then
        return false
    end
    local v10 = v9.Position
    local v11 = v_u_6:GetTagged("FireHydrantServer")
    local v_u_12 = Vector3.new(1, 0, 1) * v10
    return v_u_2.List.some(v11, function(p13)
        return (v_u_12 - Vector3.new(1, 0, 1) * p13:GetPivot().Position).Magnitude < v_u_4.fire_hydrant_range
    end)
end
return v1.new({
    ["kind"] = "toilet",
    ["category"] = "DEFAULT",
    ["reward"] = 10,
    ["not_for_babies"] = true,
    ["create_description"] = function(_)
        return {
            ["name"] = "Potty",
            ["display_text"] = "Bring your pet to a toilet or fire hydrant!",
            ["image"] = "rbxassetid://18861601959",
            ["large_image"] = "rbxassetid://18861484342",
            ["speech_bubble"] = "I need the potty! \240\159\154\189",
            ["cleared_text"] = "%s is feeling relieved!"
        }
    end,
    ["create_action"] = function(_)
        local v15 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v16 = require(v15.ActionChoice)
        local v_u_17 = require(v15.ActionSequence)
        local v_u_18 = require(v15.NavigationAction)
        local v_u_19 = require(v15.NavigateOrBuyFurnitureAction)
        local v20 = require(v15.InlineAction)
        return v16.new({
            {
                ["text"] = "Go to the Nearest Potty",
                ["action"] = v20.new(function(p21)
                    if not v_u_5.pets[p21.pet_id].is_doll then
                        return v_u_19.new({
                            ["ailment_to_boost"] = "toilet",
                            ["kind"] = "ailments_refresh_2024_litter_box"
                        })
                    end
                    local v22 = v_u_17.new
                    local v23 = {}
                    local v24 = v_u_18.new
                    local v25 = {
                        ["final_destination"] = {
                            ["destination_id"] = "housing",
                            ["destination_house_owner"] = game.Players.LocalPlayer
                        }
                    }
                    __set_list(v23, 1, {v24(v25), v_u_19.new({
    ["ailment_to_boost"] = "toilet",
    ["kind"] = "toilet"
})})
                    return v22(v23)
                end)
            }
        })
    end,
    ["create_server_components"] = function(_, _, p26)
        local v27 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v28 = require(v27.RateArea)
        local v29 = {
            ["rate_area_main"] = v28.new({
                ["ailment_key"] = p26,
                ["total_time"] = v_u_4.full_toilet_duration,
                ["destination_id"] = "MainMap",
                ["is_in_area"] = v_u_14
            }),
            ["rate_area_neighborhood"] = v28.new({
                ["ailment_key"] = p26,
                ["total_time"] = v_u_4.full_toilet_duration,
                ["destination_id"] = "Neighborhood",
                ["is_in_area"] = v_u_14
            })
        }
        return v29
    end
})