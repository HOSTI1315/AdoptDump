--// ReplicatedStorage.ClientDB.PetProgressionDB (ModuleScript)

local v_u_2 = {
    ["age_names"] = {
        "Newborn",
        "Junior",
        "Pre-Teen",
        "Teen",
        "Post-Teen",
        "Full Grown"
    },
    ["neon_age_names"] = {
        "Reborn",
        "Twinkle",
        "Sparkle",
        "Flare",
        "Sunshine",
        "Luminous"
    },
    ["ailments_per_age"] = {
        ["common"] = {
            3,
            6,
            10,
            15,
            21
        },
        ["uncommon"] = {
            5,
            9,
            15,
            20,
            31
        },
        ["rare"] = {
            10,
            14,
            21,
            30,
            45
        },
        ["ultra_rare"] = {
            10,
            15,
            25,
            41,
            69
        },
        ["legendary"] = {
            15,
            26,
            43,
            72,
            119
        }
    },
    ["get_ailments_per_age"] = function(p1)
        return p1.custom_ailments_per_age or v_u_2.ailments_per_age[p1.rarity]
    end
}
return v_u_2