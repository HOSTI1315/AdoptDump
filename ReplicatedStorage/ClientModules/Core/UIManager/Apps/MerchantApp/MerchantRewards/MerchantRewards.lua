--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MerchantApp.MerchantRewards (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v3 = v1("Class")("MerchantRewards", (v1("UIBaseElement")))
function v3.set_rewards(p4, p5)
    p4:_clear()
    for v6, v7 in p5 do
        local v8 = p4.reward_template:Clone()
        local v9 = v_u_2[v7.category][v7.kind]
        p4.UIManager.wrap(v8.Item, "ItemImage"):start({
            ["entry"] = v9
        })
        if v7.properties and v9.category == "pets" then
            p4.UIManager.wrap(v8.Item, "TagDisplay"):start({
                ["properties"] = v7.properties
            })
            local v10 = p4.UIManager.apps.MerchantApp.tooltip
            local v11 = {
                ["frame"] = v8.Item,
                ["type"] = "item_data",
                ["item_data"] = {
                    ["category"] = v7.category,
                    ["kind"] = v7.kind,
                    ["properties"] = v7.properties
                }
            }
            v10:hook_on_hover(v11)
        else
            p4.UIManager.apps.MerchantApp.tooltip:hook_on_hover({
                ["frame"] = v8.Item,
                ["type"] = "item_entry",
                ["item_entry"] = v9
            })
        end
        v8.LayoutOrder = v6
        v8.Parent = p4.instance
    end
end
function v3._clear(p12)
    for _, v13 in p12.instance:GetChildren() do
        if v13:IsA("GuiObject") then
            v13:Destroy()
        end
    end
end
function v3.start(p14)
    p14.reward_template = p14.instance.RewardTemplate
    p14.reward_template.Parent = nil
    return p14
end
return v3