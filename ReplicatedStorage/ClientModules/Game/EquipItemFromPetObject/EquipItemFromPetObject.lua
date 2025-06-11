--// ReplicatedStorage.ClientModules.Game.EquipItemFromPetObject (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientToolManager")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("package:Promise")
return function(p5)
    local v6 = p5:FindFirstChild("ItemUniqueId")
    local v7 = p5:FindFirstChild("ItemCategory")
    if v6 or not v7 then
        local v_u_8 = v6.Value
        local v_u_9 = v7.Value
        v_u_4.async(function()
            local v10 = v_u_3.get("inventory")
            if v10 then
                v10 = v10[v_u_9]
            end
            if v10 then
                local v11 = v10[v_u_8]
                if v11 then
                    v_u_2.equip(v11)
                end
            else
                return
            end
        end)
    end
end