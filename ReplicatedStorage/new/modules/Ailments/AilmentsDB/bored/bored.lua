--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.bored (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.MysteryHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v4 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_5 = v4("SharedConstants")
local v_u_6 = v4("Utilities")
local function v_u_10(p7)
    local v8 = workspace.StaticMap.Park.AilmentTarget
    local v9 = (v8.Position - p7).magnitude < 400 and v_u_6.point_in_points(p7, { v_u_6.get_corners(v8) })
    if v9 then
        if p7.Y > v8.Position.Y then
            v9 = p7.Y < v8.Position.Y + 170
        else
            v9 = false
        end
    end
    return v9
end
return v1.new({
    ["kind"] = "bored",
    ["category"] = "GOLDEN",
    ["reward"] = 18,
    ["create_description"] = function(_)
        return {
            ["name"] = "Bored",
            ["display_text"] = "Take your pet to the Playground to have fun!",
            ["image"] = "rbxassetid://18861599789",
            ["large_image"] = "rbxassetid://18861501597",
            ["speech_bubble"] = "Let\'s go to the Playground! \240\159\165\177",
            ["cleared_text"] = "%s isn\'t bored anymore!"
        }
    end,
    ["create_action"] = function(_)
        local v11 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v12 = require(v11.ActionChoice)
        local v13 = require(v11.NavigationAction)
        local v14 = v12.new
        local v15 = {}
        local v16 = {
            ["text"] = "Go to the Playground"
        }
        local v17 = {
            ["final_destination"] = "MainMap",
            ["custom_position_or_method"] = function()
                return workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget").Position
            end,
            ["custom_has_arrived_method"] = v_u_10
        }
        v16.action = v13.new(v17)
        __set_list(v15, 1, {v16})
        return v14(v15)
    end,
    ["create_server_components"] = function(_, p18, p_u_19)
        local v20 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v21 = require(v20.RateArea)
        local v_u_22 = require(v20.Expiration)
        local v23 = v_u_3.Dictionary.join
        local v24 = {}
        local v28 = {
            ["ailment_key"] = p_u_19,
            ["total_time"] = 50,
            ["destination_id"] = "MainMap",
            ["is_in_area"] = function(p25)
                local v26 = p25.char
                local v27
                if v26 then
                    v27 = v26:FindFirstChild("HumanoidRootPart")
                else
                    v27 = nil
                end
                if v27 then
                    return v_u_10(v27.Position)
                else
                    return false
                end
            end
        }
        v24.rate_area = v21.new(v28)
        return v23(v24, v_u_2.persist_or_create(p18, function()
            local v29 = {
                ["expiration"] = v_u_22.new({
                    ["ailment_key"] = p_u_19,
                    ["seconds_into_cycle"] = v_u_5.day_length
                })
            }
            return v29
        end))
    end
})