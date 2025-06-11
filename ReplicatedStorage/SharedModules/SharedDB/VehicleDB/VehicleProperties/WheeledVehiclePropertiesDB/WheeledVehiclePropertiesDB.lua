--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.WheeledVehiclePropertiesDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper")
local v2 = {
    ["adopt_me_snowboard1"] = {
        ["model_name"] = "AdoptMeSnowboard1",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 20,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["adopt_me_snowboard2"] = {
        ["model_name"] = "AdoptMeSnowboard2",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 20,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["amatruck_2023_toy_delivery_truck"] = {
        ["model_name"] = "Amatruck2023ToyDeliveryTruck",
        ["acceleration"] = 30,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20,
        ["max_speed"] = 37.5,
        ["turn_angle"] = 30
    },
    ["axel"] = {
        ["model_name"] = "Axel",
        ["acceleration"] = 80,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20,
        ["max_speed"] = 80,
        ["turn_angle"] = 35
    },
    ["banana_car"] = {
        ["model_name"] = "BananaCar",
        ["acceleration"] = 65,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20,
        ["max_speed"] = 37,
        ["turn_angle"] = 20
    },
    ["bathtub"] = {
        ["model_name"] = "Bathtub",
        ["acceleration"] = 90,
        ["drift_slowdown"] = 35,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 15,
        ["max_speed"] = 35,
        ["turn_angle"] = 20
    },
    ["bethink_skateboard"] = {
        ["model_name"] = "SkateboardBethink",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 5,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["bike"] = {
        ["model_name"] = "Bike",
        ["acceleration"] = 30,
        ["animation"] = "BikeHandleHold",
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 20,
        ["max_speed"] = 25,
        ["turn_angle"] = 15
    },
    ["black_skateboard"] = {
        ["model_name"] = "SkateboardBlack",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 5,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["black_snowboard"] = {
        ["model_name"] = "BlackSnowboard",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 20,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["blue_neon_snowboard"] = {
        ["model_name"] = "BlueNeonSnowboard",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 20,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["blue_rider"] = {
        ["model_name"] = "BlueRider",
        ["acceleration"] = 65,
        ["animation"] = "MonoMopedRide",
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 0,
        ["max_speed"] = 45,
        ["turn_angle"] = 15
    },
    ["blue_skateboard"] = {
        ["model_name"] = "SkateboardBlue",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 5,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["blue_snowboard"] = {
        ["model_name"] = "BlueSnowboard",
        ["acceleration"] = 30,
        ["animation"] = "Snowboard",
        ["drift_slowdown"] = 1,
        ["is_lean_vehicle"] = true,
        ["lean_angle"] = 20,
        ["max_speed"] = 35,
        ["turn_angle"] = 18
    },
    ["bubble_car"] = {
        ["model_name"] = "BubbleCar",
        ["acceleration"] = 80,
        ["drift_slowdown"] = 20,
        ["is_lean_vehicle"] = false,
        ["lean_angle"] = 20,
        ["max_speed"] = 80,
        ["turn_angle"] = 35
    }
}
local v3 = {
    ["model_name"] = "Bunker2022ToxicBarrel",
    ["acceleration"] = 20,
    ["drift_slowdown"] = 10,
    ["is_lean_vehicle"] = false,
    ["max_speed"] = 30,
    ["movement_animations"] = {
        ["backward"] = "Bunker2022BarrelRunBackward",
        ["forward"] = "Bunker2022BarrelRun",
        ["idle"] = "RollerSkatingIdle"
    },
    ["turn_angle"] = 15
}
v2.bunker_2022_toxic_barrel = v3
v2.bunny_carriage = {
    ["model_name"] = "BunnyCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.camper_van = {
    ["model_name"] = "CamperVan",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.camping_2023_camper_van = {
    ["model_name"] = "Camping2023CamperVan",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.car = {
    ["model_name"] = "Car",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.choo_choo_train = {
    ["model_name"] = "ChooChooTrain",
    ["acceleration"] = 20,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 30
}
v2.cloud = {
    ["model_name"] = "Cloud",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 35,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 12,
    ["max_speed"] = 40,
    ["turn_angle"] = 10
}
v2.clown_car = {
    ["model_name"] = "ClownCar",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 40
}
v2.clown_unicycle = {
    ["model_name"] = "ClownUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 30,
    ["turn_angle"] = 15
}
v2.convertible = {
    ["model_name"] = "Convertible",
    ["acceleration"] = 50,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 50,
    ["turn_angle"] = 30
}
v2.cookie_unicycle = {
    ["model_name"] = "CookieUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.cozy_2021_snowmobile = {
    ["model_name"] = "Cozy2021Snowmobile",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 10,
    ["max_speed"] = 50,
    ["turn_angle"] = 18
}
v2.cozy_2021_zamboni = {
    ["model_name"] = "Cozy2021Zamboni",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 30,
    ["turn_angle"] = 40
}
v2.daisy_unicycle = {
    ["model_name"] = "DaisyUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.desert_2022_landsailer = {
    ["model_name"] = "Desert2022Landsailer",
    ["acceleration"] = 65,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 34,
    ["turn_angle"] = 20
}
v2.detective_car = {
    ["model_name"] = "DetectiveCar",
    ["acceleration"] = 45,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 30
}
v2.dino_truck = {
    ["model_name"] = "DinoTruck",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 15,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.doge_skateboard = {
    ["model_name"] = "SkateboardDoge",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.dogmobile = {
    ["model_name"] = "Dogmobile",
    ["acceleration"] = 65,
    ["drift_slowdown"] = 15,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 20
}
v2.donut_cycle = {
    ["model_name"] = "DonutCycle",
    ["acceleration"] = 65,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 25,
    ["max_speed"] = 45,
    ["turn_angle"] = 13
}
v2.donut_unicycle = {
    ["model_name"] = "DonutUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.douglas = {
    ["model_name"] = "Douglas",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 80,
    ["turn_angle"] = 25
}
v2.easter_2022_egg_delivery_machine = {
    ["model_name"] = "Easter2022EggDeliveryMachine",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 40
}
v2.fall_2022_harvest_truck = {
    ["model_name"] = "Fall2022HarvestTruck",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 3,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.fall_2022_tractor = {
    ["model_name"] = "Fall2022Tractor",
    ["acceleration"] = 25,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 10,
    ["max_speed"] = 25,
    ["turn_angle"] = 30
}
v2.fidget_skateboard = {
    ["model_name"] = "SkateboardFidget",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.fissy_skateboard = {
    ["model_name"] = "SkateboardFissy",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.flower_wagon = {
    ["model_name"] = "FlowerWagon",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 8,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.ftue_2022_starter_bike = {
    ["model_name"] = "FTUE2022StarterBike",
    ["acceleration"] = 30,
    ["animation"] = "MotorcycleHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.futuristic_unicycle = {
    ["model_name"] = "FuturisticUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 30,
    ["turn_angle"] = 15
}
v2.ghost_vehicle = {
    ["model_name"] = "GhostVehicle",
    ["acceleration"] = 65,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 12,
    ["max_speed"] = 35,
    ["turn_angle"] = 12
}
v2.gift_refresh_2022_ancient_unicycle = {
    ["model_name"] = "GiftRefreshNovember2022AncientUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.gift_refresh_2022_dapper_friend_carrier = {
    ["model_name"] = "GiftRefreshNovember2022DapperFriendCarrier",
    ["acceleration"] = 25,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 30,
    ["turn_angle"] = 35
}
v2.gift_refresh_2022_dirt_bike_unicycle = {
    ["model_name"] = "GiftRefreshMarch2022DirtBikeUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.gift_refresh_2022_hot_tub_muscle_car = {
    ["model_name"] = "GiftRefreshNovember2022HotTubMuscleCar",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 30
}
v2.gift_refresh_2022_stagecoach = {
    ["model_name"] = "GiftRefreshMarch2022Stagecoach",
    ["acceleration"] = 20,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 30
}
v2.gift_refresh_2022_unstable_triangle_car = {
    ["model_name"] = "GiftRefreshNovember2022UnstableTriangleCar",
    ["acceleration"] = 25,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 30,
    ["turn_angle"] = 35
}
v2.gift_refresh_2022_wizard_caravan = {
    ["model_name"] = "GiftRefreshMarch2022WizardCaravan",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 40
}
v2.gifthat_2023_celestial_carrier = {
    ["model_name"] = "GiftHat2023CelestialCarrier",
    ["acceleration"] = 45,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 30
}
v2.gifthat_2023_modern_unicycle = {
    ["model_name"] = "GiftHat2023ModernUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.glass_skateboard = {
    ["model_name"] = "SkateboardGlass",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.glass_snowboard = {
    ["model_name"] = "GlassSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.gokart = {
    ["model_name"] = "GoKart",
    ["acceleration"] = 55,
    ["drift_slowdown"] = 35,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 80,
    ["turn_angle"] = 18
}
v2.gold_skateboard = {
    ["model_name"] = "SkateboardGold",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.gold_snowboard = {
    ["model_name"] = "GoldSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.gorilla_fair_2023_bumper_car = {
    ["model_name"] = "GorillaFair2023BumperCar",
    ["acceleration"] = 35,
    ["drift_slowdown"] = 15,
    ["is_lean_vehicle"] = false,
    ["max_speed"] = 35,
    ["turn_angle"] = 40
}
v2.gorilla_fair_2023_circus_ball_unicycle = {
    ["model_name"] = "GorillaFair2023CircusBallUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.green_neon_snowboard = {
    ["model_name"] = "GreenNeonSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.halloween_2021_black_ponycycle = {
    ["model_name"] = "BlackPonycycle",
    ["acceleration"] = 65,
    ["animation"] = "MotorcycleHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 45,
    ["turn_angle"] = 15
}
v2.halloween_2022_knife_throwing_board = {
    ["model_name"] = "Halloween2022KnifeThrowingBoard",
    ["acceleration"] = 65,
    ["animation"] = "KnifeBoardVehiclePose",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.halloween_2022_shadow_rider_bike = {
    ["model_name"] = "Halloween2022ShadowRiderBike",
    ["acceleration"] = 65,
    ["animation"] = "SailBoatSit",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.halloween_2022_unicorn_zombie_ponycycle = {
    ["model_name"] = "Halloween2022UnicornZombiePonycycle",
    ["acceleration"] = 65,
    ["animation"] = "SailBoatSit",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 45,
    ["turn_angle"] = 15
}
v2.heart_hoverboard = {
    ["model_name"] = "HeartHoverboard",
    ["acceleration"] = 70,
    ["animation"] = "Standing",
    ["drift_slowdown"] = 30,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 22
}
v2.horse_cycle = {
    ["model_name"] = "HorseCycle",
    ["acceleration"] = 65,
    ["animation"] = "MotorcycleHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.house_car = {
    ["model_name"] = "HouseCar",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 8,
    ["max_speed"] = 28,
    ["turn_angle"] = 35
}
v2.human_bubble = {
    ["model_name"] = "HumanBubble",
    ["acceleration"] = 65,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 25,
    ["max_speed"] = 45,
    ["turn_angle"] = 13
}
v2.ice_cream_truck = {
    ["model_name"] = "IceCreamTruck",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30
}
v2.ice_queen_sleigh = {
    ["model_name"] = "IceQueenSleigh",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.ice_snowboard = {
    ["model_name"] = "IceSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.influencer_2022_supercar = {
    ["model_name"] = "Influencer2022Supercar",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 80,
    ["turn_angle"] = 25
}
v2.limo = {
    ["model_name"] = "Limo",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.lny_2022_dragon_train = {
    ["model_name"] = "LNY2022DragonTrain",
    ["acceleration"] = 20,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 30
}
v2.lunar_muscle_car = {
    ["model_name"] = "LunarMuscleCar",
    ["acceleration"] = 45,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 50,
    ["turn_angle"] = 35
}
v2.luxury_car = {
    ["model_name"] = "LuxuryCar",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 60,
    ["turn_angle"] = 35
}
v2.magical_girl_car = {
    ["model_name"] = "MagicalGirlCar",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 60,
    ["turn_angle"] = 35
}
v2.magical_princess_unicycle = {
    ["model_name"] = "MagicalPrincessUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.melon_skateboard = {
    ["model_name"] = "SkateboardWatermelon",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.mono_cycle = {
    ["model_name"] = "MonoCycle",
    ["acceleration"] = 65,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 25,
    ["max_speed"] = 45,
    ["turn_angle"] = 13
}
v2.mono_moped = {
    ["model_name"] = "MonoMoped",
    ["acceleration"] = 40,
    ["animation"] = "MonoMopedRide",
    ["drift_slowdown"] = 35,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 15,
    ["max_speed"] = 35,
    ["turn_angle"] = 13
}
v2.moped = {
    ["model_name"] = "Moped",
    ["acceleration"] = 65,
    ["animation"] = "MopedHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 0,
    ["max_speed"] = 35,
    ["turn_angle"] = 14
}
v2.motorcycle = {
    ["model_name"] = "Motorcycle",
    ["acceleration"] = 65,
    ["animation"] = "MotorcycleHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.moving_truck = {
    ["model_name"] = "MovingTruck",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30
}
v2.muscle_car = {
    ["model_name"] = "MuscleCar",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 30
}
v2.neon_black_skateboard = {
    ["model_name"] = "SkateboardNBlack",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.neon_blue_skateboard = {
    ["model_name"] = "SkateboardNBlue",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.neon_green_skateboard = {
    ["model_name"] = "SkateboardNGreen",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.neon_orange_skateboard = {
    ["model_name"] = "SkateboardNOrange",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.neon_pink_skateboard = {
    ["model_name"] = "SkateboardNPink",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.neon_red_skateboard = {
    ["model_name"] = "SkateboardNRed",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.neon_snowboard = {
    ["model_name"] = "OrangeNeonSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.neon_white_skateboard = {
    ["model_name"] = "SkateboardNWhite",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.offroader = {
    ["model_name"] = "Offroader",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30
}
v2.paint_2023_paint_roller_truck = {
    ["model_name"] = "Paint2023PaintRollerTruck",
    ["acceleration"] = 20,
    ["drift_slowdown"] = 20,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 32,
    ["turn_angle"] = 30
}
v2.pink_neon_snowboard = {
    ["model_name"] = "PinkNeonSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.pink_skateboard = {
    ["model_name"] = "SkateboardPink",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.pizza_unicycle = {
    ["model_name"] = "PizzaUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.prince_carriage = {
    ["model_name"] = "PrinceCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.princess_carriage = {
    ["model_name"] = "PrincessCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.pumpkin_carriage = {
    ["model_name"] = "PumpkinCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.racehouse_2023_gokart = {
    ["model_name"] = "Racehouse2023Gokart",
    ["acceleration"] = 35,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 5,
    ["max_speed"] = 60,
    ["turn_angle"] = 10
}
v2.rgb_monster_truck = {
    ["model_name"] = "RGBMonsterTruck",
    ["acceleration"] = 40,
    ["vehicle_render_effects"] = { "rgb_animate" },
    ["drift_slowdown"] = 30,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 25
}
v2.ribcage_carriage = {
    ["model_name"] = "RibcageCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.roblox_snowboard = {
    ["model_name"] = "RobloxSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.rocket_racer = {
    ["model_name"] = "RocketRacer",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 80,
    ["turn_angle"] = 25
}
v2.rocketsled = {
    ["model_name"] = "RocketSled",
    ["acceleration"] = 90,
    ["animation"] = "RocketSledRide",
    ["drift_slowdown"] = 35,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 15,
    ["max_speed"] = 120,
    ["turn_angle"] = 15
}
v2.royal_carriage = {
    ["model_name"] = "RoyalCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.sled = {
    ["model_name"] = "Sled",
    ["acceleration"] = 90,
    ["drift_slowdown"] = 35,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 15,
    ["max_speed"] = 35,
    ["turn_angle"] = 20
}
v2.snow_2022_snow_plow = {
    ["model_name"] = "Snow2022SnowPlow",
    ["acceleration"] = 25,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 30,
    ["turn_angle"] = 30
}
v2.snow_2022_tundra_exploration_machine = {
    ["model_name"] = "Snow2022TundraExplorationMachine",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.snow_snowboard = {
    ["model_name"] = "SnowSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.springfest_2023_daisymobile = {
    ["model_name"] = "Springfest2023Daisymobile",
    ["acceleration"] = 45,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 30
}
v2.springfest_2023_flower_truck = {
    ["model_name"] = "Springfest2023FlowerTruck",
    ["acceleration"] = 45,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 30
}
v2.springfest_2023_lavender_teapot_carriage = {
    ["model_name"] = "Springfest2023LavenderTeapotCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.springfest_2023_rose_petal_carriage = {
    ["model_name"] = "Springfest2023RosePetalCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.springfest_2023_royal_crown_carriage = {
    ["model_name"] = "Springfest2023RoyalCrownCarriage",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.squirrel_car = {
    ["model_name"] = "SquirrelCar",
    ["acceleration"] = 38,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 42,
    ["turn_angle"] = 35
}
v2.standard_unicycle = {
    ["model_name"] = "StandardUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.star_rewards_2022_emperor_chariot = {
    ["model_name"] = "StarRewards2022EmperorChariot",
    ["acceleration"] = 40,
    ["animation"] = "Standing",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 4,
    ["max_speed"] = 40,
    ["turn_angle"] = 28
}
v2.star_rewards_2022_flower_car = {
    ["model_name"] = "StarRewards2022FlowerCar",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 40
}
v2.star_rewards_2022_wagon = {
    ["model_name"] = "StarRewards2022Wagon",
    ["acceleration"] = 35,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 30,
    ["turn_angle"] = 30
}
v2.summerfest_2023_beach_buggy = {
    ["model_name"] = "Summerfest2023BeachBuggy",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 45,
    ["turn_angle"] = 30
}
v2.summerfest_2023_beachgoer = {
    ["model_name"] = "Summerfest2023Beachgoer",
    ["acceleration"] = 35,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 3,
    ["max_speed"] = 35,
    ["turn_angle"] = 25
}
v2.summerfest_2023_crabby_cruiser = {
    ["model_name"] = "Summerfest2023CrabbyCruiser",
    ["acceleration"] = 25,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 3,
    ["max_speed"] = 25,
    ["turn_angle"] = 40
}
v2.suv = {
    ["model_name"] = "SUV",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30
}
v2.tandem_bike = {
    ["model_name"] = "TandemBike",
    ["acceleration"] = 30,
    ["animation"] = "BikeHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.taxi_2022_black_cab = {
    ["model_name"] = "Taxi2022BlackCab",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30,
    ["vehicle_render_effects"] = { "taxi" }
}
v2.taxi_2022_yellow_taxi_cab = {
    ["model_name"] = "Taxi2022YellowTaxiCab",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30,
    ["vehicle_render_effects"] = { "taxi" }
}
v2.tiffany = {
    ["model_name"] = "Tiffany",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 60,
    ["turn_angle"] = 35
}
v2.tiny_convertible = {
    ["model_name"] = "TinyConvertible",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.ugc_refresh_2023_shadow_dragon_skateboard = {
    ["model_name"] = "UGCRefresh2023ShadowDragonSkateboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.unicorn_cycle = {
    ["model_name"] = "UnicornCycle",
    ["acceleration"] = 65,
    ["animation"] = "SailBoatSit",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.unicycle = {
    ["model_name"] = "Unicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.vehicle_shop_2022_bicycle = {
    ["model_name"] = "VehicleShop2022Bicycle",
    ["acceleration"] = 65,
    ["animation"] = "MotorcycleHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.vehicle_shop_2022_family_car = {
    ["model_name"] = "VehicleShop2022FamilyCar",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.vehicle_shop_2022_motorbike = {
    ["model_name"] = "VehicleShop2022Motorbike",
    ["acceleration"] = 65,
    ["animation"] = "BikeHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.vehicle_shop_2022_offroader = {
    ["model_name"] = "VehicleShop2022Offroader",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 40,
    ["turn_angle"] = 30
}
v2.vehicle_shop_2022_open_top_speeder = {
    ["model_name"] = "VehicleShop2022OpenTopSpeeder",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 30
}
v2.vehicle_shop_2022_sports_bike = {
    ["model_name"] = "VehicleShop2022SportsBike",
    ["acceleration"] = 65,
    ["animation"] = "BikeHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 43,
    ["turn_angle"] = 15
}
v2.vehicle_shop_2022_tandem_bike = {
    ["model_name"] = "VehicleShop2022TandemBike",
    ["acceleration"] = 65,
    ["animation"] = "MotorcycleHandleHold",
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 37,
    ["turn_angle"] = 15
}
v2.white_neon_snowboard = {
    ["model_name"] = "WhiteNeonSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.white_skateboard = {
    ["model_name"] = "SkateboardWhite",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.white_snowboard = {
    ["model_name"] = "WhiteSnowboard",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v2.wing_trunk_car = {
    ["model_name"] = "WingTrunkCar",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 80,
    ["turn_angle"] = 25
}
v2.winter_2021_festive_deliveries_present_truck = {
    ["model_name"] = "FestiveDeliveriesPresentTruck",
    ["acceleration"] = 40,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 20,
    ["max_speed"] = 35,
    ["turn_angle"] = 40
}
v2.winter_2022_candy_snowmobile = {
    ["model_name"] = "Winter2022CandySnowmobile",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 8,
    ["max_speed"] = 42,
    ["turn_angle"] = 15
}
local v4 = {
    ["model_name"] = "Winter2022GiantSnowball",
    ["acceleration"] = 65,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 15,
    ["max_speed"] = 37.5,
    ["movement_animations"] = {
        ["backward"] = "Winter2022GiantSnowballBackward",
        ["forward"] = "Winter2022GiantSnowballForward",
        ["idle"] = "RollerSkatingIdle"
    },
    ["turn_angle"] = 8
}
v2.winter_2022_giant_snowball = v4
v2.winter_2022_husky_drawn_sled = {
    ["model_name"] = "Winter2022HuskyDrawnSled",
    ["acceleration"] = 90,
    ["drift_slowdown"] = 35,
    ["forced_scale"] = "Parents",
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 15,
    ["max_speed"] = 35,
    ["turn_angle"] = 20
}
v2.winter_2022_ice_plane = {
    ["model_name"] = "Winter2022IcePlane",
    ["acceleration"] = 12.5,
    ["drift_slowdown"] = 45,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 7.5,
    ["max_speed"] = 62.5,
    ["turn_angle"] = 10
}
v2.winter_2022_snowblower_toboggan = {
    ["model_name"] = "Winter2022SnowblowerToboggan",
    ["acceleration"] = 90,
    ["drift_slowdown"] = 35,
    ["is_lean_vehicle"] = false,
    ["lean_angle"] = 15,
    ["max_speed"] = 35,
    ["turn_angle"] = 20
}
v2.winter_2022_strawberry_shortcake_unicycle = {
    ["model_name"] = "Winter2022StrawberryShortcakeUnicycle",
    ["acceleration"] = 30,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 20,
    ["max_speed"] = 25,
    ["turn_angle"] = 15
}
v2.witch_caravan = {
    ["model_name"] = "WitchCaravan",
    ["acceleration"] = 80,
    ["drift_slowdown"] = 20,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 10,
    ["max_speed"] = 85,
    ["turn_angle"] = 15
}
v2.wood_skateboard = {
    ["model_name"] = "SkateboardWood",
    ["acceleration"] = 30,
    ["animation"] = "Snowboard",
    ["drift_slowdown"] = 1,
    ["is_lean_vehicle"] = true,
    ["lean_angle"] = 5,
    ["max_speed"] = 35,
    ["turn_angle"] = 18
}
v1.merge("VehicleProperties", {
    ["wheeled"] = v2
}, true)
for _, v5 in v2 do
    v5.vehicle_type = "wheeled"
end
return v2