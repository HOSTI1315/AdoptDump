--// ReplicatedStorage.SharedPackages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.encodeURIComponent (ModuleScript)

local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(script.Parent.Parent:WaitForChild("string")).charCodeAt
local v_u_3 = require(script.Parent:WaitForChild("Error"))
return function(p4)
    local v5 = utf8.len(p4)
    if v5 == 0 or v5 == nil then
        return ""
    end
    local v6 = v_u_2(p4, 1)
    if v5 == 1 then
        if v6 == 55296 then
            error(v_u_3.new("URI malformed"))
        end
        if v6 == 57343 then
            error(v_u_3.new("URI malformed"))
        end
    end
    if v6 >= 56320 and v6 < 57343 then
        error(v_u_3.new("URI malformed"))
    end
    return v_u_1:UrlEncode(p4):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "\'"):gsub("%%28", "("):gsub("%%29", ")")
end