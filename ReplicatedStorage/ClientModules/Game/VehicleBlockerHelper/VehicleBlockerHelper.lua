--// ReplicatedStorage.ClientModules.Game.VehicleBlockerHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("Raycast")
local v3 = v_u_1("Signal")
local v_u_4 = v_u_1("package:Sift")
local v_u_5 = game:GetService("CollectionService")
local v_u_6 = {}
local v_u_7 = true
local v_u_8 = true
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = v3.new()
local function v_u_19()
    for _, v13 in v_u_10 do
        local v14
        if v_u_5:HasTag(v13, "DoorBlocker") then
            v14 = v_u_7
        else
            v14 = v_u_8
        end
        v13.CanCollide = v14
    end
    for _, v15 in v_u_11 do
        local v16
        if v_u_5:HasTag(v15, "DoorBlocker") then
            v16 = v_u_7
        else
            v16 = v_u_8
        end
        v15.CanCollide = v16
    end
    for _, v17 in v_u_9 do
        local v18
        if v_u_5:HasTag(v17, "DoorBlocker") then
            v18 = v_u_7
        else
            v18 = v_u_8
        end
        v17.CanCollide = v18
    end
end
local function v_u_22()
    local v_u_20 = v_u_1("InteriorsM").get_current_location()
    if v_u_20 then
        v_u_20 = v_u_20.interior
    end
    return not v_u_20 and {} or v_u_4.List.filter(v_u_5:GetTagged("InteriorSpecificVehicleBlocker"), function(p21)
        return p21:IsDescendantOf(v_u_20)
    end)
end
local function v_u_26()
    for _, v23 in pairs(v_u_10) do
        v23.CanCollide = false
    end
    v_u_10 = v_u_22()
    for _, v24 in pairs(v_u_10) do
        local v25
        if v_u_5:HasTag(v24, "DoorBlocker") then
            v25 = v_u_7
        else
            v25 = v_u_8
        end
        v24.CanCollide = v25
    end
end
local function v_u_29()
    local v_u_27 = workspace:FindFirstChild("HouseExteriors")
    return not v_u_27 and {} or v_u_4.List.filter(v_u_5:GetTagged("HouseExteriorVehicleBlocker"), function(p28)
        return p28:IsDescendantOf(v_u_27)
    end)
end
local function v_u_38(p30, p31)
    local v32 = p30.CFrame
    local v33 = p30.Size
    local v34 = CFrame.fromMatrix(v32.Position, v32.XVector / v33.X, v32.YVector / v33.Y, v32.ZVector / v33.Z):Inverse() * p31
    if p30:IsA("Part") and p30.Shape.Name == "Cylinder" then
        return v34.Z * v34.Z + v34.Y * v34.Y <= 0.25
    end
    local v35 = v34.X
    local v36
    if math.abs(v35) <= 0.5 then
        local v37 = v34.Z
        v36 = math.abs(v37) <= 0.5
    else
        v36 = false
    end
    return v36
end
function v_u_6.is_point_in_vehicle_blocker(p39)
    for _, v40 in v_u_11 do
        if v_u_38(v40, p39) then
            return true
        end
    end
    for _, v41 in pairs(v_u_10) do
        if v_u_38(v41, p39) then
            return true
        end
    end
    for _, v42 in pairs(v_u_9) do
        if v_u_38(v42, p39) then
            return true
        end
    end
    return false
end
function v_u_6.is_part_colliding_with_vehicle_blocker(p43)
    local v44 = OverlapParams.new()
    v44.CollisionGroup = "vehicle_blockers"
    v44.MaxParts = 1
    return #workspace:GetPartsInPart(p43, v44) > 0
end
function v_u_6.is_near_vehicle_blocker()
    local v45 = game.Players.LocalPlayer.Character
    if v45 then
        v45 = v45:FindFirstChild("HumanoidRootPart")
    end
    if v45 then
        return v_u_6.is_point_in_vehicle_blocker(v45.Position)
    else
        return false
    end
end
function v_u_6.has_room_for_train()
    local v46 = game.Players.LocalPlayer.Character
    if v46 then
        v46 = v46:FindFirstChild("HumanoidRootPart")
    end
    if not v46 then
        return false
    end
    local v47 = CFrame.new(v46.Position, v46.Position + v46.CFrame.LookVector * Vector3.new(1, 0, 1))
    local v48 = {
        Ray.new(v47 * Vector3.new(-2.5, 0, 0), -v47.LookVector * 55),
        Ray.new(v47 * Vector3.new(-2.5, 0, 0), -v47.LookVector * 55),
        Ray.new(v47 * Vector3.new(-2.5, 0, 0), v47.LookVector * 20),
        Ray.new(v47 * Vector3.new(-2.5, 0, 0), v47.LookVector * 20)
    }
    for _, v49 in ipairs(v48) do
        local v50, v51 = v_u_2.FindPartOnRay(v49, nil, nil, {
            ["ignore_non_cancollide"] = true
        })
        if v50 or v_u_6.is_point_in_vehicle_blocker(v51) then
            return false
        end
    end
    return true
end
function v_u_6.set_door_blockers_enabled(p52)
    v_u_7 = p52
    v_u_19()
end
function v_u_6.set_general_blockers_enabled(p53)
    v_u_8 = p53
    v_u_19()
end
function v_u_6.mark_house_exteriors_changed()
    v_u_12:Fire()
end
function v_u_6.init()
    v_u_9 = workspace:WaitForChild("StaticVehicleBlockers"):GetChildren()
    task.spawn(function()
        for _, v54 in v_u_11 do
            v54.CanCollide = false
        end
        v_u_11 = v_u_29()
        for _, v55 in v_u_11 do
            local v56
            if v_u_5:HasTag(v55, "DoorBlocker") then
                v56 = v_u_7
            else
                v56 = v_u_8
            end
            v55.CanCollide = v56
        end
        v_u_12:Connect(function()
            for _, v57 in v_u_11 do
                v57.CanCollide = false
            end
            v_u_11 = v_u_29()
            for _, v58 in v_u_11 do
                local v59
                if v_u_5:HasTag(v58, "DoorBlocker") then
                    v59 = v_u_7
                else
                    v59 = v_u_8
                end
                v58.CanCollide = v59
            end
        end)
        v_u_26()
        v_u_1("InteriorsM").on_location_changed:Connect(function()
            v_u_26()
        end)
    end)
end
return v_u_6