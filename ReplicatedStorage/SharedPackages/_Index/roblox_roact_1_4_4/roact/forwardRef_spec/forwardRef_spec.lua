--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.forwardRef.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.assign)
    local v_u_2 = require(script.Parent.createElement)
    local v_u_3 = require(script.Parent.createRef)
    local v_u_4 = require(script.Parent.forwardRef)
    local v5 = require(script.Parent.createReconciler)
    local v_u_6 = require(script.Parent.Component)
    local v_u_7 = require(script.Parent.GlobalConfig)
    local v_u_8 = require(script.Parent.PropMarkers.Ref)
    local v_u_9 = v5((require(script.Parent.RobloxRenderer)))
    it("should update refs when switching between children", function()
        local function v_u_21(p10)
            local v11 = p10.forwardedRef
            local v12
            if p10.setRefOnDiv then
                v12 = nil
            else
                v12 = v11
                v11 = nil
            end
            local v13 = v_u_2
            local v14 = {}
            local v15 = v_u_2
            local v16 = {
                [v_u_8] = v11
            }
            local v17 = {
                ["Child"] = v_u_2("TextLabel", {
                    ["Text"] = "First"
                })
            }
            v14.First = v15("Frame", v16, v17)
            local v18 = v_u_2
            local v19 = {
                [v_u_8] = v12
            }
            local v20 = {
                ["Child"] = v_u_2("TextLabel", {
                    ["Text"] = "Second"
                })
            }
            v14.Second = v18("ScrollingFrame", v19, v20)
            return v13("Frame", nil, v14)
        end
        local v24 = v_u_4(function(p22, p23)
            return v_u_2(v_u_21, v_u_1({}, p22, {
                ["forwardedRef"] = p23
            }))
        end)
        local v25 = v_u_3()
        local v26 = v_u_2(v24, {
            [v_u_8] = v25,
            ["setRefOnDiv"] = true
        })
        local v27 = v_u_9.mountVirtualTree(v26, nil, "switch refs")
        expect(v25.current.ClassName).to.equal("Frame")
        v_u_9.unmountVirtualTree(v27)
        local v28 = v_u_2(v24, {
            [v_u_8] = v25,
            ["setRefOnDiv"] = false
        })
        local v29 = v_u_9.mountVirtualTree(v28, nil, "switch refs")
        expect(v25.current.ClassName).to.equal("ScrollingFrame")
        v_u_9.unmountVirtualTree(v29)
    end)
    it("should support rendering nil", function()
        local v30 = v_u_4(function(_, _)
            return nil
        end)
        local v31 = v_u_3()
        local v32 = v_u_2(v30, {
            [v_u_8] = v31
        })
        local v33 = v_u_9.mountVirtualTree(v32, nil, "nil ref")
        expect(v31.current).to.equal(nil)
        v_u_9.unmountVirtualTree(v33)
    end)
    it("should support rendering nil for multiple children", function()
        local v34 = v_u_4(function(_, _)
            return nil
        end)
        local v35 = v_u_3()
        local v36 = v_u_2
        local v37 = {
            ["NoRef1"] = v_u_2("Frame"),
            ["WithRef"] = v_u_2(v34, {
                [v_u_8] = v35
            }),
            ["NoRef2"] = v_u_2("Frame")
        }
        local v38 = v36("Frame", nil, v37)
        local v39 = v_u_9.mountVirtualTree(v38, nil, "multiple children nil ref")
        expect(v35.current).to.equal(nil)
        v_u_9.unmountVirtualTree(v39)
    end)
    itSKIP("should support defaultProps", function()
        local function v_u_41(p40)
            return v_u_2("Frame", {
                [v_u_8] = p40.forwardedRef
            }, {
                ["OptionalChild"] = p40.optional,
                ["RequiredChild"] = p40.required
            })
        end
        local v44 = v_u_4(function(p42, p43)
            return v_u_2(v_u_41, v_u_1({}, p42, {
                ["forwardedRef"] = p43
            }))
        end)
        v44.defaultProps = {
            ["optional"] = v_u_2("TextLabel")
        }
        local v45 = v_u_3()
        local v46 = v_u_2(v44, {
            [v_u_8] = v45,
            ["optional"] = v_u_2("Frame"),
            ["required"] = v_u_2("ScrollingFrame")
        })
        local v47 = v_u_9.mountVirtualTree(v46, nil, "with optional")
        expect(v45.current:FindFirstChild("OptionalChild").ClassName).to.equal("Frame")
        expect(v45.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame")
        v_u_9.unmountVirtualTree(v47)
        local v48 = v_u_2(v44, {
            [v_u_8] = v45,
            ["required"] = v_u_2("ScrollingFrame")
        })
        local v49 = v_u_9.mountVirtualTree(v48, nil, "with default")
        expect(v45.current:FindFirstChild("OptionalChild").ClassName).to.equal("TextLabel")
        expect(v45.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame")
        v_u_9.unmountVirtualTree(v49)
    end)
    it("should error if not provided a callback when type checking is enabled", function()
        v_u_7.scoped({
            ["typeChecks"] = true
        }, function()
            expect(function()
                v_u_4(nil)
            end).to.throw()
        end)
        v_u_7.scoped({
            ["typeChecks"] = true
        }, function()
            expect(function()
                v_u_4("foo")
            end).to.throw()
        end)
    end)
    it("should work without a ref to be forwarded", function()
        local function v_u_50()
            return nil
        end
        local function v_u_52(p51)
            return v_u_2(v_u_50, v_u_1({}, p51, {
                [v_u_8] = p51.forwardedRef
            }))
        end
        local v55 = v_u_2(v_u_4(function(p53, p54)
            return v_u_2(v_u_52, v_u_1({}, p53, {
                ["forwardedRef"] = p54
            }))
        end), {
            ["value"] = 123
        })
        local v56 = v_u_9.mountVirtualTree(v55, nil, "nil ref")
        v_u_9.unmountVirtualTree(v56)
    end)
    it("should forward a ref for a single child", function()
        local v_u_57 = nil
        local function v_u_59(p58)
            v_u_57 = p58.value
            return v_u_2("Frame", {
                [v_u_8] = p58[v_u_8]
            })
        end
        local function v_u_61(p60)
            return v_u_2(v_u_59, v_u_1({}, p60, {
                [v_u_8] = p60.forwardedRef
            }))
        end
        local v64 = v_u_4(function(p62, p63)
            return v_u_2(v_u_61, v_u_1({}, p62, {
                ["forwardedRef"] = p63
            }))
        end)
        local v65 = v_u_3()
        local v66 = v_u_2(v64, {
            [v_u_8] = v65,
            ["value"] = 123
        })
        local v67 = v_u_9.mountVirtualTree(v66, nil, "single child ref")
        expect(v_u_57).to.equal(123)
        expect(v65.current.ClassName).to.equal("Frame")
        v_u_9.unmountVirtualTree(v67)
    end)
    it("should forward a ref for multiple children", function()
        local function v_u_69(p68)
            return v_u_2("Frame", {
                [v_u_8] = p68[v_u_8]
            })
        end
        local function v_u_71(p70)
            return v_u_2(v_u_69, v_u_1({}, p70, {
                [v_u_8] = p70.forwardedRef
            }))
        end
        local v74 = v_u_4(function(p72, p73)
            return v_u_2(v_u_71, v_u_1({}, p72, {
                ["forwardedRef"] = p73
            }))
        end)
        local v75 = v_u_3()
        local v76 = v_u_2
        local v77 = {
            ["NoRef1"] = v_u_2("Frame"),
            ["WithRef"] = v_u_2(v74, {
                [v_u_8] = v75
            }),
            ["NoRef2"] = v_u_2("Frame")
        }
        local v78 = v76("Frame", nil, v77)
        local v79 = v_u_9.mountVirtualTree(v78, nil, "multi child ref")
        expect(v75.current.ClassName).to.equal("Frame")
        v_u_9.unmountVirtualTree(v79)
    end)
    it("should maintain child instance and ref through updates", function()
        local v_u_80 = nil
        local function v_u_82(p81)
            v_u_80 = p81.value
            return v_u_2("Frame", {
                [v_u_8] = p81[v_u_8]
            })
        end
        local function v_u_84(p83)
            return v_u_2(v_u_82, v_u_1({}, p83, {
                [v_u_8] = p83.forwardedRef
            }))
        end
        local v87 = v_u_4(function(p85, p86)
            return v_u_2(v_u_84, v_u_1({}, p85, {
                ["forwardedRef"] = p86
            }))
        end)
        local v_u_88 = 0
        local v_u_89 = nil
        local function v91(p90)
            v_u_88 = v_u_88 + 1
            v_u_89 = p90
        end
        local v92 = v_u_2(v87, {
            [v_u_8] = v91,
            ["value"] = 123
        })
        local v93 = v_u_9.mountVirtualTree(v92, nil, "maintains instance")
        expect(v_u_80).to.equal(123)
        expect(v_u_89.ClassName).to.equal("Frame")
        expect(v_u_88).to.equal(1)
        local v94 = v_u_2(v87, {
            [v_u_8] = v91,
            ["value"] = 456
        })
        local v95 = v_u_9.updateVirtualTree(v93, v94)
        expect(v_u_80).to.equal(456)
        expect(v_u_88).to.equal(1)
        v_u_9.unmountVirtualTree(v95)
    end)
    it("should not re-run the render callback on a deep setState", function()
        local v_u_96 = nil
        local v_u_97 = {}
        local v_u_98 = v_u_6:extend("Inner")
        function v_u_98.render(p99)
            local v100 = v_u_97
            table.insert(v100, "Inner")
            v_u_96 = p99
            return v_u_2("Frame", {
                [v_u_8] = p99.props.forwardedRef
            })
        end
        local function v_u_103(p101)
            local v102 = v_u_97
            table.insert(v102, "Middle")
            return v_u_2(v_u_98, p101)
        end
        local v_u_107 = v_u_4(function(p104, p105)
            local v106 = v_u_97
            table.insert(v106, "Forward")
            return v_u_2(v_u_103, v_u_1({}, p104, {
                ["forwardedRef"] = p105
            }))
        end)
        local function v109()
            local v108 = v_u_97
            table.insert(v108, "App")
            return v_u_2(v_u_107)
        end
        local v110 = v_u_9.mountVirtualTree(v_u_2(v109), nil, "deep setState")
        expect(#v_u_97).to.equal(4)
        expect(v_u_97[1]).to.equal("App")
        expect(v_u_97[2]).to.equal("Forward")
        expect(v_u_97[3]).to.equal("Middle")
        expect(v_u_97[4]).to.equal("Inner")
        v_u_97 = {}
        v_u_96:setState({})
        expect(#v_u_97).to.equal(1)
        expect(v_u_97[1]).to.equal("Inner")
        v_u_9.unmountVirtualTree(v110)
    end)
    it("should not include the ref in the forwarded props", function()
        local v_u_111 = nil
        local function v_u_113(p112)
            v_u_111 = p112
            return v_u_2("Frame", {
                [v_u_8] = p112.forwardedRef
            })
        end
        local v116 = v_u_4(function(p114, p115)
            return v_u_2(v_u_113, v_u_1({}, p114, {
                ["forwardedRef"] = p115
            }))
        end)
        local v117 = v_u_3()
        local v118 = v_u_2(v116, {
            [v_u_8] = v117
        })
        local v119 = v_u_9.mountVirtualTree(v118, nil, "no ref in props")
        expect(v_u_111).to.be.ok()
        expect(v_u_111.forwardedRef).to.equal(v117)
        expect(v_u_111[v_u_8]).to.equal(nil)
        v_u_9.unmountVirtualTree(v119)
    end)
end