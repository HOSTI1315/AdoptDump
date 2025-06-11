--// ReplicatedStorage.SharedModules.Game.ValidatePerformanceModifiers (ModuleScript)

local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v3 = v2("package:t")
local v_u_4 = v2("package:Sift")
if not v1:IsStudio() then
    return function()
        return true
    end
end
local function v6(p5)
    return p5 == v_u_4.None
end
local v7 = v3.optional
local v8 = v3.strictInterface
local v9 = {}
local v10 = v3.boolean
v9.teleporting_disabled = v7(v3.union(v10, v6))
local v11 = v3.boolean
v9.ignore_goal_when_teleporting = v7(v3.union(v11, v6))
local v12 = v3.strictInterface({
    ["jumping"] = v7(v3.boolean),
    ["pathfinding"] = v7(v3.boolean),
    ["teleporting"] = v7(v3.boolean)
})
v9.shouldnt_avoid_obstacles_by = v7(v3.union(v12, v6))
local v13 = v3.table
v9.movement_target = v7(v3.union(v13, v6))
local v14 = v3.number
v9.walkspeed = v7(v3.union(v14, v6))
local v15 = v3.table
v9.rotation_target = v7(v3.union(v15, v6))
local v16 = v3.number
v9.rotation_power = v7(v3.union(v16, v6))
local v17 = v3.Vector3
v9.movement_vector = v7(v3.union(v17, v6))
local v18 = v3.boolean
v9.should_jump = v7(v3.union(v18, v6))
local v19 = v3.number
v9.jump_height = v7(v3.union(v19, v6))
local v20 = v3.boolean
v9.dont_allow_remote_interaction = v7(v3.union(v20, v6))
local v21 = v3.boolean
v9.dont_allow_sit_states = v7(v3.union(v21, v6))
local v22 = v3.boolean
v9.dont_allow_mount_states = v7(v3.union(v22, v6))
local v23 = v3.boolean
v9.shouldnt_pathfind = v7(v3.union(v23, v6))
local v24 = v3.boolean
v9.shouldnt_start_pathfinding_from_vertical_target_distance = v7(v3.union(v24, v6))
local v25 = v3.boolean
v9.should_start_pathfinding = v7(v3.union(v25, v6))
local v26 = v3.CFrame
v9.cframe = v7(v3.union(v26, v6))
local v27 = v3.table
v9.head_target = v7(v3.union(v27, v6))
local v28 = v3.Vector3
v9.head_angles = v7(v3.union(v28, v6))
local v29 = v3.string
v9.eyes_id = v7(v3.union(v29, v6))
local v30 = v3.Color3
v9.eye_color = v7(v3.union(v30, v6))
local v31 = v3.array(v3.string)
v9.effects = v7(v3.union(v31, v6))
local v32 = v3.array(v3.string)
v9.accessory_ids = v7(v3.union(v32, v6))
local v33 = v3.boolean
v9.is_drinking = v7(v3.union(v33, v6))
local v34 = v3.string
v9.local_anim_name = v7(v3.union(v34, v6))
local v35 = v3.number
v9.local_anim_speed = v7(v3.union(v35, v6))
local v36 = v3.string
v9.anim_name = v7(v3.union(v36, v6))
local v37 = v3.boolean
v9.sitting_cancels_server_anim = v7(v3.union(v37, v6))
local v38 = v3.number
v9.anim_fade_time = v7(v3.union(v38, v6))
local v39 = v3.number
v9.idle_anim_speed = v7(v3.union(v39, v6))
local v40 = v3.number
v9.hold_anim_speed = v7(v3.union(v40, v6))
local v41 = v3.string
v9.trick_name = v7(v3.union(v41, v6))
local v42 = v3.enum(Enum.AnimationPriority)
v9.animation_priority_override = v7(v3.union(v42, v6))
local v43 = v3.boolean
v9.pause_ailment_chat_bubbles = v7(v3.union(v43, v6))
local v44 = v3.table
v9.looping_sounds = v7(v3.union(v44, v6))
local v45 = v3.number
v9.stumble_time = v7(v3.union(v45, v6))
local v46 = v3.Vector3
v9.stumble_direction = v7(v3.union(v46, v6))
local v47 = v3.string
v9.current_form = v7(v3.union(v47, v6))
return v8(v9)