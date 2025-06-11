--// ReplicatedStorage.ClientModules.Core.DoorsM.Doors.InteriorDoors (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("NearestObj")
local _ = { workspace:WaitForChild("Interiors") }
local function v_u_6(p2, p3)
    local v4 = p3:WaitForChild("WorkingParts"):WaitForChild("TouchToEnter")
    local v5 = v_u_1.new
    table.insert(p2, v5(v4, {
        ["door_model"] = p3
    }))
end
return function(p7)
    for _, v8 in pairs(workspace:WaitForChild("Interiors"):GetChildren()) do
        if v8:FindFirstChild("Doors") then
            for _, v9 in pairs(v8.Doors:GetChildren()) do
                if not v9.WorkingParts.Configuration:FindFirstChild("NoAutoOpen") then
                    v_u_6(p7, v9)
                end
            end
        end
    end
end