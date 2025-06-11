--// ReplicatedStorage.SharedPackages._Index.uplift-internal_inspect@3.1.0.inspect (ModuleScript)

local v_u_1 = {
    ["_VERSION"] = "inspect.lua 3.1.0",
    ["_URL"] = "http://github.com/kikito/inspect.lua",
    ["_DESCRIPTION"] = "human-readable representations of tables",
    ["_LICENSE"] = "    MIT LICENSE\n\n    Copyright (c) 2013 Enrique Garc\195\173a Cota\n\n    Permission is hereby granted, free of charge, to any person obtaining a\n    copy of this software and associated documentation files (the\n    \"Software\"), to deal in the Software without restriction, including\n    without limitation the rights to use, copy, modify, merge, publish,\n    distribute, sublicense, and/or sell copies of the Software, and to\n    permit persons to whom the Software is furnished to do so, subject to\n    the following conditions:\n\n    The above copyright notice and this permission notice shall be included\n    in all copies or substantial portions of the Software.\n\n    THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n  "
}
local v_u_2 = tostring
v_u_1.KEY = setmetatable({}, {
    ["__tostring"] = function()
        return "inspect.KEY"
    end
})
v_u_1.METATABLE = setmetatable({}, {
    ["__tostring"] = function()
        return "inspect.METATABLE"
    end
})
local v_u_3 = {
    ["\7"] = "\\a",
    ["\8"] = "\\b",
    ["\f"] = "\\f",
    ["\n"] = "\\n",
    ["\r"] = "\\r",
    ["\t"] = "\\t",
    ["\11"] = "\\v"
}
local v_u_4 = {}
for v5 = 0, 31 do
    local v6 = string.char(v5)
    if not v_u_3[v6] then
        v_u_3[v6] = "\\" .. v5
        v_u_4[v6] = string.format("\\%03d", v5)
    end
end
local v_u_7 = {
    ["number"] = 1,
    ["boolean"] = 2,
    ["string"] = 3,
    ["table"] = 4,
    ["function"] = 5,
    ["userdata"] = 6,
    ["thread"] = 7
}
local function v_u_14(p8, p9)
    local v10 = type(p8)
    local v11 = type(p9)
    if v10 == v11 and (v10 == "string" or v10 == "number") then
        return p8 < p9
    else
        local v12 = v_u_7[v10]
        local v13 = v_u_7[v11]
        if v12 and v13 then
            return v_u_7[v10] < v_u_7[v11]
        elseif v12 then
            return true
        elseif v13 then
            return false
        else
            return v10 < v11
        end
    end
end
local function v_u_23(p15)
    local v16 = 1
    local v17 = rawget(p15, v16)
    local v18 = 0
    local v19 = {}
    while v17 ~= nil do
        v16 = v16 + 1
        v17 = rawget(p15, v16)
    end
    local v20 = v16 - 1
    for v21, _ in next, p15 do
        local v22
        if type(v21) == "number" and (v21 >= 1 and v21 <= v20) then
            v22 = math.floor(v21) == v21
        else
            v22 = false
        end
        if not v22 then
            v18 = v18 + 1
            v19[v18] = v21
        end
    end
    table.sort(v19, v_u_14)
    return v19, v18, v20
end
local function v_u_29(p24, p25)
    local v26 = p25 or {}
    if type(p24) == "table" then
        if not v26[p24] then
            v26[p24] = 1
            for v27, v28 in next, p24 do
                v_u_29(v27, v26)
                v_u_29(v28, v26)
            end
            v_u_29(getmetatable(p24), v26)
            return v26
        end
        v26[p24] = v26[p24] + 1
    end
    return v26
end
local function v_u_36(p30, ...)
    local v31 = #p30
    local v32 = {}
    local v33 = { ... }
    for v34 = 1, v31 do
        v32[v34] = p30[v34]
    end
    for v35 = 1, #v33 do
        v32[v31 + v35] = v33[v35]
    end
    return v32
end
local function v_u_47(p37, p38, p39, p40)
    if p38 == nil then
        return nil
    end
    if p40[p38] then
        return p40[p38]
    end
    local v41 = p37(p38, p39)
    local v42
    if type(v41) == "table" then
        v42 = {}
        p40[p38] = v42
        for v43, v44 in next, v41 do
            local v45 = v_u_47(p37, v43, v_u_36(p39, v43, v_u_1.KEY), p40)
            if v45 ~= nil then
                v42[v45] = v_u_47(p37, v44, v_u_36(p39, v45), p40)
            end
        end
        local v46 = v_u_47(p37, getmetatable(v41), v_u_36(p39, v_u_1.METATABLE), p40)
        if type(v46) ~= "table" then
            v46 = nil
        end
        setmetatable(v42, v46)
    else
        v42 = v41
    end
    return v42
