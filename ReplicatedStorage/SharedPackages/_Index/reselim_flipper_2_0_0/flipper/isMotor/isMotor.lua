--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.isMotor (ModuleScript)

return function(p1)
    local v2 = tostring(p1):match("^Motor%((.+)%)$")
    if v2 then
        return true, v2
    else
        return false
    end
end