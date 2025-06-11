--// ReplicatedStorage.SharedModules.ContentPacks.Kiwi2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("FurnitureUseHelperDB")
local v_u_3 = v1("FurnitureAnimator")
local v4 = v1("SharedConstants")
local v5 = v1("EntryHelper")
local v6 = {}
local v7 = {
    ["name"] = "Ship Swing Bed",
    ["cost"] = 480,
    ["rarity"] = "common",
    ["model_name"] = "Kiwi2023ShipSwingBed",
    ["image_id"] = 14034184426,
    ["tags"] = { "ToyshopPlaceable" },
    ["behavior"] = v2.ANIMATED_USABLE_FURNITURE({
        ["use_text"] = "Sleep",
        ["animation"] = "LayInBed",
        ["team_whitelist"] = { "Parents" }
    })
}
v6.kiwi_2023_ship_swing_bed = v7
local v8 = {
    ["name"] = "Sky Swing Shower",
    ["cost"] = 325,
    ["rarity"] = "common",
    ["model_name"] = "Kiwi2023SkySwingShower",
    ["image_id"] = 14098692790,
    ["tags"] = { "ToyshopPlaceable" },
    ["behavior"] = v2.GENERIC_SHOWER({
        ["post_render"] = v_u_3.animate_furniture,
        ["unrender"] = v_u_3.unrender_animated_furniture
    })
}
v6.kiwi_2023_sky_swing_shower = v8
local v9 = {
    ["name"] = "Air Balloon Crib",
    ["cost"] = 580,
    ["rarity"] = "common",
    ["model_name"] = "Kiwi2023AirBalloonCrib",
    ["image_id"] = 14098696333,
    ["tags"] = { "ToyshopPlaceable" }
}
local v10 = v2.ANIMATED_USABLE_FURNITURE
local v11 = {
    ["use_text"] = "Sleep",
    ["animation"] = {
        ["Babies"] = "BabySleepOnBack",
        ["Pets"] = "sleep"
    },
    ["team_whitelist"] = { "Babies", "Pets" },
    ["ailment_to_boost"] = { "sleepy", v4.full_sleep_duration },
    ["char_offset"] = {
        ["Pets"] = CFrame.new(0, 0.5, 1)
    }
}
v9.behavior = v10(v11)
v6.kiwi_2023_air_balloon_crib = v9
local v12 = {
    ["name"] = "Toy Airplane Fridge",
    ["cost"] = 215,
    ["rarity"] = "common",
    ["model_name"] = "Kiwi2023ToyAirplaneFridge",
    ["image_id"] = 14098697601,
    ["tags"] = { "ToyshopPlaceable" },
    ["behavior"] = v2.BASIC_FURNITURE({
        ["post_render"] = v_u_3.animate_furniture,
        ["unrender"] = v_u_3.unrender_animated_furniture
    })
}
v6.kiwi_2023_toy_airplane_fridge = v12
local v13 = {
    ["name"] = "Rocking Horse Pet Bed",
    ["cost"] = 475,
    ["rarity"] = "common",
    ["model_name"] = "Kiwi2023RockingHorsePetBed",
    ["image_id"] = 14098704291,
    ["tags"] = { "ToyshopPlaceable" }
}
local v14 = v2.ANIMATED_USABLE_FURNITURE
local v15 = {
    ["use_text"] = "Sleep",
    ["animation"] = {
        ["Babies"] = "BabySleepOnBack",
        ["Pets"] = "sleep"
    },
    ["team_whitelist"] = { "Babies", "Pets" },
    ["ailment_to_boost"] = { "sleepy", v4.full_sleep_duration },
    ["char_offset"] = {
        ["Pets"] = CFrame.new(0, 0.5, 1)
    }
}
v13.behavior = v14(v15)
v6.kiwi_2023_rocking_horse_pet_bed = v13
local v16 = {
    ["name"] = "Jack-in-the-Box Food Bowl",
    ["cost"] = 410,
    ["rarity"] = "common",
    ["model_name"] = "Kiwi2023JackInTheBoxFoodBowl",
    ["image_id"] = 14098706545,
    ["tags"] = { "ToyshopPlaceable" },
    ["behavior"] = v2.BASIC_FURNITURE({
        ["use_id"] = "generic_food_bowl",
        ["use_text"] = "Eat",
        ["animation"] = "eating",
        ["team_whitelist"] = { "Pets" },
        ["ailment_to_boost"] = { "hungry", v4.full_food_bowl_drink_duration },
        ["post_render"] = v_u_3.animate_furniture,
        ["unrender"] = v_u_3.unrender_animated_furniture
    })
}
v6.kiwi_2023_jack_in_the_box_food_bowl = v16
local v22 = {
    ["name"] = "Jack-in-the-Box Water Bowl",
    ["cost"] = 410,
    ["rarity"] = "common",
    ["model_name"] = "Kiwi2023JackInTheBoxWaterBowl",
    ["image_id"] = 14098705400,
    ["tags"] = { "ToyshopPlaceable" },
    ["behavior"] = v2.BASIC_FURNITURE({
        ["use_id"] = "generic_water_bowl",
        ["use_text"] = "Drink",
        ["animation"] = "eating",
        ["team_whitelist"] = { "Pets" },
        ["ailment_to_boost"] = { "thirsty", v4.full_water_bowl_drink_duration },
        ["post_render"] = function(p17, p18, p19, p20, p21)
            v_u_3.animate_furniture(p17, p18, p19, p20, p21, "kiwi_2023_jack_in_the_box_food_bowl")
        end,
        ["unrender"] = v_u_3.unrender_animated_furniture
    })
}
v6.kiwi_2023_jack_in_the_box_water_bowl = v22
v6.kiwi_2023_aviator_kiwi = {
    ["name"] = "Aviator Kiwi",
    ["model_name"] = "Kiwi2023AviatorKiwi",
    ["behavior"] = v2.NPC("kiwi_2023_aviator_kiwi")
}
return v5.furniture(v6)