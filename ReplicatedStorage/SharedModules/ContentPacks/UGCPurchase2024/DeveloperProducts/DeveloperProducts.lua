--// ReplicatedStorage.SharedModules.ContentPacks.UGCPurchase2024.DeveloperProducts (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("DeveloperProductCallbacks")
local v3 = v_u_1("SharedConstants")
local v_u_4 = v_u_1("UGCHelper")
local v7 = {
    ["backup_ugc_pet_purchase"] = {
        ["name"] = "UGC Pet",
        ["description"] = "Unlocks the current UGC Pet!",
        ["cost"] = 700,
        ["product_id"] = 1848180777,
        ["callback"] = v_u_2.all({ function(p5)
                local v6 = v_u_1("DataM").get_store(p5)
                if v6 then
                    v6 = v6:get("ugc_purchase_manager")
                end
                if v6 then
                    if v_u_4.claimed_all_items_already(v6) then
                        return nil
                    else
                        return v_u_2.BREAK
                    end
                else
                    return v_u_2.BREAK
                end
            end, v_u_2.add_item("pets", v3.ugc_pet_kind, true) })
    }
}
return v7