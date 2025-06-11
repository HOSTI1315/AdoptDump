--// ReplicatedStorage.ClientDB.Housing.TexturesDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Sift")
local v2 = {}
local v3 = {
    ["snowflakes"] = {
        ["name"] = "Snowflakes",
        ["cost"] = 1,
        ["texture_id"] = 2648026140,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    },
    ["presents"] = {
        ["name"] = "Presents",
        ["cost"] = 1,
        ["texture_id"] = 2648049064,
        ["studs_per_tile_u"] = 8,
        ["studs_per_tile_v"] = 8
    },
    ["bluestripes"] = {
        ["name"] = "Blue Stripes",
        ["cost"] = 4,
        ["texture_id"] = 1934444948,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["circles"] = {
        ["name"] = "Circles",
        ["cost"] = 6,
        ["texture_id"] = 10064659863,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7
    },
    ["hex"] = {
        ["name"] = "Hex",
        ["cost"] = 5,
        ["texture_id"] = 10064660376,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    },
    ["lineart"] = {
        ["name"] = "Line Art",
        ["cost"] = 8,
        ["texture_id"] = 10064660567,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["sword"] = {
        ["name"] = "Swords",
        ["cost"] = 3,
        ["texture_id"] = 1942049658,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["heart"] = {
        ["name"] = "Hearts",
        ["cost"] = 1,
        ["texture_id"] = 10064660224,
        ["studs_per_tile_u"] = 2,
        ["studs_per_tile_v"] = 2
    },
    ["unicorns"] = {
        ["name"] = "Unicorns",
        ["cost"] = 3,
        ["texture_id"] = 1942026911,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["spiralpattern"] = {
        ["name"] = "Spiral Pattern",
        ["cost"] = 9,
        ["texture_id"] = 10064673215,
        ["studs_per_tile_u"] = 1.8,
        ["studs_per_tile_v"] = 2
    },
    ["pinkstripes"] = {
        ["name"] = "Pink Stripes",
        ["cost"] = 3,
        ["texture_id"] = 1940683182,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["bluetriangles"] = {
        ["name"] = "Blue Triangles",
        ["cost"] = 4,
        ["texture_id"] = 10064630256,
        ["studs_per_tile_u"] = 3,
        ["studs_per_tile_v"] = 1.5
    },
    ["whiteleaf"] = {
        ["name"] = "White Leaves",
        ["cost"] = 2,
        ["texture_id"] = 1940623998,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(199, 199, 199)
    },
    ["toilets"] = {
        ["name"] = "TOILETS?!",
        ["cost"] = 50,
        ["texture_id"] = 10064673809,
        ["studs_per_tile_u"] = 3,
        ["studs_per_tile_v"] = 3
    },
    ["flowers"] = {
        ["name"] = "Flowers",
        ["cost"] = 10,
        ["texture_id"] = 10064660063,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["stripedpattern"] = {
        ["name"] = "Striped Pattern",
        ["cost"] = 12,
        ["texture_id"] = 10064673581,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7
    },
    ["white"] = {
        ["name"] = "White paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(255, 255, 255)
    },
    ["black"] = {
        ["name"] = "Black paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(38, 38, 38)
    },
    ["red"] = {
        ["name"] = "Red paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(152, 53, 53)
    },
    ["yellow"] = {
        ["name"] = "Yellow paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(206, 206, 13)
    },
    ["orange"] = {
        ["name"] = "Orange paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(168, 78, 0)
    },
    ["green"] = {
        ["name"] = "Green paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(6, 126, 0)
    },
    ["pink"] = {
        ["name"] = "Pink paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(233, 113, 248)
    },
    ["purple"] = {
        ["name"] = "Purple paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(170, 0, 255)
    },
    ["blue"] = {
        ["name"] = "Blue paint",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(73, 82, 140)
    },
    ["butterflies"] = {
        ["name"] = "Butterflies",
        ["cost"] = 5,
        ["texture_id"] = 10064659587,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["pink_panda"] = {
        ["name"] = "Pink Panda",
        ["cost"] = 30,
        ["texture_id"] = 4023383333,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["geometric_tiles"] = {
        ["name"] = "Geometric Tiles",
        ["cost"] = 100,
        ["texture_id"] = 4023811530,
        ["studs_per_tile_u"] = 8,
        ["studs_per_tile_v"] = 8
    },
    ["love_is_love"] = {
        ["name"] = "Love is Love",
        ["cost"] = 154,
        ["texture_id"] = 4024445895,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["ornate_map"] = {
        ["name"] = "Ornate Map",
        ["cost"] = 29,
        ["texture_id"] = 4023615685,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["summer_harvest"] = {
        ["name"] = "Summer Harvest",
        ["cost"] = 118,
        ["texture_id"] = 4023756388,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["baby_blue_terra_cotta"] = {
        ["name"] = "Baby Blue Terra Cotta",
        ["cost"] = 123,
        ["texture_id"] = 4023682618,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    },
    ["birds_eye_view"] = {
        ["name"] = "Bird\'s Eye View",
        ["cost"] = 150,
        ["texture_id"] = 4023733523,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["leopard_print"] = {
        ["name"] = "Leopard Print",
        ["cost"] = 78,
        ["texture_id"] = 4023530834,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["white_brick"] = {
        ["name"] = "White Brick",
        ["cost"] = 60,
        ["texture_id"] = 4023492897,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["purple_terra_cotta"] = {
        ["name"] = "Purple Terra Cotta",
        ["cost"] = 76,
        ["texture_id"] = 4015653144,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["rainbow_brush_strokes"] = {
        ["name"] = "Rainbow Brush Strokes",
        ["cost"] = 10,
        ["texture_id"] = 4023455494,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["chilly_peaks"] = {
        ["name"] = "Chilly Peaks",
        ["cost"] = 14,
        ["texture_id"] = 4023602848,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["festive_cats"] = {
        ["name"] = "Festive Cats",
        ["cost"] = 67,
        ["texture_id"] = 4023473561,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pretty_lily_pads"] = {
        ["name"] = "Pretty Lily Pads",
        ["cost"] = 225,
        ["texture_id"] = 4023656522,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["a_lot_of_ducks"] = {
        ["name"] = "A Lot of Ducks",
        ["cost"] = 57,
        ["texture_id"] = 4023702001,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["starry_sky"] = {
        ["name"] = "Starry Sky",
        ["cost"] = 107,
        ["texture_id"] = 4015651273,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["mint_terra_cotta"] = {
        ["name"] = "Mint Terra Cotta",
        ["cost"] = 34,
        ["texture_id"] = 4015653504,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["bubbles"] = {
        ["name"] = "Bubbles",
        ["cost"] = 63,
        ["texture_id"] = 4015650690,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["pastel_zag"] = {
        ["name"] = "Pastel Zag",
        ["cost"] = 40,
        ["texture_id"] = 4015652842,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["cheery_clouds"] = {
        ["name"] = "Cheery Clouds",
        ["cost"] = 86,
        ["texture_id"] = 4023411707,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["glittering_scales"] = {
        ["name"] = "Glittering Scales",
        ["cost"] = 55,
        ["texture_id"] = 4023643278,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["great_waves"] = {
        ["name"] = "Great Waves",
        ["cost"] = 37,
        ["texture_id"] = 4023538498,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["burried_bricks"] = {
        ["name"] = "Burried Bricks",
        ["cost"] = 5,
        ["texture_id"] = 4023718766,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["dino_princess"] = {
        ["name"] = "Dino Princess",
        ["cost"] = 34,
        ["texture_id"] = 4023633412,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pepperoni_pizza"] = {
        ["name"] = "Pepperoni Pizza",
        ["cost"] = 10000,
        ["texture_id"] = 4023710216,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["tags"] = { "Rare" }
    },
    ["magma"] = {
        ["name"] = "Magma",
        ["cost"] = 273,
        ["texture_id"] = 4101892203,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["toon_teak"] = {
        ["name"] = "Toon Teak",
        ["cost"] = 23,
        ["texture_id"] = 4023550956,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["comic_book_print"] = {
        ["name"] = "Comic Book Print",
        ["cost"] = 20,
        ["texture_id"] = 4023740630,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["sleepy_unicorn"] = {
        ["name"] = "Sleepy Unicorn",
        ["cost"] = 64,
        ["texture_id"] = 4023337410,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pastel_squares"] = {
        ["name"] = "Pastel Squares",
        ["cost"] = 67,
        ["texture_id"] = 4015651643,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["pink_punk_skulls"] = {
        ["name"] = "Pink Punk Skulls",
        ["cost"] = 25,
        ["texture_id"] = 4023726249,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["spooky_orange"] = {
        ["name"] = "Spooky Orange",
        ["cost"] = 90,
        ["texture_id"] = 4023790704,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["yellow_tartan"] = {
        ["name"] = "Yellow Tartan",
        ["cost"] = 120,
        ["texture_id"] = 4015651974,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7
    },
    ["i_heart_strawberries"] = {
        ["name"] = "I <3 Strawberries",
        ["cost"] = 203,
        ["texture_id"] = 4023572371,
        ["studs_per_tile_u"] = 13,
        ["studs_per_tile_v"] = 13
    },
    ["cups_of_coffee"] = {
        ["name"] = "Cups of Coffee",
        ["cost"] = 43,
        ["texture_id"] = 4023801508,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["autumn_rings"] = {
        ["name"] = "Autumn Rings",
        ["cost"] = 18,
        ["texture_id"] = 4023747332,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["a_panda_summer"] = {
        ["name"] = "A Panda Summer",
        ["cost"] = 48,
        ["texture_id"] = 4023768132,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["goldenrod_terra_cotta"] = {
        ["name"] = "Goldenrod Terra Cotta",
        ["cost"] = 26,
        ["texture_id"] = 4023674852,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    },
    ["unicorn_magic"] = {
        ["name"] = "Unicorn Magic",
        ["cost"] = 36,
        ["texture_id"] = 4023362735,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["steampunk_hearts"] = {
        ["name"] = "Steampunk Hearts",
        ["cost"] = 5000,
        ["texture_id"] = 4023589213,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["tags"] = { "Rare" }
    },
    ["fine_china_tiles"] = {
        ["name"] = "Fine China Tiles",
        ["cost"] = 99,
        ["texture_id"] = 4023822896,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["blue_panda"] = {
        ["name"] = "Blue Panda",
        ["cost"] = 98,
        ["texture_id"] = 4023390259,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["gilded_wicker"] = {
        ["name"] = "Gilded Wicker",
        ["cost"] = 287,
        ["texture_id"] = 4023502262,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["kittycorn"] = {
        ["name"] = "Kittycorn",
        ["cost"] = 42,
        ["texture_id"] = 4023480875,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pretty_alphabet"] = {
        ["name"] = "Pretty Alphabet",
        ["cost"] = 32,
        ["texture_id"] = 4015649819,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["zebra_print"] = {
        ["name"] = "Zebra Print",
        ["cost"] = 299,
        ["texture_id"] = 4023522925,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["gold_leafed"] = {
        ["name"] = "Gold Leafed",
        ["cost"] = 200,
        ["texture_id"] = 4023512949,
        ["studs_per_tile_u"] = 13,
        ["studs_per_tile_v"] = 13
    },
    ["fall_mountains"] = {
        ["name"] = "Fall Mountains",
        ["cost"] = 78,
        ["texture_id"] = 4024450121,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["dinos_in_the_dark"] = {
        ["name"] = "Dinos in the Dark",
        ["cost"] = 36,
        ["texture_id"] = 4098194195,
        ["studs_per_tile_u"] = 20,
        ["studs_per_tile_v"] = 20
    },
    ["orange_stripes"] = {
        ["name"] = "Orange Stripes",
        ["cost"] = 50,
        ["texture_id"] = 4037319843,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["blue_stripes"] = {
        ["name"] = "Blue Stripes",
        ["cost"] = 45,
        ["texture_id"] = 4037320156,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["purple_pattern"] = {
        ["name"] = "Purple Pattern",
        ["cost"] = 35,
        ["texture_id"] = 4037321152,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["pink_zag"] = {
        ["name"] = "Pink Zag",
        ["cost"] = 30,
        ["texture_id"] = 4037321506,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["yellow_zag"] = {
        ["name"] = "Yellow Zag",
        ["cost"] = 40,
        ["texture_id"] = 4037320489,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["magic"] = {
        ["name"] = "Magic",
        ["cost"] = 75,
        ["texture_id"] = 4657937214,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    }
}
v2.walls = v3
local v4 = {
    ["woodenplanks"] = {
        ["name"] = "Wooden Planks",
        ["cost"] = 10,
        ["texture_id"] = 1934566638,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["checkers"] = {
        ["name"] = "Checkers",
        ["cost"] = 5,
        ["texture_id"] = 10064629635,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["floorswords"] = {
        ["name"] = "Sword floor",
        ["cost"] = 3,
        ["texture_id"] = 1942049658,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["unicornfloor"] = {
        ["name"] = "Unicorn floor",
        ["cost"] = 3,
        ["texture_id"] = 1942026911,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["heartfloor"] = {
        ["name"] = "Heart floor",
        ["cost"] = 8,
        ["texture_id"] = 10064630114,
        ["studs_per_tile_u"] = 2,
        ["studs_per_tile_v"] = 2
    },
    ["pinklinepattern"] = {
        ["name"] = "Pink Line Pattern",
        ["cost"] = 6,
        ["texture_id"] = 1942134426,
        ["studs_per_tile_u"] = 1,
        ["studs_per_tile_v"] = 1
    },
    ["pinkfloorpattern"] = {
        ["name"] = "Pink Floor Pattern",
        ["cost"] = 7,
        ["texture_id"] = 1942122022,
        ["studs_per_tile_u"] = 2,
        ["studs_per_tile_v"] = 2
    },
    ["bluetiles"] = {
        ["name"] = "Blue Tiles",
        ["cost"] = 9,
        ["texture_id"] = 1942111237,
        ["studs_per_tile_u"] = 2,
        ["studs_per_tile_v"] = 2
    },
    ["stones"] = {
        ["name"] = "Stone Floor",
        ["cost"] = 3,
        ["texture_id"] = 1940475573,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(59, 60, 84)
    },
    ["floortoilets"] = {
        ["name"] = "FLOOR TOILETS?!",
        ["cost"] = 50,
        ["texture_id"] = 10064629999,
        ["studs_per_tile_u"] = 3,
        ["studs_per_tile_v"] = 3
    },
    ["blackcarpet"] = {
        ["name"] = "Black carpet",
        ["cost"] = 6,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(38, 38, 38)
    },
    ["floorflowers"] = {
        ["name"] = "Floor Flowers",
        ["cost"] = 5,
        ["texture_id"] = 10064629821,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["expensivepurplecarpet"] = {
        ["name"] = "Expensive purple carpet",
        ["cost"] = 6,
        ["texture_id"] = 1942156712,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7,
        ["color3"] = Color3.fromRGB(199, 69, 255)
    },
    ["expensivecreamcarpet"] = {
        ["name"] = "Expensive cream carpet",
        ["cost"] = 6,
        ["texture_id"] = 1942156712,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7,
        ["color3"] = Color3.fromRGB(230, 230, 230)
    },
    ["expensivedarkcreamcarpet"] = {
        ["name"] = "Expensive dark cream carpet",
        ["cost"] = 6,
        ["texture_id"] = 1942156712,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7,
        ["color3"] = Color3.fromRGB(161, 147, 147)
    },
    ["expensivebluecarpet"] = {
        ["name"] = "Expensive blue carpet",
        ["cost"] = 6,
        ["texture_id"] = 1942156712,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7,
        ["color3"] = Color3.fromRGB(62, 104, 255)
    },
    ["redcarpet"] = {
        ["name"] = "Red carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(152, 53, 53)
    },
    ["yellowcarpet"] = {
        ["name"] = "Yellow carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(206, 206, 13)
    },
    ["orangecarpet"] = {
        ["name"] = "Orange carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(168, 78, 0)
    },
    ["greencarpet"] = {
        ["name"] = "Green carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(6, 126, 0)
    },
    ["pinkcarpet"] = {
        ["name"] = "Pink carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(233, 113, 248)
    },
    ["whitecarpet"] = {
        ["name"] = "White carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(255, 255, 255)
    },
    ["purplecarpet"] = {
        ["name"] = "Purple carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(170, 0, 255)
    },
    ["bluecarpet"] = {
        ["name"] = "Blue carpet",
        ["cost"] = 2,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(73, 82, 140)
    },
    ["pink_panda"] = {
        ["name"] = "Pink Panda",
        ["cost"] = 30,
        ["texture_id"] = 4023383333,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["geometric_tiles"] = {
        ["name"] = "Geometric Tiles",
        ["cost"] = 100,
        ["texture_id"] = 4023811530,
        ["studs_per_tile_u"] = 8,
        ["studs_per_tile_v"] = 8
    },
    ["love_is_love"] = {
        ["name"] = "Love is Love",
        ["cost"] = 154,
        ["texture_id"] = 4024445895,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["ornate_map"] = {
        ["name"] = "Ornate Map",
        ["cost"] = 29,
        ["texture_id"] = 4023615685,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["summer_harvest"] = {
        ["name"] = "Summer Harvest",
        ["cost"] = 118,
        ["texture_id"] = 4023756388,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["baby_blue_terra_cotta"] = {
        ["name"] = "Baby Blue Terra Cotta",
        ["cost"] = 123,
        ["texture_id"] = 4023682618,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    },
    ["birds_eye_view"] = {
        ["name"] = "Bird\'s Eye View",
        ["cost"] = 150,
        ["texture_id"] = 4023733523,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["leopard_print"] = {
        ["name"] = "Leopard Print",
        ["cost"] = 78,
        ["texture_id"] = 4023530834,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["white_brick"] = {
        ["name"] = "White Brick",
        ["cost"] = 60,
        ["texture_id"] = 4023492897,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["purple_terra_cotta"] = {
        ["name"] = "Purple Terra Cotta",
        ["cost"] = 76,
        ["texture_id"] = 4015653144,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["rainbow_brush_strokes"] = {
        ["name"] = "Rainbow Brush Strokes",
        ["cost"] = 10,
        ["texture_id"] = 4023455494,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["chilly_peaks"] = {
        ["name"] = "Chilly Peaks",
        ["cost"] = 14,
        ["texture_id"] = 4023602848,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["festive_cats"] = {
        ["name"] = "Festive Cats",
        ["cost"] = 67,
        ["texture_id"] = 4023473561,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pretty_lily_pads"] = {
        ["name"] = "Pretty Lily Pads",
        ["cost"] = 225,
        ["texture_id"] = 4023656522,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["a_lot_of_ducks"] = {
        ["name"] = "A Lot of Ducks",
        ["cost"] = 57,
        ["texture_id"] = 4023702001,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["starry_sky"] = {
        ["name"] = "Starry Sky",
        ["cost"] = 107,
        ["texture_id"] = 4015651273,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["mint_terra_cotta"] = {
        ["name"] = "Mint Terra Cotta",
        ["cost"] = 34,
        ["texture_id"] = 4015653504,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["bubbles"] = {
        ["name"] = "Bubbles",
        ["cost"] = 63,
        ["texture_id"] = 4015650690,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["pastel_zag"] = {
        ["name"] = "Pastel Zag",
        ["cost"] = 40,
        ["texture_id"] = 4015652842,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["cheery_clouds"] = {
        ["name"] = "Cheery Clouds",
        ["cost"] = 86,
        ["texture_id"] = 4023411707,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["glittering_scales"] = {
        ["name"] = "Glittering Scales",
        ["cost"] = 55,
        ["texture_id"] = 4023643278,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["great_waves"] = {
        ["name"] = "Great Waves",
        ["cost"] = 37,
        ["texture_id"] = 4023538498,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["burried_bricks"] = {
        ["name"] = "Burried Bricks",
        ["cost"] = 5,
        ["texture_id"] = 4023718766,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["dino_princess"] = {
        ["name"] = "Dino Princess",
        ["cost"] = 34,
        ["texture_id"] = 4023633412,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pepperoni_pizza"] = {
        ["name"] = "Pepperoni Pizza",
        ["cost"] = 10000,
        ["texture_id"] = 4023710216,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["tags"] = { "Rare" }
    },
    ["magma"] = {
        ["name"] = "Magma",
        ["cost"] = 273,
        ["texture_id"] = 4101892203,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["toon_teak"] = {
        ["name"] = "Toon Teak",
        ["cost"] = 23,
        ["texture_id"] = 4023550956,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["comic_book_print"] = {
        ["name"] = "Comic Book Print",
        ["cost"] = 20,
        ["texture_id"] = 4023740630,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["sleepy_unicorn"] = {
        ["name"] = "Sleepy Unicorn",
        ["cost"] = 64,
        ["texture_id"] = 4023337410,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pastel_squares"] = {
        ["name"] = "Pastel Squares",
        ["cost"] = 67,
        ["texture_id"] = 4015651643,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["pink_punk_skulls"] = {
        ["name"] = "Pink Punk Skulls",
        ["cost"] = 25,
        ["texture_id"] = 4023726249,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["spooky_orange"] = {
        ["name"] = "Spooky Orange",
        ["cost"] = 90,
        ["texture_id"] = 4023790704,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["yellow_tartan"] = {
        ["name"] = "Yellow Tartan",
        ["cost"] = 120,
        ["texture_id"] = 4015651974,
        ["studs_per_tile_u"] = 7,
        ["studs_per_tile_v"] = 7
    },
    ["i_heart_strawberries"] = {
        ["name"] = "I <3 Strawberries",
        ["cost"] = 203,
        ["texture_id"] = 4023572371,
        ["studs_per_tile_u"] = 13,
        ["studs_per_tile_v"] = 13
    },
    ["cups_of_coffee"] = {
        ["name"] = "Cups of Coffee",
        ["cost"] = 43,
        ["texture_id"] = 4023801508,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["autumn_rings"] = {
        ["name"] = "Autumn Rings",
        ["cost"] = 18,
        ["texture_id"] = 4023747332,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["a_panda_summer"] = {
        ["name"] = "A Panda Summer",
        ["cost"] = 48,
        ["texture_id"] = 4023768132,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["goldenrod_terra_cotta"] = {
        ["name"] = "Goldenrod Terra Cotta",
        ["cost"] = 26,
        ["texture_id"] = 4023674852,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    },
    ["unicorn_magic"] = {
        ["name"] = "Unicorn Magic",
        ["cost"] = 36,
        ["texture_id"] = 4023362735,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["steampunk_hearts"] = {
        ["name"] = "Steampunk Hearts",
        ["cost"] = 5000,
        ["texture_id"] = 4023589213,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["tags"] = { "Rare" }
    },
    ["fine_china_tiles"] = {
        ["name"] = "Fine China Tiles",
        ["cost"] = 99,
        ["texture_id"] = 4023822896,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["blue_panda"] = {
        ["name"] = "Blue Panda",
        ["cost"] = 98,
        ["texture_id"] = 4023390259,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["gilded_wicker"] = {
        ["name"] = "Gilded Wicker",
        ["cost"] = 287,
        ["texture_id"] = 4023502262,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["kittycorn"] = {
        ["name"] = "Kittycorn",
        ["cost"] = 42,
        ["texture_id"] = 4023480875,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["pretty_alphabet"] = {
        ["name"] = "Pretty Alphabet",
        ["cost"] = 32,
        ["texture_id"] = 4015649819,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5
    },
    ["zebra_print"] = {
        ["name"] = "Zebra Print",
        ["cost"] = 299,
        ["texture_id"] = 4023522925,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["gold_leafed"] = {
        ["name"] = "Gold Leafed",
        ["cost"] = 200,
        ["texture_id"] = 4023512949,
        ["studs_per_tile_u"] = 13,
        ["studs_per_tile_v"] = 13
    },
    ["fall_mountains"] = {
        ["name"] = "Fall Mountains",
        ["cost"] = 78,
        ["texture_id"] = 4024450121,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["dinos_in_the_dark"] = {
        ["name"] = "Dinos in the Dark",
        ["cost"] = 36,
        ["texture_id"] = 4098194195,
        ["studs_per_tile_u"] = 20,
        ["studs_per_tile_v"] = 20
    },
    ["orange_stripes"] = {
        ["name"] = "Orange Stripes",
        ["cost"] = 50,
        ["texture_id"] = 4037319843,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["blue_stripes"] = {
        ["name"] = "Blue Stripes",
        ["cost"] = 45,
        ["texture_id"] = 4037320156,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["purple_pattern"] = {
        ["name"] = "Purple Pattern",
        ["cost"] = 35,
        ["texture_id"] = 4037321152,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["pink_zag"] = {
        ["name"] = "Pink Zag",
        ["cost"] = 30,
        ["texture_id"] = 4037321506,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["yellow_zag"] = {
        ["name"] = "Yellow Zag",
        ["cost"] = 40,
        ["texture_id"] = 4037320489,
        ["studs_per_tile_u"] = 15,
        ["studs_per_tile_v"] = 15
    },
    ["magic"] = {
        ["name"] = "Magic",
        ["cost"] = 75,
        ["texture_id"] = 4657937214,
        ["studs_per_tile_u"] = 4,
        ["studs_per_tile_v"] = 4
    }
}
v2.floors = v4
local v5 = {
    ["bold_red"] = {
        ["name"] = "Bold Red Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(214, 12, 15)
    },
    ["brown"] = {
        ["name"] = "Brown Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(135, 71, 40)
    },
    ["cream"] = {
        ["name"] = "Cream Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(231, 186, 130)
    },
    ["cyan"] = {
        ["name"] = "Cyan Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(56, 156, 223)
    },
    ["dark_grey"] = {
        ["name"] = "Dark Grey Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(74, 74, 74)
    },
    ["earth_green"] = {
        ["name"] = "Earth Green Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(107, 170, 59)
    },
    ["half_stripes_blue"] = {
        ["name"] = "Blue Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083367082,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["half_stripes_green"] = {
        ["name"] = "Green Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083357711,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["half_stripes_grey"] = {
        ["name"] = "Grey Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083357478,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["half_stripes_orange"] = {
        ["name"] = "Orange Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083429129,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["half_stripes_pink"] = {
        ["name"] = "Pink Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083357278,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["half_stripes_purple"] = {
        ["name"] = "Purple Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083357048,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["half_stripes_red"] = {
        ["name"] = "Red Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083356835,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["half_stripes_yellow"] = {
        ["name"] = "Yellow Half Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13083356570,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["hot_pink"] = {
        ["name"] = "Hot Pink Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(230, 23, 112)
    },
    ["ice_blue"] = {
        ["name"] = "Ice Blue Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(158, 234, 255)
    },
    ["indigo"] = {
        ["name"] = "Indigo Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(47, 44, 84)
    },
    ["lavender"] = {
        ["name"] = "Lavender Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(179, 160, 255)
    },
    ["light_grey"] = {
        ["name"] = "Light Grey Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(176, 176, 176)
    },
    ["ocean_green"] = {
        ["name"] = "Ocean Green Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(57, 203, 137)
    },
    ["oil_paint_splash"] = {
        ["name"] = "Oil Paint Splash Wall Treatment",
        ["cost"] = 45,
        ["texture_id"] = 13009945600,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["pale_orange"] = {
        ["name"] = "Pale Orange Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(220, 138, 55)
    },
    ["pale_pink"] = {
        ["name"] = "Pale Pink Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(255, 158, 205)
    },
    ["palm_leaves_black_white"] = {
        ["name"] = "Palm Leaves Wallpaper",
        ["cost"] = 90,
        ["texture_id"] = 13012342632,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["pastel_yellow"] = {
        ["name"] = "Pastel Yellow Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(255, 255, 127)
    },
    ["plaid_red_black"] = {
        ["name"] = "Red Plaid Wallpaper",
        ["cost"] = 130,
        ["texture_id"] = 13077082722,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["plaid_white_red"] = {
        ["name"] = "White Plaid Wallpaper",
        ["cost"] = 130,
        ["texture_id"] = 13077059699,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["plaid_yellow_black"] = {
        ["name"] = "Yellow Plaid Wallpaper",
        ["cost"] = 130,
        ["texture_id"] = 13077059074,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["rose"] = {
        ["name"] = "Rose Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(254, 65, 65)
    },
    ["royal_purple"] = {
        ["name"] = "Royal Purple Paint",
        ["cost"] = 50,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 5,
        ["studs_per_tile_v"] = 5,
        ["color3"] = Color3.fromRGB(93, 39, 255)
    },
    ["stripes_white"] = {
        ["name"] = "White Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(255, 255, 255)
    },
    ["stripes_yellow"] = {
        ["name"] = "Yellow Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(255, 206, 90)
    },
    ["stone_bricks_beige"] = {
        ["name"] = "Beige Stone Bricks",
        ["cost"] = 120,
        ["texture_id"] = 13085286956,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["stone_bricks_dark"] = {
        ["name"] = "Dark Stone Bricks",
        ["cost"] = 120,
        ["texture_id"] = 13085286810,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["stone_bricks_light"] = {
        ["name"] = "Light Stone Bricks",
        ["cost"] = 120,
        ["texture_id"] = 13085284774,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["stripes_black_gold"] = {
        ["name"] = "Black & Gold Striped Wallpaper",
        ["cost"] = 400,
        ["texture_id"] = 13077053629,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["stripes_blue"] = {
        ["name"] = "Blue Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(90, 197, 255)
    },
    ["stripes_green"] = {
        ["name"] = "Green Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(92, 255, 146)
    },
    ["stripes_orange"] = {
        ["name"] = "Orange Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(255, 114, 48)
    },
    ["stripes_pink"] = {
        ["name"] = "Pink Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(255, 110, 185)
    },
    ["stripes_purple"] = {
        ["name"] = "Purple Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(153, 85, 255)
    },
    ["stripes_red"] = {
        ["name"] = "Red Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047899,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(255, 73, 73)
    },
    ["stripes_white_black"] = {
        ["name"] = "Black & White Striped Wallpaper",
        ["cost"] = 80,
        ["texture_id"] = 13077047738,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_black"] = {
        ["name"] = "Black Tiles",
        ["cost"] = 45,
        ["texture_id"] = 13009945353,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_blue"] = {
        ["name"] = "Blue Tiles",
        ["cost"] = 30,
        ["texture_id"] = 13009936310,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_green"] = {
        ["name"] = "Green Tiles",
        ["cost"] = 45,
        ["texture_id"] = 13009936163,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_orange"] = {
        ["name"] = "Orange Tiles",
        ["cost"] = 30,
        ["texture_id"] = 13009936006,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_pink"] = {
        ["name"] = "Pink Tiles",
        ["cost"] = 45,
        ["texture_id"] = 13009935769,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_purple"] = {
        ["name"] = "Purple Tiles",
        ["cost"] = 45,
        ["texture_id"] = 13009935594,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_red"] = {
        ["name"] = "Red Tiles",
        ["cost"] = 30,
        ["texture_id"] = 13009935380,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_white"] = {
        ["name"] = "White Tiles",
        ["cost"] = 45,
        ["texture_id"] = 13009927274,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["tile_yellow"] = {
        ["name"] = "Yellow Tiles",
        ["cost"] = 30,
        ["texture_id"] = 13107033143,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["ventilation"] = {
        ["name"] = "Vent",
        ["cost"] = 24,
        ["texture_id"] = 13010184462,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["vibrant_orange"] = {
        ["name"] = "Deep Orange Paint",
        ["cost"] = 60,
        ["texture_id"] = 1941502171,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10,
        ["color3"] = Color3.fromRGB(255, 102, 14)
    },
    ["vines_black_white"] = {
        ["name"] = "Black Vines Wallpaper",
        ["cost"] = 130,
        ["texture_id"] = 13077047514,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["vines_green"] = {
        ["name"] = "Green Vines Wallpaper",
        ["cost"] = 90,
        ["texture_id"] = 13077103073,
        ["studs_per_tile_u"] = 10,
        ["studs_per_tile_v"] = 10
    },
    ["wood_planks_beige"] = {
        ["name"] = "Beige Planks",
        ["cost"] = 45,
        ["texture_id"] = 13077064822,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["wood_planks_light"] = {
        ["name"] = "Light Planks",
        ["cost"] = 30,
        ["texture_id"] = 13077064689,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["wood_planks_dark"] = {
        ["name"] = "Dark Planks",
        ["cost"] = 30,
        ["texture_id"] = 13082829785,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["wood_planks_mahogany"] = {
        ["name"] = "Mahogany Planks",
        ["cost"] = 30,
        ["texture_id"] = 13077061107,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["wood_planks_pink"] = {
        ["name"] = "Pink Planks",
        ["cost"] = 45,
        ["texture_id"] = 13077060994,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    },
    ["wood_planks_white"] = {
        ["name"] = "White Planks",
        ["cost"] = 45,
        ["texture_id"] = 13077060877,
        ["studs_per_tile_u"] = 12,
        ["studs_per_tile_v"] = 12
    }
}
v2.walls = v1.Dictionary.merge(v2.walls, v5)
v2.floors = v1.Dictionary.merge(v2.floors, v1.Dictionary.copyDeep(v5))
for v6, v7 in pairs(v2.walls) do
    v7.id = v6
    v7.type = "walls"
    v7.image_id = "rbxthumb://type=Asset&id=" .. v7.texture_id .. "&w=150&h=150"
    v7.texture_id = "rbxassetid://" .. v7.texture_id
    local v8 = {}
    local v9 = 9.875 * v7.studs_per_tile_u
    v8.tile_width = math.ceil(v9)
    local v10 = 9.875 * v7.studs_per_tile_v
    v8.tile_height = math.ceil(v10)
    v7.preview_tile_params = v8
end
for v11, v12 in pairs(v2.floors) do
    v12.id = v11
    v12.type = "floors"
    v12.image_id = "rbxthumb://type=Asset&id=" .. v12.texture_id .. "&w=150&h=150"
    v12.texture_id = "rbxassetid://" .. v12.texture_id
    local v13 = {}
    local v14 = 9.875 * v12.studs_per_tile_u
    v13.tile_width = math.ceil(v14)
    local v15 = 9.875 * v12.studs_per_tile_v
    v13.tile_height = math.ceil(v15)
    v12.preview_tile_params = v13
end
return v2