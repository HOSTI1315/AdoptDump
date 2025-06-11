--// ReplicatedStorage.new.modules.Utilities.Debug.dump_timetable (ModuleScript)

return function(p1)
    local v2 = p1 or ""
    local v3 = DateTime.now().UnixTimestamp
    local v4 = workspace:GetServerTimeNow()
    local v5 = math.floor(v3)
    local v6 = "" .. ("%*DateTime:         %*\n"):format(v2, (("%* (%*)"):format(v5, (DateTime.fromUnixTimestamp(v5):FormatUniversalTime("lll", "en-us")))))
    local v7 = math.floor(v4)
    return v6 .. ("%*GetServerTimeNow: %*\n"):format(v2, (("%* (%*)"):format(v7, (DateTime.fromUnixTimestamp(v7):FormatUniversalTime("lll", "en-us")))))
end