--// ReplicatedStorage.CmdrClient.Commands.forsaleitems (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v29 = {
    ["Name"] = "forsaleitems",
    ["Description"] = "Print all items for sale in the given category.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category to check."
        }
    },
    ["ClientRun"] = function(p2, p3)
        local v4 = v_u_1("new:ForSaleManager")
        local v5 = {}
        local v6 = 0
        local v7 = {}
        local v8 = {}
        local v9 = {}
        local v10 = {}
        for v11, _ in v_u_1("InventoryDB")[p3] do
            if v4.is_for_sale(v11, p2.Executor) then
                v6 = v6 + 1
                if v4.has_custom_callback(v11) then
                    table.insert(v7, v11)
                elseif v4.is_in_hatshop_rotation(v11) then
                    table.insert(v8, v11)
                else
                    local v12 = v4.get_interiors(v11)
                    if next(v12) then
                        table.sort(v12)
                        local v13 = ("%*\n\t- %*"):format(v11, (table.concat(v12, ", ")))
                        table.insert(v9, v13)
                    else
                        local v14 = v4.get_furniture_kinds(v11)
                        if next(v14) then
                            table.sort(v14)
                            local v15 = ("%*\n\t- %*"):format(v11, (table.concat(v14, ", ")))
                            table.insert(v5, v15)
                        else
                            local v16 = v4.get_stand_kinds(v11)
                            if next(v16) then
                                table.sort(v16)
                                local v17 = ("%*\n\t- %*"):format(v11, (table.concat(v16, ", ")))
                                table.insert(v10, v17)
                            end
                        end
                    end
                end
            end
        end
        table.sort(v7)
        table.sort(v8)
        table.sort(v9)
        table.sort(v5)
        table.sort(v10)
        local v18 = ("\nItems in category \"%*\" for sale:"):format(p3)
        if next(v7) then
            v18 = ("%*\nFrom Custom ForSaleCallbacks:"):format(v18)
            for v19, v20 in v7 do
                v18 = ("%*\n%*. %*"):format(v18, v19, v20)
            end
        end
        if next(v8) then
            v18 = ("%*\nFrom HatShop Rotation:"):format(v18)
            for v21, v22 in v8 do
                v18 = ("%*\n%*. %*"):format(v18, v21, v22)
            end
        end
        if next(v9) then
            v18 = ("%*\nFrom Interiors:"):format(v18)
            for v23, v24 in v9 do
                v18 = ("%*\n%*. %*"):format(v18, v23, v24)
            end
        end
        if next(v5) then
            v18 = ("%*\nFrom Furniture:"):format(v18)
            for v25, v26 in v5 do
                v18 = ("%*\n%*. %*"):format(v18, v25, v26)
            end
        end
        if next(v10) then
            v18 = ("%*\nFrom Stands:"):format(v18)
            for v27, v28 in v10 do
                v18 = ("%*\n%*. %*"):format(v18, v27, v28)
            end
        end
        print((("%*\n"):format(v18)))
        return ("Printed %* items to the console. Press F9 to view them."):format(v6)
    end
}
return v29