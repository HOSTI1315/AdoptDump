--// ReplicatedStorage.ClientDB.Inventory.EntryHelper (ModuleScript)

require(script:WaitForChild("ItemTypes.d"))
local v_u_1 = require(script:WaitForChild("ItemTypes.t"))
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v_u_2("package:Sift")
v_u_2("DeveloperProductDB")
local v_u_4 = v_u_2("DeveloperProductCallbacks")
local v5 = {}
local function v_u_11(p6)
    local v7 = {}
    for v8, v10 in p6 do
        if type(v10) == "table" then
            local v10 = v_u_11(v10)
        end
        v7[v8] = v10
    end
    return v7
end
local v_u_12 = {}
local function v_u_16(p13)
    for v14, v15 in p13 do
        if typeof(v15) == "Color3" then
            p13[v14] = {
                ["Color"] = v15
            }
        end
        if not p13[v14].Material then
            p13[v14].Material = Enum.Material.Neon
        end
    end
end
function v_u_12.pets(p17, _, p18)
    local v19 = v_u_11(p18)
    v19.origin_entry.only_has_dev_product = v_u_4.developer_product_only_items_sets.pets[p17] == true
    local v20 = {}
    if v19.transforming_pet then
        local v21 = v19.transforming_pet.default_form
        if not v19.anims then
            v19.anims = v19.transforming_pet.forms[v21].anims
        end
        if not v19.tricks then
            v19.tricks = v19.transforming_pet.forms[v21].tricks
        end
        for _, v22 in v19.transforming_pet.forms do
            if v22.anims then
                local v23 = v22.anims
                table.insert(v20, v23)
            end
        end
    end
    if v19.anims then
        local v24 = v19.anims
        table.insert(v20, v24)
    end
    for _, v25 in v20 do
        if not v25.flying then
            v25.flying = v25.running_mounted or v25.running
        end
    end
    if v19.donatable == nil then
        v19.donatable = true
    end
    if v19.hide_from_collectors_sign == nil then
        v19.hide_from_collectors_sign = false
    end
    if v19.already_has_flying_wings == nil then
        v19.already_has_flying_wings = false
    end
    if v19.hold_offset == nil then
        v19.hold_offset = CFrame.new()
    end
    if v19.hold_double_offset == nil then
        v19.hold_double_offset = CFrame.new()
    end
    if v19.is_egg == nil then
        v19.is_egg = false
    end
    if v19.is_doll == nil then
        v19.is_doll = false
    end
    if v19.is_customizable == nil then
        v19.is_customizable = not (v19.is_egg or v19.is_doll)
    end
    if v19.neon_parts == nil then
        v19.neon_parts = {}
    end
    if v19.is_proper_name == nil then
        v19.is_proper_name = false
    end
    local v26 = v19.is_doll
    if v26 then
        v26 = not v19.is_egg
    end
    v19.is_food_grabber = v26
    v19.origin_entry.full_origin = v19.origin_entry.origin .. " " .. v19.origin_entry.year
    v_u_16(v19.neon_parts)
    if v19.mega_neon_parts then
        v_u_16(v19.mega_neon_parts)
        return v19
    else
        v19.mega_neon_parts = v19.neon_parts
        return v19
    end
end
function v_u_12.toys(_, _, p27)
    return v_u_11(p27)
end
function v_u_12.food(_, _, p28)
    return v_u_11(p28)
end
function v_u_12.gifts(_, _, p29)
    local v30 = v_u_11(p29)
    if v30.tool == "StickerPackTool" then
        v30.grid_category = "sticker_packs"
    end
    return v30
end
function v_u_12.roleplay(_, _, p31)
    return v_u_11(p31)
end
function v_u_12.stickers(_, _, p32)
    local v33 = v_u_11(p32)
    v33.animated = v33.flipbook_properties ~= nil
    v33.display_infinite_amount_in_backpack = v33.unlimited
    return v33
end
function v_u_12.strollers(_, _, p34)
    return v_u_11(p34)
end
function v_u_12.transport(_, _, p35)
    return v_u_11(p35)
