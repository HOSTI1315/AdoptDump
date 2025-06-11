--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileCategories.WishlistPlayerProfileWidget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("SharedConstants")
local v5 = v2("WishlistPlayerProfileWidget", v1("CollectionPlayerProfileWidget"))
v5.DEFAULT_TITLE = "Want"
function v5.pick_new_item(p6, p7)
    local v8, v9 = p6.UIManager.apps.JournalApp:pick_entry({
        ["pet_property_picker_options"] = {
            ["header_text"] = "Add to Wishlist",
            ["confirm_text"] = "Add"
        }
    })
    if v8 then
        local v10 = v9 or {}
        for v11, v12 in v10 do
            if v12 ~= true or not v_u_4.player_profiles.valid_pet_properties[v11] then
                v10[v11] = nil
            end
        end
        local v13 = {
            ["kind"] = v8.kind,
            ["category"] = v8.category,
            ["properties"] = v10
        }
        local v14 = p6.save_data.items
        if #v14 < v_u_4.player_profiles.max_collection_items then
            if p7 then
                table.remove(v14, p7)
                table.insert(v14, p7, v13)
            else
                table.insert(v14, v13)
                p7 = #v14
            end
            p6:render()
            if v_u_3.is_using_gamepad() then
                local v15 = p6.item_instances[p7]
                p6.player_profile_app:set_gamepad_selection(v15 or p6.left_button.instance)
            end
        end
        return v13
    end
end
return v5