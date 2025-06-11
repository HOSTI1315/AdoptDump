--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactMutableSource (ModuleScript)

require(script.Parent.Parent:WaitForChild("shared"))
return function(p1, p2)
    local v3 = {
        ["_getVersion"] = p2,
        ["_source"] = p1,
        ["_workInProgressVersionPrimary"] = nil,
        ["_workInProgressVersionSecondary"] = nil
    }
    if _G.__DEV__ then
        v3._currentPrimaryRenderer = nil
        v3._currentSecondaryRenderer = nil
    end
    return v3
end