--// ReplicatedStorage.SharedPackages._Index.upliftgames_dependencies@0.2.0.dependencies (ModuleScript)

local v_u_1 = {}
local function v_u_7(p2)
    local v3 = p2:split("/")
    local v4 = game
    for _, v5 in pairs(v3) do
        local v6 = v4:FindFirstChild(v5)
        if v6 then
            v4 = v6
        else
            v4 = Instance.new("Folder", v4)
            v4.Name = v5
        end
    end
    return v4
end
function v_u_1.add(p8, p9, p10, p11, p12)
    local v13 = p10 .. "/_package/" .. p11 .. "/" .. p12
    local v14 = v_u_7(v13)
    local v15 = v14:FindFirstChild(p8)
    if v15 then
        if not v15:IsA(p9) then
            error(("%s at %s is a %s. A %s was expected."):format(p8, v13, v15.ClassName, p9))
        end
        return v15
    end
    local v16 = Instance.new(p9, v14)
    v16.Name = p8
    return v16
end
function v_u_1.require(p17, p18, p19, p20, p21)
    local v22 = p19 .. "/_package/" .. p20 .. "/" .. p21
    local v23 = v_u_7(v22):FindFirstChild(p17)
    if v23 then
        if not v23:IsA(p18) then
            error(("%s at %s is a %s. A %s was expected."):format(p17, v22, v23.ClassName, p18))
        end
        return v23
    else
        error(("%s at %s is required but doesn\'t exist."):format(p17, v22))
        return v23
    end
end
return function(p_u_24, p_u_25)
    return {
        ["add"] = function(p26, p27, p28)
            return v_u_1.add(p26, p27, p28, p_u_24, p_u_25)
        end,
        ["require"] = function(p29, p30, p31)
            return v_u_1.require(p29, p30, p31, p_u_24, p_u_25)
        end
    }
end