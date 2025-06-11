--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.Reporters.TextReporterQuiet (ModuleScript)

local v_u_1 = game:GetService("TestService")
local v_u_2 = require(script.Parent.Parent.TestEnum)
local v_u_3 = (" "):rep(3)
local v_u_4 = {
    [v_u_2.TestStatus.Success] = "+",
    [v_u_2.TestStatus.Failure] = "-",
    [v_u_2.TestStatus.Skipped] = "~"
}
local v5 = {}
local function v_u_14(p6, p7, p8)
    local v9 = p7 or {}
    local v10 = p8 or 0
    if p6.status == v_u_2.TestStatus.Skipped then
        return v9
    end
    local v11
    if p6.status == v_u_2.TestStatus.Success then
        v11 = nil
    else
        local v12 = v_u_4[p6.status] or "?"
        v11 = ("%s[%s] %s"):format(v_u_3:rep(v10), v12, p6.planNode.phrase)
    end
    table.insert(v9, v11)
    for _, v13 in ipairs(p6.children) do
        v_u_14(v13, v9, v10 + 1)
    end
    return v9
end
local function v_u_18(p15)
    local v16 = {}
    for _, v17 in ipairs(p15.children) do
        v_u_14(v17, v16, 0)
    end
    return v16
end
function v5.report(p19)
    local v20 = {}
    local v21 = v_u_18(p19)
    __set_list(v20, 1, {"Test results:", table.concat(v21, "\n"), ("%d passed, %d failed, %d skipped"):format(p19.successCount, p19.failureCount, p19.skippedCount)})
    print(table.concat(v20, "\n"))
    if p19.failureCount > 0 then
        print(("%d test nodes reported failures."):format(p19.failureCount))
    end
    if #p19.errors > 0 then
        print("Errors reported by tests:")
        print("")
        for _, v22 in ipairs(p19.errors) do
            v_u_1:Error(v22)
            print("")
        end
    end
end
return v5