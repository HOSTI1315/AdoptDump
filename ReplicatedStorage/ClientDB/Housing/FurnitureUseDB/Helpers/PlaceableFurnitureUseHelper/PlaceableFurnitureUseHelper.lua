--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.PlaceableFurnitureUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("package:t")
local v_u_3 = v2.strictInterface({
    ["persisted_keys"] = v2.optional(v2.map(v2.string, v2.literal(true)))
})
return {
    ["PLACEABLE_FURNITURE"] = function(p4, p5)
        local v6 = p5 or {}
        local v7 = v_u_3
        assert(v7(v6))
        local v_u_8 = p4.get_additional_choices
        local v_u_9 = p4.client_get_data_for_server_use
        local v_u_10 = p4.render
        p4.placeable = true
        p4.protect_interaction = true
        p4.persisted_keys = v6.persisted_keys
        function p4.get_additional_choices(p_u_11, p12)
            local v13 = v_u_1("PlaceableToolHelper")
            local v14 = not v_u_8 and {} or v_u_8(p_u_11, p12)
            if game.Players.LocalPlayer == p12 or v13.is_house_owner() then
                table.insert(v14, {
                    ["text"] = "Take Down",
                    ["on_selected"] = function()
                        return p_u_11("take_down")
                    end
                })
            end
            return v14
        end
        function p4.client_get_data_for_server_use(p15, p16, p17, p18, p19, p20, p21)
            local v22 = v_u_1("PlaceableToolHelper")
            local v23 = v_u_1("RouterClient")
            if (game.Players.LocalPlayer == p18 or v22.is_house_owner()) and p21 == "take_down" then
                local v24 = p15.id
                if v22.is_house_owner() then
                    v23.get("PlaceableToolAPI/HouseOwnerDestroyPlaceable"):InvokeServer(p18, "placeable_furniture", v24)
                else
                    v23.get("PlaceableToolAPI/DestroyPlaceable"):InvokeServer("placeable_furniture", v24)
                end
                return nil
            elseif v_u_9 then
                return v_u_9(p15, p16, p17, p18, p19, p20, p21)
            else
                return nil
            end
        end
        function p4.render(p25, p26, p27, p28, p29)
            p26:AddTag(p25.id)
            if v_u_10 then
                v_u_10(p25, p26, p27, p28, p29)
            end
        end
        return p4
    end
}