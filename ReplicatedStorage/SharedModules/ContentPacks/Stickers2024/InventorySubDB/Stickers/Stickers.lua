--// ReplicatedStorage.SharedModules.ContentPacks.Stickers2024.InventorySubDB.Stickers (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("package:Sift")
local v2 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v3 = {
    ["stickers_2024_pink_cat_pet"] = {
        ["name"] = "Pink Cat Sticker",
        ["image"] = "rbxassetid://16724737351",
        ["image_large"] = "rbxassetid://16880325842",
        ["rarity"] = "common",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_blue_dog_pet"] = {
        ["name"] = "Blue Dog Sticker",
        ["image"] = "rbxassetid://16716755493",
        ["image_large"] = "rbxassetid://16880226260",
        ["rarity"] = "common",
        ["tags"] = { "pets" }
    }
}
local v4 = {
    ["stickers_2024_grey_cat_pet"] = {
        ["name"] = "Cat Sticker",
        ["image"] = "rbxassetid://16723019826",
        ["image_large"] = "rbxassetid://16880274652",
        ["rarity"] = "common",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_mouse_pet"] = {
        ["name"] = "Mouse Sticker",
        ["image"] = "rbxassetid://16723727370",
        ["image_large"] = "rbxassetid://16880303931",
        ["rarity"] = "common",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_raccoon_pet"] = {
        ["name"] = "Raccoon Sticker",
        ["image"] = "rbxassetid://16716773388",
        ["image_large"] = "rbxassetid://16880226464",
        ["rarity"] = "common",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_fire_emote"] = {
        ["name"] = "Fire Sticker",
        ["image"] = "rbxassetid://16712402062",
        ["image_large"] = "rbxassetid://16880114047",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_heart_emote"] = {
        ["name"] = "Heart Sticker",
        ["image"] = "rbxassetid://16712402106",
        ["image_large"] = "rbxassetid://16880114159",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_eyes_emote"] = {
        ["name"] = "Eyes Sticker",
        ["image"] = "rbxassetid://16712402009",
        ["image_large"] = "rbxassetid://16880113937",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_confetti_emote"] = {
        ["name"] = "Tada Sticker",
        ["image"] = "rbxassetid://16712401935",
        ["image_large"] = "rbxassetid://16880113849",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_cool_emote"] = {
        ["name"] = "Emoji - Sunglasses Sticker",
        ["image"] = "rbxassetid://16712646323",
        ["image_large"] = "rbxassetid://16880126441",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_laugh_cry_emote"] = {
        ["name"] = "Emoji - Joy Sticker",
        ["image"] = "rbxassetid://16712646399",
        ["image_large"] = "rbxassetid://16880126528",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_smile_emote"] = {
        ["name"] = "Emoji - Smile Sticker",
        ["image"] = "rbxassetid://16712390722",
        ["image_large"] = "rbxassetid://16880076572",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_sweat_emote"] = {
        ["name"] = "Emoji - Sweat Sticker",
        ["image"] = "rbxassetid://16712390616",
        ["image_large"] = "rbxassetid://16880076445",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_question_emote"] = {
        ["name"] = "Emoji - Thinking Sticker",
        ["image"] = "rbxassetid://16712390895",
        ["image_large"] = "rbxassetid://16880076730",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_surprised_emote"] = {
        ["name"] = "Emoji - Surprised Sticker",
        ["image"] = "rbxassetid://16712401771",
        ["image_large"] = "rbxassetid://16880076868",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_100_emote"] = {
        ["name"] = "100 Sticker",
        ["image"] = "rbxassetid://16712401860",
        ["image_large"] = "rbxassetid://16880077057",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_plain_cheese_pizza_misc"] = {
        ["name"] = "Cheese Pizza Sticker",
        ["image"] = "rbxassetid://16714646290",
        ["image_large"] = "rbxassetid://16880158706",
        ["rarity"] = "common",
        ["tags"] = { "misc" }
    },
    ["stickers_2024_pepperoni_pizza_misc"] = {
        ["name"] = "Pepperoni Pizza Sticker",
        ["image"] = "rbxassetid://16714646372",
        ["image_large"] = "rbxassetid://16880158830",
        ["rarity"] = "common",
        ["tags"] = { "misc" }
    },
    ["stickers_2024_mushroom_pizza_misc"] = {
        ["name"] = "Mushroom Pizza Sticker",
        ["image"] = "rbxassetid://16714646514",
        ["image_large"] = "rbxassetid://16880158970",
        ["rarity"] = "common",
        ["tags"] = { "misc" }
    },
    ["stickers_2024_ham_and_pineapple_pizza_misc"] = {
        ["name"] = "Hawaiian Pizza Sticker",
        ["image"] = "rbxassetid://16714646662",
        ["image_large"] = "rbxassetid://16880159124",
        ["rarity"] = "common",
        ["tags"] = { "misc" }
    },
    ["stickers_2024_tree_1_environment"] = {
        ["name"] = "Tree 1 Sticker",
        ["image"] = "rbxassetid://16712646469",
        ["image_large"] = "rbxassetid://16880126654",
        ["rarity"] = "common",
        ["tags"] = { "environment" }
    },
    ["stickers_2024_tree_2_environment"] = {
        ["name"] = "Tree 2 Sticker",
        ["image"] = "rbxassetid://16712646538",
        ["image_large"] = "rbxassetid://16880147008",
        ["rarity"] = "common",
        ["tags"] = { "environment" }
    },
    ["stickers_2024_tree_3_environment"] = {
        ["name"] = "Tree 3 Sticker",
        ["image"] = "rbxassetid://16712646619",
        ["image_large"] = "rbxassetid://16880147195",
        ["rarity"] = "common",
        ["tags"] = { "environment" }
    },
    ["stickers_2024_rose_environment"] = {
        ["name"] = "Rose Sticker",
        ["image"] = "rbxassetid://16712646669",
        ["image_large"] = "rbxassetid://16880147327",
        ["rarity"] = "common",
        ["tags"] = { "environment" }
    },
    ["stickers_2024_grass_platform_environment"] = {
        ["name"] = "Grass Plain Sticker",
        ["image"] = "rbxassetid://16713729220",
        ["image_large"] = "rbxassetid://16880147452",
        ["rarity"] = "common",
        ["tags"] = { "environment" }
    },
    ["stickers_2024_cloud_1_environment"] = {
        ["name"] = "Cloud 1 Sticker",
        ["image"] = "rbxassetid://16713729319",
        ["image_large"] = "rbxassetid://16880147596",
        ["rarity"] = "common",
        ["tags"] = { "environment" }
    },
    ["stickers_2024_cloud_2_environment"] = {
        ["name"] = "Cloud 2 Sticker",
        ["image"] = "rbxassetid://16713729400",
        ["image_large"] = "rbxassetid://16880147752",
        ["rarity"] = "common",
        ["tags"] = { "environment" }
    },
    ["stickers_2024_zzz_emote"] = {
        ["name"] = "Zzz Sticker",
        ["image"] = "rbxassetid://16712390524",
        ["image_large"] = "rbxassetid://16880076320",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_spiral_emote"] = {
        ["name"] = "Dizzy Sticker",
        ["image"] = "rbxassetid://16712483866",
        ["image_large"] = "rbxassetid://16880114317",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_angry_emote"] = {
        ["name"] = "Angry Sticker",
        ["image"] = "rbxassetid://16712483950",
        ["image_large"] = "rbxassetid://16880114439",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_exclamation_emote"] = {
        ["name"] = "Exclamation Sticker",
        ["image"] = "rbxassetid://16712484043",
        ["image_large"] = "rbxassetid://16880126118",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_question_mark_emote"] = {
        ["name"] = "Question Sticker",
        ["image"] = "rbxassetid://16712484116",
        ["image_large"] = "rbxassetid://16880126225",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_star_emote"] = {
        ["name"] = "Star Sticker",
        ["image"] = "rbxassetid://16712484176",
        ["image_large"] = "rbxassetid://16880126325",
        ["rarity"] = "common",
        ["tags"] = { "emotes" }
    },
    ["stickers_2024_bucks_misc"] = {
        ["name"] = "Bucks Sticker",
        ["image"] = "rbxassetid://16714835666",
        ["image_large"] = "rbxassetid://16880159286",
        ["rarity"] = "common",
        ["tags"] = { "misc" }
    }
}
local v5 = {
    ["stickers_2024_dog_pet"] = {
        ["name"] = "Dog Sticker",
        ["image"] = "rbxassetid://16722877105",
        ["image_large"] = "rbxassetid://16880248009",
        ["rarity"] = "common",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_parakeet_pet"] = {
        ["name"] = "Parakeet Sticker",
        ["image"] = "rbxassetid://16879949898",
        ["image_large"] = "rbxassetid://16880226046",
        ["rarity"] = "common",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_zebra_pet"] = {
        ["name"] = "Zebra Sticker",
        ["image"] = "rbxassetid://16879950236",
        ["image_large"] = "rbxassetid://16880291020",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_koi_fish_pet"] = {
        ["name"] = "Koi Sticker",
        ["image"] = "rbxassetid://16879897479",
        ["image_large"] = "rbxassetid://16880226176",
        ["rarity"] = "uncommon",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_toucan_pet"] = {
        ["name"] = "Toucan Sticker",
        ["image"] = "rbxassetid://16879950388",
        ["image_large"] = "rbxassetid://16880336158",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_lamb_pet"] = {
        ["name"] = "Lamb Sticker",
        ["image"] = "rbxassetid://16723751099",
        ["image_large"] = "rbxassetid://16880304017",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_fallow_deer_pet"] = {
        ["name"] = "Fallow Deer Sticker",
        ["image"] = "rbxassetid://16722998810",
        ["image_large"] = "rbxassetid://16880262992",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_penguin_pet"] = {
        ["name"] = "Penguin Sticker",
        ["image"] = "rbxassetid://16723030254",
        ["image_large"] = "rbxassetid://16880275255",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_unicorn_pet"] = {
        ["name"] = "Unicorn Sticker",
        ["image"] = "rbxassetid://16879897804",
        ["image_large"] = "rbxassetid://16880262871",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_dragon_pet"] = {
        ["name"] = "Dragon Sticker",
        ["image"] = "rbxassetid://16722678583",
        ["image_large"] = "rbxassetid://16880247915",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    }
}
local v6 = {
    ["name"] = "Dragon Breath Animated Sticker",
    ["image"] = "rbxassetid://16912127218",
    ["rarity"] = "legendary",
    ["tags"] = { "pets" }
}
local v7 = {
    ["rows"] = 1,
    ["columns"] = 2,
    ["framerate"] = 2,
    ["frame_count"] = 2
}
local v8 = {
    ["icon"] = {
        ["image"] = "rbxassetid://16912175898",
        ["size"] = Vector2.new(140, 70)
    },
    ["default"] = {
        ["image"] = "rbxassetid://16912176036",
        ["size"] = Vector2.new(280, 140)
    },
    ["large"] = {
        ["image"] = "rbxassetid://16912178024",
        ["size"] = Vector2.new(560, 280)
    }
}
v7.sprite_sheets = v8
v6.flipbook_properties = v7
v5.stickers_2024_dragon_animated_pet = v6
v5.stickers_2024_squid_pet = {
    ["name"] = "Squid Sticker",
    ["image"] = "rbxassetid://16724737219",
    ["image_large"] = "rbxassetid://16880325747",
    ["rarity"] = "legendary",
    ["tags"] = { "pets" }
}
v5.stickers_2024_red_panda_pet = {
    ["name"] = "Red Panda Sticker",
    ["image"] = "rbxassetid://16725442913",
    ["image_large"] = "rbxassetid://16880326249",
    ["rarity"] = "rare",
    ["tags"] = { "pets" }
}
v5.stickers_2024_ladybug_pet = {
    ["name"] = "Ladybug Sticker",
    ["image"] = "rbxassetid://16723030351",
    ["image_large"] = "rbxassetid://16880290696",
    ["rarity"] = "ultra_rare",
    ["tags"] = { "pets" }
}
v5.stickers_2024_diamond_ladybug_pet = {
    ["name"] = "Diamond Ladybug Sticker",
    ["image"] = "rbxassetid://16716755636",
    ["image_large"] = "rbxassetid://16880226369",
    ["rarity"] = "legendary",
    ["tags"] = { "pets" }
}
v5.stickers_2024_bee_pet = {
    ["name"] = "Bee Sticker",
    ["image"] = "rbxassetid://17103461365",
    ["image_large"] = "rbxassetid://17103461541",
    ["rarity"] = "ultra_rare",
    ["tags"] = { "pets" }
}
v5.stickers_2024_diamond_bee_pet = {
    ["name"] = "Queen Bee Sticker",
    ["image"] = "rbxassetid://16724922013",
    ["image_large"] = "rbxassetid://16880326041",
    ["rarity"] = "legendary",
    ["tags"] = { "pets" }
}
v5.stickers_2024_seahorse_pet = {
    ["name"] = "Seahorse Sticker",
    ["image"] = "rbxassetid://16722678536",
    ["image_large"] = "rbxassetid://16880247825",
    ["rarity"] = "uncommon",
    ["tags"] = { "pets" }
}
v5.stickers_2024_ocelot_pet = {
    ["name"] = "Ocelot Sticker",
    ["image"] = "rbxassetid://16715160457",
    ["image_large"] = "rbxassetid://16880159379",
    ["rarity"] = "uncommon",
    ["tags"] = { "pets" }
}
v5.stickers_2024_donkey_pet = {
    ["name"] = "Donkey Sticker",
    ["image"] = "rbxassetid://16725442610",
    ["image_large"] = "rbxassetid://16880326117",
    ["rarity"] = "common",
    ["tags"] = { "pets" }
}
v5.stickers_2024_beaver_pet = {
    ["name"] = "Beaver Sticker",
    ["image"] = "rbxassetid://16724299662",
    ["image_large"] = "rbxassetid://16880313756",
    ["rarity"] = "common",
    ["tags"] = { "pets" }
}
v5.stickers_2024_sloth_pet = {
    ["name"] = "Sloth Sticker",
    ["image"] = "rbxassetid://16716773161",
    ["image_large"] = "rbxassetid://16880226537",
    ["rarity"] = "uncommon",
    ["tags"] = { "pets" }
}
v5.stickers_2024_silly_duck_pet = {
    ["name"] = "Silly Duck Sticker",
    ["image"] = "rbxassetid://16879950146",
    ["image_large"] = "rbxassetid://16880275107",
    ["rarity"] = "rare",
    ["tags"] = { "pets" }
}
v5.stickers_2024_toad_pet = {
    ["name"] = "Bullfrog Sticker",
    ["image"] = "rbxassetid://16724014166",
    ["image_large"] = "rbxassetid://16880313490",
    ["rarity"] = "common",
    ["tags"] = { "pets" }
}
v5.stickers_2024_kiwi_pet = {
    ["name"] = "Kiwi Sticker",
    ["image"] = "rbxassetid://16725489765",
    ["image_large"] = "rbxassetid://16880336368",
    ["rarity"] = "uncommon",
    ["tags"] = { "pets" }
}
local v9 = {
    ["stickers_2024_orange_cat_pet"] = {
        ["name"] = "Ginger Cat Sticker",
        ["image"] = "rbxassetid://16715375962",
        ["image_large"] = "rbxassetid://16880194549",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_cow_pet"] = {
        ["name"] = "Cow Sticker",
        ["image"] = "rbxassetid://16879950023",
        ["image_large"] = "rbxassetid://16880274995",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_flamingo_pet"] = {
        ["name"] = "Flamingo Sticker",
        ["image"] = "rbxassetid://16723019765",
        ["image_large"] = "rbxassetid://16880263120",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_shiba_inu_pet"] = {
        ["name"] = "Shiba Inu Sticker",
        ["image"] = "rbxassetid://16715375767",
        ["image_large"] = "rbxassetid://16880194411",
        ["rarity"] = "uncommon",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_kitsune_pet"] = {
        ["name"] = "Kitsune Sticker",
        ["image"] = "rbxassetid://16722678748",
        ["image_large"] = "rbxassetid://16880248107",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_red_fox_pet"] = {
        ["name"] = "Fox Sticker",
        ["image"] = "rbxassetid://16723726688",
        ["image_large"] = "rbxassetid://16880291372",
        ["rarity"] = "uncommon",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_koala_pet"] = {
        ["name"] = "Koala Sticker",
        ["image"] = "rbxassetid://16722877311",
        ["image_large"] = "rbxassetid://16880248698",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_panda_pet"] = {
        ["name"] = "Panda Sticker",
        ["image"] = "rbxassetid://16879897583",
        ["image_large"] = "rbxassetid://16880262528",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_sasquatch_pet"] = {
        ["name"] = "Sasquatch Sticker",
        ["image"] = "rbxassetid://16722998318",
        ["image_large"] = "rbxassetid://16880262768",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_winged_horse_pet"] = {
        ["name"] = "Winged Horse Sticker",
        ["image"] = "rbxassetid://16879897704",
        ["image_large"] = "rbxassetid://16880262654",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_space_whale_pet"] = {
        ["name"] = "Space Whale Sticker",
        ["image"] = "rbxassetid://16724300045",
        ["image_large"] = "rbxassetid://16880314021",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_poodle_pet"] = {
        ["name"] = "Poodle Sticker",
        ["image"] = "rbxassetid://16879897193",
        ["image_large"] = "rbxassetid://16880194665",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_silly_rock_pet"] = {
        ["name"] = "Pet Rock Sticker",
        ["image"] = "rbxassetid://16725442978",
        ["image_large"] = "rbxassetid://16880336055",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_elephant_pet"] = {
        ["name"] = "Elephant Sticker",
        ["image"] = "rbxassetid://16715464461",
        ["image_large"] = "rbxassetid://16880211879",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_pig_pet"] = {
        ["name"] = "Pig Sticker",
        ["image"] = "rbxassetid://16723019892",
        ["image_large"] = "rbxassetid://16880274807",
        ["rarity"] = "rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_dalmation_pet"] = {
        ["name"] = "Dalmatian Sticker",
        ["image"] = "rbxassetid://16879950329",
        ["image_large"] = "rbxassetid://16880313637",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_bat_dragon_pet"] = {
        ["name"] = "Bat Dragon Sticker",
        ["image"] = "rbxassetid://16725489398",
        ["image_large"] = "rbxassetid://16880336259",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_otter_pet"] = {
        ["name"] = "Otter Sticker",
        ["image"] = "rbxassetid://16724921641",
        ["image_large"] = "rbxassetid://16880325947",
        ["rarity"] = "uncommon",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_frog_pet"] = {
        ["name"] = "Frog Sticker",
        ["image"] = "rbxassetid://16715160687",
        ["image_large"] = "rbxassetid://16880194198",
        ["rarity"] = "uncommon",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_rat_pet"] = {
        ["name"] = "Rat Sticker",
        ["image"] = "rbxassetid://16715160765",
        ["image_large"] = "rbxassetid://16880194325",
        ["rarity"] = "uncommon",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_phoenix_pet"] = {
        ["name"] = "Phoenix Sticker",
        ["image"] = "rbxassetid://16715160534",
        ["image_large"] = "rbxassetid://16880194071",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_parrot_pet"] = {
        ["name"] = "Parrot Sticker",
        ["image"] = "rbxassetid://16724299776",
        ["image_large"] = "rbxassetid://16880313893",
        ["rarity"] = "legendary",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_turtle_pet"] = {
        ["name"] = "Turtle Sticker",
        ["image"] = "rbxassetid://16715464053",
        ["image_large"] = "rbxassetid://16880211553",
        ["rarity"] = "ultra_rare",
        ["tags"] = { "pets" }
    },
    ["stickers_2024_walrus_pet"] = {
        ["name"] = "Walrus Sticker",
        ["image"] = "rbxassetid://16659426956",
        ["image_large"] = "rbxassetid://16880313360",
        ["rarity"] = "uncommon",
        ["tags"] = { "pets" }
    }
}
local v10 = {
    ["name"] = "Bat Dragon Cuddle Animated Sticker",
    ["image"] = "rbxassetid://16912127073",
    ["rarity"] = "legendary",
    ["tags"] = { "pets" }
}
local v11 = {
    ["rows"] = 1,
    ["columns"] = 2,
    ["framerate"] = 2,
    ["frame_count"] = 2
}
local v12 = {
    ["icon"] = {
        ["image"] = "rbxassetid://16912175518",
        ["size"] = Vector2.new(140, 70)
    },
    ["default"] = {
        ["image"] = "rbxassetid://16912175718",
        ["size"] = Vector2.new(280, 140)
    },
    ["large"] = {
        ["image"] = "rbxassetid://16912175825",
        ["size"] = Vector2.new(560, 280)
    }
}
v11.sprite_sheets = v12
v10.flipbook_properties = v11
v9.stickers_2024_bat_dragon_animated_pet = v10
for _, v13 in v4 do
    v13.unlimited = true
    v13.temporary = true
    v13.is_hidden_from_backpack = true
    local v14 = v13.tags
    table.insert(v14, "default")
end
return v2.stickers(v1.Dictionary.merge(v3, v4, v5, v9))