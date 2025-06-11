--// ReplicatedStorage.SharedModules.Nearest.Nearest (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Debug")
local v2 = {}
local v_u_3 = {}
function v2.new()
    local v4 = {
        ["__index"] = v_u_3
    }
    local v5 = setmetatable({}, v4)
    v5.add_methods = {}
    return v5
end
function v_u_3.register(p6, p7)
    local v8 = typeof(p7) == "table" and p7 and p7 or { p7 }
    for _, v9 in pairs(v8) do
        local v10 = p6.add_methods
        table.insert(v10, v9)
    end
end
function v_u_3.get_all_within_range(p11, p12)
    local v13 = p12 or {}
    local v14 = v13.max_dist or (1 / 0)
    local v15
    if v13.position then
        v15 = v13.position
    elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        v15 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    else
        v15 = Vector3.new()
    end
    local v_u_16 = {}
    for _, v_u_17 in pairs(p11.add_methods) do
        v_u_1.pcall_print_error(function()
            v_u_17(v_u_16)
        end)
    end
    local v18 = {}
    for _, v19 in pairs(v_u_16) do
        if (v19.instance.Position - v15).magnitude <= v14 then
            table.insert(v18, v19)
        end
    end
    return v18
end
return v2