--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createContext.spec (ModuleScript)

return function()
    local v_u_1 = game:GetService("ReplicatedStorage")
    local v_u_2 = require(script.Parent.Component)
    local v3 = require(script.Parent.NoopRenderer)
    local v_u_4 = require(script.Parent.PropMarkers.Children)
    local v_u_5 = require(script.Parent.createContext)
    local v_u_6 = require(script.Parent.createElement)
    local v_u_7 = require(script.Parent.createFragment)
    local v8 = require(script.Parent.createReconciler)
    local v_u_9 = require(script.Parent.createSpy)
    local v_u_10 = v8(v3)
    local v_u_11 = v8((require(script.Parent.RobloxRenderer)))
    it("should return a table", function()
        local v12 = v_u_5("Test")
        expect(v12).to.be.ok()
        expect((type(v12))).to.equal("table")
    end)
    it("should contain a Provider and a Consumer", function()
        local v13 = v_u_5("Test")
        expect(v13.Provider).to.be.ok()
        expect(v13.Consumer).to.be.ok()
    end)
    describe("Provider", function()
        it("should render its children", function()
            local v14 = v_u_5("Test")
            local v15 = v_u_9(function()
                return nil
            end)
            local v16 = v_u_6(v14.Provider, {
                ["value"] = "Test"
            }, {
                ["Listener"] = v_u_6(v15.value)
            })
            local v17 = v_u_10.mountVirtualTree(v16, nil, "Provide Tree")
            v_u_10.unmountVirtualTree(v17)
            expect(v15.callCount).to.equal(1)
        end)
    end)
    describe("Consumer", function()
        it("should expect a render function", function()
            local v_u_18 = v_u_6(v_u_5("Test").Consumer)
            expect(function()
                v_u_10.mountVirtualTree(v_u_18, nil, "Provide Tree")
            end).to.throw()
        end)
        it("should return the default value if there is no Provider", function()
            local v19 = v_u_9()
            local v20 = v_u_6(v_u_5("Test").Consumer, {
                ["render"] = v19.value
            })
            local v21 = v_u_10.mountVirtualTree(v20, nil, "Provide Tree")
            v_u_10.unmountVirtualTree(v21)
            v19:assertCalledWith("Test")
        end)
        it("should pass the value to the render function", function()
            local v_u_22 = v_u_9()
            local v_u_23 = v_u_5("Test")
            local function v24()
                return v_u_6(v_u_23.Consumer, {
                    ["render"] = v_u_22.value
                })
            end
            local v25 = v_u_6(v_u_23.Provider, {
                ["value"] = "NewTest"
            }, {
                ["Listener"] = v_u_6(v24)
            })
            local v26 = v_u_10.mountVirtualTree(v25, nil, "Provide Tree")
            v_u_10.unmountVirtualTree(v26)
            v_u_22:assertCalledWith("NewTest")
        end)
        it("should update when the value updates", function()
            local v_u_27 = v_u_9()
            local v_u_28 = v_u_5("Test")
            local function v29()
                return v_u_6(v_u_28.Consumer, {
                    ["render"] = v_u_27.value
                })
            end
            local v30 = v_u_6(v_u_28.Provider, {
                ["value"] = "NewTest"
            }, {
                ["Listener"] = v_u_6(v29)
            })
            local v31 = v_u_10.mountVirtualTree(v30, nil, "Provide Tree")
            expect(v_u_27.callCount).to.equal(1)
            v_u_27:assertCalledWith("NewTest")
            v_u_10.updateVirtualTree(v31, v_u_6(v_u_28.Provider, {
                ["value"] = "ThirdTest"
            }, {
                ["Listener"] = v_u_6(v29)
            }))
            expect(v_u_27.callCount).to.equal(2)
            v_u_27:assertCalledWith("ThirdTest")
            v_u_10.unmountVirtualTree(v31)
        end)
        it("should update when the value updates through an update blocking component", function()
            local v_u_32 = v_u_9()
            local v_u_33 = v_u_5("Test")
            local v34 = v_u_2:extend("UpdateBlocker")
            function v34.render(p35)
                return v_u_7(p35.props[v_u_4])
            end
            function v34.shouldUpdate(_)
                return false
            end
            local function v36()
                return v_u_6(v_u_33.Consumer, {
                    ["render"] = v_u_32.value
                })
            end
            local v37 = v_u_6
            local v38 = v_u_33.Provider
            local v39 = {
                ["Blocker"] = v_u_6(v34, nil, {
                    ["Listener"] = v_u_6(v36)
                })
            }
            local v40 = v37(v38, {
                ["value"] = "NewTest"
            }, v39)
            local v41 = v_u_10.mountVirtualTree(v40, nil, "Provide Tree")
            expect(v_u_32.callCount).to.equal(1)
            v_u_32:assertCalledWith("NewTest")
            local v42 = v_u_10.updateVirtualTree
            local v43 = v_u_6
            local v44 = v_u_33.Provider
            local v45 = {
                ["Blocker"] = v_u_6(v34, nil, {
                    ["Listener"] = v_u_6(v36)
                })
            }
            v42(v41, v43(v44, {
                ["value"] = "ThirdTest"
            }, v45))
            expect(v_u_32.callCount).to.equal(2)
            v_u_32:assertCalledWith("ThirdTest")
            v_u_10.unmountVirtualTree(v41)
        end)
        it("should behave correctly when the default value is nil", function()
            local v_u_46 = v_u_5(nil)
            local v_u_47 = v_u_9()
            local function v48()
                return v_u_6(v_u_46.Consumer, {
                    ["render"] = v_u_47.value
                })
            end
            local v49 = v_u_10.mountVirtualTree(v_u_6(v48), nil, "Provide Tree")
            expect(v_u_47.callCount).to.equal(1)
            v_u_47:assertCalledWith(nil)
            local v50 = v_u_10.updateVirtualTree(v49, v_u_6(v48))
            v_u_10.unmountVirtualTree(v50)
            expect(v_u_47.callCount).to.equal(2)
            v_u_47:assertCalledWith(nil)
        end)
    end)
    describe("Update order", function()
        it("should update context at the same time as props", function()
            local v_u_51 = false
            local v_u_52 = false
            local v_u_53 = 0
            local v_u_54 = v_u_5("default")
            local function v58(p_u_55)
                local v57 = {
                    ["render"] = function(p56)
                        v_u_53 = v_u_53 + 1
                        if p56 == "context_1" then
                            expect(p_u_55.someProp).to.equal("prop_1")
                            v_u_51 = true
                            return
                        elseif p56 == "context_2" then
                            expect(p_u_55.someProp).to.equal("prop_2")
                            v_u_52 = true
                        else
                            error("Unexpected context value")
                        end
                    end
                }
                return v_u_6(v_u_54.Consumer, v57)
            end
            local v59 = v_u_6
            local v60 = v_u_54.Provider
            local v61 = {
                ["Child"] = v_u_6(v58, {
                    ["someProp"] = "prop_1"
                })
            }
            local v62 = v59(v60, {
                ["value"] = "context_1"
            }, v61)
            local v63 = v_u_6
            local v64 = v_u_54.Provider
            local v65 = {
                ["Child"] = v_u_6(v58, {
                    ["someProp"] = "prop_2"
                })
            }
            local v66 = v63(v64, {
                ["value"] = "context_2"
            }, v65)
            local v67 = v_u_10.mountVirtualTree(v62, nil, "UpdateObservationIsFun")
            v_u_10.updateVirtualTree(v67, v66)
            expect(v_u_53).to.equal(2)
            expect(v_u_51).to.equal(true)
            expect(v_u_52).to.equal(true)
        end)
    end)
    it("does not throw if willUnmount is called twice on a context consumer", function()
        local v_u_68 = v_u_5({})
        local v_u_69 = v_u_2:extend("LowestComponent")
        function v_u_69.init(_) end
        function v_u_69.render(_)
            return v_u_6("Frame")
        end
        function v_u_69.didMount(p70)
            p70.props.onDidMountCallback()
        end
        local v_u_71 = v_u_2:extend("FirstComponent")
        function v_u_71.init(_) end
        function v_u_71.render(_)
            local v72 = {
                ["render"] = function()
                    return v_u_6("TextLabel")
                end
            }
            return v_u_6(v_u_68.Consumer, v72)
        end
        local v_u_73 = v_u_2:extend("ChildComponent")
        function v_u_73.init(p74)
            p74:setState({
                ["firstTime"] = true
            })
        end
        local v_u_75 = nil
        function v_u_73.render(p76)
            if p76.state.firstTime then
                return v_u_6(v_u_71)
            else
                return v_u_6(v_u_69, {
                    ["onDidMountCallback"] = p76.props.onDidMountCallback
                })
            end
        end
        function v_u_73.didMount(p_u_77)
            v_u_75 = function()
                p_u_77:setState({
                    ["firstTime"] = false
                })
            end
        end
        local v78 = v_u_2:extend("ParentComponent")
        local v_u_79 = 0
        function v78.init(p_u_80)
            p_u_80:setState({
                ["count"] = 1
            })
            function p_u_80.onDidMountCallback()
                v_u_79 = v_u_79 + 1
                if p_u_80.state.count < 5 then
                    p_u_80:setState({
                        ["count"] = p_u_80.state.count + 1
                    })
                end
            end
        end
        function v78.render(p81)
            local v82 = v_u_6
            local v83 = {}
            local v84 = v_u_6
            local v85 = v_u_68.Provider
            local v86 = {
                ["ChildComponent"] = v_u_6(v_u_73, {
                    ["count"] = p81.state.count,
                    ["onDidMountCallback"] = p81.onDidMountCallback
                })
            }
            v83.Provider = v84(v85, {
                ["value"] = {}
            }, v86)
            return v82("Frame", {}, v83)
        end
        local v87 = Instance.new("ScreenGui")
        v87.Parent = v_u_1
        v_u_11.mountVirtualNode(v_u_6(v78), v87, "Some Key")
        expect(function()
            v_u_75()
        end).never.to.throw()
    end)
end