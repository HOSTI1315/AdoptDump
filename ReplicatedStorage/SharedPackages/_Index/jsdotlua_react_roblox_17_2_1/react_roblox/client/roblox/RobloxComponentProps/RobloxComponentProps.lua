--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.RobloxComponentProps (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = game:GetService("CollectionService")
local v3 = require(script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_4 = v3.Object
local v_u_5 = v3.util.inspect
local v_u_6 = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).console
local v_u_7 = require(script.Parent.Parent.Parent.Parent:WaitForChild("react"))
local v_u_8 = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_9 = require(script.Parent:WaitForChild("SingleEventManager"))
local v_u_10 = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).Type
local v_u_11 = require(script.Parent:WaitForChild("getDefaultInstanceProperty"))
require(script.Parent.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local v_u_12 = require(script.Parent.Parent.Parent.Parent:WaitForChild("react")).Tag
local v_u_13 = {}
local v_u_14 = {}
local function v_u_15(...)
    return ...
end
local function v_u_21(p16, p17, p18)
    if p18 == nil then
        local v19, _ = pcall(p16.ResetPropertyToDefault, p16, p17)
        if v19 then
            return
        end
        local v20
        v20, p18 = v_u_11(p16.ClassName, p17)
    end
    p16[p17] = p18
end
local function v_u_31(p_u_22, p_u_23, p_u_24)
    local function v30(p25)
        local v26, v27 = xpcall(v_u_21, v_u_15, p_u_22, p_u_23, p25)
        if not v26 then
            local v28 = p_u_24._source or "<enable DEV mode for stack>"
            local v29 = string.format("Error updating binding or ref assigned to key %s of \'%s\' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", p_u_23, p_u_22.Name, p_u_22.ClassName, tostring(p25), v27, v28)
            v_u_6.error(v29)
            error(v29, 0)
        end
    end
    if v_u_14[p_u_22] == nil then
        v_u_14[p_u_22] = {}
    end
    v_u_14[p_u_22][p_u_23] = v_u_7.__subscribeToBinding(p_u_24, v30)
    v30(p_u_24:getValue())
end
local function v_u_41(p32, p33, p34)
    if v_u_1 and (p34 ~= nil and typeof(p34) ~= "string") then
        v_u_6.error("Type provided for ReactRoblox.Tag is invalid - tags should be specified as a single string, with individual tags delimited by spaces. Instead received:\n%s", v_u_5(p34))
    else
        local v35 = {}
        for v36 in string.gmatch(p33 or "", "%S+") do
            v35[v36] = true
        end
        local v37 = {}
        for v38 in string.gmatch(p34 or "", "%S+") do
            v37[v38] = true
        end
        for v39, _ in v35 do
            if not v37[v39] then
                v_u_2:RemoveTag(p32, v39)
            end
        end
        for v40, _ in v37 do
            if not v35[v40] then
                v_u_2:AddTag(p32, v40)
            end
        end
    end
end
local function v_u_54(p42, p43, p44, p45)
    local v46 = v_u_10.of(p43)
    if v46 == v_u_10.HostEvent or v46 == v_u_10.HostChangeEvent then
        local v47 = v_u_13[p42]
        if v47 == nil then
            v47 = v_u_9.new(p42)
            v_u_13[p42] = v47
        end
        local v48 = p43.name
        if v46 == v_u_10.HostChangeEvent then
            v47:connectPropertyChange(v48, p44)
        else
            v47:connectEvent(v48, p44)
        end
    else
        local v49
        if typeof(p44) == "table" then
            v49 = p44["$$typeof"] == v_u_8.REACT_BINDING_TYPE
        else
            v49 = false
        end
        local v50
        if p45 == nil or typeof(p45) ~= "table" then
            v50 = false
        else
            v50 = p45["$$typeof"] == v_u_8.REACT_BINDING_TYPE
        end
        if v50 then
            local v51 = v_u_14[p42]
            if v51 ~= nil then
                v51[p43]()
                v51[p43] = nil
            end
        end
        if v49 then
            v_u_31(p42, p43, p44)
            return
        elseif p43 == v_u_12 then
            v_u_41(p42, p45, p44)
        else
            if p44 == nil then
                local v52, _ = pcall(p42.ResetPropertyToDefault, p42, p43)
                if v52 then
                    return
                end
                local v53
                v53, p44 = v_u_11(p42.ClassName, p43)
            end
            p42[p43] = p44
        end
    end
end
local function v_u_59(p55, p56)
    for v57, v58 in p56 do
        if v57 ~= "ref" and v57 ~= "children" then
            v_u_54(p55, v57, v58)
        end
    end
end
local function v_u_66(p60, p61, p62)
    for v63 = 1, #p61, 2 do
        local v64 = p61[v63]
        local v65 = p61[v63 + 1]
        if v65 == v_u_4.None then
            v65 = nil
        end
        if v64 ~= "ref" and v64 ~= "children" then
            v_u_54(p60, v64, v65, p62[v64])
        end
    end
end
return {
    ["setInitialProperties"] = function(p67, _, p68, _)
        local v69, v70 = xpcall(v_u_59, v_u_15, p67, p68)
        if not v69 then
            local v71 = string.format("Error applying initial props to Roblox Instance \'%s\' (%s):\n  %s\n", p67.Name, p67.ClassName, v70)
            v_u_6.error(v71)
            error(v71, 0)
        end
        if v_u_13[p67] ~= nil then
            v_u_13[p67]:resume()
        end
    end,
    ["updateProperties"] = function(p72, p73, p74)
        if v_u_13[p72] ~= nil then
            v_u_13[p72]:suspend()
        end
        local v75, v76 = xpcall(v_u_66, v_u_15, p72, p73, p74)
        if not v75 then
            local v77 = string.format("Error updating props on Roblox Instance \'%s\' (%s):\n  %s\n", p72.Name, p72.ClassName, v76)
            v_u_6.error(v77)
            error(v77, 0)
        end
        if v_u_13[p72] ~= nil then
            v_u_13[p72]:resume()
        end
    end,
    ["cleanupHostComponent"] = function(p78)
        if v_u_13[p78] ~= nil then
            v_u_13[p78] = nil
        end
        local v79 = v_u_14[p78]
        if v79 ~= nil then
            for _, v80 in v79 do
                v80()
            end
            v_u_14[p78] = nil
        end
        if typeof(p78) == "Instance" then
            for _, v81 in v_u_2:GetTags(p78) do
                v_u_2:RemoveTag(p78, v81)
            end
            for _, v82 in p78:GetDescendants() do
                if v_u_13[v82] ~= nil then
                    v_u_13[v82] = nil
                end
                local v83 = v_u_14[v82]
                if v83 ~= nil then
                    for _, v84 in v83 do
                        v84()
                    end
                    v_u_14[v82] = nil
                end
                for _, v85 in v_u_2:GetTags(p78) do
                    v_u_2:RemoveTag(p78, v85)
                end
            end
        end
    end,
    ["_instanceToEventManager"] = v_u_13,
    ["_instanceToBindings"] = v_u_14
}