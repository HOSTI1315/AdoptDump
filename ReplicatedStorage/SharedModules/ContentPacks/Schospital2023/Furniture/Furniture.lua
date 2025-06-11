--// ReplicatedStorage.SharedModules.ContentPacks.Schospital2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["school_refresh_2023_abc_play_fridge"] = {
        ["name"] = "School Play Fridge",
        ["cost"] = 200,
        ["model_name"] = "SchoolRefresh2023ABCPlayFridge",
        ["image_id"] = 12935226760
    },
    ["school_refresh_2023_cubby_storage"] = {
        ["name"] = "School Cubby Storage",
        ["cost"] = 100,
        ["model_name"] = "SchoolRefresh2023CubbyStorage",
        ["image_id"] = 12935226860
    },
    ["school_refresh_2023_desk"] = {
        ["name"] = "School Desk",
        ["cost"] = 45,
        ["model_name"] = "SchoolRefresh2023Desk",
        ["image_id"] = 13413367109
    },
    ["school_refresh_2023_foam_baby_bed"] = {
        ["name"] = "School Baby Bed",
        ["cost"] = 320,
        ["model_name"] = "SchoolRefresh2023FoamBabyBed",
        ["image_id"] = 12935226945
    },
    ["school_refresh_2023_food_tray"] = {
        ["name"] = "School Food Tray",
        ["cost"] = 5,
        ["model_name"] = "SchoolRefresh2023FoodTray",
        ["image_id"] = 12935227034
    },
    ["school_refresh_2023_locker_shower"] = {
        ["name"] = "School Locker Shower",
        ["cost"] = 155,
        ["model_name"] = "SchoolRefresh2023LockerShower",
        ["image_id"] = 12935227143
    },
    ["school_refresh_2023_lunch_table"] = {
        ["name"] = "School Lunch Table",
        ["cost"] = 75,
        ["model_name"] = "SchoolRefresh2023LunchTable",
        ["image_id"] = 12935227229
    },
    ["school_refresh_2023_play_mat"] = {
        ["name"] = "School Play Mat",
        ["cost"] = 21,
        ["model_name"] = "SchoolRefresh2023PlayMat",
        ["image_id"] = 12935262157
    },
    ["school_refresh_2023_sleeping_mat"] = {
        ["name"] = "School Sleep Mat",
        ["cost"] = 55,
        ["model_name"] = "SchoolRefresh2023SleepingMat",
        ["image_id"] = 12935262568
    },
    ["school_refresh_2023_water_fountain"] = {
        ["name"] = "School Water Fountain",
        ["cost"] = 70,
        ["model_name"] = "SchoolRefresh2023WaterFountain",
        ["image_id"] = 12935262354
    },
    ["school_refresh_2023_chalkboard_blue"] = {
        ["name"] = "School Blackboard",
        ["cost"] = 250,
        ["model_name"] = "SchoolRefresh2023ChalkboardBlue",
        ["image_id"] = 13241404564
    },
    ["school_refresh_2023_book"] = {
        ["name"] = "School Book",
        ["cost"] = 5,
        ["model_name"] = "SchoolRefresh2023Book",
        ["image_id"] = 13241154381
    },
    ["school_refresh_2023_bookshelf"] = {
        ["name"] = "School Bookshelf",
        ["cost"] = 150,
        ["model_name"] = "SchoolRefresh2023Bookshelf",
        ["image_id"] = 13241404713
    },
    ["school_refresh_2023_bookshelf_long"] = {
        ["name"] = "School Bookshelf Long",
        ["cost"] = 200,
        ["model_name"] = "SchoolRefresh2023BookshelfLong",
        ["image_id"] = 13241404634
    },
    ["school_refresh_2023_clock"] = {
        ["name"] = "School Clock",
        ["cost"] = 175,
        ["model_name"] = "SchoolRefresh2023Clock",
        ["image_id"] = 13241404484
    },
    ["school_refresh_2023_clock_side"] = {
        ["name"] = "School Wall Clock",
        ["cost"] = 175,
        ["model_name"] = "SchoolRefresh2023ClockSide",
        ["image_id"] = 13241404433
    },
    ["school_refresh_2023_door"] = {
        ["name"] = "School Door",
        ["cost"] = 65,
        ["model_name"] = "SchoolRefresh2023Door",
        ["image_id"] = 13241154856
    },
    ["school_refresh_2023_door_locked"] = {
        ["name"] = "Locked Door",
        ["cost"] = 95,
        ["model_name"] = "SchoolRefresh2023DoorLocked",
        ["image_id"] = 13241154628
    },
    ["school_refresh_2023_monitor"] = {
        ["name"] = "School Monitor",
        ["cost"] = 120,
        ["model_name"] = "SchoolRefresh2023Monitor",
        ["image_id"] = 13241155286
    },
    ["school_refresh_2023_paper"] = {
        ["name"] = "School Paper",
        ["cost"] = 5,
        ["model_name"] = "SchoolRefresh2023Paper",
        ["image_id"] = 13241154108
    },
    ["school_refresh_2023_teachers_desk"] = {
        ["name"] = "Teacher\'s Desk",
        ["cost"] = 225,
        ["model_name"] = "SchoolRefresh2023TeachersDesk",
        ["image_id"] = 13241155055
    },
    ["school_refresh_2023_default_chair"] = {
        ["name"] = "School Chair 1",
        ["model_name"] = "SchoolRefresh2023DefaultChair"
    },
    ["school_refresh_2023_default_chair_2"] = {
        ["name"] = "School Chair 2",
        ["model_name"] = "SchoolRefresh2023DefaultChair2"
    },
    ["school_refresh_2023_default_chair_3"] = {
        ["name"] = "School Chair 3",
        ["model_name"] = "SchoolRefresh2023DefaultChair3"
    },
    ["school_refresh_2023_stylish_chair"] = {
        ["name"] = "School Stylish Chair",
        ["model_name"] = "SchoolRefresh2023StylishChair"
    },
    ["school_refresh_2023_stool"] = {
        ["name"] = "School Stool",
        ["model_name"] = "SchoolRefresh2023Stool"
    },
    ["school_refresh_2023_couch"] = {
        ["name"] = "School Couch 1",
        ["model_name"] = "SchoolRefresh2023Couch"
    },
    ["school_refresh_2023_couch_2"] = {
        ["name"] = "School Couch 2",
        ["model_name"] = "SchoolRefresh2023Couch2"
    },
    ["school_refresh_2023_wooden_chair"] = {
        ["name"] = "Wooden School Chair",
        ["model_name"] = "SchoolRefresh2023WoodenChair"
    },
    ["school_refresh_2023_double_door"] = {
        ["name"] = "School Double Door",
        ["model_name"] = "SchoolRefresh2023DoubleDoor"
    },
    ["school_refresh_2023_laptop"] = {
        ["name"] = "School Laptop",
        ["model_name"] = "SchoolRefresh2023Laptop"
    },
    ["school_refresh_2023_food_bowl_2"] = {
        ["name"] = "School Food Bowl 2",
        ["model_name"] = "SchoolRefresh2023FoodBowl2"
    },
    ["school_refresh_2023_water_bowl_2"] = {
        ["name"] = "School Water Bowl 2",
        ["model_name"] = "SchoolRefresh2023WaterBowl2"
    },
    ["school_refresh_2023_short_blinds"] = {
        ["name"] = "School Short Blinds",
        ["model_name"] = "SchoolRefresh2023ShortBlinds"
    },
    ["school_refresh_2023_chalkboard"] = {
        ["name"] = "School Chalkboard",
        ["model_name"] = "SchoolRefresh2023Chalkboard"
    }
}
local v3 = {
    ["hospital_refresh_2023_bed"] = {
        ["name"] = "Hospital Bed",
        ["cost"] = 270,
        ["model_name"] = "HospitalRefresh2023Bed",
        ["image_id"] = 13008819461
    },
    ["hospital_refresh_2023_cabinet"] = {
        ["name"] = "Hospital Cabinet",
        ["cost"] = 180,
        ["model_name"] = "HospitalRefresh2023Cabinet",
        ["image_id"] = 13008819647
    },
    ["hospital_refresh_2023_crib"] = {
        ["name"] = "Hospital Crib",
        ["cost"] = 190,
        ["model_name"] = "HospitalRefresh2023Crib",
        ["image_id"] = 13008819754
    },
    ["hospital_refresh_2023_food_bowl"] = {
        ["name"] = "Hospital Food Bowl",
        ["cost"] = 205,
        ["model_name"] = "HospitalRefresh2023FoodBowl",
        ["image_id"] = 13008819933
    },
    ["hospital_refresh_2023_fridge"] = {
        ["name"] = "Hospital Fridge",
        ["cost"] = 200,
        ["model_name"] = "HospitalRefresh2023Fridge",
        ["image_id"] = 13008820073
    },
    ["hospital_refresh_2023_light"] = {
        ["name"] = "Hospital Light",
        ["cost"] = 15,
        ["model_name"] = "HospitalRefresh2023Light",
        ["image_id"] = 13008820166
    },
    ["hospital_refresh_2023_pet_bed"] = {
        ["name"] = "Hospital Pet Bed",
        ["cost"] = 150,
        ["model_name"] = "HospitalRefresh2023PetBed",
        ["image_id"] = 13008846667
    },
    ["hospital_refresh_2023_reception_corner"] = {
        ["name"] = "Hospital Reception Desk Corner",
        ["cost"] = 100,
        ["model_name"] = "HospitalRefresh2023ReceptionCorner",
        ["image_id"] = 13008846793
    },
    ["hospital_refresh_2023_reception_end"] = {
        ["name"] = "Hospital Reception Desk End",
        ["cost"] = 100,
        ["model_name"] = "HospitalRefresh2023ReceptionEnd",
        ["image_id"] = 13008846921
    },
    ["hospital_refresh_2023_reception_straight"] = {
        ["name"] = "Hospital Reception Desk Straight",
        ["cost"] = 100,
        ["model_name"] = "HospitalRefresh2023ReceptionStraight",
        ["image_id"] = 13008847010
    },
    ["hospital_refresh_2023_shower"] = {
        ["name"] = "Hospital Shower",
        ["cost"] = 300,
        ["model_name"] = "HospitalRefresh2023Shower",
        ["image_id"] = 13008847104
    },
    ["hospital_refresh_2023_stool"] = {
        ["name"] = "Hospital Stool",
        ["cost"] = 62,
        ["model_name"] = "HospitalRefresh2023Stool",
        ["image_id"] = 13008847227
    },
    ["hospital_refresh_2023_water_bowl"] = {
        ["name"] = "Hospital Water Bowl",
        ["cost"] = 89,
        ["model_name"] = "HospitalRefresh2023WaterBowl",
        ["image_id"] = 13008879436
    },
    ["hospital_refresh_2023_blinds"] = {
        ["name"] = "Hospital Blinds",
        ["cost"] = 200,
        ["model_name"] = "HospitalRefresh2023Blinds",
        ["image_id"] = 13174974416
    },
    ["hospital_refresh_2023_ceiling_light"] = {
        ["name"] = "Hospital Ceiling Light",
        ["cost"] = 20,
        ["model_name"] = "HospitalRefresh2023CeilingLight",
        ["image_id"] = 13174974521
    },
    ["hospital_refresh_2023_door"] = {
        ["name"] = "Hospital Door",
        ["cost"] = 55,
        ["model_name"] = "HospitalRefresh2023Door",
        ["image_id"] = 13174887860
    },
    ["hospital_refresh_2023_double_door"] = {
        ["name"] = "Hospital Double Door",
        ["cost"] = 105,
        ["model_name"] = "HospitalRefresh2023DoubleDoor",
        ["image_id"] = 13183387712
    },
    ["hospital_refresh_2023_logo"] = {
        ["name"] = "Hospital Logo",
        ["cost"] = 70,
        ["model_name"] = "HospitalRefresh2023Logo",
        ["image_id"] = 13174887965
    },
    ["hospital_refresh_2023_pillar"] = {
        ["name"] = "Hospital Pillar",
        ["cost"] = 70,
        ["model_name"] = "HospitalRefresh2023Pillar",
        ["image_id"] = 13174888056
    },
    ["hospital_refresh_2023_potted_bush"] = {
        ["name"] = "Hospital Potted Bush",
        ["cost"] = 100,
        ["model_name"] = "HospitalRefresh2023PottedBush",
        ["image_id"] = 13174974646
    },
    ["hospital_refresh_2023_potted_bush_long"] = {
        ["name"] = "Hospital Potted Bush Long",
        ["cost"] = 100,
        ["model_name"] = "HospitalRefresh2023PottedBushLong",
        ["image_id"] = 13174974587
    },
    ["hospital_refresh_2023_reception_desk"] = {
        ["name"] = "Hospital Reception Desk",
        ["cost"] = 150,
        ["model_name"] = "HospitalRefresh2023ReceptionDesk",
        ["image_id"] = 13174887643
    },
    ["hospital_refresh_2023_tvpillar"] = {
        ["name"] = "Hospital TV Pillar",
        ["cost"] = 90,
        ["model_name"] = "HospitalRefresh2023TVPillar",
        ["image_id"] = 13174974353
    },
    ["hospital_refresh_2023_window"] = {
        ["name"] = "Hospital Window",
        ["cost"] = 100,
        ["model_name"] = "HospitalRefresh2023Window",
        ["image_id"] = 13174887508
    },
    ["hospital_refresh_2023_window_clear"] = {
        ["name"] = "Hospital Window Clear",
        ["cost"] = 100,
        ["model_name"] = "HospitalRefresh2023WindowClear",
        ["image_id"] = 13174974467
    },
    ["hospital_refresh_2023_modern_chair"] = {
        ["name"] = "Hospital Chair 1",
        ["model_name"] = "HospitalRefresh2023ModernChair"
    },
    ["hospital_refresh_2023_default_chair"] = {
        ["name"] = "Hospital Chair 2",
        ["model_name"] = "HospitalRefresh2023DefaultChair"
    },
    ["hospital_refresh_2023_secondary_chair"] = {
        ["name"] = "Hospital Chair 3",
        ["model_name"] = "HospitalRefresh2023SecondaryChair"
    },
    ["hospital_refresh_2023_couch"] = {
        ["name"] = "Hospital Couch",
        ["model_name"] = "HospitalRefresh2023Couch"
    },
    ["hospital_refresh_2023_healing_bed"] = {
        ["name"] = "Hospital Bed",
        ["model_name"] = "HospitalRefresh2023Bed"
    }
}
local v4 = {}
for v5, v6 in v2 do
    if v6.cost then
        v6.tags = { "SchoolRefresh2023" }
    end
    v4[v5] = v6
end
for v7, v8 in v3 do
    if v8.cost then
        v8.tags = { "HospitalRefresh2023" }
    end
    v4[v7] = v8
end
return v1.furniture(v4)