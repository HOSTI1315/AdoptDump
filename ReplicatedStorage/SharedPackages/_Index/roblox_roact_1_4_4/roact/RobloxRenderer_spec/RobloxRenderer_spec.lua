--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.RobloxRenderer.spec (ModuleScript)

return function()
    local v_u_1 = game:GetService("ReplicatedStorage")
    local v_u_2 = require(script.Parent.assertDeepEqual)
    local v_u_3 = require(script.Parent.Binding)
    local v_u_4 = require(script.Parent.PropMarkers.Children)
    local v_u_5 = require(script.Parent.Component)
    local v_u_6 = require(script.Parent.createElement)
    local v_u_7 = require(script.Parent.createFragment)
    local v8 = require(script.Parent.createReconciler)
    local v_u_9 = require(script.Parent.createRef)
    local v_u_10 = require(script.Parent.createSpy)
    local v_u_11 = require(script.Parent.GlobalConfig)
    local v_u_12 = require(script.Parent.Portal)
    local v_u_13 = require(script.Parent.PropMarkers.Ref)
    local v_u_14 = require(script.Parent.PropMarkers.Event)
    local v_u_15 = require(script.Parent.RobloxRenderer)
    local v_u_16 = v8(v_u_15)
    describe("mountHostNode", function()
        it("should create instances with correct props", function()
            local v17 = Instance.new("Folder")
            local v18 = v_u_6("StringValue", {
                ["Value"] = "Hello!"
            })
            local v19 = v_u_16.createVirtualNode(v18, v17, "Some Key")
            v_u_15.mountHostNode(v_u_16, v19)
            expect(#v17:GetChildren()).to.equal(1)
            local v20 = v17:GetChildren()[1]
            expect(v20.ClassName).to.equal("StringValue")
            expect(v20.Value).to.equal("Hello!")
            expect(v20.Name).to.equal("Some Key")
        end)
        it("should create children with correct names and props", function()
            local v21 = Instance.new("Folder")
            local v22 = v_u_6
            local v23 = {
                ["ChildA"] = v_u_6("IntValue", {
                    ["Value"] = 173
                }),
                ["ChildB"] = v_u_6("Folder")
            }
            local v24 = v22("StringValue", {
                ["Value"] = "Hey there!"
            }, v23)
            local v25 = v_u_16.createVirtualNode(v24, v21, "Some Key")
            v_u_15.mountHostNode(v_u_16, v25)
            expect(#v21:GetChildren()).to.equal(1)
            local v26 = v21:GetChildren()[1]
            expect(v26.ClassName).to.equal("StringValue")
            expect(v26.Value).to.equal("Hey there!")
            expect(v26.Name).to.equal("Some Key")
            expect(#v26:GetChildren()).to.equal(2)
            local v27 = v26.ChildA
            local v28 = v26.ChildB
            expect(v27).to.be.ok()
            expect(v28).to.be.ok()
            expect(v27.ClassName).to.equal("IntValue")
            expect(v27.Value).to.equal(173)
            expect(v28.ClassName).to.equal("Folder")
        end)
        it("should attach Bindings to Roblox properties", function()
            local v29 = Instance.new("Folder")
            local v30, v31 = v_u_3.create(10)
            local v32 = v_u_6("IntValue", {
                ["Value"] = v30
            })
            local v33 = v_u_16.createVirtualNode(v32, v29, "Some Key")
            v_u_15.mountHostNode(v_u_16, v33)
            expect(#v29:GetChildren()).to.equal(1)
            local v34 = v29:GetChildren()[1]
            expect(v34.ClassName).to.equal("IntValue")
            expect(v34.Value).to.equal(10)
            v31(20)
            expect(v34.Value).to.equal(20)
            v_u_15.unmountHostNode(v_u_16, v33)
        end)
        it("should connect Binding refs", function()
            local v35 = Instance.new("Folder")
            local v36 = v_u_9()
            local v37 = v_u_6("Frame", {
                [v_u_13] = v36
            })
            local v38 = v_u_16.createVirtualNode(v37, v35, "Some Key")
            v_u_15.mountHostNode(v_u_16, v38)
            expect(#v35:GetChildren()).to.equal(1)
            local v39 = v35:GetChildren()[1]
            expect(v36.current).to.be.ok()
            expect(v36.current).to.equal(v39)
            v_u_15.unmountHostNode(v_u_16, v38)
        end)
        it("should call function refs", function()
            local v40 = Instance.new("Folder")
            local v41 = v_u_10()
            local v42 = v_u_6("Frame", {
                [v_u_13] = v41.value
            })
            local v43 = v_u_16.createVirtualNode(v42, v40, "Some Key")
            v_u_15.mountHostNode(v_u_16, v43)
            expect(#v40:GetChildren()).to.equal(1)
            local v44 = v40:GetChildren()[1]
            expect(v41.callCount).to.equal(1)
            v41:assertCalledWith(v44)
            v_u_15.unmountHostNode(v_u_16, v43)
        end)
        it("should throw if setting invalid instance properties", function()
            v_u_11.scoped({
                ["elementTracing"] = true
            }, function()
                local v45 = Instance.new("Folder")
                local v46 = v_u_6("Frame", {
                    ["Frob"] = 6
                })
                local v47 = v_u_16.createVirtualNode(v46, v45, "Some Key")
                local v48, v49 = pcall(v_u_15.mountHostNode, v_u_16, v47)
                assert(not v48, "Expected call to fail")
                expect(v49:find("Frob")).to.be.ok()
                expect(v49:find("Frame")).to.be.ok()
                expect(v49:find("RobloxRenderer%.spec")).to.be.ok()
            end)
        end)
    end)
    describe("updateHostNode", function()
        it("should update node props and children", function()
            local v50 = Instance.new("Folder")
            local v51 = Instance.new("StringValue").Value
            local v52 = v_u_6
            local v53 = {
                ["ChildA"] = v_u_6("IntValue", {
                    ["Value"] = 1
                }),
                ["ChildB"] = v_u_6("BoolValue", {
                    ["Value"] = true
                }),
                ["ChildC"] = v_u_6("StringValue", {
                    ["Value"] = "test"
                }),
                ["ChildD"] = v_u_6("StringValue", {
                    ["Value"] = "test"
                })
            }
            local v54 = v52("StringValue", {
                ["Value"] = "foo"
            }, v53)
            local v55 = v_u_16.createVirtualNode(v54, v50, "updateHostNodeTest")
            v_u_15.mountHostNode(v_u_16, v55)
            local v56 = v_u_6
            local v57 = {
                ["ChildA"] = v_u_6("StringValue", {
                    ["Value"] = "test"
                }),
                ["ChildB"] = v_u_6("BoolValue", {
                    ["Value"] = false
                }),
                ["ChildC"] = v_u_6("StringValue", {}),
                ["ChildE"] = v_u_6("Folder", {})
            }
            local v58 = v56("StringValue", {
                ["Value"] = "bar"
            }, v57)
            v_u_15.updateHostNode(v_u_16, v55, v58)
            local v59 = v50.updateHostNodeTest
            expect(v59.ClassName).to.equal("StringValue")
            expect(v59.Value).to.equal("bar")
            expect(#v59:GetChildren()).to.equal(4)
            local v60 = v59.ChildA
            expect(v60.ClassName).to.equal("StringValue")
            expect(v60.Value).to.equal("test")
            local v61 = v59.ChildB
            expect(v61.ClassName).to.equal("BoolValue")
            expect(v61.Value).to.equal(false)
            local v62 = v59.ChildC
            expect(v62.ClassName).to.equal("StringValue")
            expect(v62.Value).to.equal(v51)
            local v63 = v59.ChildE
            expect(v63.ClassName).to.equal("Folder")
        end)
        it("should update Bindings", function()
            local v64 = Instance.new("Folder")
            local v65, v66 = v_u_3.create(10)
            local v67 = v_u_6("IntValue", {
                ["Value"] = v65
            })
            local v68 = v_u_16.createVirtualNode(v67, v64, "Some Key")
            v_u_15.mountHostNode(v_u_16, v68)
            local v69 = v64:GetChildren()[1]
            expect(v69.Value).to.equal(10)
            local v70, v71 = v_u_3.create(99)
            local v72 = v_u_6("IntValue", {
                ["Value"] = v70
            })
            v_u_15.updateHostNode(v_u_16, v68, v72)
            expect(v69.Value).to.equal(99)
            v66(123)
            expect(v69.Value).to.equal(99)
            v71(123)
            expect(v69.Value).to.equal(123)
            v_u_15.unmountHostNode(v_u_16, v68)
        end)
        it("should update Binding refs", function()
            local v73 = Instance.new("Folder")
            local v74 = v_u_9()
            local v75 = v_u_9()
            local v76 = v_u_6("Frame", {
                [v_u_13] = v74
            })
            local v77 = v_u_16.createVirtualNode(v76, v73, "Some Key")
            v_u_15.mountHostNode(v_u_16, v77)
            expect(#v73:GetChildren()).to.equal(1)
            local v78 = v73:GetChildren()[1]
            expect(v74.current).to.equal(v78)
            expect(v75.current).never.to.be.ok()
            local v79 = v_u_6("Frame", {
                [v_u_13] = v75
            })
            v_u_15.updateHostNode(v_u_16, v77, v79)
            expect(v74.current).never.to.be.ok()
            expect(v75.current).to.equal(v78)
            v_u_15.unmountHostNode(v_u_16, v77)
        end)
        it("should call old function refs with nil and new function refs with a valid rbx", function()
            local v80 = Instance.new("Folder")
            local v81 = v_u_10()
            local v82 = v_u_10()
            local v83 = v_u_6("Frame", {
                [v_u_13] = v81.value
            })
            local v84 = v_u_16.createVirtualNode(v83, v80, "Some Key")
            v_u_15.mountHostNode(v_u_16, v84)
            expect(#v80:GetChildren()).to.equal(1)
            local v85 = v80:GetChildren()[1]
            expect(v81.callCount).to.equal(1)
            v81:assertCalledWith(v85)
            expect(v82.callCount).to.equal(0)
            local v86 = v_u_6("Frame", {
                [v_u_13] = v82.value
            })
            v_u_15.updateHostNode(v_u_16, v84, v86)
            expect(v81.callCount).to.equal(2)
            v81:assertCalledWith(nil)
            expect(v82.callCount).to.equal(1)
            v82:assertCalledWith(v85)
            v_u_15.unmountHostNode(v_u_16, v84)
        end)
        it("should not call function refs again if they didn\'t change", function()
            local v87 = Instance.new("Folder")
            local v88 = v_u_10()
            local v89 = v_u_6("Frame", {
                ["Size"] = UDim2.new(1, 0, 1, 0),
                [v_u_13] = v88.value
            })
            local v90 = v_u_16.createVirtualNode(v89, v87, "Some Key")
            v_u_15.mountHostNode(v_u_16, v90)
            expect(#v87:GetChildren()).to.equal(1)
            local v91 = v87:GetChildren()[1]
            expect(v88.callCount).to.equal(1)
            v88:assertCalledWith(v91)
            local v92 = v_u_6("Frame", {
                ["Size"] = UDim2.new(0.5, 0, 0.5, 0),
                [v_u_13] = v88.value
            })
            v_u_15.updateHostNode(v_u_16, v90, v92)
            expect(v88.callCount).to.equal(1)
        end)
        it("should throw if setting invalid instance properties", function()
            v_u_11.scoped({
                ["elementTracing"] = true
            }, function()
                local v93 = Instance.new("Folder")
                local v94 = v_u_6("Frame")
                local v95 = v_u_6("Frame", {
                    ["Frob"] = 6
                })
                local v96 = v_u_16.createVirtualNode(v94, v93, "Some Key")
                v_u_15.mountHostNode(v_u_16, v96)
                local v97, v98 = pcall(v_u_15.updateHostNode, v_u_16, v96, v95)
                assert(not v97, "Expected call to fail")
                expect(v98:find("Frob")).to.be.ok()
                expect(v98:find("Frame")).to.be.ok()
                expect(v98:find("RobloxRenderer%.spec")).to.be.ok()
            end)
        end)
        it("should delete instances when reconciling to nil children", function()
            local v99 = Instance.new("Folder")
            local v100 = v_u_6("Frame", {
                ["Size"] = UDim2.new(1, 0, 1, 0)
            }, {
                ["child"] = v_u_6("Frame")
            })
            local v101 = v_u_16.createVirtualNode(v100, v99, "Some Key")
            v_u_15.mountHostNode(v_u_16, v101)
            expect(#v99:GetChildren()).to.equal(1)
            local v102 = v99:GetChildren()[1]
            expect(#v102:GetChildren()).to.equal(1)
            local v103 = v_u_6("Frame", {
                ["Size"] = UDim2.new(0.5, 0, 0.5, 0)
            })
            v_u_15.updateHostNode(v_u_16, v101, v103)
            expect(#v102:GetChildren()).to.equal(0)
        end)
    end)
    describe("unmountHostNode", function()
        it("should delete instances from the inside-out", function()
            local v104 = Instance.new("Folder")
            local v105 = v_u_6
            local v106 = {
                ["Child"] = v_u_6("Folder", nil, {
                    ["Grandchild"] = v_u_6("Folder")
                })
            }
            local v107 = v105("Folder", nil, v106)
            local v108 = v_u_16.mountVirtualNode(v107, v104, "Root")
            expect(#v104:GetChildren()).to.equal(1)
            local v109 = v104:GetChildren()[1]
            expect(#v109:GetChildren()).to.equal(1)
            local v110 = v109:GetChildren()[1]
            expect(#v110:GetChildren()).to.equal(1)
            local v111 = v110:GetChildren()[1]
            v_u_15.unmountHostNode(v_u_16, v108)
            expect(v111.Parent).to.equal(nil)
            expect(v110.Parent).to.equal(nil)
            expect(v109.Parent).to.equal(nil)
        end)
        it("should unsubscribe from any Bindings", function()
            local v112 = Instance.new("Folder")
            local v113, v114 = v_u_3.create(10)
            local v115 = v_u_6("IntValue", {
                ["Value"] = v113
            })
            local v116 = v_u_16.createVirtualNode(v115, v112, "Some Key")
            v_u_15.mountHostNode(v_u_16, v116)
            local v117 = v112:GetChildren()[1]
            expect(v117.Value).to.equal(10)
            v_u_15.unmountHostNode(v_u_16, v116)
            v114(56)
            expect(v117.Value).to.equal(10)
        end)
        it("should clear Binding refs", function()
            local v118 = Instance.new("Folder")
            local v119 = v_u_9()
            local v120 = v_u_6("Frame", {
                [v_u_13] = v119
            })
            local v121 = v_u_16.createVirtualNode(v120, v118, "Some Key")
            v_u_15.mountHostNode(v_u_16, v121)
            expect(v119.current).to.be.ok()
            v_u_15.unmountHostNode(v_u_16, v121)
            expect(v119.current).never.to.be.ok()
        end)
        it("should call function refs with nil", function()
            local v122 = Instance.new("Folder")
            local v123 = v_u_10()
            local v124 = v_u_6("Frame", {
                [v_u_13] = v123.value
            })
            local v125 = v_u_16.createVirtualNode(v124, v122, "Some Key")
            v_u_15.mountHostNode(v_u_16, v125)
            expect(v123.callCount).to.equal(1)
            v_u_15.unmountHostNode(v_u_16, v125)
            expect(v123.callCount).to.equal(2)
            v123:assertCalledWith(nil)
        end)
    end)
    describe("Portals", function()
        it("should create and destroy instances as children of `target`", function()
            local v126 = Instance.new("Folder")
            local function v128(p127)
                return v_u_6("IntValue", {
                    ["Value"] = p127.value
                })
            end
            local v129 = v_u_6
            local v130 = v_u_12
            local v131 = {
                ["folderOne"] = v_u_6("Folder"),
                ["folderTwo"] = v_u_6("Folder"),
                ["intValueOne"] = v_u_6(v128, {
                    ["value"] = 42
                })
            }
            local v132 = v129(v130, {
                ["target"] = v126
            }, v131)
            local v133 = v_u_16.mountVirtualNode(v132, nil, "Some Key")
            expect(#v126:GetChildren()).to.equal(3)
            expect(v126:FindFirstChild("folderOne")).to.be.ok()
            expect(v126:FindFirstChild("folderTwo")).to.be.ok()
            expect(v126:FindFirstChild("intValueOne")).to.be.ok()
            expect(v126:FindFirstChild("intValueOne").Value).to.equal(42)
            v_u_16.unmountVirtualNode(v133)
            expect(#v126:GetChildren()).to.equal(0)
        end)
        it("should pass prop updates through to children", function()
            local v134 = Instance.new("Folder")
            local v135 = v_u_6
            local v136 = v_u_12
            local v137 = {
                ["ChildValue"] = v_u_6("IntValue", {
                    ["Value"] = 1
                })
            }
            local v138 = v135(v136, {
                ["target"] = v134
            }, v137)
            local v139 = v_u_6
            local v140 = v_u_12
            local v141 = {
                ["ChildValue"] = v_u_6("IntValue", {
                    ["Value"] = 2
                })
            }
            local v142 = v139(v140, {
                ["target"] = v134
            }, v141)
            local v143 = v_u_16.mountVirtualNode(v138, nil, "A Host Key")
            expect(#v134:GetChildren()).to.equal(1)
            local v144 = v134.ChildValue
            expect(v144.Value).to.equal(1)
            local v145 = v_u_16.updateVirtualNode(v143, v142)
            expect(#v134:GetChildren()).to.equal(1)
            local v146 = v134.ChildValue
            expect(v144).to.equal(v146)
            expect(v146.Value).to.equal(2)
            v_u_16.unmountVirtualNode(v145)
            expect(#v134:GetChildren()).to.equal(0)
        end)
        it("should throw if `target` is nil", function()
            local v_u_147 = v_u_6(v_u_12)
            expect(function()
                v_u_16.mountVirtualNode(v_u_147, nil, "Keys for Everyone")
            end).to.throw()
        end)
        it("should throw if `target` is not a Roblox instance", function()
            local v_u_148 = v_u_6(v_u_12, {
                ["target"] = {}
            })
            expect(function()
                v_u_16.mountVirtualNode(v_u_148, nil, "Unleash the keys!")
            end).to.throw()
        end)
        it("should recreate instances if `target` changes in an update", function()
            local v149 = Instance.new("Folder")
            local v150 = Instance.new("Folder")
            local v151 = v_u_6
            local v152 = v_u_12
            local v153 = {
                ["ChildValue"] = v_u_6("IntValue", {
                    ["Value"] = 1
                })
            }
            local v154 = v151(v152, {
                ["target"] = v149
            }, v153)
            local v155 = v_u_6
            local v156 = v_u_12
            local v157 = {
                ["ChildValue"] = v_u_6("IntValue", {
                    ["Value"] = 2
                })
            }
            local v158 = v155(v156, {
                ["target"] = v150
            }, v157)
            local v159 = v_u_16.mountVirtualNode(v154, nil, "Some Key")
            expect(#v149:GetChildren()).to.equal(1)
            expect(#v150:GetChildren()).to.equal(0)
            local v160 = v149.ChildValue
            expect(v160.Value).to.equal(1)
            local v161 = v_u_16.updateVirtualNode(v159, v158)
            expect(#v149:GetChildren()).to.equal(0)
            expect(#v150:GetChildren()).to.equal(1)
            local v162 = v150.ChildValue
            expect(v162.Value).to.equal(2)
            v_u_16.unmountVirtualNode(v161)
            expect(#v149:GetChildren()).to.equal(0)
            expect(#v150:GetChildren()).to.equal(0)
        end)
    end)
    describe("Fragments", function()
        it("should parent the fragment\'s elements into the fragment\'s parent", function()
            local v163 = Instance.new("Folder")
            local v164 = v_u_7
            local v165 = {
                ["key"] = v_u_6("IntValue", {
                    ["Value"] = 1
                }),
                ["key2"] = v_u_6("IntValue", {
                    ["Value"] = 2
                })
            }
            local v166 = v164(v165)
            local v167 = v_u_16.mountVirtualNode(v166, v163, "test")
            expect(v163:FindFirstChild("key")).to.be.ok()
            expect(v163.key.ClassName).to.equal("IntValue")
            expect(v163.key.Value).to.equal(1)
            expect(v163:FindFirstChild("key2")).to.be.ok()
            expect(v163.key2.ClassName).to.equal("IntValue")
            expect(v163.key2.Value).to.equal(2)
            v_u_16.unmountVirtualNode(v167)
            expect(#v163:GetChildren()).to.equal(0)
        end)
        it("should allow sibling fragment to have common keys", function()
            local v168 = Instance.new("Folder")
            local function v175(_)
                local v169 = v_u_6
                local v170 = {}
                local v171 = v_u_7
                local v172 = {
                    ["key"] = v_u_6("StringValue", {
                        ["Value"] = "A"
                    }),
                    ["key2"] = v_u_6("StringValue", {
                        ["Value"] = "B"
                    })
                }
                v170.fragmentA = v171(v172)
                local v173 = v_u_7
                local v174 = {
                    ["key"] = v_u_6("StringValue", {
                        ["Value"] = "C"
                    }),
                    ["key2"] = v_u_6("StringValue", {
                        ["Value"] = "D"
                    })
                }
                v170.fragmentB = v173(v174)
                return v169("IntValue", {}, v170)
            end
            local v176 = v_u_16.mountVirtualNode(v_u_6(v175), v168, "Test")
            local v177 = v168.Test:GetChildren()
            expect(#v177).to.equal(4)
            local v178 = {}
            for _, v179 in pairs(v177) do
                expect(v179.ClassName).to.equal("StringValue")
                v178[v179.Value] = 1 + (v178[v179.Value] or 0)
            end
            expect(v178.A).to.equal(1)
            expect(v178.B).to.equal(1)
            expect(v178.C).to.equal(1)
            expect(v178.D).to.equal(1)
            v_u_16.unmountVirtualNode(v176)
            expect(#v168:GetChildren()).to.equal(0)
        end)
        it("should render nested fragments", function()
            local v180 = Instance.new("Folder")
            local v181 = v_u_7
            local v182 = {}
            local v183 = v_u_7
            local v184 = {
                ["TheValue"] = v_u_6("IntValue", {
                    ["Value"] = 1
                }),
                ["TheOtherValue"] = v_u_6("IntValue", {
                    ["Value"] = 2
                })
            }
            v182.key = v183(v184)
            local v185 = v181(v182)
            local v186 = v_u_16.mountVirtualNode(v185, v180, "Test")
            expect(v180:FindFirstChild("TheValue")).to.be.ok()
            expect(v180.TheValue.ClassName).to.equal("IntValue")
            expect(v180.TheValue.Value).to.equal(1)
            expect(v180:FindFirstChild("TheOtherValue")).to.be.ok()
            expect(v180.TheOtherValue.ClassName).to.equal("IntValue")
            expect(v180.TheOtherValue.Value).to.equal(2)
            v_u_16.unmountVirtualNode(v186)
            expect(#v180:GetChildren()).to.equal(0)
        end)
        it("should not add any instances if the fragment is empty", function()
            local v187 = Instance.new("Folder")
            local v188 = v_u_16.mountVirtualNode(v_u_7({}), v187, "test")
            expect(#v187:GetChildren()).to.equal(0)
            v_u_16.unmountVirtualNode(v188)
            expect(#v187:GetChildren()).to.equal(0)
        end)
    end)
    describe("Context", function()
        it("should pass context values through Roblox host nodes", function()
            local v189 = v_u_5:extend("Consumer")
            local v_u_190 = nil
            function v189.init(p191)
                v_u_190 = {
                    ["hello"] = p191:__getContext("hello")
                }
            end
            function v189.render(_) end
            local v192 = v_u_6("Folder", nil, {
                ["Consumer"] = v_u_6(v189)
            })
            local v193 = {
                ["hello"] = "world"
            }
            local v194 = v_u_16.mountVirtualNode(v192, nil, "Context Test", v193)
            expect(v_u_190).never.to.equal(v193)
            v_u_2(v_u_190, v193)
            v_u_16.unmountVirtualNode(v194)
        end)
        it("should pass context values through portal nodes", function()
            local v195 = Instance.new("Folder")
            local v196 = v_u_5:extend("Provider")
            function v196.init(p197)
                p197:__addContext("foo", "bar")
            end
            function v196.render(p198)
                return v_u_6("Folder", nil, p198.props[v_u_4])
            end
            local v199 = v_u_5:extend("Consumer")
            local v_u_200 = nil
            function v199.init(p201)
                v_u_200 = {
                    ["foo"] = p201:__getContext("foo")
                }
            end
            function v199.render(_)
                return nil
            end
            local v202 = v_u_6
            local v203 = {
                ["Portal"] = v_u_6(v_u_12, {
                    ["target"] = v195
                }, {
                    ["Consumer"] = v_u_6(v199)
                })
            }
            local v204 = v202(v196, nil, v203)
            v_u_16.mountVirtualNode(v204, nil, "Some Key")
            v_u_2(v_u_200, {
                ["foo"] = "bar"
            })
        end)
    end)
    describe("Legacy context", function()
        it("should pass context values through Roblox host nodes", function()
            local v205 = v_u_5:extend("Consumer")
            local v_u_206 = nil
            function v205.init(p207)
                v_u_206 = p207._context
            end
            function v205.render(_) end
            local v208 = v_u_6("Folder", nil, {
                ["Consumer"] = v_u_6(v205)
            })
            local v209 = {
                ["hello"] = "world"
            }
            local v210 = v_u_16.mountVirtualNode(v208, nil, "Context Test", nil, v209)
            expect(v_u_206).never.to.equal(v209)
            v_u_2(v_u_206, v209)
            v_u_16.unmountVirtualNode(v210)
        end)
        it("should pass context values through portal nodes", function()
            local v211 = Instance.new("Folder")
            local v212 = v_u_5:extend("Provider")
            function v212.init(p213)
                p213._context.foo = "bar"
            end
            function v212.render(p214)
                return v_u_6("Folder", nil, p214.props[v_u_4])
            end
            local v215 = v_u_5:extend("Consumer")
            local v_u_216 = nil
            function v215.init(p217)
                v_u_216 = p217._context
            end
            function v215.render(_)
                return nil
            end
            local v218 = v_u_6
            local v219 = {
                ["Portal"] = v_u_6(v_u_12, {
                    ["target"] = v211
                }, {
                    ["Consumer"] = v_u_6(v215)
                })
            }
            local v220 = v218(v212, nil, v219)
            v_u_16.mountVirtualNode(v220, nil, "Some Key")
            v_u_2(v_u_216, {
                ["foo"] = "bar"
            })
        end)
    end)
    describe("Integration Tests", function()
        local v_u_221 = nil
        beforeEach(function()
            v_u_221 = Instance.new("Folder")
            v_u_221.Parent = v_u_1
        end)
        afterEach(function()
            v_u_221:Destroy()
            v_u_221 = nil
        end)
        it("should not allow re-entrancy in updateChildren", function()
            local v_u_222 = v_u_5:extend("ChildComponent")
            function v_u_222.init(p223)
                p223:setState({
                    ["firstTime"] = true
                })
            end
            local v_u_224 = nil
            function v_u_222.render(p225)
                if p225.state.firstTime then
                    return v_u_6("Frame")
                else
                    return v_u_6("TextLabel")
                end
            end
            function v_u_222.didMount(p_u_226)
                v_u_224 = coroutine.create(function()
                    p_u_226:setState({
                        ["firstTime"] = false
                    })
                end)
            end
            local v227 = v_u_5:extend("ParentComponent")
            function v227.init(p_u_228)
                p_u_228:setState({
                    ["count"] = 1
                })
                function p_u_228.childAdded()
                    p_u_228:setState({
                        ["count"] = p_u_228.state.count + 1
                    })
                end
            end
            function v227.render(p229)
                local v230 = v_u_6
                local v231 = {
                    [v_u_14.ChildAdded] = p229.childAdded
                }
                local v232 = {
                    ["ChildComponent"] = v_u_6(v_u_222, {
                        ["count"] = p229.state.count
                    })
                }
                return v230("Frame", v231, v232)
            end
            local v233 = Instance.new("ScreenGui")
            v233.Parent = v_u_221
            local v234 = v_u_6(v227)
            local v235 = v_u_16.mountVirtualNode(v234, v233, "Some Key")
            coroutine.resume(v_u_224)
            expect(#v233:GetChildren()).to.equal(1)
            local v236 = v233:GetChildren()[1]
            expect(#v236:GetChildren()).to.equal(1)
            v_u_16.unmountVirtualNode(v235)
        end)
        it("should not allow re-entrancy in updateChildren even with callbacks", function()
            local v_u_237 = v_u_5:extend("LowestComponent")
            function v_u_237.render(_)
                return v_u_6("Frame")
            end
            function v_u_237.didMount(p238)
                p238.props.onDidMountCallback()
            end
            local v_u_239 = v_u_5:extend("ChildComponent")
            function v_u_239.init(p240)
                p240:setState({
                    ["firstTime"] = true
                })
            end
            local v_u_241 = nil
            function v_u_239.render(p242)
                if p242.state.firstTime then
                    return v_u_6("Frame")
                else
                    return v_u_6(v_u_237, {
                        ["onDidMountCallback"] = p242.props.onDidMountCallback
                    })
                end
            end
            function v_u_239.didMount(p_u_243)
                v_u_241 = coroutine.create(function()
                    p_u_243:setState({
                        ["firstTime"] = false
                    })
                end)
            end
            local v244 = v_u_5:extend("ParentComponent")
            local v_u_245 = 0
            function v244.init(p_u_246)
                p_u_246:setState({
                    ["count"] = 1
                })
                function p_u_246.onDidMountCallback()
                    v_u_245 = v_u_245 + 1
                    if p_u_246.state.count < 5 then
                        p_u_246:setState({
                            ["count"] = p_u_246.state.count + 1
                        })
                    end
                end
            end
            function v244.render(p247)
                local v248 = v_u_6
                local v249 = {
                    ["ChildComponent"] = v_u_6(v_u_239, {
                        ["count"] = p247.state.count,
                        ["onDidMountCallback"] = p247.onDidMountCallback
                    })
                }
                return v248("Frame", {}, v249)
            end
            local v250 = Instance.new("ScreenGui")
            v250.Parent = v_u_221
            local v251 = v_u_6(v244)
            local v252 = v_u_16.mountVirtualNode(v251, v250, "Some Key")
            coroutine.resume(v_u_241)
            expect(#v250:GetChildren()).to.equal(1)
            local v253 = v250:GetChildren()[1]
            expect(#v253:GetChildren()).to.equal(1)
            expect(v_u_245 <= 2).to.equal(true)
            v_u_16.unmountVirtualNode(v252)
        end)
        it("should never call unmount twice in the case of update children re-rentrancy", function()
            local v_u_254 = {}
            local v_u_255 = v_u_5:extend("LowestComponent")
            function v_u_255.init(p256)
                v_u_254[tostring(p256)] = 0
            end
            function v_u_255.render(_)
                return v_u_6("Frame")
            end
            function v_u_255.didMount(p257)
                p257.props.onDidMountCallback()
            end
            function v_u_255.willUnmount(p258)
                local v259 = tostring(p258)
                v_u_254[v259] = v_u_254[v259] + 1
            end
            local v_u_260 = v_u_5:extend("FirstComponent")
            function v_u_260.init(p261)
                v_u_254[tostring(p261)] = 0
            end
            function v_u_260.render(_)
                return v_u_6("TextLabel")
            end
            function v_u_260.willUnmount(p262)
                local v263 = tostring(p262)
                v_u_254[v263] = v_u_254[v263] + 1
            end
            local v_u_264 = v_u_5:extend("ChildComponent")
            function v_u_264.init(p265)
                v_u_254[tostring(p265)] = 0
                p265:setState({
                    ["firstTime"] = true
                })
            end
            local v_u_266 = nil
            function v_u_264.render(p267)
                if p267.state.firstTime then
                    return v_u_6(v_u_260)
                else
                    return v_u_6(v_u_255, {
                        ["onDidMountCallback"] = p267.props.onDidMountCallback
                    })
                end
            end
            function v_u_264.didMount(p_u_268)
                v_u_266 = coroutine.create(function()
                    p_u_268:setState({
                        ["firstTime"] = false
                    })
                end)
            end
            function v_u_264.willUnmount(p269)
                local v270 = tostring(p269)
                v_u_254[v270] = v_u_254[v270] + 1
            end
            local v271 = v_u_5:extend("ParentComponent")
            local v_u_272 = 0
            function v271.init(p_u_273)
                p_u_273:setState({
                    ["count"] = 1
                })
                function p_u_273.onDidMountCallback()
                    v_u_272 = v_u_272 + 1
                    if p_u_273.state.count < 5 then
                        p_u_273:setState({
                            ["count"] = p_u_273.state.count + 1
                        })
                    end
                end
            end
            function v271.render(p274)
                local v275 = v_u_6
                local v276 = {
                    ["ChildComponent"] = v_u_6(v_u_264, {
                        ["count"] = p274.state.count,
                        ["onDidMountCallback"] = p274.onDidMountCallback
                    })
                }
                return v275("Frame", {}, v276)
            end
            local v277 = Instance.new("ScreenGui")
            v277.Parent = v_u_221
            local v278 = v_u_6(v271)
            local v279 = v_u_16.mountVirtualNode(v278, v277, "Some Key")
            coroutine.resume(v_u_266)
            expect(#v277:GetChildren()).to.equal(1)
            local v280 = v277:GetChildren()[1]
            expect(#v280:GetChildren()).to.equal(1)
            expect(v_u_272 <= 2).to.equal(true)
            v_u_16.unmountVirtualNode(v279)
            for _, v281 in pairs(v_u_254) do
                expect(v281).to.equal(1)
            end
        end)
        it("should never unmount a node unnecesarily in the case of re-rentry", function()
            local v_u_282 = v_u_5:extend("LowestComponent")
            function v_u_282.render(_)
                return v_u_6("Frame")
            end
            function v_u_282.didUpdate(p283, p284, _)
                if p284.firstTime and not p283.props.firstTime then
                    p283.props.onChangedCallback()
                end
            end
            local v_u_285 = v_u_5:extend("ChildComponent")
            function v_u_285.init(p286)
                p286:setState({
                    ["firstTime"] = true
                })
            end
            local v_u_287 = nil
            function v_u_285.render(p288)
                return v_u_6(v_u_282, {
                    ["firstTime"] = p288.state.firstTime,
                    ["onChangedCallback"] = p288.props.onChangedCallback
                })
            end
            function v_u_285.didMount(p_u_289)
                v_u_287 = coroutine.create(function()
                    p_u_289:setState({
                        ["firstTime"] = false
                    })
                end)
            end
            local v290 = v_u_5:extend("ParentComponent")
            local v_u_291 = 0
            function v290.init(p_u_292)
                p_u_292:setState({
                    ["count"] = 1
                })
                function p_u_292.onChangedCallback()
                    v_u_291 = v_u_291 + 1
                    if p_u_292.state.count < 5 then
                        p_u_292:setState({
                            ["count"] = p_u_292.state.count + 1
                        })
                    end
                end
            end
            function v290.render(p293)
                local v294 = v_u_6
                local v295 = {
                    ["ChildComponent"] = v_u_6(v_u_285, {
                        ["count"] = p293.state.count,
                        ["onChangedCallback"] = p293.onChangedCallback
                    })
                }
                return v294("Frame", {}, v295)
            end
            local v296 = Instance.new("ScreenGui")
            v296.Parent = v_u_221
            local v297 = v_u_6(v290)
            local v298 = v_u_16.mountVirtualNode(v297, v296, "Some Key")
            coroutine.resume(v_u_287)
            expect(#v296:GetChildren()).to.equal(1)
            local v299 = v296:GetChildren()[1]
            expect(#v299:GetChildren()).to.equal(1)
            expect(v_u_291).to.equal(1)
            v_u_16.unmountVirtualNode(v298)
        end)
    end)
end