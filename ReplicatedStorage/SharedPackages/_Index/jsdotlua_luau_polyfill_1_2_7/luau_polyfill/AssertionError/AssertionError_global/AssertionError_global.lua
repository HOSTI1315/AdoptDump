--// ReplicatedStorage.SharedPackages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.AssertionError.AssertionError.global (ModuleScript)

local v1 = require(script.Parent.Parent.Parent:WaitForChild("collections"))
local v_u_2 = v1.Array
local v_u_3 = v1.Object
local v_u_4 = require(script.Parent.Parent.Parent:WaitForChild("boolean"))
local v_u_5 = require(script.Parent.Parent.Parent:WaitForChild("string"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local v_u_6 = v1.inspect
local v_u_7 = require(script.Parent.Parent:WaitForChild("Error"))
local v_u_8 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
local v_u_9 = {
    ["stderr"] = {
        ["isTTY"] = false,
        ["columns"] = 0,
        ["hasColors"] = function(...)
            return true
        end
    }
}
function ErrorCaptureStackTrace(p10, ...)
    v_u_7.captureStackTrace(p10, ...)
end
local v_u_11 = ""
local v_u_12 = ""
local v_u_13 = ""
local v_u_14 = ""
local v_u_15 = {
    ["deepStrictEqual"] = "Expected values to be strictly deep-equal:",
    ["strictEqual"] = "Expected values to be strictly equal:",
    ["strictEqualObject"] = "Expected \"actual\" to be reference-equal to \"expected\":",
    ["deepEqual"] = "Expected values to be loosely deep-equal:",
    ["notDeepStrictEqual"] = "Expected \"actual\" not to be strictly deep-equal to:",
    ["notStrictEqual"] = "Expected \"actual\" to be strictly unequal to:",
    ["notStrictEqualObject"] = "Expected \"actual\" not to be reference-equal to \"expected\":",
    ["notDeepEqual"] = "Expected \"actual\" not to be loosely deep-equal to:",
    ["notIdentical"] = "Values have same structure but are not reference-equal:",
    ["notDeepEqualUnequal"] = "Expected values not to be loosely deep-equal:"
}
local function v_u_55(p16, p17, p18)
    local v19 = ""
    local v20 = ""
    local v21 = ""
    local v22 = false
    local v23 = v_u_6(p16, {
        ["compact"] = false,
        ["customInspect"] = false,
        ["depth"] = 1000,
        ["maxArrayLength"] = (1 / 0),
        ["showHidden"] = false,
        ["showProxy"] = false,
        ["sorted"] = true,
        ["getters"] = true
    })
    local v24 = v_u_5.split(v23, "\n")
    local v25 = v_u_5.split(v_u_6(p17, {
        ["compact"] = false,
        ["customInspect"] = false,
        ["depth"] = 1000,
        ["maxArrayLength"] = (1 / 0),
        ["showHidden"] = false,
        ["showProxy"] = false,
        ["sorted"] = true,
        ["getters"] = true
    }), "\n")
    local v26 = 0
    local v27 = ""
    local v28 = p18 == "strictEqual" and (typeof(p16) == "table" and (p16 ~= nil and (typeof(p17) == "table" and p17 ~= nil)) or typeof(p16) == "function" and typeof(p17) == "function") and "strictEqualObject" or p18
    if #v24 == 1 and (#v25 == 1 and v24[1] ~= v25[1]) then
        local v29 = v24[1]
        local v30
        if v_u_4.toJSBoolean(false) then
            v30 = v25[1]
        else
            v30 = v25[1]
        end
        local v31 = string.len(v29) + string.len(v30)
        if v31 <= 12 then
            if (typeof(p16) ~= "table" or p16 == nil) and ((typeof(p17) ~= "table" or p17 == nil) and (p16 ~= 0 or p17 ~= 0)) then
                return ("%s\n\n"):format(v_u_15[v28]) .. ("%s !== %s\n"):format(v24[1], v25[1])
            end
        elseif v28 ~= "strictEqualObject" and v31 < (not v_u_9.stderr.isTTY and 80 or v_u_9.stderr.columns) then
            while true do
                local v32 = v26 + 1
                local v33 = v26 + 1
                local v34 = string.sub(v29, v32, v33)
                local v35 = v26 + 1
                local v36 = v26 + 1
                if v34 ~= string.sub(v30, v35, v36) then
                    break
                end
                v26 = v26 + 1
            end
            if v26 > 2 then
                v27 = ("\n  %s^"):format(string.rep(" ", v26))
                v26 = 0
            end
        end
    end
    local v37 = v24[#v24]
    local v38 = v25[#v25]
    while true do
        if v37 ~= v38 then
            v39 = v26
            break
        end
        local v39 = v26 + 1
        if v26 < 3 then
            v21 = ("\n  %s%s"):format(v37, v21)
        else
            v19 = v37
        end
        table.remove(v24)
        table.remove(v25)
        if #v24 == 0 or #v25 == 0 then
            break
        end
        v37 = v24[#v24]
        v38 = v25[#v25]
        v26 = v39
    end
    local v40 = #v24
    local v41 = #v25
    local v42 = math.max(v40, v41)
    if v42 == 0 then
        local v43 = v_u_5.split(v23, "\n")
        if #v43 > 50 then
            v43[47] = ("%s...%s"):format(v_u_11, v_u_14)
            while #v43 > 47 do
                table.remove(v43)
            end
        end
        return ("%s\n\n"):format(v_u_15.notIdentical) .. ("%s\n"):format(v_u_2.join(v43, "\n"))
    end
    if v39 >= 5 then
        v21 = ("\n%s...%s%s"):format(v_u_11, v_u_14, v21)
        v22 = true
    end
    if v19 ~= "" then
        v21 = ("\n  %s%s"):format(v19, v21)
        v19 = ""
    end
    local v44 = 0
    local v45 = 0
    local v46 = v_u_15[v28] .. ("\n%s+ actual%s %s- expected%s"):format(v_u_12, v_u_14, v_u_13, v_u_14)
    local v47 = (" %s...%s Lines skipped"):format(v_u_11, v_u_14)
    local v48 = ("%s+%s"):format(v_u_12, v_u_14)
    local v49 = #v25
    local v50
    if #v24 < v42 then
        v48 = ("%s-%s"):format(v_u_13, v_u_14)
        v49 = #v24
        v50 = v25
    else
        v50 = v24
    end
    for v51 = 1, v42 do
        if v49 < v51 then
            if v45 > 2 then
                if v45 > 3 then
                    if v45 > 4 then
                        if v45 == 5 then
                            v20 = v20 .. ("\n  %s"):format(v50[v51 - 3])
                            v44 = v44 + 1
                        else
                            v20 = v20 .. ("\n%s...%s"):format(v_u_11, v_u_14)
                            v22 = true
                        end
                    end
                    v20 = v20 .. ("\n  %s"):format(v50[v51 - 2])
                    v44 = v44 + 1
                end
                v20 = v20 .. ("\n  %s"):format(v50[v51 - 1])
                v44 = v44 + 1
            end
            v45 = 0
            if v50 == v24 then
                v20 = v20 .. ("\n%s %s"):format(v48, v50[v51])
            else
                v19 = v19 .. ("\n%s %s"):format(v48, v50[v51])
            end
            v44 = v44 + 1
        else
            local v52 = v25[v51]
            local v53 = v24[v51]
            local v54
            if v53 == v52 then
                v54 = false
            else
                v54 = not v_u_4.toJSBoolean(v_u_5.endsWith(v53, ",")) or v_u_5.slice(v53, 0, -1) ~= v52
            end
            if v54 and (v_u_5.endsWith(v52, ",") and v_u_5.slice(v52, 0, -1) == v53) then
                v53 = v53 .. ","
                v54 = false
            end
            if v54 then
                if v45 > 2 then
                    if v45 > 3 then
                        if v45 > 4 then
                            if v45 == 5 then
                                v20 = v20 .. ("\n  %s"):format(v24[v51 - 3])
                                v44 = v44 + 1
                            else
                                v20 = v20 .. ("\n%s...%s"):format(v_u_11, v_u_14)
                                v22 = true
                            end
                        end
                        v20 = v20 .. ("\n  %s"):format(v24[v51 - 2])
                        v44 = v44 + 1
                    end
                    v20 = v20 .. ("\n  %s"):format(v24[v51 - 1])
                    v44 = v44 + 1
                end
                v20 = v20 .. ("\n%s+%s %s"):format(v_u_12, v_u_14, v53)
                v19 = v19 .. ("\n%s-%s %s"):format(v_u_13, v_u_14, v52)
                v44 = v44 + 2
                v45 = 0
            else
                v20 = v20 .. v19
                v19 = ""
                v45 = v45 + 1
                if v45 <= 2 then
                    v20 = v20 .. ("\n  %s"):format(v53)
                    v44 = v44 + 1
                end
            end
        end
        if v44 > 50 and v51 < v42 - 2 then
            return ("%s%s\n%s\n%s...%s%s\n"):format(v46, v47, v20, v_u_11, v_u_14, v19) .. ("%s...%s"):format(v_u_11, v_u_14)
        end
    end
    return ("%s%s\n%s%s%s%s"):format(v46, not v22 and "" or v47, v20, v19, v21, v27)
end
local v_u_56 = setmetatable({}, {
    ["__index"] = v_u_7
})
v_u_56.__index = v_u_56
function v_u_56.__tostring(p57)
    return p57:toString()
end
function v_u_56.new(p58)
    local v59 = p58.message
    local v60 = p58.operator
    local v61 = p58.stackStartFn
    local v62 = p58.actual
    local v63 = p58.expected
    local v64
    if v59 == nil then
        if v_u_9.stderr.isTTY then
            if v_u_9.stderr:hasColors() then
                v_u_11 = "\27[34m"
                v_u_12 = "\27[32m"
                v_u_14 = "\27[39m"
                v_u_13 = "\27[31m"
            else
                v_u_11 = ""
                v_u_12 = ""
                v_u_14 = ""
                v_u_13 = ""
            end
        end
        local v65, v66
        if typeof(v62) == "table" and (v62 ~= nil and (typeof(v63) == "table" and (v63 ~= nil and (v_u_2.indexOf(v_u_3.keys(v62), "stack") ~= -1 and (v_u_8(v62, v_u_7) and (v_u_2.indexOf(v_u_3.keys(v63), "stack") ~= -1 and v_u_8(v63, v_u_7))))))) then
            v65 = {}
            for _, v67 in v_u_3.keys(v62) do
                v65[v67] = v62[v67]
            end
            v65.message = v62.message
            v66 = {}
            for _, v68 in v_u_3.keys(v63) do
                v66[v68] = v63[v68]
            end
            v66.message = v63.message
        else
            v66 = v63
            v65 = v62
        end
        if v60 == "deepStrictEqual" or v60 == "strictEqual" then
            local v69 = v_u_7.new(v_u_55(v65, v66, v60))
            local v70 = v_u_56
            v64 = setmetatable(v69, v70)
            v63 = v66
            v62 = v65
        elseif v60 == "notDeepStrictEqual" or v60 == "notStrictEqual" then
            local v71 = v_u_15[v60]
            local v72 = v_u_5.split(v_u_6(v65, {
                ["compact"] = false,
                ["customInspect"] = false,
                ["depth"] = 1000,
                ["maxArrayLength"] = (1 / 0),
                ["showHidden"] = false,
                ["showProxy"] = false,
                ["sorted"] = true,
                ["getters"] = true
            }), "\n")
            if v60 == "notStrictEqual" and (typeof(v65) == "table" and v65 ~= nil or typeof(v65) == "function") then
                v71 = v_u_15.notStrictEqualObject
            end
            if #v72 > 50 then
                v72[47] = ("%s...%s"):format(v_u_11, v_u_14)
                while #v72 > 47 do
                    table.remove(v72)
                end
            end
            if #v72 == 1 then
                local v73 = v_u_7.new
                local v74 = v72[1]
                local v75 = v73(("%s%s%s"):format(v71, string.len(v74) > 5 and "\n\n" or " ", v72[1]))
                local v76 = v_u_56
                v64 = setmetatable(v75, v76)
                v63 = v66
                v62 = v65
            else
                local v77 = v_u_7.new(("%s\n\n%s\n"):format(v71, v_u_2.join(v72, "\n")))
                local v78 = v_u_56
                v64 = setmetatable(v77, v78)
                v63 = v66
                v62 = v65
            end
        else
            local v79 = v_u_6(v65, {
                ["compact"] = false,
                ["customInspect"] = false,
                ["depth"] = 1000,
                ["maxArrayLength"] = (1 / 0),
                ["showHidden"] = false,
                ["showProxy"] = false,
                ["sorted"] = true,
                ["getters"] = true
            })
            local v80 = v_u_6(v66, {
                ["compact"] = false,
                ["customInspect"] = false,
                ["depth"] = 1000,
                ["maxArrayLength"] = (1 / 0),
                ["showHidden"] = false,
                ["showProxy"] = false,
                ["sorted"] = true,
                ["getters"] = true
            })
            local v81 = v_u_15[tostring(v60)]
            if v60 == "notDeepEqual" and v79 == v80 then
                local v82 = ("%s\n\n%s"):format(v81, v79)
                if string.len(v82) > 1024 then
                    v82 = ("%s..."):format(v_u_5.slice(v82, 0, 1021))
                end
                local v83 = v_u_7.new(v82)
                local v84 = v_u_56
                v64 = setmetatable(v83, v84)
                v63 = v66
                v62 = v65
            else
                if string.len(v79) > 512 then
                    v79 = ("%s..."):format(v_u_5.slice(v79, 0, 509))
                end
                if string.len(v80) > 512 then
                    v80 = ("%s..."):format(v_u_5.slice(v80, 0, 509))
                end
                if v60 == "deepEqual" then
                    v79 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v81, v79)
                else
                    local v85 = v_u_15[("%sUnequal"):format((tostring(v60)))]
                    if v_u_4.toJSBoolean(v85) then
                        v79 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v85, v79)
                    else
                        v80 = (" %s %s"):format(tostring(v60), v80)
                    end
                end
                local v86 = v_u_7.new(("%s%s"):format(v79, v80))
                local v87 = v_u_56
                v64 = setmetatable(v86, v87)
                v63 = v66
                v62 = v65
            end
        end
    else
        local v88 = v_u_7.new((tostring(v59)))
        local v89 = v_u_56
        v64 = setmetatable(v88, v89)
    end
    v64.generatedMessage = not v_u_4.toJSBoolean(v59)
    v64.name = "AssertionError [ERR_ASSERTION]"
    v64.code = "ERR_ASSERTION"
    v64.actual = v62
    v64.expected = v63
    v64.operator = v60
    ErrorCaptureStackTrace(v64, v61 or v_u_56.new)
    v64.name = "AssertionError"
    return v64
end
function v_u_56.toString(p90)
    return ("%s [%s]: %s"):format(p90.name, p90.code, p90.message)
end
v_u_56.name = "AssertionError"
return {
    ["AssertionError"] = v_u_56
}