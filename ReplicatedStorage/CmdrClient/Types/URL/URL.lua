--// ReplicatedStorage.CmdrClient.Types.URL (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Shared.Util)
local v_u_4 = {
    ["Validate"] = function(p2)
        if p2:match("^https?://.+$") then
            return true
        else
            return false, "URLs must begin with http:// or https://"
        end
    end,
    ["Parse"] = function(p3)
        return p3
    end
}
return function(p5)
    p5:RegisterType("url", v_u_4)
    p5:RegisterType("urls", v_u_1.MakeListableType(v_u_4))
end