end
function v_u_12.pet_accessories(_, _, p36)
    local v37 = v_u_11(p36)
    local v38 = {
        ["tool"] = "PetAccessoryTool",
        ["animation"] = {
            ["hold"] = "CandyCannonHold",
            ["use"] = "CandyCannonHold"
        }
    }
    for v39, v40 in v38 do
        v37[v39] = v40
    end
    if v37.accessory_type == "wings" then
        v37.grid_category = "wings"
        v37.custom_tooltip_description = "Wings will only appear when your pet is flying."
    end
    return v37
end
function v_u_12.houses(_, _, p41)
    local v_u_42 = v_u_11(p41)
    v_u_42.exterior_name = v_u_42.exterior_name or v_u_42.model_name
    v_u_42.max_furniture = v_u_42.max_furniture or 4000
    if v_u_42.recommended_furniture then
        v_u_42.recommended_furniture = {
            ["tags"] = v_u_3.Set.fromList(v_u_42.recommended_furniture.tags or {}),
            ["content_packs"] = v_u_3.Set.fromList(v_u_42.recommended_furniture.content_packs or {})
        }
    end
    if v_u_42.addons then
        for v43, v44 in v_u_42.addons do
            v44.kind = v43
            local v45 = v44.cost * 0.4
            v44.sell_price = math.floor(v45)
        end
    end
    if v_u_42.was_robux_house and not v_u_42.was_multiple_purchase_or_developer_product then
        v_u_42.donatable = false
    elseif v_u_42.gamepass then
        local v46 = v_u_2("GamepassDB")[v_u_42.gamepass]
        if v46 and not v46.multiple_purchase_developer_product_id then
            v_u_42.donatable = false
        end
    end
    if v_u_42.donatable == nil then
        v_u_42.donatable = true
    end
    function v_u_42.get_exterior()
        local v47 = game.ReplicatedStorage.Resources:WaitForChild("HouseExteriors")
        local v48 = v47:WaitForChild(v_u_42.exterior_name, 5)
        local v49
        if v48 then
            v49 = false
        else
            v48 = v47:WaitForChild("Micro")
            v49 = true
        end
        return v48, v49
    end
    return v_u_42
end
function v_u_12.furniture(_, _, p50)
    local v51 = v_u_11(p50)
    v51.type = "furniture"
    v51.can_use_in_house = v51.image_id ~= nil
    v51.image_id = "rbxassetid://" .. (v51.image_id or 0)
    if v51.donatable == nil then
        v51.donatable = v51.gamepass == nil
    end
    if v51.can_color == nil then
        v51.can_color = true
    end
    return v51
end
local function v_u_65(p52)
    local v53 = debug.info(2, "n")
    local v54 = debug.info(3, "s"):split(".")
    local v55 = v54[#v54 - 2]
    local v56 = {}
    for v57, v58 in p52 do
        local v59 = v_u_1[v53]
        local v60, v61 = v59.definition(v58)
        if not v60 then
            error(("\nTypecheck failed for %*:%*. During the %* check.\nThe error provided was:\n%*"):format(v53, v57, "definition", v61), 2)
        end
        local v62 = v_u_12[v53](v57, v53, v58)
        v62.category = v53
        v62.kind = v57
        v62.id = v57
        v62.contentpack = v55
        v62.typechecked = true
        local v63, v64 = v59.runtime(v62)
        if not v63 then
            error(("\nTypecheck failed for %*:%*. During the %* check.\nThe error provided was:\n%*"):format(v53, v57, "runtime", v64), 2)
        end
        table.insert(v56, v62)
    end
    return v56
end
function v5.pets(p66)
    return v_u_65(p66)
end
function v5.toys(p67)
    return v_u_65(p67)
end
function v5.food(p68)
    return v_u_65(p68)
end
function v5.gifts(p69)
    return v_u_65(p69)
end
function v5.roleplay(p70)
    return v_u_65(p70)
end
function v5.stickers(p71)
    return v_u_65(p71)
end
function v5.strollers(p72)
    return v_u_65(p72)
end
function v5.transport(p73)
    return v_u_65(p73)
end
function v5.pet_accessories(p74)
    return v_u_65(p74)
end
function v5.houses(p75)
    return v_u_65(p75)
end
function v5.furniture(p76)
    return v_u_65(p76)
end
return v5