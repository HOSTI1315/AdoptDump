--// ReplicatedStorage.SharedModules.Game.FurnitureSerializerHelper (ModuleScript)

local v_u_1 = {}
local v_u_2 = {}
local v3 = {}
for v4 = 1, 64 do
    local v5 = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v4, v4)
    v_u_1[v4 - 1] = v5
    v_u_2[v5] = v4 - 1
end
local function v_u_12(p6)
    local v7 = math.sign(p6)
    local v8 = math.abs(p6)
    local v9 = ""
    while v8 > 0 do
        local v10 = v8 / 64
        local v11 = math.floor(v10)
        v9 = v_u_1[v8 - v11 * 64] .. v9
        v8 = v11
    end
    return (v7 == -1 and "-" or "") .. v9
end
local function v_u_18(p13)
    local v14
    if p13:sub(1, 1) == "-" then
        p13 = p13:sub(2)
        v14 = -1
    else
        v14 = 1
    end
    local v15 = 1
    local v16 = 0
    for v17 = #p13, 1, -1 do
        v16 = v16 + v15 * v_u_2[p13:sub(v17, v17)]
        v15 = v15 * 64
    end
    return v14 * v16
end
local function v_u_41(p19)
    local v20, v21 = p19:ToAxisAngle()
    local v22 = v21 / 2
    local v23 = math.cos(v22)
    local v24 = v21 / 2
    local v25 = math.sin(v24) * v20
    local v26 = v25.X
    local v27 = v25.Y
    local v28 = v25.Z
    local v29 = -1
    local v30 = 1
    local v31 = 1
    for v32, v33 in {
        v26,
        v27,
        v28,
        v23
    } do
        local v34 = math.abs(v33)
        if v29 < v34 then
            v31 = math.sign(v33)
            v30 = v32
            v29 = v34
        end
    end
    local v35 = v29 - 1
    if math.abs(v35) <= 1e-6 then
        return { v30 + 4 }
    end
    if v30 == 1 then
        v26 = v27
        v27 = v28
        v28 = v23
    elseif v30 == 2 then
        v27 = v28
        v28 = v23
    elseif v30 == 3 then
        v28 = v23
    end
    local v36 = v26 * v31 * 1000000
    local v37 = math.round(v36)
    local v38 = v27 * v31 * 1000000
    local v39 = math.round(v38)
    local v40 = v28 * v31 * 1000000
    return {
        v30,
        v37,
        v39,
        (math.round(v40))
    }
end
local function v_u_53(p42)
    local v43 = p42[1]
    if v43 > 4 and v43 <= 8 then
        local v44 = v43 == 5 and 1 or 0
        local v45 = v43 == 6 and 1 or 0
        local v46 = v43 == 7 and 1 or 0
        local v47 = v43 == 8 and 1 or 0
        return CFrame.new(0, 0, 0, v44, v45, v46, v47)
    else
        local v48 = p42[2] / 1000000
        local v49 = p42[3] / 1000000
        local v50 = p42[4] / 1000000
        local v51 = 1 - (v48 * v48 + v49 * v49 + v50 * v50)
        local v52 = math.sqrt(v51)
        if v43 == 1 then
            return CFrame.new(0, 0, 0, v52, v48, v49, v50)
        elseif v43 == 2 then
            return CFrame.new(0, 0, 0, v48, v52, v49, v50)
        elseif v43 == 3 then
            return CFrame.new(0, 0, 0, v48, v49, v52, v50)
        else
            return CFrame.new(0, 0, 0, v48, v49, v50, v52)
        end
    end
end
function v3.compress(p54)
    local v55 = p54.Position
    local v56 = {}
    local v57 = v55.X * 1000000
    local v58 = math.round(v57)
    local v59 = v55.Y * 1000000
    local v60 = math.round(v59)
    local v61 = v55.Z * 1000000
    __set_list(v56, 1, {v58, v60, (math.round(v61))})
    local v62 = v_u_41(p54.Rotation)
    local v63 = {}
    for v64, v65 in table.move(v62, 1, #v62, #v56 + 1, v56) do
        v63[v64] = v_u_12(v65)
    end
    return table.concat(v63, "=")
end
function v3.decompress(p66)
    local v67 = {}
    for v68, v69 in p66:split("=") do
        local v70 = v_u_18(v69)
        if v70 then
            v67[v68] = v70
        else
            error("Invalid compressed string passed. Unable to convert to number.", 2)
        end
    end
    local v71 = table.move(v67, 1, 3, 1, {})
    local v72 = v71[1] / 1000000
    local v73 = v71[2] / 1000000
    local v74 = v71[3] / 1000000
    local v75 = Vector3.new(v72, v73, v74)
    local v76 = v_u_53(table.move(v67, 4, #v67, 1, {}))
    return CFrame.new(v75) * v76
end
return v3