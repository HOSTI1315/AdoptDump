--// ReplicatedStorage.CmdrClient.Commands.runif (ModuleScript)

local v_u_3 = {
    ["startsWith"] = function(p1, p2)
        if p1:sub(1, #p2) == p2 then
            return p1:sub(#p2 + 1)
        end
    end
}
local v11 = {
    ["Name"] = "runif",
    ["Aliases"] = {},
    ["Description"] = "Runs a given command string if a certain condition is met.",
    ["Group"] = "DefaultUtil",
    ["Args"] = {
        {
            ["Type"] = "conditionFunction",
            ["Name"] = "Condition",
            ["Description"] = "The condition function"
        },
        {
            ["Type"] = "string",
            ["Name"] = "Argument",
            ["Description"] = "The argument to the condition function"
        },
        {
            ["Type"] = "string",
            ["Name"] = "Test against",
            ["Description"] = "The text to test against."
        },
        {
            ["Type"] = "string",
            ["Name"] = "Command",
            ["Description"] = "The command string to run if requirements are met. If omitted, return value from condition function is used.",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(p4, p5, p6, p7, p8)
        local v9 = v_u_3[p5]
        if not v9 then
            return ("Condition %q is not valid."):format(p5)
        end
        local v10 = v9(p7, p6)
        return not v10 and "" or p4.Dispatcher:EvaluateAndRun(p4.Cmdr.Util.RunEmbeddedCommands(p4.Dispatcher, p8 or v10))
    end
}
return v11