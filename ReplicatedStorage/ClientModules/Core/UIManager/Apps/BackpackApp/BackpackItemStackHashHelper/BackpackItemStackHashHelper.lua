--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BackpackApp.BackpackItemStackHashHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("LiveOpsTime")
local v_u_5 = v1("EquippedPets")
local v_u_6 = v1("BucksAgingMultiplierHelper")
local v_u_7 = v1("new:QuickCache")
local v_u_8 = v1("BackpackLockTracker")
local v_u_9 = v1("BackpackFavoriteTracker")
local v_u_10 = game:GetService("HttpService")
local v_u_11 = game:GetService("Players").LocalPlayer
local function v13(p12)
    return p12 == nil and "" or tostring(p12)
end
local function v17(p14, _, p15)
    if p14 then
        return p14 == nil and "" or tostring(p14)
    end
    local v16 = p15 and p15.uses or ""
    return tostring(v16)
end
local function v24(p18)
    if p18 == nil then
        return ""
    end
    local v19 = p18[1]
    local v20 = tostring(v19)
    local v21 = p18[2]
    local v22 = tostring(v21)
    local v23 = p18[3]
    return ("{r:%s,g:%s,b:%s}"):format(v20, v22, (tostring(v23)))
end
local function v_u_26(p25)
    return p25 == nil and "" or v_u_10:GenerateGUID()
end
local function v28(p27)
    return (not p27 or v_u_4.has_happened(p27)) and "" or (p27 == nil and "" or tostring(p27))
