--// ReplicatedStorage.SharedModules.Game.VehicleUtil (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.new.modules.AABBHelper)
local v_u_2 = game:GetService("CollectionService")
local v3 = {}
local function v_u_9(p4, p5, p6)
    local v7 = p4:Dot(p5)
    local v8 = p4:Cross(p5)
    if v7 < -0.99999 then
        return CFrame.fromAxisAngle(p6, 3.141592653589793)
    else
        return CFrame.new(0, 0, 0, v8.X, v8.Y, v8.Z, 1 + v7)
    end
end
local function v_u_19(p10)
    local v11 = p10:GetPivot().Rotation
    local v_u_12 = {}
    local v13 = {}
    for _, v14 in p10:GetDescendants() do
        if v14:IsA("Folder") and v14.Name == "Weights" then
            table.insert(v_u_12, v14)
        end
    end
    local function v17(p15)
        if v_u_2:HasTag(p15, "Vehicle:Weight") then
            return true
        end
        for _, v16 in v_u_12 do
            if p15 == v16 or p15:IsDescendantOf(v16) then
                return true
            end
        end
        return false
    end
    for _, v18 in p10:GetDescendants() do
        if v18:IsA("BasePart") and not v17(v18) then
            table.insert(v13, v18)
        end
    end
    return v_u_1.get_bounding_box(v11, v13)
end
function v3.get_vehicle_ground_pos_y(p20)
    local v21, v22 = v_u_19(p20)
    local v23 = -v22.Y / 2
    return v21:PointToWorldSpace((Vector3.new(0, v23, 0))).Y
end
function v3.get_vehicle_spawn_cframe(p24, p25)
    local v26 = p25.Character
    local v27
    if v26 then
        v27 = v26:FindFirstChild("Humanoid")
    else
        v27 = v26
    end
    local v28
    if v27 then
        v28 = v27.RootPart
    else
        v28 = v27
    end
    if not (v26 and (v27 and v28)) then
        return p24:GetPivot()
    end
    local v29 = v28.CFrame
    local v30 = ((v_u_9(v29.YVector, Vector3.new(0, 1, 0), v29.XVector) * v29).Rotation + v29.Position) * CFrame.new(0, -(v27.HipHeight + v28.Size.Y / 2), 0)
    local v31, v32 = v_u_19(p24)
    local v33 = v31:ToObjectSpace(p24:GetPivot())
    return v30 * CFrame.new(0, v32.Y / 2, 0) * v33
end
return v3