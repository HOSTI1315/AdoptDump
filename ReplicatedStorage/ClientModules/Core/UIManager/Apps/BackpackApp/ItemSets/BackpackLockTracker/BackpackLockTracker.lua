--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BackpackApp.ItemSets.BackpackLockTracker (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("BackpackItemSet")
local v_u_3 = v1("InventoryDB")
local v4 = {}
local v_u_5 = {}
local v_u_8 = v2.new("backpack_locks", true, function(p6)
    local v7 = not p6.temporary
    if v7 then
        v7 = p6.donatable
    end
    return v7, "You can\'t lock this item!"
end)
function v4.is_lockable(p9)
    local v10 = v_u_3[p9.category]
    if v10 then
        v10 = v_u_3[p9.category][p9.kind]
    end
    if not v10 then
        return false
    end
    local v11 = not v10.temporary
    if v11 then
        v11 = v10.donatable
    end
    return v11
end
function v4.is_locked(p12)
    return v_u_8:is_member(p12)
end
function v4.set_locked(p13, p14)
    v_u_8:set_member(p13, p14)
end
function v4.cache_locked()
    v_u_5 = v_u_8:get_set_copy()
end
function v4.get_cached_locked()
    return v_u_5
end
return v4