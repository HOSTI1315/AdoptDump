--// ReplicatedStorage.new.modules.FurnitureEntryHelper (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v_u_2("new:TutorialAB")
return {
    ["get_cost"] = function(p4, p5)
        if not p4.cost then
            return nil
        end
        local v6 = v_u_3:get_value("full_price_tags", p5)
        if next(v6) and p4.tags then
            for _, v7 in p4.tags do
                if v6[v7] then
                    return p4.cost
                end
            end
        end
        local v8
        if v_u_1:IsClient() then
            local v9 = v_u_2("ClientData").get("house_interior")
            if v9 and v9.player == game.Players.LocalPlayer then
                v8 = v9.building_type
            else
                v8 = nil
            end
        else
            assert(p5, "FurnitureEntryHelper.get_cost needs a Player on the server.")
            local v10 = v_u_2("DataM").get_store(p5)
            local v11
            if v10 then
                v11 = v10:get("house_interior")
            else
                v11 = nil
            end
            if v11 and (v11.house and v11.house.player == p5) then
                v8 = v11.house.building_type
            else
                v8 = nil
            end
        end
        return v8 and v_u_3:get_value("free_furniture_house_kinds", p5)[v8] and 0 or p4.cost
    end
}