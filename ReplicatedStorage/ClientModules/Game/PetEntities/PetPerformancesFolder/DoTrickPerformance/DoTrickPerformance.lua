--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.DoTrickPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_4 = v1("ModifierPriority")
local v_u_5 = v1("AnimationManager")
local v_u_6 = v1("package:Promise")
game:GetService("Workspace")
local v_u_7 = game:GetService("ContentProvider")
local v8 = {
    ["name"] = script.Name
}
local v_u_9 = {
    [v3.Carried] = true,
    [v3.Eating] = true,
    [v3.Focused] = true,
    [v3.FollowingPresetPath] = true,
    [v3.Navigating] = true,
    [v3.Swimming] = true
}
function v8.validate(p10, p11)
    local v12 = p10.active_performances.Eat ~= nil
    local v13 = p10.active_performances.FetchThrowtoy ~= nil
    local v14 = p10.move_state.is_moving
    local v15 = false
    if not p10.base.entry.tricks then
        return false
    end
    for _, v16 in p10.base.entry.tricks do
        if p11.trick_name == v16[1] then
            v15 = true
        end
    end
    if v15 then
        v15 = not (v12 or (v13 or v14))
    end
    return v15
end
function v8.init_performance(p_u_17, p18)
    local v19 = p18.trick_name
    local v_u_20 = nil
    for _, v21 in p_u_17.base.entry.tricks do
        if v19 == v21[1] then
            v_u_20 = v21[2]
        end
    end
    local v_u_22 = {
        ["trick_name"] = v19,
        ["trick_anim_name"] = v_u_20
    }
    local v_u_23 = os.clock()
    v_u_6.try(function()
        local v24 = p_u_17.base.pet_model
        if v24 then
            v24 = p_u_17.shared_cache.Animator
        end
        if v24 and p_u_17.visible then
            local v25 = v24:LoadAnimation((v_u_5.get_track(v_u_20)))
            v_u_7:PreloadAsync({ v25.Animation })
            return v25.Length == 0 and 0 or (v25.Looped and (1 / 0) or v25.Length)
        end
    end):andThen(function(p26)
        v_u_22.anim_end_timestamp = v_u_23 + p26 + 0.03333333333333333
    end)
    return v_u_22
end
function v8.step(p27, p28)
    local v29 = p27.move_state.is_moving or p27.mount_state.movement_speed > 0
    local v30 = p27.exclusive_state
    if v30 then
        v30 = v_u_9[p27.exclusive_state]
    end
    local v31 = p28.anim_end_timestamp
    if v31 then
        v31 = os.clock() > p28.anim_end_timestamp
    end
    if v29 or (v30 or v31) then
        return v_u_2.Cancel
    end
end
function v8.calculate_modifiers(_, p32)
    return {
        ["anim_name"] = p32.trick_anim_name,
        ["sitting_cancels_server_anim"] = false,
        ["trick_name"] = p32.trick_name
    }, {
        ["anim_name"] = v_u_4.Higher,
        ["sitting_cancels_server_anim"] = v_u_4.Higher,
        ["trick_name"] = v_u_4.Higher
    }
end
return v8