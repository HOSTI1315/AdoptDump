--// ReplicatedStorage.ClientDB.SharedConstants (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("TimeZoneHelper")
local v2 = {
    ["production_place_id"] = 920587237,
    ["staging_place_id"] = 918612434,
    ["test_lab_place_id"] = 6937937941,
    ["demo_place_id"] = 8010709491,
    ["production_game_id"] = 383310974,
    ["staging_game_id"] = 382534086,
    ["test_lab_game_id"] = 2654849480,
    ["demo_game_id"] = 3090938477,
    ["roblox_staff_game_id"] = 6731755890,
    ["rthro_enabled_game_id"] = 6731755890,
    ["full_shower_duration"] = 7,
    ["full_bath_duration"] = 15,
    ["full_sleep_duration"] = 15,
    ["full_water_bowl_drink_duration"] = 7,
    ["full_food_bowl_drink_duration"] = 7,
    ["full_toilet_duration"] = 7,
    ["fire_hydrant_range"] = 7,
    ["baby_id"] = "baby",
    ["quest_id"] = "quest",
    ["max_concurrent_ailments"] = 5,
    ["max_family_ailment_reward_distance"] = 75,
    ["max_family_ailment_reward_time"] = 600,
    ["max_caregiver_assist_dist"] = 14,
    ["map_interior_y_boundary"] = 317,
    ["handover_cost_confirmation_threshold"] = 20,
    ["boost_all_cost"] = 60,
    ["fly_balloon_cost"] = 5,
    ["rent_lodge_cost"] = 200,
    ["balloon_takeoff_time"] = 60,
    ["rain_bridge_transition_time"] = 12,
    ["candy_cost_in_bucks"] = 0.15625,
    ["time_between_pride_pin_awards"] = 3600,
    ["time_between_eco_pin_awards"] = 3600,
    ["bulk_purchase_limit"] = 99,
    ["negotiation_lock_time"] = 5,
    ["confirmation_lock_time_per_item"] = 2,
    ["day_length"] = 420,
    ["night_length"] = 180,
    ["coop_building_max_players"] = 100,
    ["coop_building_max_budget"] = 10000,
    ["include_debug_minigame"] = false,
    ["cauldron_brew_times"] = {
        ["speedcauldron"] = 60,
        ["bigheadcauldron"] = 45,
        ["antigravcauldron"] = 75
    }
}
local v3 = {
    ["available_daily_until"] = 15462,
    ["messages"] = {
        {
            ["text"] = "To celebrate the holiday season, we\'re handing out free gifts daily!",
            ["button"] = "Continue"
        },
        {
            ["text"] = "Let\'s go claim your daily gift!",
            ["button"] = "Go!"
        }
    }
}
v2.daily_gift_config = v3
v2.afk_zone = {
    ["time_before_new_server"] = 980,
    ["intro_time"] = 40,
    ["outro_time"] = 40,
    ["ailments_to_complete"] = 3
}
v2.multipliers = {
    {
        ["start"] = v1.from_region_datetime("PT", 2025, 5, 23, 8).UnixTimestamp,
        ["expiration"] = v1.from_region_datetime("PT", 2025, 5, 27, 8).UnixTimestamp,
        ["bucks"] = 2,
        ["aging"] = 2
    }
}
v2.additive_influencer_multipliers = {
    ["bucks"] = 0,
    ["aging"] = 1
}
v2.scam_report_reasons_human_readable = {
    ["trust_trading"] = "Lying / Trust Trading",
    ["fake_giveaway"] = "Fake Auction / Giveaway Scam",
    ["cross_trading"] = "Real World Trading / Cross Trading",
    ["hacked"] = "I Didn\'t Make This Trade",
    ["other"] = "Other"
}
v2.scam_report_reasons = {
    "trust_trading",
    "fake_giveaway",
    "cross_trading",
    "hacked",
    "other"
}
v2.social_stones = {
    ["max_earned_per_ailment"] = 5,
    ["max_budget"] = 30,
    ["time_period"] = 86400,
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["text_stroke_color"] = Color3.fromHex("#AB2500"),
    ["indicator_backing"] = "rbxassetid://94021119253021",
    ["image"] = "rbxassetid://125163871856859",
    ["human_readable"] = "Social Stones",
    ["end_time"] = v1.from_region_datetime("PT", 2025, 6, 20, 8).UnixTimestamp
}
local v4 = {
    ["sign_settings"] = {
        ["countdown_time"] = v1.from_region_datetime("PT", 2025, 6, 13, 8).UnixTimestamp,
        ["countdown_format_string"] = "LEAVES IN %s",
        ["ignore_format_when_leaving_soon"] = true,
        ["leaving_soon_text"] = "LEAVING SOON!"
    }
}
v2.pride_2025 = v4
local v5 = {
    ["sign_settings"] = {
        ["countdown_time"] = v1.from_region_datetime("PT", 2025, 6, 20, 8).UnixTimestamp,
        ["countdown_format_string"] = "LEAVES IN %s",
        ["ignore_format_when_leaving_soon"] = true,
        ["leaving_soon_text"] = "LEAVING SOON!"
    }
}
v2.butterfly_2025 = v5
v2.trade_quick_chat_cooldown_progression = {
    0.4,
    2,
    4,
    8
}
v2.quick_chat_phrases = {
    {
        ["text"] = "Hi! \240\159\145\139",
        ["icon_large"] = "rbxassetid://14180309155",
        ["icon_small"] = "rbxassetid://14180100097"
    },
    {
        ["text"] = "Please wait, I\226\128\153m thinking about it. \240\159\164\148",
        ["icon_large"] = "rbxassetid://14180100532",
        ["icon_small"] = "rbxassetid://14178657403"
    },
    {
        ["text"] = "Thanks! Let\226\128\153s do it! \240\159\164\157",
        ["icon_large"] = "rbxassetid://14180100422",
        ["icon_small"] = "rbxassetid://14178657240"
    },
    {
        ["text"] = "Please add more. \226\158\149",
        ["icon_large"] = "rbxassetid://14178656697",
        ["icon_small"] = "rbxassetid://14178657064"
    },
    {
        ["text"] = "Please remove some. \226\158\150",
        ["icon_large"] = "rbxassetid://14178656490",
        ["icon_small"] = "rbxassetid://14178656886"
    },
    {
        ["text"] = "No thanks. \226\157\140",
        ["icon_large"] = "rbxassetid://14180309344",
        ["icon_small"] = "rbxassetid://14180100273"
    }
}
v2.trade_spectate_reactions = {
    "rbxassetid://14265113844",
    "rbxassetid://14265113687",
    "rbxassetid://14263448076",
    "rbxassetid://14265134988",
    "rbxassetid://14265113338",
    "rbxassetid://14265113443",
    "rbxassetid://14265113556"
}
v2.voting_paddle_choices = {
    "\240\159\145\141",
    "\240\159\145\142",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "\240\159\146\175",
    "\240\159\145\143"
}
v2.max_bucks_per_day_from_ailments = 200
v2.ailments_per_friendship_level = 30
v2.friendship_flourish_level = 10
v2.daily_quest_frequency = 86400
v2.taxi = {
    ["fare_price_default"] = 10,
    ["fare_price_min"] = 0,
    ["fare_price_max"] = 20,
    ["time_limit"] = 180,
    ["debug_allow_driver_to_be_own_passenger"] = false,
    ["distance_threshold"] = 20,
    ["ride_start_timeout"] = 15,
    ["passenger_exit_ride_delay"] = 10
}
v2.egg_event = {
    ["release_name"] = "moon_egg",
    ["countdown_time"] = v1.from_region_datetime("PT", 2025, 2, 7, 8).UnixTimestamp,
    ["release_time"] = v1.from_region_datetime("PT", 2025, 2, 7, 8).UnixTimestamp,
    ["mystery_sign_text"] = "MOON EGG",
    ["mystery_sign_post_release_duration"] = 0,
    ["quest_icon_app_taskboard_style"] = nil,
    ["quest_icon_app_post_release_duration"] = 0,
    ["gumball_egg_kind_pre_release"] = "garden_2024_egg",
    ["gumball_egg_kind_post_release"] = "moon_2025_egg"
}
v2.festival_event = {
    ["enabled"] = true,
    ["release_name"] = "butterfly_2025",
    ["battle_pass_entry_name"] = nil,
    ["start_time"] = v1.from_region_datetime("PT", 2025, 6, 6, 7).UnixTimestamp,
    ["finish_time"] = v1.from_region_datetime("PT", 2025, 6, 20, 8).UnixTimestamp,
    ["start_countdown_text"] = "EVENT STARTS IN:",
    ["end_countdown_text"] = "EVENT ENDS IN:",
    ["start_soon_text"] = "EVENT STARTING SOON!",
    ["end_soon_text"] = "LEAVING SOON!",
    ["quest_icon_app_taskboard_style"] = "Butterfly2025",
    ["quest_icon_app_post_release_duration"] = 0,
    ["instantly_takedown_taskboard"] = false
}
v2.ftue_starter_pack = {
    ["product_key"] = "ftue_2024_starter_pack",
    ["expiry_time"] = 259200
}
v2.forecast_override = nil
v2.pay_per_minute_for_100_percent_roleplay_job = 15
v2.employee_bonus_pay = 10
v2.housing_editor = {
    ["minimum_furniture_scale"] = 0.05,
    ["maximum_furniture_scale"] = 1000
}
v2.theme_area = {
    ["enabled"] = false,
    ["start_date"] = v1.from_region_datetime("PT", 2024, 1, 1, 8).UnixTimestamp,
    ["end_date"] = v1.from_region_datetime("PT", 2024, 2, 28, 8).UnixTimestamp
}
v2.like_reward_kind = "likes_reward_2025_cap"
v2.ugc_pet_kind = "ice_dimension_2025_trihorned_treehopper"
v2.gift_hat_refresh_release_date = v1.from_region_datetime("PT", 2023, 11, 9, 8).UnixTimestamp
local v6 = {
    ["widgets_per_page"] = 4,
    ["max_pages"] = 5,
    ["max_collection_items"] = 20,
    ["valid_pet_properties"] = {
        ["flyable"] = true,
        ["rideable"] = true,
        ["neon"] = true,
        ["mega_neon"] = true
    },
    ["max_trades_per_widget"] = 3,
    ["max_trade_votes"] = 50,
    ["disable_stickers"] = false,
    ["sticker_page_limit"] = 100,
    ["report_reasons_human_readable"] = {
        ["scamming"] = "Scamming",
        ["inappropriate"] = "Inappropriate",
        ["cross_trading"] = "Cross-trading",
        ["other"] = "Other"
    },
    ["report_reasons"] = {
        "scamming",
        "inappropriate",
        "cross_trading",
        "other"
    }
}
v2.player_profiles = v6
return v2