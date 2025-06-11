--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.HeadRotator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Spring")
local v3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_4 = v1("PetEntityHelper")
local v_u_5 = v1("new:PetRigs")
local v_u_6 = v1("package:Sift")
local v7 = {}
local v_u_8 = {
    [v3.Carried] = true,
    [v3.Eating] = true,
    [v3.Mounted] = true
}
v7.optimization_run_only_for = "owned"
local function v_u_14(p9)
    local v10 = {}
    for _, v11 in p9:GetDescendants() do
        if v11:IsA("Motor6D") and (v11.Part0 and v11.Part1) then
            v10[v11.Part0] = v10[v11.Part0] or {}
            v10[v11.Part1] = v10[v11.Part1] or {}
            local v12 = v10[v11.Part0]
            table.insert(v12, v11)
            local v13 = v10[v11.Part1]
            table.insert(v13, v11)
        end
    end
    return v10
end
local function v_u_29(p15, p16, p_u_17)
    local v_u_18 = v_u_14(p15.Parent)
    local v_u_19 = {
        [p15] = true
    }
    local v_u_20 = nil
    local function v_u_26(p21, p22)
        if not v_u_20 then
            for _, v23 in v_u_18[p21] or {} do
                local v24 = nil
                if v23.Part0 == p21 then
                    v24 = v23.Part1
                elseif v23.Part1 == p21 then
                    v24 = v23.Part0
                end
                if v24 and not v_u_19[v24] then
                    v_u_19[v24] = true
                    local v25 = {
                        ["part"] = v24,
                        ["joint"] = v23,
                        ["parent"] = p22
                    }
                    if v24 == p_u_17 then
                        v_u_20 = v25
                        return
                    end
                    v_u_26(v24, v25)
                end
            end
        end
    end
    v_u_26(p15, {
        ["part"] = p15,
        ["joint"] = nil,
        ["parent"] = nil
    })
    local v27 = {}
    while v_u_20 and (v_u_20.parent and v_u_20.part ~= p16) do
        local v28 = v_u_20.joint
        table.insert(v27, 1, v28)
        v_u_20 = v_u_20.parent
    end
    if #v27 == 0 then
        return nil
    else
        return v27
    end
end
local function v_u_36(p30, p31)
    local v32 = {}
    for _, v33 in ipairs(p30:GetChildren()) do
        if v33:IsA("Motor6D") and (v33.Part1 and (v33.Part1.Name:match("Hand") or v33.Part1.Name:match("Foot"))) then
            table.insert(v32, v33)
        end
    end
    for _, v34 in ipairs(p31:GetChildren()) do
        if v34:IsA("BasePart") and (v34.Name:match("Hand") or v34.Name:match("Foot")) then
            for _, v35 in ipairs(v34:GetChildren()) do
                if v35:IsA("Motor6D") and (v35.Part1 and (v35.Part1.Name:match("Hand") or v35.Part1.Name:match("Foot"))) then
                    table.insert(v32, v35)
                end
            end
        end
    end
    return v32
end
local function v_u_40(p37)
    local v38 = CFrame.new()
    for _, v39 in ipairs(p37) do
        v38 = v38 * v39.C0 * v39.C1:Inverse()
    end
    return v38
end
local function v_u_43(p41)
    for _, v42 in ipairs(p41.Parent:GetDescendants()) do
        if v42:IsA("Motor6D") and (v42.Part0 == p41 or v42.Part1 == p41) then
            return v42
        end
    end
    return nil
end
local function v_u_58(p44)
    local v45 = p44.head_rotation
    if v45.needs_setup then
        if v45.setup_attempts_remaining <= 0 then
            v45.needs_setup = false
            return
        elseif p44.base.char_wrapper or p44.is_npc_pet then
            local v46 = p44.base.entry
            if v46.head_rotator_disabled then
                v45.needs_setup = false
                return
            else
                local v47 = p44.head_rotation
                v47.setup_attempts_remaining = v47.setup_attempts_remaining - 1
                local v48 = p44.base.pet_model
                local v_u_49 = v48:WaitForChild("HumanoidRootPart")
                local v50 = v_u_5.get(v48).get_geo_part(v48, "Torso")
                local v51 = v_u_5.get(v48).get_geo_part(v48, v46.head_rotator_name_override or "Head")
                local v52 = p44.base.root:FindFirstChild("OuterToInnerMotor")
                if v52 then
                    if v46.head_rotator_uses_torso_instead or not (v51 and v50) then
                        local v53 = v_u_29(v_u_49, v_u_49, v50)
                        if v53 == nil then
                            return
                        end
                        v45.head_motors = { v53[1] }
                        v45.eye_offset = CFrame.new()
                        if v50 then
                            v45.feet_motors = v_u_36(v50, v48)
                        end
                    else
                        local v54 = v_u_29(v_u_49, v50, v51)
                        if v54 == nil then
                            return
                        end
                        v45.head_motors = v54
                        v45.eye_offset = v_u_40(v54)
                    end
                    local v55 = v_u_43(v_u_49)
                    assert(v55, "Pet is missing a joint between the HumanoidRootPart and Torso.")
                    v45.hrp_joint = v55
                    v45.outer_inner = v52
                    v45.neck_base_motor = v45.head_motors[1]
                    v45.spring = v_u_2.new(1, 2, (Vector3.new()))
                    v45.head_bones = v_u_6.List.map(v45.head_motors, function(p56)
                        return v_u_49:FindFirstChild(p56.Part1.Name:gsub("_Geo", ""), true)
                    end)
                    if v45.feet_motors then
                        v45.feet_bones = v_u_6.List.map(v45.feet_motors, function(p57)
                            return v_u_49:FindFirstChild(p57.Part1.Name:gsub("_Geo", ""), true)
                        end)
                    end
                    v45.needs_setup = false
                end
            end
        else
            v45.needs_setup = false
            return
        end
    else
        return
    end
