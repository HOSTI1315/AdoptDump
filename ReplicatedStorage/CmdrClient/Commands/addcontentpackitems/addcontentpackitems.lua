--// ReplicatedStorage.CmdrClient.Commands.addcontentpackitems (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v12 = {
    ["Name"] = "addcontentpackitems",
    ["Aliases"] = {},
    ["Description"] = "Adds all items to the given players from a content pack.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p2)
            local v3 = v_u_1("package:Sift")
            local v4 = v_u_1("ContentPackDB")
            local v5 = v3.Dictionary.keys(v4.by_content_pack)
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("ContentPacks", v5),
                ["Name"] = "Content Pack",
                ["Description"] = "Which content pack to give items from."
            }
        end,
        function(p6)
            local v7 = p6.Arguments[1]:GetValue()
            local v8 = {}
            for v9, v10 in v_u_1("ContentPackDB").by_content_pack_then_category[v7] do
                if next(v10) then
                    table.insert(v8, v9)
                end
            end
            local v11 = p6.Cmdr.Util.MakeEnumType("Categories", v8)
            return {
                ["Type"] = p6.Cmdr.Util.MakeListableType(v11),
                ["Name"] = "Category",
                ["Description"] = "Which categories to give the items from."
            }
        end,
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to add the items to",
            ["Optional"] = true
        },
        {
            ["Type"] = "string",
            ["Name"] = "Properties",
            ["Description"] = "Extra properties for the item",
            ["Optional"] = true
        }
    }
}
return v12