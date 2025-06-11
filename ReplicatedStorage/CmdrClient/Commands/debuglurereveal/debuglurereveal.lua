--// ReplicatedStorage.CmdrClient.Commands.debuglurereveal (ModuleScript)

game:GetService("RunService")
local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("package:Sift")
local v10 = {
    ["Name"] = "debuglurereveal",
    ["Aliases"] = {},
    ["Description"] = "Forces the specified lure bait to roll a particular item kind.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p4)
            local v6 = v_u_3.Dictionary.filter(v_u_2.food, function(p5)
                return p5.is_lure_bait
            end)
            local v7 = v_u_3.Dictionary.keys(v6)
            return {
                ["Type"] = p4.Cmdr.Util.MakeEnumType("lure_baits", v7),
                ["Name"] = "Bait Kinds",
                ["Description"] = "Kinds of bait"
            }
        end,
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category."
        },
        function(p8)
            local v9 = p8.Arguments[2]:GetValue()
            return {
                ["Type"] = p8.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind(v9),
                ["Name"] = "Kind",
                ["Description"] = "The item to get from the lure."
            }
        end,
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "The amount of items to obtain.",
            ["Default"] = 1
        }
    }
}
return v10