--// ReplicatedStorage.ClientModules.Game.AnimationScale (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("Maid")
v1("Debug").create_log()
local v_u_3 = game:GetService("RunService")
local v_u_4 = {}
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = 0
function v_u_4.register_model(p_u_8, p9)
    local v10
    if p_u_8 then
        v10 = p_u_8:IsA("Model")
    else
        v10 = p_u_8
    end
    assert(v10, "model must be a model")
    local v11 = not p9 or p9 > 0
    assert(v11, "scale must be greater than 0 or be nil")
    if v_u_5[p_u_8] then
        v_u_5[p_u_8].scale = p9 or 1
        return false
    end
    local v_u_12 = {}
    local v13 = {
        ["model"] = p_u_8,
        ["joints"] = v_u_12,
        ["scale"] = p9 or 1,
        ["maid"] = v_u_2.new()
    }
    local function v15(p14)
        if p14:IsA("Motor6D") or p14:IsA("Bone") then
            v_u_12[p14] = true
        end
    end
    for _, v16 in ipairs(p_u_8:GetDescendants()) do
        if v16:IsA("Motor6D") or v16:IsA("Bone") then
            v_u_12[v16] = true
        end
    end
    v13.maid.motor_added = p_u_8.DescendantAdded:Connect(v15)
    v13.maid.motor_removed = p_u_8.DescendantRemoving:Connect(function(p17)
        if p17:IsA("Motor6D") or p17:IsA("Bone") then
            v_u_12[p17] = nil
        end
    end)
    v13.maid.destroyed = p_u_8.Destroying:Connect(function()
        v_u_4.unregister_model(p_u_8)
    end)
    v_u_5[p_u_8] = v13
    return true
end
function v_u_4.unregister_model(p18)
    local v19 = v_u_5[p18]
    if v19 then
        v_u_5[p18] = nil
        v19.maid:Destroy()
        v_u_4.rebuild_active_list()
    end
end
function v_u_4.set_scale(p20, p21)
    local v22
    if p21 then
        v22 = p21 > 0
    else
        v22 = p21
    end
    assert(v22, "Scale must exist and be greater than 0")
    local v23 = v_u_5[p20]
    assert(v23, "model not registered")
    v23.scale = p21
end
function v_u_4.rebuild_active_list()
    v_u_7 = tick()
    debug.profilebegin("AnimationScale rebuild_active_list")
    local v24 = workspace.CurrentCamera.Focus.p
    local v25 = {}
    for v26, v27 in pairs(v_u_5) do
        if v26:IsDescendantOf(workspace) then
            local v28
            if v26.PrimaryPart then
                v28 = v26.PrimaryPart.Position
            else
                v28 = v26:GetModelCFrame().p
            end
            local v29 = v24 - v28
            local v30 = v29.x
            local v31 = v29.y
            local v32 = v29.z
            local v33 = math.max(v30, v31, v32)
            if v33 <= 1000 then
                v27.last_distance = v33
                table.insert(v25, v27)
            end
        end
    end
    table.sort(v25, function(p34, p35)
        return p34.last_distance < p35.last_distance
    end)
    local v36 = {}
    for v37, v38 in v25 do
        for v39, _ in v38.joints do
            v36[v39] = {
                ["scale"] = (v36[v39] and (v36[v39].scale or 1) or 1) * v38.scale,
                ["transform"] = v39.Transform
            }
        end
        if v37 == 10 then
            break
        end
    end
    v_u_6 = v36
    debug.profileend()
end
function v_u_4._stepped()
    debug.profilebegin("AnimationScale.heartbeat Transform")
    for v40, v41 in v_u_6 do
        if v41.transform ~= v40.Transform then
            local v42 = v40.Transform
            v40.Transform = v42 + v42.Position * (v41.scale - 1)
        end
        v41.transform = v40.Transform
    end
    debug.profileend()
    if tick() - v_u_7 > 1 then
        v_u_4.rebuild_active_list()
    end
end
coroutine.wrap(function()
    v_u_3.Stepped:Connect(v_u_4._stepped)
end)()
return v_u_4