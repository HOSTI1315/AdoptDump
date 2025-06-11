--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.Houses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("package:t")
local v3 = v1("EntryHelper").houses
local v4 = {
    ["micro"] = {
        ["name"] = "Tiny Home",
        ["model_name"] = "Micro",
        ["image"] = "rbxassetid://2014715420",
        ["order"] = 0,
        ["is_for_sale"] = false,
        ["no_parties"] = true,
        ["rarity"] = "house"
    },
    ["micro_2023"] = {
        ["name"] = "Tiny Home",
        ["model_name"] = "Micro2023",
        ["exterior_name"] = "Micro",
        ["image"] = "rbxassetid://2014715420",
        ["order"] = 100,
        ["cost"] = 240,
        ["is_for_sale"] = true,
        ["no_parties"] = true,
        ["rarity"] = "house"
    },
    ["family"] = {
        ["name"] = "Family Home",
        ["model_name"] = "FamilyHouse",
        ["image"] = "rbxassetid://2014715992",
        ["order"] = 200,
        ["cost"] = 489,
        ["is_for_sale"] = true,
        ["no_parties"] = true,
        ["rarity"] = "house"
    }
}
local v5 = {
    ["name"] = "Pizza Place",
    ["model_name"] = "PlayerPizzaPlace",
    ["image"] = "rbxassetid://2622413928",
    ["order"] = 300,
    ["cost"] = 500,
    ["is_for_sale"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "pizzaplace" }
    },
    ["rarity"] = "house"
}
v4.pizzaplace = v5
v4.treehouse = {
    ["name"] = "Treehouse",
    ["model_name"] = "TreeHouse",
    ["image"] = "rbxassetid://3105270249",
    ["order"] = 400,
    ["cost"] = 800,
    ["is_for_sale"] = true,
    ["rarity"] = "house"
}
v4.estate = {
    ["name"] = "Estate",
    ["model_name"] = "Estate",
    ["image"] = "rbxassetid://2014996877",
    ["order"] = 500,
    ["cost"] = 972,
    ["is_for_sale"] = true,
    ["rarity"] = "house"
}
local v6 = {
    ["name"] = "Fairy House",
    ["model_name"] = "FairyHouse",
    ["image"] = "rbxassetid://3239297539",
    ["order"] = 600,
    ["cost"] = 1100,
    ["is_for_sale"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "fairy" }
    },
    ["rarity"] = "house"
}
v4.fairy = v6
local v7 = {
    ["name"] = "Donut Shop",
    ["model_name"] = "DonutShop",
    ["image"] = "rbxassetid://2832957791",
    ["order"] = 700,
    ["cost"] = 1299,
    ["is_for_sale"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "donutshop" }
    },
    ["rarity"] = "house"
}
v4.donutshop = v7
local v8 = {
    ["name"] = "Castle",
    ["model_name"] = "SmallCastle",
    ["image"] = "rbxassetid://2167358558",
    ["order"] = 800,
    ["cost"] = 1499,
    ["is_for_sale"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "castle" }
    },
    ["rarity"] = "house"
}
v4.smallcastle = v8
v4.shophouse = {
    ["name"] = "Shop House",
    ["model_name"] = "ShopHouse",
    ["image"] = "rbxassetid://3866822624",
    ["order"] = 900,
    ["cost"] = 1750,
    ["is_for_sale"] = true,
    ["additional_doors"] = { "TopDoor" },
    ["rarity"] = "house"
}
v4.container_home = {
    ["name"] = "Container Home",
    ["model_name"] = "ContainerHome",
    ["image"] = "rbxassetid://6506580050",
    ["order"] = 950,
    ["cost"] = 1800,
    ["is_for_sale"] = true,
    ["additional_doors"] = { "MainDoor2", "MainDoor3" },
    ["rarity"] = "house"
}
local v9 = {
    ["name"] = "Scary House",
    ["model_name"] = "ScaryHouse",
    ["image"] = "rbxassetid://7939912341",
    ["order"] = 975,
    ["cost"] = 1800,
    ["is_for_sale"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "scary" }
    },
    ["rarity"] = "house"
}
v4.scary_house = v9
local v10 = {
    ["name"] = "Gingerbread House",
    ["model_name"] = "GingerbreadHouse",
    ["image"] = "rbxassetid://4486829401",
    ["order"] = 1000,
    ["cost"] = 1850,
    ["is_for_sale"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "gingerbread" }
    },
    ["rarity"] = "house"
}
v4.gingerbread = v10
local v11 = {
    ["name"] = "Lunar House",
    ["model_name"] = "LunarHouse",
    ["image"] = "rbxassetid://6276452174",
    ["order"] = 1150,
    ["cost"] = 2000,
    ["is_for_sale"] = true,
    ["additional_doors"] = { "MainDoor2" },
    ["recommended_furniture"] = {
        ["tags"] = { "lunar" }
    },
    ["rarity"] = "house"
}
v4.lunar_house = v11
v4.crooked_house = {
    ["name"] = "Crooked House",
    ["model_name"] = "CrookedHouse",
    ["image"] = "rbxassetid://7058792916",
    ["order"] = 1175,
    ["cost"] = 2000,
    ["is_for_sale"] = true,
    ["rarity"] = "house"
}
local v12 = {
    ["name"] = "Sandbox Island",
    ["model_name"] = "SandboxIsland",
    ["image"] = "rbxassetid://8770266513",
    ["order"] = 1250,
    ["cost"] = 2250,
    ["is_for_sale"] = true,
    ["allow_touch_door_leaving"] = true,
    ["disable_setting_wall_textures"] = true,
    ["disable_setting_floor_textures"] = true,
    ["additional_doors"] = { "BackDoor" },
    ["default_color"] = Color3.fromRGB(213, 122, 77),
    ["terrain_properties"] = {
        ["WaterColor"] = Color3.fromRGB(43, 132, 157),
        ["WaterReflectance"] = 1,
        ["WaterTransparency"] = 0.3,
        ["WaterWaveSize"] = 0,
        ["WaterWaveSpeed"] = 4
    },
    ["recommended_furniture"] = {
        ["content_packs"] = { "SandboxIsland2022" }
    },
    ["rarity"] = "house"
}
v4.sandbox_island = v12
local v13 = {
    ["name"] = "Futuristic House",
    ["model_name"] = "FutureHouse",
    ["image"] = "rbxassetid://2873301164",
    ["order"] = 1300,
    ["cost"] = 2500,
    ["is_for_sale"] = true,
    ["additional_doors"] = { "MainDoor2" },
    ["mailbox_offset"] = CFrame.new(10, 0, 0),
    ["recommended_furniture"] = {
        ["tags"] = { "future" }
    },
    ["rarity"] = "house"
}
v4.future = v13
local v14 = {
    ["name"] = "Modern Mansion",
    ["model_name"] = "ModernMansion",
    ["image"] = "rbxassetid://3611948743",
    ["gamepass"] = "modern_mansion",
    ["order"] = 1400,
    ["is_for_sale"] = false,
    ["additional_doors"] = { "TopDoor" },
    ["recommended_furniture"] = {
        ["tags"] = { "modern" }
    },
    ["rarity"] = "house"
}
v4.modern_mansion = v14
local v15 = {
    ["name"] = "Royal Palace",
    ["model_name"] = "RoyalPalace",
    ["image"] = "rbxassetid://10524631670",
    ["is_for_sale"] = true,
    ["additional_doors"] = { "Floor2" },
    ["order"] = 1520,
    ["cost"] = 2750,
    ["recommended_furniture"] = {
        ["content_packs"] = { "RoyalPalace2022" }
    },
    ["rarity"] = "house"
}
v4.royal_palace = v15
local v16 = {
    ["name"] = "Dragon\'s Castle",
    ["model_name"] = "DragonsCastle",
    ["image"] = "rbxassetid://3371095357",
    ["order"] = 1600,
    ["cost"] = 3000,
    ["is_for_sale"] = true,
    ["additional_doors"] = { "TopDoor" },
    ["recommended_furniture"] = {
        ["tags"] = { "castle" }
    },
    ["rarity"] = "house"
}
v4.dragonscastle = v16
local v17 = {
    ["name"] = "Party House",
    ["model_name"] = "PartyHouse",
    ["image"] = "rbxassetid://2015090221",
    ["order"] = 1700,
    ["cost"] = 3575,
    ["is_for_sale"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "party" }
    },
    ["rarity"] = "house"
}
v4.party = v17
local v18 = {
    ["name"] = "Hollywood House",
    ["model_name"] = "HollywoodHouse",
    ["image"] = "rbxassetid://4244608850",
    ["order"] = 1800,
    ["cost"] = 4500,
    ["is_for_sale"] = true
}
local v19 = {
    ["FrontSign"] = {
        ["default_text"] = "NOW SHOWING\nJURRASIC BARK\nMISSION IMPAWSIBLE\nSHERLOCK BONES",
        ["max_length"] = 70
    }
}
v18.text_signs = v19
v18.rarity = "house"
v4.hollywood_house = v18
v4.apartment = {
    ["name"] = "Luxury Apartments",
    ["model_name"] = "Apartment",
    ["image"] = "rbxassetid://4773071742",
    ["order"] = 2100,
    ["cost"] = 8000,
    ["is_for_sale"] = true,
    ["additional_doors"] = {
        "Floor1",
        "Floor2",
        "Floor3",
        "Floor4",
        "Floor5"
    },
    ["rarity"] = "house"
}
v4.celebrity = {
    ["name"] = "Celebrity Mansion",
    ["model_name"] = "CelebrityMansion",
    ["image"] = "rbxassetid://3186426438",
    ["order"] = 2110,
    ["gamepass"] = "celebrity",
    ["is_for_sale"] = false,
    ["additional_doors"] = { "MainDoor2" },
    ["rarity"] = "house"
}
v4.millionaire = {
    ["name"] = "Millionaire Mansion",
    ["model_name"] = "Millionaire",
    ["image"] = "rbxassetid://2955959958",
    ["order"] = 2120,
    ["gamepass"] = "millionaire",
    ["is_for_sale"] = false,
    ["additional_doors"] = { "MainDoor2", "MainDoor3" },
    ["rarity"] = "house"
}
local v20 = {
    ["name"] = "Space Fleet House",
    ["model_name"] = "SpaceHouse",
    ["image"] = "rbxassetid://9367584952",
    ["order"] = 2400,
    ["gamepass"] = "space_bundle_2022",
    ["is_for_sale"] = false,
    ["additional_doors"] = { "MainDoor2" },
    ["default_properties"] = {
        ["low_gravity"] = false
    },
    ["validate_properties"] = v2.strictInterface({
        ["low_gravity"] = v2.boolean
    }),
    ["recommended_furniture"] = {
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["rarity"] = "house"
}
v4.space_house = v20
local v21 = {
    ["name"] = "A Very Very Important Person\'s House",
    ["model_name"] = "VIPHouse",
    ["image"] = "rbxassetid://9852426394",
    ["order"] = 2600,
    ["gamepass"] = "vip",
    ["is_for_sale"] = false,
    ["additional_doors"] = { "Floor2", "Floor3" },
    ["default_color"] = Color3.fromRGB(242, 243, 243),
    ["terrain_properties"] = {
        ["WaterColor"] = Color3.fromRGB(79, 232, 255),
        ["WaterTransparency"] = 0.5
    },
    ["recommended_furniture"] = {
        ["content_packs"] = { "VIP2022" }
    },
    ["rarity"] = "house"
}
v4.vip_house = v21
local v22 = {
    ["name"] = "Igloo Home",
    ["model_name"] = "IglooHouse",
    ["image"] = "rbxassetid://11706099363",
    ["order"] = 1590,
    ["cost"] = 2999,
    ["is_for_sale"] = true,
    ["default_color"] = Color3.fromRGB(216, 102, 36),
    ["recommended_furniture"] = {
        ["content_packs"] = { "Winter2022" },
        ["tags"] = { "winter" }
    },
    ["rarity"] = "house"
}
v4.igloo_house = v22
local v23 = {
    ["name"] = "Bunker House",
    ["model_name"] = "BunkerHouse",
    ["image"] = "rbxassetid://11242818871",
    ["order"] = 350,
    ["cost"] = 750,
    ["is_for_sale"] = true,
    ["default_color"] = Color3.fromRGB(218, 133, 65),
    ["recommended_furniture"] = {
        ["content_packs"] = { "Bunker2022" }
    },
    ["rarity"] = "house"
}
v4.bunker_house = v23
local v24 = {
    ["name"] = "Mountain House",
    ["model_name"] = "CastleHouse",
    ["image"] = "rbxassetid://12431510570",
    ["order"] = 1610,
    ["cost"] = 3000,
    ["is_for_sale"] = true,
    ["mailbox_offset"] = CFrame.new(0, 0, -0.75),
    ["disable_setting_wall_textures"] = true,
    ["disable_setting_floor_textures"] = true,
    ["allow_touch_door_leaving"] = true,
    ["align_spawned_furniture_to_world_space"] = true,
    ["recommended_furniture"] = {
        ["content_packs"] = { "ModularCastles2023" }
    },
    ["rarity"] = "house"
}
v4.castle_house = v24
local v25 = {
    ["name"] = "Hospital Home",
    ["model_name"] = "HospitalHouse",
    ["image"] = "rbxassetid://13184006772",
    ["order"] = 2450,
    ["gamepass"] = "school_hospital_2023_gamepass",
    ["is_for_sale"] = false,
    ["default_color"] = Color3.fromRGB(248, 248, 248),
    ["recommended_furniture"] = {
        ["tags"] = { "HospitalRefresh2023" }
    },
    ["rarity"] = "house"
}
v4.hospital_house = v25
local v26 = {
    ["name"] = "Schoolhouse Home",
    ["model_name"] = "SchoolHouse",
    ["image"] = "rbxassetid://13349967096",
    ["order"] = 2425,
    ["gamepass"] = "school_hospital_2023_gamepass",
    ["is_for_sale"] = false,
    ["default_color"] = Color3.fromRGB(196, 40, 28),
    ["recommended_furniture"] = {
        ["tags"] = { "SchoolRefresh2023" }
    },
    ["rarity"] = "house"
}
v4.school_house = v26
local v27 = {
    ["name"] = "Toyshop House",
    ["model_name"] = "ToyshopHouse",
    ["image"] = "rbxassetid://98423388923277",
    ["order"] = 2550,
    ["gamepass"] = "kiwi_2023_toyshop_house",
    ["is_for_sale"] = false,
    ["default_color"] = Color3.fromRGB(20, 74, 125),
    ["recommended_furniture"] = {
        ["tags"] = { "ToyshopPlaceable" }
    },
    ["rarity"] = "house"
}
v4.toyshop_house = v27
v4.safari_house = {
    ["name"] = "Safari Home",
    ["model_name"] = "SafariHouse",
    ["image"] = "rbxassetid://13741262519",
    ["order"] = 2250,
    ["cost"] = 2100,
    ["is_for_sale"] = true,
    ["default_color"] = Color3.fromRGB(212, 100, 62),
    ["rarity"] = "house"
}
v4.racetrack_house = {
    ["name"] = "Racetrack House",
    ["model_name"] = "RacetrackHouse",
    ["image"] = "rbxassetid://13976971851",
    ["order"] = 1200,
    ["cost"] = 2200,
    ["is_for_sale"] = true,
    ["allow_touch_door_leaving"] = true,
    ["disable_setting_wall_textures"] = true,
    ["disable_setting_floor_textures"] = true,
    ["additional_doors"] = { "BackDoor" },
    ["default_color"] = Color3.fromRGB(196, 40, 28),
    ["rarity"] = "house"
}
local v28 = {
    ["name"] = "Expandable Hillside Mansion",
    ["model_name"] = "HillsideMansion",
    ["image"] = "rbxassetid://14517985948",
    ["order"] = 322,
    ["cost"] = 1500,
    ["is_for_sale"] = true
}
local v29 = {
    ["basement"] = {
        ["name"] = "Basement",
        ["cost"] = 500,
        ["order"] = 4
    },
    ["second_floor"] = {
        ["name"] = "Second Floor",
        ["cost"] = 800,
        ["order"] = 1
    },
    ["side_extension"] = {
        ["name"] = "Side Extension",
        ["cost"] = 800,
        ["order"] = 2
    },
    ["side_extension_2"] = {
        ["name"] = "West Wing",
        ["cost"] = 800,
        ["order"] = 3
    }
}
v28.addons = v29
v28.mailbox_offset = CFrame.new(15, 0, -2)
v28.rarity = "house"
v4.hillside_mansion = v28
local v30 = {
    ["name"] = "Expandable Luxury Mansion",
    ["model_name"] = "LuxuryHouse",
    ["image"] = "rbxassetid://14516464431",
    ["order"] = 323,
    ["is_for_sale"] = false,
    ["gamepass"] = "expandable_houses_2023_luxury_house"
}
local v31 = {
    ["extension_2"] = {
        ["name"] = "Party Rooms",
        ["cost"] = 900,
        ["order"] = 1
    },
    ["extension_3"] = {
        ["name"] = "Second Floor - East",
        ["cost"] = 1000,
        ["order"] = 2
    },
    ["extension_4"] = {
        ["name"] = "Second Floor - West",
        ["cost"] = 950,
        ["order"] = 3
    },
    ["extension_5"] = {
        ["name"] = "Basement",
        ["cost"] = 600,
        ["order"] = 4
    }
}
v30.addons = v31
v30.rarity = "house"
v4.luxury_house = v30
local v32 = {
    ["name"] = "Expandable Friendly Home",
    ["model_name"] = "FriendlyHome",
    ["image"] = "rbxassetid://14516464817",
    ["order"] = 321,
    ["cost"] = 675,
    ["is_for_sale"] = true
}
local v33 = {
    ["extension_2"] = {
        ["name"] = "Second Floor",
        ["cost"] = 500,
        ["order"] = 1
    },
    ["extension_3"] = {
        ["name"] = "Basement",
        ["cost"] = 125,
        ["order"] = 2
    },
    ["extension_4"] = {
        ["name"] = "Rear Extension",
        ["cost"] = 250,
        ["order"] = 3
    },
    ["extension_5"] = {
        ["name"] = "Side Extension",
        ["cost"] = 325,
        ["order"] = 4
    }
}
v32.addons = v33
v32.rarity = "house"
v4.friendly_home = v32
v4.haunted_house = {
    ["name"] = "Haunted House",
    ["model_name"] = "HauntedHouse",
    ["image"] = "rbxassetid://14849486951",
    ["order"] = 1125,
    ["cost"] = 1950,
    ["is_for_sale"] = true,
    ["default_color"] = Color3.fromRGB(212, 100, 62),
    ["rarity"] = "house"
}
v4.queenslander_home = {
    ["name"] = "Queenslander House",
    ["model_name"] = "QueenslanderHome",
    ["image"] = "rbxassetid://15672601440",
    ["order"] = 310,
    ["cost"] = 1650,
    ["is_for_sale"] = true,
    ["default_color"] = Color3.fromRGB(102, 119, 176),
    ["mailbox_offset"] = CFrame.new(-3, 0, 0),
    ["rarity"] = "house"
}
local v34 = {
    ["name"] = "Korean House",
    ["model_name"] = "KoreanHouse",
    ["image"] = "rbxassetid://16187561673",
    ["order"] = 309,
    ["cost"] = 2200,
    ["is_for_sale"] = true,
    ["default_color"] = Color3.fromRGB(102, 119, 176),
    ["mailbox_offset"] = CFrame.new(-3, 0, 0),
    ["recommended_furniture"] = {
        ["content_packs"] = { "Lunar2024" }
    },
    ["additional_doors"] = { "TopDoor" },
    ["rarity"] = "house"
}
v4.korean_house = v34
return v3(v4)