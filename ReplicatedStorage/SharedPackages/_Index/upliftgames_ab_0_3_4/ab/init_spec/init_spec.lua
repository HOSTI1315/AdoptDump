--// ReplicatedStorage.SharedPackages._Index.upliftgames_ab@0.3.4.ab.init.spec (ModuleScript)

local v_u_1 = require(script.Parent)
local v_u_2 = {
    ["UserId"] = 1234
}
local v_u_3 = {
    ["UserId"] = 1235
}
return function()
    describe("registerTests", function()
        it("should register tests", function()
            local v4 = {}
            local v5 = {
                ["name"] = "test",
                ["groups"] = {
                    {
                        ["name"] = "A",
                        ["weight"] = 1
                    },
                    {
                        ["name"] = "B",
                        ["weight"] = 1
                    },
                    {
                        ["name"] = "C",
                        ["weight"] = 2
                    },
                    {
                        ["name"] = "D",
                        ["weight"] = 1
                    }
                }
            }
            __set_list(v4, 1, {v5, {
    ["name"] = "test3",
    ["groups"] = { "X", "Y", "Z" },
    ["override"] = function(p6)
        if p6.UserId == v_u_3.UserId then
            return "Y"
        end
    end
}})
            v_u_1.registerTests(v4)
            v_u_1.registerTests({
                {
                    ["name"] = "test2",
                    ["groups"] = { "X", "Y", "Z" },
                    ["tags"] = { "robux" }
                }
            })
            local v7 = v_u_1.registerTests
            local v8 = {}
            local v9 = {
                ["name"] = "test4"
            }
            local v10 = {}
            local v11 = {
                ["name"] = "B",
                ["weight"] = 1,
                ["subgroups"] = {
                    {
                        ["name"] = "B1",
                        ["weight"] = 1
                    },
                    {
                        ["name"] = "B2",
                        ["weight"] = 1
                    }
                }
            }
            __set_list(v10, 1, {{
    ["name"] = "A",
    ["weight"] = 1,
    ["subgroups"] = { "A1", "A2", "A" }
}, v11, {
    ["name"] = "C",
    ["weight"] = 1
}, {
    ["name"] = "D",
    ["weight"] = 1
}, {
    ["name"] = "E",
    ["weight"] = 1
}})
            v9.groups = v10
            __set_list(v8, 1, {v9})
            v7(v8)
            expect(v_u_1._tests.test.name).to.equal("test")
        end)
        it("should error if you register duplicate tests without overwrite = true", function()
            expect(function()
                v_u_1.registerTests({
                    {
                        ["name"] = "test2",
                        ["groups"] = { "X", "Y", "Z" },
                        ["tags"] = { "robux" }
                    }
                })
            end).to.throw()
            expect(function()
                v_u_1.registerTests({
                    {
                        ["name"] = "test2",
                        ["groups"] = { "X", "Y", "Z" },
                        ["tags"] = { "robux" }
                    }
                }, true)
            end).to.never.throw()
        end)
        it("should register tests with or without a test log_name", function()
            v_u_1.registerTests({
                {
                    ["name"] = "test5",
                    ["groups"] = { "X", "Y", "Z" }
                },
                {
                    ["name"] = "test6",
                    ["logName"] = "non static log name",
                    ["groups"] = { "X", "Y", "Z" }
                }
            })
            expect(v_u_1._tests.test5.logName).to.equal("test5")
            expect(v_u_1._tests.test6.logName).to.equal("non static log name")
        end)
    end)
    describe("getPlayerGroup", function()
        it("should determine a player\'s test group", function()
            expect(v_u_1.getPlayerGroupOrNil(v_u_2, "test")).to.equal("B")
            expect(v_u_1.getPlayerGroupOrNil(v_u_3, "test")).to.equal("C")
            expect(v_u_1.getPlayerGroupOrNil(v_u_2, "test2")).to.equal("X")
            expect(v_u_1.getPlayerGroupOrNil(v_u_3, "test2")).to.equal("Y")
            expect(v_u_1.getPlayerGroupOrNil(v_u_2, "test3")).to.equal("Z")
            expect(v_u_1.getPlayerGroupOrNil(v_u_3, "test3")).to.equal("Y")
            expect(v_u_1.getPlayerGroupOrNil(v_u_2, "test4")).to.equal("A")
            expect(v_u_1.getPlayerGroupOrNil(v_u_3, "test4")).to.equal("B2")
        end)
    end)
    describe("getPlayerGroups", function()
        it("should give all test groups in a dict", function()
            expect(v_u_1.getPlayerGroups(v_u_2).test).to.equal("B")
            expect(v_u_1.getPlayerGroups(v_u_3).test).to.equal("C")
            expect(v_u_1.getPlayerGroups(v_u_3).test2).to.equal("Y")
            expect(v_u_1.getPlayerGroups(v_u_2).test4).to.equal("A")
            expect(v_u_1.getPlayerGroups(v_u_3).test4).to.equal("B2")
        end)
        it("should only give tests matching the tag", function()
            local v12 = v_u_1.getPlayerGroups(v_u_2, {
                ["filter_tag"] = "robux"
            })
            expect(v12.test).to.never.be.ok()
            expect(v12.test2).to.be.ok()
            expect(v12.test3).to.never.be.ok()
            expect(v12.test4).to.never.be.ok()
        end)
        it("should prefix keys", function()
            local v13 = v_u_1.getPlayerGroups(v_u_2, {
                ["keys_prefix"] = "ab_"
            })
            expect(v13.ab_test).to.be.ok()
            expect(v13.ab_test2).to.be.ok()
            expect(v13.ab_test3).to.be.ok()
            expect(v13.ab_test4).to.be.ok()
        end)
    end)
    describe("getTestNames", function()
        it("should return a list of names", function()
            local v14 = v_u_1.getTestNames()
            expect(v14[1]).to.equal("test")
            expect(v14[2]).to.equal("test2")
            expect(v14[3]).to.equal("test3")
            expect(v14[4]).to.equal("test4")
        end)
    end)
end