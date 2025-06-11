--// ReplicatedStorage.ClientServices.SyncedObjectRenderingClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
v1("RouterClient")
local v_u_2 = v1("SimpleEvents")
local v_u_3 = game:GetService("RunService")
game:GetService("ReplicatedStorage")
local v_u_4 = workspace.SyncedAreas:WaitForChild("SyncedAreasReferencePart")
local v_u_5 = nil
local function v_u_9(p6)
    for _, v7 in p6:GetDescendants() do
        if v7:IsA("BasePart") then
            local v8 = v7:GetAttribute("OriginalTransparency")
            v7.Transparency = v8 == nil and 0 or v8
        end
    end
end
local function v_u_23(p10, p11)
    local v_u_12 = p10:WaitForChild((p10:GetAttribute("SyncedObjectPrimaryPartName")))
    local v_u_13 = p10:Clone()
    v_u_13.PrimaryPart.CFrame = v_u_5.CFrame:ToObjectSpace(v_u_12.CFrame)
    v_u_9(v_u_13)
    local v_u_14 = Instance.new("Attachment")
    v_u_14.Name = "SyncedObjectServerAttachment"
    v_u_14.CFrame = v_u_5.CFrame:ToObjectSpace(v_u_12.CFrame)
    v_u_14.Parent = v_u_5
    local v_u_15 = 0
    local v_u_16 = 0
    local v_u_22 = v_u_3.PostSimulation:Connect(function(p17)
        local v18 = v_u_13.PrimaryPart
        local v19 = (v_u_14.Position - v18.Position).magnitude / 3.75
        v_u_16 = math.min(1, v19)
        local v20 = p17 * 2
        if v_u_16 >= 1 then
            v_u_15 = v_u_15 + p17
            if v_u_15 > 1 then
                v_u_15 = 0
                v20 = 1
            end
        else
            v_u_15 = 0
        end
        v18:PivotTo(v18.CFrame:Lerp(v_u_14.CFrame, v20))
        v18.AssemblyLinearVelocity = v18.AssemblyLinearVelocity:Lerp(v_u_12.AssemblyLinearVelocity, v20)
        v18.AssemblyAngularVelocity = v18.AssemblyAngularVelocity:Lerp(v_u_12.AssemblyAngularVelocity, v20)
        local v21 = v_u_12
        v_u_14.CFrame = v_u_5.CFrame:ToObjectSpace(v21.CFrame)
    end)
    p10.Destroying:Connect(function()
        v_u_22:Disconnect()
        v_u_14:Destroy()
        v_u_13:Destroy()
    end)
    v_u_13.Parent = p11
end
return {
    ["init"] = function()
        if workspace.SyncedAreas then
            v_u_5 = v_u_4:Clone()
            v_u_5.Name = "SyncedAreasReferencePartClient"
            v_u_5.Parent = workspace.SyncedAreas
            v_u_2.get("ChildAddedPlusExisting", workspace.SyncedAreas):connect(function(p_u_24)
                if p_u_24:IsA("Folder") then
                    v_u_2.get("ChildAddedPlusExisting", p_u_24):connect(function(p25)
                        if p25:IsA("Folder") and p25.Name == "SyncedObjects" then
                            local v_u_26 = Instance.new("Folder")
                            v_u_26.Name = "SyncedObjectsClient"
                            v_u_26.Parent = p_u_24
                            v_u_2.get("ChildAddedPlusExisting", p25):connect(function(p27)
                                v_u_23(p27, v_u_26)
                            end)
                        end
                    end)
                end
            end)
        end
    end
}