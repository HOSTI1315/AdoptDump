--// ReplicatedStorage.new.modules.Ailments.Helpers.PreferenceHelper (ModuleScript)

require(script.Parent.Parent.AilmentComponent)
require(script.Parent.Parent.AilmentEntry)
require(script.Parent.Parent.AilmentTypes)
local v_u_1 = require(script.Parent.Parent.Parent.ForSaleManager)
local v_u_2 = require(script.Parent.Parent.Parent.HotspotsByInterior)
local v_u_3 = require(script.Parent.Parent.Helpers.PreferenceItemHelper)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_5 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v_u_5("CloudValues")
local v_u_7 = v_u_5("InventoryDB")
local v_u_8 = v_u_5("ItemDB")
local v_u_9 = v_u_5("LiveOpsMapSwap")
local v_u_10 = game:GetService("RunService")
local v_u_11 = Random.new()
local v_u_12 = {}
local function v_u_38(p_u_13, p_u_14)
    local v15 = v_u_10
    assert(v15:IsServer())
    local v16 = p_u_14.item_category or p_u_14.item_categories
    assert(v16, "Missing item category or categories.")
    local v17 = nil
    if p_u_14.item_category then
        v17 = p_u_14.item_category
    elseif p_u_14.item_categories then
        v17 = p_u_14.item_categories[v_u_11:NextInteger(1, #p_u_14.item_categories)]
    end
    local v19 = v_u_4.Dictionary.filter(v_u_7[v17], function(p18)
        if p18.permanently_delete_all_copies_of_this_item_from_the_game or (p18.is_roleplay_item or p18.is_hidden_from_backpack) then
            return false
        else
            return (not p_u_14.filter_callback or p_u_14.filter_callback(p18)) and true or false
        end
    end)
    if p_u_14.items_are_consumable then
        v19 = v_u_4.Dictionary.filter(v19, function(p20)
            local v21 = v_u_1.is_for_sale(p20.kind, p_u_13)
            if v21 then
                v21 = not p20.vip_exclusive
            end
            local v22 = not p20.liveops_map_type_required_for_purchase and true or p20.liveops_map_type_required_for_purchase == v_u_9.get_current_map_type()
            local v23 = v_u_2.get_server().items[p20.kind] ~= nil
            if v21 then
                if not v22 then
                    v23 = v22
                end
            else
                v23 = v21
            end
            return v23
        end)
    end
    local v24 = v_u_5("DataM").get_store(p_u_13)
    if v24 then
        v24 = v24:get("inventory_manager")
    end
    local v25 = v_u_6:getValue("ailments", "preferenceIsNewItemRatios")
    local v26 = p_u_14.items_are_consumable and "consumable" or "non_consumable"
    local v27
    if v_u_11:NextNumber() > v25[v26] and v24 then
        local v_u_28 = v24:on_committed()
        v27 = v_u_4.Dictionary.filter(v19, function(_, p29)
            local v30 = v_u_28:get_item_uuids_of_kind(p29)
            return next(v30) ~= nil
        end)
    else
        v27 = nil
    end
    if v27 and next(v27) then
        v19 = v27
    elseif not p_u_14.items_are_consumable then
        v19 = v_u_4.Dictionary.filter(v19, function(p31)
            local v32 = v_u_1.is_for_sale(p31.kind, p_u_13)
            if v32 then
                v32 = not p31.vip_exclusive
            end
            local v33 = not p31.liveops_map_type_required_for_purchase and true or p31.liveops_map_type_required_for_purchase == v_u_9.get_current_map_type()
            local v34 = v_u_2.get_server().items[p31.kind] ~= nil
            if v32 then
                if not v33 then
                    v34 = v33
                end
            else
                v34 = v32
            end
            return v34
        end)
    end
    local v_u_35 = 0
    local v37 = v_u_4.Dictionary.map(v19, function(p36)
        v_u_35 = v_u_35 + 1
        return p36.kind, v_u_35
    end)
    return v17, v37[v_u_11:NextInteger(1, #v37)]
end
function v_u_12.already_rolled(p39)
    return p39.preference_status and p39.preference_status.rolled or false
end
function v_u_12.should_create_preference(p40, p41)
    local v42 = v_u_10
    assert(v42:IsServer())
    if v_u_12.has_preference(p41) then
        return true
    elseif v_u_12.already_rolled(p41) then
        return false
    else
        return require(script.Parent.Parent.AilmentDistributionHelperServer).should_distribute_preference(p40)
    end
end
function v_u_12.get_entry_from_preference(p43)
    local v44 = v_u_10
    assert(v44:IsClient())
    local v45 = p43 and p43.components
    if v45 then
        v45 = p43.components.preference
    end
    if v45 then
        return v_u_8[v45.item_category][v45.item_kind]
    else
        return nil
    end
end
function v_u_12.join_description(p46, p47, p48)
    local v49 = v_u_10
    assert(v49:IsClient())
    local v50 = v_u_12.get_entry_from_preference(p46)
    if v50 and p47.speech_bubble then
        local v51 = p48.speech_bubble_format_string or " %s please!"
        p47 = v_u_4.Dictionary.join(p47, {
            ["speech_bubble"] = ("%* %*"):format(p47.speech_bubble, (v51:format(v50.name)))
        })
    end
    return p47
end
function v_u_12.get_preference(p52)
    if p52 and p52.components then
        return p52.components.preference
    else
        return nil
    end
end
function v_u_12.has_preference(p53)
    local v54
    if p53 == nil then
        v54 = false
    else
        v54 = p53.preference ~= nil
    end
    return v54
end
function v_u_12.has_item(p55)
    local v56 = v_u_10
    assert(v56:IsClient())
    for _, v57 in (v_u_5("ClientData").get("inventory") or {})[p55.item_category] or {} do
        if v_u_3.is_correct_item(p55.item_kind, v57.kind) then
            return true
        end
    end
    return false
end
function v_u_12.get_preference_choices(p_u_58, p59)
    local v60 = v_u_10
    assert(v60:IsClient())
    local v61 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
    local v62 = require(v61.ItemNavigationAction)
    local v63 = require(v61.UseItemAction)
    require(v61.ActionChoice)
    local v64 = v_u_8[p_u_58.item_category][p_u_58.item_kind]
    local v65 = {}
    local v66 = {
        ["text"] = ("Go to %s"):format(v64.name),
        ["image"] = v64.image,
        ["is_primary"] = true,
        ["action"] = v62.new({
            ["category"] = p_u_58.item_category,
            ["kind"] = p_u_58.item_kind
        }),
        ["is_valid"] = function(_)
            return not v_u_12.has_item(p_u_58)
        end
    }
    local v67 = {
        ["text"] = (p59 or "Give %s"):format(v64.name),
        ["image"] = v64.image,
        ["is_primary"] = true,
        ["action"] = v63.new({
            ["category"] = p_u_58.item_category,
            ["kind"] = p_u_58.item_kind,
            ["match_preference"] = true
        }),
        ["is_valid"] = function(_)
            return v_u_12.has_item(p_u_58)
        end
    }
    __set_list(v65, 1, {v66, v67})
    return v65
end
function v_u_12.get_component(p68, p69, p70)
    local v71 = v_u_10
    assert(v71:IsServer())
    local v72 = game.ServerScriptService.new.modules.Ailments.ServerComponents
    local v73 = require(v72.Preference)
    local v74 = p70.preference or nil
    local v75
    if v74 then
        v75 = v74.item_category
    else
        v75 = nil
    end
    local v76
    if v74 then
        v76 = v74.item_kind
    else
        v76 = nil
    end
    if not (v75 and v76) then
        v75, v76 = v_u_38(p68, p69)
    end
    local v77 = p70.from_cure_all_potion ~= nil
    return v73.new({
        ["item_category"] = v75,
        ["item_kind"] = v76,
        ["not_mutually_exclusive"] = p69.not_mutually_exclusive,
        ["start_satisfied"] = v77
    })
end
function v_u_12.get_rolled_component()
    local v78 = v_u_10
    assert(v78:IsServer())
    local v79 = game.ServerScriptService.new.modules.Ailments.ServerComponents
    return require(v79.Memory).new({
        ["rolled"] = true
    })
end
function v_u_12.wrap(p_u_80, p_u_81)
    local v88 = {
        ["create_description"] = function(p82)
            local v83 = p_u_80.create_description(p82)
            if p82 and v_u_12.has_preference(p82.components) then
                v83 = v_u_12.join_description(p82, v83, p_u_81)
            end
            return v83
        end,
        ["create_server_components"] = function(p84, p85, p86)
            local v87 = p_u_80.create_server_components(p84, p85, p86)
            if v_u_12.should_create_preference(p84, p85) then
                v87.preference = v_u_12.get_component(p84, p_u_81, p85)
            end
            v87.preference_status = v_u_12.get_rolled_component()
            return v87
        end
    }
    return v_u_4.Dictionary.join(p_u_80, v88)
end
return v_u_12