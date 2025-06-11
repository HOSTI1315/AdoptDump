--// ReplicatedStorage.SharedModules.ContentPacks.Racehouse2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = v1("package:Sift")
local v5 = {}
local v6 = {
    ["racehouse_2023_simple_track"] = {
        ["name"] = "Simple Raceway",
        ["cost"] = 1900,
        ["model_name"] = "Racehouse2023SimpleTrack",
        ["image_id"] = 14193556506,
        ["behavior"] = v3.RACETRACK_STARTING_LINE()
    },
    ["racehouse_2023_skillful_track"] = {
        ["name"] = "Skillful Raceway",
        ["cost"] = 2100,
        ["model_name"] = "Racehouse2023SkillfulTrack",
        ["image_id"] = 14193562295,
        ["behavior"] = v3.RACETRACK_STARTING_LINE()
    },
    ["racehouse_2023_complex_track"] = {
        ["name"] = "Complex Raceway",
        ["cost"] = 2700,
        ["model_name"] = "Racehouse2023ComplexTrack",
        ["image_id"] = 14193565201,
        ["behavior"] = v3.RACETRACK_STARTING_LINE()
    }
}
v5.tracks = v6
local v7 = {
    ["racehouse_2023_starting_line_short"] = {
        ["name"] = "Short Starting Line",
        ["cost"] = 1200,
        ["model_name"] = "Racehouse2023StartingLineShort",
        ["image_id"] = 14111557100,
        ["behavior"] = v3.RACETRACK_STARTING_LINE()
    },
    ["racehouse_2023_starting_line_long"] = {
        ["name"] = "Long Starting Line",
        ["cost"] = 1700,
        ["model_name"] = "Racehouse2023StartingLineLong",
        ["image_id"] = 14111524031,
        ["behavior"] = v3.RACETRACK_STARTING_LINE()
    },
    ["racehouse_2023_straight_short"] = {
        ["name"] = "Short Straight",
        ["cost"] = 20,
        ["model_name"] = "Racehouse2023StraightShort",
        ["image_id"] = 14111527501
    },
    ["racehouse_2023_straight_long"] = {
        ["name"] = "Long Straight",
        ["cost"] = 30,
        ["model_name"] = "Racehouse2023StraightLong",
        ["image_id"] = 14111535280
    },
    ["racehouse_2023_corner"] = {
        ["name"] = "Curve",
        ["cost"] = 25,
        ["model_name"] = "Racehouse2023Corner",
        ["image_id"] = 14111539156
    },
    ["racehouse_2023_slope_bottom"] = {
        ["name"] = "Bottom Slope",
        ["cost"] = 40,
        ["model_name"] = "Racehouse2023SlopeBottom",
        ["image_id"] = 14111543188
    },
    ["racehouse_2023_slope_top"] = {
        ["name"] = "Top Slope",
        ["cost"] = 40,
        ["model_name"] = "Racehouse2023SlopeTop",
        ["image_id"] = 14111548923
    },
    ["racehouse_2023_bank_right"] = {
        ["name"] = "Right Bank",
        ["cost"] = 45,
        ["model_name"] = "Racehouse2023BankRight",
        ["image_id"] = 14111554404
    },
    ["racehouse_2023_bank_left"] = {
        ["name"] = "Left Bank",
        ["cost"] = 45,
        ["model_name"] = "Racehouse2023BankLeft",
        ["image_id"] = 14111551552
    },
    ["racehouse_2023_corner_bank_right"] = {
        ["name"] = "Curved Right Bank",
        ["cost"] = 50,
        ["model_name"] = "Racehouse2023BankCornerRight",
        ["image_id"] = 14111506825
    },
    ["racehouse_2023_corner_bank_left"] = {
        ["name"] = "Curved Left Bank",
        ["cost"] = 50,
        ["model_name"] = "Racehouse2023BankCornerLeft",
        ["image_id"] = 14111513980
    },
    ["racehouse_2023_support_short"] = {
        ["name"] = "Short Support Beam",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023SupportShort",
        ["image_id"] = 14111518266
    },
    ["racehouse_2023_support_tall"] = {
        ["name"] = "Tall Support Beam",
        ["cost"] = 12,
        ["model_name"] = "Racehouse2023SupportTall",
        ["image_id"] = 14111531029
    },
    ["racehouse_2023_support_angled_short"] = {
        ["name"] = "Short Angled Support Beam",
        ["cost"] = 8,
        ["model_name"] = "Racehouse2023SupportAngledShort",
        ["image_id"] = 14111521316
    },
    ["racehouse_2023_support_angled_tall"] = {
        ["name"] = "Tall Angled Support Beam",
        ["cost"] = 14,
        ["model_name"] = "Racehouse2023SupportAngledTall",
        ["image_id"] = 14111546146
    },
    ["racehouse_2023_booster_pad"] = {
        ["name"] = "Booster Pad",
        ["cost"] = 88,
        ["model_name"] = "Racehouse2023BoosterPad",
        ["image_id"] = 13978573309,
        ["behavior"] = v3.RACETRACK_BOOSTER_PAD(1.6, 0.45, 0.55, 1.5)
    },
    ["racehouse_2023_booster_pad_wide"] = {
        ["name"] = "Wide Booster Pad",
        ["cost"] = 145,
        ["model_name"] = "Racehouse2023BoosterPadWide",
        ["image_id"] = 13978596470,
        ["behavior"] = v3.RACETRACK_BOOSTER_PAD(1.6, 0.45, 0.55, 1.5)
    }
}
v5.track_parts = v7
local v8 = {
    ["racehouse_2023_bleachers_corner"] = {
        ["name"] = "Corner Section Bleachers",
        ["cost"] = 250,
        ["model_name"] = "Racehouse2023BleachersCorner",
        ["image_id"] = 13978558258
    },
    ["racehouse_2023_bleachers"] = {
        ["name"] = "Straight Section Bleachers",
        ["cost"] = 225,
        ["model_name"] = "Racehouse2023Bleachers",
        ["image_id"] = 13978562250
    },
    ["racehouse_2023_signal_swerve_left"] = {
        ["name"] = "Left Swerve Arrow",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023SignalSwerveLeft",
        ["image_id"] = 13978640712
    },
    ["racehouse_2023_signal_swerve_right"] = {
        ["name"] = "Right Swerve Arrow",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023SignalSwerveRight",
        ["image_id"] = 13978634310
    },
    ["racehouse_2023_floodlight_single"] = {
        ["name"] = "Floodlight",
        ["cost"] = 21,
        ["model_name"] = "Racehouse2023FloodlightSingle",
        ["image_id"] = 13978827501
    },
    ["racehouse_2023_arrow_sign_2"] = {
        ["name"] = "Signal Arrow",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023ArrowSign2",
        ["image_id"] = 13978550647
    },
    ["racehouse_2023_arrow_sign"] = {
        ["name"] = "Signal Arrow Sign",
        ["cost"] = 6,
        ["model_name"] = "Racehouse2023ArrowSign",
        ["image_id"] = 13978565155
    },
    ["racehouse_2023_floodlight_tall"] = {
        ["name"] = "Tall Floodlight",
        ["cost"] = 27,
        ["model_name"] = "Racehouse2023FloodlightTall",
        ["image_id"] = 13978569865
    },
    ["racehouse_2023_floodlight_double"] = {
        ["name"] = "Double Floodlight",
        ["cost"] = 39,
        ["model_name"] = "Racehouse2023FloodlightDouble",
        ["image_id"] = 13978647913
    },
    ["racehouse_2023_signal_arrow"] = {
        ["name"] = "Straight Arrow",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023SignalArrow",
        ["image_id"] = 13978617814
    },
    ["racehouse_2023_signal_turn_left"] = {
        ["name"] = "Left Turn Arrow",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023SignalTurnLeft",
        ["image_id"] = 13978590181
    },
    ["racehouse_2023_signal_turn_right"] = {
        ["name"] = "Right Turn Arrow",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023SignalTurnRight",
        ["image_id"] = 14364312658
    },
    ["racehouse_2023_tire_wall_short"] = {
        ["name"] = "Short Tire Wall",
        ["cost"] = 18,
        ["model_name"] = "Racehouse2023TireWallShort",
        ["image_id"] = 13978631129
    },
    ["racehouse_2023_tire_wall_mid"] = {
        ["name"] = "Mid-Height Tire Wall",
        ["cost"] = 23,
        ["model_name"] = "Racehouse2023TireWallMid",
        ["image_id"] = 13978653371
    },
    ["racehouse_2023_signal_warning"] = {
        ["name"] = "Warning Marking",
        ["cost"] = 7,
        ["model_name"] = "Racehouse2023SignalWarning",
        ["image_id"] = 13978661595
    },
    ["racehouse_2023_tire_wall_long"] = {
        ["name"] = "Long Tire Wall",
        ["cost"] = 32,
        ["model_name"] = "Racehouse2023TireWallLong",
        ["image_id"] = 13978624951
    },
    ["racehouse_2023_scaffold_vertical_tall"] = {
        ["name"] = "Tall Vertical Scaffold",
        ["cost"] = 44,
        ["model_name"] = "Racehouse2023ScaffoldVerticalTall",
        ["image_id"] = 13978650643
    },
    ["racehouse_2023_scaffold_base"] = {
        ["name"] = "Scaffolding Base",
        ["cost"] = 64,
        ["model_name"] = "Racehouse2023ScaffoldBase",
        ["image_id"] = 13978607936
    },
    ["racehouse_2023_scaffold_vertical_mid"] = {
        ["name"] = "Mid-Height Vertical Scaffold",
        ["cost"] = 33,
        ["model_name"] = "Racehouse2023ScaffoldVerticalMid",
        ["image_id"] = 13978611596
    },
    ["racehouse_2023_scaffold_2_way_corner"] = {
        ["name"] = "2 Way Corner Scaffold",
        ["cost"] = 26,
        ["model_name"] = "Racehouse2023Scaffold2WayCorner",
        ["image_id"] = 13978659089
    },
    ["racehouse_2023_scaffold_vertical_short"] = {
        ["name"] = "Short Vertical Scaffold",
        ["cost"] = 22,
        ["model_name"] = "Racehouse2023ScaffoldVerticalShort",
        ["image_id"] = 13978599089
    },
    ["racehouse_2023_fence"] = {
        ["name"] = "Straight Fence",
        ["cost"] = 13,
        ["model_name"] = "Racehouse2023Fence",
        ["image_id"] = 13978586760
    },
    ["racehouse_2023_fence_corner_inner"] = {
        ["name"] = "Inner Corner Fence",
        ["cost"] = 16,
        ["model_name"] = "Racehouse2023FenceCornerInner",
        ["image_id"] = 13978581200
    },
    ["racehouse_2023_fence_corner_outer"] = {
        ["name"] = "Outer Corner Fence",
        ["cost"] = 16,
        ["model_name"] = "Racehouse2023FenceCornerOuter",
        ["image_id"] = 13978637104
    },
    ["racehouse_2023_scaffold_3_way_corner"] = {
        ["name"] = "3 Way Corner Scaffold",
        ["cost"] = 28,
        ["model_name"] = "Racehouse2023Scaffold3WayCorner",
        ["image_id"] = 13978628476
    },
    ["racehouse_2023_scaffold_horizontal_short"] = {
        ["name"] = "Short Horizontal Scaffold",
        ["cost"] = 22,
        ["model_name"] = "Racehouse2023ScaffoldHorizontalShort",
        ["image_id"] = 13978604204
    },
    ["racehouse_2023_scaffold_horizontal_mid"] = {
        ["name"] = "Horizontal Mid-Height Scaffold",
        ["cost"] = 33,
        ["model_name"] = "Racehouse2023ScaffoldHorizontalMid",
        ["image_id"] = 13978621259
    },
    ["racehouse_2023_scaffold_horizontal_long"] = {
        ["name"] = "Horizontal Long Scaffold",
        ["cost"] = 44,
        ["model_name"] = "Racehouse2023ScaffoldHorizontalLong",
        ["image_id"] = 13978576849
    }
}
v5.exterior = v8
local v9 = {
    ["racehouse_2023_food_bowl"] = {
        ["name"] = "Tire Food Bowl",
        ["cost"] = 66,
        ["model_name"] = "Racehouse2023FoodBowl",
        ["image_id"] = 13978476983
    },
    ["racehouse_2023_water_bowl"] = {
        ["name"] = "Tire Water Bowl",
        ["cost"] = 66,
        ["model_name"] = "Racehouse2023WaterBowl",
        ["image_id"] = 13978474146
    },
    ["racehouse_2023_fridge"] = {
        ["name"] = "Race Car Fridge",
        ["cost"] = 87,
        ["model_name"] = "Racehouse2023Fridge",
        ["image_id"] = 13978483236
    },
    ["racehouse_2023_shower"] = {
        ["name"] = "Tire Wall Shower",
        ["cost"] = 160,
        ["model_name"] = "Racehouse2023Shower",
        ["image_id"] = 13978505220
    },
    ["racehouse_2023_pet_bed"] = {
        ["name"] = "Tire Pile Pet Bed",
        ["cost"] = 152,
        ["model_name"] = "Racehouse2023PetBed",
        ["image_id"] = 13978465666
    },
    ["racehouse_2023_table"] = {
        ["name"] = "Engine Block Table",
        ["cost"] = 47,
        ["model_name"] = "Racehouse2023Table",
        ["image_id"] = 13978480276
    },
    ["racehouse_2023_bed"] = {
        ["name"] = "Sports Car Bed",
        ["cost"] = 260,
        ["model_name"] = "Racehouse2023Bed",
        ["image_id"] = 13978458277
    },
    ["racehouse_2023_crib"] = {
        ["name"] = "Racing Buggy Crib",
        ["cost"] = 255,
        ["model_name"] = "Racehouse2023Crib",
        ["image_id"] = 13978501883
    },
    ["racehouse_2023_sofa"] = {
        ["name"] = "Sports Car Sofa",
        ["cost"] = 160,
        ["model_name"] = "Racehouse2023Sofa",
        ["image_id"] = 13978508836
    },
    ["racehouse_2023_light"] = {
        ["name"] = "Tire Ceiling Light",
        ["cost"] = 37,
        ["model_name"] = "Racehouse2023Light",
        ["image_id"] = 13978498382
    }
}
v5.interior = v9
local v10 = {
    ["racehouse_2023_simple_tree"] = {
        ["name"] = "Bio Tree",
        ["model_name"] = "Racehouse2023SimpleTree",
        ["image_id"] = 0,
        ["cost"] = 1
    },
    ["racehouse_2023_wizard_tree"] = {
        ["name"] = "Large Curved Tree",
        ["model_name"] = "Racehouse2023WizardTree",
        ["image_id"] = 0,
        ["cost"] = 1
    },
    ["racehouse_2023_square_tree"] = {
        ["name"] = "Large Square Tree",
        ["model_name"] = "Racehouse2023SquareTree",
        ["image_id"] = 0,
        ["cost"] = 1
    }
}
v5.trees = v10
local v11 = {}
for v12, v13 in v5 do
    for _, v14 in v13 do
        v14.tags = { "Racehouse2023", v12 }
    end
    v11 = v4.Dictionary.merge(v11, v13)
end
return v2.furniture(v11)