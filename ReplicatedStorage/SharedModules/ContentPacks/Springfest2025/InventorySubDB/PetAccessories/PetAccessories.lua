--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["spring_2025_pink_twintails"] = {
        ["name"] = "Pink Twintails",
        ["image"] = "rbxassetid://91591562572043",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["cost"] = 1250,
        ["currency_id"] = "cherry_blossoms_2025",
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Spring2025PinkTwintails"
    },
    ["spring_2025_sakura_scythe"] = {
        ["name"] = "Sakura Scythe",
        ["image"] = "rbxassetid://112266880406192",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["cost"] = 5000,
        ["currency_id"] = "cherry_blossoms_2025",
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Spring2025SakuraScythe"
    },
    ["spring_2025_kage_scarf"] = {
        ["name"] = "Kage Scarf",
        ["image"] = "rbxassetid://98736530090679",
        ["rarity"] = "rare",
        ["cost"] = 3150,
        ["currency_id"] = "cherry_blossoms_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Spring2025KageScarf"
    },
    ["spring_2025_sakura_earrings"] = {
        ["name"] = "Sakura Earrings",
        ["image"] = "rbxassetid://73142942585624",
        ["rarity"] = "common",
        ["cost"] = 450,
        ["currency_id"] = "cherry_blossoms_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Spring2025SakuraEarrings"
    },
    ["spring_2025_spiky_blue_hair"] = {
        ["name"] = "Spiky Blue Hair",
        ["image"] = "rbxassetid://140561171751233",
        ["rarity"] = "ultra_rare",
        ["cost"] = 9001,
        ["currency_id"] = "cherry_blossoms_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Spring2025SpikyBlueHair"
    },
    ["spring_2025_magic_wing_badge"] = {
        ["name"] = "Magic Wing Badge",
        ["image"] = "rbxassetid://109754705757101",
        ["rarity"] = "uncommon",
        ["cost"] = 1900,
        ["currency_id"] = "cherry_blossoms_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Spring2025MagicWingBadge"
    },
    ["spring_2025_ninja_collar"] = {
        ["name"] = "Ninja Collar",
        ["image"] = "rbxassetid://90102432364309",
        ["rarity"] = "ultra_rare",
        ["cost"] = 7300,
        ["currency_id"] = "cherry_blossoms_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Spring2025NinjaCollar"
    },
    ["spring_2025_energy_wings"] = {
        ["name"] = "Energy Wings",
        ["image"] = "rbxassetid://120335966705454",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["cost"] = 8600,
        ["currency_id"] = "cherry_blossoms_2025",
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Spring2025EnergyWings"
    },
    ["spring_2025_kaijunior_hat"] = {
        ["name"] = "Kaijunior Hat",
        ["image"] = "rbxassetid://127584678657682",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["cost"] = 1600,
        ["currency_id"] = "cherry_blossoms_2025",
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Spring2025KaijuniorHat"
    },
    ["spring_2025_kage_cape"] = {
        ["name"] = "Kage Cape",
        ["image"] = "rbxassetid://135936742824976",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["cost"] = 6900,
        ["currency_id"] = "cherry_blossoms_2025",
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Spring2025KageCape"
    },
    ["spring_2025_black_hero_hair"] = {
        ["name"] = "Black Hero Hair",
        ["image"] = "rbxassetid://100277418033363",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["cost"] = 950,
        ["currency_id"] = "cherry_blossoms_2025",
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Spring2025BlackHeroHair"
    },
    ["spring_2025_energy_aura_feet"] = {
        ["name"] = "Energy Aura Feet",
        ["image"] = "rbxassetid://137664386036593",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Spring2025EnergyAuraFeet"
    },
    ["spring_2025_sakura_wings"] = {
        ["name"] = "Sakura Wings",
        ["image"] = "rbxassetid://97504879061009",
        ["rarity"] = "rare",
        ["cost"] = 21000,
        ["currency_id"] = "cherry_blossoms_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "Spring2025SakuraWingsFlapMedium",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Spring2025SakuraWings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)