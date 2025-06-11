--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureRegistry (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v3 = v1("Signal")
local v_u_4 = v1("package:Promise")
local v_u_5 = game:GetService("CollectionService")
local v_u_25 = {
    ["furniture_registered"] = v3.new(),
    ["get_all_furniture_of_id"] = function(p6)
        return v_u_5:GetTagged("furniture:" .. p6)
    end,
    ["register_furniture"] = function(p7, p8, p9)
        v_u_5:AddTag(p8, "furniture:" .. p9.id)
        v_u_25.furniture_registered:Fire(p7, p8, p9)
    end,
    ["buy_furniture"] = function(p_u_10)
        local v_u_11 = nil
        local v_u_12 = {}
        local v20 = v_u_4.fromEvent(v_u_25.furniture_registered, function(p13, p14, p15)
            if not v_u_12[p13] then
                v_u_12[p13] = {
                    ["model"] = p14,
                    ["data"] = p15
                }
            end
            local v16 = 0
            local v17 = #p_u_10
            local v18 = v_u_11 and v_u_11.success
            if v18 then
                v18 = v_u_11.results
            end
            if v18 then
                for _, v19 in v_u_11.results do
                    if v_u_12[v19.unique] then
                        v16 = v16 + 1
                    end
                end
            end
            return v16 == v17
        end)
        v_u_11 = v_u_2.get("HousingAPI/BuyFurnitures"):InvokeServer(p_u_10)
        local v21 = v_u_11 and v_u_11.success
        if v21 then
            v21 = v_u_11.results
        end
        local v22
        if v21 then
            v22 = v20:andThen(function()
                for _, v23 in v_u_11.results do
                    local v24 = v_u_12[v23.unique]
                    if v24 then
                        v23.furniture_data = v24.data
                        v23.furniture_model = v24.model
                    end
                end
                return true, v_u_11
            end)
        else
            v20:cancel()
            v22 = v_u_4.resolve(false, v_u_11)
        end
        return v22:expect()
    end
}
return v_u_25