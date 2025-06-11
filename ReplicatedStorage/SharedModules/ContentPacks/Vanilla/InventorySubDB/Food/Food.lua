--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Apple",
    ["image"] = "rbxassetid://7208082808",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "AppleHold",
        ["use"] = "AppleEat"
    },
    ["model_handle"] = "Apple",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.apple = v3
local v4 = {
    ["name"] = "Starter Apple",
    ["image"] = "rbxassetid://1043331097",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "AppleHold",
        ["use"] = "AppleEat"
    },
    ["model_handle"] = "Apple",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 2
}
v2["apple-default"] = v4
local v5 = {
    ["name"] = "Baby Bottle",
    ["image"] = "rbxassetid://1484684696",
    ["rarity"] = "common",
    ["cost"] = 4,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "BabyBottleHold",
        ["use"] = "BabyBottleDrink"
    },
    ["model_handle"] = "BabyBottle",
    ["tool"] = "GenericTool",
    ["uses"] = 8
}
v2.baby_bottle = v5
local v6 = {
    ["name"] = "Baby Formula",
    ["image"] = "rbxassetid://949598899",
    ["rarity"] = "common",
    ["cost"] = 20,
    ["anims"] = {
        ["hold"] = "SolutionHold",
        ["use"] = "SolutionHandOver"
    },
    ["model_handle"] = { "Solution", "Spoon" },
    ["tool"] = "BabyFormulaTool",
    ["uses"] = 1
}
v2.babyformula = v6
local v7 = {
    ["name"] = "Big Head Potion",
    ["image"] = "rbxassetid://1373237029",
    ["rarity"] = "common",
    ["cost"] = 10,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "BigHeadPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.big_head_potion = v7
local v8 = {
    ["name"] = "Blueberry Pie",
    ["image"] = "rbxassetid://1043331234",
    ["rarity"] = "common",
    ["cost"] = 3,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PieHold",
        ["use"] = "PieEat"
    },
    ["model_handle"] = "BlueberryPie",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.blueberry_pie = v8
local v9 = {
    ["name"] = "Broken Egg",
    ["image"] = "rbxassetid://3081789202",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "BrokenEgg",
    ["tool"] = "GenericTool"
}
v2.broken_egg = v9
local v10 = {
    ["name"] = "Burger",
    ["image"] = "rbxassetid://1043331100",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Hamburger",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.burger = v10
local v11 = {
    ["name"] = "Cake",
    ["image"] = "rbxassetid://1043331098",
    ["rarity"] = "common",
    ["cost"] = 3,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "CakeHold",
        ["use"] = "CakeEat"
    },
    ["model_handle"] = "Cake",
    ["tool"] = "GenericTool",
    ["uses"] = 2
}
v2.cake = v11
local v12 = {
    ["name"] = "Candy Corn",
    ["image"] = "rbxassetid://7137574346",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocolateHold",
        ["use"] = "ChocolateEat"
    },
    ["model_handle"] = "CandyCorn",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.candy_corn = v12
local v13 = {
    ["name"] = "Monkey Fairground Cotton Candy",
    ["image"] = "rbxassetid://5057099870",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "LolipopHold",
        ["use"] = "LolipopEat"
    },
    ["model_handle"] = "CandyFlossChew",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.candy_floss_chew = v13
local v14 = {
    ["name"] = "Candy Cane",
    ["image"] = "rbxassetid://1256935670",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "LolipopHold",
        ["use"] = "LolipopEat"
    },
    ["model_handle"] = "CandyCane",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.candycane = v14
local v15 = {
    ["name"] = "Cheese",
    ["image"] = "rbxassetid://1043331099",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "CheeseHold",
        ["use"] = "CheeseEat"
    },
    ["model_handle"] = "BlockCheese",
    ["tool"] = "GenericTool",
    ["uses"] = 2
}
v2.cheese = v15
local v16 = {
    ["name"] = "Chocolate",
    ["image"] = "rbxassetid://1664053423",
    ["rarity"] = "common",
    ["cost"] = 5,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocolateHold",
        ["use"] = "ChocolateEat"
    },
    ["model_handle"] = "Chocolate",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.chocolate = v16
