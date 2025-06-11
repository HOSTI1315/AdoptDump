--// ReplicatedStorage.CmdrClient.Shared.Util (ModuleScript)

local v_u_1 = game:GetService("TextService")
local v_u_36 = {
    ["MakeDictionary"] = function(p2)
        local v3 = {}
        for v4 = 1, #p2 do
            v3[p2[v4]] = true
        end
        return v3
    end,
    ["DictionaryKeys"] = function(p5)
        local v6 = {}
        for v7 in pairs(p5) do
            table.insert(v6, v7)
        end
        return v6
    end,
    ["MakeFuzzyFinder"] = function(p8)
        local v_u_9 = nil
        local v_u_10 = {}
        if typeof(p8) == "Enum" then
            p8 = p8:GetEnumItems()
        end
        if typeof(p8) == "Instance" then
            v_u_10 = p8:GetChildren()
            v_u_9 = {}
            for v11 = 1, #v_u_10 do
                v_u_9[v11] = v_u_10[v11].Name
            end
            ::l8::
            return function(p12, p13, p14)
                local v15 = {}
                for v16, v17 in pairs(v_u_9) do
                    local v18
                    if v_u_10 then
                        v18 = v_u_10[v16] or v17
                    else
                        v18 = v17
                    end
                    if v17:lower() == p12:lower() then
                        if p13 then
                            return v18
                        end
                        table.insert(v15, 1, v18)
                    elseif p14 then
                        if v17:lower():sub(1, #p12) == p12:lower() then
                            v15[#v15 + 1] = v18
                        end
                    elseif v17:lower():find(p12:lower(), 1, true) then
                        v15[#v15 + 1] = v18
                    end
                end
                if p13 then
                    return v15[1]
                else
                    return v15
                end
            end
        end
        if typeof(p8) ~= "table" then
            error("[Cmdr] MakeFuzzyFinder only accepts a table, Enum, or Instance.")
            goto l8
        end
        local v19 = p8[1]
        if typeof(v19) ~= "Instance" then
            local v20 = p8[1]
            if typeof(v20) ~= "EnumItem" then
                local v21 = p8[1]
                if typeof(v21) ~= "table" then
                    ::l15::
                    local v22 = p8[1]
                    if type(v22) == "string" then
                        v_u_9 = p8
                    elseif p8[1] == nil then
                        v_u_9 = {}
                    else
                        error("[Cmdr] MakeFuzzyFinder only accepts tables of instances or strings.")
                    end
                    goto l8
                end
                local v23 = p8[1].Name
                if typeof(v23) ~= "string" then
                    goto l15
                end
            end
        end
        v_u_9 = {}
        v_u_10 = p8
        for v24 = 1, #p8 do
            v_u_9[v24] = v_u_10[v24].Name
            p8 = v_u_10
            v_u_10 = p8
        end
        goto l8
    end,
    ["GetNames"] = function(p25)
        local v26 = {}
        for v27 = 1, #p25 do
            local v28 = p25[v27].Name
            if not v28 then
                local v29 = p25[v27]
                v28 = tostring(v29)
            end
            v26[v27] = v28
        end
        return v26
    end,
    ["SplitStringSimple"] = function(p30, p31)
        local v32 = p31 == nil and "%s" or p31
        local v33 = {}
        local v34 = 1
        for v35 in string.gmatch(p30, "([^" .. v32 .. "]+)") do
            v33[v34] = v35
            v34 = v34 + 1
        end
        return v33
    end
}
local function v_u_38(p37)
    return utf8.char((tonumber(p37, 16)))
end
function v_u_36.ParseEscapeSequences(p39)
    return p39:gsub("\\(.)", {
        ["t"] = "\t",
        ["n"] = "\n"
    }):gsub("\\u(%x%x%x%x)", v_u_38):gsub("\\x(%x%x)", v_u_38)
end
function v_u_36.EncodeEscapedOperator(p40, p41)
    local v42 = p41:sub(1, 1)
    local v43 = p41:gsub(".", "%%%1")
    return p40:gsub("(" .. ("%" .. v42) .. "+)(" .. v43 .. ")", function(p44, p45)
        return (p44:sub(1, #p44 - 1) .. p45):gsub(".", function(p46)
            return "\\u" .. string.format("%04x", string.byte(p46), 16)
        end)
    end)
end
local v_u_47 = { "&&", "||", ";" }
function v_u_36.EncodeEscapedOperators(p48)
    for _, v49 in ipairs(v_u_47) do
        p48 = v_u_36.EncodeEscapedOperator(p48, v49)
    end
    return p48
end
function v_u_36.SplitString(p50, p51)
    local v52 = nil
    local v53 = nil
    local v54 = {}
    local v55 = p51 or (1 / 0)
    for v56 in p50:gsub("\\\\", "___!CMDR_ESCAPE!___"):gsub("\\\"", "___!CMDR_QUOTE!___"):gsub("\\\'", "___!CMDR_SQUOTE!___"):gsub("\\\n", "___!CMDR_NL!___"):gmatch("[^ ]+") do
        local v57 = v_u_36.ParseEscapeSequences(v56)
        local v58 = v57:match("^([\'\"])")
        local v59 = v57:match("([\'\"])$")
        local v60 = v57:match("(\\*)[\'\"]$")
        if v58 and not (v52 or v59) then
            v52 = v58
            v53 = v57
        elseif v53 and (v59 == v52 and #v60 % 2 == 0) then
            v57 = v53 .. " " .. v57
            v53 = nil
            v52 = nil
        elseif v53 then
            v53 = v53 .. " " .. v57
        end
        if not v53 then
            v54[#v54 + (v55 < #v54 and 0 or 1)] = v57:gsub("^([\'\"])", ""):gsub("([\'\"])$", ""):gsub("___!CMDR_ESCAPE!___", "\\"):gsub("___!CMDR_QUOTE!___", "\""):gsub("___!CMDR_NL!___", "\n")
        end
    end
    if v53 then
        v54[#v54 + (v55 < #v54 and 0 or 1)] = v53:gsub("___!CMDR_ESCAPE!___", "\\"):gsub("___!CMDR_QUOTE!___", "\""):gsub("___!CMDR_NL!___", "\n")
    end
    return v54
end
function v_u_36.MashExcessArguments(p61, p62)
    local v63 = {}
    for v64 = 1, #p61 do
        if p62 < v64 then
            v63[p62] = ("%s %s"):format(v63[p62] or "", p61[v64])
        else
            v63[v64] = p61[v64]
        end
    end
    return v63
end
function v_u_36.TrimString(p65)
    local _, v66 = string.find(p65, "^%s*")
    return v66 == #p65 and "" or string.match(p65, ".*%S", v66 + 1)
end
function v_u_36.GetTextSize(p67, p68, p69)
    return v_u_1:GetTextSize(p67, p68.TextSize, p68.Font, p69 or Vector2.new(p68.AbsoluteSize.X, 0))
end
function v_u_36.MakeEnumType(p_u_70, p71)
    local v_u_72 = v_u_36.MakeFuzzyFinder(p71)
    return {
        ["Validate"] = function(p73)
            return v_u_72(p73, true) ~= nil, ("Value %q is not a valid %s."):format(p73, p_u_70)
        end,
        ["Autocomplete"] = function(p74)
            local v75 = v_u_72(p74)
            local v76 = v75[1]
            if type(v76) ~= "string" then
                v75 = v_u_36.GetNames(v75) or v75
            end
            return v75
        end,
        ["Parse"] = function(p77)
            return v_u_72(p77, true)
        end
    }
end
function v_u_36.ParsePrefixedUnionType(p78, p79)
    local v80 = v_u_36.SplitStringSimple(p78)
    local v81 = {}
    for v82 = 1, #v80, 2 do
        v81[#v81 + 1] = {
            ["prefix"] = v80[v82 - 1] or "",
            ["type"] = v80[v82]
        }
    end
    table.sort(v81, function(p83, p84)
        return #p83.prefix > #p84.prefix
    end)
    for v85 = 1, #v81 do
        local v86 = v81[v85]
        if p79:sub(1, #v86.prefix) == v86.prefix then
            return v86.type, p79:sub(#v86.prefix + 1), v86.prefix
        end
    end
end
function v_u_36.MakeListableType(p_u_87, p88)
    local v89 = {
        ["Listable"] = true,
        ["Transform"] = p_u_87.Transform,
        ["Validate"] = p_u_87.Validate,
        ["ValidateOnce"] = p_u_87.ValidateOnce,
        ["Autocomplete"] = p_u_87.Autocomplete,
        ["Default"] = p_u_87.Default,
        ["ArgumentOperatorAliases"] = p_u_87.ArgumentOperatorAliases,
        ["Parse"] = function(...)
            return { p_u_87.Parse(...) }
        end
    }
    if p88 then
        for v90, v91 in pairs(p88) do
            v89[v90] = v91
        end
    end
    return v89
end
function v_u_36.RunCommandString(p92, p93)
    local v94 = v_u_36.ParseEscapeSequences(p93)
    local v95 = v_u_36.EncodeEscapedOperators(v94):split("&&")
    local v96 = ""
    for v97, v98 in ipairs(v95) do
        local v99 = v96:gsub("%$", "\\x24"):gsub("%%", "%%%%")
        local v100 = "||"
        if v96:find("%s") then
            v99 = ("%q"):format(v99) or v99
        end
        local v101 = v98:gsub(v100, v99)
        local v102 = v_u_36.RunEmbeddedCommands(p92, v101)
        v96 = tostring(p92:EvaluateAndRun(v102))
        if v97 == #v95 then
            return v96
        end
    end
end
function v_u_36.RunEmbeddedCommands(p103, p104)
    local v105 = p104:gsub("\\%$", "___!CMDR_DOLLAR!___")
    local v106 = {}
    for v107 in v105:gmatch("$(%b{})") do
        local v108 = v107:sub(2, #v107 - 1)
        local v109
        if v108:match("^{.+}$") then
            v108 = v108:sub(2, #v108 - 1)
            v109 = false
        else
            v109 = true
        end
        v106[v107] = v_u_36.RunCommandString(p103, v108)
        if v109 and (v106[v107]:find("%s") or v106[v107] == "") then
            v106[v107] = string.format("%q", v106[v107])
        end
    end
    return v105:gsub("$(%b{})", v106):gsub("___!CMDR_DOLLAR!___", "$")
end
function v_u_36.SubstituteArgs(p110, p111)
    local v112 = p110:gsub("\\%$", "___!CMDR_DOLLAR!___")
    if type(p111) == "table" then
        for v113 = 1, #p111 do
            local v114 = tostring(v113)
            p111[v114] = p111[v113]
            if p111[v114]:find("%s") then
                p111[v114] = string.format("%q", p111[v114])
            end
        end
    end
    return v112:gsub("($%d+)%b{}", "%1"):gsub("$(%w+)", p111):gsub("___!CMDR_DOLLAR!___", "$")
end
function v_u_36.MakeAliasCommand(p115, p116)
    local v117, v118 = unpack(p115:split("|"))
    local v_u_119 = v_u_36.EncodeEscapedOperators(p116)
    local v120 = {}
    local v121 = {}
    for v122 in v_u_119:gmatch("$(%d+)") do
        if v120[v122] == nil then
            v120[v122] = true
            local v123 = v_u_119:match((("$%*(%%b{})"):format(v122)))
            local v124, v125, v126
            if v123 then
                local v127 = v123:sub(2, #v123 - 1)
                v124, v125, v126 = unpack(v127:split("|"))
            else
                v124 = nil
                v125 = nil
                v126 = nil
            end
            local v128
            if v124 then
                v128 = v124:match("%?$") and true or false
            else
                v128 = v124
            end
            local v129 = not v124 and "string" or v124:match("^%w+")
            local v130 = v125 or ("Argument %*"):format(v122)
            table.insert(v121, {
                ["Type"] = v129,
                ["Name"] = v130,
                ["Description"] = v126 or "",
                ["Optional"] = v128
            })
        end
    end
    return {
        ["Name"] = v117,
        ["Aliases"] = {},
        ["Description"] = ("<Alias> %*"):format(v118 or v_u_119),
        ["Group"] = "UserAlias",
        ["Args"] = v121,
        ["ClientRun"] = function(p131)
            return v_u_36.RunCommandString(p131.Dispatcher, v_u_36.SubstituteArgs(v_u_119, p131.RawArguments))
        end
    }
end
function v_u_36.MakeSequenceType(p132)
    local v_u_133 = p132 or {}
    local v134 = v_u_133.Parse ~= nil and true or v_u_133.Constructor ~= nil
    assert(v134, "[Cmdr] MakeSequenceType: Must provide one of: Constructor, Parse")
    v_u_133.TransformEach = v_u_133.TransformEach or function(...)
        return ...
    end
    v_u_133.ValidateEach = v_u_133.ValidateEach or function()
        return true
    end
    return {
        ["Prefixes"] = v_u_133.Prefixes,
        ["Transform"] = function(p135)
            return v_u_36.Map(v_u_36.SplitPrioritizedDelimeter(p135, { ",", "%s" }), function(p136)
                return v_u_133.TransformEach(p136)
            end)
        end,
        ["Validate"] = function(p137)
            if v_u_133.Length and #p137 > v_u_133.Length then
                return false, ("Maximum of %d values allowed in sequence"):format(v_u_133.Length)
            end
            for v138 = 1, v_u_133.Length or #p137 do
                local v139, v140 = v_u_133.ValidateEach(p137[v138], v138)
                if not v139 then
                    return false, v140
                end
            end
            return true
        end,
        ["Parse"] = v_u_133.Parse or function(p141)
            return v_u_133.Constructor(unpack(p141))
        end
    }
end
function v_u_36.SplitPrioritizedDelimeter(p142, p143)
    for v144, v145 in ipairs(p143) do
        if p142:find(v145) or v144 == #p143 then
            return v_u_36.SplitStringSimple(p142, v145)
        end
    end
end
function v_u_36.Map(p146, p147)
    local v148 = {}
    for v149, v150 in ipairs(p146) do
        v148[v149] = p147(v150, v149)
    end
    return v148
end
function v_u_36.Each(p151, ...)
    local v152 = {}
    for v153, v154 in ipairs({ ... }) do
        v152[v153] = p151(v154)
    end
    return unpack(v152)
end
function v_u_36.EmulateTabstops(p155, p156)
    local v157 = #p155
    local v158 = table.create(v157)
    local v159 = 0
    for v160 = 1, v157 do
        local v161 = string.sub(p155, v160, v160)
        if v161 == "\t" then
            local v162 = p156 - v159 % p156
            local v163 = string.rep
            table.insert(v158, v163(" ", v162))
            v159 = v159 + v162
        else
            table.insert(v158, v161)
            if v161 == "\n" then
                v159 = 0
            elseif v161 ~= "\r" then
                v159 = v159 + 1
            end
        end
    end
    return table.concat(v158)
end
function v_u_36.Mutex()
    local v_u_164 = {}
    local v_u_165 = false
    return function()
        if v_u_165 then
            local v166 = v_u_164
            local v167 = coroutine.running
            table.insert(v166, v167())
            coroutine.yield()
        else
            v_u_165 = true
        end
        return function()
            if #v_u_164 > 0 then
                coroutine.resume(table.remove(v_u_164, 1))
            else
                v_u_165 = false
            end
        end
    end
end
return v_u_36