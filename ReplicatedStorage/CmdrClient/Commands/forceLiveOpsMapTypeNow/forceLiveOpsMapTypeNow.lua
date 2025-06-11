--// ReplicatedStorage.CmdrClient.Commands.forceLiveOpsMapTypeNow (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("LiveOpsMapSwap")
return {
    ["Name"] = "forceLiveOpsMapTypeNow",
    ["Aliases"] = {},
    ["Description"] = "Forcibly sets the Live Ops map type.",
    ["Group"] = "DeveloperDebug",
    ["Args"] = { function(p2)
            local v3 = v_u_1.get_all_map_types()
            table.insert(v3, 1, "next")
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("LiveOpsMapTypes", v3),
                ["Name"] = "Live ops map type",
                ["Description"] = "The live ops map type to forcibly set to. This will not offset the live ops time."
            }
        end }
}