local v17 = {
    ["name"] = "Chocolate Drop",
    ["image"] = "rbxassetid://1664051618",
    ["rarity"] = "common",
    ["cost"] = 5,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocolateDropHold",
        ["use"] = "ChocolateDropEat"
    },
    ["model_handle"] = "ChocolateDrop",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.chocolate_drop = v17
local v18 = {
    ["name"] = "Chocolate Egg",
    ["image"] = "rbxassetid://1555801030",
    ["rarity"] = "common",
    ["cost"] = 50,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocoEggHold",
        ["use"] = "ChocoEggEat"
    },
    ["model_handle"] = "ChocolateEgg",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.chocolate_egg = v18
local v19 = {
    ["name"] = "Chocolate Milk",
    ["image"] = "rbxassetid://1043331237",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "ChocoMilkEat"
    },
    ["model_handle"] = "ChocoMilk",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.chocolate_milk = v19
local v20 = {
    ["name"] = "VIP Chocolate Milk",
    ["image"] = "rbxassetid://1043331237",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "ChocoMilkEat"
    },
    ["model_handle"] = "ChocoMilk",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 5,
    ["vip_exclusive"] = true
}
v2.chocolate_milk_vip = v20
local v21 = {
    ["name"] = "Chocolate Twist",
    ["image"] = "rbxassetid://1664046421",
    ["rarity"] = "common",
    ["cost"] = 5,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocolateTwistHold",
        ["use"] = "ChocolateTwistEat"
    },
    ["model_handle"] = "ChocolateTwist",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.chocolate_twist = v21
local v22 = {
    ["name"] = "Coffee",
    ["image"] = "rbxassetid://1802455067",
    ["rarity"] = "common",
    ["cost"] = 3,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "CoffeeHold",
        ["use"] = "CoffeeEat"
    },
    ["model_handle"] = "Coffee",
    ["tool"] = "GenericTool",
    ["uses"] = 6
}
v2.coffee = v22
local v23 = {
    ["name"] = "Coffee",
    ["image"] = "rbxassetid://4040027798",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "ChocoMilkEat"
    },
    ["model_handle"] = "CoffeePaperCup",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.coffee_paper_cup = v23
