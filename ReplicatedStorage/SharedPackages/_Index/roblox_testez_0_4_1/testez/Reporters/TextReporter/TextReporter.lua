--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.Reporters.TextReporter (ModuleScript)

local v_u_1 = game:GetService("TestService")
local v_u_2 = require(script.Parent.Parent.TestEnum)
local v_u_3 = (" "):rep(3)
local v_u_4 = {
    [v_u_2.TestStatus.Success] = "+",
    [v_u_2.TestStatus.Failure] = "-",
    [v_u_2.TestStatus.Skipped] = "~"
}
local v5 = {}
local function v_u_8(p6, p7)
    return p6.planNode.phrase:lower() < p7.planNode.phrase:lower()
end
local function v_u_17(p9, p10, p11)
    local v12 = p10 or {}
    local v13 = p11 or 0
    if p9.status == v_u_2.TestStatus.Skipped then
        return v12
    end
    local v14
    if p9.status then
        local v15 = v_u_4[p9.status] or "?"
        v14 = ("%s[%s] %s"):format(v_u_3:rep(v13), v15, p9.planNode.phrase)
    else
        v14 = ("%s%s"):format(v_u_3:rep(v13), p9.planNode.phrase)
    end
    table.insert(v12, v14)
    table.sort(p9.children, v_u_8)
    for _, v16 in ipairs(p9.children) do
        v_u_17(v16, v12, v13 + 1)
    end
    return v12
end
local function v_u_21(p18)
    table.sort(p18.children, v_u_8)
    local v19 = {}
    for _, v20 in ipairs(p18.children) do
        v_u_17(v20, v19, 0)
    end
    return v19
end
function v5.report(p22)
    local v23 = {}
    local v24 = v_u_21(p22)
    __set_list(v23, 1, {"Test results:", table.concat(v24, "\n"), ("%d passed, %d failed, %d skipped"):format(p22.successCount, p22.failureCount, p22.skippedCount)})
    print(table.concat(v23, "\n"))
    if p22.failureCount > 0 then
        print(("%d test nodes reported failures."):format(p22.failureCount))
    end
    if #p22.errors > 0 then
        print("Errors reported by tests:")
        print("")
        for _, v25 in ipairs(p22.errors) do
            v_u_1:Error(v25)
            print("")
        end
    end
end
return v5