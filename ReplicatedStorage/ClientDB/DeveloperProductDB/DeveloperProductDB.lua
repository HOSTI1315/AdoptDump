--// ReplicatedStorage.ClientDB.DeveloperProductDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("DeveloperProductCallbacks")
local v3 = v_u_1("ContentPackHelper")
local v4 = v_u_1("AltCurrencyData")
local v16 = {
    ["A"] = {
        ["reward_type"] = "bucks",
        ["name"] = "50 Bucks",
        ["reward_amount"] = 50,
        ["cost"] = 24,
        ["product_id"] = 452163458,
        ["callback"] = v_u_2.currency
    },
    ["B"] = {
        ["reward_type"] = "bucks",
        ["name"] = "200 Bucks",
        ["reward_amount"] = 200,
        ["cost"] = 95,
        ["product_id"] = 452165174,
        ["callback"] = v_u_2.currency
    },
    ["C"] = {
        ["reward_type"] = "bucks",
        ["name"] = "600 Bucks",
        ["reward_amount"] = 600,
        ["cost"] = 280,
        ["product_id"] = 452165711,
        ["callback"] = v_u_2.currency
    },
    ["D"] = {
        ["reward_type"] = "bucks",
        ["name"] = "1400 Bucks",
        ["reward_amount"] = 1400,
        ["cost"] = 650,
        ["tag"] = "GOOD VALUE",
        ["product_id"] = 452165964,
        ["callback"] = v_u_2.currency
    },
    ["E"] = {
        ["reward_type"] = "bucks",
        ["name"] = "3000 Bucks",
        ["reward_amount"] = 3000,
        ["cost"] = 1385,
        ["tag"] = "GREAT VALUE",
        ["product_id"] = 452166306,
        ["callback"] = v_u_2.currency
    },
    ["F"] = {
        ["reward_type"] = "bucks",
        ["name"] = "10000 Bucks",
        ["reward_amount"] = 10000,
        ["cost"] = 4600,
        ["tag"] = "BEST DEAL!",
        ["product_id"] = 452166553,
        ["callback"] = v_u_2.currency
    },
    ["instant_hatch"] = {
        ["name"] = "Instant Hatch",
        ["cost"] = 45,
        ["product_id"] = 547288280,
        ["callback"] = function(p5, _, _, _, p6)
            if not v_u_1("EggHatcher").hatch_current_pet(p5, p6) then
                v_u_2.add_potion("food", "pet_instant_hatch_potion", true)(p5)
            end
        end
    },
    ["pet_riding_potion"] = {
        ["name"] = "Ride-A-Pet Potion",
        ["description"] = "Make a pet permanently rideable by feeding them this magic potion",
        ["cost"] = 150,
        ["product_id"] = 576894828,
        ["callback"] = v_u_2.add_potion("food", "pet_riding_potion", true)
    },
    ["pet_flying_potion"] = {
        ["name"] = "Fly-A-Pet Potion",
        ["description"] = "Make a pet permanently flyable by feeding them this magic potion",
        ["cost"] = 295,
        ["product_id"] = 805940409,
        ["callback"] = v_u_2.add_potion("food", "pet_flying_potion", true)
    },
    ["lemonade_stand"] = {
        ["name"] = "Lemonade Stand",
        ["description"] = "Sell Lemonade to your friends to earn Bucks!",
        ["cost"] = 50,
        ["product_id"] = 632083645,
        ["callback"] = v_u_2.all({ v_u_2.add_item("toys", "lemonade_stand", true), v_u_2.dialog("Your Lemonade Stand is now in your inventory") })
    },
    ["golden_goldfish"] = {
        ["name"] = "Golden Goldfish",
        ["description"] = "The perfect treat to tame a penguin!",
        ["cost"] = 225,
        ["product_id"] = 688897510,
        ["callback"] = v_u_2.add_item("food", "golden_goldfish", true)
    },
    ["honey"] = {
        ["name"] = "Honey",
        ["description"] = "The perfect treat to tame a wild Bee, King Bee, or Queen Bee",
        ["cost"] = 199,
        ["product_id"] = 877344459,
        ["callback"] = v_u_2.add_item("food", "honey", true)
    },
    ["sloth"] = {
        ["name"] = "Pet Sloth",
        ["description"] = "Unlocks Pet Sloth",
        ["cost"] = 199,
        ["product_id"] = 766113913,
        ["callback"] = v_u_2.add_item("pets", "sloth", true)
    },
    ["magic_house_door"] = {
        ["name"] = "Magic House Door",
        ["description"] = "Instantly teleport to your house from anywhere!",
        ["cost"] = 150,
        ["product_id"] = 950759885,
        ["callback"] = v_u_2.add_item("toys", "magic_house_door", true)
    },
    ["pirates_costume"] = {
        ["name"] = "Pirate\'s Costume",
        ["description"] = "Pirate pet wear set. Includes Special Pirate Hat, Eyepatch, Mustache, Ruff, & Cutlass.",
        ["cost"] = 300,
        ["product_id"] = 976522741,
        ["callback"] = v_u_2.all({
            v_u_2.add_item("pet_accessories", "pirate_hat_and_friend"),
            v_u_2.add_item("pet_accessories", "eyepatch"),
            v_u_2.add_item("pet_accessories", "respectful_mustache"),
            v_u_2.add_item("pet_accessories", "ruff"),
            v_u_2.add_item("pet_accessories", "cutlass"),
            v_u_2.new_items_dialog()
        })
    },
    ["heros_costume"] = {
        ["name"] = "Hero\'s Costume",
        ["description"] = "Heroic pet wear set. Includes sword, hood, & scarf",
        ["cost"] = 250,
        ["product_id"] = 971700961,
        ["callback"] = v_u_2.all({
            v_u_2.add_item("pet_accessories", "adventurers_sword"),
            v_u_2.add_item("pet_accessories", "adventurers_hood"),
            v_u_2.add_item("pet_accessories", "black_scarf"),
            v_u_2.new_items_dialog()
        })
    },
    ["royal_butterfly_bundle"] = {
        ["name"] = "Royal Butterfly Bundle",
        ["description"] = "Royal Butterfly pet wear set. Includes Pink Butterfly Wings, Gold Circle Glasses, Pink Hightops, and Gold Tiara.",
        ["cost"] = 80,
        ["product_id"] = 1051706534,
        ["callback"] = v_u_2.all({
            v_u_2.add_item("pet_accessories", "pink_butterfly_wings"),
            v_u_2.add_item("pet_accessories", "gold_circle_glasses"),
            v_u_2.add_item("pet_accessories", "pink_hightops"),
            v_u_2.add_item("pet_accessories", "gold_tiara"),
            v_u_2.new_items_dialog()
        })
    },
    ["diamond_lavender"] = {
        ["name"] = "Diamond Lavender",
        ["description"] = "The perfect treat to tame a wild Ladybug, Golden Ladybug or Diamond Ladybug",
        ["cost"] = 199,
        ["product_id"] = 1148343684,
        ["callback"] = v_u_2.add_item("food", "diamond_lavender", true)
    },
    ["ultra_car_pack"] = {
        ["name"] = "Ultra Car Pack",
        ["description"] = "Unlocks 3 Legendary Ultra Cars!",
        ["cost"] = 800,
        ["product_id"] = 1193016822,
        ["callback"] = v_u_2.all({
            v_u_2.add_item("transport", "wing_trunk_car"),
            v_u_2.add_item("transport", "magical_girl_car"),
            v_u_2.add_item("transport", "bubble_car"),
            v_u_2.dialog("Your 3 ultra cars are unlocked and ready in your inventory")
        })
    },
    ["mud_ball"] = {
        ["name"] = "Mud Ball",
        ["description"] = "The perfect treat to tame a Scarab",
        ["cost"] = 199,
        ["product_id"] = 1233717622,
        ["callback"] = v_u_2.add_item("food", "desert_2022_mud_ball", true)
    },
    ["taxi_driver_bundle"] = {
        ["name"] = "Taxi Driver Bundle",
        ["description"] = "Unlocks two taxis! Pick up passengers and drop them off to collect Bucks!",
        ["cost"] = 350,
        ["product_id"] = 1236389970,
        ["callback"] = v_u_2.all({ v_u_2.add_item("transport", "taxi_2022_black_cab"), v_u_2.add_item("transport", "taxi_2022_yellow_taxi_cab"), v_u_2.dialog("Your 2 taxis are ready in your inventory!") })
    },
    ["woodland_2022_camping_kit"] = {
        ["name"] = "Camping Kit",
        ["description"] = "Unlocks 4 Premium Portable Camping Furniture!",
        ["cost"] = 200,
        ["product_id"] = 1248779433,
        ["callback"] = v_u_2.all({
            v_u_2.add_item("toys", "woodland_2022_premium_log_bench"),
            v_u_2.add_item("toys", "woodland_2022_premium_camping_tent"),
            v_u_2.add_item("toys", "woodland_2022_premium_fire_pit"),
            v_u_2.add_item("toys", "woodland_2022_marshmallow_stand"),
            v_u_2.new_items_dialog()
        })
    },
    ["space_bundle_2022"] = {
        ["name"] = "Space House & Capricorn",
        ["description"] = "Unlocks Capricorn Pet and Space House",
        ["cost"] = 1250,
        ["product_id"] = 1263500178,
        ["callback"] = v_u_2.all({ v_u_2.add_house("space_house"), v_u_2.add_item("pets", "space_house_2022_capricorn", true), v_u_2.new_house_dialog() })
    },
    ["random_pets_2022_winged_horse"] = {
        ["name"] = "Pet Flying Horse",
        ["description"] = "Adopt a wonderful Winged Horse!",
        ["cost"] = 680,
        ["product_id"] = 1253153370,
        ["callback"] = v_u_2.add_item("pets", "random_pets_2022_winged_horse", true)
    },
    ["ftue_2024_starter_pack"] = {
        ["name"] = "Starter Pack",
        ["description"] = "Unlocks Family Home, 200 Bucks, Royal Egg & Starter Bike",
        ["cost"] = 99,
        ["product_id"] = 1727338799,
        ["callback"] = v_u_2.all({
            function(p7, _, _, _)
                if not v_u_1("DataM").get_store(p7):get("ftue_2022_starter_pack_manager"):can_purchase_starter_pack() then
                    return v_u_2.BREAK
                end
                local v8 = v_u_1("new:StarterPackAB")
                if v8:get_value("product_key", p7) ~= "ftue_2024_starter_pack" then
                    return v_u_2.BREAK
                end
                if not v8:get_value("show_starter_pack", p7) then
                    return v_u_2.BREAK
                end
            end,
            v_u_2.award_currency("bucks", 200),
            v_u_2.add_house("family"),
            v_u_2.add_item("transport", "ftue_2022_starter_bike", true),
            v_u_2.add_item("pets", "royal_egg", true, {
                ["is_available_for_bucks"] = true
            }),
            function(p9, _, _, _)
                v_u_1("DataM").get_store(p9):get("ftue_2022_starter_pack_manager"):mark_starter_pack_as_purchased()
            end,
            v_u_2.new_items_dialog()
        }),
        ["should_hide"] = function()
            return not v_u_1("new:StarterPackAB"):get_value("show_starter_pack")
        end
    },
    ["snow_2022_golden_clam"] = {
        ["name"] = "Golden Clam",
        ["description"] = "The perfect treat to tame an Albatross",
        ["cost"] = 199,
        ["product_id"] = 1262054323,
        ["callback"] = v_u_2.add_item("food", "snow_2022_golden_clam", true)
    },
    ["vip_2022_golden_bone"] = {
        ["name"] = "Golden Bone",
        ["description"] = "The perfect treat to tame a Chow-Chow",
        ["cost"] = 249,
        ["product_id"] = 1275284867,
        ["callback"] = v_u_2.add_item("food", "vip_2022_golden_bone", true)
    },
    ["fall_2022_golden_wheat_stalk"] = {
        ["name"] = "Golden Wheat Stalk",
        ["description"] = "The perfect treat to tame a Pheasant",
        ["cost"] = 199,
        ["product_id"] = 1281137594,
        ["callback"] = v_u_2.add_item("food", "fall_2022_golden_wheat_stalk", true)
    },
    ["royal_palace_2022_spaniel"] = {
        ["name"] = "Pet Royal Palace Spaniel",
        ["description"] = "Adopt a wonderful Royal Palace Spaniel!",
        ["cost"] = 299,
        ["product_id"] = 1291183385,
        ["callback"] = v_u_2.add_item("pets", "royal_palace_2022_spaniel", true),
        ["should_hide"] = function()
            return not v_u_1("ClientDeveloperProductHelper").should_hide("tutorial_2025_royal_palace_spaniel")
        end
    },
    ["wings_2022_premium_wing_chest"] = {
        ["name"] = "Regal Wing Chest",
        ["description"] = "Unlocks Regal Wing Chest",
        ["cost"] = 150,
        ["product_id"] = 1311700254,
        ["callback"] = v_u_2.add_item("gifts", "wings_2022_premium_wing_chest", true)
    },
    ["rain_2023_golden_plantain"] = {
        ["name"] = "Golden Plantain",
        ["description"] = "The perfect treat to tame an Amazon Bird",
        ["cost"] = 199,
        ["product_id"] = 1322943304,
        ["callback"] = v_u_2.add_item("food", "rain_2023_golden_plantain", true)
    },
    ["camping_2023_firefly"] = {
        ["name"] = "Pet Firefly",
        ["description"] = "Adopt a wonderful Firefly!",
        ["cost"] = 499,
        ["product_id"] = 1364973654,
        ["callback"] = v_u_2.add_item("pets", "camping_2023_firefly", true)
    },
    ["springfest_2023_regal_carriages"] = {
        ["name"] = "Regal Carriages",
        ["description"] = "Unlocks the Regal Carriages bundle!",
        ["cost"] = 1000,
        ["product_id"] = 1511041974,
        ["callback"] = v_u_2.all({
            v_u_2.add_item("transport", "springfest_2023_lavender_teapot_carriage"),
            v_u_2.add_item("transport", "springfest_2023_royal_crown_carriage"),
            v_u_2.add_item("transport", "springfest_2023_rose_petal_carriage"),
            v_u_2.new_items_dialog()
        })
    },
    ["paint_2023_colored_hair_spray_sealer"] = {
        ["name"] = "Paint Sealer",
        ["description"] = "Unlocks one tube of permanent Pet Paint Sealer!",
        ["cost"] = 20,
        ["product_id"] = 1508003899,
        ["callback"] = v_u_2.add_item("toys", "paint_2023_colored_hair_spray_sealer", true)
    },
    ["sky_ux_2023_cuddly_candle"] = {
        ["name"] = "Cuddly Candle",
        ["description"] = "Unlocks the Cuddly Candle pet!",
        ["cost"] = 500,
        ["product_id"] = 1527853619,
        ["callback"] = v_u_2.add_item("pets", "sky_ux_2023_cuddly_candle", true)
    },
    ["expandable_houses_2023_luxury_house"] = {
        ["name"] = "Expandable Luxury Mansion",
        ["description"] = "Unlocks the Expandable Luxury Mansion!",
        ["cost"] = 450,
        ["product_id"] = 1615509228,
        ["callback"] = v_u_2.all({ v_u_2.add_house("luxury_house"), v_u_2.new_house_dialog() })
    },
    ["kiwi_2023_toyshop_house"] = {
        ["name"] = "Toyshop House",
        ["description"] = "Unlocks the Toyshop House!",
        ["cost"] = 500,
        ["product_id"] = 1622580928,
        ["callback"] = v_u_2.all({ v_u_2.add_house("toyshop_house"), v_u_2.new_house_dialog() })
    },
    ["gift_refresh_2023_bee_shuttle"] = {
        ["name"] = "Bee Shuttle",
        ["description"] = "Unlocks the Bee Shuttle",
        ["image_id"] = 15154401459,
        ["large_image_id"] = 11307096236,
        ["cost"] = 200,
        ["product_id"] = 1675749780,
        ["callback"] = v_u_2.add_item("transport", "gift_refresh_2023_bee_shuttle", true)
    },
    ["test_always_succeeds"] = {
        ["name"] = "Test Product (always succeeds)",
        ["description"] = "Test product that always succeeds",
        ["image_id"] = 0,
        ["large_image_id"] = 0,
        ["cost"] = 1,
        ["product_id"] = 1329603479,
        ["callback"] = function(p10)
            local v11 = v_u_1("MsgBridge")
            local v12 = v_u_1("DataM")
            warn("Test Product (always succeeds) purchased by " .. p10.Name)
            local v13 = v12.get_store(p10)
            local v14 = (v13:get("test_product_count") or 0) + 1
            v13:set("test_product_count", v14)
            v11.dialog(p10, {
                ["text"] = "A test product purchase succeeded.\n" .. v14,
                ["button"] = "Okay"
            })
        end
    },
    ["test_always_fails"] = {
        ["name"] = "Test Product (always fails)",
        ["description"] = "Test product that always fails",
        ["image_id"] = 0,
        ["large_image_id"] = 0,
        ["cost"] = 1,
        ["product_id"] = 1329603547,
        ["callback"] = function(p15)
            warn("Test Product (always fails) purchased by " .. p15.Name)
            error("Intentional test failure")
        end
    }
}
if v4.enabled and v4.purchasable then
    for v17, v18 in v4.developer_products do
        v16[v17] = v18
    end
end
local v19 = {}
local v20 = {}
v3.merge("DeveloperProducts", v16)
v16.sale_data = nil
v16.original_prices = nil
v3.merge("DeveloperProducts", {
    ["sale_data"] = v19,
    ["original_prices"] = v20
}, true)
for v21, v22 in v19 do
    local v23 = v16[v21]
    assert(v23, ("Developer Product for sale %s does not exist."):format(v21))
    v23.original_cost = v20[v21] or v23.cost
    v23.cost = v22.cost
    v23.is_last_chance = v22.is_last_chance
end
for v24, v25 in v16 do
    v25.key = v24
end
return v16