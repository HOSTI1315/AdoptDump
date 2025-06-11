--// ReplicatedStorage.new.modules.RaycastHelper (ModuleScript)

local v1 = {}
local function v_u_10(p2)
    local v_u_3 = table.clone(p2.FilterDescendantsInstances)
    p2.FilterType = Enum.RaycastFilterType.Exclude
    p2.FilterDescendantsInstances = {}
    local function v_u_4()
        -- failed to decompile
    end
    return function(p5)
        local v6 = p5.Instance
        local v7 = workspace.IsDescendantOf
        for _, v8 in v_u_3 do
            if v6 == v8 or v7(v6, v8) then
                v9 = true
                ::l5::
                if v9 then
                    return nil
                else
                    return v_u_4(v6)
                end
            end
        end
        local v9 = false
        goto l5
    end
end
local function v_u_24(p11, p12)
    local v13 = p11.callback
    local v14 = p11.world_root or workspace
    local v15 = RaycastParams.new()
    v15.FilterDescendantsInstances = p11.instances or {}
    v15.FilterType = p11.filter_type or Enum.RaycastFilterType.Exclude
    v15.IgnoreWater = p11.ignore_water or false
    v15.CollisionGroup = p11.collision_group or "Default"
    v15.RespectCanCollide = p11.respect_can_collide or false
    if not v13 then
        return p12(v14, v15)
    end
    local v_u_16 = false
    local function v17()
        v_u_16 = true
    end
    local v18
    if v15.FilterType == Enum.RaycastFilterType.Include then
        v18 = v_u_10(v15)
    else
        v18 = nil
    end
    local v19 = v_u_16
    local v20 = nil
    while true do
        local v21 = p12(v14, v15)
        if not v21 then
            v21 = v20
            break
        end
        local v22
        if v18 then
            v22 = v18(v21)
        else
            v22 = nil
        end
        local v23
        if v22 then
            v23 = false
        else
            v23 = v13(v21, v17)
            v22 = v21.Instance
        end
        if v19 then
            v21 = v20
            break
        end
        if v23 then
            break
        end
        v15:AddToFilter(v22)
    end
    return v21
end
function v1.cast_ray(p_u_25)
    return v_u_24(p_u_25, function(p26, p27)
        return workspace.Raycast(p26, p_u_25.origin, p_u_25.direction, p27)
    end)
end
function v1.cast_block(p_u_28)
    return v_u_24(p_u_28, function(p29, p30)
        return workspace.Blockcast(p29, p_u_28.origin, p_u_28.size, p_u_28.direction, p30)
    end)
end
function v1.cast_sphere(p_u_31)
    return v_u_24(p_u_31, function(p32, p33)
        return workspace.Spherecast(p32, p_u_31.origin, p_u_31.radius, p_u_31.direction, p33)
    end)
end
return v1