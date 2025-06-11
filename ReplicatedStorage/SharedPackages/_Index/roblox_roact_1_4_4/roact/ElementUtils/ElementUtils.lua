--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.ElementUtils (ModuleScript)

local v_u_1 = require(script.Parent.Type)
local function v_u_2()
    return nil
end
local v_u_8 = {
    ["UseParentKey"] = require(script.Parent.Symbol).named("UseParentKey"),
    ["iterateElements"] = function(p_u_3)
        if v_u_1.of(p_u_3) == v_u_1.Element then
            local v_u_4 = false
            return function(_, _)
                if v_u_4 then
                    return nil
                end
                v_u_4 = true
                return v_u_8.UseParentKey, p_u_3
            end
        end
        local v5 = typeof(p_u_3)
        if p_u_3 == nil or v5 == "boolean" then
            return v_u_2
        end
        if v5 == "table" then
            return pairs(p_u_3)
        end
        error("Invalid elements")
    end,
    ["getElementByKey"] = function(p6, p7)
        if p6 == nil or typeof(p6) == "boolean" then
            return nil
        elseif v_u_1.of(p6) == v_u_1.Element then
            if p7 == v_u_8.UseParentKey then
                return p6
            else
                return nil
            end
        else
            if typeof(p6) == "table" then
                return p6[p7]
            end
            error("Invalid elements")
            return
        end
    end
}
return v_u_8