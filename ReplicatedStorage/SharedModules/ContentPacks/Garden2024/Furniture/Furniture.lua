--// ReplicatedStorage.SharedModules.ContentPacks.Garden2024.Furniture (ModuleScript)

local v_u_1 = game:GetService("Players")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v_u_2("EntryHelper")
local v4 = v_u_2("MerchantHelper")
local v_u_5 = v_u_2("GardenObbyHelper")
local v6 = v3.furniture
local v16 = {
    ["garden_2024_finish_door"] = {
        ["name"] = "FinishDoor",
        ["model_name"] = "Garden2024FinishDoor",
        ["behavior"] = (function()
            return {
                ["dont_automatically_mark_furniture_change_after_use"] = true,
                ["use_text"] = function()
                    return nil
                end,
                ["client_use"] = function()
                    local v7 = v_u_2("InteriorsM")
                    local v8 = v_u_2("InteriorsM").get_current_location().destination_id
                    local v9 = v_u_5.CHASEMAP_INTERIOR_NAMES[v8]
                    if v9 == 8 then
                        v7.enter_smooth("Obbies", "Garden2024ChaseMap1", {
                            ["anchor_char_immediately"] = false,
                            ["post_character_anchored_wait"] = false,
                            ["studs_ahead_of_door"] = 6
                        })
                    else
                        local v10 = ("Garden2024ChaseMap%*"):format(v9 + 1)
                        v7.enter_smooth(v10, "MainDoor", {
                            ["anchor_char_immediately"] = false,
                            ["post_character_anchored_wait"] = false,
                            ["studs_ahead_of_door"] = 10
                        })
                    end
                end,
                ["post_render"] = function(_, p11, _, _, p_u_12)
                    local v13 = p11:FindFirstChild("Door")
                    local v_u_14 = false
                    v13.Touched:Connect(function(p15)
                        if v_u_14 then
                            return
                        elseif p15:IsDescendantOf(v_u_1.LocalPlayer.Character) then
                            v_u_14 = true
                            p_u_12:activate_async()
                            v_u_14 = false
                        end
                    end)
                end
            }
        end)()
    }
}
local v17 = {
    ["name"] = "Ross",
    ["model_name"] = "Garden2024Ross"
}
local v18 = {
    ["requirements"] = {
        {
            ["requirement_type"] = "kind",
            ["category"] = "pets",
            ["kind"] = "garden_2024_mole",
            ["amount"] = 6
        }
    },
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "garden_2024_golden_tortoise_beetle"
        }
    }
}
v17.behavior = v4.MERCHANT("garden_2024_ross", v18, {
    ["tag"] = "Gardener",
    ["theme_color"] = "red"
})
v16.garden_2024_ross = v17
local v19 = {
    ["name"] = "Moss",
    ["model_name"] = "Garden2024Moss"
}
local v20 = {}
local v21 = {}
local v22 = {
    ["requirement_type"] = "kind",
    ["category"] = "pets",
    ["kind"] = "garden_2024_garden_snake",
    ["properties"] = {
        ["neon"] = true
    }
}
__set_list(v21, 1, {v22})
v20.requirements = v21
v20.rewards = {
    {
        ["category"] = "pets",
        ["kind"] = "garden_2024_golden_tortoise_beetle"
    }
}
v19.behavior = v4.MERCHANT("garden_2024_moss", v20, {
    ["tag"] = "Gardener",
    ["theme_color"] = "blue"
})
v16.garden_2024_moss = v19
return v6(v16)