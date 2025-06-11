--// ReplicatedStorage.new.modules.PetRigs.CustomPetRig (ModuleScript)

local v1 = require(script.Parent.PetRig)
local v2 = {}
setmetatable(v2, v1)
local function v_u_6(p3, p4)
    for _, v5 in p3:GetDescendants() do
        if v5:IsA("Motor6D") and v5.Part1 == p4 then
            return v5
        end
    end
    return nil
end
local function v_u_11(p7, p8)
    local v9 = v_u_6(p7, p8)
    if not (v9 and v9.Part0) then
        return nil
    end
    local v10 = p8.Name:gsub("_Geo$", "")
    return p7:FindFirstChild("HumanoidRootPart"):FindFirstChild(v10, true) or v_u_11(p7, v9.Part0)
end
local function v_u_20(p12)
    local v13 = p12:FindFirstChild("HumanoidRootPart")
    local v14 = v13:FindFirstChildWhichIsA("Bone").CFrame.Position
    local v15 = 0
    for _, v16 in v13:GetDescendants() do
        if v16:IsA("Bone") then
            local v17 = p12:FindFirstChild(v16.Name .. "_Geo")
            if v17 then
                local v18 = v16.WorldCFrame.Position - v17.CFrame.Position
                local v19 = v16.WorldCFrame.Position - v14 - v17.CFrame.Position
                if v18.Magnitude < v19.Magnitude then
                    v15 = v15 - 1
                else
                    v15 = v15 + 1
                end
            end
        end
    end
    return v15 > 0
end
function v2.should_transform(p21)
    return p21:FindFirstChild("RootPart") ~= nil
end
function v2.validate(p22, p23)
    if p22:FindFirstChild("Torso_Geo") then
        if p23.is_egg or p22:FindFirstChild("Head_Geo") then
            return true, nil
        else
            return false, ("\"Pet model \'%*\' defined by item \'%*\' is missing a Head"):format(p23.model, p23.kind)
        end
    else
        return false, ("\"Pet model \'%*\' defined by item \'%*\' is missing a Torso"):format(p23.model, p23.kind)
    end
end
function v2.transform(p24)
    p24:SetAttribute("RigType", "Custom")
    local v25 = p24:FindFirstChild("RootPart")
    if v25 then
        v25.Name = "HumanoidRootPart"
    else
        v25 = p24:FindFirstChild("HumanoidRootPart")
    end
    local v26 = v25:FindFirstChildWhichIsA("Bone")
    local v27 = v_u_20(p24)
    local v28
    if v27 then
        v28 = v26.CFrame
        v26.CFrame = v26.CFrame - v26.CFrame.Position
    else
        v28 = nil
    end
    local v29 = Instance.new("Folder")
    v29.Name = "MockParts"
    v29.Parent = p24
    for _, v30 in p24:GetChildren() do
        if v30:IsA("BasePart") and v30.Name ~= "HumanoidRootPart" then
            local v31 = v30.Name:gsub("_Geo$", "")
            local v32 = p24:FindFirstChild("HumanoidRootPart"):FindFirstChild(v31, true)
            if v32 then
                ::l11::
                local v33 = CFrame.new(v30.ExtentsCFrame.Position)
                local v34 = Instance.new("Attachment")
                v34.Name = "Origin"
                v34.Parent = v32
                v34.WorldCFrame = v33
                for _, v35 in v30:GetChildren() do
                    if v35:IsA("Attachment") then
                        local v36 = v35.CFrame
                        v35.Parent = v32
                        v35.CFrame = v34.CFrame * v36
                    end
                end
                local v37 = v30:Clone()
                v37:ClearAllChildren()
                v37.Name = v30.Name:gsub("_Geo$", "")
                v37.CanCollide = false
                v37.Transparency = 1
                v37.Massless = true
                local v38 = Instance.new("Attachment")
                v38.Parent = v37
                local v39 = Instance.new("RigidConstraint")
                v39.Attachment0 = v34
                v39.Attachment1 = v38
                v39.Parent = v37
                v37.Parent = v29
            elseif v30:FindFirstChildWhichIsA("Attachment") then
                local v40 = v_u_6(p24, v30)
                local v41
                if v40 and v40.Part0 then
                    local v42 = v30.Name:gsub("_Geo$", "")
                    v41 = p24:FindFirstChild("HumanoidRootPart"):FindFirstChild(v42, true) or v_u_11(p24, v40.Part0)
                else
                    v41 = nil
                end
                if v41 then
                    v32 = Instance.new("Bone")
                    v32.Name = v30.Name:gsub("_Geo$", "")
                    v32.Parent = v41
                    goto l11
                end
            end
        end
    end
    local v43 = p24:FindFirstChild("Humanoid")
    p24:SetAttribute("HipHeight", v43.HipHeight)
    v43:Destroy()
    local v44 = Instance.new("AnimationController")
    v44.Parent = p24
    if not v44:FindFirstChild("Animator") then
        Instance.new("Animator").Parent = v44
    end
    if v27 then
        v26.CFrame = v28
    end
end
function v2.get_part(p45, p46, p47)
    if p47 then
        return p45:WaitForChild("MockParts"):WaitForChild(p46)
    else
        local v48 = p45:FindFirstChild("MockParts")
        if v48 then
            return v48:FindFirstChild(p46)
        else
            return nil
        end
    end
end
function v2.get_geo_part(p49, p50)
    return p49:FindFirstChild((("%*_Geo"):format(p50))) or p49:FindFirstChild(p50)
end
return v2