--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxComponent (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill")).Object
local v2 = require(script.Parent:WaitForChild("roblox"):WaitForChild("RobloxComponentProps"))
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
return {
    ["setInitialProperties"] = v2.setInitialProperties,
    ["diffProperties"] = function(_, _, p3, p4, _)
        local v5 = nil
        for v6, _ in p3 do
            if p4[v6] == nil then
                v5 = v5 or table.create(2)
                table.insert(v5, v6)
                local v7 = v_u_1.None
                table.insert(v5, v7)
            end
        end
        for v8, v9 in p4 do
            local v10
            if p3 == nil then
                v10 = nil
            else
                v10 = p3[v8]
            end
            if v9 ~= v10 then
                v5 = v5 or table.create(2)
                table.insert(v5, v8)
                table.insert(v5, v9)
            end
        end
        return v5
    end,
    ["updateProperties"] = v2.updateProperties,
    ["cleanupHostComponent"] = v2.cleanupHostComponent
}