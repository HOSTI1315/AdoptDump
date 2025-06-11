--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez (ModuleScript)

local v1 = require(script.Expectation)
local v_u_2 = require(script.TestBootstrap)
local v3 = require(script.TestEnum)
local v4 = require(script.TestPlan)
local v_u_5 = require(script.TestPlanner)
local v6 = require(script.TestResults)
local v_u_7 = require(script.TestRunner)
local v12 = {
    ["run"] = function(p8, p9)
        local v10 = v_u_2:getModules(p8)
        local v11 = v_u_5.createPlan(v10)
        p9((v_u_7.runPlan(v11)))
    end,
    ["Expectation"] = v1,
    ["TestBootstrap"] = v_u_2,
    ["TestEnum"] = v3,
    ["TestPlan"] = v4,
    ["TestPlanner"] = v_u_5,
    ["TestResults"] = v6,
    ["TestRunner"] = v_u_7,
    ["TestSession"] = require(script.TestSession),
    ["Reporters"] = {
        ["TextReporter"] = require(script.Reporters.TextReporter),
        ["TextReporterQuiet"] = require(script.Reporters.TextReporterQuiet),
        ["TeamCityReporter"] = require(script.Reporters.TeamCityReporter)
    }
}
return v12