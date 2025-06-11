--// ReplicatedStorage.SharedPackages._Index.evaera_promise@3.1.0.promise.init.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent)
    v_u_1.TEST = true
    local v_u_2 = Instance.new("BindableEvent")
    v_u_1._timeEvent = v_u_2.Event
    local v_u_3 = 0
    function v_u_1._getTime()
        return v_u_3
    end
    local function v_u_6(p4)
        local v5 = p4 or 0.016666666666666666
        v_u_3 = v_u_3 + v5
        v_u_2:Fire(v5)
    end
    local function v_u_7(...)
        return select("#", ...), { ... }
    end
    describe("Promise.Status", function()
        it("should error if indexing nil value", function()
            expect(function()
                local _ = v_u_1.Status.wrong
            end).to.throw()
        end)
    end)
    describe("Promise.new", function()
        it("should instantiate with a callback", function()
            local v8 = v_u_1.new(function() end)
            expect(v8).to.be.ok()
        end)
        it("should invoke the given callback with resolve and reject", function()
            local v_u_9 = 0
            local v_u_10 = nil
            local v_u_11 = nil
            local v14 = v_u_1.new(function(p12, p13)
                v_u_9 = v_u_9 + 1
                v_u_10 = p12
                v_u_11 = p13
            end)
            expect(v14).to.be.ok()
            expect(v_u_9).to.equal(1)
            expect(v_u_10).to.be.a("function")
            expect(v_u_11).to.be.a("function")
            expect(v14:getStatus()).to.equal(v_u_1.Status.Started)
        end)
        it("should resolve promises on resolve()", function()
            local v_u_15 = 0
            local v17 = v_u_1.new(function(p16)
                v_u_15 = v_u_15 + 1
                p16()
            end)
            expect(v17).to.be.ok()
            expect(v_u_15).to.equal(1)
            expect(v17:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should reject promises on reject()", function()
            local v_u_18 = 0
            local v20 = v_u_1.new(function(_, p19)
                v_u_18 = v_u_18 + 1
                p19()
            end)
            expect(v20).to.be.ok()
            expect(v_u_18).to.equal(1)
            expect(v20:getStatus()).to.equal(v_u_1.Status.Rejected)
        end)
        it("should reject on error in callback", function()
            local v_u_21 = 0
            local v22 = v_u_1.new(function()
                v_u_21 = v_u_21 + 1
                error("hahah")
            end)
            expect(v22).to.be.ok()
            expect(v_u_21).to.equal(1)
            expect(v22:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v23 = expect
            local v24 = v22._values[1]
            v23(tostring(v24):find("hahah")).to.be.ok()
            local v25 = expect
            local v26 = v22._values[1]
            v25(tostring(v26):find("init.spec")).to.be.ok()
            local v27 = expect
            local v28 = v22._values[1]
            v27(tostring(v28):find("runExecutor")).to.be.ok()
        end)
        it("should work with C functions", function()
            expect(function()
                v_u_1.new(tick):andThen(tick)
            end).to.never.throw()
        end)
        it("should have a nice tostring", function()
            local v29 = expect
            local v30 = v_u_1.resolve
            v29(tostring(v30()):gmatch("Promise(Resolved)")).to.be.ok()
        end)
        it("should allow yielding", function()
            local v_u_31 = Instance.new("BindableEvent")
            local v33 = v_u_1.new(function(p32)
                v_u_31.Event:Wait()
                p32(5)
            end)
            expect(v33:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_31:Fire()
            expect(v33:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v33._values[1]).to.equal(5)
        end)
        it("should preserve stack traces of resolve-chained promises", function()
            local v35 = v_u_1.new(function(p34)
                p34(v_u_1.new(function()
                    error("sample text")
                end))
            end)
            expect(v35:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v36 = v35._values[1]
            local v37 = tostring(v36)
            expect(v37:find("sample text")).to.be.ok()
            expect(v37:find("nestedCall")).to.be.ok()
            expect(v37:find("runExecutor")).to.be.ok()
            expect(v37:find("runPlanNode")).to.be.ok()
            expect(v37:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
        end)
        it("should report errors from Promises with _error (< v2)", function()
            local v38 = v_u_1.reject()
            v38._error = "Sample error"
            local v39 = v_u_1.resolve():andThenReturn(v38)
            expect(v39:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v40 = v39._values[1]
            local v41 = tostring(v40)
            expect(v41:find("Sample error")).to.be.ok()
            expect(v41:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
            expect(v41:find("%[No stack trace available")).to.be.ok()
        end)
    end)
    describe("Promise.defer", function()
        it("should execute after the time event", function()
            local v_u_42 = 0
            local v47 = v_u_1.defer(function(p43, p44, p45, p46)
                expect((type(p43))).to.equal("function")
                expect((type(p44))).to.equal("function")
                expect((type(p45))).to.equal("function")
                expect((type(p46))).to.equal("nil")
                v_u_42 = v_u_42 + 1
                p43("foo")
            end)
            expect(v_u_42).to.equal(0)
            expect(v47:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6()
            expect(v_u_42).to.equal(1)
            expect(v47:getStatus()).to.equal(v_u_1.Status.Resolved)
            v_u_6()
            expect(v_u_42).to.equal(1)
        end)
    end)
    describe("Promise.delay", function()
        it("should schedule promise resolution", function()
            local v48 = v_u_1.delay(1)
            expect(v48:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6()
            expect(v48:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6(1)
            expect(v48:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should allow for delays to be cancelled", function()
            local v_u_49 = v_u_1.delay(2)
            v_u_1.delay(1):andThen(function()
                v_u_49:cancel()
            end)
            expect(v_u_49:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6()
            expect(v_u_49:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6(1)
            expect(v_u_49:getStatus()).to.equal(v_u_1.Status.Cancelled)
            v_u_6(1)
        end)
    end)
    describe("Promise.resolve", function()
        it("should immediately resolve with a value", function()
            local v50 = v_u_1.resolve(5, 6)
            expect(v50).to.be.ok()
            expect(v50:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v50._values[1]).to.equal(5)
            expect(v50._values[2]).to.equal(6)
        end)
        it("should chain onto passed promises", function()
            local v52 = v_u_1.resolve(v_u_1.new(function(_, p51)
                p51(7)
            end))
            expect(v52).to.be.ok()
            expect(v52:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v52._values[1]).to.equal(7)
        end)
    end)
    describe("Promise.reject", function()
        it("should immediately reject with a value", function()
            local v53 = v_u_1.reject(6, 7)
            expect(v53).to.be.ok()
            expect(v53:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v53._values[1]).to.equal(6)
            expect(v53._values[2]).to.equal(7)
        end)
        it("should pass a promise as-is as an error", function()
            local v55 = v_u_1.new(function(p54)
                p54(6)
            end)
            local v56 = v_u_1.reject(v55)
            expect(v56).to.be.ok()
            expect(v56:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v56._values[1]).to.equal(v55)
        end)
    end)
    describe("Promise:andThen", function()
        it("should allow yielding", function()
            local v_u_57 = Instance.new("BindableEvent")
            local v58 = v_u_1.resolve():andThen(function()
                v_u_57.Event:Wait()
                return 5
            end)
            expect(v58:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_57:Fire()
            expect(v58:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v58._values[1]).to.equal(5)
        end)
        it("should run andThens on a new thread", function()
            local v_u_59 = Instance.new("BindableEvent")
            local v_u_60 = nil
            local v62 = v_u_1.new(function(p61)
                v_u_60 = p61
            end)
            local v63 = v62:andThen(function()
                v_u_59.Event:Wait()
                return 5
            end)
            local v64 = v62:andThen(function()
                return "foo"
            end)
            expect(v62:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_60()
            expect(v64:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v64._values[1]).to.equal("foo")
            expect(v63:getStatus()).to.equal(v_u_1.Status.Started)
        end)
        it("should chain onto resolved promises", function()
            local v_u_65 = nil
            local v_u_66 = nil
            local v_u_67 = 0
            local v_u_68 = 0
            local v69 = v_u_1.resolve(5)
            local v72 = v69:andThen(function(...)
                local v70, v71 = v_u_7(...)
                v_u_66 = v70
                v_u_65 = v71
                v_u_67 = v_u_67 + 1
            end, function()
                v_u_68 = v_u_68 + 1
            end)
            expect(v_u_68).to.equal(0)
            expect(v_u_67).to.equal(1)
            expect(v_u_66).to.equal(1)
            expect(v_u_65[1]).to.equal(5)
            expect(v69).to.be.ok()
            expect(v69:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v69._values[1]).to.equal(5)
            expect(v72).to.be.ok()
            expect(v72).never.to.equal(v69)
            expect(v72:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v72._values).to.equal(0)
        end)
        it("should chain onto rejected promises", function()
            local v_u_73 = nil
            local v_u_74 = nil
            local v_u_75 = 0
            local v_u_76 = 0
            local v77 = v_u_1.reject(5)
            local v80 = v77:andThen(function(...)
                v_u_76 = v_u_76 + 1
            end, function(...)
                local v78, v79 = v_u_7(...)
                v_u_74 = v78
                v_u_73 = v79
                v_u_75 = v_u_75 + 1
            end)
            expect(v_u_76).to.equal(0)
            expect(v_u_75).to.equal(1)
            expect(v_u_74).to.equal(1)
            expect(v_u_73[1]).to.equal(5)
            expect(v77).to.be.ok()
            expect(v77:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v77._values[1]).to.equal(5)
            expect(v80).to.be.ok()
            expect(v80).never.to.equal(v77)
            expect(v80:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v80._values).to.equal(0)
        end)
        it("should reject on error in callback", function()
            local v_u_81 = 0
            local v82 = v_u_1.resolve(1):andThen(function()
                v_u_81 = v_u_81 + 1
                error("hahah")
            end)
            expect(v82).to.be.ok()
            expect(v_u_81).to.equal(1)
            expect(v82:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v83 = expect
            local v84 = v82._values[1]
            v83(tostring(v84):find("hahah")).to.be.ok()
            local v85 = expect
            local v86 = v82._values[1]
            v85(tostring(v86):find("init.spec")).to.be.ok()
            local v87 = expect
            local v88 = v82._values[1]
            v87(tostring(v88):find("runExecutor")).to.be.ok()
        end)
        it("should chain onto asynchronously resolved promises", function()
            local v_u_89 = nil
            local v_u_90 = nil
            local v_u_91 = 0
            local v_u_92 = 0
            local v_u_93 = nil
            local v95 = v_u_1.new(function(p94)
                v_u_93 = p94
            end)
            local v96 = v95:andThen(function(...)
                v_u_89 = { ... }
                v_u_90 = select("#", ...)
                v_u_91 = v_u_91 + 1
            end, function()
                v_u_92 = v_u_92 + 1
            end)
            expect(v_u_91).to.equal(0)
            expect(v_u_92).to.equal(0)
            v_u_93(6)
            expect(v_u_92).to.equal(0)
            expect(v_u_91).to.equal(1)
            expect(v_u_90).to.equal(1)
            expect(v_u_89[1]).to.equal(6)
            expect(v95).to.be.ok()
            expect(v95:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v95._values[1]).to.equal(6)
            expect(v96).to.be.ok()
            expect(v96).never.to.equal(v95)
            expect(v96:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v96._values).to.equal(0)
        end)
        it("should chain onto asynchronously rejected promises", function()
            local v_u_97 = nil
            local v_u_98 = nil
            local v_u_99 = 0
            local v_u_100 = 0
            local v_u_101 = nil
            local v103 = v_u_1.new(function(_, p102)
                v_u_101 = p102
            end)
            local v104 = v103:andThen(function()
                v_u_100 = v_u_100 + 1
            end, function(...)
                v_u_97 = { ... }
                v_u_98 = select("#", ...)
                v_u_99 = v_u_99 + 1
            end)
            expect(v_u_99).to.equal(0)
            expect(v_u_100).to.equal(0)
            v_u_101(6)
            expect(v_u_100).to.equal(0)
            expect(v_u_99).to.equal(1)
            expect(v_u_98).to.equal(1)
            expect(v_u_97[1]).to.equal(6)
            expect(v103).to.be.ok()
            expect(v103:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v103._values[1]).to.equal(6)
            expect(v104).to.be.ok()
            expect(v104).never.to.equal(v103)
            expect(v104:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v104._values).to.equal(0)
        end)
        it("should propagate errors through multiple levels", function()
            local v_u_105 = nil
            local v_u_106 = nil
            local v_u_107 = nil
            v_u_1.new(function(_, p108)
                p108(1, 2, 3)
            end):andThen(function() end):catch(function(p109, p110, p111)
                v_u_105 = p109
                v_u_106 = p110
                v_u_107 = p111
            end)
            expect(v_u_105).to.equal(1)
            expect(v_u_106).to.equal(2)
            expect(v_u_107).to.equal(3)
        end)
    end)
    describe("Promise:cancel", function()
        it("should mark promises as cancelled and not resolve or reject them", function()
            local v_u_112 = 0
            local v_u_113 = 0
            local v114 = v_u_1.new(function() end):andThen(function()
                v_u_112 = v_u_112 + 1
            end):finally(function()
                v_u_113 = v_u_113 + 1
            end)
            v114:cancel()
            v114:cancel()
            expect(v_u_112).to.equal(0)
            expect(v_u_113).to.equal(1)
            expect(v114:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should call the cancellation hook once", function()
            local v_u_115 = 0
            local v117 = v_u_1.new(function(_, _, p116)
                p116(function()
                    v_u_115 = v_u_115 + 1
                end)
            end)
            v117:cancel()
            v117:cancel()
            expect(v_u_115).to.equal(1)
        end)
        it("should propagate cancellations", function()
            local v118 = v_u_1.new(function() end)
            local v119 = v118:andThen()
            local v120 = v118:andThen()
            expect(v118:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v119:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v120:getStatus()).to.equal(v_u_1.Status.Started)
            v119:cancel()
            expect(v118:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v119:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v120:getStatus()).to.equal(v_u_1.Status.Started)
            v120:cancel()
            expect(v118:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v119:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v120:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should affect downstream promises", function()
            local v121 = v_u_1.new(function() end)
            local v122 = v121:andThen()
            v121:cancel()
            expect(v122:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should track consumers", function()
            local v_u_123 = v_u_1.new(function() end)
            local v124 = v_u_1.resolve()
            local v_u_125 = v124:finally(function()
                return v_u_123
            end)
            local v127 = v_u_1.new(function(p126)
                p126(v_u_125)
            end)
            local v128 = v127:andThen(function() end)
            expect(v_u_125._parent).to.never.equal(v124)
            expect(v127._parent).to.never.equal(v_u_125)
            expect(v127._consumers[v128]).to.be.ok()
            expect(v128._parent).to.equal(v127)
        end)
        it("should cancel resolved pending promises", function()
            local v_u_129 = v_u_1.new(function() end)
            local v131 = v_u_1.new(function(p130)
                p130(v_u_129)
            end):finally(function() end)
            v131:cancel()
            expect(v_u_129._status).to.equal(v_u_1.Status.Cancelled)
            expect(v131._status).to.equal(v_u_1.Status.Cancelled)
        end)
    end)
    describe("Promise:finally", function()
        it("should be called upon resolve, reject, or cancel", function()
            local v_u_132 = 0
            local function v133()
                v_u_132 = v_u_132 + 1
            end
            v_u_1.new(function(p134, _)
                p134()
            end):finally(v133)
            v_u_1.resolve():andThen(function() end):finally(v133):finally(v133)
            v_u_1.reject():finally(v133)
            v_u_1.new(function() end):finally(v133):cancel()
            expect(v_u_132).to.equal(5)
        end)
        it("should be a child of the parent Promise", function()
            local v135 = v_u_1.new(function() end)
            local v136 = v135:finally(function() end)
            expect(v136._parent).to.equal(v135)
            expect(v135._consumers[v136]).to.equal(true)
        end)
        it("should forward return values", function()
            local v_u_137 = nil
            v_u_1.resolve():finally(function()
                return 1
            end):andThen(function(p138)
                v_u_137 = p138
            end)
            expect(v_u_137).to.equal(1)
        end)
    end)
    describe("Promise.all", function()
        it("should error if given something other than a table", function()
            expect(function()
                v_u_1.all(1)
            end).to.throw()
        end)
        it("should resolve instantly with an empty table if given no promises", function()
            local v139 = v_u_1.all({})
            local v140, v141 = v139:_unwrap()
            expect(v140).to.equal(true)
            expect(v139:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v141).to.be.a("table")
            expect(next(v141)).to.equal(nil)
        end)
        it("should error if given non-promise values", function()
            expect(function()
                v_u_1.all({
                    {},
                    {},
                    {}
                })
            end).to.throw()
        end)
        it("should wait for all promises to be resolved and return their values", function()
            local v142, v_u_143 = v_u_7(1, "A string", nil, false)
            local v_u_144 = {}
            local v145 = {}
            for v_u_146 = 1, v142 do
                v145[v_u_146] = v_u_1.new(function(p147)
                    v_u_144[v_u_146] = { p147, v_u_143[v_u_146] }
                end)
            end
            local v148 = v_u_1.all(v145)
            for _, v149 in ipairs(v_u_144) do
                expect(v148:getStatus()).to.equal(v_u_1.Status.Started)
                v149[1](v149[2])
            end
            local v150, v151 = v_u_7(v148:_unwrap())
            local v152, v153 = unpack(v151, 1, v150)
            expect(v150).to.equal(2)
            expect(v152).to.equal(true)
            expect(v153).to.be.a("table")
            expect(#v153).to.equal(#v145)
            for v154 = 1, v142 do
                expect(v153[v154]).to.equal(v_u_143[v154])
            end
        end)
        it("should reject if any individual promise rejected", function()
            local v_u_155 = nil
            local v_u_156 = nil
            local v158 = v_u_1.new(function(_, p157)
                v_u_155 = p157
            end)
            local v160 = v_u_1.new(function(p159)
                v_u_156 = p159
            end)
            local v161 = v_u_1.all({ v158, v160 })
            expect(v161:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_155("baz", "qux")
            v_u_156("foo", "bar")
            local v162, v163 = v_u_7(v161:_unwrap())
            local v164, v165, v166 = unpack(v163, 1, v162)
            expect(v162).to.equal(3)
            expect(v164).to.equal(false)
            expect(v165).to.equal("baz")
            expect(v166).to.equal("qux")
            expect(v160:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should not resolve if resolved after rejecting", function()
            local v_u_167 = nil
            local v_u_168 = nil
            local v171 = { v_u_1.new(function(_, p169)
                    v_u_167 = p169
                end), (v_u_1.new(function(p170)
                    v_u_168 = p170
                end)) }
            local v172 = v_u_1.all(v171)
            expect(v172:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_167("baz", "qux")
            v_u_168("foo", "bar")
            local v173, v174 = v_u_7(v172:_unwrap())
            local v175, v176, v177 = unpack(v174, 1, v173)
            expect(v173).to.equal(3)
            expect(v175).to.equal(false)
            expect(v176).to.equal("baz")
            expect(v177).to.equal("qux")
        end)
        it("should only reject once", function()
            local v_u_178 = nil
            local v_u_179 = nil
            local v182 = { v_u_1.new(function(_, p180)
                    v_u_178 = p180
                end), (v_u_1.new(function(_, p181)
                    v_u_179 = p181
                end)) }
            local v183 = v_u_1.all(v182)
            expect(v183:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_178("foo", "bar")
            expect(v183:getStatus()).to.equal(v_u_1.Status.Rejected)
            v_u_179("baz", "qux")
            local v184, v185 = v_u_7(v183:_unwrap())
            local v186, v187, v188 = unpack(v185, 1, v184)
            expect(v184).to.equal(3)
            expect(v186).to.equal(false)
            expect(v187).to.equal("foo")
            expect(v188).to.equal("bar")
        end)
        it("should error if a non-array table is passed in", function()
            local v189, v190 = pcall(function()
                v_u_1.all(v_u_1.new(function() end))
            end)
            expect(v189).to.be.ok()
            expect(v190:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel pending promises if one rejects", function()
            local v191 = v_u_1.new(function() end)
            expect(v_u_1.all({ v_u_1.resolve(), v_u_1.reject(), v191 }):getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v191:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should cancel promises if it is cancelled", function()
            local v192 = v_u_1.new(function() end)
            v192:andThen(function() end)
            local v193 = { v_u_1.new(function() end), v_u_1.new(function() end), v192 }
            v_u_1.all(v193):cancel()
            expect(v193[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v193[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v193[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
    end)
    describe("Promise.fold", function()
        it("should return the initial value in a promise when the list is empty", function()
            local v194 = {}
            local v195 = v_u_1.fold({}, function()
                error("should not be called")
            end, v194)
            expect(v_u_1.is(v195)).to.equal(true)
            expect(v195:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v195:expect()).to.equal(v194)
        end)
        it("should accept promises in the list", function()
            local v198 = v_u_1.fold({ v_u_1.resolve(1), 2, 3 }, function(p196, p197)
                return p196 + p197
            end, 0)
            expect(v_u_1.is(v198)).to.equal(true)
            expect(v198:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v198:expect()).to.equal(6)
        end)
        it("should always return a promise even if the list or reducer don\'t use them", function()
            local v202 = v_u_1.fold({ 1, 2, 3 }, function(p199, p200, p201)
                if p201 == 2 then
                    return v_u_1.delay(1):andThenReturn(p199 + p200)
                else
                    return p199 + p200
                end
            end, 0)
            expect(v_u_1.is(v202)).to.equal(true)
            expect(v202:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6(2)
            expect(v202:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v202:expect()).to.equal(6)
        end)
        it("should return the first rejected promise", function()
            local v206 = v_u_1.fold({ 1, 2, 3 }, function(p203, p204, p205)
                if p205 == 2 then
                    return v_u_1.reject("foo")
                else
                    return p203 + p204
                end
            end, 0)
            expect(v_u_1.is(v206)).to.equal(true)
            local v207, v208 = v206:awaitStatus()
            expect(v207).to.equal(v_u_1.Status.Rejected)
            expect(v208).to.equal("foo")
        end)
        it("should return the first canceled promise", function()
            local v_u_209 = nil
            local v213 = v_u_1.fold({ 1, 2, 3 }, function(p210, p211, p212)
                if p212 == 1 then
                    return p210 + p211
                end
                if p212 == 2 then
                    v_u_209 = v_u_1.delay(1):andThenReturn(p210 + p211)
                    return v_u_209
                end
                error("this should not run if the promise is cancelled")
            end, 0)
            expect(v_u_1.is(v213)).to.equal(true)
            expect(v213:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_209:cancel()
            expect(v213:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
    end)
    describe("Promise.race", function()
        it("should resolve with the first settled value", function()
            local v215 = v_u_1.race({ v_u_1.resolve(1), v_u_1.resolve(2) }):andThen(function(p214)
                expect(p214).to.equal(1)
            end)
            expect(v215:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should cancel other promises", function()
            local v216 = v_u_1.new(function() end)
            v216:andThen(function() end)
            local v218 = { v216, v_u_1.new(function() end), v_u_1.new(function(p217)
                    p217(2)
                end) }
            local v219 = v_u_1.race(v218)
            expect(v219:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v219._values[1]).to.equal(2)
            expect(v218[1]:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v218[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v218[3]:getStatus()).to.equal(v_u_1.Status.Resolved)
            local v220 = v_u_1.new(function() end)
            expect(v_u_1.race({ v_u_1.reject(), v_u_1.resolve(), v220 }):getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v220:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should error if a non-array table is passed in", function()
            local v221, v222 = pcall(function()
                v_u_1.race(v_u_1.new(function() end))
            end)
            expect(v221).to.be.ok()
            expect(v222:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel promises if it is cancelled", function()
            local v223 = v_u_1.new(function() end)
            v223:andThen(function() end)
            local v224 = { v_u_1.new(function() end), v_u_1.new(function() end), v223 }
            v_u_1.race(v224):cancel()
            expect(v224[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v224[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v224[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
    end)
    describe("Promise.promisify", function()
        it("should wrap functions", function()
            local v226 = v_u_1.promisify(function(p225)
                return p225 + 1
            end)(1)
            local v227, v228 = v226:_unwrap()
            expect(v227).to.equal(true)
            expect(v226:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v228).to.equal(2)
        end)
        it("should catch errors after a yield", function()
            local v_u_229 = Instance.new("BindableEvent")
            local v230 = v_u_1.promisify(function()
                v_u_229.Event:Wait()
                error("errortext")
            end)()
            expect(v230:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_229:Fire()
            expect(v230:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v231 = expect
            local v232 = v230._values[1]
            v231(tostring(v232):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise.tap", function()
        it("should thread through values", function()
            local v_u_233 = nil
            local v_u_234 = nil
            v_u_1.resolve(1):andThen(function(p235)
                return p235 + 1
            end):tap(function(p236)
                v_u_233 = p236
                return p236 + 1
            end):andThen(function(p237)
                v_u_234 = p237
            end)
            expect(v_u_233).to.equal(2)
            expect(v_u_234).to.equal(2)
        end)
        it("should chain onto promises", function()
            local v_u_238 = nil
            local v_u_239 = nil
            local v242 = v_u_1.resolve(1):tap(function()
                return v_u_1.new(function(p240)
                    v_u_238 = p240
                end)
            end):andThen(function(p241)
                v_u_239 = p241
            end)
            expect(v242:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v_u_239).to.never.be.ok()
            v_u_238(1)
            expect(v242:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v_u_239).to.equal(1)
        end)
    end)
    describe("Promise.try", function()
        it("should catch synchronous errors", function()
            local v_u_243 = nil
            v_u_1.try(function()
                error("errortext")
            end):catch(function(p244)
                v_u_243 = tostring(p244)
            end)
            expect(v_u_243:find("errortext")).to.be.ok()
        end)
        it("should reject with error objects", function()
            local v_u_245 = {}
            local v246, v247 = v_u_1.try(function()
                error(v_u_245)
            end):_unwrap()
            expect(v246).to.equal(false)
            expect(v247).to.equal(v_u_245)
        end)
        it("should catch asynchronous errors", function()
            local v_u_248 = Instance.new("BindableEvent")
            local v249 = v_u_1.try(function()
                v_u_248.Event:Wait()
                error("errortext")
            end)
            expect(v249:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_248:Fire()
            expect(v249:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v250 = expect
            local v251 = v249._values[1]
            v250(tostring(v251):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise:andThenReturn", function()
        it("should return the given values", function()
            local v_u_252 = nil
            local v_u_253 = nil
            v_u_1.resolve():andThenReturn(1, 2):andThen(function(p254, p255)
                v_u_252 = p254
                v_u_253 = p255
            end)
            expect(v_u_252).to.equal(1)
            expect(v_u_253).to.equal(2)
        end)
    end)
    describe("Promise:doneReturn", function()
        it("should return the given values", function()
            local v_u_256 = nil
            local v_u_257 = nil
            v_u_1.resolve():doneReturn(1, 2):andThen(function(p258, p259)
                v_u_256 = p258
                v_u_257 = p259
            end)
            expect(v_u_256).to.equal(1)
            expect(v_u_257).to.equal(2)
        end)
    end)
    describe("Promise:andThenCall", function()
        it("should call the given function with arguments", function()
            local v_u_260 = nil
            local v_u_261 = nil
            v_u_1.resolve():andThenCall(function(p262, p263)
                v_u_260 = p262
                v_u_261 = p263
            end, 3, 4)
            expect(v_u_260).to.equal(3)
            expect(v_u_261).to.equal(4)
        end)
    end)
    describe("Promise:doneCall", function()
        it("should call the given function with arguments", function()
            local v_u_264 = nil
            local v_u_265 = nil
            v_u_1.resolve():doneCall(function(p266, p267)
                v_u_264 = p266
                v_u_265 = p267
            end, 3, 4)
            expect(v_u_264).to.equal(3)
            expect(v_u_265).to.equal(4)
        end)
    end)
    describe("Promise:done", function()
        it("should trigger on resolve or cancel", function()
            local v268 = v_u_1.new(function() end)
            local v_u_269 = nil
            local v270 = v268:done(function()
                v_u_269 = true
            end)
            expect(v_u_269).to.never.be.ok()
            v268:cancel()
            expect(v270:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v_u_269).to.equal(true)
            local v_u_271 = nil
            local v_u_272 = nil
            v_u_1.reject():done(function()
                v_u_271 = true
            end):finally(function()
                v_u_272 = true
            end)
            expect(v_u_271).to.never.be.ok()
            expect(v_u_272).to.be.ok()
        end)
    end)
    describe("Promise.some", function()
        it("should resolve once the goal is reached", function()
            local v273 = v_u_1.some({ v_u_1.resolve(1), v_u_1.reject(), v_u_1.resolve(2) }, 2)
            expect(v273:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v273._values[1][1]).to.equal(1)
            expect(v273._values[1][2]).to.equal(2)
        end)
        it("should error if the goal can\'t be reached", function()
            expect(v_u_1.some({ v_u_1.resolve(), v_u_1.reject() }, 2):getStatus()).to.equal(v_u_1.Status.Rejected)
            local v_u_274 = nil
            local v276 = v_u_1.some({ v_u_1.resolve(), v_u_1.new(function(_, p275)
                    v_u_274 = p275
                end) }, 2)
            expect(v276:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_274("foo")
            expect(v276:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v276._values[1]).to.equal("foo")
        end)
        it("should cancel pending Promises once the goal is reached", function()
            local v_u_277 = nil
            local v278 = v_u_1.new(function() end)
            local v280 = v_u_1.new(function(p279)
                v_u_277 = p279
            end)
            local v281 = v_u_1.some({ v278, v280, v_u_1.resolve() }, 2)
            expect(v281:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v278:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v280:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_277()
            expect(v281:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v278:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v280:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should error if passed a non-number", function()
            expect(function()
                v_u_1.some({}, "non-number")
            end).to.throw()
        end)
        it("should return an empty array if amount is 0", function()
            local v282 = v_u_1.some({ v_u_1.resolve(2) }, 0)
            expect(v282:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v282._values[1]).to.equal(0)
        end)
        it("should not return extra values", function()
            local v283 = v_u_1.some({
                v_u_1.resolve(1),
                v_u_1.resolve(2),
                v_u_1.resolve(3),
                v_u_1.resolve(4)
            }, 2)
            expect(v283:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v283._values[1]).to.equal(2)
            expect(v283._values[1][1]).to.equal(1)
            expect(v283._values[1][2]).to.equal(2)
        end)
        it("should cancel promises if it is cancelled", function()
            local v284 = v_u_1.new(function() end)
            v284:andThen(function() end)
            local v285 = { v_u_1.new(function() end), v_u_1.new(function() end), v284 }
            v_u_1.some(v285, 3):cancel()
            expect(v285[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v285[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v285[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
        describe("Promise.any", function()
            it("should return the value directly", function()
                local v286 = v_u_1.any({ v_u_1.reject(), v_u_1.reject(), v_u_1.resolve(1) })
                expect(v286:getStatus()).to.equal(v_u_1.Status.Resolved)
                expect(v286._values[1]).to.equal(1)
            end)
            it("should error if all are rejected", function()
                expect(v_u_1.any({ v_u_1.reject(), v_u_1.reject(), v_u_1.reject() }):getStatus()).to.equal(v_u_1.Status.Rejected)
            end)
        end)
    end)
    describe("Promise.allSettled", function()
        it("should resolve with an array of PromiseStatuses", function()
            local v_u_287 = nil
            local v289 = v_u_1.allSettled({
                v_u_1.resolve(),
                v_u_1.reject(),
                v_u_1.resolve(),
                v_u_1.new(function(_, p288)
                    v_u_287 = p288
                end)
            })
            expect(v289:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_287()
            expect(v289:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v289._values[1][1]).to.equal(v_u_1.Status.Resolved)
            expect(v289._values[1][2]).to.equal(v_u_1.Status.Rejected)
            expect(v289._values[1][3]).to.equal(v_u_1.Status.Resolved)
            expect(v289._values[1][4]).to.equal(v_u_1.Status.Rejected)
        end)
        it("should cancel promises if it is cancelled", function()
            local v290 = v_u_1.new(function() end)
            v290:andThen(function() end)
            local v291 = { v_u_1.new(function() end), v_u_1.new(function() end), v290 }
            v_u_1.allSettled(v291):cancel()
            expect(v291[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v291[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v291[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
    end)
    describe("Promise:await", function()
        it("should return the correct values", function()
            local v292, v293, v294, v295, v296 = v_u_1.resolve(5, 6, nil, 7):await()
            expect(v292).to.equal(true)
            expect(v293).to.equal(5)
            expect(v294).to.equal(6)
            expect(v295).to.equal(nil)
            expect(v296).to.equal(7)
        end)
    end)
    describe("Promise:expect", function()
        it("should throw the correct values", function()
            local v297 = {}
            local v_u_298 = v_u_1.reject(v297)
            local v299, v300 = pcall(function()
                v_u_298:expect()
            end)
            expect(v299).to.equal(false)
            expect(v300).to.equal(v297)
        end)
    end)
    describe("Promise:now", function()
        it("should resolve if the Promise is resolved", function()
            local v301, v302 = v_u_1.resolve("foo"):now():_unwrap()
            expect(v301).to.equal(true)
            expect(v302).to.equal("foo")
        end)
        it("should reject if the Promise is not resolved", function()
            local v303, v304 = v_u_1.new(function() end):now():_unwrap()
            expect(v303).to.equal(false)
            expect(v_u_1.Error.isKind(v304, "NotResolvedInTime")).to.equal(true)
        end)
        it("should reject with a custom rejection value", function()
            local v305, v306 = v_u_1.new(function() end):now("foo"):_unwrap()
            expect(v305).to.equal(false)
            expect(v306).to.equal("foo")
        end)
    end)
    describe("Promise.each", function()
        it("should iterate", function()
            local v307, v308 = v_u_1.each({
                "foo",
                "bar",
                "baz",
                "qux"
            }, function(...)
                return { ... }
            end):_unwrap()
            expect(v307).to.equal(true)
            expect(v308[1][1]).to.equal("foo")
            expect(v308[1][2]).to.equal(1)
            expect(v308[2][1]).to.equal("bar")
            expect(v308[2][2]).to.equal(2)
            expect(v308[3][1]).to.equal("baz")
            expect(v308[3][2]).to.equal(3)
            expect(v308[4][1]).to.equal("qux")
            expect(v308[4][2]).to.equal(4)
        end)
        it("should iterate serially", function()
            local v_u_309 = {}
            local v_u_310 = {}
            local v316 = v_u_1.each({ "foo", "bar", "baz" }, function(p_u_311, p312)
                v_u_310[p312] = (v_u_310[p312] or 0) + 1
                return v_u_1.new(function(p_u_313)
                    local v314 = v_u_309
                    local function v315()
                        p_u_313(p_u_311:upper())
                    end
                    table.insert(v314, v315)
                end)
            end)
            expect(v316:getStatus()).to.equal(v_u_1.Status.Started)
            expect(#v_u_309).to.equal(1)
            expect(v_u_310[1]).to.equal(1)
            expect(v_u_310[2]).to.never.be.ok()
            table.remove(v_u_309, 1)()
            expect(v316:getStatus()).to.equal(v_u_1.Status.Started)
            expect(#v_u_309).to.equal(1)
            expect(v_u_310[1]).to.equal(1)
            expect(v_u_310[2]).to.equal(1)
            expect(v_u_310[3]).to.never.be.ok()
            table.remove(v_u_309, 1)()
            expect(v316:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v_u_310[1]).to.equal(1)
            expect(v_u_310[2]).to.equal(1)
            expect(v_u_310[3]).to.equal(1)
            table.remove(v_u_309, 1)()
            expect(v316:getStatus()).to.equal(v_u_1.Status.Resolved)
            local v317 = expect
            local v318 = v316._values[1]
            v317((type(v318))).to.equal("table")
            local v319 = expect
            local v320 = v316._values[2]
            v319((type(v320))).to.equal("nil")
            local v321 = v316._values[1]
            expect(v321[1]).to.equal("FOO")
            expect(v321[2]).to.equal("BAR")
            expect(v321[3]).to.equal("BAZ")
        end)
        it("should reject with the value if the predicate promise rejects", function()
            local v322 = v_u_1.each({ 1, 2, 3 }, function()
                return v_u_1.reject("foobar")
            end)
            expect(v322:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v322._values[1]).to.equal("foobar")
        end)
        it("should allow Promises to be in the list and wait when it gets to them", function()
            local v_u_323 = nil
            local v325 = { (v_u_1.new(function(p324)
                    v_u_323 = p324
                end)) }
            local v327 = v_u_1.each(v325, function(p326)
                return p326 * 2
            end)
            expect(v327:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_323(2)
            expect(v327:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v327._values[1][1]).to.equal(4)
        end)
        it("should reject with the value if a Promise from the list rejects", function()
            local v_u_328 = false
            local v329 = v_u_1.each({ 1, 2, v_u_1.reject("foobar") }, function(_)
                v_u_328 = true
                return "never"
            end)
            expect(v329:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v329._values[1]).to.equal("foobar")
            expect(v_u_328).to.equal(false)
        end)
        it("should reject immediately if there\'s a cancelled Promise in the list initially", function()
            local v330 = v_u_1.new(function() end)
            v330:cancel()
            local v_u_331 = false
            local v332 = v_u_1.each({ 1, 2, v330 }, function()
                v_u_331 = true
            end)
            expect(v332:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v_u_331).to.equal(false)
            expect(v332._values[1].kind).to.equal(v_u_1.Error.Kind.AlreadyCancelled)
        end)
        it("should stop iteration if Promise.each is cancelled", function()
            local v_u_333 = {}
            local v335 = v_u_1.each({ "foo", "bar", "baz" }, function(_, p334)
                v_u_333[p334] = (v_u_333[p334] or 0) + 1
                return v_u_1.new(function() end)
            end)
            expect(v335:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v_u_333[1]).to.equal(1)
            expect(v_u_333[2]).to.never.be.ok()
            v335:cancel()
            expect(v335:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v_u_333[1]).to.equal(1)
            expect(v_u_333[2]).to.never.be.ok()
        end)
        it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function()
            local v_u_336 = nil
            v_u_1.each({ "foo", "bar", "baz" }, function(_, _)
                v_u_336 = v_u_1.new(function() end)
                return v_u_336
            end):cancel()
            expect(v_u_336:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should cancel Promises in the list if Promise.each is cancelled", function()
            local v337 = v_u_1.new(function() end)
            v_u_1.each({ v337 }, function() end):cancel()
            expect(v337:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
    end)
    describe("Promise.retry", function()
        it("should retry N times", function()
            local v_u_338 = 0
            local v340 = v_u_1.retry(function(p339)
                expect(p339).to.equal("foo")
                v_u_338 = v_u_338 + 1
                if v_u_338 == 5 then
                    return v_u_1.resolve("ok")
                else
                    return v_u_1.reject("fail")
                end
            end, 5, "foo")
            expect(v340:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v340._values[1]).to.equal("ok")
        end)
        it("should reject if threshold is exceeded", function()
            local v341 = v_u_1.retry(function()
                return v_u_1.reject("fail")
            end, 5)
            expect(v341:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v341._values[1]).to.equal("fail")
        end)
    end)
    describe("Promise.fromEvent", function()
        it("should convert a Promise into an event", function()
            local v342 = Instance.new("BindableEvent")
            local v343 = v_u_1.fromEvent(v342.Event)
            expect(v343:getStatus()).to.equal(v_u_1.Status.Started)
            v342:Fire("foo")
            expect(v343:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v343._values[1]).to.equal("foo")
        end)
        it("should convert a Promise into an event with the predicate", function()
            local v344 = Instance.new("BindableEvent")
            local v346 = v_u_1.fromEvent(v344.Event, function(p345)
                return p345 == "foo"
            end)
            expect(v346:getStatus()).to.equal(v_u_1.Status.Started)
            v344:Fire("bar")
            expect(v346:getStatus()).to.equal(v_u_1.Status.Started)
            v344:Fire("foo")
            expect(v346:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v346._values[1]).to.equal("foo")
        end)
    end)
    describe("Promise.is", function()
        it("should work with current version", function()
            local v347 = v_u_1.resolve(1)
            expect(v_u_1.is(v347)).to.equal(true)
        end)
        it("should work with any object with an andThen", function()
            expect(v_u_1.is({
                ["andThen"] = function()
                    return 1
                end
            })).to.equal(true)
        end)
        it("should work with older promises", function()
            local v348 = {
                ["prototype"] = {}
            }
            v348.__index = v348.prototype
            function v348.prototype.andThen(_) end
            local v349 = setmetatable({}, v348)
            expect(v_u_1.is(v349)).to.equal(true)
        end)
    end)
end