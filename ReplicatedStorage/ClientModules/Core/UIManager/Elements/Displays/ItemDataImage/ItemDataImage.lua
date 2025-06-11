--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.ItemDataImage (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ItemDB")
local v3 = v1("Class")
local v_u_4 = v1("ItemImage")
local v5 = v3("ItemDataImage", v_u_4)
function v5.start(p6, p7)
    local v8 = p7.item_data
    assert(v8, "No item data was passed to ItemDataImage.")
    local v9 = p7.item_data
    local v10 = v_u_2[v9.category][v9.kind]
    v_u_4.start(p6, {
        ["use_instance"] = p7.use_instance,
        ["size"] = p7.size,
        ["entry"] = v10
    })
    return p6
end
return v5