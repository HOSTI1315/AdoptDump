--// ReplicatedStorage.ClientModules.Game.ItemModelHelper (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Fsys).load
local v_u_3 = v2("DownloadClient")
local v_u_4 = v2("DisplayStandHelper")
local v_u_5 = v2("KindDB")
local v_u_6 = v2("Utilities")
return {
    ["promise_download_item_model"] = function(p7)
        local v8 = v_u_5[p7]
        local v_u_9 = v8.category
        local v10 = v_u_4.get_item_paths(v8.category, p7, v8)
        return v_u_3.promise_download_copy_many(v10):andThen(function(p11)
            local v12
            if #p11 > 1 then
                v12 = Instance.new("Model")
                for _, v13 in p11 do
                    v13.Parent = v12
                end
            else
                v12 = p11[1]
            end
            if v_u_9 ~= "strollers" and (v_u_9 ~= "toys" and (v_u_9 ~= "food" and v_u_9 ~= "gifts")) then
                if v_u_9 == "pets" then
                    v12 = v12.PetModel
                    v12.PrimaryPart.Anchored = true
                end
                return v12
            end
            local v14 = {}
            local v15 = 0
            for _, v16 in v12:GetDescendants() do
                if v16:IsA("BasePart") then
                    v16.Anchored = true
                    v16.CanCollide = false
                    local v17 = v16.Name
                    if v17 == "RootMount" or (v17 == "UpperTorsoMount" or (v17 == "RightMount" or v17 == "LeftMount")) then
                        v16.Transparency = 1
                        v14[v16.Name] = v16
                        v15 = v15 + 1
                    end
                end
            end
            local v18 = {}
            for v19, v20 in v14 do
                v18[v19] = v20.Parent
                v18[v19].PrimaryPart = v20
            end
            return v12
        end)
    end,
    ["fit_to_bounding_box"] = function(p21, p22, p23, p24)
        local v25 = v_u_5[p21]
        local v26 = p22:GetBoundingBox()
        local v27 = p22.PrimaryPart
        p22.PrimaryPart = nil
        p22.WorldPivot = v26
        p22:PivotTo(p23)
        if v25.category ~= "pet_accessories" and v27 then
            v27:Destroy()
        end
        local v28, v29 = v_u_6.getAlignedBoundingBox(p22, p23)
        local v30 = -p24.Y / 2 + v29.Y / 2
        local v31 = p24.X / v29.X
        local v32 = p24.Y / v29.Y
        local v33 = p24.Z / v29.Z
        local v34 = math.min(1, v31, v32, v33)
        if v34 < 1 then
            p22:ScaleTo(v34)
        end
        p22.WorldPivot = v28
        p22:PivotTo(p23 * CFrame.new(0, v30, 0))
    end
}