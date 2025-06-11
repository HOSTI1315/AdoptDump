--// ReplicatedStorage.new.modules.ABTest.ConcurrentABTestHandler.spec (ModuleScript)

return function()
    local v1 = require(script.Parent)
    local v_u_2 = require(script.Parent.ConcurrentABTestHandler)
    local v_u_3 = require(script.Parent.Parent.ABTest.ABTestManagerServer)
    local v_u_4 = require(game.ReplicatedStorage.SharedPackages.AB)
    local v_u_5 = require(script.Parent.Parent.LegacyLoad)
    local v_u_6 = v_u_5("DataM")
    local v_u_7 = nil
    local v_u_8 = nil
    local v_u_9 = 0
    local function v_u_13(p10)
        local v11 = v_u_4.registerTest
        local v12 = {
            ["name"] = v_u_2.key,
            ["groups"] = {
                {
                    ["name"] = "nonparticipating",
                    ["weight"] = p10.nonparticipating or 0
                },
                {
                    ["name"] = "control",
                    ["weight"] = p10.control or 0
                },
                {
                    ["name"] = "test_a",
                    ["weight"] = p10.test_a or 0
                },
                {
                    ["name"] = "test_b",
                    ["weight"] = p10.test_b or 0
                }
            }
        }
        v11(v12, true)
    end
    local function v_u_18(p14, p15)
        local v16 = v_u_4.registerTest
        local v17 = {
            ["name"] = p14,
            ["groups"] = {
                {
                    ["name"] = "nonparticipating",
                    ["weight"] = p15 == "nonparticipating" and 1 or 0
                },
                {
                    ["name"] = "control",
                    ["weight"] = p15 == "control" and 1 or 0
                },
                {
                    ["name"] = "test_group",
                    ["weight"] = p15 == "test_group" and 1 or 0
                }
            }
        }
        v16(v17, true)
    end
    beforeEach(function()
        v_u_4.deleteTest(v_u_2.key)
        v_u_9 = v_u_9 + 1
        v_u_8 = {
            ["UserId"] = v_u_9,
            ["Name"] = "MockPlayer_ConcurrentABTestHandler_" .. v_u_9
        }
        v_u_7 = v_u_6.create_store(v_u_8)
        v_u_7:set("ab_test_manager", (v_u_3.new(v_u_8)))
    end)
    afterEach(function()
        v_u_4.deleteTest("test_a")
        v_u_4.deleteTest("test_b")
    end)
    local v19 = {
        ["key"] = "test_a",
        ["default_values"] = {},
        ["groups"] = {
            ["test_group"] = {}
        }
    }
    local v_u_20 = v1.new(v19)
    local v21 = {
        ["key"] = "test_b",
        ["default_values"] = {},
        ["groups"] = {
            ["test_group"] = {}
        }
    }
    local v_u_22 = v1.new(v21)
    local v23 = {
        ["key"] = "test_c",
        ["default_values"] = {},
        ["groups"] = {
            ["test_group"] = {}
        }
    }
    local v_u_24 = v1.new(v23)
    describe("control group", function()
        it("should assign players in all participating tests to control", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13({
                ["control"] = 1
            })
            expect(v_u_20:get_group(v_u_8)).to.equal("control")
            expect(v_u_22:get_group(v_u_8)).to.equal("control")
        end)
    end)
    describe("nonparticipating group", function()
        it("should mark all participating tests as nonparticipating", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13({
                ["nonparticipating"] = 1
            })
            expect(v_u_20:get_group(v_u_8)).to.equal("nonparticipating")
            expect(v_u_22:get_group(v_u_8)).to.equal("nonparticipating")
        end)
    end)
    describe("other groups", function()
        it("should defer to the assigned test\'s groups", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13({
                ["test_a"] = 1
            })
            expect(v_u_20:get_group(v_u_8)).to.equal("test_group")
        end)
        it("should mark all other participating tests as nonparticipating", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13({
                ["test_a"] = 1
            })
            expect(v_u_22:get_group(v_u_8)).to.equal("nonparticipating")
        end)
    end)
    describe("unaffected tests", function()
        it("should defer to all test\'s groups that aren\'t in the concurrent test", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_18("test_c", "test_group")
            v_u_13({
                ["control"] = 1
            })
            expect(v_u_24:get_group(v_u_8)).to.equal("test_group")
            v_u_13({
                ["test_a"] = 1
            })
            expect(v_u_24:get_group(v_u_8)).to.equal("test_group")
        end)
    end)
    describe("distribution", function()
        local v_u_25 = {}
        for v26 = 1, 10000 do
            v_u_9 = v_u_9 + 1
            v_u_25[v26] = {
                ["UserId"] = v_u_9,
                ["Name"] = "MockPlayer_ConcurrentABTestHandler_" .. v_u_9
            }
        end
        local function v_u_32(p27)
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13(p27)
            local v28 = {
                ["control"] = 0,
                ["test_a"] = 0,
                ["test_b"] = 0
            }
            for _, v29 in v_u_25 do
                local v30 = v_u_20:get_group(v29)
                local v31 = v_u_22:get_group(v29)
                if v30 == "control" and v31 == "control" then
                    v28.control = v28.control + 1
                else
                    if v30 == "test_group" then
                        v28.test_a = v28.test_a + 1
                    end
                    if v31 == "test_group" then
                        v28.test_b = v28.test_b + 1
                    end
                end
            end
            return v28
        end
        it("should assign players to multiple tests as expected", function()
            local v33 = {
                ["control"] = 3333.3333333333335,
                ["test_a"] = 3333.3333333333335,
                ["test_b"] = 3333.3333333333335
            }
            for v34, v35 in v_u_32({
                ["control"] = 1,
                ["test_a"] = 1,
                ["test_b"] = 1
            }) do
                expect(v35).to.be.near(v33[v34], 100)
            end
        end)
        it("should assign players to one test as expected", function()
            local v36 = {
                ["control"] = 6666.666666666667,
                ["test_a"] = 3333.3333333333335,
                ["test_b"] = 0
            }
            for v37, v38 in v_u_32({
                ["control"] = 2,
                ["test_a"] = 1
            }) do
                expect(v38).to.be.near(v36[v37], 100)
            end
        end)
        it("should assign players with no control as expected", function()
            local v39 = {
                ["control"] = 0,
                ["test_a"] = 5000,
                ["test_b"] = 5000
            }
            for v40, v41 in v_u_32({
                ["test_a"] = 1,
                ["test_b"] = 1
            }) do
                expect(v41).to.be.near(v39[v40], 100)
            end
        end)
        it("should assign players with nonparticipating as expected", function()
            local v42 = {
                ["nonparticipating"] = 10000,
                ["control"] = 0,
                ["test_a"] = 0,
                ["test_b"] = 0
            }
            for v43, v44 in v_u_32({
                ["nonparticipating"] = 1
            }) do
                expect(v44).to.equal(v42[v43])
            end
        end)
    end)
    describe("add_ab_group_data Stash Transformer", function()
        local v_u_45 = v_u_5("RegisterStashTransformers")
        it("should not report the concurrent test itself", function()
            v_u_13({
                ["control"] = 1
            })
            local v46 = {}
            v_u_45.transformers.add_ab_group_data(v46, v_u_8)
            expect(v46.ab_test_groups).to.be.ok()
            expect(table.find(v46.ab_test_groups, (("%*:control"):format(v_u_2.key)))).never.to.be.ok()
        end)
        it("should report the control group correctly", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13({
                ["control"] = 1
            })
            local v47 = {}
            v_u_45.transformers.add_ab_group_data(v47, v_u_8)
            expect(v47.ab_test_groups).to.be.ok()
            expect(table.find(v47.ab_test_groups, (("%*:control"):format("test_a")))).to.be.ok()
            expect(table.find(v47.ab_test_groups, (("%*:control"):format("test_b")))).to.be.ok()
        end)
        it("should report the nonparticipating group correctly", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13({
                ["nonparticipating"] = 1
            })
            local v48 = {}
            v_u_45.transformers.add_ab_group_data(v48, v_u_8)
            expect(v48.ab_test_groups).to.be.ok()
            expect(table.find(v48.ab_test_groups, (("%*:test_group"):format("test_a")))).never.to.be.ok()
            expect(table.find(v48.ab_test_groups, (("%*:control"):format("test_a")))).never.to.be.ok()
            expect(table.find(v48.ab_test_groups, (("%*:test_group"):format("test_b")))).never.to.be.ok()
            expect(table.find(v48.ab_test_groups, (("%*:control"):format("test_b")))).never.to.be.ok()
        end)
        it("should report the test groups correctly", function()
            v_u_18("test_a", "test_group")
            v_u_18("test_b", "test_group")
            v_u_13({
                ["test_a"] = 1
            })
            local v49 = {}
            v_u_45.transformers.add_ab_group_data(v49, v_u_8)
            expect(v49.ab_test_groups).to.be.ok()
            expect(table.find(v49.ab_test_groups, (("%*:test_group"):format("test_a")))).to.be.ok()
            expect(table.find(v49.ab_test_groups, (("%*:test_group"):format("test_b")))).never.to.be.ok()
            expect(table.find(v49.ab_test_groups, (("%*:control"):format("test_b")))).never.to.be.ok()
        end)
    end)
end