end
function v7.setup(p59)
    v_u_58(p59)
end
function v7.step(p_u_60, p61)
    if p_u_60.client_has_control and not (p_u_60.exclusive_state and v_u_8[p_u_60.exclusive_state]) then
        if p_u_60.base.entry.is_egg then
            return
        elseif p_u_60.base.entry.head_rotator_disabled then
            return
        elseif v_u_4.is_pet_mounted(p_u_60.base.char) then
            return
        elseif p_u_60.is_changing_interiors then
            return
        else
            local v62 = p_u_60.head_rotation
            if v62.needs_setup then
                v_u_58(p_u_60)
            end
            if v62.head_motors then
                local v_u_63 = p_u_60.modifier_values_from_performances.head_target
                local v64 = p_u_60.modifier_values_from_performances.head_angles
                local v_u_65 = nil
                if v_u_63 then
                    xpcall(function()
                        v_u_65 = v_u_63:get_position(p_u_60)
                    end, function(p66)
                        warn((("[HeadRotator] Failed to get head target position:\n%*\n%*"):format(p66, (debug.traceback(nil, 2)))))
                    end)
                end
                local v67 = v62.head_motors
                local v68 = v62.neck_base_motor
                local v69 = v62.outer_inner
                local v70 = v62.feet_motors
                local v71 = v69.Part0.CFrame * v69.C0 * v69.C1:Inverse()
                local v72 = Vector3.new()
                if v_u_65 then
                    local v73 = (v71 * v62.eye_offset):PointToObjectSpace(v_u_65)
                    if v73.Magnitude ~= 0 then
                        local v74 = v73.Unit
                        local v75 = v74.X
                        local v76 = -v74.Z
                        local v77 = -math.atan2(v75, v76)
                        local v78 = math.clamp(v77, -1.0471975511965976, 1.0471975511965976)
                        local v79 = v74.Y
                        local v80 = math.asin(v79)
                        local v81 = math.clamp(v80, -1.5707963267948966, 1.5707963267948966)
                        v62.spring.p = v62.spring.p * Vector3.new(1, 1, 0)
                        local v82 = v78 - 0
                        v72 = Vector3.new(v82, v81, 0)
                    end
                else
                    v72 = v64 or v72
                end
                v62.spring:set_goal(v72)
                v62.spring:update(p61)
                local v83 = v68.Transform
                local v84, _, _ = v83:ToEulerAnglesXYZ()
                local v85 = v_u_65 and v84 and v84 or 0
                if not v70 then
                    local v86, _, _ = v62.hrp_joint.Transform:ToEulerAnglesXYZ()
                    v85 = v85 + (v_u_65 and v86 and v86 or 0)
                end
                local v87 = #v67
                local v88 = v62.spring:get_position()
                local v89 = v88.X / v87
                local v90 = (v88.Y - v85) / v87
                local v91 = v88.Z
                if p_u_60.base.entry.head_rotator_doesnt_rotate_while_moving and p_u_60.move_state.is_moving then
                    v62.spring.p = Vector3.new()
                elseif v70 then
                    v68.Transform = CFrame.fromEulerAnglesYXZ(v90, v89, v91) * v83
                    local v92 = v68.C1:Inverse()
                    local v93 = v68.Part0.CFrame * v68.C0 * v83 * v92
                    local v94 = v68.Part0.CFrame * v68.C0 * v68.Transform * v92
                    for v95, v96 in ipairs(v70) do
                        local v97 = v93 * v96.C0 * v96.Transform * v96.C1:Inverse()
                        v96.Transform = (v94 * v96.C0):Inverse() * v97 * v96.C1
                        local v98 = v62.feet_bones[v95]
                        if v98 then
                            v98.Transform = v96.Transform
                        end
                    end
                else
                    for v99, v100 in ipairs(v67) do
                        local v101 = v100.Part0.CFrame * v100.C0
                        local v102 = CFrame.fromAxisAngle(v101:VectorToObjectSpace(v71.YVector), v89) * CFrame.fromAxisAngle(v101:VectorToObjectSpace(v71.XVector), v90) * CFrame.fromAxisAngle(v101:VectorToObjectSpace(v71.ZVector), v91)
                        v100.Transform = v102 * v100.Transform
                        local v103 = v62.head_bones[v99]
                        if v103 then
                            v103.Transform = v102 * v103.Transform
                        end
                    end
                end
            else
                return
            end
        end
    else
        return
    end
end
return v7