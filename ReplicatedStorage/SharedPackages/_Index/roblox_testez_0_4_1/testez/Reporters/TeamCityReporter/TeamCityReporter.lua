--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.Reporters.TeamCityReporter (ModuleScript)

local v_u_1 = game:GetService("TestService")
local v_u_2 = require(script.Parent.Parent.TestEnum)
local v3 = {}
local function v_u_8(p4)
    local v5 = string.format
    local v6 = string.gsub(p4, "([]|\'[])", "|%1")
    local v7 = string.gsub(v6, "\r", "|r")
    return v5("##teamcity[testSuiteStarted name=\'%s\']", (string.gsub(v7, "\n", "|n")))
end
local function v_u_13(p9)
    local v10 = string.format
    local v11 = string.gsub(p9, "([]|\'[])", "|%1")
    local v12 = string.gsub(v11, "\r", "|r")
    return v10("##teamcity[testSuiteFinished name=\'%s\']", (string.gsub(v12, "\n", "|n")))
end
local function v_u_18(p14)
    local v15 = string.format
    local v16 = string.gsub(p14, "([]|\'[])", "|%1")
    local v17 = string.gsub(v16, "\r", "|r")
    return v15("##teamcity[testStarted name=\'%s\']", (string.gsub(v17, "\n", "|n")))
end
local function v_u_23(p19)
    local v20 = string.format
    local v21 = string.gsub(p19, "([]|\'[])", "|%1")
    local v22 = string.gsub(v21, "\r", "|r")
    return v20("##teamcity[testFinished name=\'%s\']", (string.gsub(v22, "\n", "|n")))
end
local function v_u_32(p24, p25)
    local v26 = string.format
    local v27 = string.gsub(p24, "([]|\'[])", "|%1")
    local v28 = string.gsub(v27, "\r", "|r")
    local v29 = string.gsub(v28, "\n", "|n")
    local v30 = string.gsub(p25, "([]|\'[])", "|%1")
    local v31 = string.gsub(v30, "\r", "|r")
    return v26("##teamcity[testFailed name=\'%s\' message=\'%s\']", v29, (string.gsub(v31, "\n", "|n")))
end
local function v_u_51(p33, p34, p35)
    local v36 = p34 or {}
    local v37 = p35 or 0
    if p33.status == v_u_2.TestStatus.Skipped then
        return v36
    elseif p33.planNode.type == v_u_2.NodeType.Describe then
        local v38 = v_u_8
        local v39 = p33.planNode.phrase
        table.insert(v36, v38(v39))
        for _, v40 in ipairs(p33.children) do
            v_u_51(v40, v36, v37 + 1)
        end
        local v41 = v_u_13
        local v42 = p33.planNode.phrase
        table.insert(v36, v41(v42))
    else
        local v43 = v_u_18
        local v44 = p33.planNode.phrase
        table.insert(v36, v43(v44))
        if p33.status == v_u_2.TestStatus.Failure then
            local v45 = v_u_32
            local v46 = p33.planNode.phrase
            local v47 = table.concat
            local v48 = p33.errors
            table.insert(v36, v45(v46, v47(v48, "\n")))
        end
        local v49 = v_u_23
        local v50 = p33.planNode.phrase
        table.insert(v36, v49(v50))
    end
end
local function v_u_55(p52)
    local v53 = {}
    for _, v54 in ipairs(p52.children) do
        v_u_51(v54, v53, 0)
    end
    return v53
end
function v3.report(p56)
    local v57 = {}
    local v58 = v_u_55(p56)
    __set_list(v57, 1, {"Test results:", table.concat(v58, "\n"), ("%d passed, %d failed, %d skipped"):format(p56.successCount, p56.failureCount, p56.skippedCount)})
    print(table.concat(v57, "\n"))
    if p56.failureCount > 0 then
        print(("%d test nodes reported failures."):format(p56.failureCount))
    end
    if #p56.errors > 0 then
        print("Errors reported by tests:")
        print("")
        for _, v59 in ipairs(p56.errors) do
            v_u_1:Error(v59)
            print("")
        end
    end
end
return v3