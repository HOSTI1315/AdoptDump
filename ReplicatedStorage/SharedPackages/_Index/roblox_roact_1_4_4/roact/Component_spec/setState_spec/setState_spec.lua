--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.setState.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.createElement)
    local v2 = require(script.Parent.Parent.createReconciler)
    local v_u_3 = require(script.Parent.Parent.createSpy)
    local v_u_4 = require(script.Parent.Parent.None)
    local v5 = require(script.Parent.Parent.NoopRenderer)
    local v_u_6 = require(script.Parent.Parent.Component)
    local v_u_7 = v2(v5)
    describe("setState", function()
        it("should not trigger an extra update when called in init", function()
            local v_u_8 = 0
            local v_u_9 = 0
            local v_u_10 = nil
            local v11 = v_u_6:extend("InitComponent")
            function v11.init(p12)
                p12:setState({
                    ["a"] = 1
                })
            end
            function v11.willUpdate(_)
                v_u_9 = v_u_9 + 1
            end
            function v11.render(p13)
                v_u_8 = v_u_8 + 1
                v_u_10 = p13.state
                return nil
            end
            local v14 = v_u_1(v11)
            v_u_7.mountVirtualTree(v14)
            expect(v_u_8).to.equal(1)
            expect(v_u_9).to.equal(0)
            expect(v_u_10.a).to.equal(1)
        end)
        it("should throw when called in render", function()
            local v15 = v_u_6:extend("TestComponent")
            function v15.render(p16)
                p16:setState({
                    ["a"] = 1
                })
            end
            local v17 = v_u_1(v15)
            local v18, v19 = pcall(v_u_7.mountVirtualTree, v17)
            expect(v18).to.equal(false)
            expect(v19:match("render")).to.be.ok()
            expect(v19:match("TestComponent")).to.be.ok()
        end)
        it("should throw when called in shouldUpdate", function()
            local v20 = v_u_6:extend("TestComponent")
            function v20.render(_)
                return nil
            end
            function v20.shouldUpdate(p21)
                p21:setState({
                    ["a"] = 1
                })
            end
            local v22 = v_u_1(v20)
            local v23 = v_u_1(v20)
            local v24 = v_u_7.mountVirtualTree(v22)
            local v25, v26 = pcall(v_u_7.updateVirtualTree, v24, v23)
            expect(v25).to.equal(false)
            expect(v26:match("shouldUpdate")).to.be.ok()
            expect(v26:match("TestComponent")).to.be.ok()
        end)
        it("should throw when called in willUpdate", function()
            local v27 = v_u_6:extend("TestComponent")
            function v27.render(_)
                return nil
            end
            function v27.willUpdate(p28)
                p28:setState({
                    ["a"] = 1
                })
            end
            local v29 = v_u_1(v27)
            local v30 = v_u_1(v27)
            local v31 = v_u_7.mountVirtualTree(v29)
            local v32, v33 = pcall(v_u_7.updateVirtualTree, v31, v30)
            expect(v32).to.equal(false)
            expect(v33:match("willUpdate")).to.be.ok()
            expect(v33:match("TestComponent")).to.be.ok()
        end)
        it("should not throw when called in willUnmount", function()
            local v34 = v_u_6:extend("TestComponent")
            function v34.render(_)
                return nil
            end
            function v34.willUnmount(p35)
                p35:setState({
                    ["a"] = 1
                })
            end
            local v36 = v_u_1(v34)
            local v37 = v_u_7.mountVirtualTree(v36)
            local v38, _ = pcall(v_u_7.unmountVirtualTree, v37)
            expect(v38).to.equal(true)
        end)
        it("should remove values from state when the value is None", function()
            local v39 = v_u_6:extend("TestComponent")
            local v_u_40 = nil
            local v_u_41 = nil
            function v39.init(p_u_42)
                v_u_40 = function(p43)
                    p_u_42:setState(p43)
                end
                v_u_41 = function()
                    return p_u_42.state
                end
                p_u_42:setState({
                    ["value"] = 0
                })
            end
            function v39.render(_)
                return nil
            end
            local v44 = v_u_1(v39)
            local v45 = v_u_7.mountVirtualNode(v44, nil, "Test")
            expect(v_u_41().value).to.equal(0)
            v_u_40({
                ["value"] = v_u_4
            })
            expect(v_u_41().value).to.equal(nil)
            v_u_7.unmountVirtualNode(v45)
        end)
        it("should invoke functions to compute a partial state", function()
            local v46 = v_u_6:extend("TestComponent")
            local v_u_47 = nil
            local v_u_48 = nil
            local v_u_49 = nil
            function v46.init(p_u_50)
                v_u_47 = function(p51)
                    p_u_50:setState(p51)
                end
                v_u_48 = function()
                    return p_u_50.state
                end
                v_u_49 = function()
                    return p_u_50.props
                end
                p_u_50:setState({
                    ["value"] = 0
                })
            end
            function v46.render(_)
                return nil
            end
            local v52 = v_u_1(v46)
            local v53 = v_u_7.mountVirtualNode(v52, nil, "Test")
            expect(v_u_48().value).to.equal(0)
            v_u_47(function(p54, p55)
                expect(p54).to.equal(v_u_48())
                expect(p55).to.equal(v_u_49())
                return {
                    ["value"] = p54.value + 1
                }
            end)
            expect(v_u_48().value).to.equal(1)
            v_u_7.unmountVirtualNode(v53)
        end)
        it("should cancel rendering if the function returns nil", function()
            local v56 = v_u_6:extend("TestComponent")
            local v_u_57 = nil
            local v_u_58 = 0
            function v56.init(p_u_59)
                v_u_57 = function(p60)
                    p_u_59:setState(p60)
                end
                p_u_59:setState({
                    ["value"] = 0
                })
            end
            function v56.render(_)
                v_u_58 = v_u_58 + 1
                return nil
            end
            local v61 = v_u_1(v56)
            local v62 = v_u_7.mountVirtualNode(v61, nil, "Test")
            expect(v_u_58).to.equal(1)
            v_u_57(function(_, _)
                return nil
            end)
            expect(v_u_58).to.equal(1)
            v_u_7.unmountVirtualNode(v62)
        end)
    end)
    describe("setState suspension", function()
        it("should defer setState triggered while reconciling", function()
            local v_u_63 = v_u_6:extend("Child")
            local v_u_64 = nil
            function v_u_63.render(_)
                return nil
            end
            function v_u_63.didMount(p65)
                p65.props.callback()
            end
            local v66 = v_u_6:extend("Parent")
            function v66.init(p_u_67)
                v_u_64 = function()
                    return p_u_67.state
                end
            end
            function v66.render(p_u_68)
                return v_u_1(v_u_63, {
                    ["callback"] = function()
                        p_u_68:setState({
                            ["foo"] = "bar"
                        })
                    end
                })
            end
            local v69 = v_u_1(v66)
            local v70 = v_u_7.mountVirtualNode(v69, nil, "Test")
            expect(v70).to.be.ok()
            expect(v_u_64().foo).to.equal("bar")
        end)
        it("should defer setState triggered while reconciling during an update", function()
            local v_u_71 = v_u_6:extend("Child")
            local v_u_72 = nil
            function v_u_71.render(_)
                return nil
            end
            function v_u_71.didUpdate(p73)
                p73.props.callback()
            end
            local v74 = v_u_6:extend("Parent")
            function v74.init(p_u_75)
                v_u_72 = function()
                    return p_u_75.state
                end
            end
            function v74.render(p_u_76)
                return v_u_1(v_u_71, {
                    ["callback"] = function()
                        if not p_u_76.state.foo then
                            p_u_76:setState({
                                ["foo"] = "bar"
                            })
                        end
                    end
                })
            end
            local v77 = v_u_1(v74)
            local v78 = v_u_7.mountVirtualNode(v77, nil, "Test")
            expect(v78).to.be.ok()
            expect(v_u_72().foo).to.equal(nil)
            local v79 = v_u_7.updateVirtualNode(v78, v_u_1(v74))
            expect(v79).to.be.ok()
            expect(v_u_72().foo).to.equal("bar")
            v_u_7.unmountVirtualNode(v79)
        end)
        it("should combine pending state changes properly", function()
            local v_u_80 = v_u_6:extend("Child")
            local v_u_81 = nil
            function v_u_80.render(_)
                return nil
            end
            function v_u_80.didMount(p82)
                p82.props.callback("foo", 1)
                p82.props.callback("bar", 3)
            end
            local v83 = v_u_6:extend("Parent")
            function v83.init(p_u_84)
                v_u_81 = function()
                    return p_u_84.state
                end
            end
            function v83.render(p_u_85)
                return v_u_1(v_u_80, {
                    ["callback"] = function(p86, p87)
                        p_u_85:setState({
                            [p86] = p87
                        })
                    end
                })
            end
            local v88 = v_u_1(v83)
            local v89 = v_u_7.mountVirtualNode(v88, nil, "Test")
            expect(v89).to.be.ok()
            expect(v_u_81().foo).to.equal(1)
            expect(v_u_81().bar).to.equal(3)
            v_u_7.unmountVirtualNode(v89)
        end)
        it("should abort properly when functional setState returns nil while deferred", function()
            local v_u_90 = v_u_6:extend("Child")
            function v_u_90.render(_)
                return nil
            end
            function v_u_90.didMount(p91)
                p91.props.callback()
            end
            local v92 = v_u_6:extend("Parent")
            local v94 = v_u_3(function(p_u_93)
                return v_u_1(v_u_90, {
                    ["callback"] = function()
                        p_u_93:setState(function()
                            return nil
                        end)
                    end
                })
            end)
            v92.render = v94.value
            local v95 = v_u_1(v92)
            local v96 = v_u_7.mountVirtualNode(v95, nil, "Test")
            expect(v96).to.be.ok()
            expect(v94.callCount).to.equal(1)
            v_u_7.unmountVirtualNode(v96)
        end)
        it("should still apply pending state if a subsequent state update was aborted", function()
            local v_u_97 = v_u_6:extend("Child")
            local v_u_98 = nil
            function v_u_97.render(_)
                return nil
            end
            function v_u_97.didMount(p99)
                p99.props.callback(function()
                    return {
                        ["foo"] = 1
                    }
                end)
                p99.props.callback(function()
                    return nil
                end)
            end
            local v100 = v_u_6:extend("Parent")
            function v100.init(p_u_101)
                v_u_98 = function()
                    return p_u_101.state
                end
            end
            function v100.render(p_u_102)
                return v_u_1(v_u_97, {
                    ["callback"] = function(p103)
                        p_u_102:setState(p103)
                    end
                })
            end
            local v104 = v_u_1(v100)
            local v105 = v_u_7.mountVirtualNode(v104, nil, "Test")
            expect(v105).to.be.ok()
            expect(v_u_98().foo).to.equal(1)
            v_u_7.unmountVirtualNode(v105)
        end)
        it("should not re-process new state when pending state is present after update", function()
            local v_u_106 = nil
            local v_u_107 = nil
            local v108 = v_u_6:extend("MyComponent")
            function v108.init(p_u_109)
                p_u_109:setState({
                    ["hasUpdatedOnce"] = false,
                    ["counter"] = 0
                })
                v_u_106 = function(p110)
                    p_u_109:setState(p110)
                end
                v_u_107 = function()
                    return p_u_109.state
                end
            end
            function v108.render(_)
                return nil
            end
            function v108.didUpdate(p111)
                if p111.state.hasUpdatedOnce == false then
                    p111:setState({
                        ["hasUpdatedOnce"] = true
                    })
                end
            end
            local v112 = v_u_1(v108)
            v_u_7.mountVirtualNode(v112, nil, "Test")
            expect(v_u_107().hasUpdatedOnce).to.equal(false)
            expect(v_u_107().counter).to.equal(0)
            v_u_106(function(p113)
                return {
                    ["counter"] = p113.counter + 1
                }
            end)
            expect(v_u_107().hasUpdatedOnce).to.equal(true)
            expect(v_u_107().counter).to.equal(1)
        end)
        it("should throw when an infinite update is triggered", function()
            local v114 = v_u_6:extend("InfiniteUpdater")
            function v114.render(_)
                return nil
            end
            function v114.didMount(p115)
                p115:setState({})
            end
            function v114.didUpdate(p116)
                p116:setState({})
            end
            local v117 = v_u_1(v114)
            local v118, v119 = pcall(v_u_7.mountVirtualNode, v117, nil, "Test")
            expect(v118).to.equal(false)
            expect(v119:find("InfiniteUpdater")).to.be.ok()
            expect(v119:find("reached the setState update recursion limit")).to.be.ok()
        end)
        itSKIP("should process single updates with both new and pending state", function() end)
        it("should call trigger update after didMount when setting state in didMount", function()
            local v120 = v_u_6:extend("MyComponent")
            function v120.init(p121)
                p121:setState({
                    ["status"] = "initial mount"
                })
                p121.isMounted = false
            end
            function v120.render(_)
                return nil
            end
            function v120.didMount(p122)
                p122:setState({
                    ["status"] = "mounted"
                })
                p122.isMounted = true
            end
            function v120.didUpdate(p123, _, p124)
                expect(p124.status).to.equal("initial mount")
                expect(p123.state.status).to.equal("mounted")
                expect(p123.isMounted).to.equal(true)
            end
            local v125 = v_u_1(v120)
            local v126 = v_u_7.mountVirtualNode(v125, nil, "Test")
            expect(v126).to.be.ok()
        end)
    end)
end