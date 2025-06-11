--// ReplicatedStorage.SharedModules.Game.ColorableItemHelper (ModuleScript)

return {
    ["apply_vehicle_color"] = function(p1, p2, p3)
        local v4 = p1.category == "transport"
        assert(v4, "Vehicle entry must be a transport")
        for _, v5 in p2:GetDescendants() do
            if v5.Name == "Colorable" or v5:GetAttribute("Colorable") then
                if v5:IsA("BasePart") then
                    v5.Color = p3
                elseif v5:IsA("Trail") then
                    v5.Color = ColorSequence.new(p3)
                end
            end
        end
    end,
    ["apply_holdables_color"] = function(p6, p7, p8)
        local v9 = p6.category
        local v10 = (v9 == "toys" or (v9 == "strollers" or (v9 == "food" or v9 == "gifts"))) and true or v9 == "roleplay"
        assert(v10, "Item entry must be a toy, stroller, food, gift, or roleplay")
        for _, v11 in p7:GetDescendants() do
            if v11.Name == "Colorable" and v11:IsA("BasePart") then
                v11.Color = p8
            end
        end
    end
}