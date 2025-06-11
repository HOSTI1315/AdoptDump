--// ReplicatedStorage.new.modules.PickupEntities.PickupEntityService (ModuleScript)

local v_u_1 = require(script.Parent.Parent.LegacyLoad)("PickupEntity")
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_3 = game:GetService("RunService")
local v4 = {}
local v_u_5 = {}
local v_u_6 = {}
function get_oriented_bounding_box_from_parts(p7)
    local v8 = #p7
    if v8 ~= 0 then
        local v9 = Vector3.new(0, 0, 0)
        local v10 = Vector3.new(0, 0, 0)
        local v11 = Vector3.new(0, 0, 0)
        local v12 = Vector3.new(0, 0, 0)
        for _, v13 in p7 do
            v9 = v9 + v13.Position
            v10 = v10 + v13.CFrame.XVector
            v11 = v11 + v13.CFrame.YVector
            v12 = v12 + v13.CFrame.ZVector
        end
        local v14 = v9 / v8
        local v15 = v10.Unit
        local v16 = v11.Unit
        local _ = v12.Unit
        local v17 = v15.Unit
        local v18 = (v16 - v17 * v17:Dot(v16)).Unit
        local v19 = v17:Cross(v18).Unit
        local v20 = CFrame.fromMatrix(v14, v17, v18, v19)
        local v21 = Vector3.new(inf, inf, inf)
        local v22 = Vector3.new(-inf, -inf, -inf)
        for _, v23 in ipairs(p7) do
            local v24 = v23.CFrame
            local v25 = v23.Size
            for _, v26 in { -0.5, 0.5 } do
                for _, v27 in { -0.5, 0.5 } do
                    for _, v28 in { -0.5, 0.5 } do
                        local v29 = v26 * v25.X
                        local v30 = v27 * v25.Y
                        local v31 = v28 * v25.Z
                        local v32 = v24 * Vector3.new(v29, v30, v31)
                        local v33 = v20:Inverse() * v32
                        local v34 = v21.X
                        local v35 = v33.X
                        local v36 = math.min(v34, v35)
                        local v37 = v21.Y
                        local v38 = v33.Y
                        local v39 = math.min(v37, v38)
                        local v40 = v21.Z
                        local v41 = v33.Z
                        local v42 = math.min(v40, v41)
                        v21 = Vector3.new(v36, v39, v42)
                        local v43 = v22.X
                        local v44 = v33.X
                        local v45 = math.max(v43, v44)
                        local v46 = v22.Y
                        local v47 = v33.Y
                        local v48 = math.max(v46, v47)
                        local v49 = v22.Z
                        local v50 = v33.Z
                        local v51 = math.max(v49, v50)
                        v22 = Vector3.new(v45, v48, v51)
                    end
                end
            end
        end
        local v52 = v22 - v21
        local v53 = (v21 + v22) * 0.5
        return v20 * CFrame.new(v53), v52
    end
end
function v4.start()
    v_u_3.Heartbeat:Connect(function()
        for _, v54 in v_u_5 do
            v54:update()
        end
        local v55 = game.Players.LocalPlayer
        if v55 then
            v55 = v55.Character
        end
        local v56
        if v55 then
            v56 = v55:FindFirstChild("UpperTorso")
        else
            v56 = v55
        end
        local v57
        if v55 then
            v57 = v55:FindFirstChild("RightUpperLeg")
        else
            v57 = v55
        end
        local v58
        if v55 then
            v58 = v55:FindFirstChild("LeftUpperLeg")
        else
            v58 = v55
        end
        local v59
        if v55 then
            v59 = v55:FindFirstChild("LeftFoot")
        else
            v59 = v55
        end
        if v55 then
            v55 = v55:FindFirstChild("RightFoot")
        end
        if v56 and (v57 and (v58 and (v59 and v55))) then
            local v60 = OverlapParams.new()
            v60.FilterType = Enum.RaycastFilterType.Include
            v60:AddToFilter(v_u_6)
            local v61, v62 = get_oriented_bounding_box_from_parts({
                v56,
                v57,
                v58,
                v55,
                v59
            })
            for _, v63 in workspace:GetPartBoundsInBox(v61, v62, v60) do
                local v64 = v_u_5[v63]
                if v64 then
                    v64:touched()
                end
            end
        end
    end)
end
function v4.create_pickup_entity(p65)
    local v66 = v_u_1.new(p65)
    local v_u_67 = v66.collider
    v_u_5[v_u_67] = v66
    local v68 = v_u_6
    table.insert(v68, v_u_67)
    v_u_2.fromEvent(v66.on_destroy):andThen(function()
        v_u_5[v_u_67] = nil
    end)
    return v66
end
function v4.cleanup()
    for _, v69 in v_u_5 do
        v69:destroy()
    end
    v_u_5 = {}
    v_u_6 = {}
end
return v4