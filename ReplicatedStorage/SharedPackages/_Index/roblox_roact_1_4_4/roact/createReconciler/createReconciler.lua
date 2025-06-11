--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createReconciler (ModuleScript)

local v_u_1 = require(script.Parent.Type)
local v_u_2 = require(script.Parent.ElementKind)
local v_u_3 = require(script.Parent.ElementUtils)
local v_u_4 = require(script.Parent.PropMarkers.Children)
local v5 = require(script.Parent.Symbol)
local v_u_6 = require(script.Parent.internalAssert)
local v_u_7 = require(script.Parent.GlobalConfig).get()
local v_u_8 = v5.named("InternalData")
return function(p_u_9)
    local v_u_10 = nil
    local v_u_11 = nil
    local v_u_12 = nil
    local v_u_13 = nil
    local function v_u_27(p14, p15, p16)
        if v_u_7.internalTypeChecks then
            v_u_6(v_u_1.of(p14) == v_u_1.VirtualNode, "Expected arg #1 to be of type VirtualNode")
        end
        p14.updateChildrenCount = p14.updateChildrenCount + 1
        local v17 = p14.updateChildrenCount
        local v18 = {}
        for v19, v20 in pairs(p14.children) do
            local v21 = v_u_12(v20, (v_u_3.getElementByKey(p16, v19)))
            if p14.updateChildrenCount ~= v17 then
                if v21 and v21 ~= p14.children[v19] then
                    v_u_13(v21)
                end
                return
            end
            if v21 == nil then
                v18[v19] = true
            else
                p14.children[v19] = v21
            end
        end
        for v22 in pairs(v18) do
            p14.children[v22] = nil
        end
        for v23, v24 in v_u_3.iterateElements(p16) do
            local v25
            if v23 == v_u_3.UseParentKey then
                v25 = p14.hostKey
            else
                v25 = v23
            end
            if p14.children[v23] == nil then
                local v26 = v_u_11(v24, p15, v25, p14.context, p14.legacyContext)
                if p14.updateChildrenCount ~= v17 then
                    if v26 then
                        v_u_13(v26)
                    end
                    return
                end
                if v26 ~= nil then
                    v26.depth = p14.depth + 1
                    v26.parent = p14
                    p14.children[v23] = v26
                end
            end
        end
    end
    local function v_u_31(p28, p29, p30)
        if v_u_1.of(p30) == v_u_1.Element or (p30 == nil or typeof(p30) == "boolean") then
            v_u_27(p28, p29, p30)
        else
            error(("%s\n%s"):format("Component returned invalid children:", p28.currentElement.source or "<enable element tracebacks>"), 0)
        end
    end
    v_u_13 = function(p32)
        if v_u_7.internalTypeChecks then
            v_u_6(v_u_1.of(p32) == v_u_1.VirtualNode, "Expected arg #1 to be of type VirtualNode")
        end
        p32.wasUnmounted = true
        local v33 = v_u_2.of(p32.currentElement)
        if v33 == v_u_2.Host then
            p_u_9.unmountHostNode(v_u_10, p32)
            return
        elseif v33 == v_u_2.Function then
            for _, v34 in pairs(p32.children) do
                v_u_13(v34)
            end
            return
        elseif v33 == v_u_2.Stateful then
            p32.instance:__unmount()
            return
        elseif v33 == v_u_2.Portal then
            for _, v35 in pairs(p32.children) do
                v_u_13(v35)
            end
            return
        elseif v33 == v_u_2.Fragment then
            for _, v36 in pairs(p32.children) do
                v_u_13(v36)
            end
        else
            error(("Unknown ElementKind %q"):format((tostring(v33))), 2)
        end
    end
    v_u_12 = function(p37, p38, p39)
        if v_u_7.internalTypeChecks then
            v_u_6(v_u_1.of(p37) == v_u_1.VirtualNode, "Expected arg #1 to be of type VirtualNode")
        end
        if v_u_7.typeChecks then
            local v40 = (v_u_1.of(p38) == v_u_1.Element or typeof(p38) == "boolean") and true or p38 == nil
            assert(v40, "Expected arg #2 to be of type Element, boolean, or nil")
        end
        if p37.currentElement == p38 and p39 == nil then
            return p37
        end
        if typeof(p38) == "boolean" or p38 == nil then
            v_u_13(p37)
            return nil
        end
        if p37.currentElement.component == p38.component then
            local v41 = v_u_2.of(p38)
            local v42 = true
            if v41 == v_u_2.Host then
                p37 = p_u_9.updateHostNode(v_u_10, p37, p38)
            elseif v41 == v_u_2.Function then
                local v43 = p38.component(p38.props)
                v_u_31(p37, p37.hostParent, v43)
            elseif v41 == v_u_2.Stateful then
                v42 = p37.instance:__update(p38, p39)
            elseif v41 == v_u_2.Portal then
                local v44 = p37.currentElement.props.target
                local v45 = p38.props.target
                local v46 = p_u_9.isHostObject(v45)
                assert(v46, "Expected target to be host object")
                if v45 == v44 then
                    v_u_27(p37, v45, p38.props[v_u_4])
                else
                    local v47 = p37.hostParent
                    local v48 = p37.hostKey
                    local v49 = p37.depth
                    local v50 = p37.parent
                    local v51 = p37.originalContext or p37.context
                    local v52 = p37.parentLegacyContext
                    if not p37.wasUnmounted then
                        v_u_13(p37)
                    end
                    p37 = v_u_11(p38, v47, v48, v51, v52)
                    if p37 ~= nil then
                        p37.depth = v49
                        p37.parent = v50
                    end
                end
            elseif v41 == v_u_2.Fragment then
                v_u_27(p37, p37.hostParent, p38.elements)
            else
                error(("Unknown ElementKind %q"):format((tostring(v41))), 2)
            end
            if not v42 then
                return p37
            end
            p37.currentElement = p38
            return p37
        end
        local v53 = p37.hostParent
        local v54 = p37.hostKey
        local v55 = p37.depth
        local v56 = p37.parent
        local v57 = p37.originalContext or p37.context
        local v58 = p37.parentLegacyContext
        if not p37.wasUnmounted then
            v_u_13(p37)
        end
        local v59 = v_u_11(p38, v53, v54, v57, v58)
        if v59 ~= nil then
            v59.depth = v55
            v59.parent = v56
        end
        return v59
    end
    local function v_u_67(p60, p61, p62, p63, p64)
        if v_u_7.internalTypeChecks then
            v_u_6(p_u_9.isHostObject(p61) or p61 == nil, "Expected arg #2 to be a host object")
            v_u_6(typeof(p63) == "table" and true or p63 == nil, "Expected arg #4 to be of type table or nil")
            v_u_6(typeof(p64) == "table" and true or p64 == nil, "Expected arg #5 to be of type table or nil")
        end
        if v_u_7.typeChecks then
            local v65 = p62 ~= nil
            assert(v65, "Expected arg #3 to be non-nil")
            local v66 = v_u_1.of(p60) == v_u_1.Element and true or typeof(p60) == "boolean"
            assert(v66, "Expected arg #1 to be of type Element or boolean")
        end
        return {
            [v_u_1] = v_u_1.VirtualNode,
            ["currentElement"] = p60,
            ["depth"] = 1,
            ["parent"] = nil,
            ["children"] = {},
            ["hostParent"] = p61,
            ["hostKey"] = p62,
            ["updateChildrenCount"] = 0,
            ["wasUnmounted"] = false,
            ["legacyContext"] = p64,
            ["parentLegacyContext"] = p64,
            ["context"] = p63 or {},
            ["originalContext"] = nil
        }
    end
    v_u_11 = function(p68, p69, p70, p71, p72)
        if v_u_7.internalTypeChecks then
            v_u_6(p_u_9.isHostObject(p69) or p69 == nil, "Expected arg #2 to be a host object")
            v_u_6(typeof(p72) == "table" and true or p72 == nil, "Expected arg #5 to be of type table or nil")
        end
        if v_u_7.typeChecks then
            local v73 = p70 ~= nil
            assert(v73, "Expected arg #3 to be non-nil")
            local v74 = v_u_1.of(p68) == v_u_1.Element and true or typeof(p68) == "boolean"
            assert(v74, "Expected arg #1 to be of type Element or boolean")
        end
        if typeof(p68) == "boolean" then
            return nil
        end
        local v75 = v_u_2.of(p68)
        local v76 = v_u_67(p68, p69, p70, p71, p72)
        if v75 == v_u_2.Host then
            p_u_9.mountHostNode(v_u_10, v76)
            return v76
        end
        if v75 == v_u_2.Function then
            local v77 = v76.currentElement
            local v78 = v77.component(v77.props)
            v_u_31(v76, v76.hostParent, v78)
            return v76
        end
        if v75 == v_u_2.Stateful then
            p68.component:__mount(v_u_10, v76)
            return v76
        end
        if v75 ~= v_u_2.Portal then
            if v75 ~= v_u_2.Fragment then
                error(("Unknown ElementKind %q"):format((tostring(v75))), 2)
                return v76
            end
            local v79 = v76.currentElement.elements
            v_u_27(v76, v76.hostParent, v79)
            return v76
        end
        local v80 = v76.currentElement
        local v81 = v80.props.target
        local v82 = v80.props[v_u_4]
        local v83 = p_u_9.isHostObject(v81)
        assert(v83, "Expected target to be host object")
        v_u_27(v76, v81, v82)
        return v76
    end
    v_u_10 = {
        ["mountVirtualTree"] = function(p84, p85, p86)
            if v_u_7.typeChecks then
                local v87 = v_u_1.of(p84) == v_u_1.Element
                assert(v87, "Expected arg #1 to be of type Element")
                local v88 = p_u_9.isHostObject(p85) or p85 == nil
                assert(v88, "Expected arg #2 to be a host object")
            end
            local v89 = p86 == nil and "RoactTree" or p86
            local v90 = {
                [v_u_1] = v_u_1.VirtualTree,
                [v_u_8] = {
                    ["rootNode"] = nil,
                    ["mounted"] = true
                }
            }
            v90[v_u_8].rootNode = v_u_11(p84, p85, v89)
            return v90
        end,
        ["unmountVirtualTree"] = function(p91)
            local v92 = p91[v_u_8]
            if v_u_7.typeChecks then
                local v93 = v_u_1.of(p91) == v_u_1.VirtualTree
                assert(v93, "Expected arg #1 to be a Roact handle")
                local v94 = v92.mounted
                assert(v94, "Cannot unmounted a Roact tree that has already been unmounted")
            end
            v92.mounted = false
            if v92.rootNode ~= nil then
                v_u_13(v92.rootNode)
            end
        end,
        ["updateVirtualTree"] = function(p95, p96)
            local v97 = p95[v_u_8]
            if v_u_7.typeChecks then
                local v98 = v_u_1.of(p95) == v_u_1.VirtualTree
                assert(v98, "Expected arg #1 to be a Roact handle")
                local v99 = v_u_1.of(p96) == v_u_1.Element
                assert(v99, "Expected arg #2 to be a Roact Element")
            end
            v97.rootNode = v_u_12(v97.rootNode, p96)
            return p95
        end,
        ["createVirtualNode"] = v_u_67,
        ["mountVirtualNode"] = v_u_11,
        ["unmountVirtualNode"] = v_u_13,
        ["updateVirtualNode"] = v_u_12,
        ["updateVirtualNodeWithChildren"] = function(p100, p101, p102)
            v_u_27(p100, p101, p102)
        end,
        ["updateVirtualNodeWithRenderResult"] = v_u_31
    }
    return v_u_10
end