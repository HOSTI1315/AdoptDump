--// ReplicatedStorage.new.modules.Explorer (ModuleScript)

local v_u_1 = require(script.Parent.LegacyLoad)("package:Promise")
local v_u_2 = {
    ["Player"] = {
        ["Character"] = true
    }
}
local v_u_58 = {
    ["find_first_child_with_predicate"] = function(p_u_3, p_u_4, p_u_5)
        return v_u_1.new(function(p6, p7)
            local v8 = p_u_3:GetChildren()
            local v9 = #v8
            local v10 = 1
            while v9 > 0 do
                local v11 = v8[v10]
                v8[v10] = nil
                v10 = v10 + 1
                v9 = v9 - 1
                if p_u_5(v11) then
                    return p6(v11)
                end
                if p_u_4 then
                    for _, v12 in v11:GetChildren() do
                        v8[v10 + v9] = v12
                        v9 = v9 + 1
                    end
                end
            end
            if p_u_4 then
                p7(("Unable to find descendant of [%s] that matches predicate"):format(p_u_3:GetFullName()))
            else
                p7(("Unable to find child of [%s] that matches predicate"):format(p_u_3:GetFullName()))
            end
        end)
    end,
    ["wait_for_child_with_predicate"] = function(p_u_13, p14, p_u_15)
        local v_u_16 = {}
        local v_u_31 = v_u_1.new(function(p_u_17)
            local function v_u_25(p_u_18)
                local v19 = v_u_16
                local v20 = p_u_18.Changed
                local function v21()
                    if p_u_15(p_u_18) then
                        p_u_17(p_u_18)
                    end
                end
                table.insert(v19, v20:Connect(v21))
                local v22 = v_u_16
                local v23 = p_u_18.AttributeChanged
                local function v24()
                    if p_u_15(p_u_18) then
                        p_u_17(p_u_18)
                    end
                end
                table.insert(v22, v23:Connect(v24))
            end
            for _, v26 in p_u_13:GetChildren() do
                if p_u_15(v26) then
                    return p_u_17(v26)
                end
                v_u_25(v26)
            end
            local v27 = v_u_16
            local v28 = p_u_13.ChildAdded
            local function v30(p29)
                if p_u_15(p29) then
                    return p_u_17(p29)
                end
                v_u_25(p29)
            end
            table.insert(v27, v28:Connect(v30))
        end)
        v_u_1.try(function()
            v_u_31:await()
            for _, v32 in v_u_16 do
                v32:Disconnect()
            end
        end)
        if p14 then
            return v_u_1.race({ v_u_31, v_u_1.delay(p14):andThenReturn(nil) }):andThen(function(p33)
                if p33 == nil then
                    return v_u_1.reject(("Unable to find child of [%s] that matches predicate before timeout"):format(p_u_13:GetFullName()))
                else
                    return p33
                end
            end)
        end
        v_u_1.race({ v_u_31, v_u_1.delay(5):andThenReturn(nil) }):andThen(function(p34)
            if p34 == nil then
                warn(("Infinite yield possible on [%s] waiting for predicate"):format(p_u_13:GetFullName()))
            end
        end)
        return v_u_31
    end,
    ["find_first_child"] = function(p35, p_u_36, p37)
        return v_u_58.find_first_child_with_predicate(p35, p37, function(p38)
            return p38.Name == p_u_36
        end)
    end,
    ["wait_for_child"] = function(p39, p_u_40, p41)
        return v_u_58.wait_for_child_with_predicate(p39, p41, function(p42)
            return p42.Name == p_u_40
        end)
    end,
    ["find_path"] = function(p43, p44)
        local v45 = v_u_1.resolve(p43)
        for _, v_u_46 in p44 do
            v45 = v45:andThen(function(p47)
                if (v_u_2[p47.ClassName] or {})[v_u_46] then
                    return v_u_1.resolve(p47[v_u_46])
                else
                    return v_u_58.find_first_child(p47, v_u_46, false)
                end
            end)
        end
        return v45
    end,
    ["wait_for_path"] = function(p_u_48, p49, p50)
        local v51 = v_u_1.resolve(p_u_48)
        for _, v_u_52 in p49 do
            v51 = v51:andThen(function(p53)
                return v_u_58.wait_for_child(p53, v_u_52, nil)
            end)
        end
        if p50 then
            return v_u_1.race({ v51, v_u_1.delay(p50):andThenReturn(nil) }):andThen(function(p54)
                if p54 == nil then
                    return v_u_1.reject(("Unable to find path from [%s] before timeout"):format(p_u_48:GetFullName()))
                else
                    return p54
                end
            end)
        end
        v_u_1.race({ v51, v_u_1.delay(5):andThenReturn(nil) }):andThen(function(p55)
            if p55 == nil then
                warn(("Infinite yield possible on [%s] waiting for path"):format(p_u_48:GetFullName()))
            end
        end)
        return v51
    end,
    ["get"] = function(p56, p57)
        return v_u_58.find_path(p56, p57):catch(function()
            return nil
        end):expect()
    end
}
return v_u_58