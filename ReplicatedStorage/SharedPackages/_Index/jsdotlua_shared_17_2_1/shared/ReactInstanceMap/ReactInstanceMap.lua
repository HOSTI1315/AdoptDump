--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactInstanceMap (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v1.Error
local v_u_3 = v1.util.inspect
local v_u_4 = require(script.Parent:WaitForChild("getComponentName"))
return {
    ["remove"] = function(p5)
        p5._reactInternals = nil
    end,
    ["get"] = function(p6)
        local v7 = p6._reactInternals
        local v8
        if v7.tag == nil or (v7.subtreeFlags == nil or v7.lanes == nil) then
            v8 = false
        else
            v8 = v7.childLanes ~= nil
        end
        if v8 then
            if v7.alternate ~= nil then
                local v9 = v7.alternate
                local v10
                if v9.tag == nil or (v9.subtreeFlags == nil or v9.lanes == nil) then
                    v10 = false
                else
                    v10 = v9.childLanes ~= nil
                end
                if not v10 then
                    error(v_u_2.new("invalid alternate fiber (" .. (v_u_4(p6) or "UNNAMED alternate") .. ") in " .. (v_u_4(p6) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. v_u_3(v7.alternate)))
                end
            end
            return v7
        else
            error(v_u_2.new("invalid fiber in " .. (v_u_4(p6) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. v_u_3(v7)))
            return v7
        end
    end,
    ["has"] = function(p11)
        return p11._reactInternals ~= nil
    end,
    ["set"] = function(p12, p13)
        local v14 = p13
        while p13 ~= nil do
            local v15
            if p13.tag == nil or (p13.subtreeFlags == nil or p13.lanes == nil) then
                v15 = false
            else
                v15 = p13.childLanes ~= nil
            end
            if v15 then
                if p13.alternate ~= nil then
                    local v16 = p13.alternate
                    local v17
                    if v16.tag == nil or (v16.subtreeFlags == nil or v16.lanes == nil) then
                        v17 = false
                    else
                        v17 = v16.childLanes ~= nil
                    end
                    if not v17 then
                        local v18 = "invalid alternate fiber (" .. (v_u_4(p12) or "UNNAMED alternate") .. ") in " .. (v_u_4(p12) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. v_u_3(p13.alternate) .. "\n"
                        if v14 ~= p13 then
                            v18 = v18 .. " (from original fiber " .. (v_u_4(p12) or "UNNAMED Component") .. ")"
                        end
                        error(v_u_2.new(v18))
                    end
                end
            else
                local v19 = "invalid fiber in " .. (v_u_4(p12) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. v_u_3(p13) .. "\n"
                if v14 ~= p13 then
                    v19 = v19 .. " (from original fiber " .. (v_u_4(p12) or "UNNAMED Component") .. ")"
                end
                error(v_u_2.new(v19))
            end
            p13 = p13.return_
        end
        p12._reactInternals = v14
    end
}