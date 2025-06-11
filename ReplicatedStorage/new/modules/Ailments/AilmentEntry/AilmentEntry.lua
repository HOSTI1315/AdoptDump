--// ReplicatedStorage.new.modules.Ailments.AilmentEntry (ModuleScript)

require(script.Parent.AilmentAction)
local v1 = require(script.Parent.AilmentCategory)
require(script.Parent.AilmentComponent)
require(script.Parent.AilmentTypes)
local v2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v3 = require(game.ReplicatedStorage.SharedPackages.t)
local v4 = v3.strictInterface
local v5 = {
    ["kind"] = v3.string
}
local v6 = v3.literal
local v7 = v2.Dictionary.keys
v5.category = v6(table.unpack(v7(v1)))
v5.reward = v3.every(v3.integer, v3.numberMin(0))
v5.hide_reward = v3.optional(v3.boolean)
v5.not_for_babies = v3.optional(v3.boolean)
v5.not_for_eggs = v3.optional(v3.boolean)
v5.not_for_dolls = v3.optional(v3.boolean)
v5.non_unique = v3.optional(v3.boolean)
v5.can_distribute = v3.optional(v3.callback)
v5.create_description = v3.callback
v5.create_action = v3.callback
v5.create_server_components = v3.callback
local v_u_8 = v4(v5)
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.new(p10)
    local v11 = v_u_8
    assert(v11(p10))
    local v12 = v_u_9
    return setmetatable(p10, v12)
end
return v_u_9