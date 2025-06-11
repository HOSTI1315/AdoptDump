--// ReplicatedStorage.CmdrClient.Commands.attemptBuy (ModuleScript)

local v12 = {
    ["Name"] = "attemptBuy",
    ["Aliases"] = {},
    ["Description"] = "Attempts to buy an item directly through the Shop module.",
    ["Group"] = "DeveloperDebug",
    ["Args"] = {
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category to add from."
        },
        function(p1)
            local v2 = p1.Arguments[1]:GetValue()
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind(v2),
                ["Name"] = "Kind",
                ["Description"] = "The item to add."
            }
        end,
        {
            ["Type"] = "boolean",
            ["Name"] = "Use ShopM",
            ["Description"] = "Calls ShopM.buy_item instead of invoking remote directly",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(_, p3, p4, p5)
        local v6 = require(game.ReplicatedStorage.Fsys).load
        local v7 = v6("RouterClient")
        local v8 = v6("InventoryDB")
        local v9 = v6("ShopM")
        local v10 = v8[p3][p4]
        local v11
        if v10 then
            if p5 == true then
                v9.buy_item(nil, {
                    ["category"] = v10.category,
                    ["id"] = v10.kind,
                    ["purchase_confirmation"] = true
                })
                return "ShopM request"
            end
            v11 = v7.get("ShopAPI/BuyItem"):InvokeServer(v10.category, v10.kind, {})
        else
            v11 = "invalid item"
        end
        return v11
    end
}
return v12