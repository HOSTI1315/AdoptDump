--// ReplicatedStorage.new.modules.Ailments.Helpers.AilmentRewardsHelper (ModuleScript)

require(script.Parent.AilmentReward)
local v1 = require(script.Parent.Parent.Parent.LegacyLoad)
local v2 = v1("ContentPackHelper")
local v_u_3 = v1("EquippedPets")
local v_u_4 = {}
local v_u_5 = {}
for _, v6 in script.Parent.AilmentReward:GetChildren() do
    if v6:IsA("ModuleScript") then
        local v7 = require(v6)
        v_u_4[v7.key] = v7
    end
end
v2.merge("AilmentRewards", v_u_4)
local v_u_8 = {}
function v_u_5.get_reward_sequence()
    if next(v_u_8) then
        return v_u_8
    end
    local v9 = {}
    for v10, v11 in v_u_4 do
        if v11.reward_animation then
            table.insert(v9, v10)
        end
    end
    table.sort(v9, function(p12, p13)
        local v14 = v_u_4[p12]
        local v15 = v_u_4[p13]
        return v14.reward_animation.sequence_order < v15.reward_animation.sequence_order
    end)
    v_u_8 = v9
    return v9
end
function v_u_5.get_reward_entry(p16)
    return v_u_4[p16]
end
function v_u_5.apply_rewards(p17, p18, p19)
    local v20 = v_u_3.get_wrapper_from_unique(p19.unique_id) ~= nil
    local v21 = {}
    for _, v22 in v_u_4 do
        if (not v22.pets_only or v20) and not (v22.exclude_family_members and p19.is_family_reward) then
            local v23 = v22.get(p17, p18, p19)
            local v24 = v22.apply_multiplier(p17, v23, p19)
            local v25 = v22.apply_budget(p17, v24, p19)
            if v25 > 0 then
                v22.commit(p17, v25, p19)
                v21[v22.key] = v25
            end
        end
    end
    return v21
end
function v_u_5.render_ailment_tags(p26, p27, p28)
    local v29
    if p26.unique == nil then
        v29 = false
    else
        v29 = v_u_3.get_wrapper_from_unique(p26.unique) ~= nil
    end
    for _, v30 in v_u_5.get_reward_sequence() do
        local v31 = v_u_5.get_reward_entry(v30)
        if (not v31.pets_only or v29) and ((not v31.exclude_family_members or p26.source_player == game.Players.LocalPlayer) and (v31.render_ailment_tag and v31.render_ailment_tag(p26, p27, p28))) then
            break
        end
    end
end
return v_u_5