--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactBinding.roblox (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
require(script.Parent.Parent:WaitForChild("shared"))
local v3 = v1.Symbol
local v_u_4 = require(script.Parent:WaitForChild("createSignal.roblox"))
local v_u_5 = v3("BindingImpl")
local v_u_6 = {}
local v_u_11 = {
    ["__index"] = {
        ["getValue"] = function(p7)
            return v_u_6.getValue(p7)
        end,
        ["map"] = function(p8, p9)
            return v_u_6.map(p8, p9)
        end
    },
    ["__tostring"] = function(p10)
        return string.format("RoactBinding(%s)", (tostring(p10:getValue())))
    end
}
function v_u_6.update(p12, p13)
    return p12[v_u_5].update(p13)
end
function v_u_6.subscribe(p14, p15)
    return p14[v_u_5].subscribe(p15)
end
function v_u_6.getValue(p16)
    return p16[v_u_5]:getValue()
end
function v_u_6.create(p17)
    local v18, v_u_19 = v_u_4()
    local v_u_21 = {
        ["value"] = p17,
        ["subscribe"] = v18,
        ["update"] = function(p20)
            v_u_21.value = p20
            v_u_19(p20)
        end,
        ["getValue"] = function()
            return v_u_21.value
        end
    }
    local v22
    if _G.__DEV__ then
        v22 = debug.traceback("Binding created at:", 3)
    else
        v22 = nil
    end
    local v23 = {
        ["$$typeof"] = v_u_2.REACT_BINDING_TYPE,
        [v_u_5] = v_u_21,
        ["_source"] = v22
    }
    local v24 = v_u_11
    return setmetatable(v23, v24), v_u_21.update
end
function v_u_6.map(p_u_25, p_u_26)
    if _G.__DEV__ then
        local v27
        if typeof(p_u_25) == "table" then
            v27 = p_u_25["$$typeof"] == v_u_2.REACT_BINDING_TYPE
        else
            v27 = false
        end
        assert(v27, "Expected `self` to be a binding")
        local v28 = typeof(p_u_26) == "function"
        assert(v28, "Expected arg #1 to be a function")
    end
    local v31 = {
        ["subscribe"] = function(p_u_29)
            return v_u_6.subscribe(p_u_25, function(p30)
                p_u_29(p_u_26(p30))
            end)
        end,
        ["update"] = function(_)
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
        end,
        ["getValue"] = function()
            return p_u_26(p_u_25:getValue())
        end
    }
    local v32
    if _G.__DEV__ then
        v32 = debug.traceback("Mapped binding created at:", 3)
    else
        v32 = nil
    end
    local v33 = {
        ["$$typeof"] = v_u_2.REACT_BINDING_TYPE,
        [v_u_5] = v31,
        ["_source"] = v32
    }
    local v34 = v_u_11
    return setmetatable(v33, v34)
end
function v_u_6.join(p_u_35)
    if _G.__DEV__ then
        local v36 = typeof(p_u_35) == "table"
        assert(v36, "Expected arg #1 to be of type table")
        for v37, v38 in p_u_35 do
            if typeof(v38) ~= "table" or v38["$$typeof"] ~= v_u_2.REACT_BINDING_TYPE then
                local v39 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v37)))
                error(v39, 2)
            end
        end
    end
    local v40 = {}
    local function v_u_44()
        local v41 = {}
        for v42, v43 in pairs(p_u_35) do
            v41[v42] = v43:getValue()
        end
        return v41
    end
    function v40.subscribe(p_u_45)
        local v_u_46 = {}
        for v47, v48 in p_u_35 do
            v_u_46[v47] = v_u_6.subscribe(v48, function(_)
                p_u_45((v_u_44()))
            end)
        end
        return function()
            if v_u_46 ~= nil then
                for _, v49 in v_u_46 do
                    v49()
                end
                v_u_46 = nil
            end
        end
    end
    function v40.update(_)
        error("Bindings created by joinBindings(...) cannot be updated directly", 2)
    end
    function v40.getValue()
        return v_u_44()
    end
    local v50
    if _G.__DEV__ then
        v50 = debug.traceback("Joined binding created at:", 2)
    else
        v50 = nil
    end
    local v51 = {
        ["$$typeof"] = v_u_2.REACT_BINDING_TYPE,
        [v_u_5] = v40,
        ["_source"] = v50
    }
    local v52 = v_u_11
    return setmetatable(v51, v52)
end
return v_u_6