--// ReplicatedStorage.CmdrClient.Commands.timetable (ModuleScript)

local v_u_1 = game:GetService("ReplicatedStorage")
return {
    ["Name"] = "timetable",
    ["Aliases"] = {},
    ["Description"] = "Get the current time sources on the server and client.",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["ClientRun"] = function(p2)
        p2:Reply((("Client\n%*"):format((require(v_u_1.Fsys).load("new:dump_timetable")("  ")))))
        return nil
    end
}