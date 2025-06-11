--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureBounds (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Sift")
local v_u_2 = require(game.ReplicatedStorage.new.modules.AABBHelper)
local v_u_3 = game:GetService("CollectionService")
local v4 = {}
local function v_u_12(p5, p_u_6)
    local v_u_7 = p5.PlacementBlock
    local v_u_8 = p5:FindFirstChild("PlacementTops")
    local v_u_9 = p5:FindFirstChild("SnapSurfaces")
    return v_u_1.List.filter(p5:GetDescendants(), function(p10)
        if v_u_8 and p10:IsDescendantOf(v_u_8) or v_u_9 and p10:IsDescendantOf(v_u_9) then
            return false
        end
        local v11 = p10:IsA("BasePart")
        if v11 then
            if p10 == v_u_7 then
                v11 = false
            else
                v11 = not v_u_3:HasTag(p10, "FurnitureSelectionBounds")
            end
        end
        if not p_u_6 and v11 then
            v11 = p10.Transparency < 1 and true or p10:GetAttribute("HiddenBoundPart")
        end
        return v11
    end)
end
function v4.get_furniture_selection_cframe_size(p13, p14, p15)
    local v16 = {}
    for _, v17 in p15 do
        local v18 = v17.PlacementBlock
        local v19 = v_u_12(v17, p14)
        local v20, v21 = v_u_2.get_max_min(v18.CFrame, v19)
        local v22 = v18.Size.X / 2
        local v23 = v18.Size.Z / 2
        local v24 = v20.X
        local v25 = math.max(v24, v22)
        local v26 = v20.Y
        local v27 = v20.Z
        local v28 = math.max(v27, v23)
        local v29 = Vector3.new(v25, v26, v28)
        local v30 = v21.X
        local v31 = -v22
        local v32 = math.min(v30, v31)
        local v33 = v21.Y
        local v34 = v21.Z
        local v35 = -v23
        local v36 = math.min(v34, v35)
        local v37 = Vector3.new(v32, v33, v36)
        local v38 = {
            ["CFrame"] = v18.CFrame * CFrame.new((v29 + v37) / 2),
            ["Size"] = v29 - v37
        }
        table.insert(v16, v38)
    end
    return v_u_2.get_bounding_box(p13, v16)
end
function v4.get_furniture_multi_select_cframe_size(p39, p40, p41)
    local v42 = {}
    for _, v43 in p41 do
        local v44 = v43.PlacementBlock
        local v45 = v_u_12(v43, p40)
        local v46, v47 = v_u_2.get_max_min(v44.CFrame, v45)
        local v48 = {
            ["CFrame"] = v44.CFrame * CFrame.new((v46 + v47) / 2),
            ["Size"] = v46 - v47
        }
        table.insert(v42, v48)
    end
    return v_u_2.get_bounding_box(p39, v42)
end
function v4.create_selection_box(p49, p50, p51, p52, p53)
    local v54 = Instance.new("Part")
    local v55 = p53 / 2
    v54.Size = p51 - Vector3.new(0, v55, 0)
    v54.CFrame = p50 * CFrame.new(0, p53 / 2, 0)
    v54.Transparency = 1
    v54.CanCollide = false
    v54.CanTouch = false
    v54.CanQuery = false
    v54.Massless = true
    v54.Anchored = true
    v54.Parent = p49
    local v56 = Instance.new("SelectionBox")
    v56.Color3 = p52
    v56.LineThickness = p53
    v56.SurfaceTransparency = 1
    v56.Adornee = v54
    v56.Parent = v54
    v_u_3:AddTag(v54, "FurnitureSelectionBounds")
    return v54
end
return v4