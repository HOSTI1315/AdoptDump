--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createContext (ModuleScript)

local v_u_1 = require(script.Parent.Symbol)
local v_u_2 = require(script.Parent.createFragment)
local v_u_3 = require(script.Parent.createSignal)
local v_u_4 = require(script.Parent.PropMarkers.Children)
local v_u_5 = require(script.Parent.Component)
local function v_u_15(p_u_6)
    local v7 = v_u_5:extend("Provider")
    function v7.init(p8, p9)
        p8.contextEntry = {
            ["value"] = p9.value,
            ["onUpdate"] = v_u_3()
        }
        p8:__addContext(p_u_6.key, p8.contextEntry)
    end
    function v7.willUpdate(p10, p11)
        if p11.value ~= p10.props.value then
            p10.contextEntry.value = p11.value
        end
    end
    function v7.didUpdate(p12, p13)
        if p13.value ~= p12.props.value then
            p12.contextEntry.onUpdate:fire(p12.props.value)
        end
    end
    function v7.render(p14)
        return v_u_2(p14.props[v_u_4])
    end
    return v7
end
local function v_u_27(p_u_16)
    local v17 = v_u_5:extend("Consumer")
    function v17.validateProps(p18)
        local v19 = p18.render
        if type(v19) == "function" then
            return true
        else
            return false, "Consumer expects a `render` function"
        end
    end
    function v17.init(p20, _)
        p20.contextEntry = p20:__getContext(p_u_16.key)
    end
    function v17.render(p21)
        local v22
        if p21.contextEntry == nil then
            v22 = p_u_16.defaultValue
        else
            v22 = p21.contextEntry.value
        end
        return p21.props.render(v22)
    end
    function v17.didUpdate(p23)
        if p23.contextEntry ~= nil then
            p23.lastValue = p23.contextEntry.value
        end
    end
    function v17.didMount(p_u_24)
        if p_u_24.contextEntry ~= nil then
            p_u_24.disconnect = p_u_24.contextEntry.onUpdate:subscribe(function(p25)
                if p25 ~= p_u_24.lastValue then
                    p_u_24:setState({})
                end
            end)
        end
    end
    function v17.willUnmount(p26)
        if p26.disconnect ~= nil then
            p26.disconnect()
            p26.disconnect = nil
        end
    end
    return v17
end
local v_u_28 = {}
v_u_28.__index = v_u_28
function v_u_28.new(p29)
    local v30 = {
        ["defaultValue"] = p29,
        ["key"] = v_u_1.named("ContextKey")
    }
    local v31 = v_u_28
    return setmetatable(v30, v31)
end
function v_u_28.__tostring(_)
    return "RoactContext"
end
return function(p32)
    local v33 = v_u_28.new(p32)
    return {
        ["Provider"] = v_u_15(v33),
        ["Consumer"] = v_u_27(v33)
    }
end