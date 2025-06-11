--// ReplicatedStorage.SharedModules.Raycast (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("TableUtil")
local v_u_31 = {
    ["FindPartOnRay"] = function(p2, p3, p4, p5)
        local v6 = p5 or {}
        local v7 = v6.ignore_non_cancollide
        local v8 = v7 == nil and true or v7
        local v9 = v6.ignore_transparent
        local v10 = v9 == nil and true or v9
        local v11 = v6.ignore_function
        local v12 = typeof(p3) ~= "table" and (typeof(p3) == "Instance" and { p3 } or {}) or p3
        local v13 = typeof(p4) ~= "table" and typeof(p4) == "Instance" and { p4 } or p4
        local v14, v15, v16, v17
        if v13 then
            v14, v15, v16, v17 = game.Workspace:FindPartOnRayWithWhitelist(p2, v13, false, v6.ignore_water)
        else
            v14, v15, v16, v17 = game.Workspace:FindPartOnRayWithIgnoreList(p2, v12, false, v6.ignore_water)
        end
        if not v14 then
            return v14, v15, v16, v17
        end
        if (not v8 or v14.CanCollide ~= false) and ((not v10 or v14.Transparency ~= 1) and not (v11 and v11(v14, v15, v16, v17))) then
            return v14, v15, v16, v17
        end
        if v13 then
            v13 = v_u_1.deep_copy(v13)
            local v18 = false
            for v19, v20 in pairs(v13) do
                if v20 == v14 then
                    table.remove(v13, v19)
                    v18 = true
                    break
                end
            end
            if not v18 then
                error("Could not find part to remove from whitelist table. Aborting in order to avoid infinite recursion.")
            end
        else
            table.insert(v12, v14)
        end
        return v_u_31.FindPartOnRay(p2, v12, v13, v6)
    end,
    ["mousecast"] = function(p21, p22, p23, p24, p25)
        local v26 = game.Players.LocalPlayer:GetMouse()
        local v27 = p22 or v26.X
        local v28 = p23 or v26.Y
        local v29 = workspace.CurrentCamera:ScreenPointToRay(v27, v28)
        local v30 = Ray.new(v29.Origin, v29.Direction.unit * 1000)
        return v_u_31.FindPartOnRay(v30, p21, p24, p25)
    end
}
return v_u_31