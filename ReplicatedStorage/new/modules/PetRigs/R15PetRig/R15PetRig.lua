--// ReplicatedStorage.new.modules.PetRigs.R15PetRig (ModuleScript)

local v1 = require(script.Parent.PetRig)
local v_u_2 = {}
setmetatable(v_u_2, v1)
function v_u_2.should_transform(p3)
    return p3:FindFirstChild("HumanoidRootPart") ~= nil
end
function v_u_2.validate(p4, p5)
    if p4:FindFirstChild("Torso") then
        if p5.is_egg or p4:FindFirstChild("Head") then
            local v6 = p4:FindFirstChild("HumanoidRootPart")
            local v7
            if v6 then
                v7 = v6:FindFirstChildWhichIsA("Motor6D")
            else
                v7 = nil
            end
            if v7 then
                return true, nil
            else
                return false, ("Pet model \'%*\' defined by item \'%*\' is missing a Motor in its HumanoidRootPart"):format(p5.model, p5.kind)
            end
        else
            return false, ("\"Pet model \'%*\' defined by item \'%*\' is missing a Head"):format(p5.model, p5.kind)
        end
    else
        return false, ("\"Pet model \'%*\' defined by item \'%*\' is missing a Torso"):format(p5.model, p5.kind)
    end
end
function v_u_2.transform(p8)
    p8:SetAttribute("RigType", "R15")
    if not p8:FindFirstChild("WingsAttachment", true) then
        local v9 = Instance.new("Attachment")
        v9.Name = "WingsAttachment"
        v9.Orientation = Vector3.new(-60, 0, 0)
        v9.Parent = p8:FindFirstChild("Torso")
    end
    local v10 = p8:FindFirstChild("Humanoid")
    p8:SetAttribute("HipHeight", v10.HipHeight)
    v10:Destroy()
    local v11 = Instance.new("AnimationController")
    v11.Parent = p8
    if not v11:FindFirstChild("Animator") then
        Instance.new("Animator").Parent = v11
    end
end
function v_u_2.get_part(p12, p13, p14)
    if p14 then
        return p12:WaitForChild(p13)
    else
        return p12:FindFirstChild(p13)
    end
end
function v_u_2.get_geo_part(p15, p16)
    return v_u_2.get_part(p15, p16, false)
end
return v_u_2