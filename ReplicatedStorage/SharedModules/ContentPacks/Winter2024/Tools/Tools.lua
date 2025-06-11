--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v8 = {
    ["Winter2024GoldenMistletoe"] = {
        ["client_use"] = function(_, _, p2)
            v_u_1("MistletrollAdoption").throw_food(p2.tool.ModelHandle, p2.item_data.unique)
        end
    },
    ["IceSaberTool"] = {
        ["ignore_server_use_on_tool"] = true,
        ["client_use"] = function(p3, p4, p5, p6, p7)
            v_u_1("IceSaberHelper").client_use(p3, p4, p5, p6, p7)
        end
    }
}
return v8