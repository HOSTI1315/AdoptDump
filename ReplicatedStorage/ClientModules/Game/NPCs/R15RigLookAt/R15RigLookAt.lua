--// ReplicatedStorage.ClientModules.Game.NPCs.R15RigLookAt (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Spring")
local v3 = v1("Class")
local v_u_4 = game:GetService("RunService")
local v5 = v3("R15RigLookAt")
local v_u_6 = {
    ["horizontal_range"] = 2.792526803190927,
    ["vertical_range"] = 2.0943951023931953,
    ["max_horizontal_waist"] = 0.39269908169872414,
    ["max_horizontal_head"] = 1.8325957145940461
}
function v5.__init(p_u_7, p8)
    p_u_7.rig = p8
    local v9 = p8:WaitForChild("Head")
    local v10 = p8:WaitForChild("UpperTorso")
    p_u_7.hrp = p8:WaitForChild("HumanoidRootPart")
    p_u_7.neck = v9:WaitForChild("Neck")
    p_u_7.waist = v10:WaitForChild("Waist")
    p_u_7.eye_offset = p_u_7.hrp.CFrame:inverse() * v9.CFrame
    p_u_7.neck_C0 = p_u_7.neck.C0
    p_u_7.waist_C0 = p_u_7.waist.C0
    p_u_7.spring = v_u_2.new(0.75, 1, (Vector3.new()))
    p_u_7.enabled_random_idle_anims = p_u_7:_disable_random_idle_anims()
    p_u_7.stepped = v_u_4.Stepped:Connect(function(_, p11)
        p_u_7:_update(p11)
    end)
end
function v5._disable_random_idle_anims(p12)
    local v13 = p12.rig:FindFirstChild("Animate")
    if not v13 then
        return function() end
    end
    local v_u_14 = v13:FindFirstChild("idle")
    local v_u_15 = v_u_14 and (v_u_14:GetChildren() or {}) or {}
    table.sort(v_u_15, function(p16, p17)
        return p16.Weight.Value > p17.Weight.Value
    end)
    for v18 = 2, #v_u_15 do
        v_u_15[v18].Parent = nil
    end
    return function()
        for v19 = 2, #v_u_15 do
            v_u_15[v19].Parent = v_u_14
        end
    end
end
function v5._update(p20, p21)
    if not p20.is_enabled then
        p20.spring:set_goal(Vector3.new(0, 0, 0))
    end
    p20.spring:update(p21)
    local v22 = p20.spring:get_position()
    p20.neck.C0 = p20.neck_C0 * CFrame.fromEulerAnglesYXZ(v22.z / 2, v22.x, 0)
    p20.waist.C0 = p20.waist_C0 * CFrame.fromEulerAnglesYXZ(v22.z / 2, v22.y, 0)
end
function v5._get_eye_cframe(p23)
    return p23.hrp.CFrame * p23.eye_offset
end
function v5.set_enabled(p24, p25)
    if p25 ~= p24.is_enabled then
        p24.is_enabled = p25
    end
end
function v5.set_target(p26, p27)
    local v28 = Vector3.new(0, 0, 0)
    local v29 = p26:_get_eye_cframe():PointToObjectSpace(p27)
    if v29:Dot(v29) > 0 then
        local v30 = v29.Unit
        local v31 = v30.x
        local v32 = -v30.z
        local v33 = -math.atan2(v31, v32)
        local v34 = v30.y
        local v35 = math.asin(v34)
        if math.abs(v33) <= v_u_6.horizontal_range and math.abs(v35) <= v_u_6.vertical_range then
            local v36 = math.sign(v33)
            local v37 = math.abs(v33)
            local v38 = v37 / 2
            local v39 = v37 / 2
            if v_u_6.max_horizontal_waist < v39 then
                local v40 = v39 - v_u_6.max_horizontal_waist
                v39 = v_u_6.max_horizontal_waist
                local v41 = v38 + v40
                local v42 = v_u_6.max_horizontal_head
                v38 = math.clamp(v41, 0, v42)
            end
            local v43 = v36 * v38
            local v44 = v36 * v39
            v28 = Vector3.new(v43, v44, v35)
        end
    end
    p26.spring:set_goal(v28)
end
function v5.destroy(p45)
    p45.stepped:Disconnect()
    p45.stepped = nil
    p45.neck.C0 = p45.neck_C0
    p45.waist.C0 = p45.waist_C0
    p45.enabled_random_idle_anims()
end
return v5