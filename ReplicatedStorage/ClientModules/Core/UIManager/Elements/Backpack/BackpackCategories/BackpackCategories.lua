--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Backpack.BackpackCategories (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("package:Sift")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("SoundPlayer")
local v_u_6 = v1("BackpackFavoriteTracker")
local v7 = v2("BackpackCategories", v1("UIBaseElement"))
local v_u_8 = {
    ["favorites"] = "Favorites",
    ["pets"] = "Pets",
    ["pet_accessories"] = "Pet Wear",
    ["strollers"] = "Strollers",
    ["food"] = "Food",
    ["transport"] = "Vehicles",
    ["toys"] = "Toys",
    ["gifts"] = "Gifts",
    ["roleplay"] = "Roleplay",
    ["wings"] = "Wings",
    ["stickers"] = "Stickers"
}
local v_u_9 = {
    ["stickers"] = { "sticker_packs", "stickers" },
    ["toys"] = { "roleplay", "toys" }
}
function v7._init_buttons(p_u_10)
    local v11 = {}
    for _, v12 in p_u_10.buttons:GetChildren() do
        if v12:IsA("ImageButton") and v12.Visible then
            table.insert(v11, v12)
        end
    end
    table.sort(v11, function(p13, p14)
        return p13.LayoutOrder < p14.LayoutOrder
    end)
    local v15 = 1
    for _, v_u_16 in v11 do
        v_u_16.Visible = false
        v_u_16.LayoutOrder = v15
        v15 = v15 + 1
        local v_u_17 = v_u_16.Name
        local v18 = {
            ["state"] = "normal",
            ["mouse_button1_down"] = function()
                p_u_10:select_category(v_u_17)
                if v_u_4.is_using_gamepad() then
                    p_u_10.BackpackApp.watch:select_object(v_u_16)
                end
            end
        }
        local v19 = {
            ["layout_order"] = v15,
            ["category"] = v_u_17,
            ["depth_button"] = p_u_10.UIManager.wrap(v_u_16, "DepthButton"):start(v18)
        }
        p_u_10.by_layout[v15] = v19
        p_u_10.by_category[v_u_17] = v19
        if v_u_9[v_u_17] then
            for _, v20 in v_u_9[v_u_17] do
                v15 = v15 + 1
                if v_u_17 == v20 then
                    v19.layout_order = v15
                else
                    local v21 = {
                        ["is_sub_category"] = true,
                        ["layout_order"] = v15,
                        ["category"] = v_u_17
                    }
                    p_u_10.by_layout[v15] = v21
                    p_u_10.by_category[v20] = v21
                end
            end
        end
    end
    p_u_10:reset_visible_categories()
end
function v7._refresh_visible_buttons(p22)
    for v23, v24 in p22.by_category do
        if not v24.is_sub_category then
            if table.find(p22.visible_categories, v23) then
                v24.depth_button.instance.Visible = true
            else
                v24.depth_button.instance.Visible = false
            end
        end
    end
end
function v7.start(p25, p26)
    p25.BackpackApp = p26
    p25.category = nil
    p25.by_layout = {}
    p25.by_category = {}
    p25.title = p25.instance.Title
    p25.buttons = p25.instance.Buttons
    p25:_init_buttons()
    p25:select_category("pets", true)
    p25.instance.Visible = true
    return p25
end
function v7.get_default_console_selection(p27)
    return p27.buttons.strollers
end
function v7.get_category(p28)
    return p28.category
end
function v7.get_category_layout_order(p29, p30)
    return p29.by_category[p30].layout_order
end
function v7.get_associated_backpack_category(p31, p32)
    return p31.by_category[p32].category
end
function v7.select_category(p33, p34, p35)
    if p33.category ~= p34 then
        local v36 = p33.by_category[p34] or {}
        local v37 = (p33.by_category[p33.category] or {}).depth_button
        local v38 = v36.depth_button
        if v37 then
            v37:set_state("normal")
        end
        if v38 then
            v38:set_state("selected")
        end
        p33.category = p34
        p33.title.Text = v_u_8[p34]:upper()
        v_u_6.cache_favorites()
        p33.BackpackApp.category_changed:Fire(p34)
        p33.BackpackApp.tooltip:hide()
        p33.BackpackApp.search_bar:reset_search()
        p33.BackpackApp:refresh_rendered_items()
        if not p35 and p33.UIManager.is_visible("BackpackApp") then
            v_u_5.Interface:play("Backpack/TabSwitch")
        end
    end
end
function v7.set_visible_categories(p39, p40)
    p39.visible_categories = p40
    p39:_refresh_visible_buttons()
end
function v7.reset_visible_categories(p41)
    p41:set_visible_categories(v_u_3.Dictionary.keys(p41.by_category))
end
return v7