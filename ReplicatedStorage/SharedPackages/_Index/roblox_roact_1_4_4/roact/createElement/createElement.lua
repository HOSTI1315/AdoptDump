--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createElement (ModuleScript)

local v_u_1 = require(script.Parent.PropMarkers.Children)
local v_u_2 = require(script.Parent.ElementKind)
local v_u_3 = require(script.Parent.Logging)
local v_u_4 = require(script.Parent.Type)
local v_u_5 = require(script.Parent.GlobalConfig).get()
return function(p6, p7, p8)
    if v_u_5.typeChecks then
        local v9 = p6 ~= nil
        assert(v9, "`component` is required")
        local v10 = typeof(p7) == "table" and true or p7 == nil
        assert(v10, "`props` must be a table or nil")
        local v11 = typeof(p8) == "table" and true or p8 == nil
        assert(v11, "`children` must be a table or nil")
    end
    local v12 = p7 == nil and {} or p7
    if p8 ~= nil then
        if v12[v_u_1] ~= nil then
            v_u_3.warnOnce("The prop `Roact.Children` was defined but was overridden by the third parameter to createElement!\nThis can happen when a component passes props through to a child element but also uses the `children` argument:\n\n\tRoact.createElement(\"Frame\", passedProps, {\n\t\tchild = ...\n\t})\n\nInstead, consider using a utility function to merge tables of children together:\n\n\tlocal children = mergeTables(passedProps[Roact.Children], {\n\t\tchild = ...\n\t})\n\n\tlocal fullProps = mergeTables(passedProps, {\n\t\t[Roact.Children] = children\n\t})\n\n\tRoact.createElement(\"Frame\", fullProps)")
        end
        v12[v_u_1] = p8
    end
    local v13 = v_u_2.fromComponent(p6)
    local v14 = {
        [v_u_4] = v_u_4.Element,
        [v_u_2] = v13,
        ["component"] = p6,
        ["props"] = v12
    }
    if v_u_5.elementTracing then
        v14.source = debug.traceback("", 2):sub(2)
    end
    return v14
end