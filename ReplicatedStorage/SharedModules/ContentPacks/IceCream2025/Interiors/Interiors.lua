--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.Interiors (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("Maid")
local v16 = {
    ["housing!ice_cream_house"] = {
        ["interactions"] = function(p4, _)
            return v_u_2("InteriorsDB").housing.interactions(p4)
        end,
        ["render"] = function(p_u_5, p6)
            v_u_2("InteriorsDB").housing.render(p_u_5, p6)
            local v7 = v_u_3.new()
            p6.ice_cream_house_maid = v7
            local v_u_8 = v_u_2("ClientData")
            v7:GiveTask(v_u_8.register_callback_plus_existing("house_exteriors", function(_, p9)
                if not p9 then
                    return
                end
                local v10 = v_u_8.get("house_interior")
                local v11 = nil
                for _, v12 in p9 do
                    if v12.house_id == v10.house_id and v12.player == v10.player then
                        v11 = v12
                        break
                    end
                end
                if v11 then
                    for _, v13 in p_u_5.ExteriorColorable:GetDescendants() do
                        v13.Color = v11.color
                    end
                end
            end))
        end,
        ["cleanup"] = function(p14, p15)
            v_u_2("InteriorsDB").housing.cleanup(p14, p15)
            if p15.ice_cream_house_maid then
                p15.ice_cream_house_maid:Destroy()
            end
        end
    }
}
return v16