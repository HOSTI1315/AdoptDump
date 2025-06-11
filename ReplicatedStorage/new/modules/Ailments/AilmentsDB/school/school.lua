--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.school (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.MysteryHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = require(script.Parent.Parent.Parent.LegacyLoad)("SharedConstants")
return v1.new({
    ["kind"] = "school",
    ["category"] = "GOLDEN",
    ["reward"] = 18,
    ["create_description"] = function(_)
        return {
            ["name"] = "School",
            ["display_text"] = "Take your pet to School to learn something new!",
            ["image"] = "rbxassetid://18861580580",
            ["large_image"] = "rbxassetid://18861489780",
            ["speech_bubble"] = "It\'s time for School! \240\159\143\171",
            ["cleared_text"] = "%s finished School!"
        }
    end,
    ["create_action"] = function(_)
        local v5 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v6 = require(v5.ActionChoice)
        local v7 = require(v5.NavigationAction)
        local v8 = v6.new
        local v9 = {}
        local v10 = {
            ["text"] = "Go to School",
            ["action"] = v7.new({
                ["final_destination"] = "School"
            })
        }
        __set_list(v9, 1, {v10})
        return v8(v9)
    end,
    ["create_server_components"] = function(_, p11, p_u_12)
        local v13 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v14 = require(v13.RateArea)
        local v_u_15 = require(v13.Expiration)
        local v16 = v_u_3.Dictionary.join
        local v17 = {
            ["rate_area"] = v14.new({
                ["ailment_key"] = p_u_12,
                ["total_time"] = 50,
                ["destination_id"] = "School"
            })
        }
        return v16(v17, v_u_2.persist_or_create(p11, function()
            local v18 = {
                ["expiration"] = v_u_15.new({
                    ["ailment_key"] = p_u_12,
                    ["seconds_into_cycle"] = v_u_4.day_length
                })
            }
            return v18
        end))
    end
})