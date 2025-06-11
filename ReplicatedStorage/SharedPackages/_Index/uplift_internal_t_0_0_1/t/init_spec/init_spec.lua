--// ReplicatedStorage.SharedPackages._Index.uplift-internal_t@0.0.1.t.init.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent)
    it("should support basic types", function()
        local v2 = v_u_1.any
        assert(v2(""))
        local v3 = v_u_1.boolean
        assert(v3(true))
        local v4 = v_u_1.none
        assert(v4(nil))
        local v5 = v_u_1.number
        assert(v5(1))
        local v6 = v_u_1.string
        assert(v6("foo"))
        local v7 = v_u_1.table
        assert(v7({}))
        local v8 = not v_u_1.any(nil)
        assert(v8)
        local v9 = not v_u_1.boolean("true")
        assert(v9)
        local v10 = not v_u_1.none(1)
        assert(v10)
        local v11 = not v_u_1.number(true)
        assert(v11)
        local v12 = not v_u_1.string(true)
        assert(v12)
        local v13 = not v_u_1.table(82)
        assert(v13)
    end)
    it("should support special number types", function()
        local v14 = v_u_1.numberMax(10)
        local v15 = v_u_1.numberMin(2)
        local v16 = v_u_1.numberMaxExclusive(10)
        local v17 = v_u_1.numberMinExclusive(2)
        local v18 = v_u_1.numberConstrained(8, 11)
        local v19 = v_u_1.numberConstrainedExclusive(8, 11)
        assert(v14(5))
        assert(v14(10))
        local v20 = not v14(11)
        assert(v20)
        local v21 = not v14()
        assert(v21)
        assert(v15(5))
        assert(v15(2))
        local v22 = not v15(1)
        assert(v22)
        local v23 = not v15()
        assert(v23)
        assert(v16(5))
        assert(v16(9))
        local v24 = not v16(10)
        assert(v24)
        local v25 = not v16()
        assert(v25)
        assert(v17(5))
        assert(v17(3))
        local v26 = not v17(2)
        assert(v26)
        local v27 = not v17()
        assert(v27)
        local v28 = not v18(7)
        assert(v28)
        assert(v18(8))
        assert(v18(9))
        assert(v18(11))
        local v29 = not v18(12)
        assert(v29)
        local v30 = not v18()
        assert(v30)
        local v31 = not v19(7)
        assert(v31)
        local v32 = not v19(8)
        assert(v32)
        assert(v19(9))
        local v33 = not v19(11)
        assert(v33)
        local v34 = not v19(12)
        assert(v34)
        local v35 = not v19()
        assert(v35)
    end)
    it("should support optional types", function()
        local v36 = v_u_1.optional(v_u_1.string)
        assert(v36(""))
        assert(v36())
        local v37 = not v36(1)
        assert(v37)
    end)
    it("should support tuple types", function()
        local v38 = v_u_1.tuple(v_u_1.number, v_u_1.string, v_u_1.optional(v_u_1.number))
        assert(v38(1, "2", 3))
        assert(v38(1, "2"))
        local v39 = not v38(1, "2", "3")
        assert(v39)
    end)
    it("should support union types", function()
        local v40 = v_u_1.union(v_u_1.number, v_u_1.string)
        assert(v40(1))
        assert(v40("1"))
        local v41 = not v40(nil)
        assert(v41)
    end)
    it("should support literal types", function()
        local v42 = v_u_1.literal("foo")
        local v43 = v_u_1.union(v_u_1.literal("foo"), v_u_1.literal("bar"), v_u_1.literal("oof"))
        assert(v42("foo"))
        assert(v43("foo"))
        assert(v43("bar"))
        assert(v43("oof"))
        local v44 = not v42("FOO")
        assert(v44)
        local v45 = not v43("FOO")
        assert(v45)
        local v46 = not v43("BAR")
        assert(v46)
        local v47 = not v43("OOF")
        assert(v47)
    end)
    it("should support multiple literal types", function()
        local v48 = v_u_1.literal("foo")
        local v49 = v_u_1.literal("foo", "bar", "oof")
        assert(v48("foo"))
        assert(v49("foo"))
        assert(v49("bar"))
        assert(v49("oof"))
        local v50 = not v48("FOO")
        assert(v50)
        local v51 = not v49("FOO")
        assert(v51)
        local v52 = not v49("BAR")
        assert(v52)
        local v53 = not v49("OOF")
        assert(v53)
    end)
    it("should support intersection types", function()
        local v54 = v_u_1.intersection(v_u_1.integer, v_u_1.numberMax(5000))
        assert(v54(1))
        local v55 = not v54(5001)
        assert(v55)
        local v56 = not v54(1.1)
        assert(v56)
        local v57 = not v54("1")
        assert(v57)
    end)
    describe("array", function()
        it("should support array types", function()
            local v58 = v_u_1.array(v_u_1.string)
            local v59 = v_u_1.array(v_u_1.any)
            local v60 = v_u_1.values(v_u_1.string)
            local v61 = not v59("foo")
            assert(v61)
            assert(v59({ 1, "2", 3 }))
            local v62 = not v58({ 1, "2", 3 })
            assert(v62)
            local v63 = not v58()
            assert(v63)
            local v64 = not v60()
            assert(v64)
            local v65 = v_u_1.string
            assert(v59({ "1", "2", "3" }, v65))
            local v66 = not v59({
                ["foo"] = "bar"
            })
            assert(v66)
            local v67 = not v59({
                [1] = "non",
                [5] = "sequential"
            })
            assert(v67)
        end)
        it("should not be fooled by sparse arrays", function()
            local v68 = not v_u_1.array(v_u_1.any)({
                [1] = 1,
                [2] = 2,
                [4] = 4
            })
            assert(v68)
        end)
    end)
    it("should support map types", function()
        local v69 = v_u_1.map(v_u_1.string, v_u_1.number)
        assert(v69({}))
        assert(v69({
            ["a"] = 1
        }))
        local v70 = not v69({ "a" })
        assert(v70)
        local v71 = not v69({
            ["a"] = "a"
        })
        assert(v71)
        local v72 = not v69()
        assert(v72)
    end)
    it("should support set types", function()
        local v73 = v_u_1.set(v_u_1.string)
        assert(v73({}))
        assert(v73({
            ["a"] = true
        }))
        local v74 = not v73({ "a" })
        assert(v74)
        local v75 = not v73({
            ["a"] = "a"
        })
        assert(v75)
        local v76 = not v73({
            ["a"] = false
        })
        assert(v76)
        local v77 = not v73()
        assert(v77)
    end)
    it("should support interface types", function()
        local v78 = v_u_1.interface({
            ["x"] = v_u_1.number,
            ["y"] = v_u_1.number,
            ["z"] = v_u_1.number
        })
        assert(v78({
            ["w"] = 0,
            ["x"] = 1,
            ["y"] = 2,
            ["z"] = 3
        }))
        local v79 = not v78({
            ["w"] = 0,
            ["x"] = 1,
            ["y"] = 2
        })
        assert(v79)
    end)
    it("should support strict interface types", function()
        local v80 = v_u_1.strictInterface({
            ["x"] = v_u_1.number,
            ["y"] = v_u_1.number,
            ["z"] = v_u_1.number
        })
        local v81 = not v80(0)
        assert(v81)
        local v82 = not v80({
            ["w"] = 0,
            ["x"] = 1,
            ["y"] = 2,
            ["z"] = 3
        })
        assert(v82)
        local v83 = not v80({
            ["w"] = 0,
            ["x"] = 1,
            ["y"] = 2
        })
        assert(v83)
        assert(v80({
            ["x"] = 1,
            ["y"] = 2,
            ["z"] = 3
        }))
    end)
    it("should support deep interface types", function()
        local v84 = v_u_1.interface
        local v85 = {
            ["name"] = v_u_1.string,
            ["inventory"] = v_u_1.interface({
                ["size"] = v_u_1.number
            })
        }
        local v86 = v84(v85)
        local v87 = {
            ["name"] = "TestPlayer",
            ["inventory"] = {
                ["size"] = 1
            }
        }
        assert(v86(v87))
        local v88 = {
            ["inventory"] = {
                ["size"] = 1
            }
        }
        local v89 = not v86(v88)
        assert(v89)
        local v90 = not v86({
            ["name"] = "TestPlayer",
            ["inventory"] = {}
        })
        assert(v90)
        local v91 = not v86({
            ["name"] = "TestPlayer"
        })
        assert(v91)
    end)
    it("should support deep optional interface types", function()
        local v92 = v_u_1.interface
        local v93 = {
            ["name"] = v_u_1.string,
            ["inventory"] = v_u_1.optional(v_u_1.interface({
                ["size"] = v_u_1.number
            }))
        }
        local v94 = v92(v93)
        assert(v94({
            ["name"] = "TestPlayer"
        }))
        local v95 = not v94({
            ["name"] = "TestPlayer",
            ["inventory"] = {}
        })
        assert(v95)
        local v96 = {
            ["name"] = "TestPlayer",
            ["inventory"] = {
                ["size"] = 1
            }
        }
        assert(v94(v96))
    end)
    it("should support Roblox Instance types", function()
        local v97 = v_u_1.instanceOf("StringValue")
        local v98 = Instance.new("StringValue")
        local v99 = Instance.new("BoolValue")
        assert(v97(v98))
        local v100 = not v97(v99)
        assert(v100)
        local v101 = not v97()
        assert(v101)
    end)
    it("should support Roblox Instance types inheritance", function()
        local v102 = v_u_1.instanceIsA("GuiObject")
        local v103 = Instance.new("Frame")
        local v104 = Instance.new("TextLabel")
        local v105 = Instance.new("StringValue")
        assert(v102(v103))
        assert(v102(v104))
        local v106 = not v102(v105)
        assert(v106)
        local v107 = not v102()
        assert(v107)
    end)
    it("should support Roblox Enum types", function()
        local v108 = v_u_1.enum(Enum.SortOrder)
        local v109 = v_u_1.Enum
        local v110 = Enum.SortOrder
        assert(v109(v110))
        local v111 = not v_u_1.Enum("Enum.SortOrder")
        assert(v111)
        local v112 = v_u_1.EnumItem
        local v113 = Enum.SortOrder.Name
        assert(v112(v113))
        local v114 = not v_u_1.EnumItem("Enum.SortOrder.Name")
        assert(v114)
        local v115 = Enum.SortOrder.Name
        assert(v108(v115))
        local v116 = Enum.SortOrder.Custom
        assert(v108(v116))
        local v117 = not v108(Enum.EasingStyle.Linear)
        assert(v117)
        local v118 = not v108()
        assert(v118)
    end)
    it("should support Roblox RBXScriptSignal", function()
        local v119 = v_u_1.RBXScriptSignal
        local v120 = game.ChildAdded
        assert(v119(v120))
        local v121 = not v_u_1.RBXScriptSignal(nil)
        assert(v121)
        local v122 = not v_u_1.RBXScriptSignal((Vector3.new()))
        assert(v122)
    end)
    it("should support wrapping function types", function()
        local v123 = v_u_1.tuple(v_u_1.string, v_u_1.number, v_u_1.optional(v_u_1.string))
        local v128 = v_u_1.wrap(function(p124, p125, p126)
            local v127 = string.format("%s %d", p124, p125)
            if p126 then
                v127 = v127 .. " " .. p126
            end
            return v127
        end, v123)
        local v129 = not pcall(v128)
        assert(v129)
        local v130 = not pcall(v128, "a")
        assert(v130)
        local v131 = not pcall(v128, 2)
        assert(v131)
        local v132 = pcall
        assert(v132(v128, "a", 1))
        local v133 = pcall
        assert(v133(v128, "a", 1, "b"))
    end)
    it("should support strict types", function()
        local v_u_134 = v_u_1.strict(v_u_1.tuple(v_u_1.string, v_u_1.number))
        local v135 = not pcall(function()
            v_u_134("a", "b")
        end)
        assert(v135)
        local v136 = pcall
        assert(v136(function()
            v_u_134("a", 1)
        end))
    end)
    it("should support common OOP types", function()
        local v_u_137 = {}
        v_u_137.__index = v_u_137
        function v_u_137.new()
            local v138 = v_u_137
            return setmetatable({}, v138)
        end
        local function v143(p139)
            local v140, v141 = v_u_1.table(p139)
            if v140 then
                local v142 = getmetatable(p139)
                if v142 and v142.__index == v_u_137 then
                    return true
                else
                    return false, "bad member of class"
                end
            else
                return false, v141 or ""
            end
        end
        local v144 = v_u_137.new()
        assert(v143(v144))
        local v145 = not v143({})
        assert(v145)
        local v146 = not v143()
        assert(v146)
    end)
    it("should not treat NaN as numbers", function()
        local v147 = v_u_1.number
        assert(v147(1))
        local v148 = not v_u_1.number((0 / 0))
        assert(v148)
        local v149 = not v_u_1.number("1")
        assert(v149)
    end)
    it("should not treat numbers as NaN", function()
        local v150 = not v_u_1.nan(1)
        assert(v150)
        local v151 = v_u_1.nan
        assert(v151((0 / 0)))
        local v152 = not v_u_1.nan("1")
        assert(v152)
    end)
    it("should allow union of number and NaN", function()
        local v153 = v_u_1.union(v_u_1.number, v_u_1.nan)
        assert(v153(1))
        assert(v153((0 / 0)))
        local v154 = not v153("1")
        assert(v154)
    end)
    it("should support non-string keys for interfaces", function()
        local v155 = {}
        local v156 = v_u_1.interface({
            [v155] = v_u_1.number
        })
        assert(v156({
            [v155] = 1
        }))
        local v157 = not v156({
            [v155] = "1"
        })
        assert(v157)
    end)
    it("should support failing on non-string keys for strict interfaces", function()
        local v158 = not v_u_1.strictInterface({
            ["a"] = v_u_1.number
        })({
            ["a"] = 1,
            [{}] = 2
        })
        assert(v158)
    end)
    it("should support children", function()
        local v159 = v_u_1.interface
        local v160 = {
            ["buttonInFrame"] = v_u_1.intersection(v_u_1.instanceOf("Frame"), v_u_1.children({
                ["MyButton"] = v_u_1.instanceOf("ImageButton")
            }))
        }
        local v161 = v159(v160)
        local v162 = not v_u_1.children({})(5)
        assert(v162)
        local v163 = not v161({
            ["buttonInFrame"] = Instance.new("Frame")
        })
        assert(v163)
        local v164 = Instance.new("Frame")
        Instance.new("ImageButton", v164).Name = "MyButton"
        assert(v161({
            ["buttonInFrame"] = v164
        }))
        local v165 = Instance.new("Frame")
        Instance.new("ImageButton", v165).Name = "NotMyButton"
        local v166 = not v161({
            ["buttonInFrame"] = v165
        })
        assert(v166)
        local v167 = Instance.new("Frame")
        Instance.new("TextButton", v167).Name = "MyButton"
        local v168 = not v161({
            ["buttonInFrame"] = v167
        })
        assert(v168)
        local v169 = Instance.new("Frame")
        Instance.new("ImageButton", v169).Name = "MyButton"
        Instance.new("ImageButton", v169).Name = "MyButton"
        local v170 = not v161({
            ["buttonInFrame"] = v169
        })
        assert(v170)
    end)
    it("should support t.instanceOf shorthand", function()
        local v171 = v_u_1.interface
        local v172 = {
            ["buttonInFrame"] = v_u_1.instanceOf("Frame", {
                ["MyButton"] = v_u_1.instanceOf("ImageButton")
            })
        }
        local v173 = v171(v172)
        local v174 = not v_u_1.children({})(5)
        assert(v174)
        local v175 = not v173({
            ["buttonInFrame"] = Instance.new("Frame")
        })
        assert(v175)
        local v176 = Instance.new("Frame")
        Instance.new("ImageButton", v176).Name = "MyButton"
        assert(v173({
            ["buttonInFrame"] = v176
        }))
        local v177 = Instance.new("Frame")
        Instance.new("ImageButton", v177).Name = "NotMyButton"
        local v178 = not v173({
            ["buttonInFrame"] = v177
        })
        assert(v178)
        local v179 = Instance.new("Frame")
        Instance.new("TextButton", v179).Name = "MyButton"
        local v180 = not v173({
            ["buttonInFrame"] = v179
        })
        assert(v180)
        local v181 = Instance.new("Frame")
        Instance.new("ImageButton", v181).Name = "MyButton"
        Instance.new("ImageButton", v181).Name = "MyButton"
        local v182 = not v173({
            ["buttonInFrame"] = v181
        })
        assert(v182)
    end)
    it("should support t.instanceIsA shorthand", function()
        local v183 = v_u_1.interface
        local v184 = {
            ["buttonInFrame"] = v_u_1.instanceIsA("Frame", {
                ["MyButton"] = v_u_1.instanceIsA("ImageButton")
            })
        }
        local v185 = v183(v184)
        local v186 = not v_u_1.children({})(5)
        assert(v186)
        local v187 = not v185({
            ["buttonInFrame"] = Instance.new("Frame")
        })
        assert(v187)
        local v188 = Instance.new("Frame")
        Instance.new("ImageButton", v188).Name = "MyButton"
        assert(v185({
            ["buttonInFrame"] = v188
        }))
        local v189 = Instance.new("Frame")
        Instance.new("ImageButton", v189).Name = "NotMyButton"
        local v190 = not v185({
            ["buttonInFrame"] = v189
        })
        assert(v190)
        local v191 = Instance.new("Frame")
        Instance.new("TextButton", v191).Name = "MyButton"
        local v192 = not v185({
            ["buttonInFrame"] = v191
        })
        assert(v192)
        local v193 = Instance.new("Frame")
        Instance.new("ImageButton", v193).Name = "MyButton"
        Instance.new("ImageButton", v193).Name = "MyButton"
        local v194 = not v185({
            ["buttonInFrame"] = v193
        })
        assert(v194)
    end)
    it("should support t.match", function()
        local v195 = v_u_1.match("%d+")
        assert(v195("123"))
        local v196 = not v195("abc")
        assert(v196)
        local v197 = not v195()
        assert(v197)
    end)
    it("should support t.keyOf", function()
        local v198 = v_u_1.keyOf({
            ["OptionA"] = {},
            ["OptionB"] = {}
        })
        assert(v198("OptionA"))
        local v199 = not v198("OptionC")
        assert(v199)
    end)
    it("should support t.valueOf", function()
        local v200 = {
            ["OptionA"] = {},
            ["OptionB"] = {}
        }
        local v201 = v_u_1.valueOf(v200)
        local v202 = v200.OptionA
        assert(v201(v202))
        local v203 = not v201(1010)
        assert(v203)
    end)
    it("should support t.strictArray", function()
        local v204 = v_u_1.strictArray(v_u_1.number, v_u_1.number)
        assert(v204({ 1, 2 }))
        local v205 = not v204({ 1, 2, 3 })
        assert(v205)
        local v206 = not v204({ 10 })
        assert(v206)
        local v207 = not v204({ "Hello", 10 })
        assert(v207)
        local v208 = not v204({
            ["Foo"] = "Bar"
        })
        assert(v208)
        local v209 = v_u_1.strictArray(v_u_1.number, v_u_1.number, v_u_1.optional(v_u_1.string))
        assert(v209({ 10, 20 }))
        assert(v209({ 10, 20, "Hello" }))
        local v210 = not v209({ 10, 20, 30 })
        assert(v210)
    end)
end