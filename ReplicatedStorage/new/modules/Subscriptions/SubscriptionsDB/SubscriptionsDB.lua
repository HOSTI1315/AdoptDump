--// ReplicatedStorage.new.modules.Subscriptions.SubscriptionsDB (ModuleScript)

local v_u_1 = require(script.Parent.Parent.LegacyLoad)
local v2 = v_u_1("ContentPackHelper")
local v_u_3 = game:GetService("MarketplaceService")
local v4 = game:GetService("RunService")
local v5 = {}
local v20 = {
    ["name"] = "Adopt Me! Pets Plus",
    ["auto_give_ranks"] = { "influencer" },
    ["description"] = "Equip 2 pets, VIP, + more!",
    ["reward_list"] = {
        "EQUIP 2 PETS",
        "RAISED BUCKS CAP",
        "VIP BENEFITS",
        "STICKER PACK",
        "STREAK SAVER",
        "LEGENDARY TREAT"
    },
    ["detailed_reward_list"] = {
        ["persistent"] = { "Gain VIP status - including access to the VIP Room and VIP name badge!", "Streak Saver - you won\'t lose your daily login streak while subscribed!" },
        ["periodically"] = { "Pet Handler Pro Certificate (30 Days) equips an extra pet that receives a fraction of the needs and increases your daily bucks limit.", "Subscriber-exclusive sticker pack!", "Legendary Treat to adopt a new pet!" },
        ["first_time"] = { "Limo and VIP House" }
    },
    ["subscription_id"] = "EXP-4337914776394662151",
    ["renewing_benefits"] = function(p6, p7)
        local v8 = v_u_1("DeveloperProductCallbacks")
        local v9 = {}
        local v10 = {
            v8.add_item("gifts", "subscription_2024_2x_pet_certificate", true),
            v8.add_item("gifts", "subscription_2024_sticker_pack", false),
            v8.add_item("food", "subscription_2024_golden_flower", false),
            table.insert(v9, "subscription_2024_2x_pet_certificate"),
            table.insert(v9, "subscription_2024_sticker_pack"),
            table.insert(v9, "subscription_2024_golden_flower")
        }
        if p7 then
            local v11 = v8.add_item
            table.insert(v10, v11("transport", "limo", false))
            local v12 = v8.add_house
            table.insert(v10, v12("vip_house"))
            table.insert(v9, "limo")
        end
        v8.all(v10)(p6)
        return v9
    end,
    ["activate"] = function(p13)
        local v14 = v_u_1("DataM")
        local v15 = v14.get_store(p13)
        local v16 = v_u_1("TagM")
        if not v16.has_tag(p13, "vip") then
            v16.register_tag(p13, "vip")
        end
        v14.update(p13, "is_vip", true)
        v15:get("daily_login_manager"):set_streak_loss_enabled(false)
    end,
    ["deactivate"] = function(p17)
        local v18 = v_u_1("DataM")
        local v19 = v18.get_store(p17)
        if not v19:get("gamepass_manager"):has_gamepass("vip") then
            v_u_1("TagM").remove_tag(p17, "vip")
            v18.update(p17, "is_vip", false)
        end
        v19:get("bucks_cap_manager"):remove_cap_multiplier("pet_care_subscription")
        v19:get("daily_login_manager"):set_streak_loss_enabled(true)
    end
}
v5.pet_care = v20
v5.equip_2x_pets = {
    ["name"] = "Pet Handler Pro Certificate",
    ["certificate_item_kind"] = "subscription_2024_2x_pet_certificate",
    ["certificate_description"] = "Certified to equip two pets at the same time",
    ["certificate_icon"] = "rbxassetid://92483519850877",
    ["certificate_icon_large"] = "rbxassetid://100235478170812",
    ["certificate_resubscription"] = "pet_care",
    ["activate"] = function(p21)
        local v22 = v_u_1("DataM").get_store(p21)
        v22:set("equipped_pets_allowed", 2)
        v22:get("bucks_cap_manager"):set_cap_multiplier("pet_care_subscription", 1.395, false)
    end,
    ["deactivate"] = function(p23)
        local v24 = v_u_1("DataM")
        local v25 = v_u_1("EquippedPets")
        local v26 = v24.get_store(p23)
        local v27
        if v26 then
            v27 = v26:get("equip_manager")
        else
            v27 = v26
        end
        v26:set("equipped_pets_allowed", 1)
        for v28, v29 in v25.get_equipped(p23) do
            if v28 ~= 1 then
                v27:unequip(v29)
            end
        end
        v26:get("bucks_cap_manager"):remove_cap_multiplier("pet_care_subscription")
    end
}
v2.merge("Subscriptions", v5)
for v30, v31 in v5 do
    v31.key = v30
    v31.kind = v30
end
if v4:IsClient() then
    for _, v_u_32 in v5 do
        if v_u_32.subscription_id then
            task.spawn(function()
                v_u_32.product_info = v_u_3:GetSubscriptionProductInfoAsync(v_u_32.subscription_id)
            end)
        end
    end
end
return v5