--// ReplicatedStorage.CmdrClient.Commands.dumpCloudValues (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Fsys).load("new:dumpCloudValues")
local v6 = {
    ["Name"] = "dumpCloudValues",
    ["Aliases"] = {},
    ["Description"] = "Dump all cloud values for server/client.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "realm",
            ["Name"] = "Realm",
            ["Description"] = "Server/Client?",
            ["Default"] = "Server"
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Depth",
            ["Description"] = "Depth to inspect to",
            ["Default"] = 1
        },
        {
            ["Type"] = "string",
            ["Name"] = "Path",
            ["Description"] = "CloudValues path to read",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(_, p3, p4, p5)
        if p3 == "Server" then
            return nil
        else
            return v_u_2(p4, p5)
        end
    end
}
return v6