--// ReplicatedStorage.ClientServices.PetStabilizer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Spring")
local v3 = v1("Class")
local v_u_4 = v1("Maid")
local v5 = v3("PetStabilizer")
function v5.__init(p_u_6, p7, p8, p9)
    p_u_6.hrp = p7
    p_u_6.torso = p8
    p_u_6.animation_controller = p9
    p_u_6.damping = 100
    p_u_6.spring = v_u_2.new(p_u_6.damping, 400, p8.Position - p7.Position)
    p_u_6.maid = v_u_4.new()
    p_u_6.animations_changed = false
    p_u_6.maid:GiveTask(p_u_6.animation_controller.AnimationPlayed:Connect(function(p10)
        p_u_6:_monitor_track_stopped(p10)
        p_u_6.animations_changed = true
    end))
    local v11 = p_u_6.animation_controller:GetPlayingAnimationTracks()
    for _, v12 in ipairs(v11) do
        p_u_6:_monitor_track_stopped(v12)
    end
end
function v5._monitor_track_stopped(p_u_13, p14)
    p_u_13.maid:GiveTask(p14.Stopped:Connect(function()
        p_u_13.animations_changed = true
    end))
end
function v5._increment_damping(p15, p16)
    p15.damping = p15.damping + p16
    p15.spring:set_damping_ratio(p15.damping)
end
function v5._set_damping(p17, p18)
    p17.damping = p18
    p17.spring:set_damping_ratio(p17.damping)
end
function v5._reset_damping(p19)
    p19.damping = 100
    p19.spring:set_damping_ratio(100)
end
function v5._get_damping(p20)
    return p20.damping
end
function v5._have_animations_changed(p21)
    return p21.animations_changed
end
function v5._reset_animations_changed_dirty_bit(p22)
    p22.animations_changed = false
end
function v5.get_stabilized_offset(p23, p24)
    local v25 = p23.hrp
    local v26 = p23.torso
    local v27 = p23.spring
    local v28 = v26.Position - v25.Position
    v27:set_goal(v28)
    if p23:_have_animations_changed() then
        p23:_reset_damping()
        p23:_reset_animations_changed_dirty_bit()
    elseif p23:_get_damping() > 2350 then
        p23:_set_damping(9999999999)
    else
        p23:_increment_damping(p24 * 750)
    end
    v27:update(p24)
    return v27:get_position(), v28
end
function v5.destroy(p29)
    p29.maid:DoCleaning()
end
return v5