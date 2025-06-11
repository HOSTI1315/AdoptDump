--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.RecolorUseHelper (ModuleScript)

local v_u_1 = require(script.Parent.NPCHelper)
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v_u_2("InventoryDB")
local v4 = v_u_2("package:t")
local v_u_5 = v_u_2("package:Sift")
local v_u_6 = v4.strictInterface({
    ["unique"] = v4.string,
    ["chosen_rgb"] = v4.optional(v4.Color3)
})
local v_u_7 = v4.strictInterface({
    ["name"] = v4.string,
    ["price"] = v4.integer,
    ["visible_backpack_categories"] = v4.array(v4.string),
    ["no_results_text"] = v4.optional(v4.string)
})
local function v_u_10(p8)
    return v_u_2("UIManager").apps.BackpackApp:pick_item({
        ["visible_backpack_categories"] = p8.visible_backpack_categories,
        ["no_results_text"] = p8.no_results_text,
        ["allow_callback"] = function(p9)
            return v_u_3[p9.category][p9.kind].colorable
        end
    })
end
return {
    ["RECOLOR_NPC"] = function(p_u_11)
        local v12 = v_u_7
        assert(v12(p_u_11))
        local v_u_13 = p_u_11.price
        local v14 = v_u_1.NPC({
            ["name"] = p_u_11.name
        })
        local v15 = v_u_5.Dictionary.join
        local v50 = {
            ["use_permissions"] = "EVERYONE",
            ["dont_automatically_mark_furniture_change_after_use"] = true,
            ["caregiver_assist"] = false,
            ["team_whitelist"] = { "Parents", "Babies" },
            ["use_text"] = {
                ["display_mode"] = "buy_with_icon",
                ["item_row_text"] = "Change Color",
                ["item_cost"] = ("$%i"):format(v_u_13),
                ["icon"] = "rbxassetid://3577407233"
            },
            ["client_get_data_for_server_use"] = function()
                local v16 = v_u_2("DownloadClient")
                local v17 = v_u_2("UIManager")
                if not v_u_2("ShopM").try_prompt_not_enough_money("money", v_u_13) then
                    return
                end
                local v18 = v_u_10(p_u_11)
                if not v18 then
                    return nil
                end
                local v19 = v_u_3[v18.category][v18.kind]
                local v20 = v18.properties.color
                local v_u_21
                if v20 then
                    v_u_21 = Color3.new(unpack(v20))
                else
                    v_u_21 = v19.default_color
                end
                local v22 = {}
                local v23 = nil
                for _, v24 in v16.promise_download_copy("Vehicles", v18.kind):expect():GetDescendants() do
                    if v24:IsA("BasePart") and v24.Name == "Colorable" then
                        v23 = v24
                        break
                    end
                end
                if v_u_21 then
                    v22 = { v23.Color }
                else
                    v_u_21 = v23.Color
                end
                local v26 = v17.apps.ColorPickerApp:pick_color({
                    ["no_advanced"] = true,
                    ["starter_color"] = v_u_21,
                    ["additional_colors"] = v22,
                    ["preview_entry"] = v19,
                    ["confirm_text"] = ("BUY ($%i)"):format(v_u_13),
                    ["validate_confirm"] = function(p25)
                        return p25 ~= v_u_21
                    end
                })
                if not v26 then
                    return nil
                end
                local v27 = {
                    ["unique"] = v18.unique
                }
                if v26 == v23.Color then
                    v26 = nil
                end
                v27.chosen_rgb = v26
                return v27
            end,
            ["server_use"] = function(p28, _, _, p29)
                local v30 = v_u_6
                assert(v30(p29))
                local v31 = v_u_2("DataM")
                local v32 = v_u_2("MsgBridge")
                local v33 = v_u_2("SaveHelper")
                local v34 = v_u_2("package:Stash")
                local v_u_35 = p29.chosen_rgb or nil
                local v_u_36 = p29.unique
                local v_u_37 = v31.get_store(p28)
                local v_u_38
                if v_u_37 then
                    v_u_38 = v_u_37:get("inventory_manager")
                else
                    v_u_38 = v_u_37
                end
                if v_u_37 then
                    v_u_37 = v_u_37:get("currency_manager")
                end
                assert(v_u_38 and v_u_37, "Store or managers did not exist")
                local v39 = v_u_13 <= v_u_37:get("bucks")
                assert(v39, "Not enough Bucks")
                local v40 = v_u_38:on_staged():get_item_copy(v_u_36)
                assert(v40, "Item did not exist")
                local v41 = v_u_3[v40.category][v40.kind]
                local v42
                if v41 then
                    v42 = v41.colorable
                else
                    v42 = v41
                end
                assert(v42, "Item is not colorable")
                local v43 = v40.properties.color
                local v44
                if v43 then
                    v44 = Color3.new(unpack(v43))
                else
                    v44 = v41.default_color
                end
                local v45 = {
                    ["stage"] = function()
                        v_u_38:on_staged():set_property(v_u_36, "color", v_u_35 and { v_u_35.R, v_u_35.G, v_u_35.B } or nil)
                        v_u_37:modify_staged("bucks", -v_u_13)
                    end,
                    ["commit"] = function()
                        v_u_37:commit_staged()
                        v_u_38:commit_staged()
                    end,
                    ["rollback"] = function()
                        v_u_37:rollback_staged()
                        v_u_38:rollback_staged()
                    end
                }
                v33.transact({ v33.main_file(p28) }, v45)
                v32.hint(p28, {
                    ["text"] = "The item was recolored successfully!"
                })
                local v46 = "item_recolored"
                local v47 = {
                    ["user_id"] = p28.UserId,
                    ["item_category"] = v41.category,
                    ["item_kind"] = v41.kind
                }
                local v48
                if v_u_35 then
                    v48 = v_u_35:ToHex()
                else
                    v48 = nil
                end
                v47.color = v48
                local v49
                if v44 then
                    v49 = v44:ToHex()
                else
                    v49 = nil
                end
                v47.previous_color = v49
                v34:log(v46, v47)
            end
        }
        return v15(v14, v50)
    end
}