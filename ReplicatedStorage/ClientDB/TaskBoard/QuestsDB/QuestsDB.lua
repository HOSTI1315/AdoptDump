--// ReplicatedStorage.ClientDB.TaskBoard.QuestsDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("QuestFrameStyleDB")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("EggEvent")
local v_u_5 = v_u_1("PolicyHelper")
local v_u_6 = v_u_1("QuestsDBHelper")
local v_u_7 = v_u_1("QuestsDBEntries")
local v8 = v_u_1("ContentPackHelper")
local v_u_9 = game:GetService("Players")
local v11 = setmetatable({}, {
    ["__index"] = function(_, p10)
        return v_u_7[p10]
    end,
    ["__newindex"] = function(_, _, _)
        error("Use QuestsDBHelper.add_quests instead of modifying QuestsDB directly.")
    end
})
local v12 = v_u_6.add_quests
local v13 = {}
local v14 = {
    ["name"] = "Example Event",
    ["can_reroll"] = false,
    ["contributes_to_quest_limit"] = false,
    ["reward"] = v_u_6.make_teleport_reward({
        "Nursery",
        "MainDoor",
        {
            ["studs_ahead_of_door"] = 6
        }
    }),
    ["can_step_quest"] = function(_)
        return false
    end
}
v13.teleport_example_event = v14
v12("examples", v13)
local v15 = v_u_6.add_quests
local v16 = {}
local v19 = {
    ["name"] = "Make a mega neon pet",
    ["reward"] = v_u_6.make_item_reward({
        ["kind"] = "rgb_reward_box",
        ["category"] = "gifts",
        ["quantity"] = 3
    }),
    ["can_step_quest"] = v_u_6.is_event_options("neon_fusion_successful", {
        ["neon_type"] = "mega_neon"
    }),
    ["can_spawn_quest"] = function(p17)
        return v_u_6.has_collected_item_category_with_condition(p17, "pets", function(p18)
            return p18.age and p18.age == 12 and true or p18.mega_neon
        end)
    end,
    ["frame_info"] = {
        ["style"] = v2.daily_hard
    }
}
v16.mega_neon_fusion = v19
local v23 = {
    ["name"] = "Make a neon pet",
    ["reward"] = v_u_6.make_item_reward({
        ["kind"] = "rgb_reward_box",
        ["category"] = "gifts"
    }),
    ["frame_info"] = {
        ["style"] = v2.daily_hard
    },
    ["can_step_quest"] = v_u_6.is_event("neon_fusion_successful"),
    ["can_spawn_quest"] = function(p20)
        return v_u_6.has_collected_item_category_with_condition(p20, "pets", function(p21)
            local v22 = p21.age
            if v22 then
                v22 = p21.age >= 6
            end
            return v22
        end)
    end
}
v16.neon_fusion = v23
local v27 = {
    ["name"] = "Fully age up a neon pet to Luminous",
    ["reward"] = v_u_6.make_bucks_reward(100),
    ["frame_info"] = {
        ["style"] = v2.daily_pets
    },
    ["can_step_quest"] = v_u_6.is_event_options("pet_age_increased", {
        ["age"] = 6,
        ["neon"] = true
    }),
    ["can_spawn_quest"] = function(p24)
        return v_u_6.has_collected_item_category_with_condition(p24, "pets", function(p25)
            local v26 = p25.age
            if v26 then
                v26 = p25.age > 6
            end
            return v26
        end)
    end
}
v16.fully_age_neon = v27
local v29 = {
    ["name"] = "Fully age up 3 pets to their max ages",
    ["reward"] = v_u_6.make_bucks_reward(150),
    ["frame_info"] = {
        ["style"] = v2.daily_pets
    },
    ["total_steps"] = 3,
    ["can_step_quest"] = v_u_6.is_event_options("pet_age_increased", {
        ["age"] = 6
    }),
    ["can_spawn_quest"] = function(p28)
        return v_u_6.get_journal_quantity(p28) > 30
    end
}
v16.fully_age_three_pets = v29
local v31 = {
    ["name"] = "Fully age up a pet to its max age",
    ["reward"] = v_u_6.make_bucks_reward(80),
    ["frame_info"] = {
        ["style"] = v2.daily_pets
    },
    ["can_step_quest"] = v_u_6.is_event_options("pet_age_increased", {
        ["age"] = 6
    }),
    ["can_spawn_quest"] = function(p30)
        return v_u_6.get_journal_category_quantity(p30, "pets", {
            ["exclude_eggs"] = true
        }) > 0
    end
}
v16.fully_age_pet = v31
local v33 = {
    ["name"] = "Age up a pet 1 level",
    ["reward"] = v_u_6.make_bucks_reward(50),
    ["frame_info"] = {
        ["style"] = v2.daily_pets
    },
    ["can_step_quest"] = v_u_6.is_event("pet_age_increased"),
    ["can_spawn_quest"] = function(p32)
        return v_u_6.get_journal_category_quantity(p32, "pets", {
            ["exclude_eggs"] = true
        }) > 0
    end
}
v16.age_pet = v33
local v35 = {
    ["name"] = "Teach a pet a trick at the school",
    ["reward"] = v_u_6.make_bucks_reward(30),
    ["frame_info"] = {
        ["style"] = v2.daily_pets
    },
    ["can_step_quest"] = v_u_6.is_event("pet_trick_learned"),
    ["can_spawn_quest"] = function(p34)
        return v_u_6.get_journal_category_quantity(p34, "pets", {
            ["exclude_eggs"] = true
        }) > 0
    end
}
v16.pet_trick_learned = v35
local v37 = {
    ["name"] = "Put 2 accessories on a pet",
    ["reward"] = v_u_6.make_bucks_reward(30),
    ["frame_info"] = {
        ["style"] = v2.daily_fashion
    },
    ["total_steps"] = 2,
    ["can_step_quest"] = v_u_6.is_event("pet_accessory_equipped"),
    ["can_spawn_quest"] = function(p36)
        return v_u_6.get_journal_category_quantity(p36, "pets", {
            ["exclude_eggs"] = true
        }) > 0
    end
}
v16.equip_two_accessories = v37
local v40 = {
    ["name"] = "Hatch an egg",
    ["reward"] = v_u_6.make_bucks_reward(45),
    ["frame_info"] = {
        ["style"] = v2.daily_egg
    },
    ["can_step_quest"] = v_u_6.is_event("egg_hatched"),
    ["can_spawn_quest"] = function(_, p38)
        local v39 = not v_u_6.has_quest(p38, "tutorial_hatch_egg")
        if v39 then
            v39 = not v_u_6.has_quest(p38, "tutorial_complete_ailment")
        end
        return v39
    end
}
v16.hatch_egg = v40
local v43 = {
    ["name"] = "Hatch 3 eggs",
    ["reward"] = v_u_6.make_bucks_reward(80),
    ["frame_info"] = {
        ["style"] = v2.daily_egg
    },
    ["total_steps"] = 3,
    ["can_step_quest"] = v_u_6.is_event("egg_hatched"),
    ["can_spawn_quest"] = function(_, p41)
        local v42 = not v_u_6.has_quest(p41, "tutorial_hatch_egg")
        if v42 then
            v42 = not v_u_6.has_quest(p41, "tutorial_complete_ailment")
        end
        return v42
    end
}
v16.hatch_three_eggs = v43
v15("daily_quests", v16)
local v44 = v_u_6.add_quests
local v45 = {}
local v50 = {
    ["name"] = "Buy a new house",
    ["reward"] = v_u_6.make_bucks_reward(100),
    ["frame_info"] = {
        ["style"] = v2.daily_building
    },
    ["can_step_quest"] = v_u_6.is_event("house_bought"),
    ["can_spawn_quest"] = function(p46, p47)
        local v48 = v_u_6.get_data(p46, "house_manager")
        if not v48 then
            return false
        end
        local v49
        if v48:get_num_houses() < 15 then
            v49 = not v_u_6.has_quest(p47, "tutorial_buy_house")
        else
            v49 = false
        end
        return v49
    end
}
v45.buy_house = v50
local v54 = {
    ["name"] = "Decorate your house with another player using the Build with Friends workbench",
    ["reward"] = v_u_6.make_bucks_reward(80),
    ["frame_info"] = {
        ["style"] = v2.daily_building
    },
    ["total_steps"] = 3,
    ["can_step_quest"] = function(p51)
        local v52
        if p51.name == "furniture_bought" and p51.player == p51.options.owner_player then
            v52 = p51.player ~= p51.options.buyer_player
        else
            v52 = false
        end
        return v52
    end,
    ["can_spawn_quest"] = function(_, p53)
        return not v_u_6.has_quest(p53, "tutorial_buy_house")
    end
}
v45.buy_three_furniture_items_with_your_coop_budget = v54
local v57 = {
    ["name"] = "Help another player decorate their house with the Build with Friends workbench",
    ["reward"] = v_u_6.make_bucks_reward(80),
    ["frame_info"] = {
        ["style"] = v2.daily_building
    },
    ["total_steps"] = 3,
    ["can_step_quest"] = function(p55)
        local v56
        if p55.name == "furniture_bought" and p55.player ~= p55.options.owner_player then
            v56 = p55.player == p55.options.buyer_player
        else
            v56 = false
        end
        return v56
    end
}
v45.buy_three_furniture_items_with_friends_coop_budget = v57
local v61 = {
    ["name"] = "Buy 15 Furniture items",
    ["reward"] = v_u_6.make_bucks_reward(100),
    ["frame_info"] = {
        ["style"] = v2.daily_building
    },
    ["total_steps"] = 15,
    ["can_step_quest"] = function(p58)
        local v59
        if p58.name == "furniture_bought" then
            v59 = p58.player == p58.options.buyer_player
        else
            v59 = false
        end
        return v59
    end,
    ["can_spawn_quest"] = function(_, p60)
        return not v_u_6.has_quest(p60, "tutorial_buy_house")
    end
}
v45.buy_fifteen_furniture_items = v61
local v64 = {
    ["name"] = "Buy 5 Furniture items",
    ["reward"] = v_u_6.make_bucks_reward(60),
    ["frame_info"] = {
        ["style"] = v2.daily_building
    },
    ["total_steps"] = 5,
    ["can_step_quest"] = function(p62)
        local v63
        if p62.name == "furniture_bought" then
            v63 = p62.player == p62.options.buyer_player
        else
            v63 = false
        end
        return v63
    end
}
v45.buy_five_furniture_items = v64
v44("daily_quests", v45)
local v65 = v_u_6.add_quests
local v66 = {}
local v67 = {
    ["name"] = "Dress up your avatar with new clothes and save it as an outfit",
    ["reward"] = v_u_6.make_bucks_reward(30),
    ["frame_info"] = {
        ["style"] = v2.daily_fashion
    },
    ["can_step_quest"] = v_u_6.is_event("avatar_outfit_saved")
}
v66.save_new_avatar_outfit = v67
local v69 = {
    ["name"] = "Dress up your pet with a new accessory and save it as an outfit",
    ["reward"] = v_u_6.make_bucks_reward(30),
    ["frame_info"] = {
        ["style"] = v2.daily_fashion
    },
    ["can_step_quest"] = v_u_6.is_event("pet_outfit_saved"),
    ["can_spawn_quest"] = function(p68)
        return v_u_6.get_journal_category_quantity(p68, "pets", {
            ["exclude_eggs"] = true
        }) > 0
    end
}
v66.save_new_pet_outfit = v69
v65("daily_quests", v66)
local v70 = v_u_6.add_quests
local v71 = {
    ["open_gift"] = {
        ["name"] = "Open a Gift",
        ["reward"] = v_u_6.make_bucks_reward(40),
        ["can_step_quest"] = v_u_6.is_event("gift_opened")
    }
}
local v72 = {
    ["name"] = "Buy a Gift from Santa",
    ["reward"] = v_u_6.make_item_reward({
        ["kind"] = "biggift",
        ["category"] = "gifts"
    }),
    ["can_step_quest"] = v_u_6.is_event_options("item_purchased_with_bucks", {
        ["item_category"] = "gifts",
        ["interior_name"] = "MainMap"
    })
}
v71.buy_gift = v72
local v75 = {
    ["name"] = "Buy an Egg from the Gumball Machine in the Nursery",
    ["reward"] = v_u_6.make_bucks_reward(150),
    ["frame_info"] = {
        ["style"] = v2.daily_egg
    },
    ["can_step_quest"] = function(p73)
        local v74
        if p73.name == "item_purchased_with_bucks" and p73.options.interior_name == "Nursery" then
            v74 = p73.options.item_kind == v_u_4.get_gumball_machine_item().id
        else
            v74 = false
        end
        return v74
    end
}
v71.buy_gumball_egg = v75
local v76 = {
    ["name"] = "Buy a Royal Egg from Sir Woofington in the Nursery",
    ["reward"] = v_u_6.make_item_reward({
        ["kind"] = "cure_all_potion",
        ["category"] = "food",
        ["quantity"] = 3
    }),
    ["frame_info"] = {
        ["style"] = v2.daily_egg
    },
    ["can_step_quest"] = v_u_6.is_event_options("item_purchased_with_bucks", {
        ["interior_name"] = "Nursery",
        ["item_kind"] = "royal_egg"
    })
}
v71.buy_royal_egg = v76
local v77 = {
    ["name"] = "Buy an Accessory from the Accessory Shop",
    ["reward"] = v_u_6.make_bucks_reward(100),
    ["frame_info"] = {
        ["style"] = v2.daily_fashion
    },
    ["can_step_quest"] = v_u_6.is_event_options("item_purchased_with_bucks", {
        ["interior_name"] = "HatShop",
        ["item_category"] = "pet_accessories"
    })
}
v71.buy_accessory = v77
v71.collect_eighty_bucks_from_moneytree = {
    ["name"] = "Collect 80 Bucks from Money Trees",
    ["reward"] = v_u_6.make_bucks_reward(80),
    ["can_step_quest"] = function(p78)
        local v79
        if p78.name == "money_tree_bucks_collected" then
            v79 = p78.options.bucks_cumulative >= 80
        else
            v79 = false
        end
        return v79
    end,
    ["can_spawn_quest"] = function(p80)
        return v_u_6.get_journal_quantity(p80) >= 30
    end
}
v70("daily_quests", v71)
local v81 = v_u_6.add_quests
local v82 = {}
local v86 = {
    ["name"] = "Collect a pet that isn\'t already in your journal",
    ["reward"] = v_u_6.make_bucks_reward(70),
    ["frame_info"] = {
        ["style"] = v2.daily_journal
    },
    ["can_step_quest"] = function(p83)
        if p83.name ~= "item_added" then
            return false
        end
        local v84 = not v_u_3[p83.options.item_category][p83.options.item_kind].is_egg
        if v84 then
            if p83.options.item_category == "pets" then
                v84 = not v_u_6.has_collected_item(p83.player, p83.options.item_category, p83.options.item_kind)
            else
                v84 = false
            end
        end
        return v84
    end,
    ["can_spawn_quest"] = function(p85)
        return not v_u_6.has_all_items_in_category_and_rarities(p85, "pets", { "common", "uncommon", "rare" })
    end
}
v82.collect_new_pet = v86
local v90 = {
    ["name"] = "Collect a toy that isn\'t already in your journal",
    ["frame_info"] = {
        ["style"] = v2.daily_journal
    },
    ["can_step_quest"] = function(p87)
        local v88
        if p87.name == "item_added" and p87.options.item_category == "toys" then
            v88 = not v_u_6.has_collected_item(p87.player, p87.options.item_category, p87.options.item_kind)
        else
            v88 = false
        end
        return v88
    end,
    ["can_spawn_quest"] = function(p89)
        return not v_u_6.has_all_items_in_category_and_rarities(p89, "toys", { "common", "uncommon", "rare" })
    end,
    ["reward"] = v_u_6.make_bucks_reward(40)
}
v82.collect_new_toy = v90
local v94 = {
    ["name"] = "Collect a vehicle that isn\'t already in your journal",
    ["reward"] = v_u_6.make_bucks_reward(55),
    ["frame_info"] = {
        ["style"] = v2.daily_journal
    },
    ["can_step_quest"] = function(p91)
        local v92
        if p91.name == "item_added" and p91.options.item_category == "transport" then
            v92 = not v_u_6.has_collected_item(p91.player, p91.options.item_category, p91.options.item_kind)
        else
            v92 = false
        end
        return v92
    end,
    ["can_spawn_quest"] = function(p93)
        return not v_u_6.has_all_items_in_category_and_rarities(p93, "transport", { "common", "uncommon", "rare" })
    end
}
v82.collect_new_transport = v94
local v98 = {
    ["name"] = "Collect a stroller that isn\'t already in your journal",
    ["reward"] = v_u_6.make_bucks_reward(45),
    ["frame_info"] = {
        ["style"] = v2.daily_journal
    },
    ["can_step_quest"] = function(p95)
        local v96
        if p95.name == "item_added" and p95.options.item_category == "strollers" then
            v96 = not v_u_6.has_collected_item(p95.player, p95.options.item_category, p95.options.item_kind)
        else
            v96 = false
        end
        return v96
    end,
    ["can_spawn_quest"] = function(p97)
        return not v_u_6.has_all_items_in_category_and_rarities(p97, "strollers", { "common", "uncommon", "rare" })
    end
}
v82.collect_new_stroller = v98
v81("daily_quests", v82)
local v99 = v_u_6.add_quests
local v100 = {}
local v102 = {
    ["name"] = "Drink a potion",
    ["reward"] = v_u_6.make_item_reward({
        ["kind"] = "cure_all_potion",
        ["category"] = "food"
    }),
    ["frame_info"] = {
        ["style"] = v2.daily_potion
    },
    ["can_step_quest"] = function(p101)
        return p101.name == "potion_drank_by_player" and true or p101.name == "potion_drank_by_pet"
    end
}
v100.drink_potion = v102
local v104 = {
    ["name"] = "Feed your pet a potion",
    ["reward"] = v_u_6.make_item_reward({
        ["kind"] = "cure_all_potion",
        ["category"] = "food"
    }),
    ["frame_info"] = {
        ["style"] = v2.daily_potion
    },
    ["can_step_quest"] = v_u_6.is_event("potion_drank_by_pet"),
    ["can_spawn_quest"] = function(p103)
        return v_u_6.get_journal_category_quantity(p103, "pets", {
            ["exclude_eggs"] = true
        }) > 0
    end
}
v100.pet_drink_potion = v104
v99("daily_quests", v100)
local v105 = v_u_6.add_quests
local v106 = {}
local v109 = {
    ["name"] = "Complete a trade with another player",
    ["reward"] = v_u_6.make_bucks_reward(60),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = v_u_6.is_event_options("trade_successful", {
        ["is_silent_trade"] = false
    }),
    ["can_spawn_quest"] = function(p107)
        local v108
        if v_u_6.get_journal_quantity(p107) >= 30 then
            v108 = not v_u_5.is_trading_prohibited(p107)
        else
            v108 = false
        end
        return v108
    end
}
v106.make_a_trade = v109
local v112 = {
    ["name"] = "Complete 2 trades with other players",
    ["reward"] = v_u_6.make_bucks_reward(80),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["total_steps"] = 2,
    ["can_step_quest"] = v_u_6.is_event_options("trade_successful", {
        ["is_silent_trade"] = false
    }),
    ["can_spawn_quest"] = function(p110)
        local v111
        if v_u_6.get_journal_quantity(p110) >= 30 then
            v111 = not v_u_5.is_trading_prohibited(p110)
        else
            v111 = false
        end
        return v111
    end
}
v106.make_two_trades = v112
local v117 = {
    ["name"] = "Give away an item to another player for free",
    ["reward"] = v_u_6.make_bucks_reward(50),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = function(p113)
        local v114
        if p113.name == "trade_successful" then
            v114 = #p113.options.you_received == 0
        else
            v114 = false
        end
        return v114
    end,
    ["can_spawn_quest"] = function(p115)
        local v116
        if v_u_6.get_journal_quantity(p115) >= 30 then
            v116 = not v_u_5.is_trading_prohibited(p115)
        else
            v116 = false
        end
        return v116
    end
}
v106.give_an_item_away = v117
local v122 = {
    ["name"] = "Give a gift to another player",
    ["reward"] = v_u_6.make_bucks_reward(100),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = function(p118)
        if p118.name ~= "trade_successful" then
            return false
        end
        for _, v119 in ipairs(p118.options.they_received) do
            if v119.category == "gifts" then
                return true
            end
        end
        return false
    end,
    ["can_spawn_quest"] = function(p120)
        local v121
        if v_u_6.get_journal_quantity(p120) >= 40 then
            v121 = not v_u_5.is_trading_prohibited(p120)
        else
            v121 = false
        end
        return v121
    end
}
v106.give_gift = v122
v106.buy_from_player = {
    ["name"] = "Spend bucks at another player\'s Stand, Ice Cream Truck, or Cash Register",
    ["reward"] = v_u_6.make_bucks_reward(50),
    ["can_step_quest"] = function(p123)
        local v124
        if p123.name == "player_paid_player" then
            v124 = p123.options.payer == p123.player
        else
            v124 = false
        end
        return v124
    end,
    ["can_spawn_quest"] = function(p125)
        return not v_u_5.is_trading_prohibited(p125)
    end
}
v105("daily_quests", v106)
local v126 = v_u_6.add_quests
local v127 = {}
local v132 = {
    ["name"] = "Give or receive a Common in a trade",
    ["reward"] = v_u_6.make_bucks_reward(60),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = function(p128)
        local v129
        if p128.name == "trade_successful" then
            v129 = v_u_6.trade_contains_item_of_rarity(p128, "common")
        else
            v129 = false
        end
        return v129
    end,
    ["can_spawn_quest"] = function(p130)
        local v131
        if v_u_6.get_journal_quantity(p130) >= 30 then
            v131 = not v_u_5.is_trading_prohibited(p130)
        else
            v131 = false
        end
        return v131
    end
}
v127.give_or_receive_common_item = v132
local v137 = {
    ["name"] = "Give or receive an Uncommon in a trade",
    ["reward"] = v_u_6.make_bucks_reward(65),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = function(p133)
        local v134
        if p133.name == "trade_successful" then
            v134 = v_u_6.trade_contains_item_of_rarity(p133, "uncommon")
        else
            v134 = false
        end
        return v134
    end,
    ["can_spawn_quest"] = function(p135)
        local v136
        if v_u_6.get_journal_quantity(p135) >= 35 then
            v136 = not v_u_5.is_trading_prohibited(p135)
        else
            v136 = false
        end
        return v136
    end
}
v127.give_or_receive_uncommon_item = v137
local v142 = {
    ["name"] = "Give or receive a Rare in a trade",
    ["reward"] = v_u_6.make_bucks_reward(85),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = function(p138)
        local v139
        if p138.name == "trade_successful" then
            v139 = v_u_6.trade_contains_item_of_rarity(p138, "rare")
        else
            v139 = false
        end
        return v139
    end,
    ["can_spawn_quest"] = function(p140)
        local v141
        if v_u_6.get_journal_quantity(p140) >= 40 then
            v141 = not v_u_5.is_trading_prohibited(p140)
        else
            v141 = false
        end
        return v141
    end
}
v127.give_or_receive_rare_item = v142
local v147 = {
    ["name"] = "Give or receive a Ultra Rare in a trade",
    ["reward"] = v_u_6.make_bucks_reward(100),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = function(p143)
        local v144
        if p143.name == "trade_successful" then
            v144 = v_u_6.trade_contains_item_of_rarity(p143, "ultra_rare")
        else
            v144 = false
        end
        return v144
    end,
    ["can_spawn_quest"] = function(p145)
        local v146
        if v_u_6.get_journal_quantity(p145) >= 50 then
            v146 = not v_u_5.is_trading_prohibited(p145)
        else
            v146 = false
        end
        return v146
    end
}
v127.give_or_receive_ultra_rare_item = v147
local v152 = {
    ["name"] = "Give or receive a Legendary in a trade",
    ["reward"] = v_u_6.make_bucks_reward(120),
    ["frame_info"] = {
        ["style"] = v2.daily_trading
    },
    ["can_step_quest"] = function(p148)
        local v149
        if p148.name == "trade_successful" then
            v149 = v_u_6.trade_contains_item_of_rarity(p148, "legendary")
        else
            v149 = false
        end
        return v149
    end,
    ["can_spawn_quest"] = function(p150)
        local v151
        if v_u_6.get_journal_quantity(p150) >= 60 then
            v151 = not v_u_5.is_trading_prohibited(p150)
        else
            v151 = false
        end
        return v151
    end
}
v127.give_or_receive_legendary_item = v152
v126("daily_quests", v127)
local v153 = v_u_6.add_quests
local v154 = {}
local v156 = {
    ["name"] = "Visit the home of a player who has a 20+ day login streak",
    ["reward"] = v_u_6.make_bucks_reward(30),
    ["frame_info"] = {
        ["style"] = v2.daily_party
    },
    ["can_step_quest"] = function(p155)
        if p155.name == "interior_entered" and p155.options.destination_id == "housing" then
            if p155.options.house_owner and p155.options.house_owner ~= p155.player then
                return v_u_6.get_data(p155.options.house_owner, "daily_login_manager"):get_streak() >= 20
            else
                return false
            end
        else
            return false
        end
    end
}
v154.visit_house_with_20_login_streak = v156
local v158 = {
    ["name"] = "Visit the home of a player who has a 100+ day login streak",
    ["reward"] = v_u_6.make_bucks_reward(50),
    ["frame_info"] = {
        ["style"] = v2.daily_party
    },
    ["can_step_quest"] = function(p157)
        if p157.name == "interior_entered" and p157.options.destination_id == "housing" then
            if p157.options.house_owner and p157.options.house_owner ~= p157.player then
                return v_u_6.get_data(p157.options.house_owner, "daily_login_manager"):get_streak() >= 20
            else
                return false
            end
        else
            return false
        end
    end
}
v154.visit_house_with_100_login_streak = v158
v153("daily_quests", v154)
local v159 = v_u_6.add_quests
local v160 = {}
local v167 = {
    ["name"] = "Spend 60 seconds in a friend\'s house",
    ["reward"] = v_u_6.make_bucks_reward(60),
    ["frame_info"] = {
        ["style"] = v2.daily_time
    },
    ["total_steps"] = 60,
    ["step_type"] = "durational",
    ["can_step_time_quest"] = function(p161)
        local v163 = v_u_1("FriendsServer").get_friends(p161):now():andThen(function(p162)
            return p162.server
        end, function()
            return nil
        end):expect()
        if v163 then
            local v164 = v_u_6.get_data(p161, "char_wrapper")
            if v164 then
                v164 = v164:get_property("location")
            end
            if v164 then
                for v165, _ in pairs(v163) do
                    local v166 = v_u_9:GetPlayerByUserId(v165)
                    if v164 and (v164.destination_id == "housing" and v164.house_owner == v166) then
                        return true
                    end
                end
                return false
            end
        end
    end
}
v160.spend_sixty_seconds_in_a_friends_house = v167
local v171 = {
    ["name"] = "Play with someone on your friends list for 16 minutes",
    ["reward"] = v_u_6.make_bucks_reward(100),
    ["frame_info"] = {
        ["style"] = v2.daily_time
    },
    ["total_steps"] = 960,
    ["step_type"] = "durational",
    ["can_step_time_quest"] = function(p168)
        local v170 = v_u_1("FriendsServer").get_friends(p168):now():andThen(function(p169)
            return p169.server
        end, function()
            return nil
        end):expect()
        if v170 then
            return next(v170) ~= nil
        end
    end
}
v160.play_with_friend_for_sixteen_minutes = v171
local v173 = {
    ["name"] = "Play for 30 minutes",
    ["reward"] = v_u_6.make_bucks_reward(60),
    ["frame_info"] = {
        ["style"] = v2.daily_time
    },
    ["total_steps"] = 1800,
    ["step_type"] = "durational",
    ["can_step_time_quest"] = function(p172)
        return v_u_6.get_data(p172, "team") ~= nil
    end
}
v160.play_for_thirty_minutes = v173
v159("daily_quests", v160)
local v174 = v_u_6.add_quests
local v175 = {}
local v176 = {
    ["name"] = "Place a Bait on a Lure.",
    ["reward"] = v_u_6.make_bucks_reward(30),
    ["frame_info"] = {
        ["style"] = v2.lures_2023_daily
    },
    ["can_step_quest"] = v_u_6.is_event("lure_baited")
}
v175.lures_2023_bait_lure = v176
v174("daily_quests", v175)
v8.foreach("Quests", function(p177)
    for v178, v179 in p177 do
        v_u_6.add_quests(v178, v179)
    end
end)
return v11