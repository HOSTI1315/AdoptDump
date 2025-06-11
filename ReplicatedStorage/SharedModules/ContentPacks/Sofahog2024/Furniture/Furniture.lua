--// ReplicatedStorage.SharedModules.ContentPacks.Sofahog2024.Furniture (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Fsys).load
local v3 = v2("EntryHelper")
local v4 = v2("FurnitureUseHelperDB")
local v5 = {
    ["sofahog_2024_postapoc_bed"] = {
        ["name"] = "Dystopian Bed",
        ["cost"] = 116,
        ["model_name"] = "PostApoc2024TyreMattressBed",
        ["image_id"] = 15929153063
    }
}
local v6 = {
    ["name"] = "Dystopian Night Light",
    ["cost"] = 124,
    ["model_name"] = "PostApoc2024NuclearNightLight",
    ["image_id"] = 15929151459,
    ["behavior"] = v4.COLORABLE_LIGHT("sofahog_2024_postapoc_nuclear_nightlight", {
        ["default_color"] = Color3.fromRGB(101, 190, 99)
    })
}
v5.sofahog_2024_postapoc_nuclear_nightlight = v6
v5.sofahog_2024_postapoc_meteor_water_bowl = {
    ["name"] = "Dystopian Water Bowl",
    ["cost"] = 126,
    ["model_name"] = "PostApoc2024MeteorWaterBowl",
    ["image_id"] = 15929313166
}
v5.sofahog_2024_postapoc_meteor_food_bowl = {
    ["name"] = "Dystopian Food Bowl",
    ["cost"] = 126,
    ["model_name"] = "PostApoc2024MeteorFoodBowl",
    ["image_id"] = 15929148548
}
v5.sofahog_2024_postapoc_hazmat_shower = {
    ["name"] = "Dystopian Shower",
    ["cost"] = 222,
    ["model_name"] = "PostApoc2024HazmatShower",
    ["image_id"] = 15929146649
}
v5.sofahog_2024_postapoc_car_boot_pet_bed = {
    ["name"] = "Dystopian Pet Bed",
    ["cost"] = 247,
    ["model_name"] = "PostApoc2024CarbootPetBed",
    ["image_id"] = 15929144726
}
v5.sofahog_2024_postapoc_broken_fridge = {
    ["name"] = "Dystopian Fridge",
    ["cost"] = 81,
    ["model_name"] = "PostApoc2024BrokenFridge",
    ["image_id"] = 15929141905
}
v5.sofahog_2024_postapoc_barrel_crib = {
    ["name"] = "Dystopian Crib",
    ["cost"] = 176,
    ["model_name"] = "PostApoc2024BarrelCrib",
    ["image_id"] = 15929138800
}
v5.sofahog_2024_postapoc_barbed_wire_barrier_straight = {
    ["name"] = "Dystopian Barrier Fence",
    ["cost"] = 14,
    ["model_name"] = "PostApoc2024BarbedWireBarrierStraight",
    ["image_id"] = 15929137146
}
v5.sofahog_2024_postapoc_barbed_wire_barrier_corner = {
    ["name"] = "Dystopian Corner Fence",
    ["cost"] = 13,
    ["model_name"] = "PostApoc2024BarbedWireBarrierCorner",
    ["image_id"] = 15929135867
}
v5.sofahog_2024_postapoc_boarded_window = {
    ["name"] = "Dystopian Window",
    ["cost"] = 38,
    ["model_name"] = "PostApoc2024BoardedWindow",
    ["image_id"] = 15929140156
}
local v7 = {
    ["sofahog_2024_medieval_bed"] = {
        ["name"] = "Medieval Bed",
        ["cost"] = 113,
        ["model_name"] = "Medieval2024Bed",
        ["image_id"] = 15931236886
    },
    ["sofahog_2024_medieval_bench"] = {
        ["name"] = "Medieval Bench",
        ["cost"] = 38,
        ["model_name"] = "Medieval2024Bench",
        ["image_id"] = 15931236237
    },
    ["sofahog_2024_medieval_candle"] = {
        ["name"] = "Medieval Candle",
        ["cost"] = 8,
        ["model_name"] = "Medieval2024Candle",
        ["image_id"] = 15931235230
    },
    ["sofahog_2024_medieval_chandelier"] = {
        ["name"] = "Medieval Chandelier",
        ["cost"] = 250,
        ["model_name"] = "Medieval2024Chandelier",
        ["image_id"] = 15931234460
    },
    ["sofahog_2024_medieval_crib"] = {
        ["name"] = "Medieval Crib",
        ["cost"] = 147,
        ["model_name"] = "Medieval2024Crib",
        ["image_id"] = 15931233471
    },
    ["sofahog_2024_medieval_food_bowl"] = {
        ["name"] = "Medieval Food Bowl",
        ["cost"] = 84,
        ["model_name"] = "Medieval2024FoodBowl",
        ["image_id"] = 15931232512
    },
    ["sofahog_2024_medieval_water_bowl"] = {
        ["name"] = "Medieval Water Bowl",
        ["cost"] = 84,
        ["model_name"] = "Medieval2024WaterBowl",
        ["image_id"] = 15931227364
    },
    ["sofahog_2024_medieval_fridge"] = {
        ["name"] = "Medieval Fridge",
        ["cost"] = 147,
        ["model_name"] = "Medieval2024Fridge",
        ["image_id"] = 15931231903
    },
    ["sofahog_2024_medieval_pet_bed"] = {
        ["name"] = "Medieval Pet Bed",
        ["cost"] = 98,
        ["model_name"] = "Medieval2024PetBed",
        ["image_id"] = 15931230323
    },
    ["sofahog_2024_medieval_shower"] = {
        ["name"] = "Medieval Shower",
        ["cost"] = 146,
        ["model_name"] = "Medieval2024Shower",
        ["image_id"] = 15931229535
    },
    ["sofahog_2024_medieval_stool"] = {
        ["name"] = "Medieval Stool",
        ["cost"] = 34,
        ["model_name"] = "Medieval2024Stool",
        ["image_id"] = 15931228791
    },
    ["sofahog_2024_medieval_table"] = {
        ["name"] = "Medieval Table",
        ["cost"] = 74,
        ["model_name"] = "Medieval2024Table",
        ["image_id"] = 15931228138
    },
    ["sofahog_2024_medieval_weapon_rack"] = {
        ["name"] = "Medieval Weapon Rack",
        ["cost"] = 245,
        ["model_name"] = "Medieval2024WeaponRack",
        ["image_id"] = 15931266579
    }
}
local v8 = {
    ["sofahog_2024_diner_lemonade_pitcher"] = {
        ["name"] = "Lemonade Pitcher",
        ["cost"] = 225,
        ["model_name"] = "Diner2024LemonadePitcher",
        ["image_id"] = 16036410115,
        ["behavior"] = v4.GRAB_ITEM("food", "sofahog_2024_diner_lemonade")
    },
    ["sofahog_2024_diner_pancake_maker"] = {
        ["name"] = "Pancake Maker",
        ["cost"] = 175,
        ["model_name"] = "Diner2024PancakeMaker",
        ["image_id"] = 16036404158,
        ["behavior"] = v4.GRAB_ITEM("food", "sofahog_2024_diner_pancakes")
    },
    ["sofahog_2024_diner_deep_fryer"] = {
        ["name"] = "Deep Fryer",
        ["cost"] = 225,
        ["model_name"] = "Diner2024DeepFryer",
        ["image_id"] = 16036433004,
        ["behavior"] = v4.GRAB_ITEM("food", "sofahog_2024_diner_hot_dog_and_fries")
    },
    ["sofahog_2024_diner_casserole_dish"] = {
        ["name"] = "Baking Dish - Mac and Cheese",
        ["cost"] = 140,
        ["model_name"] = "Diner2024CasseroleDish",
        ["image_id"] = 16036409296,
        ["behavior"] = v4.GRAB_ITEM("food", "sofahog_2024_diner_mac_and_cheese")
    },
    ["sofahog_2024_diner_milkshake_machine"] = {
        ["name"] = "Milkshake Machine",
        ["cost"] = 350,
        ["model_name"] = "Diner2024MilkshakeMachine",
        ["image_id"] = 16036406534,
        ["behavior"] = v4.GRAB_ITEM("food", "sofahog_2024_diner_milkshake")
    },
    ["sofahog_2024_diner_apple_pie_display"] = {
        ["name"] = "Apple Pie Display",
        ["cost"] = 180,
        ["model_name"] = "Diner2024ApplePieDisplay",
        ["image_id"] = 16036441602,
        ["behavior"] = v4.GRAB_ITEM("food", "sofahog_2024_diner_apple_pie")
    },
    ["sofahog_2024_diner_table_round_end"] = {
        ["name"] = "Diner Table Round End",
        ["cost"] = 33,
        ["model_name"] = "Diner2024DinerTableRoundEnd",
        ["image_id"] = 16036420818
    },
    ["sofahog_2024_diner_table_middle"] = {
        ["name"] = "Diner Table Middle",
        ["cost"] = 57,
        ["model_name"] = "Diner2024DinerTableMiddle",
        ["image_id"] = 16036418018
    },
    ["sofahog_2024_diner_table_square_end"] = {
        ["name"] = "Diner Table Square End",
        ["cost"] = 15,
        ["model_name"] = "Diner2024DinerTableSquareEnd",
        ["image_id"] = 16036419471
    },
    ["sofahog_2024_diner_booth"] = {
        ["name"] = "Diner Booth",
        ["cost"] = 123,
        ["model_name"] = "Diner2024Booth",
        ["image_id"] = 16036423731
    },
    ["sofahog_2024_diner_food_bowl"] = {
        ["name"] = "Diner Food Bowl",
        ["cost"] = 59,
        ["model_name"] = "Diner2024FoodBowl",
        ["image_id"] = 16036415369
    },
    ["sofahog_2024_diner_water_bowl"] = {
        ["name"] = "Diner Water Bowl",
        ["cost"] = 59,
        ["model_name"] = "Diner2024WaterBowl",
        ["image_id"] = 16036392732
    },
    ["sofahog_2024_diner_pizza_bed"] = {
        ["name"] = "Diner Pizza Bed",
        ["cost"] = 249,
        ["model_name"] = "Diner2024PizzaBed",
        ["image_id"] = 16036398818
    },
    ["sofahog_2024_diner_burger_neon_sign"] = {
        ["name"] = "Burger Neon Sign",
        ["cost"] = 145,
        ["model_name"] = "Diner2024BurgerNeonSign",
        ["image_id"] = 16036437955,
        ["behavior"] = v4.LIGHT("sofahog_2024_diner_burger_neon_sign")
    },
    ["sofahog_2024_diner_burger_pet_bed"] = {
        ["name"] = "Diner Burger Pet Bed",
        ["cost"] = 199,
        ["model_name"] = "Diner2024BurgerPetBed",
        ["image_id"] = 16036435720
    },
    ["sofahog_2024_diner_crib"] = {
        ["name"] = "Diner Crib",
        ["cost"] = 79,
        ["model_name"] = "Diner2024Crib",
        ["image_id"] = 16036425849
    },
    ["sofahog_2024_diner_fridge"] = {
        ["name"] = "Diner Fridge",
        ["cost"] = 93,
        ["model_name"] = "Diner2024Fridge",
        ["image_id"] = 16036416638
    },
    ["sofahog_2024_diner_shower"] = {
        ["name"] = "Diner Shower",
        ["cost"] = 114,
        ["model_name"] = "Diner2024Shower",
        ["image_id"] = 16036422434
    }
}
local v9 = {}
for v10, v11 in v5 do
    v11.tags = { "SofahogPostApoc2024" }
    v9[v10] = v11
end
for v12, v13 in v7 do
    v13.tags = { "SofahogMedieval2024" }
    v9[v12] = v13
end
for v14, v15 in v8 do
    v15.tags = { "SofahogDiner2024" }
    v9[v14] = v15
end
return v3.furniture(v9)