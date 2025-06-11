--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BackpackApp.ItemSets.BackpackFavoriteTracker (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("BackpackItemSet")
local v2 = {}
local v_u_3 = {}
local v_u_5 = v1.new("backpack_favorites", true, function(p4)
    return not p4.temporary, "You can\'t set this item as a favorite!"
end)
function v2.is_favorite(p6)
    return v_u_5:is_member(p6)
end
function v2.set_favorite(p7, p8)
    v_u_5:set_member(p7, p8)
end
function v2.cache_favorites()
    v_u_3 = v_u_5:get_set_copy()
end
function v2.get_cached_favorites()
    return v_u_3
end
return v2