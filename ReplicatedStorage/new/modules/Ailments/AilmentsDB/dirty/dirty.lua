--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.dirty (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_3 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_4 = v_u_3("SharedConstants")
local function v_u_6(p5)
    return p5.tool == "CleanPetTool"
end
return v1.new({
    ["kind"] = "dirty",
    ["category"] = "DEFAULT",
    ["reward"] = 12,
    ["create_description"] = function(_)
        return {
            ["name"] = "Dirty",
            ["display_text"] = "Wash your pet!",
            ["image"] = "rbxassetid://18861597514",
            ["large_image"] = "rbxassetid://18861481184",
            ["speech_bubble"] = "I need a bath! \240\159\154\191",
            ["cleared_text"] = "%s is clean!"
        }
    end,
    ["create_action"] = function(_)
        local v7 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v_u_8 = require(v7.ActionChoice)
        local v_u_9 = require(v7.BackpackSelectAction)
        local v_u_10 = require(v7.InlineAction)
        local v_u_11 = require(v7.NavigateOrBuyFurnitureAction)
        local v_u_12 = require(game.ReplicatedStorage.new.modules.ABTest.ABTests.SoapAB)
        local v_u_13 = require(game.ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialHelper)
        local v_u_14 = require(v7.UseItemAction)
        local v_u_15 = v_u_3("ClientToolManager")
        local v_u_16 = v_u_3("InventoryDB")
        return v_u_10.new(function()
            local v17 = v_u_15.get_equipped_by_category("toys")[1]
            local v_u_18
            if v17 then
                v_u_18 = v_u_16.toys[v17.kind]
            else
                v_u_18 = nil
            end
            local v19 = v17 and {
                ["text"] = ("Use %*"):format(v_u_18.name),
                ["action"] = v_u_14.new({
                    ["category"] = v17.category,
                    ["kind"] = v17.kind,
                    ["unique"] = v17.unique
                }),
                ["is_valid"] = function(_)
                    return v_u_18.tool == "CleanPetTool"
                end
            } or nil
            local v20 = v_u_8.new
            local v21 = v_u_2.List.join
            local v22 = {}
            local v23 = {
                ["text"] = "Go to the Nearest Bath",
                ["action"] = v_u_10.new(function()
                    if v_u_13.is_new_tutorial_running() then
                        v_u_13.flags.set("started_home_nav", true)
                    end
                    return v_u_11.new({
                        ["ailment_to_boost"] = "dirty",
                        ["kind"] = "cheapbathtub"
                    })
                end)
            }
            local v24 = {
                ["text"] = "Choose Item"
            }
            local v25 = {
                ["category"] = "toys",
                ["filter_callback"] = v_u_6
            }
            v24.action = v_u_9.new(v25)
            function v24.is_valid()
                return v_u_12:get_value("give_soap")
            end
            __set_list(v22, 1, {v23, v24})
            return v20(v21({ v19 }, v22))
        end)
    end,
    ["create_server_components"] = function(_, _, p26)
        local v27 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v33 = {
            ["rate_area"] = require(v27.RateArea).new({
                ["ailment_key"] = p26,
                ["total_time"] = v_u_4.full_shower_duration,
                ["destination_id"] = "VIP",
                ["is_in_area"] = function(p28)
                    local v29 = game.ServerStorage.Downloadable.Interiors:FindFirstChild("VIP")
                    if v29 then
                        v29 = v29:FindFirstChild("HotTubOrigin")
                    end
                    if not v29 then
                        return false
                    end
                    local v30 = p28.char
                    local v31
                    if v30 then
                        v31 = v30:FindFirstChild("HumanoidRootPart")
                    else
                        v31 = nil
                    end
                    if not v31 then
                        return false
                    end
                    local v32 = v31.Position
                    return (v29.Position - v32).Magnitude < 17
                end
            })
        }
        return v33
    end
})