end
local v48 = {}
local v_u_49 = {
    ["__index"] = v48
}
function v48.puts(p50, ...)
    local v51 = { ... }
    local v52 = p50.buffer
    local v53 = #v52
    for v54 = 1, #v51 do
        v53 = v53 + 1
        v52[v53] = v51[v54]
    end
end
function v48.down(p55, p56)
    p55.level = p55.level + 1
    p56()
    p55.level = p55.level - 1
end
function v48.tabify(p57)
    p57:puts(p57.newline, string.rep(p57.indent, p57.level))
end
function v48.alreadyVisited(p58, p59)
    return p58.ids[p59] ~= nil
end
function v48.getId(p60, p61)
    local v62 = p60.ids[p61]
    if not v62 then
        local v63 = type(p61)
        v62 = (p60.maxIds[v63] or 0) + 1
        p60.maxIds[v63] = v62
        p60.ids[p61] = v62
    end
    return v_u_2(v62)
end
function v48.putKey(p64, p65)
    local v66
    if type(p65) == "string" then
        v66 = p65:match("^[_%a][_%a%d]*$")
    else
        v66 = false
    end
    if v66 then
        return p64:puts(p65)
    end
    p64:puts("[")
    p64:putValue(p65)
    p64:puts("]")
end
function v48.putTable(p_u_67, p_u_68)
    if p_u_68 == v_u_1.KEY or p_u_68 == v_u_1.METATABLE then
        p_u_67:puts((v_u_2(p_u_68)))
        return
    elseif p_u_67:alreadyVisited(p_u_68) then
        p_u_67:puts("<table ", p_u_67:getId(p_u_68), ">")
        return
    elseif p_u_67.level >= p_u_67.depth then
        p_u_67:puts("{...}")
    else
        if p_u_67.tableAppearances[p_u_68] > 1 then
            p_u_67:puts("<", p_u_67:getId(p_u_68), ">")
        end
        local v_u_69, v_u_70, v_u_71 = v_u_23(p_u_68)
        local v_u_72 = getmetatable(p_u_68)
        p_u_67:puts("{")
        p_u_67:down(function()
            local v73 = 0
            for v74 = 1, v_u_71 do
                if v73 > 0 then
                    p_u_67:puts(",")
                end
                p_u_67:puts(" ")
                p_u_67:putValue(p_u_68[v74])
                v73 = v73 + 1
            end
            for v75 = 1, v_u_70 do
                local v76 = v_u_69[v75]
                if v73 > 0 then
                    p_u_67:puts(",")
                end
                p_u_67:tabify()
                p_u_67:putKey(v76)
                p_u_67:puts(" = ")
                p_u_67:putValue(p_u_68[v76])
                v73 = v73 + 1
            end
            local v77 = v_u_72
            if type(v77) == "table" then
                if v73 > 0 then
                    p_u_67:puts(",")
                end
                p_u_67:tabify()
                p_u_67:puts("<metatable> = ")
                p_u_67:putValue(v_u_72)
            end
        end)
        if v_u_70 > 0 or type(v_u_72) == "table" then
            p_u_67:tabify()
        elseif v_u_71 > 0 then
            p_u_67:puts(" ")
        end
        p_u_67:puts("}")
    end
end
function v48.putValue(p78, p79)
    local v80 = type(p79)
    if v80 == "string" then
        local v81 = p79:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", v_u_4):gsub("%c", v_u_3)
        local v82
        if v81:match("\"") and not v81:match("\'") then
            v82 = "\'" .. v81 .. "\'"
        else
            v82 = "\"" .. v81:gsub("\"", "\\\"") .. "\""
        end
        p78:puts(v82)
        return
    elseif v80 == "number" or (v80 == "boolean" or (v80 == "nil" or (v80 == "cdata" or v80 == "ctype"))) then
        p78:puts((v_u_2(p79)))
        return
    elseif v80 == "table" then
        p78:putTable(p79)
    else
        p78:puts("<", v80, " ", p78:getId(p79), ">")
    end
end
function v_u_1.inspect(p83, p84)
    local v85 = p84 or {}
    local v86 = v85.depth or (1 / 0)
    local v87 = v85.newline or "\n"
    local v88 = v85.indent or "  "
    local v89 = v85.process
    if v89 then
        p83 = v_u_47(v89, p83, {}, {})
    end
    local v90 = {
        ["depth"] = v86,
        ["level"] = 0,
        ["buffer"] = {},
        ["ids"] = {},
        ["maxIds"] = {},
        ["newline"] = v87,
        ["indent"] = v88,
        ["tableAppearances"] = v_u_29(p83)
    }
    local v91 = v_u_49
    local v92 = setmetatable(v90, v91)
    v92:putValue(p83)
    return table.concat(v92.buffer)
end
setmetatable(v_u_1, {
    ["__call"] = function(_, ...)
        return v_u_1.inspect(...)
    end
})
return v_u_1