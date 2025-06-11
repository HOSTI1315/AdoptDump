--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.TestResults (ModuleScript)

local v_u_1 = require(script.Parent.TestEnum)
local v_u_2 = {
    [v_u_1.TestStatus.Success] = "+",
    [v_u_1.TestStatus.Failure] = "-",
    [v_u_1.TestStatus.Skipped] = "~"
}
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4)
    local v5 = {
        ["successCount"] = 0,
        ["failureCount"] = 0,
        ["skippedCount"] = 0,
        ["planNode"] = p4,
        ["children"] = {},
        ["errors"] = {}
    }
    local v6 = v_u_3
    setmetatable(v5, v6)
    return v5
end
function v_u_3.createNode(p7)
    return {
        ["planNode"] = p7,
        ["children"] = {},
        ["errors"] = {},
        ["status"] = nil
    }
end
function v_u_3.visitAllNodes(p8, p9, p10)
    for _, v11 in ipairs((p10 or p8).children) do
        p9(v11)
        p8:visitAllNodes(p9, v11)
    end
end
function v_u_3.visualize(p12, p13, p14)
    local v15 = p14 or 0
    local v16 = {}
    for _, v17 in ipairs((p13 or p12).children) do
        if v17.planNode.type == v_u_1.NodeType.It then
            local v18 = v_u_2[v17.status] or "?"
            local v19 = ("%s[%s] %s"):format((" "):rep(3 * v15), v18, v17.planNode.phrase)
            if v17.messages and #v17.messages > 0 then
                v19 = v19 .. "\n " .. (" "):rep(3 * v15) .. table.concat(v17.messages, "\n " .. (" "):rep(3 * v15))
            end
            table.insert(v16, v19)
        else
            local v20 = ("%s%s"):format((" "):rep(3 * v15), v17.planNode.phrase or "")
            if v17.status then
                v20 = v20 .. (" (%s)"):format(v17.status)
            end
            table.insert(v16, v20)
            if #v17.children > 0 then
                local v21 = p12:visualize(v17, v15 + 1)
                table.insert(v16, v21)
            end
        end
    end
    return table.concat(v16, "\n")
end
return v_u_3