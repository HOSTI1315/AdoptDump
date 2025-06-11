--// ReplicatedStorage.ClientModules.Game.EggCurrency (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ClientData")
local v2 = {}
local v_u_3 = {
    ["patterns_egg"] = true,
    ["stripes_egg"] = true,
    ["stars_egg"] = true
}
function v2.get_my_total_eggs()
    local v4 = v_u_1.get("inventory") or {}
    local v5 = 0
    for _, v6 in pairs(v4.food) do
        if v_u_3[v6.id] then
            v5 = v5 + 1
        end
    end
    return v5
end
return v2