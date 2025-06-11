--// ReplicatedStorage.new.modules.Ailments.ClientActions.UseItemAction (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentAction)
local v_u_2 = require(script.Parent.Parent.Helpers.PreferenceItemHelper)
local v_u_3 = require(script.Parent.Parent.Helpers.UseItemHelper)
local v_u_4 = require(script.Parent.Parent.Parent.LegacyLoad)("ClientData")
local v_u_5 = {}
v_u_5.__index = v_u_5
setmetatable(v_u_5, v1)
function v_u_5.new(p6)
    local v7 = v_u_5
    return setmetatable({
        ["options"] = p6
    }, v7)
end
function v_u_5.start(p8, p9)
    local v10 = nil
    for _, v11 in (v_u_4.get("inventory") or {})[p8.options.category] or {} do
        if p8.options.unique then
            if v11.unique == p8.options.unique then
                v10 = v11
                break
            end
        elseif p8.options.match_preference then
            if v_u_2.is_correct_item(p8.options.kind, v11.kind) then
                v10 = v11
                break
            end
        elseif v11.kind == p8.options.kind then
            v10 = v11
            break
        end
    end
    if not v10 then
        return false
    end
    v_u_3.use_item(p9, v10)
    return true
end
return v_u_5