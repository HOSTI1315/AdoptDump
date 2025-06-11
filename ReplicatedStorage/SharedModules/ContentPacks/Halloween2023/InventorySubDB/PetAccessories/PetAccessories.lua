--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["halloween_2023_ball_and_chain_earrings"] = {
        ["name"] = "Ball and Chain Earrings",
        ["image"] = "rbxassetid://14782612102",
        ["rarity"] = "common",
        ["cost"] = 550,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Halloween2023BallAndChainEarrings"
    },
    ["halloween_2023_death_cloak"] = {
        ["name"] = "Death Cloak",
        ["image"] = "rbxassetid://14782613705",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4200,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Halloween2023DeathCloak"
    },
    ["halloween_2023_evil_headphones"] = {
        ["name"] = "Evil Headphones",
        ["image"] = "rbxassetid://14782614399",
        ["rarity"] = "uncommon",
        ["cost"] = 1150,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2023EvilHeadphones"
    },
    ["halloween_2023_eye_bat_monocle"] = {
        ["name"] = "Eye Bat Monocle",
        ["image"] = "rbxassetid://14782615312",
        ["rarity"] = "common",
        ["cost"] = 500,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Halloween2023EyeBatMonocle"
    },
    ["halloween_2023_jack_o_lantern_shades"] = {
        ["name"] = "Jack-O-Lantern Shades",
        ["image"] = "rbxassetid://14782618571",
        ["rarity"] = "uncommon",
        ["cost"] = 950,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Halloween2023JackOLanternShades"
    },
    ["halloween_2023_monster_hat"] = {
        ["name"] = "Monster Hat",
        ["image"] = "rbxassetid://14782619146",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3250,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2023MonsterHat"
    },
    ["halloween_2023_skull_bow"] = {
        ["name"] = "Skull Bow",
        ["image"] = "rbxassetid://14782624357",
        ["rarity"] = "rare",
        ["cost"] = 1650,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Halloween2023SkullBow"
    },
    ["halloween_2023_slime_backpack"] = {
        ["name"] = "Slime Backpack",
        ["image"] = "rbxassetid://14782624804",
        ["rarity"] = "common",
        ["cost"] = 450,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Halloween2023SlimeBackpack"
    },
    ["halloween_2023_wicked_boots"] = {
        ["name"] = "Wicked Boots",
        ["image"] = "rbxassetid://14782630664",
        ["rarity"] = "rare",
        ["cost"] = 1500,
        ["currency_id"] = "candy_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Halloween2023WickedBoots"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)