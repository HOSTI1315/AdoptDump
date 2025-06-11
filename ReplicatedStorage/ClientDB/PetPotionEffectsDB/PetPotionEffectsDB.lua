--// ReplicatedStorage.ClientDB.PetPotionEffectsDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("KindDB")
local v_u_3 = v_u_1("PetProgressionDB")
local v4 = v_u_1("ContentPackHelper")
local function v19(p_u_5)
    return {
        ["validate"] = function(_, p6)
            if p6.properties.age >= 6 then
                return false, "Your pet is already fully grown!"
            else
                return true, nil
            end
        end,
        ["consume"] = function(_, p7, p8)
            local v9 = p8.pet_progression_manager
            if not v9:can_level_friendship() then
                local v10 = p_u_5
                while v10 > 0 and p7.properties.age < 6 do
                    local v11 = v9:get_ailments_to_completion()
                    local v12 = math.min(v11, v10)
                    v10 = v10 - v12
                    v9:complete_ailment(v12, {
                        ["ignore_aging_multiplier"] = true
                    })
                end
                if v10 > 0 then
                    v9:complete_ailment(v10, {
                        ["ignore_aging_multiplier"] = true
                    })
                end
                return true
            end
        end,
        ["multi_use_count"] = function(_, p13)
            local v14 = v_u_2[p13.kind]
            if v14 then
                local v15 = v_u_3.get_ailments_per_age(v14)
                local v16 = 0
                for v17 = p13.properties.age, #v15 do
                    v16 = v16 + (v15[v17] or 0)
                end
                local v18 = (v16 - p13.properties.ailments_completed) / p_u_5
                return math.ceil(v18)
            end
        end
    }
