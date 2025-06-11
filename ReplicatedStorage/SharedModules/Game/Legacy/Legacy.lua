--// ReplicatedStorage.SharedModules.Game.Legacy (ModuleScript)

return {
    ["physical_item_to_path"] = function(p1)
        if p1:IsDescendantOf(workspace:WaitForChild("Interiors")) then
            local v2 = {}
            while p1 ~= workspace.Interiors do
                local v3 = p1.Name
                table.insert(v2, 1, v3)
                p1 = p1.Parent
            end
            return v2
        end
        warn("[Legacy.physical_item_to_path] Error: Physical item is not descesndant of workspace.Interiors")
    end,
    ["server_physical_item_to_path"] = function(p4)
        if p4:IsDescendantOf(game.ServerStorage.Downloadable.Interiors) then
            local v5 = {}
            while p4 ~= game.ServerStorage.Downloadable.Interiors do
                local v6 = p4.Name
                table.insert(v5, 1, v6)
                p4 = p4.Parent
            end
            return v5
        end
        warn("[Legacy.physical_item_to_path] Error: Physical item is not descesndant of game.ServerStorage.Downloadable.Interiors")
    end,
    ["path_to_physical_item"] = function(p7)
        local v8 = game.ServerStorage.Downloadable.Interiors
        for _, v9 in pairs(p7) do
            v8 = v8[v9]
        end
        return v8
    end,
    ["path_to_client_physical_item"] = function(p10)
        local v11 = workspace:WaitForChild("Interiors")
        for _, v12 in pairs(p10) do
            v11 = v11[v12]
        end
        return v11
    end
}