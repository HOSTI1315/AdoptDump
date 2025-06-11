--// ReplicatedStorage.SharedModules.Game.PetAccessoryCompatHelper (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v_u_2("InventoryDB")
local function v_u_14()
    local v4 = v_u_2("PetAvatarItemDB")
    local v5 = v_u_2("PetAccessoryEquipHelper")
    local v6 = {
        ["accessories"] = {},
        ["pets"] = {}
    }
    for v7, v8 in pairs(v4.items_by_kind) do
        local v9
        if v8.equip_type == "shoes" then
            v9 = { "shoe" }
        elseif v8.equip_type == "earrings" then
            v9 = { "earring_left", "earring_right" }
        elseif v8.equip_type == "wings" then
            v9 = { "WingsAttachment" }
        else
            local v10 = game.ServerStorage.Downloadable.PetAvatarResources:FindFirstChild(v8.model_handle)
            v9 = { v5.get_accessory_attachment_type(v10) }
        end
        v6.accessories[v7] = v9
    end
    for v11, v12 in pairs(v_u_3.pets) do
        if not v12.permanently_delete_all_copies_of_this_item_from_the_game then
            local v13 = game.ServerStorage.ServerResources.Pets:FindFirstChild(v12.model)
            v6.pets[v11] = v5.get_accessory_attachment_types_for_pet(v13)
        end
    end
    return v6
end
local function v_u_15()
    if v_u_1:IsServer() then
        return v_u_2("DataM").get_global_store():get("pet_accessory_attachment_info")
    else
        return v_u_2("ClientData").get("pet_accessory_attachment_info")
    end
end
return {
    ["can_equip_on_pet"] = function(p16, p17)
        local v18 = v_u_15()
        local v19 = v18.accessories[p16]
        local v20 = v18.pets[p17]
        local v21 = v_u_3.pet_accessories[p16]
        if v21 and v21.equip_type == "wings" then
            local v22 = v_u_3.pets[p17]
            if v22.already_has_flying_wings or v22.wings_override and v22.wings_override ~= p16 then
                return false
            end
        end
        for _, v23 in ipairs(v19) do
            if table.find(v20, v23) then
                return true
            end
        end
        return false
    end,
    ["init"] = function()
        if v_u_1:IsServer() then
            local v24 = v_u_2("DataM")
            local v25 = v_u_14()
            v24.get_global_store():set("pet_accessory_attachment_info", v25)
        end
    end
}