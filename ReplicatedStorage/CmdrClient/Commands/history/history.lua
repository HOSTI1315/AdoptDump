--// ReplicatedStorage.CmdrClient.Commands.history (ModuleScript)

local v4 = {
    ["Name"] = "history",
    ["Aliases"] = {},
    ["AutoExec"] = { "alias \"!|Displays previous command from history.\" run ${history $1{number|Line Number}}", "alias \"^|Runs the previous command, replacing all occurrences of A with B.\" run ${run replace ${history -1} $1{string|A} $2{string|B}}", "alias \"!!|Reruns the last command.\" ! -1" },
    ["Description"] = "Displays previous commands from history.",
    ["Group"] = "DefaultUtil",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Line Number",
            ["Description"] = "Command line number (can be negative to go from end)"
        }
    },
    ["ClientRun"] = function(p1, p2)
        local v3 = p1.Dispatcher:GetHistory()
        if p2 <= 0 then
            p2 = #v3 + p2
        end
        return v3[p2] or ""
    end
}
return v4