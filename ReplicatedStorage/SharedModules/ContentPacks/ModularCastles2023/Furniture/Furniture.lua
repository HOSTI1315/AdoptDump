--// ReplicatedStorage.SharedModules.ContentPacks.ModularCastles2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["modular_castles_2023_archway_large"] = {
        ["name"] = "Castle Arch Large",
        ["cost"] = 50,
        ["model_name"] = "ModularCastles2023ArchwayLarge",
        ["image_id"] = 12419710904
    },
    ["modular_castles_2023_archway_large_half"] = {
        ["name"] = "Castle Arch Half Large",
        ["cost"] = 50,
        ["model_name"] = "ModularCastles2023ArchwayLargeHalf",
        ["image_id"] = 12419710717
    },
    ["modular_castles_2023_archway_large_side"] = {
        ["name"] = "Castle Arch Half Side",
        ["cost"] = 50,
        ["model_name"] = "ModularCastles2023ArchwayLargeSide",
        ["image_id"] = 12419711180
    },
    ["modular_castles_2023_archway_large_top"] = {
        ["name"] = "Castle Arch Top Large",
        ["cost"] = 50,
        ["model_name"] = "ModularCastles2023ArchwayLargeTop",
        ["image_id"] = 12419711355
    },
    ["modular_castles_2023_archway_rectangular"] = {
        ["name"] = "Castle Arch Rectangle",
        ["cost"] = 50,
        ["model_name"] = "ModularCastles2023ArchwayRectangular",
        ["image_id"] = 12419711569
    },
    ["modular_castles_2023_archway_rounded"] = {
        ["name"] = "Castle Arch Round",
        ["cost"] = 50,
        ["model_name"] = "ModularCastles2023ArchwayRounded",
        ["image_id"] = 12419711791
    },
    ["modular_castles_2023_archway_triangular"] = {
        ["name"] = "Castle Arch Triangle",
        ["cost"] = 50,
        ["model_name"] = "ModularCastles2023ArchwayTriangular",
        ["image_id"] = 12419767116
    },
    ["modular_castles_2023_corner_trim"] = {
        ["name"] = "Castle Corner Trim",
        ["cost"] = 75,
        ["model_name"] = "ModularCastles2023CornerTrim",
        ["image_id"] = 12419767279
    },
    ["modular_castles_2023_corner_trim_tall"] = {
        ["name"] = "Castle Corner Trim Tall",
        ["cost"] = 75,
        ["model_name"] = "ModularCastles2023CornerTrimTall",
        ["image_id"] = 12419767505
    },
    ["modular_castles_2023_crenelation_corner_v1"] = {
        ["name"] = "Castle Crenelation Corner 1",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationCornerV1",
        ["image_id"] = 12419767748
    },
    ["modular_castles_2023_crenelation_corner_v2"] = {
        ["name"] = "Castle Crenelation Corner 2",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationCornerV2",
        ["image_id"] = 12419767956
    },
    ["modular_castles_2023_crenelation_corner_v3"] = {
        ["name"] = "Castle Crenelation Corner 3",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationCornerV3",
        ["image_id"] = 12419768118
    },
    ["modular_castles_2023_crenelation_curve_v1"] = {
        ["name"] = "Castle Crenelation Curve 1",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationCurveV1",
        ["image_id"] = 12419875917
    },
    ["modular_castles_2023_crenelation_curve_v2"] = {
        ["name"] = "Castle Crenelation Curve 2",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationCurveV2",
        ["image_id"] = 12419876085
    },
    ["modular_castles_2023_crenelation_curve_v3"] = {
        ["name"] = "Castle Crenelation Curve 3",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationCurveV3",
        ["image_id"] = 12419876281
    },
    ["modular_castles_2023_crenelation_half_v1"] = {
        ["name"] = "Castle Crenelation Half 1",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationHalfV1",
        ["image_id"] = 12419876742
    },
    ["modular_castles_2023_crenelation_half_v2"] = {
        ["name"] = "Castle Crenelation Half 2",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationHalfV2",
        ["image_id"] = 12419876929
    },
    ["modular_castles_2023_crenelation_half_v3"] = {
        ["name"] = "Castle Crenelation Half 3",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationHalfV3",
        ["image_id"] = 12419877081
    },
    ["modular_castles_2023_crenelation_v1"] = {
        ["name"] = "Castle Crenelation 1",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationV1",
        ["image_id"] = 12419910912
    },
    ["modular_castles_2023_crenelation_v2"] = {
        ["name"] = "Castle Crenelation 2",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationV2",
        ["image_id"] = 12419911119
    },
    ["modular_castles_2023_crenelation_v3"] = {
        ["name"] = "Castle Crenelation 3",
        ["cost"] = 100,
        ["model_name"] = "ModularCastles2023CrenelationV3",
        ["image_id"] = 12419911299
    },
    ["modular_castles_2023_floor_round"] = {
        ["name"] = "Castle Floor Round",
        ["cost"] = 25,
        ["model_name"] = "ModularCastles2023FloorRound",
        ["image_id"] = 12419911488
    },
    ["modular_castles_2023_floor_round_large"] = {
        ["name"] = "Castle Floor Round Large",
        ["cost"] = 25,
        ["model_name"] = "ModularCastles2023FloorRoundLarge",
        ["image_id"] = 12419911660
    },
    ["modular_castles_2023_foundation_corner_v1"] = {
        ["name"] = "Castle Foundation Corner 1",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationCornerV1",
        ["image_id"] = 12419911805
    },
    ["modular_castles_2023_foundation_corner_v2"] = {
        ["name"] = "Castle Foundation Corner 2",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationCornerV2",
        ["image_id"] = 12419943965
    },
    ["modular_castles_2023_foundation_corner_v3"] = {
        ["name"] = "Castle Foundation Corner 3",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationCornerV3",
        ["image_id"] = 12419944118
    },
    ["modular_castles_2023_foundation_curve_v1"] = {
        ["name"] = "Castle Foundation Curve 1",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationCurveV1",
        ["image_id"] = 12419944259
    },
    ["modular_castles_2023_foundation_curve_v2"] = {
        ["name"] = "Castle Foundation Curve 2",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationCurveV2",
        ["image_id"] = 12419944462
    },
    ["modular_castles_2023_foundation_curve_v3"] = {
        ["name"] = "Castle Foundation Curve 3",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationCurveV3",
        ["image_id"] = 12419944654
    },
    ["modular_castles_2023_foundation_half_v1"] = {
        ["name"] = "Castle Foundation Half 1",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationHalfV1",
        ["image_id"] = 12419944847
    },
    ["modular_castles_2023_foundation_half_v2"] = {
        ["name"] = "Castle Foundation Half 2",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationHalfV2",
        ["image_id"] = 12419976930
    },
    ["modular_castles_2023_foundation_half_v3"] = {
        ["name"] = "Castle Foundation Half 3",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationHalfV3",
        ["image_id"] = 12419977096
    },
    ["modular_castles_2023_foundation_v1"] = {
        ["name"] = "Castle Foundation 1",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationV1",
        ["image_id"] = 12419977362
    },
    ["modular_castles_2023_foundation_v2"] = {
        ["name"] = "Castle Foundation 2",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationV2",
        ["image_id"] = 12419977569
    },
    ["modular_castles_2023_foundation_v3"] = {
        ["name"] = "Castle Foundation 3",
        ["cost"] = 125,
        ["model_name"] = "ModularCastles2023FoundationV3",
        ["image_id"] = 12419977870
    },
    ["modular_castles_2023_round_tower"] = {
        ["name"] = "Castle Round Tower",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023RoundTower",
        ["image_id"] = 12419978071
    },
    ["modular_castles_2023_scatter_brick_single_v1"] = {
        ["name"] = "Castle Scatter Brick Single 1",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023ScatterBrickSingleV1",
        ["image_id"] = 12419993065
    },
    ["modular_castles_2023_scatter_brick_single_v2"] = {
        ["name"] = "Castle Scatter Brick Single 2",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023ScatterBrickSingleV2",
        ["image_id"] = 12419993333
    },
    ["modular_castles_2023_scatter_brick_single_v3"] = {
        ["name"] = "Castle Scatter Brick Single 3",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023ScatterBrickSingleV3",
        ["image_id"] = 12419993634
    },
    ["modular_castles_2023_scatter_bricks_v1"] = {
        ["name"] = "Castle Scatter Bricks 1",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023ScatterBricksV1",
        ["image_id"] = 12419993831
    },
    ["modular_castles_2023_scatter_bricks_v2"] = {
        ["name"] = "Castle Scatter Bricks 2",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023ScatterBricksV2",
        ["image_id"] = 12419994054
    },
    ["modular_castles_2023_scatter_bricks_v3"] = {
        ["name"] = "Castle Scatter Bricks 3",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023ScatterBricksV3",
        ["image_id"] = 12419994228
    },
    ["modular_castles_2023_scatter_bricks_v4"] = {
        ["name"] = "Castle Scatter Bricks 4",
        ["cost"] = 200,
        ["model_name"] = "ModularCastles2023ScatterBricksV4",
        ["image_id"] = 12420029838
    },
    ["modular_castles_2023_square_tower"] = {
        ["name"] = "Castle Square Tower",
        ["cost"] = 300,
        ["model_name"] = "ModularCastles2023SquareTower",
        ["image_id"] = 12420030020
    },
    ["modular_castles_2023_stairs_curved_v1"] = {
        ["name"] = "Castle Stairs Curved 1",
        ["cost"] = 130,
        ["model_name"] = "ModularCastles2023StairsCurvedV1",
        ["image_id"] = 12420030266
    },
    ["modular_castles_2023_stairs_curved_v1_reverse"] = {
        ["name"] = "Castle Stairs Curved 1 Reverse",
        ["cost"] = 130,
        ["model_name"] = "ModularCastles2023StairsCurvedV1Reverse",
        ["image_id"] = 12420030572
    },
    ["modular_castles_2023_stairs_curved_v2"] = {
        ["name"] = "Castle Stairs Curved 2",
        ["cost"] = 130,
        ["model_name"] = "ModularCastles2023StairsCurvedV2",
        ["image_id"] = 12420030787
    },
    ["modular_castles_2023_stairs_curved_v2_reverse"] = {
        ["name"] = "Castle Stairs Curved 2 Reverse",
        ["cost"] = 130,
        ["model_name"] = "ModularCastles2023StairsCurvedV2Reverse",
        ["image_id"] = 12420030954
    },
    ["modular_castles_2023_stairs_curved_v3"] = {
        ["name"] = "Castle Stairs Curved 3",
        ["cost"] = 130,
        ["model_name"] = "ModularCastles2023StairsCurvedV3",
        ["image_id"] = 12420085090
    },
    ["modular_castles_2023_stairs_curved_v3_reverse"] = {
        ["name"] = "Castle Stairs Curved 3 Reverse",
        ["cost"] = 130,
        ["model_name"] = "ModularCastles2023StairsCurvedV3Reverse",
        ["image_id"] = 12420085292
    },
    ["modular_castles_2023_wall"] = {
        ["name"] = "Castle Wall",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023Wall",
        ["image_id"] = 12420136580
    },
    ["modular_castles_2023_wall_corner"] = {
        ["name"] = "Castle Wall Corner",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallCorner",
        ["image_id"] = 12420085736
    },
    ["modular_castles_2023_wall_corner_tall"] = {
        ["name"] = "Castle Wall Corner Tall",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallCornerTall",
        ["image_id"] = 12420085516
    },
    ["modular_castles_2023_wall_curve"] = {
        ["name"] = "Castle Wall Curve",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallCurve",
        ["image_id"] = 12420136155
    },
    ["modular_castles_2023_wall_curve_slit"] = {
        ["name"] = "Castle Wall Curve Slit",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallCurveSlit",
        ["image_id"] = 12420085907
    },
    ["modular_castles_2023_wall_curve_tall"] = {
        ["name"] = "Castle Wall Curve Tall",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallCurveTall",
        ["image_id"] = 12420086167
    },
    ["modular_castles_2023_wall_double"] = {
        ["name"] = "Castle Wall Double",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallDouble",
        ["image_id"] = 12420136358
    },
    ["modular_castles_2023_wall_slit"] = {
        ["name"] = "Castle Wall Slit",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallSlit",
        ["image_id"] = 12420136703
    },
    ["modular_castles_2023_wall_tall"] = {
        ["name"] = "Castle Wall Tall",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallTall",
        ["image_id"] = 12420136850
    },
    ["modular_castles_2023_wall_wide"] = {
        ["name"] = "Castle Wall Wide",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallWide",
        ["image_id"] = 12420171749
    },
    ["modular_castles_2023_wall_wide_slit"] = {
        ["name"] = "Castle Wall Wide Slit",
        ["cost"] = 225,
        ["model_name"] = "ModularCastles2023WallWideSlit",
        ["image_id"] = 12420137102
    },
    ["modular_castles_2023_pine_tree_large"] = {
        ["name"] = "Large Pine Tree",
        ["cost"] = 90,
        ["model_name"] = "ModularCastles2023PineTreeLarge",
        ["image_id"] = 12478147915
    },
    ["modular_castles_2023_pine_tree_medium"] = {
        ["name"] = "Medium Pine Tree",
        ["cost"] = 80,
        ["model_name"] = "ModularCastles2023PineTreeMedium",
        ["image_id"] = 12478148021
    },
    ["modular_castles_2023_pine_tree_small"] = {
        ["name"] = "Small Pine Tree",
        ["cost"] = 70,
        ["model_name"] = "ModularCastles2023PineTreeSmall",
        ["image_id"] = 12478148083
    }
}
local v3 = {}
for _, v4 in v2 do
    table.insert(v3, v4)
    if v4.cost then
        v4.tags = { "ModularCastles2023" }
    end
end
table.sort(v3, function(p5, p6)
    return p5.model_name < p6.model_name
end)
for v7, v8 in v3 do
    v8.layout_order = v7
end
return v1.furniture(v2)