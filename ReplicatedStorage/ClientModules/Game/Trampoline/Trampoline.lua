--// ReplicatedStorage.ClientModules.Game.Trampoline (ModuleScript)

local v_u_1 = {}
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v2("ClientData")
local v_u_4 = v2("CharWrapperClient")
v2("Debug").create_log()
local v_u_5 = {}
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("CollectionService")
local function v_u_14(p8)
    local v9 = Instance.new("Configuration")
    for v10, v11 in pairs(p8) do
        if typeof(v11) == "number" then
            local v12 = Instance.new("NumberValue")
            v12.Name = v10
            v12.Value = v11
            v12.Parent = v9
        elseif typeof(v11) == "boolean" then
            local v13 = Instance.new("BoolValue")
            v13.Name = v10
            v13.Value = v11
            v13.Parent = v9
        else
            error("Unsupported config type")
        end
    end
    return v9
end
local function v_u_18(p15)
    local v16 = {}
    for _, v17 in pairs(p15:GetChildren()) do
        v16[v17.Name] = v17.Value
    end
    return v16
end
local function v_u_24(p19)
    local v20 = v_u_7:GetTagged("TrampolinePart")
    local v21 = {}
    for _, v22 in pairs(v20) do
        local v23 = (p19.Position - v22.Position).Magnitude < 500
        if p19 ~= v22 and v23 then
            table.insert(v21, v22)
        end
    end
    return v21
end
local function v_u_37(p25, p26, p27, p28, p29)
    if not p26:IsDescendantOf(workspace) then
        return false
    end
    local v30 = p26.Size.Z / 1.8
    local v31
    if p29 then
        v31 = p26.CFrame:PointToObjectSpace(p25.Position).Y
    else
        v31 = p25.Position.Y - p26.Position.Y
    end
    local v32 = v31 < p27
    if p28 then
        if v32 then
            v32 = p28 < v31
        end
    end
    local v33 = p25.Position.X
    local v34 = p25.position.Z
    local v35 = p26.Position.X
    local v36 = p26.Position.Z
    return v32 and (v33 - v35) ^ 2 + (v34 - v36) ^ 2 < v30 ^ 2
end
local function v_u_58(p38, p_u_39)
    if v_u_5[p_u_39] then
        v_u_5[p_u_39]:Disconnect()
        v_u_5[p_u_39] = nil
    end
    local v_u_40 = p38
    local v_u_41 = v_u_24(v_u_40)
    local v_u_42 = true
    local v_u_43 = tick()
    v_u_5[p_u_39] = v_u_6.Stepped:connect(function()
        if not (p_u_39 and p_u_39.Parent) then
            local v44 = p_u_39
            if v_u_5[v44] then
                v_u_5[v44]:Disconnect()
                v_u_5[v44] = nil
            end
            return
        end
        local v45 = v_u_40.Parent and v_u_18(v_u_40.trampoline_vars) or {}
        local v46 = v45.upwards_velocity
        local v47 = v45.time_length
        local v48 = v45.upper_height_cutoff
        local v49 = v45.lower_height_cutoff
        local v50 = v45.respect_trampoline_orientation
        if v_u_42 then
            if v47 < tick() - v_u_43 then
                v_u_42 = false
            else
                local v51 = p_u_39
                local v52 = p_u_39.Velocity.X
                local v53 = p_u_39.Velocity.Z
                v51.Velocity = Vector3.new(v52, v46, v53)
            end
        end
        local v54 = false
        local v55 = v_u_37(p_u_39, v_u_40, v48, v49, v50)
        if v55 then
            v54 = true
            v_u_42 = true
            v_u_43 = tick()
        elseif not v55 then
            for _, v56 in pairs(v_u_41) do
                if v_u_37(p_u_39, v56, v48, v49, v50) then
                    v_u_40 = v56
                    v_u_41 = v_u_24(v_u_40)
                    v54 = true
                    v_u_42 = true
                    v_u_43 = tick()
                    break
                end
            end
        end
        if not v54 and tick() - v_u_43 > 4 then
            local v57 = p_u_39
            if v_u_5[v57] then
                v_u_5[v57]:Disconnect()
                v_u_5[v57] = nil
            end
        end
    end)
end
function v_u_1.jump(p59, p60)
    if p60.Parent then
        if p60.Name == "Ball" or p60.Anchored then
            return
        else
            if p60.Parent:IsA("Model") then
                p60 = p60:GetRootPart() or p60
            end
            if v_u_5[p60] == nil then
                v_u_58(p59, p60)
            end
        end
    else
        return
    end
end
function v_u_1.has_ownership(p61)
    if p61:IsDescendantOf(workspace.Vehicles) then
        return p61:IsDescendantOf((v_u_3.get("vehicle")))
    end
    if p61:IsDescendantOf(workspace.Pets) then
        local v62 = nil
        for _, v63 in pairs(workspace.Pets:GetChildren()) do
            if p61:IsDescendantOf(v63) then
                v62 = v63
            end
        end
        if v62 ~= nil then
            local v64 = v_u_4.get(v62)
            if v64 and v64.controller == game.Players.LocalPlayer then
                return true
            end
        end
    elseif p61:IsDescendantOf(workspace.PetObjects) then
        local v65 = p61.Parent:FindFirstChild("OwnerPlayer")
        if v65 then
            v65 = v65.Value
        end
        if v65 == game.Players.LocalPlayer then
            return true
        end
    elseif p61:IsDescendantOf(game.Players.LocalPlayer.Character) then
        return true
    end
end
function v_u_1.hook_up_trampoline(p_u_66, p_u_67)
    if p_u_66:FindFirstChild("trampoline_vars") then
        p_u_66.trampoline_vars:Destroy()
    end
    local v68 = v_u_14(p_u_67 or {})
    v68.Name = "trampoline_vars"
    v68.Parent = p_u_66
    v_u_7:AddTag(p_u_66, "TrampolinePart")
    p_u_66.Touched:connect(function(p69)
        if v_u_1.has_ownership(p69) and (p69.Anchored == false and v_u_37(p69, p_u_66, p_u_67.upper_height_cutoff, p_u_67.lower_height_cutoff, p_u_67.respect_trampoline_orientation)) then
            v_u_1.jump(p_u_66, p69)
        end
    end)
end
return v_u_1