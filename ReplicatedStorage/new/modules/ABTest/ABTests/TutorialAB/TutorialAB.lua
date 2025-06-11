--// ReplicatedStorage.new.modules.ABTest.ABTests.TutorialAB (ModuleScript)

local v1 = require(script.Parent.Parent).new
local v2 = {
    ["key"] = "tutorial_2025",
    ["studio_debug_group"] = "adoption_day_skip_park"
}
local v3 = {
    ["quest_path"] = {
        ["first_quest"] = "tutorial_complete_ailment",
        ["tutorial_complete_ailment"] = { "tutorial_hatch_egg" },
        ["tutorial_hatch_egg"] = { "tutorial_save_new_pet_outfit", "tutorial_buy_vehicle" },
        ["tutorial_save_new_pet_outfit"] = { "tutorial_pet_trick_learned", "tutorial_name_pet" },
        ["tutorial_pet_trick_learned"] = { "tutorial_buy_house", "tutorial_buy_egg" }
    },
    ["woofington_outside_house"] = false,
    ["stand_layout_name"] = "Short",
    ["use_new_tutorial"] = false,
    ["valid_pet_kinds"] = {
        ["dog"] = true,
        ["cat"] = true
    },
    ["valid_pet_kinds_sorted"] = { "dog", "cat" },
    ["no_starter_egg"] = false,
    ["skip_park_step"] = false,
    ["free_furniture_house_kinds"] = {},
    ["starter_house_kind"] = "micro_2023",
    ["full_price_tags"] = {}
}
v2.default_values = v3
local v4 = {
    ["legacy_no_egg"] = {
        ["quest_path"] = {
            ["first_quest"] = "tutorial_complete_ailment",
            ["tutorial_complete_ailment"] = { "tutorial_age_up_pet" },
            ["tutorial_age_up_pet"] = { "tutorial_save_new_pet_outfit", "tutorial_buy_vehicle" },
            ["tutorial_save_new_pet_outfit"] = { "tutorial_pet_trick_learned", "tutorial_name_pet" },
            ["tutorial_pet_trick_learned"] = { "tutorial_buy_house", "tutorial_buy_egg" },
            ["tutorial_buy_egg"] = { "tutorial_hatch_egg" }
        },
        ["no_starter_egg"] = true
    },
    ["adoption_day"] = {
        ["quest_path"] = {
            ["first_quest"] = "tutorial_age_up_pet",
            ["tutorial_age_up_pet"] = { "tutorial_dirty_need" },
            ["tutorial_dirty_need"] = { "tutorial_buy_egg", "tutorial_pet_trick_learned", "tutorial_edit_house" },
            ["tutorial_buy_egg"] = { "tutorial_hatch_egg" },
            ["tutorial_hatch_egg"] = { "tutorial_buy_house", "tutorial_name_pet" },
            ["tutorial_pet_trick_learned"] = { "tutorial_buy_vehicle", "tutorial_save_new_pet_outfit" }
        },
        ["use_new_tutorial"] = true
    },
    ["adoption_day_skip_park"] = {
        ["quest_path"] = {
            ["first_quest"] = "tutorial_age_up_pet",
            ["tutorial_age_up_pet"] = { "tutorial_buy_egg", "tutorial_pet_trick_learned", "tutorial_edit_house" },
            ["tutorial_buy_egg"] = { "tutorial_hatch_egg" },
            ["tutorial_hatch_egg"] = { "tutorial_buy_house", "tutorial_name_pet" },
            ["tutorial_pet_trick_learned"] = { "tutorial_buy_vehicle", "tutorial_save_new_pet_outfit" }
        },
        ["use_new_tutorial"] = true,
        ["skip_park_step"] = true
    }
}
local v5 = {
    ["stand_layout_name"] = "Egg",
    ["quest_path"] = {
        ["first_quest"] = "tutorial_hatch_egg",
        ["tutorial_hatch_egg"] = { "tutorial_name_pet", "tutorial_edit_house", "tutorial_age_up_pet" },
        ["tutorial_name_pet"] = { "tutorial_save_new_pet_outfit" },
        ["tutorial_age_up_pet"] = { "tutorial_pet_trick_learned", "tutorial_buy_egg" },
        ["tutorial_pet_trick_learned"] = { "tutorial_buy_vehicle", "tutorial_buy_house" }
    },
    ["use_new_tutorial"] = true,
    ["skip_park_step"] = true,
    ["valid_pet_kinds"] = {
        ["starter_egg"] = true
    },
    ["valid_pet_kinds_sorted"] = { "starter_egg" }
}
v4.adoption_day_egg = v5
local v6 = {
    ["starter_house_kind"] = "micro_sandbox",
    ["free_furniture_house_kinds"] = {
        ["micro_sandbox"] = true
    },
    ["full_price_tags"] = {
        ["BasicLure"] = true,
        ["CashRegister"] = true,
        ["Rare"] = true,
        ["Stand"] = true
    }
}
v4.free_furniture = v6
v4.egg_outside_house = {
    ["woofington_outside_house"] = true
}
v4.free_cracked_egg = {
    ["woofington_outside_house"] = true,
    ["quest_path"] = {
        ["first_quest"] = "tutorial_complete_ailment",
        ["tutorial_complete_ailment"] = { "tutorial_hatch_egg" },
        ["tutorial_hatch_egg"] = { "tutorial_save_new_pet_outfit", "tutorial_buy_vehicle", "tutorial_free_egg" },
        ["tutorial_save_new_pet_outfit"] = { "tutorial_pet_trick_learned", "tutorial_name_pet" },
        ["tutorial_pet_trick_learned"] = { "tutorial_buy_house" }
    }
}
v2.groups = v4
return v1(v2)