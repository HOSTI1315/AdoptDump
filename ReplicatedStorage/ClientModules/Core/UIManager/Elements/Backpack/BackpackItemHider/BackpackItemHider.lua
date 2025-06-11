--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Backpack.BackpackItemHider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InventoryDB")
v1("ClientData")
local v3 = v1("Class")("BackpackItemHider", v1("UIBaseElement"))
function v3.start(p4, p5)
    p4.BackpackApp = p5
    p4.tagged_groups = {}
    p4.hidden_items = {}
    return p4
end
function v3.set_item_unique_hidden(p6, p7, p8)
    p6.tagged_groups[p8] = p6.tagged_groups[p8] or {}
    p6.tagged_groups[p8][p7] = true
    p6.hidden_items[p7] = p6.hidden_items[p7] or {}
    p6.hidden_items[p7][p8] = true
    p6.BackpackApp:refresh_rendered_items()
end
function v3.check_if_item_hidden(p9, p10)
    return v_u_2[p10.category][p10.kind].is_hidden_from_backpack and true or (next(p9.hidden_items[p10.unique] or {}) and true or false)
end
function v3.check_if_item_has_hidden_tag(p11, p12, p13)
    return (p11.tagged_groups[p13] or {})[p12] and true or false
end
function v3.remove_item_unique_hidden(p14, p15, p16)
    (p14.tagged_groups[p16] or {})[p15] = nil
    local v17 = p14.hidden_items[p15]
    if v17 then
        v17[p16] = nil
        if not next(v17) then
            p14.hidden_items[p15] = nil
        end
    end
    p14.BackpackApp:refresh_rendered_items()
end
function v3.reset_hidden_item_tag(p18, p19)
    local v20 = p18.tagged_groups[p19] or {}
    for v21, _ in pairs(v20) do
        p18:remove_item_unique_hidden(v21, p19)
    end
end
return v3