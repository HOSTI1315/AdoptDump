--// ReplicatedStorage.SharedModules.AdoptMeEnums (ModuleScript)

local _ = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_4 = {
    ["__index"] = function(_, p1)
        error("EnumItem " .. tostring(p1) .. " does not exist.")
    end,
    ["__newindex"] = function(_, p2, p3)
        error(string.format("Not allowed to set values on pseudo-enums (tried to set %s to %s)", tostring(p2), (tostring(p3))))
    end
}
local function v_u_15(p5, p6)
    local v7 = {}
    for v8, v9 in pairs(p6) do
        if v8:sub(1, 1) ~= "@" then
            local v10
            if typeof(v9) == "number" and v9 % 1 == 0 then
                v10 = math.abs(v9) < 9007199254740992
            else
                v10 = false
            end
            local v11 = string.format
            local v12 = tostring(p5)
            local v13 = tostring(v8)
            assert(v10, v11("Invalid value for enum item %s.%s", v12, v13))
            v7[v8] = string.format("__Enum_%s_%d", tostring(p5), v9)
        end
    end
    local v14 = v_u_4
    setmetatable(v7, v14)
    return v7
end
local function v_u_25(p16)
    local v17 = {}
    for _, v18 in ipairs(p16:GetChildren()) do
        if v18:IsA("ModuleScript") then
            local v19 = require(v18)
            local v20 = v19["@name"] or v18.Name
            v17[v18.Name] = v_u_15(v20, v19)
        elseif v18:IsA("Folder") then
            v17[v18.Name] = v_u_25(v18)
        end
    end
    local v21 = {}
    for v22, v23 in pairs(v17) do
        v21[v22] = v23
    end
    local v24 = v_u_4
    setmetatable(v21, v24)
    return v21
end
local v26 = v_u_25(script)
rawset(v26, "init", function() end)
return v26