local v24 = {
    ["name"] = "Cookie",
    ["image"] = "rbxassetid://1256935825",
    ["rarity"] = "common",
    ["cost"] = 20,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Cookie",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.cookie = v24
local v25 = {
    ["name"] = "Cure All Potion",
    ["image"] = "rbxassetid://2657668946",
    ["rarity"] = "rare",
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "CureAllPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.cure_all_potion = v25
local v26 = {
    ["name"] = "Diamond Lavender",
    ["image"] = "rbxassetid://6380687803",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "DiamondLavender",
    ["tool"] = "DiamondLavender"
}
v2.diamond_lavender = v26
local v27 = {
    ["name"] = "Dim Sum",
    ["image"] = "rbxassetid://1423944885",
    ["rarity"] = "common",
    ["cost"] = 25,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "DimSumHold",
        ["use"] = "DimSumEat"
    },
    ["model_handle"] = "DimSum",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.dim_sum = v27
local v28 = {
    ["name"] = "Donut",
    ["image"] = "rbxassetid://2832243071",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "DonutHold",
        ["use"] = "DonutEat"
    },
    ["model_handle"] = { "Donut" },
    ["temporary"] = true,
    ["tool"] = "DonutTool",
    ["uses"] = 3
}
v2.donut = v28
local v29 = {
    ["name"] = "Cake",
    ["image"] = "rbxassetid://1043331098",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "CakeHold",
        ["use"] = "CakeEat"
    },
    ["model_handle"] = "Cake",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 2
}
v2.free_cake = v29
local v30 = {
    ["name"] = "Pizza",
    ["image"] = "rbxassetid://859201114",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PizzaHold",
        ["use"] = "PizzaEat"
    },
    ["model_handle"] = { "SmallPizza", "SmallPizzaSlice" },
    ["temporary"] = true,
    ["tool"] = "PizzaTool",
    ["uses"] = 4
}
v2.free_pizza = v30
local v31 = {
    ["name"] = "Golden Goldfish",
    ["image"] = "rbxassetid://3711817905",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "GoldenGoldfish",
    ["tool"] = "GoldenGoldfish"
}
v2.golden_goldfish = v31
local v32 = {
    ["name"] = "Green Tea Cup",
    ["image"] = "rbxassetid://4621220717",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "CoffeeHold",
        ["use"] = "TeaDrink"
    },
    ["model_handle"] = "GreenTeaCup",
    ["temporary"] = true,
    ["tool"] = "TeaCupTool",
    ["uses"] = 3
}
v2.green_tea_cup = v32
local v33 = {
    ["name"] = "Grow Potion",
    ["image"] = "rbxassetid://1373237971",
    ["rarity"] = "rare",
    ["cost"] = 395,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "GrowPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.grow_potion = v33
local v34 = {
    ["name"] = "Ham",
    ["image"] = "rbxassetid://1043331235",
    ["rarity"] = "common",
    ["cost"] = 3,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "HamHold",
        ["use"] = "HamEat"
    },
    ["model_handle"] = "Ham",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.ham = v34
local v35 = {
    ["name"] = "VIP Ham",
    ["image"] = "rbxassetid://1043331235",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "HamHold",
        ["use"] = "HamEat"
    },
    ["model_handle"] = "Ham",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 5,
    ["vip_exclusive"] = true
}
v2.ham_vip = v35
local v36 = {
    ["name"] = "Healing Apple",
    ["image"] = "rbxassetid://2315936820",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "sick",
    ["anims"] = {
        ["hold"] = "AppleHold",
        ["use"] = "AppleEat"
    },
    ["model_handle"] = "HealingApple",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.healing_apple = v36
local v37 = {
    ["name"] = "Heart Potion",
    ["image"] = "rbxassetid://2848331384",
    ["rarity"] = "uncommon",
    ["cost"] = 15,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "HeartPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.heart_potion = v37
local v38 = {
    ["name"] = "Honey",
    ["image"] = "rbxassetid://4315743582",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "Honey",
    ["tool"] = "Honey"
}
v2.honey = v38
local v39 = {
    ["name"] = "Honey Candy",
    ["image"] = "rbxassetid://7137574255",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocolateHold",
        ["use"] = "ChocolateEat"
    },
    ["model_handle"] = "HoneyCandy",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.honey_candy = v39
local v40 = {
    ["name"] = "Hotdog",
    ["image"] = "rbxassetid://1043331336",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "HotdogHold",
        ["use"] = "HotdogEat"
    },
    ["model_handle"] = "Hotdog",
    ["tool"] = "GenericTool",
    ["uses"] = 2
}
v2.hotdog = v40
local v41 = {
    ["name"] = "Hyperspeed Potion",
    ["image"] = "rbxassetid://1373208271",
    ["rarity"] = "common",
    ["cost"] = 40,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "HyperspeedPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.hyperspeed_potion = v41
local v42 = {
    ["name"] = "Ice Tub",
    ["image"] = "rbxassetid://1664051360",
    ["rarity"] = "common",
    ["cost"] = 5,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "IceTubHold",
        ["use"] = "IceTubEat"
    },
    ["model_handle"] = "IceTub",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.ice_tub = v42
local v43 = {
    ["name"] = "Jasmine Tea Cup",
    ["image"] = "rbxassetid://4621220818",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "CoffeeHold",
        ["use"] = "TeaDrink"
    },
    ["model_handle"] = "JasmineTeaCup",
    ["temporary"] = true,
    ["tool"] = "TeaCupTool",
    ["uses"] = 3
}
v2.jasmine_tea_cup = v43
local v44 = {
    ["name"] = "Lemonade",
    ["image"] = "rbxassetid://3529569823",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "ChocoMilkEat"
    },
    ["model_handle"] = "Lemonade",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.lemonade = v44
local v45 = {
    ["name"] = "Levitation Potion",
    ["image"] = "rbxassetid://1373237476",
    ["rarity"] = "ultra_rare",
    ["cost"] = 995,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "LevitationPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.levitation_potion = v45
local v46 = {
    ["name"] = "Lolipop",
    ["image"] = "rbxassetid://1106651124",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "LolipopHold",
        ["use"] = "LolipopEat"
    },
    ["model_handle"] = "Lolipop",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true,
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.lolipop = v46
local v47 = {
    ["name"] = "Marshmallow On A Stick",
    ["image"] = "rbxassetid://3060778479",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "MarshmallowStickHold",
        ["use"] = "MarshmallowStickEat"
    },
    ["model_handle"] = "MarshmallowOnAStick",
    ["temporary"] = true,
    ["tool"] = "MarshmallowTool",
    ["uses"] = 1
}
v2.marshmallow_on_a_stick = v47
local v48 = {
    ["name"] = "Mooncake",
    ["image"] = "rbxassetid://7471314235",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Mooncake",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.mooncake = v48
local v49 = {
    ["name"] = "Anti-gravity Potion",
    ["image"] = "rbxassetid://1373208033",
    ["rarity"] = "uncommon",
    ["cost"] = 99,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "NogravPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.nograv_potion = v49
local v50 = {
    ["name"] = "Oolong Tea Cup",
    ["image"] = "rbxassetid://4621220772",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "CoffeeHold",
        ["use"] = "TeaDrink"
    },
    ["model_handle"] = "OolongTeaCup",
    ["temporary"] = true,
    ["tool"] = "TeaCupTool",
    ["uses"] = 3
}
v2.oolong_tea_cup = v50
local v51 = {
    ["name"] = "Patterns Egg",
    ["image"] = "rbxassetid://3081624934",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "PatternsEgg",
    ["tool"] = "GenericTool"
}
v2.patterns_egg = v51
local v52 = {
    ["name"] = "Fly-A-Pet Potion (Forever)",
    ["image"] = "rbxassetid://4047157976",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_doll"] = true,
    ["cannot_feed_to_egg"] = true,
    ["cannot_feed_to_self"] = true,
    ["message"] = "Product Description: Feed this to a pet to make it permanently flyable",
    ["model_handle"] = "FlyingPotion",
    ["player_must_confirm"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_flying_potion = v52
local v53 = {
    ["name"] = "Pet Food",
    ["image"] = "rbxassetid://3261465541",
    ["rarity"] = "common",
    ["cost"] = 5,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_self"] = true,
    ["model_handle"] = "PetFood",
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_food = v53
local v54 = {
    ["name"] = "Big Brew Potion (10 min)",
    ["image"] = "rbxassetid://4601494965",
    ["rarity"] = "rare",
    ["cost"] = 350,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_egg"] = true,
    ["cannot_feed_to_self"] = true,
    ["message"] = "Product Description: Feed this to a pet to make it temporarily bigger",
    ["model_handle"] = "PetGrowPotion",
    ["player_must_confirm"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_grow_potion = v54
local v55 = {
    ["name"] = "Ride-A-Pet Potion (Forever)",
    ["image"] = "rbxassetid://3342628435",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_doll"] = true,
    ["cannot_feed_to_egg"] = true,
    ["cannot_feed_to_self"] = true,
    ["message"] = "Product Description: Feed this to a pet to make it permanently rideable",
    ["model_handle"] = "RidingPotion",
    ["player_must_confirm"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_riding_potion = v55
local v56 = {
    ["name"] = "Small Sip Potion (10 min)",
    ["image"] = "rbxassetid://4601495117",
    ["rarity"] = "rare",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_egg"] = true,
    ["cannot_feed_to_self"] = true,
    ["message"] = "Product Description: Feed this to a pet to make it temporarily smaller",
    ["model_handle"] = "PetShrinkPotion",
    ["player_must_confirm"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_shrink_potion = v56
local v57 = {
    ["name"] = "Translucent Tea Potion (10 min)",
    ["image"] = "rbxassetid://4601495216",
    ["rarity"] = "rare",
    ["cost"] = 600,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_egg"] = true,
    ["cannot_feed_to_self"] = true,
    ["message"] = "Product Description: Feed this to a pet to make it temporarily translucent",
    ["model_handle"] = "PetTranslucencyPotion",
    ["player_must_confirm"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_translucency_potion = v57
local v58 = {
    ["name"] = "Pet Treat",
    ["image"] = "rbxassetid://7543642158",
    ["rarity"] = "uncommon",
    ["cost"] = 10,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_self"] = true,
    ["model_handle"] = "PetTreat",
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_treat = v58
local v59 = {
    ["name"] = "Homemade Pizza",
    ["image"] = "rbxassetid://859201114",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PizzaHold",
        ["use"] = "PizzaEat"
    },
    ["model_handle"] = { "SmallPizza", "SmallPizzaSlice" },
    ["tool"] = "PizzaTool",
    ["uses"] = 4
}
v2.pizza = v59
local v60 = {
    ["name"] = "Cheese",
    ["image"] = "rbxassetid://10625422227",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "CheeseHold",
        ["use"] = "CheeseEat"
    },
    ["model_handle"] = "PizzaShopCheese",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pizza_shop_cheese = v60
local v61 = {
    ["name"] = "Ham",
    ["image"] = "rbxassetid://10625422083",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "HamHold",
        ["use"] = "HamEat"
    },
    ["model_handle"] = "PizzaShopHam",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pizza_shop_ham = v61
local v62 = {
    ["name"] = "Mushroom",
    ["image"] = "rbxassetid://10625421947",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "CheeseHold",
        ["use"] = "CheeseEat"
    },
    ["model_handle"] = "PizzaShopMushroom",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pizza_shop_mushroom = v62
local v63 = {
    ["name"] = "Pepperoni",
    ["image"] = "rbxassetid://10779416897",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "HamHold",
        ["use"] = "HamEat"
    },
    ["model_handle"] = "PizzaShopPepperoni",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pizza_shop_pepperoni = v63
local v64 = {
    ["name"] = "Pineapple",
    ["image"] = "rbxassetid://10625421610",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "WatermelonHold",
        ["use"] = "WatermelonEat"
    },
    ["model_handle"] = "PizzaShopPineapple",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pizza_shop_pineapple = v64
local v65 = {
    ["name"] = "Pizza",
    ["image"] = "rbxassetid://10794597904",
    ["rarity"] = "common",
    ["donatable"] = true,
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PizzaShopPizzaHold",
        ["use"] = "PizzaShopPizzaEat"
    },
    ["model_handle"] = { "PizzaShopPizza" },
    ["temporary"] = true,
    ["tool"] = "PizzaShopPizza",
    ["uses"] = 6
}
v2.pizza_shop_pizza = v65
local v66 = {
    ["name"] = "Tomato",
    ["image"] = "rbxassetid://10625421438",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "CheeseHold",
        ["use"] = "CheeseEat"
    },
    ["model_handle"] = "PizzaShopTomato",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pizza_shop_tomato = v66
local v67 = {
    ["name"] = "Popcorn",
    ["image"] = "rbxassetid://1043331337",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PopcornHold",
        ["use"] = "PopcornEat"
    },
    ["model_handle"] = "Popcorn",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.popcorn = v67
local v68 = {
    ["name"] = "VIP Popcorn",
    ["image"] = "rbxassetid://1043331337",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PopcornHold",
        ["use"] = "PopcornEat"
    },
    ["model_handle"] = "Popcorn",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 5,
    ["vip_exclusive"] = true
}
v2.popcorn_vip = v68
local v69 = {
    ["name"] = "Raspberry Pie",
    ["image"] = "rbxassetid://1043331334",
    ["rarity"] = "common",
    ["cost"] = 3,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "PieHold",
        ["use"] = "PieEat"
    },
    ["model_handle"] = "RaspberryPie",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.raspberry_pie = v69
local v70 = {
    ["name"] = "Sandwich",
    ["image"] = "rbxassetid://2582282124",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Sandwich",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.sandwich = v70
local v71 = {
    ["name"] = "Sandwich",
    ["image"] = "rbxassetid://2582282124",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Sandwich",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2["sandwich-default"] = v71
local v72 = {
    ["name"] = "Seaweed",
    ["image"] = "rbxassetid://6872724328",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocolateHold",
        ["use"] = "ChocolateEat"
    },
    ["model_handle"] = "Seaweed",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.seaweed = v72
local v73 = {
    ["name"] = "S\'mores Cookie",
    ["image"] = "rbxassetid://3060778366",
    ["rarity"] = "common",
    ["cost"] = 5,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Smores",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.smores = v73
local v74 = {
    ["name"] = "Snowflake Potion",
    ["image"] = "rbxassetid://2660978177",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "SnowflakePotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.snowflake_potion = v74
local v75 = {
    ["name"] = "Soda",
    ["image"] = "rbxassetid://1043331238",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "SodaHold",
        ["use"] = "SodaEat"
    },
    ["model_handle"] = "Soda",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.soda = v75
local v76 = {
    ["name"] = "Soda",
    ["image"] = "rbxassetid://10627240963",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "SodaFountainHoldGlass",
        ["use"] = "SodaFountainDrink"
    },
    ["model_handle"] = "SodaFountainSoda",
    ["sounds"] = {
        ["use"] = "DrinkWaterColaFull"
    },
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 4
}
v2.soda_fountain_soda = v76
local v77 = {
    ["name"] = "Water",
    ["image"] = "rbxassetid://10627240744",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "SodaFountainHoldGlass",
        ["use"] = "SodaFountainDrink"
    },
    ["model_handle"] = "SodaFountainWater",
    ["sounds"] = {
        ["use"] = "DrinkWaterColaFull"
    },
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 4
}
v2.soda_fountain_water = v77
local v78 = {
    ["name"] = "Stars Egg",
    ["image"] = "rbxassetid://3081624987",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "StarsEgg",
    ["tool"] = "GenericTool"
}
v2.stars_egg = v78
local v79 = {
    ["name"] = "Stripes Egg",
    ["image"] = "rbxassetid://3081624873",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "StripesEgg",
    ["tool"] = "GenericTool"
}
v2.stripes_egg = v79
local v80 = {
    ["name"] = "Taco",
    ["image"] = "rbxassetid://1043331094",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "TacoHold",
        ["use"] = "TacoEat"
    },
    ["model_handle"] = "Taco",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.taco = v80
local v81 = {
    ["name"] = "Tea",
    ["image"] = "rbxassetid://1802464216",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "CoffeeHold",
        ["use"] = "CoffeeEat"
    },
    ["model_handle"] = "Tea",
    ["tool"] = "GenericTool",
    ["uses"] = 6
}
v2.tea = v81
local v82 = {
    ["name"] = "Teacher\'s Apple",
    ["image"] = "rbxassetid://110961480714077",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "AppleHold",
        ["use"] = "AppleEat"
    },
    ["model_handle"] = "Apple",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.teachers_apple = v82
local v83 = {
    ["name"] = "Teleportation Potion",
    ["image"] = "rbxassetid://2657668942",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "TeleportationPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 5
}
v2.teleportation_potion = v83
local v84 = {
    ["name"] = "Water Bottle",
    ["image"] = "rbxassetid://138528808388444",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "WaterHold",
        ["use"] = "WaterEat"
    },
    ["model_handle"] = "Water",
    ["tool"] = "GenericTool",
    ["uses"] = 8
}
v2.water = v84
local v85 = {
    ["name"] = "Water",
    ["image"] = "rbxassetid://4040027714",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "WaterHold",
        ["use"] = "WaterEat"
    },
    ["model_handle"] = "WaterPaperCup",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.water_paper_cup = v85
local v86 = {
    ["name"] = "VIP Water",
    ["image"] = "rbxassetid://1050940063",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "WaterHold",
        ["use"] = "WaterEat"
    },
    ["model_handle"] = "Water",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 8,
    ["vip_exclusive"] = true
}
v2.water_vip = v86
local v87 = {
    ["name"] = "Water Walking Potion",
    ["image"] = "rbxassetid://3579315914",
    ["rarity"] = "rare",
    ["cost"] = 80,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["model_handle"] = "WaterWalkingPotion",
    ["tool"] = "PotionTool",
    ["uses"] = 1
}
v2.water_walking_potion = v87
local v88 = {
    ["name"] = "Watermelon",
    ["image"] = "rbxassetid://1043331236",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "WatermelonHold",
        ["use"] = "WatermelonEat"
    },
    ["model_handle"] = "Watermelon",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.watermelon = v88
return v1(v2)