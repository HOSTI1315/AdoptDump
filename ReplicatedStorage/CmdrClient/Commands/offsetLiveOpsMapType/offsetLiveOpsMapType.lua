--// ReplicatedStorage.CmdrClient.Commands.offsetLiveOpsMapType (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("LiveOpsMapSwap")
return {
    ["Name"] = "offsetLiveOpsMapType",
    ["Aliases"] = {},
    ["Description"] = "Adjusts the Live Ops time offset.",
    ["Group"] = "DeveloperDebug",
    ["Args"] = { function(p2)
            local v3 = v_u_1.get_all_map_types()
            table.insert(v3, 1, "next")
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("LiveOpsMapTypes", v3),
                ["Name"] = "Live ops map type",
                ["Description"] = "The live ops map type to offset liveops time to"
            }
        end }
}