--// ReplicatedStorage.SharedModules.ContentPacks.SandboxIsland2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["stairs_curved_v2_reverse_plain"] = {
        ["name"] = "Narrow Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2ReversePlain",
        ["image_id"] = 8777265334
    },
    ["triangle_frame_tall_v2_brick"] = {
        ["name"] = "Medium 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV2Brick",
        ["image_id"] = 8776665211
    },
    ["floor_long1_brick"] = {
        ["name"] = "Long Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong1Brick",
        ["image_id"] = 8776593334
    },
    ["stairs_curved_v1_stone"] = {
        ["name"] = "Wide 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1Stone",
        ["image_id"] = 8777453443
    },
    ["wedge_short_v3_glass"] = {
        ["name"] = "Small 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV3Glass",
        ["image_id"] = 8777104402
    },
    ["floor_half1_brick"] = {
        ["name"] = "Half Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorHalf1Brick",
        ["image_id"] = 8776592967
    },
    ["floor_long2_glass"] = {
        ["name"] = "Quarter Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong2Glass",
        ["image_id"] = 8776766467
    },
    ["cube_stone"] = {
        ["name"] = "Medium Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeStone",
        ["image_id"] = 8777395598
    },
    ["bevelled_cylinderv1_brick"] = {
        ["name"] = "Large Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv1Brick",
        ["image_id"] = 8776534081
    },
    ["triangle_frame_tall_v3_brick"] = {
        ["name"] = "Small 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV3Brick",
        ["image_id"] = 8776665378
    },
    ["round_wall_v1_plain"] = {
        ["name"] = "Large Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV1Plain",
        ["image_id"] = 8784387715
    },
    ["roof_low_v1_glass"] = {
        ["name"] = "Straight Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV1Glass",
        ["image_id"] = 8776779740
    },
    ["archway_triangular_brick"] = {
        ["name"] = "Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularBrick",
        ["image_id"] = 8776533521
    },
    ["triangle_frame_short_v2_plain"] = {
        ["name"] = "Medium 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV2Plain",
        ["image_id"] = 8777293608
    },
    ["door_cutout_large_glass"] = {
        ["name"] = "Large Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutLargeGlass",
        ["image_id"] = 8776751825
    },
    ["trim_v2_bottom_plain"] = {
        ["name"] = "Bull Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV2BottomPlain",
        ["image_id"] = 8777308301
    },
    ["sphere_v1_plain"] = {
        ["name"] = "Large Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV1Plain",
        ["image_id"] = 8777250369
    },
    ["sphere_v1_glass"] = {
        ["name"] = "Large Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV1Glass",
        ["image_id"] = 8777032281
    },
    ["trim_v3_top_wood"] = {
        ["name"] = "Edward Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV3TopWood",
        ["image_id"] = 8782451868
    },
    ["wedge_tall_v1_brick"] = {
        ["name"] = "Large 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV1Brick",
        ["image_id"] = 8776695487
    },
    ["roof_low_v1_brick"] = {
        ["name"] = "Straight Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV1Brick",
        ["image_id"] = 8776608409
    },
    ["stairs_curved_v3_stone"] = {
        ["name"] = "Wide 180\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3Stone",
        ["image_id"] = 8777453954
    },
    ["door_cutout_large_plain"] = {
        ["name"] = "Large Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutLargePlain",
        ["image_id"] = 8777205399
    },
    ["torus_v3_plain"] = {
        ["name"] = "Small Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV3Plain",
        ["image_id"] = 8777280415
    },
    ["door_cutout_large_stone"] = {
        ["name"] = "Large Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutLargeStone",
        ["image_id"] = 8777396058
    },
    ["triangle_frame_short_v1_plain"] = {
        ["name"] = "Large 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV1Plain",
        ["image_id"] = 8777280504
    },
    ["stairs_curved_v1_plain"] = {
        ["name"] = "Wide 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1Plain",
        ["image_id"] = 8777265005
    },
    ["round_w_indow_frame_v1_stone"] = {
        ["name"] = "Quarter Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022RoundWIndowFrameV1Stone",
        ["image_id"] = 8777499797
    },
    ["stairs_v2_glass"] = {
        ["name"] = "Medium Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV2Glass",
        ["image_id"] = 8777059454
    },
    ["bevelled_block_plain"] = {
        ["name"] = "Medium Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockPlain",
        ["image_id"] = 8777177303
    },
    ["door_cutout_large_wood"] = {
        ["name"] = "Large Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutLargeWood",
        ["image_id"] = 8777621589
    },
    ["wedge_short_v1_stone"] = {
        ["name"] = "Large 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV1Stone",
        ["image_id"] = 8777513461
    },
    ["triangle_w_indow_frame_v1_wood"] = {
        ["name"] = "Triangular Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022TriangleWIndowFrameV1Wood",
        ["image_id"] = 8782451969
    },
    ["floor_long2_brick"] = {
        ["name"] = "Quarter Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong2Brick",
        ["image_id"] = 8776593427
    },
    ["roof_square_glass"] = {
        ["name"] = "Flat Point Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofSquareGlass",
        ["image_id"] = 8777032189
    },
    ["beam_v1_plain"] = {
        ["name"] = "Rectangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV1Plain",
        ["image_id"] = 8777161204
    },
    ["floor_long2_plain"] = {
        ["name"] = "Quarter Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong2Plain",
        ["image_id"] = 8777235298
    },
    ["trim_v2_bottom_brick"] = {
        ["name"] = "Bull Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV2BottomBrick",
        ["image_id"] = 8776681043
    },
    ["column_v1_stone"] = {
        ["name"] = "Square Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV1Stone",
        ["image_id"] = 8777368119
    },
    ["wall_double_wood"] = {
        ["name"] = "Double Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallDoubleWood",
        ["image_id"] = 8782452073
    },
    ["roof_low_v3_brick"] = {
        ["name"] = "Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV3Brick",
        ["image_id"] = 8776608653
    },
    ["roof_square_plain"] = {
        ["name"] = "Flat Point Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofSquarePlain",
        ["image_id"] = 8777250252
    },
    ["wedge_tall_v2_wood"] = {
        ["name"] = "Medium 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV2Wood",
        ["image_id"] = 8782460225
    },
    ["bevelled_cylinderv2_glass"] = {
        ["name"] = "Medium Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv2Glass",
        ["image_id"] = 8776725111
    },
    ["roof_flat_plain"] = {
        ["name"] = "Flat Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofFlatPlain",
        ["image_id"] = 8777235734
    },
    ["column_v1_wood"] = {
        ["name"] = "Square Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV1Wood",
        ["image_id"] = 8777592615
    },
    ["stairs_curved_v1_reverse_brick"] = {
        ["name"] = "Wide 90\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1ReverseBrick",
        ["image_id"] = 8776622750
    },
    ["stairs_curved_v2_brick"] = {
        ["name"] = "Narrow 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2Brick",
        ["image_id"] = 8776622867
    },
    ["floor_half1_stone"] = {
        ["name"] = "Half Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorHalf1Stone",
        ["image_id"] = 8777409398
    },
    ["roof_high_v2_wood"] = {
        ["name"] = "Straight Tall Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV2Wood",
        ["image_id"] = 8777653385
    },
    ["beam_v1_stone"] = {
        ["name"] = "Rectangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV1Stone",
        ["image_id"] = 8777340243
    },
    ["wedge_tall_v3_brick"] = {
        ["name"] = "Small 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV3Brick",
        ["image_id"] = 8776695683
    },
    ["round_wall_v3_glass"] = {
        ["name"] = "Small Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV3Glass",
        ["image_id"] = 8783678015
    },
    ["triangle_w_indow_frame_v1_plain"] = {
        ["name"] = "Triangular Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022TriangleWIndowFrameV1Plain",
        ["image_id"] = 8777308996
    },
    ["cube_double_glass"] = {
        ["name"] = "Large Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeDoubleGlass",
        ["image_id"] = 8776737206
    },
    ["bevelled_cylinderv2_wood"] = {
        ["name"] = "Medium Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv2Wood",
        ["image_id"] = 8777592460
    },
    ["rectangular_prism_double_stone"] = {
        ["name"] = "Large Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismDoubleStone",
        ["image_id"] = 8777423523
    },
    ["round_wall_v1_wood"] = {
        ["name"] = "Large Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV1Wood",
        ["image_id"] = 8783690791
    },
    ["door_cutout_rounded_large_plain"] = {
        ["name"] = "Large Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedLargePlain",
        ["image_id"] = 8777218888
    },
    ["stairs_v3_stone"] = {
        ["name"] = "Large Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV3Stone",
        ["image_id"] = 8777469863
    },
    ["trim_v3_top_brick"] = {
        ["name"] = "Edward Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV3TopBrick",
        ["image_id"] = 8776681385
    },
    ["round_w_indow_frame_v1_plain"] = {
        ["name"] = "Quarter Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022RoundWIndowFrameV1Plain",
        ["image_id"] = 8777308799
    },
    ["wedge_tall_v3_wood"] = {
        ["name"] = "Small 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV3Wood",
        ["image_id"] = 8782460257
    },
    ["door_cutout_triangular_large_plain"] = {
        ["name"] = "Large Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularLargePlain",
        ["image_id"] = 8777219134
    },
    ["trim_v3_bottom_stone"] = {
        ["name"] = "Edward Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV3BottomStone",
        ["image_id"] = 8777499607
    },
    ["roof_square_brick"] = {
        ["name"] = "Flat Point Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofSquareBrick",
        ["image_id"] = 8776608918
    },
    ["cylinder_v3_glass"] = {
        ["name"] = "Small Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV3Glass",
        ["image_id"] = 8776751612
    },
    ["floor_long2_wood"] = {
        ["name"] = "Quarter Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong2Wood",
        ["image_id"] = 8777638646
    },
    ["trim_v1_top_wood"] = {
        ["name"] = "Torus Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV1TopWood",
        ["image_id"] = 8777738014
    },
    ["trim_v2_top_plain"] = {
        ["name"] = "Bull Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV2TopPlain",
        ["image_id"] = 8777308400
    },
    ["torus_v1_wood"] = {
        ["name"] = "Large Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV1Wood",
        ["image_id"] = 8777697973
    },
    ["beam_v1_wood"] = {
        ["name"] = "Rectangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV1Wood",
        ["image_id"] = 8777560834
    },
    ["trim_v2_bottom_stone"] = {
        ["name"] = "Bull Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV2BottomStone",
        ["image_id"] = 8777499430
    },
    ["torus_v3_brick"] = {
        ["name"] = "Small Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV3Brick",
        ["image_id"] = 8776651347
    },
    ["archway_rounded_glass"] = {
        ["name"] = "Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedGlass",
        ["image_id"] = 8776710929
    },
    ["cube_plain"] = {
        ["name"] = "Medium Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubePlain",
        ["image_id"] = 8777204724
    },
    ["bevelled_cylinderv3_plain"] = {
        ["name"] = "Small Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv3Plain",
        ["image_id"] = 8777190632
    },
    ["wall_short_glass"] = {
        ["name"] = "Half Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallShortGlass",
        ["image_id"] = 8782431708
    },
    ["trim_v2_top_glass"] = {
        ["name"] = "Bull Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV2TopGlass",
        ["image_id"] = 8777088269
    },
    ["trim_v1_top_plain"] = {
        ["name"] = "Torus Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV1TopPlain",
        ["image_id"] = 8777294296
    },
    ["floor_double_wood"] = {
        ["name"] = "Double Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorDoubleWood",
        ["image_id"] = 8777638116
    },
    ["trim_v1_top_glass"] = {
        ["name"] = "Torus Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV1TopGlass",
        ["image_id"] = 8777074624
    },
    ["triangle_frame_short_v2_stone"] = {
        ["name"] = "Medium 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV2Stone",
        ["image_id"] = 8777484829
    },
    ["trim_v1_top_stone"] = {
        ["name"] = "Torus Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV1TopStone",
        ["image_id"] = 8777485435
    },
    ["bevelled_cylinderv3_glass"] = {
        ["name"] = "Small Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv3Glass",
        ["image_id"] = 8776725202
    },
    ["stairs_curved_v2_glass"] = {
        ["name"] = "Narrow 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2Glass",
        ["image_id"] = 8777046336
    },
    ["cone_v3_stone"] = {
        ["name"] = "Small Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV3Stone",
        ["image_id"] = 8777381720
    },
    ["stairs_curved_v3_reverse_brick"] = {
        ["name"] = "Wide 180\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3ReverseBrick",
        ["image_id"] = 8776637258
    },
    ["stairs_curved_v3_reverse_plain"] = {
        ["name"] = "Wide 180\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3ReversePlain",
        ["image_id"] = 8777279780
    },
    ["column_v1_plain"] = {
        ["name"] = "Square Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV1Plain",
        ["image_id"] = 8777190704
    },
    ["trim_v1_bottom_plain"] = {
        ["name"] = "Torus Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV1BottomPlain",
        ["image_id"] = 8777294229
    },
    ["triangle_frame_short_v3_stone"] = {
        ["name"] = "Small 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV3Stone",
        ["image_id"] = 8777484920
    },
    ["stairs_curved_v3_reverse_stone"] = {
        ["name"] = "Wide 180\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3ReverseStone",
        ["image_id"] = 8777469541
    },
    ["cube_double_stone"] = {
        ["name"] = "Large Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeDoubleStone",
        ["image_id"] = 8777381794
    },
    ["column_v3_wood"] = {
        ["name"] = "Ionic Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV3Wood",
        ["image_id"] = 8777592739
    },
    ["sphere_v3_brick"] = {
        ["name"] = "Small Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV3Brick",
        ["image_id"] = 8776622572
    },
    ["stairs_curved_v1_reverse_plain"] = {
        ["name"] = "Wide 90\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1ReversePlain",
        ["image_id"] = 8777265109
    },
    ["sphere_v3_plain"] = {
        ["name"] = "Small Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV3Plain",
        ["image_id"] = 8777264901
    },
    ["sphere_v3_glass"] = {
        ["name"] = "Small Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV3Glass",
        ["image_id"] = 8777032523
    },
    ["door_cutout_rounded_wood"] = {
        ["name"] = "Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedWood",
        ["image_id"] = 8777621739
    },
    ["cone_v2_plain"] = {
        ["name"] = "Medium Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV2Plain",
        ["image_id"] = 8777191066
    },
    ["stairs_curved_v2_reverse_glass"] = {
        ["name"] = "Narrow Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2ReverseGlass",
        ["image_id"] = 8777046482
    },
    ["cone_v2_stone"] = {
        ["name"] = "Medium Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV2Stone",
        ["image_id"] = 8777381647
    },
    ["triangle_frame_tall_v1_plain"] = {
        ["name"] = "Large 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV1Plain",
        ["image_id"] = 8777293834
    },
    ["sphere_v3_stone"] = {
        ["name"] = "Small Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV3Stone",
        ["image_id"] = 8777453369
    },
    ["stairs_curved_v3_glass"] = {
        ["name"] = "Wide 180\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3Glass",
        ["image_id"] = 8777046596
    },
    ["triangle_frame_short_v3_plain"] = {
        ["name"] = "Small 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV3Plain",
        ["image_id"] = 8777293702
    },
    ["door_cutout_glass"] = {
        ["name"] = "Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutGlass",
        ["image_id"] = 8776751705
    },
    ["roof_high_v3_brick"] = {
        ["name"] = "Tall Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV3Brick",
        ["image_id"] = 8776608300
    },
    ["roof_low_v1_plain"] = {
        ["name"] = "Straight Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV1Plain",
        ["image_id"] = 8777249695
    },
    ["sphere_v1_stone"] = {
        ["name"] = "Large Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV1Stone",
        ["image_id"] = 8777453183
    },
    ["triangle_frame_short_v1_stone"] = {
        ["name"] = "Large 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV1Stone",
        ["image_id"] = 8777484736
    },
    ["door_cutout_rounded_glass"] = {
        ["name"] = "Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedGlass",
        ["image_id"] = 8776751923
    },
    ["beam_v1_glass"] = {
        ["name"] = "Rectangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV1Glass",
        ["image_id"] = 8776710441
    },
    ["bevelled_block_half_glass"] = {
        ["name"] = "Small Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockHalfGlass",
        ["image_id"] = 8776724792
    },
    ["wedge_tall_v2_stone"] = {
        ["name"] = "Medium 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV2Stone",
        ["image_id"] = 8777513776
    },
    ["roof_flat_stone"] = {
        ["name"] = "Flat Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofFlatStone",
        ["image_id"] = 8777437835
    },
    ["stairs_curved_v2_plain"] = {
        ["name"] = "Narrow 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2Plain",
        ["image_id"] = 8777265207
    },
    ["stairs_v1_glass"] = {
        ["name"] = "Small Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV1Glass",
        ["image_id"] = 8777059384
    },
    ["bevelled_block_glass"] = {
        ["name"] = "Medium Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockGlass",
        ["image_id"] = 8776724952
    },
    ["torus_v2_glass"] = {
        ["name"] = "Medium Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV2Glass",
        ["image_id"] = 8777059758
    },
    ["rectangular_prism_brick"] = {
        ["name"] = "Medium Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismBrick",
        ["image_id"] = 8776607742
    },
    ["archway_rounded_large_stone"] = {
        ["name"] = "Large Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedLargeStone",
        ["image_id"] = 8777354339
    },
    ["triangle_frame_tall_v3_glass"] = {
        ["name"] = "Small 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV3Glass",
        ["image_id"] = 8777074302
    },
    ["archway_large_glass"] = {
        ["name"] = "Large Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayLargeGlass",
        ["image_id"] = 8776710784
    },
    ["roof_low_v2_plain"] = {
        ["name"] = "Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV2Plain",
        ["image_id"] = 8777249817
    },
    ["door_cutout_rounded_stone"] = {
        ["name"] = "Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedStone",
        ["image_id"] = 8777408852
    },
    ["square_w_indow_frame_v1_glass"] = {
        ["name"] = "Square Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022SquareWIndowFrameV1Glass",
        ["image_id"] = 8777088772
    },
    ["rectangular_prism_wood"] = {
        ["name"] = "Medium Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismWood",
        ["image_id"] = 8777652934
    },
    ["stairs_v3_plain"] = {
        ["name"] = "Large Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV3Plain",
        ["image_id"] = 8777280047
    },
    ["archway_triangular_wood"] = {
        ["name"] = "Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularWood",
        ["image_id"] = 8777576169
    },
    ["archway_triangular_large_stone"] = {
        ["name"] = "Large Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularLargeStone",
        ["image_id"] = 8777354476
    },
    ["torus_v1_glass"] = {
        ["name"] = "Large Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV1Glass",
        ["image_id"] = 8777059648
    },
    ["archway_rounded_large_plain"] = {
        ["name"] = "Large Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedLargePlain",
        ["image_id"] = 8777176949
    },
    ["rectangular_prism_plain"] = {
        ["name"] = "Medium Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismPlain",
        ["image_id"] = 8777235659
    },
    ["wedge_tall_v3_stone"] = {
        ["name"] = "Small 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV3Stone",
        ["image_id"] = 8777513930
    },
    ["rectangular_prism_glass"] = {
        ["name"] = "Medium Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismGlass",
        ["image_id"] = 8776779126
    },
    ["archway_large_stone"] = {
        ["name"] = "Large Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayLargeStone",
        ["image_id"] = 8777354188
    },
    ["rectangular_prism_stone"] = {
        ["name"] = "Medium Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismStone",
        ["image_id"] = 8777423769
    },
    ["column_v1_brick"] = {
        ["name"] = "Square Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV1Brick",
        ["image_id"] = 8776534555
    },
    ["wall_wood"] = {
        ["name"] = "Medium Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallWood",
        ["image_id"] = 8782459892
    },
    ["wall_brick"] = {
        ["name"] = "Medium Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallBrick",
        ["image_id"] = 8834173133
    },
    ["door_cutout_triangular_large_brick"] = {
        ["name"] = "Large Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularLargeBrick",
        ["image_id"] = 8776578675
    },
    ["wall_plain"] = {
        ["name"] = "Medium Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallPlain",
        ["image_id"] = 8782432170
    },
    ["stairs_v2_stone"] = {
        ["name"] = "Medium Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV2Stone",
        ["image_id"] = 8777469747
    },
    ["wall_glass"] = {
        ["name"] = "Medium Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallGlass",
        ["image_id"] = 8782431659
    },
    ["bevelled_block_double_glass"] = {
        ["name"] = "Large Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockDoubleGlass",
        ["image_id"] = 8776724695
    },
    ["cone_v3_brick"] = {
        ["name"] = "Small Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV3Brick",
        ["image_id"] = 8776548713
    },
    ["stairs_curved_v2_stone"] = {
        ["name"] = "Narrow 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2Stone",
        ["image_id"] = 8777453634
    },
    ["wall_stone"] = {
        ["name"] = "Medium Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallStone",
        ["image_id"] = 8782442382
    },
    ["beam_v3_stone"] = {
        ["name"] = "Cylindrical Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV3Stone",
        ["image_id"] = 8777340520
    },
    ["bevelled_cylinderv3_stone"] = {
        ["name"] = "Small Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv3Stone",
        ["image_id"] = 8777368019
    },
    ["archway_triangular_large_wood"] = {
        ["name"] = "Large Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularLargeWood",
        ["image_id"] = 8777576276
    },
    ["trim_v2_top_stone"] = {
        ["name"] = "Bull Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV2TopStone",
        ["image_id"] = 8777499504
    },
    ["floor_brick"] = {
        ["name"] = "Medium Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorBrick",
        ["image_id"] = 8776593224
    },
    ["floor_plain"] = {
        ["name"] = "Medium Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorPlain",
        ["image_id"] = 8777235042
    },
    ["wedge_tall_v1_wood"] = {
        ["name"] = "Large 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV1Wood",
        ["image_id"] = 8783731432
    },
    ["archway_wood"] = {
        ["name"] = "Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayWood",
        ["image_id"] = 8777575714
    },
    ["round_wall_v1_stone"] = {
        ["name"] = "Large Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV1Stone",
        ["image_id"] = 8783690479
    },
    ["floor_glass"] = {
        ["name"] = "Medium Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorGlass",
        ["image_id"] = 8776766234
    },
    ["beam_v2_plain"] = {
        ["name"] = "Triangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV2Plain",
        ["image_id"] = 8777161370
    },
    ["cone_v1_wood"] = {
        ["name"] = "Large Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV1Wood",
        ["image_id"] = 8777607316
    },
    ["archway_stone"] = {
        ["name"] = "Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayStone",
        ["image_id"] = 8777354058
    },
    ["floor_stone"] = {
        ["name"] = "Medium Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorStone",
        ["image_id"] = 8777423118
    },
    ["roof_high_v1_plain"] = {
        ["name"] = "Tall Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV1Plain",
        ["image_id"] = 8777235878
    },
    ["torus_v3_glass"] = {
        ["name"] = "Small Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV3Glass",
        ["image_id"] = 8777059902
    },
    ["wedge_short_v3_stone"] = {
        ["name"] = "Small 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV3Stone",
        ["image_id"] = 8777513630
    },
    ["trim_v1_bottom_stone"] = {
        ["name"] = "Torus Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV1BottomStone",
        ["image_id"] = 8777485350
    },
    ["roof_high_v2_brick"] = {
        ["name"] = "Straight Tall Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV2Brick",
        ["image_id"] = 8776608185
    },
    ["round_wall_v3_wood"] = {
        ["name"] = "Small Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV3Wood",
        ["image_id"] = 8783691003
    },
    ["stairs_curved_v2_reverse_brick"] = {
        ["name"] = "Narrow Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2ReverseBrick",
        ["image_id"] = 8776637027
    },
    ["roof_high_v2_glass"] = {
        ["name"] = "Straight Tall Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV2Glass",
        ["image_id"] = 8776779501
    },
    ["floor_half1_glass"] = {
        ["name"] = "Half Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorHalf1Glass",
        ["image_id"] = 8776765970
    },
    ["trim_v3_top_glass"] = {
        ["name"] = "Edward Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV3TopGlass",
        ["image_id"] = 8777088574
    },
    ["column_v2_stone"] = {
        ["name"] = "Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV2Stone",
        ["image_id"] = 8777368200
    },
    ["door_cutout_large_brick"] = {
        ["name"] = "Large Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutLargeBrick",
        ["image_id"] = 8776578250
    },
    ["column_v3_brick"] = {
        ["name"] = "Ionic Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV3Brick",
        ["image_id"] = 8776548293
    },
    ["roof_high_v2_plain"] = {
        ["name"] = "Straight Tall Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV2Plain",
        ["image_id"] = 8777236047
    },
    ["bevelled_block_wood"] = {
        ["name"] = "Medium Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockWood",
        ["image_id"] = 8777592237
    },
    ["cylinder_v2_glass"] = {
        ["name"] = "Medium Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV2Glass",
        ["image_id"] = 8776751477
    },
    ["round_wall_v3_brick"] = {
        ["name"] = "Small Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV3Brick",
        ["image_id"] = 8784378779
    },
    ["archway_large_wood"] = {
        ["name"] = "Large Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayLargeWood",
        ["image_id"] = 8777575861
    },
    ["archway_triangular_stone"] = {
        ["name"] = "Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularStone",
        ["image_id"] = 8777354411
    },
    ["stairs_curved_v3_plain"] = {
        ["name"] = "Wide 180\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3Plain",
        ["image_id"] = 8777265435
    },
    ["rectangular_prism_double_brick"] = {
        ["name"] = "Large Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismDoubleBrick",
        ["image_id"] = 8776593553
    },
    ["round_wall_v3_stone"] = {
        ["name"] = "Small Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV3Stone",
        ["image_id"] = 8783690715
    },
    ["roof_square_stone"] = {
        ["name"] = "Flat Point Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofSquareStone",
        ["image_id"] = 8782442157
    },
    ["wall_tall_glass"] = {
        ["name"] = "Tall Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallTallGlass",
        ["image_id"] = 8782431800
    },
    ["bevelled_cylinderv1_stone"] = {
        ["name"] = "Large Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv1Stone",
        ["image_id"] = 8777367817
    },
    ["torus_v3_wood"] = {
        ["name"] = "Small Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV3Wood",
        ["image_id"] = 8777698165
    },
    ["bevelled_cylinderv2_plain"] = {
        ["name"] = "Medium Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv2Plain",
        ["image_id"] = 8777190566
    },
    ["bevelled_cylinderv2_stone"] = {
        ["name"] = "Medium Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv2Stone",
        ["image_id"] = 8777367896
    },
    ["trim_v1_bottom_wood"] = {
        ["name"] = "Torus Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV1BottomWood",
        ["image_id"] = 8777713677
    },
    ["bevelled_block_half_brick"] = {
        ["name"] = "Small Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockHalfBrick",
        ["image_id"] = 8776533814
    },
    ["round_w_indow_frame_v1_glass"] = {
        ["name"] = "Quarter Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022RoundWIndowFrameV1Glass",
        ["image_id"] = 8777088651
    },
    ["cube_double_wood"] = {
        ["name"] = "Large Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeDoubleWood",
        ["image_id"] = 8777607603
    },
    ["roof_low_v2_wood"] = {
        ["name"] = "Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV2Wood",
        ["image_id"] = 8777653667
    },
    ["roof_low_v2_brick"] = {
        ["name"] = "Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV2Brick",
        ["image_id"] = 8776608541
    },
    ["wedge_tall_v3_glass"] = {
        ["name"] = "Small 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV3Glass",
        ["image_id"] = 8777104639
    },
    ["sphere_v2_glass"] = {
        ["name"] = "Medium Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV2Glass",
        ["image_id"] = 8777032404
    },
    ["roof_high_v3_stone"] = {
        ["name"] = "Tall Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV3Stone",
        ["image_id"] = 8777438223
    },
    ["cone_v2_brick"] = {
        ["name"] = "Medium Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV2Brick",
        ["image_id"] = 8776548617
    },
    ["wedge_short_v3_plain"] = {
        ["name"] = "Small 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV3Plain",
        ["image_id"] = 8777323554
    },
    ["stairs_curved_v3_reverse_wood"] = {
        ["name"] = "Wide 180\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3ReverseWood",
        ["image_id"] = 8777682640
    },
    ["door_cutout_triangular_wood"] = {
        ["name"] = "Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularWood",
        ["image_id"] = 8777621996
    },
    ["wall_short_plain"] = {
        ["name"] = "Half Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallShortPlain",
        ["image_id"] = 8782432234
    },
    ["sphere_v1_wood"] = {
        ["name"] = "Large Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV1Wood",
        ["image_id"] = 8782451662
    },
    ["wall_tall_brick"] = {
        ["name"] = "Tall Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallTallBrick",
        ["image_id"] = 8834173402
    },
    ["trim_v2_bottom_wood"] = {
        ["name"] = "Bull Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV2BottomWood",
        ["image_id"] = 8783731323
    },
    ["round_wall_v2_wood"] = {
        ["name"] = "Medium Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV2Wood",
        ["image_id"] = 8783690885
    },
    ["roof_flat_wood"] = {
        ["name"] = "Flat Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofFlatWood",
        ["image_id"] = 8777653073
    },
    ["triangle_frame_short_v1_wood"] = {
        ["name"] = "Large 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV1Wood",
        ["image_id"] = 8777698259
    },
    ["roof_flat_brick"] = {
        ["name"] = "Flat Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofFlatBrick",
        ["image_id"] = 8776607855
    },
    ["floor_long2_stone"] = {
        ["name"] = "Quarter Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong2Stone",
        ["image_id"] = 8777423390
    },
    ["rectangular_prism_double_glass"] = {
        ["name"] = "Large Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismDoubleGlass",
        ["image_id"] = 8776766534
    },
    ["door_cutout_triangular_glass"] = {
        ["name"] = "Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularGlass",
        ["image_id"] = 8776765634
    },
    ["torus_v1_stone"] = {
        ["name"] = "Large Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV1Stone",
        ["image_id"] = 8777469963
    },
    ["bevelled_block_double_brick"] = {
        ["name"] = "Large Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockDoubleBrick",
        ["image_id"] = 8776533689
    },
    ["bevelled_block_brick"] = {
        ["name"] = "Medium Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockBrick",
        ["image_id"] = 8776533970
    },
    ["stairs_curved_v1_reverse_wood"] = {
        ["name"] = "Wide 90\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1ReverseWood",
        ["image_id"] = 8777682277
    },
    ["round_wall_v2_glass"] = {
        ["name"] = "Medium Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV2Glass",
        ["image_id"] = 8783677915
    },
    ["round_wall_v3_plain"] = {
        ["name"] = "Small Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV3Plain",
        ["image_id"] = 8784379023
    },
    ["beam_v2_glass"] = {
        ["name"] = "Triangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV2Glass",
        ["image_id"] = 8776710506
    },
    ["archway_large_brick"] = {
        ["name"] = "Large Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayLargeBrick",
        ["image_id"] = 8776521043
    },
    ["beam_v2_brick"] = {
        ["name"] = "Triangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV2Brick",
        ["image_id"] = 8776520700
    },
    ["column_v3_glass"] = {
        ["name"] = "Ionic Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV3Glass",
        ["image_id"] = 8776736795
    },
    ["door_cutout_triangular_large_wood"] = {
        ["name"] = "Large Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularLargeWood",
        ["image_id"] = 8777637970
    },
    ["rectangular_prism_half_brick"] = {
        ["name"] = "Small Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismHalfBrick",
        ["image_id"] = 8776593679
    },
    ["wall_tall_wood"] = {
        ["name"] = "Tall Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallTallWood",
        ["image_id"] = 8782460009
    },
    ["archway_large_plain"] = {
        ["name"] = "Large Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayLargePlain",
        ["image_id"] = 8777176731
    },
    ["torus_v2_wood"] = {
        ["name"] = "Medium Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV2Wood",
        ["image_id"] = 8777698056
    },
    ["wall_double_brick"] = {
        ["name"] = "Double Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallDoubleBrick",
        ["image_id"] = 8834172967
    },
    ["cone_v1_glass"] = {
        ["name"] = "Large Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV1Glass",
        ["image_id"] = 8776736886
    },
    ["floor_double_plain"] = {
        ["name"] = "Double Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorDoublePlain",
        ["image_id"] = 8777219251
    },
    ["wall_double_glass"] = {
        ["name"] = "Double Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallDoubleGlass",
        ["image_id"] = 8782422405
    },
    ["sphere_v2_stone"] = {
        ["name"] = "Medium Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV2Stone",
        ["image_id"] = 8777453290
    },
    ["cylinder_v3_stone"] = {
        ["name"] = "Small Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV3Stone",
        ["image_id"] = 8777395901
    },
    ["wall_short_brick"] = {
        ["name"] = "Half Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallShortBrick",
        ["image_id"] = 8834173284
    },
    ["door_cutout_triangular_brick"] = {
        ["name"] = "Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularBrick",
        ["image_id"] = 8776578577
    },
    ["stairs_curved_v1_glass"] = {
        ["name"] = "Wide 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1Glass",
        ["image_id"] = 8777046099
    },
    ["stairs_v2_wood"] = {
        ["name"] = "Medium Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV2Wood",
        ["image_id"] = 8777682906
    },
    ["rectangular_prism_double_plain"] = {
        ["name"] = "Large Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismDoublePlain",
        ["image_id"] = 8777235457
    },
    ["wall_short_stone"] = {
        ["name"] = "Half Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallShortStone",
        ["image_id"] = 8782442469
    },
    ["round_w_indow_frame_v1_wood"] = {
        ["name"] = "Quarter Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022RoundWIndowFrameV1Wood",
        ["image_id"] = 8782451914
    },
    ["trim_v3_bottom_brick"] = {
        ["name"] = "Edward Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV3BottomBrick",
        ["image_id"] = 8776681296
    },
    ["stairs_curved_v3_reverse_glass"] = {
        ["name"] = "Wide 180\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3ReverseGlass",
        ["image_id"] = 8777059300
    },
    ["stairs_v1_brick"] = {
        ["name"] = "Small Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV1Brick",
        ["image_id"] = 8776637362
    },
    ["trim_v1_bottom_glass"] = {
        ["name"] = "Torus Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV1BottomGlass",
        ["image_id"] = 8777074514
    },
    ["round_wall_v2_brick"] = {
        ["name"] = "Medium Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV2Brick",
        ["image_id"] = 8784378681
    },
    ["archway_rounded_large_wood"] = {
        ["name"] = "Large Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedLargeWood",
        ["image_id"] = 8777576074
    },
    ["roof_low_v2_glass"] = {
        ["name"] = "Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV2Glass",
        ["image_id"] = 8776779836
    },
    ["wedge_short_v2_glass"] = {
        ["name"] = "Medium 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV2Glass",
        ["image_id"] = 8777104318
    },
    ["round_wall_v2_stone"] = {
        ["name"] = "Medium Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV2Stone",
        ["image_id"] = 8783690602
    },
    ["cube_half_wood"] = {
        ["name"] = "Small Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeHalfWood",
        ["image_id"] = 8777607664
    },
    ["cube_half_brick"] = {
        ["name"] = "Small Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeHalfBrick",
        ["image_id"] = 8776562585
    },
    ["cube_half_plain"] = {
        ["name"] = "Small Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeHalfPlain",
        ["image_id"] = 8777204611
    },
    ["cube_half_glass"] = {
        ["name"] = "Small Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeHalfGlass",
        ["image_id"] = 8776737278
    },
    ["bevelled_cylinderv2_brick"] = {
        ["name"] = "Medium Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv2Brick",
        ["image_id"] = 8776534236
    },
    ["square_w_indow_frame_v1_brick"] = {
        ["name"] = "Square Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022SquareWIndowFrameV1Brick",
        ["image_id"] = 8776681939
    },
    ["cube_wood"] = {
        ["name"] = "Medium Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeWood",
        ["image_id"] = 8777607734
    },
    ["door_cutout_rounded_brick"] = {
        ["name"] = "Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedBrick",
        ["image_id"] = 8776578359
    },
    ["sphere_v2_brick"] = {
        ["name"] = "Medium Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV2Brick",
        ["image_id"] = 8776622483
    },
    ["triangle_frame_tall_v1_wood"] = {
        ["name"] = "Large 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV1Wood",
        ["image_id"] = 8777698650
    },
    ["cube_brick"] = {
        ["name"] = "Medium Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeBrick",
        ["image_id"] = 8776562711
    },
    ["trim_v1_top_brick"] = {
        ["name"] = "Torus Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV1TopBrick",
        ["image_id"] = 8776665702
    },
    ["cube_glass"] = {
        ["name"] = "Medium Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeGlass",
        ["image_id"] = 8776751149
    },
    ["square_w_indow_frame_v1_stone"] = {
        ["name"] = "Square Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022SquareWIndowFrameV1Stone",
        ["image_id"] = 8777513371
    },
    ["trim_v2_bottom_glass"] = {
        ["name"] = "Bull Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV2BottomGlass",
        ["image_id"] = 8777088198
    },
    ["door_cutout_wood"] = {
        ["name"] = "Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutWood",
        ["image_id"] = 8777621501
    },
    ["triangle_frame_tall_v3_stone"] = {
        ["name"] = "Small 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV3Stone",
        ["image_id"] = 8783731217
    },
    ["round_wall_v1_brick"] = {
        ["name"] = "Large Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV1Brick",
        ["image_id"] = 8784378613
    },
    ["archway_rounded_stone"] = {
        ["name"] = "Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedStone",
        ["image_id"] = 8777354268
    },
    ["cylinder_v2_stone"] = {
        ["name"] = "Medium Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV2Stone",
        ["image_id"] = 8777395824
    },
    ["rectangular_prism_half_stone"] = {
        ["name"] = "Small Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismHalfStone",
        ["image_id"] = 8777423665
    },
    ["door_cutout_brick"] = {
        ["name"] = "Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutBrick",
        ["image_id"] = 8776578080
    },
    ["triangle_w_indow_frame_v1_stone"] = {
        ["name"] = "Triangular Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022TriangleWIndowFrameV1Stone",
        ["image_id"] = 8777499881
    },
    ["cylinder_v2_wood"] = {
        ["name"] = "Medium Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV2Wood",
        ["image_id"] = 8777607926
    },
    ["cone_v3_wood"] = {
        ["name"] = "Small Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV3Wood",
        ["image_id"] = 8777607513
    },
    ["wedge_short_v1_brick"] = {
        ["name"] = "Large 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV1Brick",
        ["image_id"] = 8776695090
    },
    ["door_cutout_plain"] = {
        ["name"] = "Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutPlain",
        ["image_id"] = 8777205315
    },
    ["door_cutout_stone"] = {
        ["name"] = "Square Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutStone",
        ["image_id"] = 8777395983
    },
    ["triangle_frame_short_v2_wood"] = {
        ["name"] = "Medium 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV2Wood",
        ["image_id"] = 8777698357
    },
    ["cylinder_v1_brick"] = {
        ["name"] = "Large Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV1Brick",
        ["image_id"] = 8776562854
    },
    ["cylinder_v1_plain"] = {
        ["name"] = "Large Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV1Plain",
        ["image_id"] = 8777204837
    },
    ["archway_rounded_wood"] = {
        ["name"] = "Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedWood",
        ["image_id"] = 8777575959
    },
    ["triangle_frame_tall_v3_wood"] = {
        ["name"] = "Small 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV3Wood",
        ["image_id"] = 8777713543
    },
    ["cone_v1_brick"] = {
        ["name"] = "Large Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV1Brick",
        ["image_id"] = 8776548462
    },
    ["cylinder_v1_stone"] = {
        ["name"] = "Large Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV1Stone",
        ["image_id"] = 8777395707
    },
    ["triangle_frame_short_v3_wood"] = {
        ["name"] = "Small 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV3Wood",
        ["image_id"] = 8777698518
    },
    ["cube_half_stone"] = {
        ["name"] = "Small Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeHalfStone",
        ["image_id"] = 8777381892
    },
    ["roof_square_wood"] = {
        ["name"] = "Flat Point Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofSquareWood",
        ["image_id"] = 8782451543
    },
    ["torus_v3_stone"] = {
        ["name"] = "Small Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV3Stone",
        ["image_id"] = 8777484618
    },
    ["bevelled_block_stone"] = {
        ["name"] = "Medium Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockStone",
        ["image_id"] = 8777367718
    },
    ["column_v2_brick"] = {
        ["name"] = "Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV2Brick",
        ["image_id"] = 8776548135
    },
    ["stairs_v1_plain"] = {
        ["name"] = "Small Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV1Plain",
        ["image_id"] = 8777279885
    },
    ["column_v2_plain"] = {
        ["name"] = "Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV2Plain",
        ["image_id"] = 8777190779
    },
    ["column_v2_glass"] = {
        ["name"] = "Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV2Glass",
        ["image_id"] = 8776725373
    },
    ["roof_high_v2_stone"] = {
        ["name"] = "Straight Tall Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV2Stone",
        ["image_id"] = 8777438133
    },
    ["stairs_curved_v1_wood"] = {
        ["name"] = "Wide 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1Wood",
        ["image_id"] = 8777668385
    },
    ["beam_v3_wood"] = {
        ["name"] = "Cylindrical Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV3Wood",
        ["image_id"] = 8777561112
    },
    ["beam_v3_brick"] = {
        ["name"] = "Cylindrical Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV3Brick",
        ["image_id"] = 8776520857
    },
    ["column_v1_glass"] = {
        ["name"] = "Square Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV1Glass",
        ["image_id"] = 8776725277
    },
    ["beam_v3_plain"] = {
        ["name"] = "Cylindrical Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV3Plain",
        ["image_id"] = 8777161490
    },
    ["triangle_frame_short_v2_brick"] = {
        ["name"] = "Medium 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV2Brick",
        ["image_id"] = 8776651601
    },
    ["floor_wood"] = {
        ["name"] = "Medium Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorWood",
        ["image_id"] = 8777638393
    },
    ["triangle_frame_short_v1_brick"] = {
        ["name"] = "Large 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV1Brick",
        ["image_id"] = 8776651473
    },
    ["rectangular_prism_half_wood"] = {
        ["name"] = "Small Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismHalfWood",
        ["image_id"] = 8777652836
    },
    ["torus_v2_plain"] = {
        ["name"] = "Medium Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV2Plain",
        ["image_id"] = 8777280280
    },
    ["rectangular_prism_half_glass"] = {
        ["name"] = "Small Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismHalfGlass",
        ["image_id"] = 8776766595
    },
    ["roof_low_v3_wood"] = {
        ["name"] = "Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV3Wood",
        ["image_id"] = 8777667791
    },
    ["torus_v2_brick"] = {
        ["name"] = "Medium Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV2Brick",
        ["image_id"] = 8776651218
    },
    ["wedge_tall_v1_plain"] = {
        ["name"] = "Large 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV1Plain",
        ["image_id"] = 8777323668
    },
    ["floor_long1_stone"] = {
        ["name"] = "Long Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong1Stone",
        ["image_id"] = 8777423253
    },
    ["roof_low_v3_glass"] = {
        ["name"] = "Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV3Glass",
        ["image_id"] = 8777031820
    },
    ["roof_low_v3_stone"] = {
        ["name"] = "Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV3Stone",
        ["image_id"] = 8782442084
    },
    ["wall_tall_plain"] = {
        ["name"] = "Tall Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallTallPlain",
        ["image_id"] = 8782432331
    },
    ["roof_low_v1_stone"] = {
        ["name"] = "Straight Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV1Stone",
        ["image_id"] = 8777438416
    },
    ["door_cutout_triangular_large_glass"] = {
        ["name"] = "Large Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularLargeGlass",
        ["image_id"] = 8776765724
    },
    ["door_cutout_triangular_large_stone"] = {
        ["name"] = "Large Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularLargeStone",
        ["image_id"] = 8777409156
    },
    ["stairs_v3_glass"] = {
        ["name"] = "Large Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV3Glass",
        ["image_id"] = 8777059532
    },
    ["stairs_curved_v2_wood"] = {
        ["name"] = "Narrow 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2Wood",
        ["image_id"] = 8777682359
    },
    ["archway_brick"] = {
        ["name"] = "Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayBrick",
        ["image_id"] = 8776520944
    },
    ["archway_plain"] = {
        ["name"] = "Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayPlain",
        ["image_id"] = 8777161634
    },
    ["cone_v3_glass"] = {
        ["name"] = "Small Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV3Glass",
        ["image_id"] = 8776737072
    },
    ["archway_glass"] = {
        ["name"] = "Square Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayGlass",
        ["image_id"] = 8776710676
    },
    ["archway_triangular_plain"] = {
        ["name"] = "Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularPlain",
        ["image_id"] = 8777177066
    },
    ["wedge_short_v1_glass"] = {
        ["name"] = "Large 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV1Glass",
        ["image_id"] = 8777088833
    },
    ["archway_triangular_glass"] = {
        ["name"] = "Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularGlass",
        ["image_id"] = 8776711159
    },
    ["roof_high_v3_glass"] = {
        ["name"] = "Tall Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV3Glass",
        ["image_id"] = 8776779608
    },
    ["archway_triangular_large_plain"] = {
        ["name"] = "Large Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularLargePlain",
        ["image_id"] = 8777177135
    },
    ["archway_triangular_large_glass"] = {
        ["name"] = "Large Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularLargeGlass",
        ["image_id"] = 8776711274
    },
    ["roof_high_v1_stone"] = {
        ["name"] = "Tall Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV1Stone",
        ["image_id"] = 8777438002
    },
    ["sphere_v2_wood"] = {
        ["name"] = "Medium Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV2Wood",
        ["image_id"] = 8777668165
    },
    ["bevelled_block_half_wood"] = {
        ["name"] = "Small Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockHalfWood",
        ["image_id"] = 8777592139
    },
    ["round_w_indow_frame_v1_brick"] = {
        ["name"] = "Quarter Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022RoundWIndowFrameV1Brick",
        ["image_id"] = 8776681586
    },
    ["triangle_w_indow_frame_v1_brick"] = {
        ["name"] = "Triangular Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022TriangleWIndowFrameV1Brick",
        ["image_id"] = 8776681756
    },
    ["triangle_frame_short_v3_glass"] = {
        ["name"] = "Small 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV3Glass",
        ["image_id"] = 8777073935
    },
    ["bevelled_cylinderv3_brick"] = {
        ["name"] = "Small Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv3Brick",
        ["image_id"] = 8776534401
    },
    ["wedge_tall_v2_glass"] = {
        ["name"] = "Medium 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV2Glass",
        ["image_id"] = 8777104544
    },
    ["stairs_v3_wood"] = {
        ["name"] = "Large Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV3Wood",
        ["image_id"] = 8777697897
    },
    ["door_cutout_rounded_large_wood"] = {
        ["name"] = "Large Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedLargeWood",
        ["image_id"] = 8777621869
    },
    ["wedge_short_v2_wood"] = {
        ["name"] = "Medium 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV2Wood",
        ["image_id"] = 8782460120
    },
    ["door_cutout_rounded_large_brick"] = {
        ["name"] = "Large Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedLargeBrick",
        ["image_id"] = 8776578481
    },
    ["square_w_indow_frame_v1_wood"] = {
        ["name"] = "Square Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022SquareWIndowFrameV1Wood",
        ["image_id"] = 8782452015
    },
    ["torus_v1_plain"] = {
        ["name"] = "Large Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV1Plain",
        ["image_id"] = 8777280130
    },
    ["door_cutout_rounded_large_glass"] = {
        ["name"] = "Large Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedLargeGlass",
        ["image_id"] = 8776765568
    },
    ["door_cutout_rounded_large_stone"] = {
        ["name"] = "Large Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedLargeStone",
        ["image_id"] = 8777408956
    },
    ["beam_v1_brick"] = {
        ["name"] = "Rectangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV1Brick",
        ["image_id"] = 8776520565
    },
    ["floor_double_brick"] = {
        ["name"] = "Double Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorDoubleBrick",
        ["image_id"] = 8776578775
    },
    ["wall_double_plain"] = {
        ["name"] = "Double Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallDoublePlain",
        ["image_id"] = 8782432090
    },
    ["wedge_short_v1_wood"] = {
        ["name"] = "Large 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV1Wood",
        ["image_id"] = 8782460063
    },
    ["floor_double_glass"] = {
        ["name"] = "Double Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorDoubleGlass",
        ["image_id"] = 8776765855
    },
    ["door_cutout_rounded_plain"] = {
        ["name"] = "Curved Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutRoundedPlain",
        ["image_id"] = 8777218815
    },
    ["wall_tall_stone"] = {
        ["name"] = "Tall Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallTallStone",
        ["image_id"] = 8782442569
    },
    ["stairs_curved_v1_reverse_stone"] = {
        ["name"] = "Wide 90\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1ReverseStone",
        ["image_id"] = 8777453525
    },
    ["cone_v3_plain"] = {
        ["name"] = "Small Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV3Plain",
        ["image_id"] = 8777191115
    },
    ["roof_low_v3_plain"] = {
        ["name"] = "Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV3Plain",
        ["image_id"] = 8777249961
    },
    ["triangle_frame_tall_v2_plain"] = {
        ["name"] = "Medium 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV2Plain",
        ["image_id"] = 8777293991
    },
    ["rectangular_prism_half_plain"] = {
        ["name"] = "Small Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismHalfPlain",
        ["image_id"] = 8777235567
    },
    ["archway_triangular_large_brick"] = {
        ["name"] = "Large Pointed Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayTriangularLargeBrick",
        ["image_id"] = 8776533591
    },
    ["torus_v2_stone"] = {
        ["name"] = "Medium Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV2Stone",
        ["image_id"] = 8777470127
    },
    ["cylinder_v1_glass"] = {
        ["name"] = "Large Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV1Glass",
        ["image_id"] = 8776751345
    },
    ["stairs_curved_v3_brick"] = {
        ["name"] = "Wide 180\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3Brick",
        ["image_id"] = 8776637107
    },
    ["wedge_tall_v2_brick"] = {
        ["name"] = "Medium 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV2Brick",
        ["image_id"] = 8776695578
    },
    ["cylinder_v3_wood"] = {
        ["name"] = "Small Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV3Wood",
        ["image_id"] = 8777621406
    },
    ["cone_v1_plain"] = {
        ["name"] = "Large Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV1Plain",
        ["image_id"] = 8777190995
    },
    ["cone_v1_stone"] = {
        ["name"] = "Large Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV1Stone",
        ["image_id"] = 8777381545
    },
    ["bevelled_cylinderv1_glass"] = {
        ["name"] = "Large Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv1Glass",
        ["image_id"] = 8776725036
    },
    ["cylinder_v3_plain"] = {
        ["name"] = "Small Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV3Plain",
        ["image_id"] = 8777205160
    },
    ["door_cutout_triangular_stone"] = {
        ["name"] = "Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularStone",
        ["image_id"] = 8777409051
    },
    ["wedge_tall_v1_glass"] = {
        ["name"] = "Large 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV1Glass",
        ["image_id"] = 8777104468
    },
    ["cone_v2_wood"] = {
        ["name"] = "Medium Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV2Wood",
        ["image_id"] = 8777607395
    },
    ["sphere_v3_wood"] = {
        ["name"] = "Small Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV3Wood",
        ["image_id"] = 8777668267
    },
    ["trim_v1_bottom_brick"] = {
        ["name"] = "Torus Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV1BottomBrick",
        ["image_id"] = 8776665579
    },
    ["round_wall_v1_glass"] = {
        ["name"] = "Large Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV1Glass",
        ["image_id"] = 8783677788
    },
    ["trim_v3_bottom_plain"] = {
        ["name"] = "Edward Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV3BottomPlain",
        ["image_id"] = 8777308484
    },
    ["beam_v2_stone"] = {
        ["name"] = "Triangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV2Stone",
        ["image_id"] = 8777340395
    },
    ["archway_rounded_plain"] = {
        ["name"] = "Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedPlain",
        ["image_id"] = 8777176867
    },
    ["wedge_tall_v2_plain"] = {
        ["name"] = "Medium 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV2Plain",
        ["image_id"] = 8777323766
    },
    ["cylinder_v2_brick"] = {
        ["name"] = "Medium Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV2Brick",
        ["image_id"] = 8776562967
    },
    ["triangle_w_indow_frame_v1_glass"] = {
        ["name"] = "Triangular Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022TriangleWIndowFrameV1Glass",
        ["image_id"] = 8777088707
    },
    ["wedge_tall_v3_plain"] = {
        ["name"] = "Small 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV3Plain",
        ["image_id"] = 8777323858
    },
    ["stairs_v2_plain"] = {
        ["name"] = "Medium Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV2Plain",
        ["image_id"] = 8777279970
    },
    ["bevelled_block_double_stone"] = {
        ["name"] = "Large Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockDoubleStone",
        ["image_id"] = 8777354601
    },
    ["beam_v3_glass"] = {
        ["name"] = "Cylindrical Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV3Glass",
        ["image_id"] = 8776710574
    },
    ["beam_v2_wood"] = {
        ["name"] = "Triangular Beam",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022BeamV2Wood",
        ["image_id"] = 8777560951
    },
    ["column_v3_stone"] = {
        ["name"] = "Ionic Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV3Stone",
        ["image_id"] = 8777368317
    },
    ["roof_high_v1_glass"] = {
        ["name"] = "Tall Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV1Glass",
        ["image_id"] = 8776779386
    },
    ["wedge_short_v1_plain"] = {
        ["name"] = "Large 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV1Plain",
        ["image_id"] = 8777309452
    },
    ["floor_long1_wood"] = {
        ["name"] = "Long Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong1Wood",
        ["image_id"] = 8777638495
    },
    ["stairs_curved_v2_reverse_stone"] = {
        ["name"] = "Narrow Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2ReverseStone",
        ["image_id"] = 8777453808
    },
    ["wedge_tall_v1_stone"] = {
        ["name"] = "Large 45\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeTallV1Stone",
        ["image_id"] = 8777513694
    },
    ["trim_v3_top_stone"] = {
        ["name"] = "Edward Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV3TopStone",
        ["image_id"] = 8777499701
    },
    ["bevelled_block_half_plain"] = {
        ["name"] = "Small Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockHalfPlain",
        ["image_id"] = 8777177243
    },
    ["wedge_short_v2_brick"] = {
        ["name"] = "Medium 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV2Brick",
        ["image_id"] = 8776695185
    },
    ["wedge_short_v3_brick"] = {
        ["name"] = "Small 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV3Brick",
        ["image_id"] = 8776695289
    },
    ["bevelled_block_double_wood"] = {
        ["name"] = "Large Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockDoubleWood",
        ["image_id"] = 8777576393
    },
    ["wedge_short_v2_plain"] = {
        ["name"] = "Medium 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV2Plain",
        ["image_id"] = 8777309570
    },
    ["triangle_frame_tall_v1_stone"] = {
        ["name"] = "Large 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV1Stone",
        ["image_id"] = 8777485006
    },
    ["cylinder_v2_plain"] = {
        ["name"] = "Medium Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV2Plain",
        ["image_id"] = 8777204964
    },
    ["stairs_curved_v1_reverse_glass"] = {
        ["name"] = "Wide 90\194\176 Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1ReverseGlass",
        ["image_id"] = 8777046212
    },
    ["roof_high_v1_wood"] = {
        ["name"] = "Tall Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV1Wood",
        ["image_id"] = 8777653243
    },
    ["wedge_short_v2_stone"] = {
        ["name"] = "Medium 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV2Stone",
        ["image_id"] = 8777513547
    },
    ["column_v3_plain"] = {
        ["name"] = "Ionic Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV3Plain",
        ["image_id"] = 8777190888
    },
    ["cylinder_v1_wood"] = {
        ["name"] = "Large Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV1Wood",
        ["image_id"] = 8777607811
    },
    ["archway_rounded_large_glass"] = {
        ["name"] = "Large Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedLargeGlass",
        ["image_id"] = 8776711081
    },
    ["triangle_frame_tall_v2_wood"] = {
        ["name"] = "Medium 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV2Wood",
        ["image_id"] = 8777713426
    },
    ["triangle_frame_short_v1_glass"] = {
        ["name"] = "Large 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV1Glass",
        ["image_id"] = 8777073767
    },
    ["roof_low_v1_wood"] = {
        ["name"] = "Straight Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV1Wood",
        ["image_id"] = 8777653579
    },
    ["rectangular_prism_double_wood"] = {
        ["name"] = "Large Slab",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022RectangularPrismDoubleWood",
        ["image_id"] = 8777652729
    },
    ["triangle_frame_short_v2_glass"] = {
        ["name"] = "Medium 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV2Glass",
        ["image_id"] = 8777073856
    },
    ["floor_long1_plain"] = {
        ["name"] = "Long Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong1Plain",
        ["image_id"] = 8777235170
    },
    ["trim_v3_bottom_glass"] = {
        ["name"] = "Edward Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV3BottomGlass",
        ["image_id"] = 8777088425
    },
    ["trim_v3_top_plain"] = {
        ["name"] = "Edward Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV3TopPlain",
        ["image_id"] = 8777308640
    },
    ["roof_low_v2_stone"] = {
        ["name"] = "Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofLowV2Stone",
        ["image_id"] = 8777438559
    },
    ["column_v2_wood"] = {
        ["name"] = "Tuscan Column",
        ["cost"] = 15,
        ["model_name"] = "Sandbox2022ColumnV2Wood",
        ["image_id"] = 8777592682
    },
    ["stairs_curved_v3_wood"] = {
        ["name"] = "Wide 180\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV3Wood",
        ["image_id"] = 8777682502
    },
    ["archway_rounded_brick"] = {
        ["name"] = "Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedBrick",
        ["image_id"] = 8776521172
    },
    ["triangle_frame_tall_v1_brick"] = {
        ["name"] = "Large 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV1Brick",
        ["image_id"] = 8776665127
    },
    ["torus_v1_brick"] = {
        ["name"] = "Large Ring",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022TorusV1Brick",
        ["image_id"] = 8776651057
    },
    ["floor_long1_glass"] = {
        ["name"] = "Long Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorLong1Glass",
        ["image_id"] = 8776766396
    },
    ["door_cutout_triangular_plain"] = {
        ["name"] = "Pointed Doorway",
        ["cost"] = 13,
        ["model_name"] = "Sandbox2022DoorCutoutTriangularPlain",
        ["image_id"] = 8777219012
    },
    ["triangle_frame_tall_v1_glass"] = {
        ["name"] = "Large 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV1Glass",
        ["image_id"] = 8777074047
    },
    ["stairs_v1_wood"] = {
        ["name"] = "Small Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV1Wood",
        ["image_id"] = 8777682767
    },
    ["roof_high_v3_plain"] = {
        ["name"] = "Tall Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV3Plain",
        ["image_id"] = 8777249602
    },
    ["floor_half1_plain"] = {
        ["name"] = "Half Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorHalf1Plain",
        ["image_id"] = 8777219343
    },
    ["bevelled_block_half_stone"] = {
        ["name"] = "Small Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockHalfStone",
        ["image_id"] = 8777367622
    },
    ["stairs_v3_brick"] = {
        ["name"] = "Large Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV3Brick",
        ["image_id"] = 8776650947
    },
    ["sphere_v1_brick"] = {
        ["name"] = "Large Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV1Brick",
        ["image_id"] = 8776622383
    },
    ["bevelled_cylinderv1_plain"] = {
        ["name"] = "Large Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv1Plain",
        ["image_id"] = 8777177413
    },
    ["floor_double_stone"] = {
        ["name"] = "Double Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorDoubleStone",
        ["image_id"] = 8777409277
    },
    ["trim_v2_top_brick"] = {
        ["name"] = "Bull Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV2TopBrick",
        ["image_id"] = 8776681171
    },
    ["wedge_short_v3_wood"] = {
        ["name"] = "Small 22.5\194\176 Wedge",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022WedgeShortV3Wood",
        ["image_id"] = 8782460171
    },
    ["archway_rounded_large_brick"] = {
        ["name"] = "Large Curved Archway",
        ["cost"] = 18,
        ["model_name"] = "Sandbox2022ArchwayRoundedLargeBrick",
        ["image_id"] = 8776521282
    },
    ["bevelled_cylinderv1_wood"] = {
        ["name"] = "Large Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv1Wood",
        ["image_id"] = 8777592358
    },
    ["sphere_v2_plain"] = {
        ["name"] = "Medium Sphere",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022SphereV2Plain",
        ["image_id"] = 8777250476
    },
    ["trim_v3_bottom_wood"] = {
        ["name"] = "Edward Wall Base Trim",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022TrimV3BottomWood",
        ["image_id"] = 8782451806
    },
    ["stairs_v2_brick"] = {
        ["name"] = "Medium Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV2Brick",
        ["image_id"] = 8776637604
    },
    ["triangle_frame_tall_v2_glass"] = {
        ["name"] = "Medium 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV2Glass",
        ["image_id"] = 8777074130
    },
    ["cube_double_plain"] = {
        ["name"] = "Large Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeDoublePlain",
        ["image_id"] = 8777204471
    },
    ["wall_short_wood"] = {
        ["name"] = "Half Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallShortWood",
        ["image_id"] = 8782459960
    },
    ["bevelled_block_double_plain"] = {
        ["name"] = "Large Bevel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledBlockDoublePlain",
        ["image_id"] = 8777177190
    },
    ["roof_high_v1_brick"] = {
        ["name"] = "Tall Outer Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV1Brick",
        ["image_id"] = 8776608036
    },
    ["square_w_indow_frame_v1_plain"] = {
        ["name"] = "Square Window",
        ["cost"] = 20,
        ["model_name"] = "Sandbox2022SquareWIndowFrameV1Plain",
        ["image_id"] = 8777309231
    },
    ["triangle_frame_short_v3_brick"] = {
        ["name"] = "Small 22.5\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameShortV3Brick",
        ["image_id"] = 8776665064
    },
    ["cone_v2_glass"] = {
        ["name"] = "Medium Cone",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022ConeV2Glass",
        ["image_id"] = 8776736975
    },
    ["stairs_curved_v2_reverse_wood"] = {
        ["name"] = "Narrow Right Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV2ReverseWood",
        ["image_id"] = 8777682419
    },
    ["stairs_curved_v1_brick"] = {
        ["name"] = "Wide 90\194\176 Left Curve",
        ["cost"] = 23,
        ["model_name"] = "Sandbox2022StairsCurvedV1Brick",
        ["image_id"] = 8776622657
    },
    ["triangle_frame_tall_v2_stone"] = {
        ["name"] = "Medium 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV2Stone",
        ["image_id"] = 8777485087
    },
    ["triangle_frame_tall_v3_plain"] = {
        ["name"] = "Small 45\194\176 Triangle",
        ["cost"] = 14,
        ["model_name"] = "Sandbox2022TriangleFrameTallV3Plain",
        ["image_id"] = 8777294116
    },
    ["bevelled_cylinderv3_wood"] = {
        ["name"] = "Small Bevel Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022BevelledCylinderv3Wood",
        ["image_id"] = 8777592552
    },
    ["roof_high_v3_wood"] = {
        ["name"] = "Tall Inner Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofHighV3Wood",
        ["image_id"] = 8777653503
    },
    ["wall_double_stone"] = {
        ["name"] = "Double Wall Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022WallDoubleStone",
        ["image_id"] = 8782442258
    },
    ["roof_flat_glass"] = {
        ["name"] = "Flat Roof Panel",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022RoofFlatGlass",
        ["image_id"] = 8776779258
    },
    ["round_wall_v2_plain"] = {
        ["name"] = "Medium Quarter Slice",
        ["cost"] = 5,
        ["model_name"] = "Sandbox2022RoundWallV2Plain",
        ["image_id"] = 8783690158
    },
    ["trim_v2_top_wood"] = {
        ["name"] = "Bull Wall Top Trim",
        ["cost"] = 7,
        ["model_name"] = "Sandbox2022TrimV2TopWood",
        ["image_id"] = 8782451733
    },
    ["floor_half1_wood"] = {
        ["name"] = "Half Floor Panel",
        ["cost"] = 8,
        ["model_name"] = "Sandbox2022FloorHalf1Wood",
        ["image_id"] = 8777638200
    },
    ["cube_double_brick"] = {
        ["name"] = "Large Cube",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CubeDoubleBrick",
        ["image_id"] = 8776562494
    },
    ["cylinder_v3_brick"] = {
        ["name"] = "Small Cylinder",
        ["cost"] = 10,
        ["model_name"] = "Sandbox2022CylinderV3Brick",
        ["image_id"] = 8776563058
    },
    ["stairs_v1_stone"] = {
        ["name"] = "Small Steps",
        ["cost"] = 11,
        ["model_name"] = "Sandbox2022StairsV1Stone",
        ["image_id"] = 8777469644
    }
}
local v3 = {
    ["ropes_horizontalchain_v1"] = {
        ["name"] = "Short Chain",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalchainV1",
        ["image_id"] = 8777118493
    },
    ["ropes_horizontalstring_v1"] = {
        ["name"] = "Short String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalstringV1",
        ["image_id"] = 8777133336
    },
    ["ropes_horizontalchain_v3"] = {
        ["name"] = "Long Chain",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalchainV3",
        ["image_id"] = 8777118695
    },
    ["ropes_verticalfairylights_v2"] = {
        ["name"] = "Medium Hanging Light String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalfairylightsV2",
        ["image_id"] = 8777530559
    },
    ["ropes_verticalchain_v1"] = {
        ["name"] = "Short Hanging Chain",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalchainV1",
        ["image_id"] = 8777530051
    },
    ["ropes_verticalrope_v2"] = {
        ["name"] = "Medium Hanging Braided Rope",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalropeV2",
        ["image_id"] = 8777545786
    },
    ["ropes_verticalrope_v1"] = {
        ["name"] = "Short Hanging Braided Rope",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalropeV1",
        ["image_id"] = 8777545711
    },
    ["ropes_verticalrope_v3"] = {
        ["name"] = "Long Hanging Braided Rope",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalropeV3",
        ["image_id"] = 8777545884
    },
    ["ropes_horizontalrope_v1"] = {
        ["name"] = "Short Braided Rope",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalropeV1",
        ["image_id"] = 8777132991
    },
    ["ropes_horizontalstring_v2"] = {
        ["name"] = "Medium String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalstringV2",
        ["image_id"] = 8777133446
    },
    ["ropes_verticalfairylights_v1"] = {
        ["name"] = "Short Hanging Light String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalfairylightsV1",
        ["image_id"] = 8777530430
    },
    ["ropes_verticalwires_v2"] = {
        ["name"] = "Medium Hanging Cable",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalwiresV2",
        ["image_id"] = 8777560513
    },
    ["ropes_horizontalfairylights_v2"] = {
        ["name"] = "Medium Light String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalfairylightsV2",
        ["image_id"] = 8777118906
    },
    ["ropes_verticalfairylights_v3"] = {
        ["name"] = "Long Hanging Light String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalfairylightsV3",
        ["image_id"] = 13681605308
    },
    ["ropes_verticalchain_v3"] = {
        ["name"] = "Long Hanging Chain",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalchainV3",
        ["image_id"] = 8777530277
    },
    ["ropes_verticalwires_v3"] = {
        ["name"] = "Long Hanging Cable",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalwiresV3",
        ["image_id"] = 8777560638
    },
    ["ropes_horizontalrope_v3"] = {
        ["name"] = "Long Braided Rope",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalropeV3",
        ["image_id"] = 8777133186
    },
    ["ropes_verticalwires_v1"] = {
        ["name"] = "Short Hanging Cable",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalwiresV1",
        ["image_id"] = 8777560342
    },
    ["ropes_horizontalwires_v1"] = {
        ["name"] = "Short Cable",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalwiresV1",
        ["image_id"] = 8777147202
    },
    ["ropes_horizontalrope_v2"] = {
        ["name"] = "Medium Braided Rope",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalropeV2",
        ["image_id"] = 8777133088
    },
    ["ropes_horizontalwires_v3"] = {
        ["name"] = "Long Cable",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalwiresV3",
        ["image_id"] = 8777147481
    },
    ["ropes_verticalstring_v2"] = {
        ["name"] = "Medium Hanging String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalstringV2",
        ["image_id"] = 8777546107
    },
    ["ropes_horizontalfairylights_v3"] = {
        ["name"] = "Long Light String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalfairylightsV3",
        ["image_id"] = 8793256725
    },
    ["ropes_verticalchain_v2"] = {
        ["name"] = "Medium Hanging Chain",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalchainV2",
        ["image_id"] = 8777530151
    },
    ["ropes_horizontalchain_v2"] = {
        ["name"] = "Medium Chain",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalchainV2",
        ["image_id"] = 8777118601
    },
    ["ropes_verticalstring_v1"] = {
        ["name"] = "Short Hanging String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalstringV1",
        ["image_id"] = 8777545992
    },
    ["ropes_verticalstring_v3"] = {
        ["name"] = "Long Hanging String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesVerticalstringV3",
        ["image_id"] = 8777560242
    },
    ["ropes_horizontalstring_v3"] = {
        ["name"] = "Long String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalstringV3",
        ["image_id"] = 8777147101
    },
    ["ropes_horizontalwires_v2"] = {
        ["name"] = "Medium Cable",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalwiresV2",
        ["image_id"] = 8777147314
    },
    ["ropes_horizontalfairylights_v1"] = {
        ["name"] = "Short Light String",
        ["cost"] = 32,
        ["model_name"] = "Sandbox2022RopesHorizontalfairylightsV1",
        ["image_id"] = 8777118802
    }
}
local v4 = {
    ["sandmound_v2"] = {
        ["name"] = "Medium Sand Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022SandmoundV2",
        ["image_id"] = 8777339526
    },
    ["mudmound_v1"] = {
        ["name"] = "Large Dirt Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022MudmoundV1",
        ["image_id"] = 8777147714
    },
    ["sandmound_v1"] = {
        ["name"] = "Large Sand Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022SandmoundV1",
        ["image_id"] = 8777324370
    },
    ["mudmound_v2"] = {
        ["name"] = "Medium Dirt Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022MudmoundV2",
        ["image_id"] = 8777147830
    },
    ["sandmound_v3"] = {
        ["name"] = "Small Sand Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022SandmoundV3",
        ["image_id"] = 8777339651
    },
    ["plainmound_v3"] = {
        ["name"] = "Small Solid Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022PlainmoundV3",
        ["image_id"] = 8777161051
    },
    ["grassmound_v3"] = {
        ["name"] = "Small Grassy Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022GrassmoundV3",
        ["image_id"] = 8777118410
    },
    ["grassmound_v2"] = {
        ["name"] = "Medium Grassy Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022GrassmoundV2",
        ["image_id"] = 8777118296
    },
    ["plainmound_v2"] = {
        ["name"] = "Medium Solid Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022PlainmoundV2",
        ["image_id"] = 8777160961
    },
    ["plainmound_v1"] = {
        ["name"] = "Large Solid Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022PlainmoundV1",
        ["image_id"] = 8777148084
    },
    ["mudmound_v3"] = {
        ["name"] = "Small Dirt Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022MudmoundV3",
        ["image_id"] = 8777147993
    },
    ["snowmound_v3"] = {
        ["name"] = "Small Snow Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022SnowmoundV3",
        ["image_id"] = 8777339973
    },
    ["snowmound_v2"] = {
        ["name"] = "Medium Snow Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022SnowmoundV2",
        ["image_id"] = 8777339884
    },
    ["snowmound_v1"] = {
        ["name"] = "Large Snow Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022SnowmoundV1",
        ["image_id"] = 8777339789
    },
    ["grassmound_v1"] = {
        ["name"] = "Large Grassy Mound",
        ["cost"] = 6,
        ["model_name"] = "Sandbox2022GrassmoundV1",
        ["image_id"] = 8777104975
    }
}
local v5 = {
    ["Wall Panel"] = 1,
    ["Column"] = 2,
    ["Floor Panel"] = 3,
    ["Beam"] = 4,
    ["Roof Panel"] = 5,
    ["Window"] = 6,
    ["Doorway"] = 7,
    ["Archway"] = 8,
    ["Wedge"] = 9,
    ["Cylinder"] = 10,
    ["Sphere"] = 11,
    ["Bevel"] = 12,
    ["Bevel Cylinder"] = 13,
    ["Cone"] = 14,
    ["Cube"] = 15,
    ["Slab"] = 16,
    ["Triangle"] = 17,
    ["Ring"] = 18,
    ["Mount"] = 19,
    ["Steps"] = 20,
    ["Curve"] = 21,
    ["Top Trim"] = 22,
    ["Base Trim"] = 23,
    ["Quarter Slice"] = 24
}
local v6 = {}
for v7, v8 in pairs(v2) do
    local v9 = v7:split("_")
    v8.tags = { "Sandbox2022Primitive" .. "_" .. v9[#v9] }
    for v10, v11 in pairs(v5) do
        if v8.name:match(v10 .. "$") then
            v8.sort_priority = v11
            break
        end
    end
    v6[v7] = v8
end
for v12, v13 in pairs(v3) do
    v13.tags = { "Sandbox2022Rope" }
    v6[v12] = v13
end
for v14, v15 in pairs(v4) do
    v15.tags = { "Sandbox2022Mound" }
    v6[v14] = v15
end
for _, v16 in pairs(v6) do
    v16.image_size_x = 70
    v16.image_size_y = 70
end
local v17 = {}
for _, v18 in pairs(v6) do
    table.insert(v17, v18)
end
table.sort(v17, function(p19, p20)
    local v21 = p19.sort_priority or (1 / 0)
    local v22 = p20.sort_priority or (1 / 0)
    if v21 == v22 then
        return p19.name < p20.name
    else
        return v21 < v22
    end
end)
for v23, v24 in ipairs(v17) do
    v24.layout_order = v23
    v24.sort_priority = nil
end
return v1.furniture(v6)