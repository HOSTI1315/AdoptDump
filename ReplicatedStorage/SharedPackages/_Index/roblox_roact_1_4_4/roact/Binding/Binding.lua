--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Binding (ModuleScript)

local v_u_1 = require(script.Parent.createSignal)
local v2 = require(script.Parent.Symbol)
local v_u_3 = require(script.Parent.Type)
local v_u_4 = require(script.Parent.GlobalConfig).get()
local v_u_5 = v2.named("BindingImpl")
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
    return p16[v_u_5].getValue()
end
function v_u_6.create(p17)
    local v_u_20 = {
        ["value"] = p17,
        ["changeSignal"] = v_u_1(),
        ["subscribe"] = function(p18)
            return v_u_20.changeSignal:subscribe(p18)
        end,
        ["update"] = function(p19)
            v_u_20.value = p19
            v_u_20.changeSignal:fire(p19)
        end,
        ["getValue"] = function()
            return v_u_20.value
        end
    }
    local v21 = {
        [v_u_3] = v_u_3.Binding,
        [v_u_5] = v_u_20
    }
    local v22 = v_u_11
    return setmetatable(v21, v22), v_u_20.update
end
function v_u_6.map(p_u_23, p_u_24)
    if v_u_4.typeChecks then
        local v25 = v_u_3.of(p_u_23) == v_u_3.Binding
        assert(v25, "Expected arg #1 to be a binding")
        local v26 = typeof(p_u_24) == "function"
        assert(v26, "Expected arg #1 to be a function")
    end
    local v29 = {
        ["subscribe"] = function(p_u_27)
            return v_u_6.subscribe(p_u_23, function(p28)
                p_u_27(p_u_24(p28))
            end)
        end,
        ["update"] = function(_)
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
        end,
        ["getValue"] = function()
            return p_u_24(p_u_23:getValue())
        end
    }
    local v30 = {
        [v_u_3] = v_u_3.Binding,
        [v_u_5] = v29
    }
    local v31 = v_u_11
    return setmetatable(v30, v31)
end
function v_u_6.join(p_u_32)
    if v_u_4.typeChecks then
        local v33 = typeof(p_u_32) == "table"
        assert(v33, "Expected arg #1 to be of type table")
        for v34, v35 in pairs(p_u_32) do
            if v_u_3.of(v35) ~= v_u_3.Binding then
                local v36 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v34)))
                error(v36, 2)
            end
        end
    end
    local v37 = {}
    local function v_u_41()
        local v38 = {}
        for v39, v40 in pairs(p_u_32) do
            v38[v39] = v40:getValue()
        end
        return v38
    end
    function v37.subscribe(p_u_42)
        local v_u_43 = {}
        for v44, v45 in pairs(p_u_32) do
            v_u_43[v44] = v_u_6.subscribe(v45, function(_)
                p_u_42((v_u_41()))
            end)
        end
        return function()
            if v_u_43 ~= nil then
                for _, v46 in pairs(v_u_43) do
                    v46()
                end
                v_u_43 = nil
            end
        end
    end
    function v37.update(_)
        error("Bindings created by joinBindings(...) cannot be updated directly", 2)
    end
    function v37.getValue()
        return v_u_41()
    end
    local v47 = {
        [v_u_3] = v_u_3.Binding,
        [v_u_5] = v37
    }
    local v48 = v_u_11
    return setmetatable(v47, v48)
end
return v_u_6