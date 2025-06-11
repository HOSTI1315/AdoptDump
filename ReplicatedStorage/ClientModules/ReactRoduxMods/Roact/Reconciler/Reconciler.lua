--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.Reconciler (ModuleScript)

local v_u_1 = require(script.Parent.Core)
local v_u_2 = require(script.Parent.Event)
local v_u_3 = require(script.Parent.Change)
local v_u_4 = require(script.Parent.getDefaultPropertyValue)
local v5 = require(script.Parent.SingleEventManager)
local v_u_6 = require(script.Parent.Symbol).named("isInstanceHandle")
local v_u_94 = {
    ["_singleEventManager"] = v5.new(),
    ["unmount"] = function(p7)
        local v8 = p7._element
        local v9
        if type(v8) == "table" then
            local v10 = v8.component
            v9 = type(v10) == "string"
        else
            v9 = false
        end
        if v9 then
            local v11 = v8.props[v_u_1.Ref]
            if v11 ~= nil then
                if type(v11) == "table" then
                    v11.current = nil
                else
                    v11(nil)
                end
            end
            for _, v12 in pairs(p7._children) do
                v_u_94.unmount(v12)
            end
            v_u_94._singleEventManager:disconnectAll(p7._rbx)
            p7._rbx:Destroy()
        else
            local v13
            if type(v8) == "table" then
                local v14 = v8.component
                v13 = type(v14) == "function"
            else
                v13 = false
            end
            if v13 then
                if p7._child then
                    v_u_94.unmount(p7._child)
                    return
                end
            else
                local v15
                if type(v8) == "table" then
                    local v16 = v8.component
                    v15 = type(v16) == "table"
                else
                    v15 = false
                end
                if v15 then
                    p7._instance:_unmount()
                    return
                end
                local v17
                if type(v8) == "table" then
                    v17 = v8.component == v_u_1.Portal
                else
                    v17 = false
                end
                if v17 then
                    for _, v18 in pairs(p7._children) do
                        v_u_94.unmount(v18)
                    end
                    return
                end
                error(("Cannot unmount invalid Roact instance %q"):format((tostring(v8))))
            end
        end
    end,
    ["mount"] = function(p19, p20, p21)
        return v_u_94._mountInternal(p19, p20, p21)
    end,
    ["_mountInternal"] = function(p22, p23, p24, p25)
        local v26
        if type(p22) == "table" then
            local v27 = p22.component
            v26 = type(v27) == "string"
        else
            v26 = false
        end
        if v26 then
            local v28 = Instance.new(p22.component)
            for v29, v30 in pairs(p22.props) do
                v_u_94._setRbxProp(v28, v29, v30, p22)
            end
            local v31 = {}
            if p22.props[v_u_1.Children] then
                for v32, v33 in pairs(p22.props[v_u_1.Children]) do
                    v31[v32] = v_u_94._mountInternal(v33, v28, v32, p25)
                end
            end
            if p24 then
                v28.Name = p24
            end
            v28.Parent = p23
            local v34 = p22.props[v_u_1.Ref]
            if v34 ~= nil then
                if type(v34) == "table" then
                    v34.current = v28
                else
                    v34(v28)
                end
            end
            return {
                [v_u_6] = true,
                ["_key"] = p24,
                ["_parent"] = p23,
                ["_element"] = p22,
                ["_context"] = p25,
                ["_children"] = v31,
                ["_rbx"] = v28
            }
        end
        local v35
        if type(p22) == "table" then
            local v36 = p22.component
            v35 = type(v36) == "function"
        else
            v35 = false
        end
        if v35 then
            local v37 = {
                [v_u_6] = true,
                ["_key"] = p24,
                ["_parent"] = p23,
                ["_element"] = p22,
                ["_context"] = p25
            }
            local v38 = p22.component(p22.props)
            if v38 then
                v37._child = v_u_94._mountInternal(v38, p23, p24, p25)
            end
            return v37
        end
        local v39
        if type(p22) == "table" then
            local v40 = p22.component
            v39 = type(v40) == "table"
        else
            v39 = false
        end
        if v39 then
            local v41 = {
                [v_u_6] = true,
                ["_key"] = p24,
                ["_parent"] = p23,
                ["_element"] = p22,
                ["_child"] = nil
            }
            local v42 = p22.component._new(p22.props, p25)
            v41._instance = v42
            v42:_mount(v41)
            return v41
        end
        local v43
        if type(p22) == "table" then
            v43 = p22.component == v_u_1.Portal
        else
            v43 = false
        end
        if v43 then
            local v44 = p22.props.target
            if v44 then
                if typeof(v44) ~= "Instance" then
                    error(("Cannot mount Portal with target of type %q."):format((typeof(v44))))
                end
            else
                error(("Cannot mount Portal without specifying a target."):format((tostring(p22))))
            end
            local v45 = {}
            if p22.props[v_u_1.Children] then
                for v46, v47 in pairs(p22.props[v_u_1.Children]) do
                    v45[v46] = v_u_94._mountInternal(v47, v44, v46, p25)
                end
            end
            return {
                [v_u_6] = true,
                ["_key"] = p24,
                ["_parent"] = p23,
                ["_element"] = p22,
                ["_context"] = p25,
                ["_children"] = v45,
                ["_rbx"] = v44
            }
        end
        if typeof(p22) == "boolean" then
            return nil
        end
        error(("Cannot mount invalid Roact element %q"):format((tostring(p22))))
    end,
    ["reconcile"] = function(p48, p49)
        if p48 == nil or not p48[v_u_6] then
            local v50 = ("Bad argument #1 to Reconciler.reconcile, expected component instance handle, found %s"):format((typeof(p48)))
            error(v50, 2)
        end
        return v_u_94._reconcileInternal(p48, p49)
    end,
    ["_reconcileInternal"] = function(p51, p52)
        local v53 = p51._element
        if not p52 then
            v_u_94.unmount(p51)
            return nil
        end
        if v53.component ~= p52.component then
            local v54 = p51._parent
            local v55 = p51._key
            local v56
            if type(v53) == "table" then
                local v57 = v53.component
                v56 = type(v57) == "table"
            else
                v56 = false
            end
            local v58
            if v56 then
                v58 = p51._instance._context
            else
                v58 = p51._context
            end
            v_u_94.unmount(p51)
            return v_u_94._mountInternal(p52, v54, v55, v58)
        end
        local v59
        if type(p52) == "table" then
            local v60 = p52.component
            v59 = type(v60) == "string"
        else
            v59 = false
        end
        if v59 then
            local v61 = v53.props[v_u_1.Ref]
            local v62 = p52.props[v_u_1.Ref]
            if v62 ~= v61 then
                if v61 ~= nil then
                    if type(v61) == "table" then
                        v61.current = nil
                    else
                        v61(nil)
                    end
                end
                local v63 = p51._rbx
                if v62 ~= nil then
                    if type(v62) == "table" then
                        v62.current = v63
                    else
                        v62(v63)
                    end
                end
            end
            v_u_94._reconcilePrimitiveProps(v53, p52, p51._rbx)
            v_u_94._reconcilePrimitiveChildren(p51, p52)
            p51._element = p52
            return p51
        end
        local v64
        if type(p52) == "table" then
            local v65 = p52.component
            v64 = type(v65) == "function"
        else
            v64 = false
        end
        if v64 then
            p51._element = p52
            local v66 = p52.component(p52.props)
            local v67 = nil
            if p51._child then
                v67 = v_u_94._reconcileInternal(p51._child, v66)
            elseif v66 then
                v67 = v_u_94._mountInternal(v66, p51._parent, p51._key, p51._context)
            end
            p51._child = v67
            return p51
        end
        local v68
        if type(p52) == "table" then
            local v69 = p52.component
            v68 = type(v69) == "table"
        else
            v68 = false
        end
        if v68 then
            p51._element = p52
            p51._instance:_update(p52.props)
            return p51
        end
        local v70
        if type(p52) == "table" then
            v70 = p52.component == v_u_1.Portal
        else
            v70 = false
        end
        if v70 then
            if p51._rbx == p52.props.target then
                v_u_94._reconcilePrimitiveChildren(p51, p52)
                p51._element = p52
                return p51
            end
            local v71 = p51._parent
            local v72 = p51._key
            local v73 = p51._context
            v_u_94.unmount(p51)
            return v_u_94._mountInternal(p52, v71, v72, v73)
        end
        error(("Cannot reconcile to match invalid Roact element %q"):format((tostring(p52))))
    end,
    ["_reconcilePrimitiveChildren"] = function(p74, p75)
        local v76 = p75.props[v_u_1.Children]
        for v77, v78 in pairs(p74._children) do
            local v79
            if v76 then
                v79 = v76[v77]
            else
                v79 = v76
            end
            local v80 = v_u_94._reconcileInternal(v78, v79)
            p74._children[v77] = v80
        end
        if v76 then
            for v81, v82 in pairs(v76) do
                if not p74._children[v81] then
                    local v83 = v_u_94._mountInternal(v82, p74._rbx, v81, p74._context)
                    p74._children[v81] = v83
                end
            end
        end
    end,
    ["_reconcilePrimitiveProps"] = function(p84, p85, p86)
        local v87 = {}
        for v88, v89 in pairs(p84.props) do
            v87[v88] = true
            local v90 = p85.props[v88]
            if v90 == nil then
                local v91
                v91, v90 = v_u_4(p86.ClassName, v88)
            end
            if v89 ~= v90 then
                v_u_94._setRbxProp(p86, v88, v90, p85)
            end
        end
        for v92, v93 in pairs(p85.props) do
            if not v87[v92] then
                v87[v92] = true
                if p84.props[v92] ~= v93 then
                    v_u_94._setRbxProp(p86, v92, v93, p85)
                end
            end
        end
    end
}
local function v_u_98(p95, p96, p97)
    p95[p96] = p97
