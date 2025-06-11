--// ReplicatedStorage.ClientDB.AvatarClientManager (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v3 = v_u_1("CriticalSection")
local v4 = v_u_1("PlatformM")
local v_u_5 = v_u_1("ClientData")
local v_u_6 = v_u_1("TableUtil")
local v_u_7 = v_u_1("AvatarCategoriesDB")
local v_u_8 = v_u_1("PetAvatarCategoriesDB")
local v_u_9 = v_u_1("AvatarItemsCache")
local v_u_10 = v_u_1("PetAvatarItemDB")
local v_u_11 = v_u_1("AvatarEditorHelper")
local v_u_12 = v_u_1("PetAccessoryCompatHelper")
local v_u_13 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game:GetService("Players").LocalPlayer)
local v_u_14 = {}
local v_u_15 = nil
local v_u_16 = 0
local v_u_17 = v4.get_platform() == v4.platform.phone and 20 or 50
function v_u_14.convert_soft_category_to_actual_category(p18, p19, p20, p21)
    if p18 == "pet" then
        if p19 == "all" then
            local v22 = v_u_11.get_accessory_item_by_unique_client(p21)
            if v22 == nil then
                return
            end
            p19 = v_u_10.get_category_by_id(v22.id)
        end
        return p19, p20
    else
        local v23 = v_u_7.categories[p19]
        if v23.soft_category then
            local v24 = v23.subcategory_to_category_remap[p20]
            local v25
            if typeof(v24) == "table" then
                v25 = v24.category
            else
                v25 = v24
            end
            if typeof(v24) == "table" then
                return v25, v24.subcategory
            else
                return v25, "General"
            end
        else
            return p19, p20
        end
    end
end
function v_u_14.take_off(p26, p27, p28, p29)
    if p27 == "all" and p26 == "pet" then
        local v30 = v_u_11.get_accessory_item_by_unique_client(p28)
        if v30 == nil then
            return
        end
        p27 = v_u_10.get_category_by_id(v30.id)
    end
    local v31 = p27 == "shoes_packages"
    if v_u_16 == 0 and not v31 then
        local v32 = v_u_5.get("avatar_manager") or {}
        local v33 = v_u_6.deep_copy(v32)
        local v34 = v33[p26][p27] or {}
        local v35 = v_u_6.get_first_occurrence_index(v34, p28)
        if v35 then
            table.remove(v34, v35)
            v_u_5.update("avatar_manager", v33)
        end
    end
    if p29 then
        p29 = p29.pet_unique
    end
    v_u_16 = v_u_16 + 1
    v_u_2.get("AvatarAPI/TakeOff"):InvokeServer(p26, p27, p28, p29)
    v_u_16 = v_u_16 - 1
end
function v_u_14.put_on(p36, p37, p38, p39)
    local v40 = v_u_1("UIManager")
    local v41
    if p36 == "pet" then
        local v42 = v_u_11.get_accessory_item_by_unique_client(p38)
        if not (p39 and v_u_12.can_equip_on_pet(v42.kind, p39.pet_id)) then
            v40.apps.HintApp:hint({
                ["text"] = "Your pet can\'t wear that!",
                ["yields"] = false,
                ["overridable"] = true,
                ["length"] = 4.5
            })
            return
        end
        v41 = p39.pet_unique
    else
        v41 = nil
    end
    if v_u_16 == 0 then
        local v43 = v_u_5.get("avatar_manager") or {}
        local v44 = v_u_6.deep_copy(v43)
        local v45 = v44[p36]
        local v46 = v45[p37] or {}
        local v47
        if p36 == "pet" then
            v47 = v_u_8.categories
        else
            v47 = v_u_7.categories
        end
        local v48 = v47[p37]
        local v49 = v48.related_categories or {}
        table.insert(v49, p37)
        if not v_u_6.is_member(v46, p38) then
            if v48.one_at_a_time then
                for _, v50 in v49 do
                    repeat
                        local v51 = v45[v50] or {}
                    until table.remove(v51) == nil
                end
            else
                local v52 = 0
                for _, v53 in v49 do
                    v52 = v52 + #(v45[v53] or {})
                end
                if v52 + 1 > v48.equip_limit then
                    local v54 = {
                        ["text"] = string.format("%s can only wear %d %s at the same time", p36 == "pet" and "Your pet" or "You", v48.equip_limit, v48.name:lower()),
                        ["yields"] = false,
                        ["overridable"] = true,
                        ["length"] = 4.5
                    }
                    v40.apps.HintApp:hint(v54)
                    return
                end
            end
            table.insert(v46, p38)
            v_u_5.update("avatar_manager", v44)
        end
    end
    v_u_16 = v_u_16 + 1
    v_u_2.get("AvatarAPI/PutOn"):InvokeServer(p36, p37, p38, v41)
    v_u_16 = v_u_16 - 1
    v_u_14.submit_analytics_event("equipped_item")
    return true
end
local function v_u_58(_, p55, p56, p57)
    v_u_14.download_initial_catalog_cache()
    return v_u_15:fetch_page(p55, p56, p57)
end
function v_u_14.clear_cache(_)
    v_u_15 = nil
end
function v_u_14.get_items_from_catalog(p_u_59, p60, p61, p_u_62, p63)
    local v64 = p_u_59 == "player"
    assert(v64, "This method is only available for player catalogs")
    if p60 ~= "other" then
        local v65, v66 = v_u_14.convert_soft_category_to_actual_category(p_u_59, p60, p61, nil)
        local v_u_67 = v65
        local v_u_68 = v66
        if not p63 then
            coroutine.wrap(function()
                local v69 = v_u_67
                local v70 = v_u_68
                local v71 = p_u_62 + 1
                v_u_14.download_initial_catalog_cache()
                v_u_15:fetch_page(v69, v70, v71)
            end)()
            return v_u_58(p_u_59, v_u_67, v_u_68, p_u_62)
        end
        if p_u_62 == 1 then
            return v_u_2.get("AvatarAPI/SearchItems"):InvokeServer(p63, v_u_67)
        end
    end
end
function v_u_14.get_pet_accessories_from_inventory(p72, _, _, p73)
    local v74 = string.lower(p73 or "")
    local v75 = (v_u_5.get("inventory") or {}).pet_accessories or {}
    local v76 = {}
    for _, v77 in pairs(v75) do
        local v78 = v_u_10.get_category_by_id(v77.id)
        local v79 = v_u_10.get_entry_by_id(v77.id).name
        local v80 = v_u_13:Translate(workspace, v79)
        if string.find(string.lower(v80), v74, 1, true) ~= nil and (p72 == "all" and true or v78 == p72) then
            local v81 = v77.unique
            table.insert(v76, v81)
        end
    end
    return v76
end
function v_u_14.get_item_details(p82, p83)
    if p82 ~= "player" then
        return {}
    end
    local v84 = {}
    for _, v85 in v_u_2.get("AvatarAPI/GetItemDetails"):InvokeServer(p83) or {} do
        v84[v85.asset_id] = v85
    end
    return v84
end
function v_u_14.submit_analytics_event(p86)
    v_u_2.get("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(p86)
end
v_u_14.download_initial_catalog_cache = v3.new():wrap(function()
    if not v_u_15 then
        v_u_15 = v_u_9.new(v_u_17)
        v_u_15:download_catalog()
    end
end)
return v_u_14