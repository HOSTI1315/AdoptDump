--// ReplicatedStorage.SharedModules.ContentPacks.Pride2024.InventorySubDB.Stickers (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("package:Sift")
local v2 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v3 = {
    ["pride_2024_pan_flag_misc"] = {
        ["name"] = "Pan Flag Sticker",
        ["image"] = "rbxassetid://17729044957",
        ["image_large"] = "rbxassetid://17745046356"
    },
    ["pride_2024_ace_flag_misc"] = {
        ["name"] = "Ace Flag Sticker",
        ["image"] = "rbxassetid://17729123958",
        ["image_large"] = "rbxassetid://17745069414"
    },
    ["pride_2024_gender_fluid_flag_misc"] = {
        ["name"] = "Gender Fluid Flag",
        ["image"] = "rbxassetid://17729066736",
        ["image_large"] = "rbxassetid://17745058168"
    },
    ["pride_2024_bi_flag_misc"] = {
        ["name"] = "Bi Flag",
        ["image"] = "rbxassetid://17729096423",
        ["image_large"] = "rbxassetid://17745069096"
    },
    ["pride_2024_intersex_flag_misc"] = {
        ["name"] = "Intersex Flag",
        ["image"] = "rbxassetid://17729124211",
        ["image_large"] = "rbxassetid://17745079400"
    },
    ["pride_2024_aromantic_flag_misc"] = {
        ["name"] = "Aromantic Flag",
        ["image"] = "rbxassetid://17729067286",
        ["image_large"] = "rbxassetid://17745058296"
    },
    ["pride_2024_enby_flag_misc"] = {
        ["name"] = "Enby Flag",
        ["image"] = "rbxassetid://17729096790",
        ["image_large"] = "rbxassetid://17745069163"
    },
    ["pride_2024_lesbian_flag_misc"] = {
        ["name"] = "Lesbian Flag",
        ["image"] = "rbxassetid://17729067669",
        ["image_large"] = "rbxassetid://17745058354"
    },
    ["pride_2024_gender_queer_flag_misc"] = {
        ["name"] = "Gender Queer Flag",
        ["image"] = "rbxassetid://17729097176",
        ["image_large"] = "rbxassetid://17745069232"
    },
    ["pride_2024_agender_flag_misc"] = {
        ["name"] = "Agender Flag",
        ["image"] = "rbxassetid://17729145210",
        ["image_large"] = "rbxassetid://17745079758"
    },
    ["pride_2024_omnisex_flag_misc"] = {
        ["name"] = "Omnisex Flag",
        ["image"] = "rbxassetid://17729086196",
        ["image_large"] = "rbxassetid://17745058498"
    },
    ["pride_2024_gay_man_flag_misc"] = {
        ["name"] = "Gay Man Flag",
        ["image"] = "rbxassetid://17729123656",
        ["image_large"] = "rbxassetid://17745069304"
    },
    ["pride_2024_demi_flag_misc"] = {
        ["name"] = "Demi Flag",
        ["image"] = "rbxassetid://17729045258",
        ["image_large"] = "rbxassetid://17745046460"
    },
    ["pride_2024_transgender_flag_misc"] = {
        ["name"] = "Transgender Flag",
        ["image"] = "rbxassetid://17729086516",
        ["image_large"] = "rbxassetid://17745058616"
    },
    ["pride_2024_progress_pride_flag_misc"] = {
        ["name"] = "Progress Pride Flag",
        ["image"] = "rbxassetid://17729045490",
        ["image_large"] = "rbxassetid://17745046608"
    }
}
local v4 = {
    ["pride_2024_lesbian_cat_snake_alliance_pet"] = {
        ["name"] = "Lesbian Cat-Snake Alliance Sticker",
        ["image"] = "rbxassetid://17729340502",
        ["image_large"] = "rbxassetid://17745104707"
    },
    ["pride_2024_gay_snake_in_a_boot_pet"] = {
        ["name"] = "Gay Snake in a Boot Sticker",
        ["image"] = "rbxassetid://17729340186",
        ["image_large"] = "rbxassetid://17745104513"
    },
    ["pride_2024_omnisex_pegasus_pet"] = {
        ["name"] = "Omnisex Pegasus Sticker",
        ["image"] = "rbxassetid://17729188885",
        ["image_large"] = "rbxassetid://17745093476"
    },
    ["pride_2024_ace_goose_pet"] = {
        ["name"] = "Ace Goose Sticker",
        ["image"] = "rbxassetid://17729189274",
        ["image_large"] = "rbxassetid://17745093638"
    },
    ["pride_2024_pan_parrot_pet"] = {
        ["name"] = "Pan Parrot Sticker",
        ["image"] = "rbxassetid://17729179113",
        ["image_large"] = "rbxassetid://17745093171"
    },
    ["pride_2024_bi_dodo_pet"] = {
        ["name"] = "Bi Dodo Sticker",
        ["image"] = "rbxassetid://17729178689",
        ["image_large"] = "rbxassetid://17745093074"
    },
    ["pride_2024_non_beenary_pet"] = {
        ["name"] = "Non-Beenary Sticker",
        ["image"] = "rbxassetid://17729339696",
        ["image_large"] = "rbxassetid://17745104059"
    },
    ["pride_2024_trans_glyptodon_barv_pet"] = {
        ["name"] = "Trans Glyptodon Barv Sticker",
        ["image"] = "rbxassetid://17729442742",
        ["image_large"] = "rbxassetid://17745105190"
    },
    ["pride_2024_happy_pride_zebra_pet"] = {
        ["name"] = "Happy Pride Zebra Sticker",
        ["image"] = "rbxassetid://17729441629",
        ["image_large"] = "rbxassetid://17745104827"
    },
    ["pride_2024_intersex_ringed_octopus_pet"] = {
        ["name"] = "Intersex Ringed Octopus Sticker",
        ["image"] = "rbxassetid://17729145528",
        ["image_large"] = "rbxassetid://17745079889"
    },
    ["pride_2024_agender_rat_pet"] = {
        ["name"] = "Agender Rat Sticker",
        ["image"] = "rbxassetid://17729458084",
        ["image_large"] = "rbxassetid://17745117495"
    },
    ["pride_2024_genderqueer_seahorse_pet"] = {
        ["name"] = "Genderqueer Seahorse Sticker",
        ["image"] = "rbxassetid://17729442084",
        ["image_large"] = "rbxassetid://17745104953"
    },
    ["pride_2024_demisexual_bat_pet"] = {
        ["name"] = "Demisexual Bat Sticker",
        ["image"] = "rbxassetid://17729164108",
        ["image_large"] = "rbxassetid://17745080133"
    },
    ["pride_2024_gender_fluid_ghost_dog_pet"] = {
        ["name"] = "Gender Fluid Ghost Dog Sticker",
        ["image"] = "rbxassetid://17729163888",
        ["image_large"] = "rbxassetid://17745080001"
    },
    ["pride_2024_aromatic_trex_pet"] = {
        ["name"] = "Aromantic T-Rex Sticker",
        ["image"] = "rbxassetid://17729164454",
        ["image_large"] = "rbxassetid://17745092990"
    }
}
for _, v5 in v3 do
    v5.rarity = "common"
    v5.tags = { "misc" }
    v5.unlimited = true
    v5.temporary = true
    v5.is_hidden_from_backpack = true
end
for _, v6 in v4 do
    v6.rarity = "rare"
    v6.tags = { "pets" }
end
return v2.stickers(v1.Dictionary.merge(v3, v4))