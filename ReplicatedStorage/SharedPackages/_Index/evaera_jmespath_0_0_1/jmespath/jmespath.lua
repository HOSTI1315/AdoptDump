--// ReplicatedStorage.SharedPackages._Index.evaera_jmespath@0.0.1.jmespath (ModuleScript)

local v_u_1 = game:GetService("HttpService")
local v_u_46 = (function()
    local v_u_3 = {
        ["new"] = function()
            local v2 = {
                ["__index"] = v_u_3
            }
            return setmetatable({}, v2)
        end
    }
    local v_u_11 = (function()
        local v4 = {
            ["simple"] = {
                [" "] = "ws",
                ["\n"] = "ws",
                ["\t"] = "ws",
                ["\r"] = "ws",
                ["."] = "dot",
                ["*"] = "star",
                [","] = "comma",
                [":"] = "colon",
                ["{"] = "lbrace",
                ["}"] = "rbrace",
                ["]"] = "rbracket",
                ["("] = "lparen",
                [")"] = "rparen",
                ["@"] = "current",
                ["&"] = "expref"
            },
            ["numbers"] = {
                ["0"] = 1,
                ["1"] = 1,
                ["2"] = 1,
                ["3"] = 1,
                ["4"] = 1,
                ["5"] = 1,
                ["6"] = 1,
                ["7"] = 1,
                ["8"] = 1,
                ["9"] = 1
            },
            ["identifier_start"] = {
                ["a"] = 1,
                ["b"] = 1,
                ["c"] = 1,
                ["d"] = 1,
                ["e"] = 1,
                ["f"] = 1,
                ["g"] = 1,
                ["h"] = 1,
                ["i"] = 1,
                ["j"] = 1,
                ["k"] = 1,
                ["l"] = 1,
                ["m"] = 1,
                ["n"] = 1,
                ["o"] = 1,
                ["p"] = 1,
                ["q"] = 1,
                ["r"] = 1,
                ["s"] = 1,
                ["t"] = 1,
                ["u"] = 1,
                ["v"] = 1,
                ["w"] = 1,
                ["x"] = 1,
                ["y"] = 1,
                ["z"] = 1,
                ["A"] = 1,
                ["B"] = 1,
                ["C"] = 1,
                ["D"] = 1,
                ["E"] = 1,
                ["F"] = 1,
                ["G"] = 1,
                ["H"] = 1,
                ["I"] = 1,
                ["J"] = 1,
                ["K"] = 1,
                ["L"] = 1,
                ["M"] = 1,
                ["N"] = 1,
                ["O"] = 1,
                ["P"] = 1,
                ["Q"] = 1,
                ["R"] = 1,
                ["S"] = 1,
                ["T"] = 1,
                ["U"] = 1,
                ["V"] = 1,
                ["W"] = 1,
                ["X"] = 1,
                ["Y"] = 1,
                ["Z"] = 1,
                ["_"] = 1
            },
            ["operator_start"] = {
                ["="] = 1,
                ["<"] = 1,
                [">"] = 1,
                ["!"] = 1
            },
            ["json_decode_char"] = {
                ["\""] = 1,
                ["["] = 1,
                ["{"] = 1
            }
        }
        local function v10(p5, p6)
            local v7 = {}
            for v8, _ in pairs(p5) do
                v7[v8] = true
            end
            for v9, _ in pairs(p6) do
                v7[v9] = true
            end
            return v7
        end
        v4.identifiers = v10(v4.identifier_start, v4.numbers)
        v4.identifiers["-"] = true
        v4.operators = v10(v4.operator_start, {
            ["<="] = 1,
            [">="] = 1,
            ["!="] = 1,
            ["=="] = 1
        })
        v4.json_numbers = v10(v4.numbers, {
            ["-"] = 1
        })
        return v4
    end)()
    local function v_u_15(p12)
        local v13 = { p12.c }
        local v14 = p12.pos
        p12.c = p12.token_iter()
        if p12.c ~= "" then
            p12.pos = p12.pos + 1
        end
        while v_u_11.identifiers[p12.c] do
            v13[#v13 + 1] = p12.c
            p12.c = p12.token_iter()
            if p12.c ~= "" then
                p12.pos = p12.pos + 1
            end
        end
        return {
            ["pos"] = v14,
            ["type"] = "identifier",
            ["value"] = table.concat(v13)
        }
    end
    local function v_u_21(p16)
        local v17 = { p16.c }
        local v18 = p16.pos
        p16.c = p16.token_iter()
        if p16.c ~= "" then
            p16.pos = p16.pos + 1
        end
        while v_u_11.numbers[p16.c] do
            v17[#v17 + 1] = p16.c
            p16.c = p16.token_iter()
            if p16.c ~= "" then
                p16.pos = p16.pos + 1
            end
        end
        local v19 = {
            ["pos"] = v18,
            ["type"] = "number"
        }
        local v20 = table.concat
        v19.value = tonumber(v20(v17))
        return v19
    end
    local function v_u_23(p22)
        p22.c = p22.token_iter()
        if p22.c ~= "" then
            p22.pos = p22.pos + 1
        end
        if p22.c == "]" then
            p22.c = p22.token_iter()
            if p22.c ~= "" then
                p22.pos = p22.pos + 1
            end
            return {
                ["pos"] = p22.pos - 1,
                ["type"] = "flatten",
                ["value"] = "[]"
            }
        end
        if p22.c ~= "?" then
            return {
                ["pos"] = p22.pos - 1,
                ["type"] = "lbracket",
                ["value"] = "["
            }
        end
        p22.c = p22.token_iter()
        if p22.c ~= "" then
            p22.pos = p22.pos + 1
        end
        return {
            ["pos"] = p22.pos - 1,
            ["type"] = "filter",
            ["value"] = "[?"
        }
    end
    local function v_u_26(p24)
        local v25 = {
            ["type"] = "comparator",
            ["pos"] = p24.pos,
            ["value"] = p24.c
        }
        p24.c = p24.token_iter()
        if p24.c ~= "" then
            p24.pos = p24.pos + 1
        end
        if p24.c == "=" then
            p24.c = p24.token_iter()
            if p24.c ~= "" then
                p24.pos = p24.pos + 1
            end
            v25.value = v25.value .. "="
        elseif v25.value == "=" then
            error("Expected ==, got =")
        end
        if not v_u_11.operators[v25.value] then
            error("Invalid operator: " .. v25.value)
        end
        return v25
    end
    local function v_u_28(p27)
        p27.c = p27.token_iter()
        if p27.c ~= "" then
            p27.pos = p27.pos + 1
        end
        if p27.c ~= "|" then
            return {
                ["type"] = "pipe",
                ["value"] = "|",
                ["pos"] = p27.pos - 1
            }
        end
        p27.c = p27.token_iter()
        if p27.c ~= "" then
            p27.pos = p27.pos + 1
        end
        return {
            ["type"] = "or",
            ["value"] = "||",
            ["pos"] = p27.pos - 2
        }
    end
    local function v_u_36(p29, p30, p31)
        local v32 = p29.pos
        local v33 = {}
        p29.c = p29.token_iter()
        if p29.c ~= "" then
            p29.pos = p29.pos + 1
        end
        if p31 then
            while p29.c == " " do
                p29.c = p29.token_iter()
                if p29.c ~= "" then
                    p29.pos = p29.pos + 1
                end
            end
        end
        while p29.c and p29.c ~= p30 do
            if p29.c == "\\" then
                p29.c = p29.token_iter()
                if p29.c ~= "" then
                    p29.pos = p29.pos + 1
                end
                v33[#v33 + 1] = "\\"
            end
            v33[#v33 + 1] = p29.c
            p29.c = p29.token_iter()
            if p29.c ~= "" then
                p29.pos = p29.pos + 1
            end
        end
        if p29.c ~= p30 then
            local v34 = error
            local v35 = p29.c
            v34("Expected `" .. p30 .. "` but found " .. tostring(v35) .. " at character #" .. p29.pos)
        end
        p29.c = p29.token_iter()
        if p29.c ~= "" then
            p29.pos = p29.pos + 1
        end
        return {
            ["value"] = table.concat(v33),
            ["pos"] = v32
        }
    end
    local function v_u_40(p37)
        local v38 = v_u_36(p37, "`", true)
        local v39 = v38.value:sub(1, 1)
        v38.type = "literal"
        if v_u_11.json_decode_char[v39] or v_u_11.json_numbers[v39] then
            v38.value = v_u_1:JSONDecode(v38.value)
            return v38
        elseif v38.value == "null" then
            v38.value = nil
            return v38
        elseif v38.value == "true" then
            v38.value = true
            return v38
        elseif v38.value == "false" then
            v38.value = false
            return v38
        else
            v38.value = v_u_1:JSONDecode("\"" .. v38.value .. "\"")
            return v38
        end
    end
    function v_u_3.tokenize(p41, p42)
        local v43 = {}
        p41.token_iter = p42:gmatch(".")
        p41.pos = 0
        p41.c = p41.token_iter()
        if p41.c ~= "" then
            p41.pos = p41.pos + 1
        end
        while p41.c do
            if v_u_11.identifier_start[p41.c] then
                v43[#v43 + 1] = v_u_15(p41)
            elseif v_u_11.simple[p41.c] then
                if v_u_11.simple[p41.c] ~= "ws" then
                    v43[#v43 + 1] = {
                        ["pos"] = p41.pos,
                        ["type"] = v_u_11.simple[p41.c],
                        ["value"] = p41.c
                    }
                end
                p41.c = p41.token_iter()
                if p41.c ~= "" then
                    p41.pos = p41.pos + 1
                end
            elseif v_u_11.numbers[p41.c] or p41.c == "-" then
                v43[#v43 + 1] = v_u_21(p41)
            elseif p41.c == "[" then
                v43[#v43 + 1] = v_u_23(p41)
            elseif v_u_11.operator_start[p41.c] then
                v43[#v43 + 1] = v_u_26(p41)
            elseif p41.c == "|" then
                v43[#v43 + 1] = v_u_28(p41)
            elseif p41.c == "\"" then
                local v44 = #v43 + 1
                local v45 = v_u_36(p41, "\"")
                v45.type = "quoted_identifier"
                v45.value = v_u_1:JSONDecode("\"" .. v45.value .. "\"")
                v43[v44] = v45
            elseif p41.c == "`" then
                v43[#v43 + 1] = v_u_40(p41)
            else
                error("Unexpected character " .. p41.c .. " found at #" .. p41.pos)
            end
        end
        v43[#v43 + 1] = {
            ["type"] = "eof",
            ["pos"] = p41.pos,
            ["value"] = ""
        }
        return v43
    end
    return v_u_3
end)()
local v145 = (function()
    local v_u_63 = {
        ["new"] = function()
            local v47 = {
                ["__index"] = v_u_63
            }
            local v48 = setmetatable({}, v47)
            v48.lexer = v_u_46.new()
            return v48
        end,
        ["advance"] = function(p49, p50)
            if p49.pos < #p49.tokens then
                p49.pos = p49.pos + 1
                p49.token = p49.tokens[p49.pos]
            end
            if p50 and not p50[p49.token.type] then
                local v51 = error
                local v52 = p49.pos
                local v53 = p49.token.type
                local v54 = table.concat
                local v55 = {}
                local v56 = "Syntax error at "
                local v57 = ". Found "
                local v58 = " but expected one of: "
                for v59 in pairs(p50) do
                    table.insert(v55, v59)
                end
                v51(v56 .. v52 .. v57 .. v53 .. v58 .. v54(v55, ", "))
            end
        end,
        ["peek"] = function(p60)
            return p60.pos >= #p60.tokens and "eof" or p60.tokens[p60.pos + 1].type
        end,
        ["assert_not"] = function(p61, p62)
            if p61.token.type == p62 then
                error("Token not " .. p61.pos .. " not allowed to be " .. p62)
            end
        end
    }
    local v_u_64 = {
        ["eof"] = 0,
        ["quoted_identifier"] = 0,
        ["identifier"] = 0,
        ["rbracket"] = 0,
        ["rparen"] = 0,
        ["comma"] = 0,
        ["rbrace"] = 0,
        ["number"] = 0,
        ["current"] = 0,
        ["expref"] = 0,
        ["pipe"] = 1,
        ["comparator"] = 2,
        ["or"] = 5,
        ["flatten"] = 6,
        ["star"] = 20,
        ["dot"] = 40,
        ["lbrace"] = 50,
        ["filter"] = 50,
        ["lbracket"] = 55,
        ["lparen"] = 60
    }
    local v_u_65 = {
        ["type"] = "current"
    }
    local v_u_66 = {
        ["identifier"] = true,
        ["quoted_identifier"] = true,
        ["lbracket"] = true,
        ["lbrace"] = true,
        ["star"] = true
    }
    local v_u_67 = {}
    local function v_u_72(p68, p69)
        local v70 = v_u_67["nud_" .. p68.token.type](p68)
        local v71 = p69 or 0
        while v71 < v_u_64[p68.token.type] do
            v70 = v_u_67["led_" .. p68.token.type](p68, v70)
        end
        return v70
    end
    function v_u_67.nud_identifier(p73)
        local v74 = {
            ["type"] = "field",
            ["value"] = p73.token.value
        }
        p73:advance()
        return v74
    end
    function v_u_67.nud_quoted_identifier(p75)
        local v76 = p75.token
        p75:advance()
        p75:assert_not("lparen")
        return {
            ["type"] = "field",
            ["value"] = v76.value
        }
    end
    function v_u_67.nud_current(p77)
        p77:advance()
        return {
            ["type"] = "current"
        }
    end
    function v_u_67.nud_literal(p78)
        local v79 = p78.token
        p78:advance()
        return {
            ["type"] = "literal",
            ["value"] = v79.value
        }
    end
    function v_u_67.nud_expref(p80)
        p80:advance()
        return {
            ["type"] = "expref",
            ["children"] = { (v_u_72(p80, v_u_64.expref)) }
        }
    end
    local function v_u_83(p81)
        local v82 = p81.token.value
        p81:advance({
            ["colon"] = true
        })
        p81:advance()
        return {
            ["type"] = "key_value_pair",
            ["value"] = v82,
            ["children"] = { (v_u_72(p81)) }
        }
    end
    function v_u_67.nud_lbrace(p84)
        local v85 = {
            ["quoted_identifier"] = true,
            ["identifier"] = true
        }
        p84:advance(v85)
        local v86 = {}
        while true do
            v86[#v86 + 1] = v_u_83(p84)
            if p84.token.type == "comma" then
                p84:advance(v85)
            end
            if p84.token.type == "rbrace" then
                p84:advance()
                return {
                    ["type"] = "multi_select_hash",
                    ["children"] = v86
                }
            end
        end
    end
    function v_u_67.nud_flatten(p87)
        return v_u_67.led_flatten(p87, v_u_65)
    end
    function v_u_67.nud_filter(p88)
        return v_u_67.led_filter(p88, v_u_65)
    end
    local function v_u_91(p89)
        local v90 = {}
        while true do
            v90[#v90 + 1] = v_u_72(p89)
            if p89.token.type == "comma" then
                p89:advance()
                p89:assert_not("rbracket")
            end
            if p89.token.type == "rbracket" then
                p89:advance()
                return {
                    ["type"] = "multi_select_list",
                    ["children"] = v90
                }
            end
        end
    end
    local function v_u_96(p92, p93)
        local v94 = p92.token.type
        if v_u_64[v94] < 10 then
            return v_u_65
        end
        if v94 == "dot" then
            p92:advance(v_u_66)
            if p92.token.type ~= "lbracket" then
                return v_u_72(p92, p93)
            end
            p92:advance()
            return v_u_91(p92)
        end
        if v94 == "lbracket" or v94 == "filter" then
            return v_u_72(p92, p93)
        end
        local v95 = "Syntax error at character " .. p92.token.pos .. "\n" .. p92.expr .. "\n" .. string.rep(" ", p92.token.pos - 1) .. "^\nSyntax error after projection"
        error(v95)
    end
    local function v_u_99(p97, p98)
        p97:advance()
        return {
            ["type"] = "object_projection",
            ["children"] = { p98 or v_u_65, v_u_96(p97, v_u_64.star) }
        }
    end
    function v_u_67.nud_star(p100)
        return v_u_99(p100, v_u_65)
    end
    local function v_u_103(p101, p102)
        p101:advance({
            ["rbracket"] = true
        })
        p101:advance()
        return {
            ["type"] = "array_projection",
            ["children"] = { p102 or v_u_65, v_u_96(p101, v_u_64.star) }
        }
    end
    local function v_u_110(p104)
        local v105 = { false, false, false }
        local v106 = 1
        local v107 = {
            ["number"] = true,
            ["colon"] = true,
            ["rbracket"] = true
        }
        while true do
            local v108
            if p104.token.type == "colon" then
                v106 = v106 + 1
                v108 = v107
            else
                v105[v106] = p104.token.value
                v108 = {
                    ["colon"] = true,
                    ["rbracket"] = true
                }
            end
            p104:advance(v108)
            if p104.token.type == "rbracket" then
                p104:advance()
                if v106 == 1 then
                    return {
                        ["type"] = "index",
                        ["value"] = v105[1]
                    }
                end
                if v106 <= 3 then
                    return {
                        ["type"] = "slice",
                        ["value"] = v105
                    }
                end
                local v109 = "Syntax error at character " .. p104.token.pos .. "\n" .. p104.expr .. "\n" .. string.rep(" ", p104.token.pos - 1) .. "^\nInvalid array slice syntax: too many colons"
                error(v109)
                return
            end
        end
    end
    function v_u_67.nud_lbracket(p111)
        p111:advance()
        local v112 = p111.token.type
        if v112 == "number" or v112 == "colon" then
            return v_u_110(p111)
        elseif v112 == "star" and p111:peek() == "rbracket" then
            return v_u_103(p111)
        else
            return v_u_91(p111)
        end
    end
    function v_u_67.led_lbracket(p113, p114)
        p113:advance({
            ["number"] = true,
            ["colon"] = true,
            ["star"] = true
        })
        local v115 = p113.token.type
        return (v115 == "number" or v115 == "colon") and {
            ["type"] = "subexpression",
            ["children"] = { p114, v_u_110(p113) }
        } or v_u_103(p113, p114)
    end
    function v_u_67.led_flatten(p116, p117)
        p116:advance()
        local v118 = {
            ["type"] = "array_projection",
            ["children"] = {
                {
                    ["type"] = "flatten",
                    ["children"] = { p117 }
                },
                v_u_96(p116, v_u_64.flatten)
            }
        }
        return v118
    end
    function v_u_67.led_or(p119, p120)
        p119:advance()
        return {
            ["type"] = "or",
            ["children"] = { p120, (v_u_72(p119, v_u_64["or"])) }
        }
    end
    function v_u_67.led_pipe(p121, p122)
        p121:advance()
        return {
            ["type"] = "pipe",
            ["children"] = { p122, (v_u_72(p121, v_u_64.pipe)) }
        }
    end
    function v_u_67.led_lparen(p123, p124)
        p123:advance()
        local v125 = {}
        while p123.token.type ~= "rparen" do
            v125[#v125 + 1] = v_u_72(p123, 0)
            if p123.token.type == "comma" then
                p123:advance()
            end
        end
        p123:advance()
        return {
            ["type"] = "function",
            ["value"] = p124.value,
            ["children"] = v125
        }
    end
    function v_u_67.led_filter(p126, p127)
        p126:advance()
        local v128 = v_u_72(p126)
        if p126.token.type ~= "rbracket" then
            local v129 = "Syntax error at character " .. p126.token.pos .. "\n" .. p126.expr .. "\n" .. string.rep(" ", p126.token.pos - 1) .. "^\nExpected a closing rbracket for the filter"
            error(v129)
        end
        p126:advance()
        return {
            ["type"] = "array_projection",
            ["children"] = {
                p127 or v_u_65,
                {
                    ["type"] = "condition",
                    ["children"] = { v128, (v_u_96(p126, v_u_64.filter)) }
                }
            }
        }
    end
    function v_u_67.led_comparator(p130, p131)
        local v132 = p130.token.value
        p130:advance()
        return {
            ["type"] = "comparator",
            ["value"] = v132,
            ["children"] = { p131, (v_u_72(p130, v_u_64.comparator)) }
        }
    end
    function v_u_67.led_dot(p133, p134)
        p133:advance(v_u_66)
        if p133.token.type == "star" then
            return v_u_99(p133, p134)
        end
        local v135 = {
            ["type"] = "subexpression"
        }
        local v136 = {}
        local v137 = v_u_64.dot
        local v138
        if p133.token.type == "lbracket" then
            p133:advance()
            v138 = v_u_91(p133)
        else
            v138 = v_u_72(p133, v137)
        end
        __set_list(v136, 1, {p134, v138})
        v135.children = v136
        return v135
    end
    setmetatable(v_u_67, {
        ["__index"] = function(_, p139)
            error("Invalid use of " .. p139)
        end
    })
    function v_u_63.parse(p140, p141)
        p140.expr = p141
        p140.tokens = p140.lexer:tokenize(p141)
        p140.pos = 0
        p140:advance()
        local v142 = v_u_72(p140, 0)
        if p140.token.type ~= "eof" then
            local v143 = "Encountered an unexpected \"" .. p140.token.type .. "\" token and did not reach the end of the token stream."
            local v144 = "Syntax error at character " .. p140.token.pos .. "\n" .. p140.expr .. "\n" .. string.rep(" ", p140.token.pos - 1) .. "^\n" .. v143
            error(v144)
        end
        return v142
    end
    return v_u_63
end)()
local v_u_326 = (function()
    local v_u_146 = {}
    local function v_u_151(p147, p148, p149)
        if p149[1] == "any" then
            return
        elseif v_u_146.in_table(v_u_146.type(p148), p149) then
            return
        elseif not (v_u_146.in_table("array", p149) and v_u_146.is_equal(p148, {})) then
            local v150 = "must be one of the following types: " .. table.concat(p149, "|") .. ". " .. v_u_146.type(p148) .. " found"
            if not string.match(p147, ":") then
                error("Type error: " .. p147 .. " " .. v150)
            end
            error("Argument " .. p147 .. " " .. v150)
        end
    end
    local function v_u_159(p152, p153, p154)
        local v155 = #p153
        local v156 = #p154
        if v155 ~= v156 then
            error(p152 .. " expects " .. v156 .. " arguments. " .. v155 .. " were provided.")
        end
        for v157, v158 in pairs(p153) do
            if p154[v157] then
                v_u_151(p152 .. ":" .. v157, v158, p154[v157])
            end
        end
    end
    local function v_u_168(p160, p161, p162, p163)
        local v164 = v_u_146.type(p162)
        local v165 = v_u_146.type(p163)
        if v164 ~= v165 then
            local v166 = "encountered a type mismatch in sequence: " .. v164 .. ", " .. v165
            if not string.match(p160, ":") then
                error("Type error: " .. p160 .. " " .. v166)
            end
            error("Argument " .. p160 .. " " .. v166)
        end
        if p161[1] ~= "any" and not v_u_146.in_table(v164, p161) then
            local v167 = "encountered a type error in sequence. The argument must" .. " be an array of " .. table.concat(p161, "|") .. " types. Found " .. v164 .. ", " .. v165
            if not string.match(p160, ":") then
                error("Type error: " .. p160 .. " " .. v167)
            end
            error("Argument " .. p160 .. " " .. v167)
        end
    end
    local function v_u_176(p_u_169, p170, p_u_171, p_u_172)
        return v_u_146.reduce(p170, function(p173, p174, p175)
            if p175 > 1 then
                v_u_168(p_u_169, p_u_171, p173, p174)
            end
            return p_u_172(p173, p174, p175)
        end)
    end
    local function v_u_189(p177)
        v_u_159("sum", p177, {
            { "array" }
        })
        local function v_u_181(p178, p179, p180)
            if p180 > 1 then
                return p178 + p179
            else
                return p179
            end
        end
        local v182 = p177[1]
        local v_u_183 = { "number" }
        local v_u_184 = "sum:0"
        local v188 = v_u_146.reduce(v182, function(p185, p186, p187)
            if p187 > 1 then
                v_u_168(v_u_184, v_u_183, p185, p186)
            end
            return v_u_181(p185, p186, p187)
        end)
        return v188 == nil and 0 or v188
    end
    local function v197(p190)
        local v191 = #p190
        if v191 ~= 1 then
            error("to_string:0" .. " expects " .. 1 .. " arguments. " .. v191 .. " were provided.")
        end
        local v192 = p190[1]
        if type(v192) ~= "table" then
            local v193 = p190[1]
            return tostring(v193)
        end
        local v194 = p190[1]
        local v195 = getmetatable(v194)
        if not (v195 and v195.__tostring) then
            return v_u_1:JSONEncode(p190[1])
        end
        local v196 = p190[1]
        return tostring(v196)
    end
    function v_u_146.in_table(p198, p199)
        for _, v200 in pairs(p199) do
            if v200 == p198 then
                return true
            end
        end
        return false
    end
    function v_u_146.reduce(p201, p202, p203)
        for v204, v205 in pairs(p201) do
            p203 = p202(p203, v205, v204)
        end
        return p203
    end
    function v_u_146.is_object(p206)
        return #p206 == 0
    end
    function v_u_146.is_array(p207)
        return #p207 > 0
    end
    function v_u_146.stable_sort(p208, p_u_209)
        local v210 = {}
        local v211 = {}
        for v212, v213 in pairs(p208) do
            v210[#v210 + 1] = { v213, v212 }
        end
        table.sort(v210, function(p214, p215)
            local v216 = p_u_209(p214[1], p215[1])
            if v216 == 0 then
                return p214[2] < p215[2]
            else
                return v216 == -1
            end
        end)
        for _, v217 in pairs(v210) do
            v211[#v211 + 1] = v217[1]
        end
        return v211
    end
    function v_u_146.type(p218)
        local v219 = type(p218)
        if v219 == "string" then
            return "string"
        end
        if v219 == "number" then
            return "number"
        end
        if v219 == "float" then
            return "float"
        end
        if v219 == "boolean" then
            return "boolean"
        end
        if v219 == "function" then
            return "expression"
        end
        if v219 == "nil" then
            return "null"
        end
        if v219 == "table" then
            return v_u_146.is_object(p218) and "object" or "array"
        end
    end
    function v_u_146.is_equal(p220, p221, p222)
        local v223 = type(p220)
        if v223 ~= type(p221) then
            return false
        end
        if v223 ~= "table" then
            return p220 == p221
        end
        local v224 = getmetatable(p220)
        if not p222 and (v224 and v224.__eq) then
            return p220 == p221
        end
        local v225 = v_u_146.is_equal
        for v226, v227 in pairs(p220) do
            local v228 = p221[v226]
            if v228 == nil or not v225(v227, v228, p222) then
                return false
            end
        end
        for v229, _ in pairs(p221) do
            if p220[v229] == nil then
                return false
            end
        end
        return true
    end
    local v_u_321 = {
        ["fn_abs"] = function(p230)
            v_u_159("abs", p230, {
                { "number" }
            })
            local v231 = p230[1]
            return math.abs(v231)
        end,
        ["fn_sum"] = v_u_189,
        ["fn_avg"] = function(p232)
            v_u_159("avg", p232, {
                { "array" }
            })
            if #p232[1] then
                return v_u_189(p232) / #p232[1]
            else
                return nil
            end
        end,
        ["fn_ceil"] = function(p233)
            v_u_159("ceil", p233, {
                { "number" }
            })
            local v234 = p233[1]
            return math.ceil(v234)
        end,
        ["fn_contains"] = function(p235)
            v_u_159("contains", p235, {
                { "string", "array" },
                { "any" }
            })
            local v236 = p235[1]
            if type(v236) == "table" then
                return v_u_146.in_table(p235[2], p235[1])
            else
                return string.find(p235[1], p235[2]) ~= nil
            end
        end,
        ["fn_ends_with"] = function(p237)
            v_u_159("ends_with", p237, {
                { "string" }
            })
            local v238
            if p237[2] == "" then
                v238 = true
            else
                local v239 = p237[1]
                local v240 = p237[2]
                local v241 = -string.len(v240)
                v238 = string.sub(v239, v241) == p237[2]
            end
            return v238
        end,
        ["fn_floor"] = function(p242)
            v_u_159("floor", p242, {
                { "number" }
            })
            local v243 = p242[1]
            return math.floor(v243)
        end,
        ["fn_join"] = function(p_u_244)
            v_u_159("join", p_u_244, {
                { "string" },
                { "array" }
            })
            local function v_u_248(p245, p246, p247)
                if p247 == 1 then
                    return p246
                else
                    return p245 .. p_u_244[1] .. p246
                end
            end
            local v249 = p_u_244[2]
            local v_u_250 = { "string" }
            local v_u_251 = "join:1"
            local v255 = v_u_146.reduce(v249, function(p252, p253, p254)
                if p254 > 1 then
                    v_u_168(v_u_251, v_u_250, p252, p253)
                end
                return v_u_248(p252, p253, p254)
            end)
            return v255 == nil and "" or v255
        end,
        ["fn_keys"] = function(p256)
            v_u_159("keys", p256, {
                { "object" }
            })
            local v257 = {}
            for v258, _ in pairs(p256[1]) do
                v257[#v257 + 1] = v258
            end
            return v257
        end,
        ["fn_length"] = function(p259)
            v_u_159("length", p259, {
                { "array", "string", "object" }
            })
            local v260 = #p259[1]
            if v260 > 0 then
                return v260
            end
            local v261 = p259[1]
            if type(v261) == "table" then
                for _, _ in pairs(p259[1]) do
                    v260 = v260 + 1
                end
            end
            return v260
        end,
        ["fn_not_null"] = function(p262)
            for _, v263 in pairs(p262) do
                if v263 ~= nil then
                    return v263
                end
            end
        end,
        ["fn_max"] = function(p264)
            v_u_159("max", p264, {
                { "array" }
            })
            return v_u_176("max:0", p264[1], { "number", "string" }, function(p265, p266, p267)
                if p267 > 1 and p266 <= p265 then
                    return p265
                else
                    return p266
                end
            end)
        end,
        ["fn_max_by"] = function(p268)
            v_u_159("max_by", p268, {
                { "array" },
                { "expression" }
            })
            local v_u_269 = p268[2]
            local v_u_270 = { "number", "string" }
            local v_u_271 = "The expression return value of max_by:1"
            local function v_u_274(p272)
                local v273 = v_u_269(p272)
                v_u_151(v_u_271, v273, v_u_270)
                return v273
            end
            return v_u_176("max_by:1", p268[1], { "any" }, function(p275, p276, p277)
                if p277 == 1 then
                    return p276
                elseif v_u_274(p275) >= v_u_274(p276) then
                    return p275
                else
                    return p276
                end
            end)
        end,
        ["fn_min"] = function(p278)
            v_u_159("min", p278, {
                { "array" }
            })
            return v_u_176("min:0", p278[1], { "number", "string" }, function(p279, p280, p281)
                if p281 > 1 and p279 <= p280 then
                    return p279
                else
                    return p280
                end
            end)
        end,
        ["fn_min_by"] = function(p282)
            v_u_159("min_by", p282, {
                { "array" },
                { "expression" }
            })
            local v_u_283 = p282[2]
            local v_u_284 = { "number", "string" }
            local v_u_285 = "The expression return value of min_by:1"
            local function v_u_288(p286)
                local v287 = v_u_283(p286)
                v_u_151(v_u_285, v287, v_u_284)
                return v287
            end
            return v_u_176("min_by:1", p282[1], { "any" }, function(p289, p290, p291)
                if p291 == 1 then
                    return p290
                elseif v_u_288(p289) <= v_u_288(p290) then
                    return p289
                else
                    return p290
                end
            end)
        end,
        ["fn_reverse"] = function(p292)
            v_u_159("reverse", p292, {
                { "array", "string" }
            })
            local v293 = p292[1]
            if type(v293) == "string" then
                return string.reverse(p292[1])
            end
            local v294 = #p292[1]
            local v295 = {}
            for v296, v297 in ipairs(p292[1]) do
                v295[v294 + 1 - v296] = v297
            end
            return v295
        end,
        ["fn_sort"] = function(p298)
            v_u_159("sort", p298, {
                { "array" }
            })
            local v_u_299 = { "string", "number" }
            return v_u_146.stable_sort(p298[1], function(p300, p301)
                v_u_168("sort:0", v_u_299, p300, p301)
                return p300 == p301 and 0 or (p300 < p301 and -1 or 1)
            end)
        end,
        ["fn_sort_by"] = function(p302)
            v_u_159("sort_by", p302, {
                { "array" },
                { "expression" }
            })
            local v_u_303 = p302[2]
            local v_u_304 = { "string", "number" }
            return v_u_146.stable_sort(p302[1], function(p305, p306)
                local v307 = v_u_303(p305)
                local v308 = v_u_303(p306)
                v_u_168("sort_by:0", v_u_304, v307, v308)
                return v307 == v308 and 0 or (v307 < v308 and -1 or 1)
            end)
        end,
        ["fn_starts_with"] = function(p309)
            v_u_159("starts_with", p309, {
                { "array" }
            })
            local v310 = p309[1]
            local v311 = p309[2]
            local v312 = string.len(v311)
            return string.sub(v310, 1, v312) == p309[2]
        end,
        ["fn_type"] = function(p313)
            if #p313 > 0 then
                local v314 = #p313
                if v314 ~= 1 then
                    error("type" .. " expects " .. 1 .. " arguments. " .. v314 .. " were provided.")
                end
            end
            return v_u_146.type(p313[1])
        end,
        ["fn_to_number"] = function(p315)
            if #p315 > 0 then
                local v316 = #p315
                if v316 ~= 1 then
                    error("to_number" .. " expects " .. 1 .. " arguments. " .. v316 .. " were provided.")
                end
            end
            local v317 = p315[1]
            return tonumber(v317)
        end,
        ["fn_to_string"] = v197,
        ["fn_values"] = function(p318)
            v_u_159("values", p318, {
                { "object" }
            })
            local v319 = {}
            for _, v320 in pairs(p318[1]) do
                v319[#v319 + 1] = v320
            end
            return v319
        end
    }
    function v_u_146.new(_)
        local v325 = {
            ["__index"] = v_u_146,
            ["__call"] = function(_, p322, p323)
                local v324 = "fn_" .. p322
                if not v_u_321[v324] then
                    error("Invalid function call: " .. p322)
                end
                return v_u_321[v324](p323)
            end
        }
        return setmetatable({}, v325)
    end
    return v_u_146
end)()
local v_u_404 = (function()
    local v_u_330 = {
        ["new"] = function(p327)
            local v328 = {
                ["__index"] = v_u_330
            }
            local v329 = setmetatable({}, v328)
            if p327 and p327.fn_dispatcher then
                v329.fn_dispatcher = p327.fn_dispatcher
                return v329
            else
                v329.fn_dispatcher = v_u_326.new()
                return v329
            end
        end
    }
    local v_u_400 = {
        ["field"] = function(_, p331, p332)
            if type(p332) == "table" then
                return p332[p331.value]
            end
        end,
        ["subexpression"] = function(p333, p334, p335)
            return p333:visit(p334.children[2], p333:visit(p334.children[1], p335))
        end,
        ["index"] = function(_, p336, p337)
            if type(p337) == "table" then
                if p336.value < 0 then
                    return p337[#p337 + p336.value + 1]
                else
                    return p337[p336.value + 1]
                end
            else
                return nil
            end
        end,
        ["object_projection"] = function(p338, p339, p340)
            local v341 = p338:visit(p339.children[1], p340)
            if type(v341) ~= "table" then
                return nil
            end
            if next(v341) == nil then
                return v341
            end
            if #v341 > 0 then
                return nil
            end
            local v342 = {}
            local v343 = getmetatable(v341)
            local v344
            if v343 and v343.__jsonorder then
                v344 = v343.__jsonorder
            else
                v344 = {}
                for v345, _ in pairs(v341) do
                    v344[#v344 + 1] = v345
                end
            end
            for _, v346 in pairs(v344) do
                local v347 = p338:visit(p339.children[2], v341[v346])
                if v347 ~= nil then
                    v342[#v342 + 1] = v347
                end
            end
            return v342
        end,
        ["array_projection"] = function(p348, p349, p350)
            local v351 = p348:visit(p349.children[1], p350)
            if type(v351) ~= "table" then
                return nil
            end
            if next(v351) == nil then
                return v351
            end
            if #v351 == 0 then
                return nil
            end
            local v352 = {}
            for _, v353 in pairs(v351) do
                local v354 = p348:visit(p349.children[2], v353)
                if v354 ~= nil then
                    v352[#v352 + 1] = v354
                end
            end
            return v352
        end,
        ["flatten"] = function(p355, p356, p357)
            local v358 = p355:visit(p356.children[1], p357)
            if type(v358) ~= "table" then
                return nil
            end
            if next(v358) == nil then
                return v358
            end
            if #v358 == 0 then
                return nil
            end
            local v359 = {}
            for _, v360 in ipairs(v358) do
                if type(v360) == "table" and (next(v360) == nil or #v360 ~= 0) then
                    if #v360 > 0 then
                        for _, v361 in ipairs(v360) do
                            v359[#v359 + 1] = v361
                        end
                    end
                else
                    v359[#v359 + 1] = v360
                end
            end
            return v359
        end,
        ["literal"] = function(_, p362, _)
            return p362.value
        end,
        ["current"] = function(_, _, p363)
            return p363
        end,
        ["or"] = function(p364, p365, p366)
            local v367 = p364:visit(p365.children[1], p366)
            local v368 = type(v367)
            if not v367 or (v367 == "" or v368 == "table" and next(v367) == nil) then
                v367 = p364:visit(p365.children[2], p366)
            end
            return v367
        end,
        ["pipe"] = function(p369, p370, p371)
            return p369:visit(p370.children[2], p369:visit(p370.children[1], p371))
        end,
        ["multi_select_list"] = function(p372, p373, p374)
            if p374 == nil then
                return nil
            end
            local v375 = 0
            local v376 = {}
            for _, v377 in pairs(p373.children) do
                v375 = v375 + 1
                v376[v375] = p372:visit(v377, p374)
            end
            return v376
        end,
        ["multi_select_hash"] = function(p378, p379, p380)
            if p380 == nil then
                return nil
            end
            local v381 = {}
            local v382 = {}
            for _, v383 in pairs(p379.children) do
                v381[v383.value] = p378:visit(v383.children[1], p380)
                v382[#v382 + 1] = v383.value
            end
            return setmetatable(v381, {
                ["__jsonorder"] = v382
            })
        end,
        ["comparator"] = function(p384, p385, p386)
            local v387 = p384:visit(p385.children[1], p386)
            local v388 = p384:visit(p385.children[2], p386)
            if p385.value == "==" then
                return v_u_326.is_equal(v387, v388)
            elseif p385.value == "!=" then
                return not v_u_326.is_equal(v387, v388)
            elseif type(v387) == "number" and type(v388) == "number" then
                if p385.value == ">" then
                    return v388 < v387
                elseif p385.value == ">=" then
                    return v388 <= v387
                elseif p385.value == "<" then
                    return v387 < v388
                else
                    return v387 <= v388
                end
            else
                return nil
            end
        end,
        ["condition"] = function(p389, p390, p391)
            if p389:visit(p390.children[1], p391) then
                return p389:visit(p390.children[2], p391)
            end
        end,
        ["function"] = function(p392, p393, p394)
            local v395 = {}
            for _, v396 in pairs(p393.children) do
                v395[#v395 + 1] = p392:visit(v396, p394)
            end
            return p392.fn_dispatcher(p393.value, v395)
        end,
        ["expref"] = function(p_u_397, p_u_398, _)
            return function(p399)
                return p_u_397:visit(p_u_398.children[1], p399)
            end
        end
    }
    function v_u_330.visit(p401, p402, p403)
        if v_u_400[p402.type] then
            return v_u_400[p402.type](p401, p402, p403)
        end
        error("Invalid node: " .. p402.type)
    end
    return v_u_330
end)()
local v_u_405 = {}
local v_u_406 = v145.new()
local v_u_407 = v_u_404.new()
local function v_u_411(p408, p409)
    local v410 = v_u_407
    if #v_u_405 > 1024 then
        v_u_405 = {}
    end
    if not v_u_405[p408] then
        v_u_405[p408] = v_u_406:parse(p408)
    end
    return v410:visit(v_u_405[p408], p409)
end
return {
    ["Functions"] = v_u_326,
    ["runtime"] = function(p412)
        if not p412 then
            return v_u_411
        end
        if p412.fn_dispatcher then
            v_u_404.new({ p412 })
        end
        return p412.cache == false and function(p413, p414)
            return v_u_407:visit(v_u_406:parse(p413), p414)
        end or function(p415, p416)
            local v417 = v_u_407
            if #v_u_405 > 1024 then
                v_u_405 = {}
            end
            if not v_u_405[p415] then
                v_u_405[p415] = v_u_406:parse(p415)
            end
            return v417:visit(v_u_405[p415], p416)
        end
    end,
    ["parse"] = function(p418)
        if #v_u_405 > 1024 then
            v_u_405 = {}
        end
        if not v_u_405[p418] then
            v_u_405[p418] = v_u_406:parse(p418)
        end
        return v_u_405[p418]
    end,
    ["search"] = v_u_411
}