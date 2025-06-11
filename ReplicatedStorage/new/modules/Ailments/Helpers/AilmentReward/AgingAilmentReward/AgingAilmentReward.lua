--// ReplicatedStorage.new.modules.Ailments.Helpers.AilmentReward.AgingAilmentReward (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_2 = v_u_1("EquippedPets")
local v3 = require(script.Parent).new
local v4 = {
    ["key"] = "xp_reward",
    ["pets_only"] = true
}
local v6 = {
    ["sequence_order"] = 2,
    ["pickup"] = {
        ["source"] = "me",
        ["target"] = "pet",
        ["model"] = game.ReplicatedStorage.Resources.XPPickup
    },
    ["billboard"] = {
        ["get_text"] = function(p5)
            return ("+%* XP"):format(p5)
        end,
        ["color"] = Color3.fromRGB(255, 170, 0)
    }
}
v4.reward_animation = v6
function v4.get(_, p7, _)
    return p7.xp_reward
end
function v4.apply_multiplier(p8, p9, p10)
    local v11 = v_u_1("BucksAgingMultiplierHelper")
    local v12 = v_u_2.get_wrapper_from_unique(p10.unique_id, p8)
    return v11.apply_aging_multiplier_for_pet(p8, v12, p9)
end
function v4.commit(p13, p14, p15)
    local v16 = v_u_2.get_wrapper_from_unique(p15.unique_id, p13)
    if v16 then
        v16 = v16.pet_progression_manager
    end
    if v16 then
        v16:complete_ailment(p14, {
            ["ignore_aging_multiplier"] = true
        })
    end
end
return v3(v4)