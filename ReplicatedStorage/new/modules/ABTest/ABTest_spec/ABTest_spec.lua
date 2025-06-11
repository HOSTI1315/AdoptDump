--// ReplicatedStorage.new.modules.ABTest.ABTest.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent)
    local v_u_2 = require(script.Parent.Parent.ABTest.ABTestManagerServer)
    local v_u_3 = require(game.ReplicatedStorage.SharedPackages.AB)
    local v_u_4 = require(script.Parent.Parent.LegacyLoad)
    local v_u_5 = v_u_4("DataM")
    local v_u_6 = nil
    local v_u_7 = nil
    local v_u_8 = 0
    beforeEach(function()
        v_u_8 = v_u_8 + 1
        v_u_7 = {
            ["UserId"] = v_u_8,
            ["Name"] = "MockPlayer_ABTest_" .. v_u_8
        }
        v_u_6 = v_u_5.create_store(v_u_7)
        v_u_6:set("ab_test_manager", (v_u_2.new(v_u_7)))
    end)
    afterEach(function()
        v_u_3.deleteTest("test")
    end)
    describe("ABTest.new", function()
        it("should register a new static AB test", function()
            v_u_1.new({
                ["key"] = "test",
                ["default_values"] = {},
                ["groups"] = {}
            })
            expect(v_u_3.getTest("test")).to.be.ok()
        end)
        it("should set all players to nonparticipating if no cloud AB exists", function()
            local v9 = v_u_1.new({
                ["key"] = "test",
                ["default_values"] = {},
                ["groups"] = {}
            })
            expect(v9:get_group(v_u_7)).to.equal("nonparticipating")
        end)
    end)
    describe("ABTest:get_group", function()
        local function v_u_14(p10, p11)
            local v12 = v_u_3.registerTest
            local v13 = {
                ["name"] = "test",
                ["groups"] = {
                    {
                        ["name"] = "nonparticipating",
                        ["weight"] = p10 == "nonparticipating" and 1 or 0
                    },
                    {
                        ["name"] = "control",
                        ["weight"] = p10 == "control" and 1 or 0
                    },
                    {
                        ["name"] = "test_group",
                        ["weight"] = p10 == "test_group" and 1 or 0
                    }
                },
                ["tags"] = p11
            }
            v12(v13, true)
        end
        local v15 = v_u_1.new
        local v16 = {
            ["key"] = "test",
            ["default_values"] = {
                ["A"] = "A",
                ["B"] = "B"
            }
        }
        local v17 = {
            ["test_group"] = {
                ["A"] = "AX",
                ["B"] = "BX"
            }
        }
        v16.groups = v17
        local v_u_18 = v15(v16)
        it("should change the group if the test changes", function()
            v_u_14("test_group")
            expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
            v_u_14("control")
            expect(v_u_18:get_group(v_u_7)).to.equal("control")
        end)
        it("should return the default values for nonparticipating", function()
            v_u_14("nonparticipating")
            expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
            expect(v_u_18:get_value("A", v_u_7)).to.equal("A")
            expect(v_u_18:get_value("B", v_u_7)).to.equal("B")
        end)
        it("should return the default values for control", function()
            v_u_14("control")
            expect(v_u_18:get_group(v_u_7)).to.equal("control")
            expect(v_u_18:get_value("A", v_u_7)).to.equal("A")
            expect(v_u_18:get_value("B", v_u_7)).to.equal("B")
        end)
        it("should return the group values for a given group", function()
            v_u_14("test_group")
            expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
            expect(v_u_18:get_value("A", v_u_7)).to.equal("AX")
            expect(v_u_18:get_value("B", v_u_7)).to.equal("BX")
        end)
        describe("keep_group_in_same_session tag", function()
            it("should return the same group even if the test changes", function()
                v_u_14("test_group", { "keep_group_in_same_session" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                v_u_14("control", { "keep_group_in_same_session" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
            end)
            it("should keep nonparticipating even if the test changes", function()
                v_u_14("nonparticipating", { "keep_group_in_same_session" })
                expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
                v_u_14("control", { "keep_group_in_same_session" })
                expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
            end)
            it("should save the group to ab_test_manager", function()
                v_u_14("test_group", { "keep_group_in_same_session" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                expect(v_u_6:get("ab_test_manager"):was_assigned_this_session("test")).to.equal(true)
                expect(v_u_6:get("ab_test_manager"):get_group("test")).to.equal("test_group")
            end)
            it("should reassign a saved group if the group wasn\'t assigned yet this session", function()
                v_u_14("test_group", { "keep_group_in_same_session" })
                v_u_6:get("ab_test_manager").groups.test = "control"
                expect(v_u_6:get("ab_test_manager"):was_assigned_this_session("test")).never.to.equal(true)
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                expect(v_u_6:get("ab_test_manager"):get_group("test")).to.equal("test_group")
            end)
            it("should reassign a saved group if the player leaves and rejoins", function()
                v_u_14("test_group", { "keep_group_in_same_session" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                v_u_14("control", { "keep_group_in_same_session" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                v_u_6:get("ab_test_manager").groups = {}
                v_u_6:get("ab_test_manager").assigned_this_session = {}
                expect(v_u_18:get_group(v_u_7)).to.equal("control")
            end)
        end)
        describe("new_players_only tag", function()
            it("should put all existing players in nonparticipating", function()
                v_u_6:set("time_played_since_join", 999)
                v_u_14("test_group", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
            end)
            it("should assign all new players to their corresponding AB groups", function()
                v_u_14("test_group", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
            end)
            it("should remember a new player\'s AB group if it is the same as before", function()
                v_u_14("test_group", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                v_u_6:set("time_played_since_join", 999)
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
            end)
            it("should assign a new player to nonparticipating if their AB group changed", function()
                v_u_14("test_group", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                v_u_14("control", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
            end)
            it("should never put a player back in an AB group", function()
                v_u_14("test_group", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                v_u_14("control", { "new_players_only" })
                v_u_6:set("time_played_since_join", 999)
                expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
                v_u_14("test_group", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
            end)
            it("should make ABTestManager save the group", function()
                v_u_14("test_group", { "new_players_only" })
                expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                local v19 = v_u_6:get("ab_test_manager"):serialize_for_save()
                expect(v19.test).to.be.ok()
                expect(v19.test).to.equal("test_group")
                v_u_14("test_group")
                local v20 = v_u_6:get("ab_test_manager"):serialize_for_save()
                expect(v20.test).never.to.be.ok()
            end)
            describe("interaction with keep_group_in_same_session tag", function()
                it("shouldn\'t put new players into nonparticipating while in the same session", function()
                    v_u_14("test_group", { "new_players_only", "keep_group_in_same_session" })
                    expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                    v_u_14("control", { "new_players_only", "keep_group_in_same_session" })
                    expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                end)
                it("should put invalid players into nonparticipating when they start a new session", function()
                    v_u_14("test_group", { "new_players_only", "keep_group_in_same_session" })
                    expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                    v_u_14("control", { "new_players_only", "keep_group_in_same_session" })
                    expect(v_u_18:get_group(v_u_7)).to.equal("test_group")
                    v_u_6:set("time_played_since_join", 999)
                    v_u_6:get("ab_test_manager").assigned_this_session.test = nil
                    expect(v_u_18:get_group(v_u_7)).to.equal("nonparticipating")
                end)
            end)
        end)
    end)
    describe("ABTestManager", function()
        it("should not save the group for any AB tests that don\'t exist", function()
            v_u_6:get("ab_test_manager"):set_group("a_test_key", "a_test_group")
            local v21 = v_u_6:get("ab_test_manager"):serialize_for_save()
            expect(v21.a_test_key).never.to.be.ok()
        end)
        it("should mark assigned_this_session the first time a group is set", function()
            expect(v_u_6:get("ab_test_manager"):was_assigned_this_session("test")).never.to.equal(true)
            v_u_6:get("ab_test_manager"):set_group("test", "test_group")
            expect(v_u_6:get("ab_test_manager"):was_assigned_this_session("test")).to.equal(true)
        end)
        it("should serialize to the client correctly", function()
            local v22 = v_u_6:get("ab_test_manager"):serialize_for_client_replication()
            expect(v22).to.be.ok()
            expect(v22.groups).to.be.ok()
            expect(v22.assigned_this_session).to.be.ok()
            expect(v22.groups.test).never.to.be.ok()
            expect(v22.assigned_this_session.test).never.to.be.ok()
            v_u_6:get("ab_test_manager"):set_group("test", "test_group")
            local v23 = v_u_6:get("ab_test_manager"):serialize_for_client_replication()
            expect(v23).to.be.ok()
            expect(v23.groups).to.be.ok()
            expect(v23.assigned_this_session).to.be.ok()
            expect(v23.groups.test).to.equal("test_group")
            expect(v23.assigned_this_session.test).to.equal(true)
        end)
    end)
    describe("add_ab_group_data Stash Transformer", function()
        local v_u_24 = v_u_4("RegisterStashTransformers")
        local function v_u_29(p25, p26)
            local v27 = v_u_3.registerTest
            local v28 = {
                ["name"] = "test",
                ["groups"] = {
                    {
                        ["name"] = "nonparticipating",
                        ["weight"] = p25 == "nonparticipating" and 1 or 0
                    },
                    {
                        ["name"] = "control",
                        ["weight"] = p25 == "control" and 1 or 0
                    },
                    {
                        ["name"] = "test_group",
                        ["weight"] = p25 == "test_group" and 1 or 0
                    }
                },
                ["tags"] = p26
            }
            v27(v28, true)
        end
        it("should create a table of test name and group name pairs", function()
            v_u_29("control")
            local v30 = {}
            v_u_24.transformers.add_ab_group_data(v30, v_u_7)
            expect(v30.ab_test_groups).to.be.ok()
            expect(table.find(v30.ab_test_groups, (("%*:control"):format("test")))).to.be.ok()
        end)
        it("should reflect when a player\'s AB group changes", function()
            v_u_29("control")
            v_u_24.transformers.add_ab_group_data({}, v_u_7)
            v_u_29("test_group")
            local v31 = {}
            v_u_24.transformers.add_ab_group_data(v31, v_u_7)
            expect(v31.ab_test_groups).to.be.ok()
            expect(table.find(v31.ab_test_groups, (("%*:test_group"):format("test")))).to.be.ok()
            expect(table.find(v31.ab_test_groups, (("%*:control"):format("test")))).never.to.be.ok()
        end)
        it("should correctly log tests with the keep_group_in_same_session tag", function()
            v_u_29("test_group", { "keep_group_in_same_session" })
            local v32 = {}
            v_u_24.transformers.add_ab_group_data(v32, v_u_7)
            expect(v32.ab_test_groups).to.be.ok()
            expect(table.find(v32.ab_test_groups, (("%*:test_group"):format("test")))).to.be.ok()
            v_u_29("control", { "keep_group_in_same_session" })
            local v33 = {}
            v_u_24.transformers.add_ab_group_data(v33, v_u_7)
            expect(v33.ab_test_groups).to.be.ok()
            expect(table.find(v33.ab_test_groups, (("%*:test_group"):format("test")))).to.be.ok()
            expect(table.find(v33.ab_test_groups, (("%*:control"):format("test")))).never.to.be.ok()
        end)
        it("should correctly log tests with the new_players_only tag", function()
            v_u_29("test_group", { "new_players_only" })
            local v34 = {}
            v_u_24.transformers.add_ab_group_data(v34, v_u_7)
            expect(v34.ab_test_groups).to.be.ok()
            expect(table.find(v34.ab_test_groups, (("%*:test_group"):format("test")))).to.be.ok()
            v_u_29("control", { "new_players_only" })
            local v35 = {}
            v_u_24.transformers.add_ab_group_data(v35, v_u_7)
            expect(v35.ab_test_groups).to.be.ok()
            expect(table.find(v35.ab_test_groups, (("%*:test_group"):format("test")))).never.to.be.ok()
            expect(table.find(v35.ab_test_groups, (("%*:control"):format("test")))).never.to.be.ok()
            expect(table.find(v35.ab_test_groups, (("%*:nonparticipating"):format("test")))).never.to.be.ok()
        end)
    end)
end