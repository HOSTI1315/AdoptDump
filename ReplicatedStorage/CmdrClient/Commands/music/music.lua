--// ReplicatedStorage.CmdrClient.Commands.music (ModuleScript)

local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v1:IsClient() and v2("Music") or nil
return {
    ["Name"] = "music",
    ["Aliases"] = {},
    ["Description"] = "Change background music status",
    ["Group"] = "EveryoneOnRobloxInTesting",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "Enabled",
            ["Description"] = "Whether or not the music is enabled"
        }
    },
    ["ClientRun"] = function(_, p4)
        v_u_3[p4 and "enable" or "disable"]()
        return ("Music is now %s"):format(p4 and "enabled" or "disabled")
    end
}