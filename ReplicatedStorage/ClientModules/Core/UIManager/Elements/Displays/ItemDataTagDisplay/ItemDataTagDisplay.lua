--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.ItemDataTagDisplay (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("BucksAgingMultiplierHelper")
local v_u_4 = v1("package:Sift")
local v_u_5 = v1("TagDisplay")
local v6 = v2("ItemDataTagDisplay", v_u_5)
function v6.start(p7, p8)
    local v9 = p8.item_data
    assert(v9, "No item data was passed to ItemDataTagDisplay")
    local v10 = p8.item_data.properties or {}
    local v11 = p8.wearing or false
    if p8.item_data.category == "pets" and ((v_u_3.get_bucks_multiplier_for_pet(game.Players.LocalPlayer, {
        ["item"] = p8.item_data
    }) or 1) ~= 1 or (v_u_3.get_aging_multiplier_for_pet(game.Players.LocalPlayer, {
        ["item"] = p8.item_data
    }) or 1) ~= 1) then
        v10 = v_u_4.Dictionary.merge(v10, {
            ["bonus"] = true
        })
    end
    v_u_5.start(p7, {
        ["kind"] = p8.item_data.kind,
        ["properties"] = v10,
        ["wearing"] = v11,
        ["fixed_property_size"] = p8.fixed_property_size
    })
    return p7
end
return v6