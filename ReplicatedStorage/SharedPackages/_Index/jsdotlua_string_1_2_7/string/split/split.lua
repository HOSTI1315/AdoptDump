--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.split (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("findOr"))
local v_u_2 = require(script.Parent:WaitForChild("slice"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("number")).MAX_SAFE_INTEGER
return function(p4, p5, p6)
    if p5 == nil then
        return { p4 }
    end
    if p6 == 0 then
        return {}
    end
    if p6 == nil or p6 < 0 then
        p6 = v_u_3
    end
    if typeof(p5) == "string" then
        if p5 == "" then
            local v7 = {}
            for v8 in p4:gmatch(".") do
                table.insert(v7, v8)
            end
            return v7
        end
        p5 = { p5 }
    end
    local v9, v10 = utf8.len(p4)
    local v11 = v9 ~= nil
    local v12 = tostring(v10)
    assert(v11, ("string `%s` has an invalid byte at position %s"):format(p4, v12))
    local v13 = 1
    local v14 = {}
    local v15 = nil
    while true do
        local v16 = v_u_1(p4, p5, v13)
        if v16 == nil then
            local v17 = v_u_2
            table.insert(v14, v17(p4, v13, nil))
        else
            local v18 = v_u_2
            local v19 = v16.index
            table.insert(v14, v18(p4, v13, v19))
            local v20 = utf8.len(v16.match)
            v13 = v16.index + v20
        end
        if v16 ~= nil then
            v15 = v16
        end
        if v16 == nil or (v9 < v13 or p6 <= #v14) then
            if v15 ~= nil then
                local v21, v22 = utf8.len(v15.match)
                local v23 = v21 ~= nil
                local v24 = v15.match
                local v25 = tostring(v22)
                assert(v23, ("string `%s` has an invalid byte at position %s"):format(v24, v25))
                if v15.index + v21 == v9 + 1 then
                    table.insert(v14, "")
                end
            end
            return v14
        end
    end
end