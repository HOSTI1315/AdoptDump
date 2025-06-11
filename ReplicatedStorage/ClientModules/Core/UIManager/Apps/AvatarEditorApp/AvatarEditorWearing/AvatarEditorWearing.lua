--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AvatarEditorApp.AvatarEditorWearing (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("PlatformM")
local v4 = v1("Class")
local v_u_5 = v1("AvatarClientManager")
local v_u_6 = v1("AvatarCategoriesDB")
local v_u_7 = v1("PetAvatarCategoriesDB")
local v_u_8 = v1("CatalogItemImage")
local v_u_9 = v1("Set")
local v10 = v4("AvatarEditorWearing", v1("UIBaseElement"))
local v_u_11 = v_u_3.get_platform()
function v10.show(p12)
    p12.instance.Visible = true
    p12:refresh_wearing()
end
function v10.hide(p13)
    p13.instance.Visible = false
    p13:clear_wearing()
end
function v10.set_category(p14, p15)
    p14.category = p15
    p14:refresh_wearing()
end
function v10.clear_wearing(p16)
    for _, v17 in pairs(p16.instance:GetChildren()) do
        if v17:IsA("ImageButton") then
            v17:Destroy()
        end
    end
end
function v10.refresh_wearing(p_u_18)
    if p_u_18.category == nil then
        return
    elseif p_u_18.avatar_editor_app:get_screen() == "full_catalog" then
        p_u_18:clear_wearing()
        local v19 = v_u_2.get("avatar_manager") or {}
        local v_u_20 = p_u_18.avatar_editor_app:get_focused_avatar_type()
        local v21 = v19[v_u_20]
        local v_u_22
        if v_u_20 == "pet" then
            v_u_22 = p_u_18.avatar_editor_app.focus_switcher:get_focused_pet_wrapper()
            v21 = v_u_22.pet_unique and (v21[v_u_22.pet_unique] or {}) or {}
        else
            v_u_22 = nil
        end
        local v23 = {}
        if p_u_18.category == "other" then
            local v24
            if v_u_20 == "pet" then
                v24 = v_u_7
            else
                v24 = v_u_6
            end
            local v25 = v_u_9.new(v24.ordered_categories)
            for _, v26 in v24.ordered_categories do
                for _, v28 in v24.categories[v26].subcategory_to_category_remap or {} do
                    if typeof(v28) == "table" then
                        local v28 = v28.category
                    end
                    v25:add(v28)
                end
            end
            for v29, v30 in pairs(v21) do
                if not v25:has(v29) then
                    for _, v31 in pairs(v30) do
                        table.insert(v23, {
                            ["asset_id"] = v31,
                            ["category"] = v29
                        })
                    end
                end
            end
        else
            local v32 = {}
            local v33
            if v_u_20 == "pet" then
                v33 = v_u_7
            else
                v33 = v_u_6
            end
            local v34 = v33.categories[p_u_18.category]
            if v34 and v34.soft_category then
                for _, v36 in v34.subcategory_to_category_remap or {} do
                    if typeof(v36) == "table" then
                        local v36 = v36.category
                    end
                    v32[v36] = true
                end
            elseif p_u_18.category then
                v32[p_u_18.category] = true
            end
            for v37, _ in v32 do
                for _, v38 in v21[v37] or {} do
                    if v37 ~= "left_shoes" and v37 ~= "right_shoes" or #v21.shoes_packages <= 0 then
                        table.insert(v23, {
                            ["asset_id"] = v38,
                            ["category"] = v37
                        })
                    end
                end
            end
        end
        for _, v39 in pairs(v23) do
            local v_u_40 = v39.asset_id
            local v_u_41 = v39.category
            local v42 = p_u_18.equipped_template:clone()
            v42.ItemImage.Image = v_u_8.get(v_u_20, v_u_41, v_u_40)
            v42.Parent = p_u_18.instance
            v42.Close[v_u_3.mouse_down_or_click()]:connect(function()
                v_u_5.take_off(v_u_20, v_u_41, v_u_40, v_u_22)
            end)
            v42.MouseButton1Down:connect(function()
                if v_u_3.is_using_gamepad() then
                    v_u_5.take_off(v_u_20, v_u_41, v_u_40, v_u_22)
                    p_u_18.watch:select_object(p_u_18.avatar_editor_app.back_button.instance)
                end
            end)
        end
    end
end
function v10.start(p_u_43, p44)
    p_u_43.avatar_editor_app = p44
    p_u_43.equipped_template = p_u_43.instance.EquippedTemplate
    p_u_43.equipped_template.Parent = nil
    v_u_2.register_server_on_change_hook("avatar_manager", nil, function(_, _, _)
        p_u_43:refresh_wearing()
    end)
    if v_u_11 == v_u_3.platform.phone then
        p_u_43.instance.UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
        p_u_43.instance.UIGridLayout.CellSize = UDim2.new(0, 70, 0, 70)
        p_u_43.instance.UIPadding.PaddingBottom = UDim.new(0, 6)
        p_u_43.instance.UIPadding.PaddingTop = UDim.new(0, 6)
        p_u_43.instance.UIPadding.PaddingLeft = UDim.new(0, 6)
        p_u_43.instance.UIPadding.PaddingRight = UDim.new(0, 6)
    end
    return p_u_43
end
return v10