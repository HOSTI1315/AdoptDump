--// ReplicatedStorage.SharedModules.ResizeM (ModuleScript)

local v1 = {}
local v_u_2 = {
    [Enum.PartType.Block] = Enum.MeshType.Brick,
    [Enum.PartType.Ball] = Enum.MeshType.Sphere,
    [Enum.PartType.Cylinder] = Enum.MeshType.Cylinder
}
local function v_u_8(p3, p4)
    local v5 = {}
    for v6, v7 in ipairs(p3.Keypoints) do
        v5[v6] = NumberSequenceKeypoint.new(v7.Time, v7.Value * p4, v7.Envelope * p4)
    end
    return NumberSequence.new(v5)
end
local function v_u_22(p9, p10, p11)
    if p9:IsA("BasePart") then
        p9.Position = p11 + (p9.Position - p11) * p10
        local v12 = p9.Size * p10
        p9.Size = v12
        local v13 = p9:FindFirstChildOfClass("FileMesh") or p9:FindFirstChildOfClass("SpecialMesh")
        if v13 and (v13.ClassName == "FileMesh" or v13.MeshType == Enum.MeshType.FileMesh) then
            v13.Scale = v13.Scale * p10
            v13.Offset = v13.Offset * p10
            return
        end
        local v14 = v12 / p9.Size
        if v14.X ~= 1 or (v14.Y ~= 1 or v14.Z ~= 1) then
            local v15 = p9:FindFirstChildWhichIsA("DataModelMesh")
            if v15 == nil then
                if p9:IsA("Part") then
                    local v16 = v_u_2[p9.Shape]
                    if v16 then
                        v15 = Instance.new("SpecialMesh")
                        v15.MeshType = v16
                    end
                elseif p9:IsA("WedgePart") then
                    v15 = Instance.new("WedgePart")
                    v15.MeshType = Enum.MeshType.Wedge
                end
            end
            if v15 then
                v15.Scale = v15.Scale * v14
                return
            end
        end
    else
        if p9:IsA("Attachment") then
            p9.Position = p9.Position * p10
            return
        end
        if p9:IsA("JointInstance") then
            p9.C0 = p9.C0 + p9.C0.p * (p10 - 1)
            p9.C1 = p9.C1 + p9.C1.p * (p10 - 1)
            return
        end
        if p9:IsA("Texture") then
            p9.StudsPerTileU = p9.StudsPerTileU * p10
            p9.StudsPerTileV = p9.StudsPerTileV * p10
            p9.OffsetStudsU = p9.OffsetStudsU * p10
            p9.OffsetStudsV = p9.OffsetStudsV * p10
            return
        end
        if p9:IsA("SurfaceGui") then
            p9.PixelsPerStud = p9.PixelsPerStud / p10
            return
        end
        if p9:IsA("BillboardGui") or p9:IsA("GuiObject") then
            local v17 = p9.Size
            local v18 = v17.X.Scale
            local v19 = v17.X.Offset
            local v20 = v17.Y.Scale
            local v21 = v17.Y.Offset
            p9.Size = UDim2.new(v18, v19 * p10, v20, v21 * p10)
            return
        end
        if p9:IsA("ParticleEmitter") then
            p9.Size = v_u_8(p9.Size, p10)
            p9.Speed = NumberRange.new(p9.Speed.Min * p10, p9.Speed.Max * p10)
            p9.Acceleration = p9.Acceleration * p10
            return
        end
        if p9:IsA("Beam") then
            p9.Width0 = p9.Width0 * p10
            p9.Width1 = p9.Width1 * p10
            p9.CurveSize0 = p9.CurveSize0 * p10
            p9.CurveSize1 = p9.CurveSize1 * p10
            p9.TextureLength = p9.TextureLength * p10
            p9.TextureSpeed = p9.TextureSpeed * p10
        end
    end
end
function v1.scale_legacy(p23, p24, p25)
    local v26 = p24 > 0
    assert(v26, "Scale must be positive.")
    v_u_22(p23, p24, p25)
    for _, v27 in ipairs(p23:GetDescendants()) do
        if not v27:IsA("ParticleEmitter") then
            v_u_22(v27, p24, p25)
        end
    end
end
function v1.scale(p28, p29, p30)
    local v31 = p29 > 0
    assert(v31, "Scale must be positive.")
    v_u_22(p28, p29, p30)
    for _, v32 in ipairs(p28:GetDescendants()) do
        v_u_22(v32, p29, p30)
    end
end
return v1