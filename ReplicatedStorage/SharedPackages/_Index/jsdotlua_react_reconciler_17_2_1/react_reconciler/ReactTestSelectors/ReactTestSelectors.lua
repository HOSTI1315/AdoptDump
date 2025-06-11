--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactTestSelectors (ModuleScript)

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_1 = require(script.Parent:WaitForChild("ReactFiberHostConfig")).supportsTestSelectors
local v2 = {}
local v_u_3 = {}
function v2.onCommitRoot()
    if v_u_1 then
        for _, v4 in v_u_3 do
            v4()
        end
    end
end
return v2