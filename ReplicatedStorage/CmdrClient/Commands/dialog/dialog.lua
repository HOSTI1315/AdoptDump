--// ReplicatedStorage.CmdrClient.Commands.dialog (ModuleScript)

local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v1:IsClient() and v2("UIManager") or nil
return {
    ["Name"] = "dialog",
    ["Aliases"] = {},
    ["Description"] = "Send a local dialog.",
    ["Group"] = "EveryoneOnRobloxInTesting",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "Text",
            ["Description"] = "The text to put in the text box.",
            ["Default"] = ""
        }
    },
    ["ClientRun"] = function(_, p4)
        return select(2, v_u_3.apps.DialogApp:paragraph_dialog({
            ["button"] = "Okay",
            ["existing_text"] = p4
        }))
    end
}