--// ReplicatedStorage.new.modules.Ailments.Helpers.AilmentReward.BucksAilmentReward (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_2 = v_u_1("EquippedPets")
local v3 = require(script.Parent).new
local v4 = {
    ["key"] = "bucks_reward"
}
local v6 = {
    ["sequence_order"] = 1,
    ["pickup"] = {
        ["source"] = "pet",
        ["target"] = "me",
        ["color"] = Color3.fromRGB(56, 220, 97),
        ["image"] = "rbxassetid://3577407233"
    },
    ["billboard"] = {
        ["get_text"] = function(p5)
            return ("+%*"):format(p5)
        end,
        ["color"] = Color3.fromRGB(1, 146, 69),
        ["image"] = "rbxassetid://3577407233"
    },
    ["sprout_currency_id"] = "Bucks"
}
v4.reward_animation = v6
function v4.get(_, p7, _)
    return p7.bucks_reward
end
function v4.apply_multiplier(p8, p9, p10)
    local v11 = v_u_1("BucksAgingMultiplierHelper")
    local v12 = v_u_2.get_wrapper_from_unique(p10.unique_id)
    return v11.apply_bucks_multiplier_for_pet(p8, v12, p9)
end
function v4.apply_budget(p13, p14, p15)
    local v16 = v_u_1("DataM").get_store(p13)
    local v17
    if v16 then
        v17 = v16:get("ailment_rewards_manager")
    else
        v17 = nil
    end
    if v17 then
        return v17:apply_bucks_budget(p15.cycle_number, p14)
    else
        return p14
    end
end
function v4.commit(p18, p19, _)
    v_u_1("new:CurrencyServer").modify_bucks(p18, p19, "Income", "Monitor")
end
return v3(v4)