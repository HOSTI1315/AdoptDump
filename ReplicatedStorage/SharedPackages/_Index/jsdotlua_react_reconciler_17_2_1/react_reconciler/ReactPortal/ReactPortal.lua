--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactPortal (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_PORTAL_TYPE
require(script.Parent.Parent:WaitForChild("shared"))
return {
    ["createPortal"] = function(p2, p3, p4, p5)
        if p5 ~= nil then
            p5 = tostring(p5)
        end
        return {
            ["$$typeof"] = v_u_1,
            ["key"] = p5,
            ["children"] = p2,
            ["containerInfo"] = p3,
            ["implementation"] = p4
        }
    end
}