end
local v64 = {
    ["pet_riding_potion"] = {
        ["validate"] = function(_, p20)
            if p20.properties.rideable then
                return false, "You can already ride this pet, feeding it another potion is a waste!"
            else
                return true, nil
            end
        end,
        ["consume"] = function(p21, p22, _)
            local v23 = v_u_1("MsgBridge")
            if not p22.properties.rideable then
                p22.properties.rideable = true
                p22:mark_updated()
                v23.hint(p21, {
                    ["text"] = "You can now ride your pet!",
                    ["length"] = 5
                })
                return true
            end
        end
    },
    ["pet_flying_potion"] = {
        ["validate"] = function(_, p24)
            if p24.properties.flyable then
                return false, "You can already fly this pet, feeding it another potion is a waste!"
            else
                return true, nil
            end
        end,
        ["consume"] = function(p25, p26, _)
            local v27 = v_u_1("MsgBridge")
            if not p26.properties.flyable then
                p26.properties.flyable = true
                p26:mark_updated()
                v27.hint(p25, {
                    ["text"] = "You can now fly your pet!",
                    ["length"] = 5
                })
                return true
            end
        end
    },
    ["pet_grow_potion"] = {
        ["validate"] = function(_, p28)
            local v29 = p28.properties.timed_flags and (p28.properties.timed_flags.potion_scale and p28.properties.timed_flags.potion_scale.value) or 0
            if math.max(0, v29) >= 3 and v_u_1("UIManager").apps.DialogApp:dialog({
                ["text"] = "Your pet can\'t get much bigger! Do you want to use the potion to keep your pet big for 10 more minutes?",
                ["left"] = "No",
                ["right"] = "Yes"
            }) == "No" then
                return false, nil
            else
                return true, nil
            end
        end,
        ["consume"] = function(p30, p31, p32)
            local v33 = v_u_1("MsgBridge")
            local v34 = p32.timed_flag_manager
            local v35 = v34:get_value("potion_scale") or 0
            local v36 = math.clamp(v35, 0, (1 / 0))
            local v37 = v36 + 1
            v34:increase_flag_time_left("potion_scale", 600)
            v34:set_value("potion_scale", v37)
            p31:mark_updated()
            if v36 == 0 then
                v33.hint(p30, {
                    ["text"] = "Your pet is now bigger for 10 minutes!",
                    ["length"] = 5
                })
            elseif v36 >= 3 then
                v33.hint(p30, {
                    ["text"] = "Your pet can\'t get much bigger!",
                    ["length"] = 5
                })
            else
                v33.hint(p30, {
                    ["text"] = "Your pet is now bigger for 10 more minutes!",
                    ["length"] = 5
                })
            end
            return true
        end
    },
    ["pet_shrink_potion"] = {
        ["validate"] = function(_, p38)
            local v39 = p38.properties.timed_flags and (p38.properties.timed_flags.potion_scale and p38.properties.timed_flags.potion_scale.value) or 0
            if math.min(0, v39) <= -3 and v_u_1("UIManager").apps.DialogApp:dialog({
                ["text"] = "Your pet can\'t get much smaller! Do you want to use the potion to keep your pet small for 10 more minutes?",
                ["left"] = "No",
                ["right"] = "Yes"
            }) == "No" then
                return false, nil
            else
                return true, nil
            end
        end,
        ["consume"] = function(p40, p41, p42)
            local v43 = v_u_1("MsgBridge")
            local v44 = p42.timed_flag_manager
            local v45 = v44:get_value("potion_scale") or 1
            local v46 = math.clamp(v45, (-1 / 0), 0)
            local v47 = v46 - 1
            v44:increase_flag_time_left("potion_scale", 600)
            v44:set_value("potion_scale", v47)
            p41:mark_updated()
            if v46 == 0 then
                v43.hint(p40, {
                    ["text"] = "Your pet is now smaller for 10 minutes!",
                    ["length"] = 5
                })
            elseif v46 <= -3 then
                v43.hint(p40, {
                    ["text"] = "Your pet can\'t get much smaller!",
                    ["length"] = 5
                })
            else
                v43.hint(p40, {
                    ["text"] = "Your pet is now smaller for 10 more minutes!",
                    ["length"] = 5
                })
            end
            return true
        end
    },
    ["pet_translucency_potion"] = {
        ["validate"] = function(_, p48)
            local v49 = p48.properties.timed_flags and p48.properties.timed_flags.potion_translucency
            if v49 then
                v49 = p48.properties.timed_flags.potion_translucency.value
            end
            if v49 and v49 >= 5 and v_u_1("UIManager").apps.DialogApp:dialog({
                ["text"] = "Your pet can\'t get any more transparent! Do you want to use your potion keep your pet transparent for 10 more minutes?",
                ["left"] = "No",
                ["right"] = "Yes"
            }) == "No" then
                return false, nil
            else
                return true, nil
            end
        end,
        ["consume"] = function(p50, p51, p52)
            local v53 = v_u_1("MsgBridge")
            local v54 = p52.timed_flag_manager
            local v55 = v54:has_flag("potion_translucency")
            local v56 = (v54:get_value("potion_translucency") or 0) + 1
            local v57 = math.clamp(v56, 0, 5)
            v54:increase_flag_time_left("potion_translucency", 600)
            v54:set_value("potion_translucency", v57)
            p51:mark_updated()
            if v55 then
                local v58 = v57 < 5 and "translucent" or "transparent"
                v53.hint(p50, {
                    ["text"] = "Your pet is now " .. v58 .. " for 10 more minutes!",
                    ["length"] = 5
                })
            else
                v53.hint(p50, {
                    ["text"] = "Your pet is now translucent for 10 minutes!",
                    ["length"] = 5
                })
            end
            return true
        end
    },
    ["cure_all_potion"] = {
        ["validate"] = function(p59, _)
            local v60 = v_u_1("new:AilmentsClient").get_ailments_for_pet_serialized(p59)
            if next(v60) then
                return true, nil
            else
                return false, "Your pet has no needs to cure, so save it for later!"
            end
        end,
        ["consume"] = function(_, _, p61)
            v_u_1("new:AilmentsServer").complete_all_ailments(p61)
            return true
        end
    },
    ["pet_age_potion"] = v19(v_u_1("SharedConstants").ailments_per_friendship_level),
    ["tiny_pet_age_potion"] = v19(3),
    ["halloween_2024_sugar_skull_potion"] = v19(45),
    ["pet_instant_hatch_potion"] = {
        ["validate"] = function(_, _)
            return true, nil
        end,
        ["consume"] = function(p62, p63, _)
            return v_u_1("EggHatcher").hatch_current_pet(p62, p63.unique_id)
        end
    }
}
v4.merge("PetPotionEffects", v64)
return v64