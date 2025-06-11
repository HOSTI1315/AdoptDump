--// ReplicatedStorage.SharedPackages._Index.jsdotlua_number@1.2.7.number.toExponential (ModuleScript)

return function(p1, p2)
    local v3 = typeof(p1) == "string" and (tonumber(p1) or (0 / 0)) or p1
    if typeof(v3) ~= "number" then
        return "nan"
    end
    if p2 ~= nil then
        if typeof(p2) ~= "number" then
            error("TypeError: fractionDigits must be a number between 0 and 100")
        end
        if p2 < 0 or p2 > 100 then
            error("RangeError: fractionDigits must be between 0 and 100")
        end
    end
    local v4 = p2 == nil and "%e" or "%." .. tostring(p2) .. "e"
    return string.format(v4, v3):gsub("%+0", "+"):gsub("%-0", "-"):gsub("0*e", "e")
end