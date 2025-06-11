--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.beach_party (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.MysteryHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v4 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_5 = v4("SharedConstants")
local v_u_6 = v4("Utilities")
local function v_u_11(p7)
    local v8 = workspace:WaitForChild("StaticMap"):WaitForChild("Beach"):WaitForChild("BeachPartyAilmentTarget")
    local v9 = workspace:WaitForChild("StaticMap"):WaitForChild("Beach"):WaitForChild("BeachPartyAilmentPerimeter")
    local v10 = (v8.Position - p7).magnitude < 600 and v_u_6.point_in_points(p7, {}, v9)
    if v10 then
        if p7.Y > v8.Position.Y - 20 then
            v10 = p7.Y < v8.Position.Y + 170
        else
            v10 = false
        end
    end
    return v10
end
return v1.new({
    ["kind"] = "beach_party",
    ["category"] = "GOLDEN",
    ["reward"] = 18,
    ["create_description"] = function(_)
        return {
            ["name"] = "Beach Party",
            ["display_text"] = "Take your pet to the Beach Party to cool off!",
            ["image"] = "rbxassetid://18861579446",
            ["large_image"] = "rbxassetid://18861486402",
            ["speech_bubble"] = "Let\'s go to the Beach Party! \240\159\143\150\239\184\143",
            ["cleared_text"] = "%s cooled off!"
        }
    end,
    ["create_action"] = function(_)
        local v12 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v13 = require(v12.ActionChoice)
        local v14 = require(v12.NavigationAction)
        local v15 = v13.new
        local v16 = {}
        local v17 = {
            ["text"] = "Go to the Beach Party"
        }
        local v18 = {
            ["final_destination"] = "MainMap",
            ["custom_position_or_method"] = function()
                return workspace:WaitForChild("StaticMap"):WaitForChild("Beach"):WaitForChild("BeachPartyNavTarget").Position
            end,
            ["custom_has_arrived_method"] = v_u_11
        }
        v17.action = v14.new(v18)
        __set_list(v16, 1, {v17})
        return v15(v16)
    end,
    ["create_server_components"] = function(_, p19, p_u_20)
        local v21 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v22 = require(v21.RateArea)
        local v_u_23 = require(v21.Expiration)
        local v24 = v_u_3.Dictionary.join
        local v25 = {}
        local v29 = {
            ["ailment_key"] = p_u_20,
            ["total_time"] = 50,
            ["destination_id"] = "MainMap",
            ["is_in_area"] = function(p26)
                local v27 = p26.char
                local v28
                if v27 then
                    v28 = v27:FindFirstChild("HumanoidRootPart")
                else
                    v28 = nil
                end
                if v28 then
                    return v_u_11(v28.Position)
                else
                    return false
                end
            end
        }
        v25.rate_area = v22.new(v29)
        return v24(v25, v_u_2.persist_or_create(p19, function()
            local v30 = {
                ["expiration"] = v_u_23.new({
                    ["ailment_key"] = p_u_20,
                    ["seconds_into_cycle"] = v_u_5.day_length
                })
            }
            return v30
        end))
    end
})