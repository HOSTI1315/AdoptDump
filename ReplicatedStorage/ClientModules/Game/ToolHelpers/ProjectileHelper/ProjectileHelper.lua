--// ReplicatedStorage.ClientModules.Game.ToolHelpers.ProjectileHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Raycast")
local v2 = {}
local function v_u_14(p3, p4, p5, p6)
    local v7 = math.abs(p5)
    local v8 = p6 ^ 4 - v7 * (v7 * p3 ^ 2 + 2 * p4 * p6 ^ 2)
    if v8 <= 0 then
        return 0.7853981633974483
    else
        local v9 = math.sqrt(v8)
        local v10 = (p6 ^ 2 + v9) / (v7 * p3)
        local v11 = (p6 ^ 2 - v9) / (v7 * p3)
        local v12 = math.atan(v10)
        local v13 = math.atan(v11)
        if v12 < v13 then
            return v12
        else
            return v13
        end
    end
end
function v2.get_aim_direction(p15, p16, p17)
    local _, v19 = v_u_1.mousecast(nil, nil, nil, nil, {
        ["ignore_non_cancollide"] = true,
        ["ignore_transparent"] = true,
        ["ignore_function"] = function(p18)
            return p18:IsDescendantOf(game.Players.LocalPlayer.Character)
        end
    })
    local v20 = v19 - p15
    local v21 = v20 * Vector3.new(1, 0, 1)
    local v22 = v_u_14((v21 * Vector3.new(1, 0, 1)).Magnitude, v20.Y, p16, p17)
    local v23 = math.sin(v22)
    local v24 = math.cos(v22)
    local v25 = v21.Unit
    local v26 = v25.x * v24
    local v27 = v25.z * v24
    return Vector3.new(v26, v23, v27)
end
return v2