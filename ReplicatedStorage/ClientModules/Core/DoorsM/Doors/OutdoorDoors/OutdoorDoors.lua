--// ReplicatedStorage.ClientModules.Core.DoorsM.Doors.OutdoorDoors (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("NearestObj")
local function v_u_6(p2, p3)
    local v4 = p3:WaitForChild("WorkingParts"):WaitForChild("TouchToEnter")
    local v5 = v_u_1.new
    table.insert(p2, v5(v4, {
        ["door_model"] = p3
    }))
end
return function(p7)
    for _, v8 in pairs(workspace:WaitForChild("Interiors"):GetChildren()) do
        if v8:FindFirstChild("Buildings") then
            for _, v9 in pairs(v8.Buildings:GetChildren()) do
                for _, v10 in pairs(v9:WaitForChild("Doors"):GetChildren()) do
                    if not v10.WorkingParts.Configuration:FindFirstChild("NoAutoOpen") then
                        v_u_6(p7, v10)
                    end
                end
            end
        end
    end
end