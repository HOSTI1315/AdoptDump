--// ReplicatedStorage.CmdrClient.Commands.rand (ModuleScript)

local v_u_1 = Random.new()
local v5 = {
    ["Name"] = "rand",
    ["Aliases"] = {},
    ["Description"] = "Returns a random number between min and max",
    ["Group"] = "DefaultUtil",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "First number",
            ["Description"] = "If second number is nil, random number is between 1 and this value. If second number is provided, number is between this number and the second number."
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Second number",
            ["Description"] = "The upper bound.",
            ["Optional"] = true
        }
    },
    ["ClientRun"] = function(_, p2, p3)
        local v4
        if p3 then
            v4 = v_u_1:NextInteger(p2, p3)
        else
            v4 = v_u_1:NextInteger(1, p2)
        end
        return tostring(v4)
    end
}
return v5