--// ReplicatedStorage.ClientModules.Utilities.ViewportModelFitter (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")
local v_u_2 = require(game.ReplicatedStorage.new.modules.AABBHelper)
local v_u_3 = {
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
}
local v_u_4 = {
    0,
    1,
    3,
    4,
    5,
    7
}
local v_u_5 = {
    0,
    1,
    4,
    5,
    6
}
local function v_u_17(p6, p7, p8)
    local v9 = {}
    for _, v10 in pairs(p8) do
        local v11 = v10 + 1
        local v12 = v10 / 4
        local v13 = math.floor(v12) % 2 * 2 - 1
        local v14 = v10 / 2
        local v15 = math.floor(v14) % 2 * 2 - 1
        local v16 = 2 * (v10 % 2) - 1
        v9[v11] = p6 * (p7 * Vector3.new(v13, v15, v16))
    end
    return v9
end
local function v_u_24(p18)
    local v19 = {}
    for _, v20 in pairs(p18:GetDescendants()) do
        if v20:IsA("BasePart") then
            local v21
            if v20:IsA("WedgePart") then
                v21 = v_u_4
            elseif v20:IsA("CornerWedgePart") then
                v21 = v_u_5
            else
                v21 = v_u_3
            end
            local v22 = v_u_17(v20.CFrame, v20.Size / 2, v21)
            for _, v23 in pairs(v22) do
                table.insert(v19, v23)
            end
        end
    end
    return v19
end
local function v_u_35(p25, p26, p27, p28)
    local v29 = (-1 / 0)
    local v30 = (1 / 0)
    for _, v31 in pairs(p25) do
        local v32 = p28 * (p27 - v31.Z)
        local v33 = v31[p26] + v32
        local v34 = v31[p26] - v32
        v29 = math.max(v29, v33, v34)
        v30 = math.min(v30, v33, v34)
    end
    return v29, v30
end
local v36 = v1("ViewportModelFitter")
function v36.__init(p37, p38, p39, p40, p41)
    local v42 = p41 or {}
    p37.viewport = p38
    p37.camera = p39
    p37.model = nil
    p37.point_cloud = {}
    p37.model_cframe = CFrame.new()
    p37.model_size = Vector3.new()
    p37.model_radius = 0
    p37.trig_cache = {}
    p37.ignore_transparent = v42.ignore_transparent or false
    p37.model_size_axis = v42.model_size_axis or nil
    p37:recalibrate()
    if p40 then
        p37:update_target_model(p40)
    end
end
function v36.update_target_model(p43, p44)
    p43.model = p44
    local v45, v46 = p43:get_bounding_box()
    p43.model_cframe = v45
    p43.model_size = v46
    if p43.model_size_axis then
        p43.model_radius = v46[p43.model_size_axis.Name] / 2
    else
        p43.model_radius = v46.Magnitude / 2
    end
    p43.point_cloud = v_u_24(p44)
end
function v36.get_bounding_box(p47)
    local v48 = {}
    for _, v49 in p47.model:GetDescendants() do
        if v49:IsA("BasePart") and (not p47.ignore_transparent or v49.Transparency < 1) then
            table.insert(v48, v49)
        end
    end
    return v_u_2.get_bounding_box(p47.model:GetPivot().Rotation, v48)
end
function v36.recalibrate(p50)
    local v51 = {}
    local v52 = p50.viewport.AbsoluteSize
    v51.aspect = v52.X / v52.Y
    local v53 = p50.camera.FieldOfView / 2
    v51.y_fov2 = math.rad(v53)
    local v54 = v51.y_fov2
    v51.tan_y_fov2 = math.tan(v54)
    local v55 = v51.tan_y_fov2 * v51.aspect
    v51.x_fov2 = math.atan(v55)
    local v56 = v51.x_fov2
    v51.tan_x_fov2 = math.tan(v56)
    local v57 = v51.tan_y_fov2
    local v58 = v51.aspect
    local v59 = v57 * math.min(1, v58)
    v51.clamped_fov2 = math.atan(v59)
    local v60 = v51.clamped_fov2
    v51.sin_clamped_fov2 = math.sin(v60)
    p50.trig_cache = v51
end
function v36.get_fit_distance(p61, p62)
    local v63 = p61.model
    assert(v63, "No model has been set")
    local v64 = p62 and ((p62 - p61.model_cframe.Position).Magnitude or 0) or 0
    return (p61.model_radius + v64) / p61.trig_cache.sin_clamped_fov2
end
function v36.get_minimum_fit_cframe(p65, p66)
    local v67 = p65.model
    assert(v67, "No model has been set")
    local v68 = p66 - p66.Position
    local v69 = v68:Inverse()
    local v70 = p65.point_cloud
    local v71 = { v69 * v70[1] }
    local v72 = v71[1].Z
    for v73 = 2, #v70 do
        local v74 = v69 * v70[v73]
        local v75 = v74.Z
        v72 = math.min(v72, v75)
        v71[v73] = v74
    end
    local v76, v77 = v_u_35(v71, "X", v72, p65.trig_cache.tan_x_fov2)
    local v78, v79 = v_u_35(v71, "Y", v72, p65.trig_cache.tan_y_fov2)
    local v80 = (v76 - v77) / 2 / p65.trig_cache.tan_x_fov2
    local v81 = (v78 - v79) / 2 / p65.trig_cache.tan_y_fov2
    local v82 = math.max(v80, v81)
    return v68 * CFrame.new((v76 + v77) / 2, (v78 + v79) / 2, v72 + v82)
end
return v36