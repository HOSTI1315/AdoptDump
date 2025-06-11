--// ReplicatedStorage.SharedModules.Curves.CatmullRomSpline (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("CompositeCatmullRomSpline")
local v_u_4 = v1("package:t")
local v_u_5 = v_u_4.strictInterface({
    ["alpha"] = v_u_4.optional(v_u_4.numberConstrained(0, 1))
})
local v_u_6 = v2("CatmullRomSpline")
function v_u_6.get_value(p7, p8)
    local v9 = math.clamp(p8, 0, 1)
    local v10 = p7.points
    local v11, v12, v13, v14 = unpack(v10)
    local v15 = p7:_get_t_for_segment(0, v11, v12)
    local v16 = p7:_get_t_for_segment(v15, v12, v13)
    local v17 = p7:_get_t_for_segment(v16, v13, v14)
    local v18 = p7:_lerp(v15, v16, v9)
    local v19 = (v15 - v18) / (v15 - 0) * v11 + (v18 - 0) / (v15 - 0) * v12
    local v20 = (v16 - v18) / (v16 - v15) * v12 + (v18 - v15) / (v16 - v15) * v13
    local v21 = (v17 - v18) / (v17 - v16) * v13 + (v18 - v16) / (v17 - v16) * v14
    local v22 = (v16 - v18) / (v16 - 0) * v19 + (v18 - 0) / (v16 - 0) * v20
    local v23 = (v17 - v18) / (v17 - v15) * v20 + (v18 - v15) / (v17 - v15) * v21
    return (v16 - v18) / (v16 - v15) * v22 + (v18 - v15) / (v16 - v15) * v23
end
function v_u_6.get_cframe(p24, p25)
    local v26 = math.clamp(p25, 0, 1)
    local v27 = p24:get_value(v26)
    local v28
    if v26 + 0.0025 >= 1 then
        v28 = v27 + (v27 - p24:get_value(v26 - 0.0025))
    else
        v28 = p24:get_value(v26 + 0.0025)
    end
    return CFrame.lookAt(v27, v28)
end
function v_u_6.from_folder(p29, p30)
    local v31 = #p29:GetChildren()
    local v32 = Vector3.new(0, 0, 0)
    local v33 = {}
    for v34 = 1, v31 do
        v32 = v32 + p29:FindFirstChild((tostring(v34))):GetPivot().Position / v31
    end
    for v35 = 1, v31 - 3 do
        local v36 = p29:FindFirstChild((tostring(v35))):GetPivot().Position - v32
        local v37 = v35 + 1
        local v38 = p29:FindFirstChild((tostring(v37))):GetPivot().Position - v32
        local v39 = v35 + 2
        local v40 = p29:FindFirstChild((tostring(v39))):GetPivot().Position - v32
        local v41 = v35 + 3
        local v42 = {
            v36,
            v38,
            v40,
            p29:FindFirstChild((tostring(v41))):GetPivot().Position - v32
        }
        v33[v35] = v_u_6.new(v42, p30)
    end
    return v_u_3.new(v33, v32)
end
function v_u_6._lerp(_, p43, p44, p45)
    return p43 + (p44 - p43) * p45
end
function v_u_6._get_t_for_segment(p46, p47, p48, p49)
    local v50 = p49 - p48
    local v51 = v50:Dot(v50)
    local v52 = p46.alpha * 0.5
    return p47 + math.pow(v51, v52)
end
function v_u_6.__init(p53, p54, p55)
    local v56 = p55 or {}
    local v57 = v_u_4.array(v_u_4.Vector3)
    assert(v57(p54))
    local v58 = v_u_5
    assert(v58(v56))
    p53.points = p54
    p53.alpha = v56.alpha or 0.5
end
return v_u_6