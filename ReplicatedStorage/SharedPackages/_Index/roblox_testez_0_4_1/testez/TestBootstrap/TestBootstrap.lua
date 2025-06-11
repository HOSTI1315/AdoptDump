--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.TestBootstrap (ModuleScript)

local v_u_1 = require(script.Parent.TestPlanner)
local v_u_2 = require(script.Parent.TestRunner)
local v_u_3 = require(script.Parent.Reporters.TextReporter)
local v4 = {}
local function v_u_11(p5, p6)
    local v7 = p6 or game
    local v8 = {}
    if p5.Name == "init.spec" then
        p5 = p5.Parent
    end
    while p5 ~= nil and p5 ~= v7 do
        local v9 = p5.Name:gsub("%.spec$", "")
        table.insert(v8, v9)
        p5 = p5.Parent
    end
    local v10 = v7.Name:gsub("%.spec$", "")
    table.insert(v8, v10)
    return v8
end
function v4.getModulesImpl(_, p12, p13, p14)
    local v15 = p13 or {}
    local v16 = p14 or p12
    local v17 = v16:IsA("ModuleScript")
    if v17 then
        v17 = v16.Name:match("%.spec$")
    end
    if v17 then
        local v18 = require(v16)
        local v19 = v_u_11(v16, p12)
        local v20 = true
        local v21 = ""
        for _, v22 in ipairs(v19) do
            if v20 then
                v21 = v22
                v20 = false
            else
                v21 = v22 .. " " .. v21
            end
        end
        local v23 = {
            ["method"] = v18,
            ["path"] = v19,
            ["pathStringForSorting"] = v21:lower()
        }
        table.insert(v15, v23)
    end
end
function v4.getModules(p24, p25)
    local v26 = {}
    p24:getModulesImpl(p25, v26)
    for _, v27 in ipairs(p25:GetDescendants()) do
        p24:getModulesImpl(p25, v26, v27)
    end
    return v26
end
function v4.run(p28, p29, p30, p31)
    local v32 = p30 or v_u_3
    local v33 = p31 or {}
    local v34 = v33.showTimingInfo or false
    local v35 = v33.testNamePattern
    local v36 = v33.extraEnvironment or {}
    if type(p29) ~= "table" then
        error(("Bad argument #1 to TestBootstrap:run. Expected table, got %s"):format((typeof(p29))), 2)
    end
    local v37 = tick()
    local v38 = {}
    for _, v39 in ipairs(p29) do
        local v40 = p28:getModules(v39)
        for _, v41 in ipairs(v40) do
            table.insert(v38, v41)
        end
    end
    local v42 = tick()
    local v43 = v_u_1.createPlan(v38, v35, v36)
    local v44 = tick()
    local v45 = v_u_2.runPlan(v43)
    local v46 = tick()
    v32.report(v45)
    local v47 = tick()
    if v34 then
        local v48 = {
            ("Took %f seconds to locate test modules"):format(v42 - v37),
            ("Took %f seconds to create test plan"):format(v44 - v42),
            ("Took %f seconds to run tests"):format(v46 - v44),
            ("Took %f seconds to report tests"):format(v47 - v46)
        }
        print(table.concat(v48, "\n"))
    end
    return v45
end
return v4