--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.camping (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.MysteryHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local function v_u_5(p4)
    return (workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin").Position - p4).magnitude < 110
end
return v1.new({
    ["kind"] = "camping",
    ["category"] = "GOLDEN",
    ["reward"] = 15,
    ["create_description"] = function(_)
        return {
            ["name"] = "Camping",
            ["display_text"] = "Take your pet to the Campsite for some outdoor fun!",
            ["image"] = "rbxassetid://18861581779",
            ["large_image"] = "rbxassetid://18861491054",
            ["speech_bubble"] = "Let\'s go camping! \240\159\143\149\239\184\143",
            ["cleared_text"] = "%s finished camping!"
        }
    end,
    ["create_action"] = function(_)
        local v6 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v7 = require(v6.ActionChoice)
        local v8 = require(v6.NavigationAction)
        local v9 = v7.new
        local v10 = {}
        local v11 = {
            ["text"] = "Go to the Campsite"
        }
        local v12 = {
            ["final_destination"] = "MainMap",
            ["custom_position_or_method"] = function()
                return workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin").Position
            end,
            ["custom_has_arrived_method"] = v_u_5
        }
        v11.action = v8.new(v12)
        __set_list(v10, 1, {v11})
        return v9(v10)
    end,
    ["create_server_components"] = function(_, p13, p_u_14)
        local v15 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v16 = require(v15.RateArea)
        local v_u_17 = require(v15.Expiration)
        local v18 = v_u_3.Dictionary.join
        local v23 = {
            ["rate_area"] = v16.new({
                ["ailment_key"] = p_u_14,
                ["total_time"] = 50,
                ["destination_id"] = "MainMap",
                ["is_in_area"] = function(p19)
                    local v20 = p19.char
                    local v21
                    if v20 then
                        v21 = v20:FindFirstChild("HumanoidRootPart")
                    else
                        v21 = nil
                    end
                    if not v21 then
                        return false
                    end
                    local v22 = v21.Position
                    return (workspace:WaitForChild("StaticMap"):WaitForChild("Campsite"):WaitForChild("CampsiteOrigin").Position - v22).magnitude < 110
                end
            })
        }
        return v18(v23, v_u_2.persist_or_create(p13, function()
            local v24 = {}
            local v25 = {
                ["ailment_key"] = p_u_14,
                ["seconds_into_cycle"] = 0
            }
            v24.expiration = v_u_17.new(v25)
            return v24
        end))
    end
})