--// ReplicatedStorage.new.modules.Ailments.ClientActions.NavigateOrBuyFurnitureAction (ModuleScript)

local v_u_1 = require(script.Parent.ActionSequence)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(script.Parent.BuyFurniturePromptAction)
local v_u_4 = require(script.Parent.FurnitureNavigationAction)
local v5 = {}
v5.__index = v5
setmetatable(v5, v2)
function v5.new(p6)
    return v_u_1.new({ v_u_4.new({
            ["ailment_to_boost"] = p6.ailment_to_boost
        }), v_u_3.new({
            ["ailment_to_boost"] = p6.ailment_to_boost,
            ["kind"] = p6.kind
        }) })
end
return v5