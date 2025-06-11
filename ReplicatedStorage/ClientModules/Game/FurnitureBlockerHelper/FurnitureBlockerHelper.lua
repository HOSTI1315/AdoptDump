--// ReplicatedStorage.ClientModules.Game.FurnitureBlockerHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("package:Sift")
local v_u_3 = game:GetService("CollectionService")
local v4 = {}
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = {}
local function v_u_10()
    local v_u_8 = v_u_1("InteriorsM").get_current_location()
    if v_u_8 then
        v_u_8 = v_u_8.interior
    end
    return not v_u_8 and {} or v_u_2.List.filter(v_u_3:GetTagged("InteriorSpecificFurnitureBlocker"), function(p9)
        return p9:IsDescendantOf(v_u_8)
    end)
end
local function v_u_16(p11, p12)
    local v_u_13 = Instance.new("Part")
    v_u_13.Name = "FurnitureBlocker"
    v_u_13.Shape = Enum.PartType.Ball
    v_u_13.Transparency = 1
    v_u_13.Anchored = true
    v_u_13.CanCollide = false
    v_u_13.CanTouch = false
    v_u_13.CanQuery = true
    v_u_13.CFrame = CFrame.new(p11.part.Position)
    v_u_13.Size = Vector3.new(1, 1, 1) * p12 * 2
    v_u_13.CollisionGroup = "query_non_default"
    v_u_3:AddTag(v_u_13, "DynamicFurnitureBlocker")
    local v14 = workspace:FindFirstChild("FurnitureBlockers")
    if not v14 then
        v14 = Instance.new("Folder")
        v14.Name = "FurnitureBlockers"
        v14.Parent = workspace
    end
    v_u_13.Parent = v14
    local v_u_15 = nil
    v_u_15 = p11.destroyed:Connect(function()
        v_u_15:Disconnect()
        v_u_13:Destroy()
    end)
end
function v4.protect_critical_interaction(p17)
    v_u_16(p17, 6)
end
function v4.protect_interaction(p18)
    v_u_16(p18, 2)
end
function v4.is_part_colliding_with_furniture_blocker(p19)
    local v20 = OverlapParams.new()
    v20.FilterType = Enum.RaycastFilterType.Include
    local v21 = v_u_3:GetTagged("DynamicFurnitureBlocker")
    v20.FilterDescendantsInstances = v_u_2.List.concat(v_u_7, v21)
    v20.MaxParts = 1
    return #workspace:GetPartsInPart(p19, v20) > 0
end
function v4.init()
    if workspace:FindFirstChild("StaticFurnitureBlockers") then
        v_u_5 = workspace.StaticFurnitureBlockers:GetChildren()
    end
    task.spawn(function()
        v_u_6 = v_u_10()
        v_u_7 = v_u_2.List.concat(v_u_5, v_u_6)
        v_u_1("InteriorsM").on_location_changed:Connect(function()
            v_u_6 = v_u_10()
            v_u_7 = v_u_2.List.concat(v_u_5, v_u_6)
        end)
    end)
end
return v4