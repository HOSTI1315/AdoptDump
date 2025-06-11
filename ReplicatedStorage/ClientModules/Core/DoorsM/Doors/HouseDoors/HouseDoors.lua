--// ReplicatedStorage.ClientModules.Core.DoorsM.Doors.HouseDoors (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("NearestObj")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("FamilyHelper")
local function v_u_9(p5, p6)
    local v7 = p6:WaitForChild("WorkingParts"):WaitForChild("TouchToEnter")
    local v8 = v_u_2.new
    table.insert(p5, v8(v7, {
        ["door_model"] = p6
    }))
end
local function v_u_13(p10)
    local v11 = p10.WorkingParts.Configuration.house_owner.Value
    local v12 = game.Players:FindFirstChild(v11 or "")
    if v12 == nil then
        return false
    else
        return v_u_3.get("dev_watchmode") and true or ((v_u_3.get_server(v12, "door_locked") ~= true or (v_u_4.is_my_friend_or_family(v12) or v12 == game.Players.LocalPlayer)) and true or false)
    end
end
return function(p14)
    if workspace:FindFirstChild("HouseExteriors") then
        for _, v15 in pairs(workspace.HouseExteriors:GetChildren()) do
            local v16 = v15:GetChildren()[1]
            if v16 then
                for _, v17 in pairs(v16:WaitForChild("Doors"):GetChildren()) do
                    if v_u_13(v17) then
                        v_u_9(p14, v17)
                    end
                end
            end
        end
    end
    local v18 = workspace:FindFirstChild("HouseInteriors")
    if v18 then
        v18 = workspace.HouseInteriors:FindFirstChild("blueprint")
    end
    if v18 then
        v18 = v18:GetChildren()[1]
    end
    if v18 then
        for _, v19 in pairs(v18:WaitForChild("Doors"):GetChildren()) do
            if not v19.WorkingParts.Configuration:FindFirstChild("NoAutoOpen") then
                v_u_9(p14, v19)
            end
        end
    end
end