end
function v_u_94._setRbxProp(p99, p100, p101, p102)
    if type(p100) == "string" then
        local v103, v104 = pcall(v_u_98, p99, p100, p101)
        if not v103 then
            local v105 = p102.source or "\n\t<Use Roact.setGlobalConfig with the \'elementTracing\' key to enable detailed tracebacks>\n"
            local v106 = ("Failed to set property %s on primitive instance of class %s\n%s\n%s"):format(p100, p99.ClassName, v104, v105)
            error(v106, 0)
            return
        end
    else
        if type(p100) == "table" then
            if p100.type == v_u_2 then
                v_u_94._singleEventManager:connect(p99, p100.name, p101)
                return
            elseif p100.type == v_u_3 then
                v_u_94._singleEventManager:connectProperty(p99, p100.name, p101)
            else
                local v107 = p102.source or "\n\t<Use Roact.setGlobalConfig with the \'elementTracing\' key to enable detailed tracebacks>\n"
                local v108 = p99.ClassName
                local v109 = p100.type
                local v110 = ("Failed to set special property on primitive instance of class %s\nInvalid special property type %q\n%s"):format(v108, tostring(v109), v107)
                error(v110, 0)
            end
        end
        if type(p100) ~= "userdata" then
            local v111 = p102.source or "\n\t<Use Roact.setGlobalConfig with the \'elementTracing\' key to enable detailed tracebacks>\n"
            local v112 = ("Properties with a key type of %q are not supported\n%s"):format(type(p100), v111)
            error(v112, 0)
        end
    end
end
return v_u_94