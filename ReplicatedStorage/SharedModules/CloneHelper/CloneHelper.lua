--// ReplicatedStorage.SharedModules.CloneHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Sift")
return {
    ["clone_and_match"] = function(p_u_2, p3)
        local v4 = p3 or "clone_match_id"
        if not p_u_2.Archivable then
            return nil, {}, true
        end
        local v6 = v_u_1.List.filter(p_u_2:GetDescendants(), function(p5)
            while p5 ~= p_u_2 do
                if not p5.Archivable then
                    return false
                end
                p5 = p5.Parent
            end
            return true
        end)
        local v7 = {}
        for v8, v9 in ipairs(v6) do
            v9:SetAttribute(v4, v8)
        end
        local v10 = p_u_2:Clone()
        v7[p_u_2] = v10
        for _, v11 in ipairs(v10:GetDescendants()) do
            local v12 = v11:GetAttribute(v4)
            local v13 = v6[v12]
            if v13 then
                v7[v13] = v11
                v6[v12] = nil
                v13:SetAttribute(v4, nil)
            end
            v11:SetAttribute(v4, nil)
        end
        local v14 = true
        for _, v15 in pairs(v6) do
            v15:SetAttribute(v4, nil)
            v14 = false
        end
        return v10, v7, v14
    end
}