end
local v_u_29 = "Property %s is not whitelisted in the backpack stack hash. Either explicitly write a hash for it or add it to the whitelist."
local v_u_30 = {
    ["pets"] = {
        ["pet_trick_level"] = true,
        ["neon_created_from"] = true,
        ["temporary"] = true
    },
    ["pet_accessories"] = {},
    ["strollers"] = {},
    ["food"] = {},
    ["transport"] = {},
    ["toys"] = {
        ["debounce_end"] = true,
        ["flashlight_on"] = true,
        ["front_value_to_display"] = true,
        ["back_value_to_display"] = true
    },
    ["gifts"] = {},
    ["roleplay"] = {},
    ["stickers"] = {
        ["last_edit"] = true
    },
    ["__all"] = {}
}
local v_u_48 = {
    ["pets"] = {
        ["rp_name"] = v13,
        ["flyable"] = v13,
        ["rideable"] = v13,
        ["age"] = v13,
        ["neon"] = v13,
        ["mega_neon"] = v13,
        ["ailments_completed"] = v13,
        ["timed_flags"] = function(p31)
            if p31 then
                local v32 = p31.potion_scale and (p31.potion_scale.value or 0) or 0
                local v33 = p31.potion_translucency and (p31.potion_translucency.value or 0) or 0
                local v34 = p31.colored_hair_spray and p31.colored_hair_spray.value and (p31.colored_hair_spray.value.colors or {}) or {}
                if v32 == 0 and (v33 == 0 and #v34 == 0) then
                    return ""
                end
            end
            return v_u_26(p31)
        end,
        ["sealed_colors"] = v13,
        ["friendship_level"] = v13,
        ["tradeable_timestamp"] = v28
    },
    ["pet_accessories"] = {
        ["wearing_pet"] = v13,
        ["tradeable_timestamp"] = v28
    },
    ["strollers"] = {
        ["color"] = v24,
        ["tradeable_timestamp"] = v28
    },
    ["food"] = {
        ["uses_left"] = v17,
        ["flavors"] = function(p35)
            return (p35 == nil or type(p35) ~= "table") and "" or table.concat(p35, ",")
        end,
        ["sauce"] = v13,
        ["chocolate_wafer"] = v13,
        ["cherry_topping"] = v13,
        ["chocolate_icing"] = v13,
        ["vanilla_icing"] = v13,
        ["strawberry_icing"] = v13,
        ["cheese"] = v13,
        ["pepperoni"] = v13,
        ["peppers"] = v13,
        ["tomato_sauce"] = v13,
        ["slice_visible"] = v13,
        ["baked"] = v13,
        ["burned"] = v13,
        ["percent_cooked"] = function(p36)
            return p36 and (p36 <= 60 and "u" or (p36 < 100 and "c" or "b")) or ""
        end,
        ["pizza"] = function(p37)
            if not p37 then
                return ""
            end
            local v38 = p37.state
            local v39 = p37.boxed
            local v40 = tostring(v39)
            local v41 = p37.plated
            local v42 = tostring(v41)
            local v43 = {}
            if p37.toppings then
                for v44 in p37.toppings do
                    table.insert(v43, v44)
                end
                table.sort(v43)
            end
            local v45 = p37.bites_remaining
            local v46 = tostring(v45)
            return v38 .. v40 .. v42 .. table.concat(v43, "") .. v46
        end,
        ["tradeable_timestamp"] = v28
    },
    ["transport"] = {
        ["color"] = v24,
        ["tradeable_timestamp"] = v28
    },
    ["toys"] = {
        ["color"] = v24,
        ["placed_furniture_unique"] = function(p47)
            return p47 == nil and "" or (not v_u_3.get("placed_furnitures")[p47] and "" or p47)
        end,
        ["uses_left"] = v17,
        ["accessory_kind"] = v13,
        ["tradeable_timestamp"] = v28
    },
    ["gifts"] = {
        ["uses_left"] = v17,
        ["tradeable_timestamp"] = v28
    },
    ["roleplay"] = {
        ["color"] = v24,
        ["tradeable_timestamp"] = v28
    },
    ["stickers"] = {
        ["tradeable_timestamp"] = v28
    }
}
local v_u_60 = {
    ["pets"] = function(p49)
        local v50 = ""
        if v_u_7("pet_hash_wearing_lists", function()
            local v51 = v_u_3.get("pet_saved_worn_items")
            return v51 and v51.wearing_lists or {}
        end)[p49.unique] then
            v50 = v50 .. v_u_10:GenerateGUID()
        end
        local v54 = v_u_7("equipped_char_wrappers_map", function()
            local v52 = {}
            for _, v53 in v_u_5.get_my_equipped_char_wrappers() do
                v52[v53.pet_unique] = v53
            end
            return v52
        end)
        if v54[p49.unique] then
            v50 = v50 .. p49.unique
        end
        local v55 = v_u_6.get_multiplier_for_pet(v_u_11, {
            ["item"] = p49,
            ["char_wrapper"] = v54[p49.unique] or false
        })
        if v55.bucks then
            local v56 = v55.bucks
            v50 = v50 .. tostring(v56)
        end
        if v55.aging then
            local v57 = v55.aging
            v50 = v50 .. tostring(v57)
        end
        return v50
    end,
    ["pet_accessories"] = function(p58)
        local v59 = v_u_3.get("pet_saved_worn_items")
        return not (v59 and v59.accessory_to_pet_map or {})[p58.unique] and "" or v_u_10:GenerateGUID()
    end
}
return {
    ["get_item_data_hash"] = function(p61)
        local v62 = v_u_2[p61.category][p61.kind]
        local v63 = v_u_48[p61.category]
        local v64 = {}
        for v65, _ in pairs(p61.properties) do
            if not (v_u_30[p61.category][v65] or v_u_30.__all[v65]) then
                warn(v_u_29:format(v65))
            end
        end
        for v66, v67 in pairs(v63) do
            local v68 = v66 .. ":"
            local v69 = p61.properties[v66]
            local v70 = v68 .. v67.hash_function(v69, p61, v62)
            v64[v67.order] = v70
        end
        local v71 = p61.category .. p61.id .. table.concat(v64, ",")
        if v_u_60[p61.category] then
            v71 = v71 .. v_u_60[p61.category](p61)
        end
        if v_u_8.is_locked(p61) or v_u_9.is_favorite(p61) then
            v71 = v71 .. v_u_10:GenerateGUID()
        end
        return v71
    end,
    ["init"] = function()
        for v72, v73 in pairs(v_u_48) do
            local v74 = 1
            for v75, v76 in pairs(v73) do
                v73[v75] = {
                    ["hash_function"] = v76,
                    ["order"] = v74
                }
                v_u_30[v72][v75] = true
                v74 = v74 + 1
            end
        end
    end
}