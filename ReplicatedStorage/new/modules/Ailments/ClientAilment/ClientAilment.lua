--// ReplicatedStorage.new.modules.Ailments.ClientAilment (ModuleScript)

require(script.Parent.AilmentAction)
local v_u_1 = require(script.Parent.AilmentCategory)
require(script.Parent.AilmentEntry)
require(script.Parent.AilmentTypes)
local v_u_2 = require(script.Parent.AilmentsDB)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6, p7)
    local v8 = v_u_2[p6.kind]
    local v9 = {
        ["source_player"] = p5,
        ["unique"] = p7,
        ["kind"] = p6.kind,
        ["progress"] = p6.progress,
        ["rate"] = p6.rate,
        ["rate_timestamp"] = p6.rate_timestamp,
        ["created_timestamp"] = p6.created_timestamp,
        ["sort_order"] = p6.sort_order,
        ["components"] = p6.components,
        ["description"] = v8.create_description(p6),
        ["action"] = v8.create_action(p6)
    }
    local v10 = v_u_4
    local v11 = setmetatable(v9, v10)
    v11.category = v_u_1[v11.description.override_category or v8.category]
    return v11
end
function v_u_4.get_progress(p12)
    local v13 = (p12.rate <= 0 or p12.rate_timestamp <= 0) and 0 or (workspace:GetServerTimeNow() - p12.rate_timestamp) * p12.rate
    local v14 = p12.progress + v13
    return math.min(v14, 1)
end
function v_u_4.get_rate_finished_timestamp(p15)
    if p15.rate == 0 then
        return nil
    end
    local v16 = (1 - p15:get_progress()) / p15.rate
    return workspace:GetServerTimeNow() + v16
end
function v_u_4.should_update(p17, p18)
    return p17.progress ~= p18.progress and true or (p17.rate ~= p18.rate and true or (p17.rate_timestamp ~= p18.rate_timestamp and true or not v_u_3.Dictionary.equalsDeep(p17.components, p18.components)))
end
function v_u_4.update(p19, p20)
    p19.progress = p20.progress
    p19.rate = p20.rate
    p19.rate_timestamp = p20.rate_timestamp
    p19.created_timestamp = p20.created_timestamp
    p19.sort_order = p20.sort_order
    if not v_u_3.Dictionary.equalsDeep(p19.components, p20.components) then
        p19.components = p20.components
        local v21 = v_u_2[p19.kind]
        p19.description = v21.create_description(p20)
        p19.category = v_u_1[p19.description.override_category or v21.category]
        p19.action:stop()
        p19.action = v21.create_action(p20)
    end
end
function v_u_4.get_description(p22)
    return p22.description
end
function v_u_4.get_component(p23, p24)
    return p23.components[p24]
end
function v_u_4.do_action(p25, p26)
    p25.action:start(p26)
end
function v_u_4.destroy(p27)
    p27.action:stop()
end
return v_u_4