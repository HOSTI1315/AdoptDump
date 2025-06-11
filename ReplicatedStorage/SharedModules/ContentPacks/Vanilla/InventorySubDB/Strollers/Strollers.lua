--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["airplane_stroller"] = {
        ["name"] = "Airplane Stroller",
        ["image"] = "rbxassetid://2761277758",
        ["rarity"] = "rare",
        ["model_handle"] = "AirplaneStroller",
        ["tool"] = "StrollerTool"
    },
    ["baby_basket_stroller"] = {
        ["name"] = "Baby Basket Stroller",
        ["image"] = "rbxassetid://2657667120",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "BabyBasketStroller",
        ["tool"] = "StrollerTool"
    },
    ["balloon_stroller"] = {
        ["name"] = "Balloon Stroller",
        ["image"] = "rbxassetid://2761277454",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1500,
        ["animation"] = "BabyOnBalloonStroller",
        ["colorable"] = true,
        ["colorable_models"] = { "BalloonStroller" },
        ["model_handle"] = "BalloonStroller",
        ["tool"] = "StrollerTool"
    },
    ["banana_stroller"] = {
        ["name"] = "Banana Stroller",
        ["image"] = "rbxassetid://3009779202",
        ["rarity"] = "rare",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "BananaStroller",
        ["tool"] = "StrollerTool"
    },
    ["bunny_stroller"] = {
        ["name"] = "Bunny Stroller",
        ["image"] = "rbxassetid://3082046286",
        ["rarity"] = "ultra_rare",
        ["currency_id"] = "eggs",
        ["animation"] = "BabyOnBalloonStroller",
        ["model_handle"] = "BunnyStroller",
        ["tool"] = "StrollerTool"
    },
    ["cannon_stroller"] = {
        ["name"] = "Cannon Stroller",
        ["image"] = "rbxassetid://3009779260",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "CannonStroller",
        ["tool"] = "StrollerTool"
    },
    ["car_stroller"] = {
        ["name"] = "Car Stroller",
        ["image"] = "rbxassetid://3269748269",
        ["rarity"] = "uncommon",
        ["cost"] = 450,
        ["colorable"] = true,
        ["colorable_models"] = { "CarStroller" },
        ["model_handle"] = "CarStroller",
        ["tool"] = "StrollerTool"
    },
    ["catapult_stroller"] = {
        ["name"] = "Catapult Stroller",
        ["image"] = "rbxassetid://6475616233",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "CatapultStroller",
        ["tool"] = "StrollerTool"
    },
    ["cauldron_stroller"] = {
        ["name"] = "Cauldron Stroller",
        ["image"] = "rbxassetid://4115248341",
        ["rarity"] = "rare",
        ["currency_id"] = "candy_2019",
        ["model_handle"] = "CauldronStroller",
        ["tool"] = "StrollerTool"
    },
    ["clam_stroller"] = {
        ["name"] = "Clam Stroller",
        ["image"] = "rbxassetid://6872761726",
        ["rarity"] = "common",
        ["donatable"] = false,
        ["model_handle"] = "ClamStroller",
        ["tool"] = "StrollerTool"
    },
    ["cradle_stroller"] = {
        ["name"] = "Cradle Stroller",
        ["image"] = "rbxassetid://2408051111",
        ["rarity"] = "rare",
        ["animation"] = "BabySleepOnBack",
        ["model_handle"] = "CradleStroller",
        ["tool"] = "StrollerTool"
    },
    ["crate_stroller"] = {
        ["name"] = "Crate Stroller",
        ["image"] = "rbxassetid://4361544460",
        ["rarity"] = "rare",
        ["model_handle"] = "CrateStroller",
        ["tool"] = "StrollerTool"
    },
    ["dog_house_stroller"] = {
        ["name"] = "Dog House Stroller",
        ["image"] = "rbxassetid://3486905775",
        ["rarity"] = "rare",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "DogHouseStroller",
        ["tool"] = "StrollerTool"
    },
    ["double_stroller"] = {
        ["name"] = "Double Stroller",
        ["image"] = "rbxassetid://1408016951",
        ["rarity"] = "uncommon",
        ["cost"] = 135,
        ["colorable"] = true,
        ["colorable_models"] = { "DoubleStroller" },
        ["model_handle"] = "DoubleStroller",
        ["tool"] = "StrollerTool"
    },
    ["droplet_stroller"] = {
        ["name"] = "Droplet Stroller",
        ["image"] = "rbxassetid://1406692267",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["colorable"] = true,
        ["colorable_models"] = { "DropletStroller" },
        ["model_handle"] = "DropletStroller",
        ["tool"] = "StrollerTool"
    },
    ["duck_stroller"] = {
        ["name"] = "Duck Stroller",
        ["image"] = "rbxassetid://2761277656",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "DuckStroller",
        ["tool"] = "StrollerTool"
    },
    ["easter_egg_stroller"] = {
        ["name"] = "Easter Egg Stroller",
        ["image"] = "rbxassetid://3082046174",
        ["rarity"] = "ultra_rare",
        ["currency_id"] = "eggs",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "EasterEggStroller",
        ["tool"] = "StrollerTool"
    },
    ["egg_stroller"] = {
        ["name"] = "Egg Stroller",
        ["image"] = "rbxassetid://2761277703",
        ["rarity"] = "rare",
        ["animation"] = "BabyOnEggStroller",
        ["colorable"] = true,
        ["colorable_models"] = { "EggStroller" },
        ["model_handle"] = "EggStroller",
        ["tool"] = "StrollerTool"
    },
    ["flower_stroller"] = {
        ["name"] = "Flower Stroller",
        ["image"] = "rbxassetid://4822522123",
        ["rarity"] = "ultra_rare",
        ["animation"] = "BabySleepOnBack",
        ["model_handle"] = "FlowerStroller",
        ["tool"] = "StrollerTool"
    },
    ["french_fries_stroller"] = {
        ["name"] = "French Fries Stroller",
        ["image"] = "rbxassetid://3009779395",
        ["rarity"] = "ultra_rare",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "FrenchFriesStroller",
        ["tool"] = "StrollerTool"
    },
    ["half_egg_stroller"] = {
        ["name"] = "Half Egg Stroller",
        ["image"] = "rbxassetid://3082046130",
        ["rarity"] = "ultra_rare",
        ["currency_id"] = "eggs",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "HalfEggStroller",
        ["tool"] = "StrollerTool"
    },
    ["hatched_egg_stroller"] = {
        ["name"] = "Hatched Egg Stroller",
        ["image"] = "rbxassetid://3486906113",
        ["rarity"] = "rare",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "HatchedEggStroller",
        ["tool"] = "StrollerTool"
    },
    ["heart_stroller"] = {
        ["name"] = "Heart Stroller",
        ["image"] = "rbxassetid://2848462165",
        ["rarity"] = "rare",
        ["model_handle"] = "HeartStroller",
        ["tool"] = "StrollerTool"
    },
    ["high_heel_stroller"] = {
        ["name"] = "High Heel Stroller",
        ["image"] = "rbxassetid://6475613319",
        ["rarity"] = "rare",
        ["model_handle"] = "HighHeelStroller",
        ["tool"] = "StrollerTool"
    },
    ["ice_cream_stroller"] = {
        ["name"] = "Ice Cream Stroller",
        ["image"] = "rbxassetid://2657670917",
        ["rarity"] = "rare",
        ["model_handle"] = "IceCreamStroller",
        ["tool"] = "StrollerTool"
    },
    ["kangaroo_stroller"] = {
        ["name"] = "Kangaroo Stroller",
        ["image"] = "rbxassetid://3486906383",
        ["rarity"] = "ultra_rare",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "KangarooStroller",
        ["tool"] = "StrollerTool"
    },
    ["palanquin_stroller"] = {
        ["name"] = "Palanquin Stroller",
        ["image"] = "rbxassetid://6309085791",
        ["rarity"] = "ultra_rare",
        ["cost"] = 800,
        ["model_handle"] = "PalanquinStroller",
        ["tool"] = "StrollerTool"
    },
    ["pizza_stroller"] = {
        ["name"] = "Pizza Stroller",
        ["image"] = "rbxassetid://2657670918",
        ["rarity"] = "rare",
        ["model_handle"] = "PizzaStroller",
        ["tool"] = "StrollerTool"
    },
    ["popsicle_stroller"] = {
        ["name"] = "Popsicle Stroller",
        ["image"] = "rbxassetid://3009779443",
        ["rarity"] = "ultra_rare",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "PopsicleStroller",
        ["tool"] = "StrollerTool"
    },
    ["pumpkin_stroller"] = {
        ["name"] = "Pumpkin Stroller",
        ["image"] = "rbxassetid://5882036757",
        ["rarity"] = "rare",
        ["cost"] = 1250,
        ["currency_id"] = "candy_2020",
        ["model_handle"] = "PumpkinStroller",
        ["tool"] = "StrollerTool"
    },
    ["quad_stroller"] = {
        ["name"] = "Quad Stroller",
        ["image"] = "rbxassetid://2408052388",
        ["rarity"] = "rare",
        ["model_handle"] = "QuadStroller",
        ["tool"] = "StrollerTool"
    },
    ["race_car_stroller"] = {
        ["name"] = "Race Car Stroller",
        ["image"] = "rbxassetid://2408035750",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "RaceCarStroller",
        ["tool"] = "StrollerTool"
    },
    ["rainbow_stroller"] = {
        ["name"] = "Rainbow Stroller",
        ["image"] = "rbxassetid://6710108407",
        ["rarity"] = "ultra_rare",
        ["cost"] = 2000,
        ["model_handle"] = "RainbowStroller",
        ["tool"] = "StrollerTool"
    },
    ["reindeer_stroller"] = {
        ["name"] = "Reindeer Stroller",
        ["image"] = "rbxassetid://4470748252",
        ["rarity"] = "ultra_rare",
        ["animation"] = "BabyOnReindeerStroller",
        ["model_handle"] = "ReindeerStroller",
        ["tool"] = "StrollerTool"
    },
    ["rocket_ship_stroller"] = {
        ["name"] = "Rocket Ship Stroller",
        ["image"] = "rbxassetid://2981204560",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["animation"] = "BabyOnUnicornStroller",
        ["colorable"] = true,
        ["colorable_models"] = { "RocketShipStroller" },
        ["model_handle"] = "RocketShipStroller",
        ["tool"] = "StrollerTool"
    },
    ["stroller-c"] = {
        ["name"] = "Stroller",
        ["image"] = "rbxassetid://1374259106",
        ["rarity"] = "uncommon",
        ["cost"] = 100,
        ["colorable"] = true,
        ["colorable_models"] = { "Stroller" },
        ["model_handle"] = "Stroller",
        ["tool"] = "StrollerTool"
    },
    ["stroller-default"] = {
        ["name"] = "Default Stroller",
        ["image"] = "rbxassetid://1374264340",
        ["rarity"] = "common",
        ["donatable"] = false,
        ["colorable"] = false,
        ["colorable_models"] = { "Stroller" },
        ["model_handle"] = "DefaultStroller",
        ["temporary"] = true,
        ["tool"] = "StrollerTool"
    },
    ["throne_stroller"] = {
        ["name"] = "Throne Stroller",
        ["image"] = "rbxassetid://2982964426",
        ["rarity"] = "rare",
        ["cost"] = 1250,
        ["animation"] = "BabyOnBalloonStroller",
        ["colorable"] = true,
        ["colorable_models"] = { "ThroneStroller" },
        ["model_handle"] = "ThroneStroller",
        ["tool"] = "StrollerTool"
    },
    ["trike_stroller"] = {
        ["name"] = "Trike Stroller",
        ["image"] = "rbxassetid://2657671637",
        ["rarity"] = "rare",
        ["model_handle"] = "TrikeStroller",
        ["tool"] = "StrollerTool"
    },
    ["triple_stroller"] = {
        ["name"] = "Triple Stroller",
        ["image"] = "rbxassetid://4361544584",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "TripleStroller",
        ["tool"] = "StrollerTool"
    },
    ["unicorn_stroller"] = {
        ["name"] = "Unicorn Stroller",
        ["image"] = "rbxassetid://2761277803",
        ["rarity"] = "ultra_rare",
        ["animation"] = "BabyOnUnicornStroller",
        ["model_handle"] = "UnicornStroller",
        ["tool"] = "StrollerTool"
    },
    ["vampire_stroller"] = {
        ["name"] = "Vampire Stroller",
        ["image"] = "rbxassetid://2466291803",
        ["rarity"] = "rare",
        ["currency_id"] = "candy",
        ["animation"] = "BabySleepOnBack",
        ["model_handle"] = "VampireStroller",
        ["tool"] = "StrollerTool"
    },
    ["wheelbarrow_stroller"] = {
        ["name"] = "Wheelbarrow Stroller",
        ["image"] = "rbxassetid://3066606234",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1000,
        ["model_handle"] = "WheelbarrowStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)