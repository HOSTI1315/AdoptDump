--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.InventorySubDB.Roleplay (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).roleplay
local v2 = {}
local v3 = {
    ["name"] = "Broom",
    ["image"] = "rbxassetid://10625297033",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "UsePushBroom"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "Broom",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["tool_use_properties"] = {
        ["allow_cancellation_partway_through_use"] = true,
        ["turn_on_visual_effects_when_used"] = true
    }
}
v2.broom = v3
local v4 = {
    ["name"] = "Colored Hair Spray",
    ["image"] = "rbxassetid://9201969112",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "ColoredHairsprayUse"
    },
    ["colorable"] = true,
    ["is_roleplay_item"] = true,
    ["model_handle"] = "ColoredHairSpray",
    ["temporary"] = true,
    ["tool"] = "ColoredHairSpray",
    ["tool_use_properties"] = {
        ["turn_on_visual_effects_when_used"] = true
    }
}
v2.colored_hair_spray = v4
local v5 = {
    ["name"] = "Baseball Bat",
    ["image"] = "rbxassetid://9541845379",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "BaseballBatSwing"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "CriminalBaseballBat",
    ["temporary"] = true,
    ["tool"] = "CriminalBaseballBat"
}
v2.criminal_baseball_bat = v5
local v6 = {
    ["name"] = "Criminal Handcuffs",
    ["image"] = "rbxassetid://9542385949",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "HandcuffedAnimation"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "NoModelHandle",
    ["temporary"] = true,
    ["tool"] = "CriminalHandcuffs"
}
v2.criminal_handcuffs = v6
v2.detective_handcuffs = {
    ["name"] = "Detective\'s Handcuffs",
    ["image"] = "rbxassetid://9542385949",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["is_roleplay_item"] = true,
    ["model_handle"] = "Handcuffs",
    ["temporary"] = true,
    ["tool"] = "DetectiveHandcuffs"
}
local v7 = {
    ["name"] = "Pay Bonuses",
    ["image"] = "rbxassetid://10523873531",
    ["rarity"] = "ultra_rare",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "EmployeeBonuses",
    ["temporary"] = true,
    ["tool"] = "EmployeeBonuses"
}
v2.employee_bonuses = v7
local v8 = {
    ["name"] = "Hair Dryer",
    ["image"] = "rbxassetid://9201968132",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "HairDryerUse"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "HairDryer",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["tool_use_properties"] = {
        ["allow_cancellation_partway_through_use"] = true,
        ["turn_on_visual_effects_when_used"] = true
    }
}
v2.hair_dryer = v8
v2.heist_gloves_furniture_stealing = {
    ["name"] = "Heist Gloves: Furniture Stealing",
    ["image"] = "rbxassetid://9541845255",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["is_roleplay_item"] = true,
    ["model_handle"] = "NoModelHandle",
    ["temporary"] = true,
    ["tool"] = "HeistGlovesFurnitureStealing"
}
local v9 = {
    ["name"] = "Mop",
    ["image"] = "rbxassetid://10625285201",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "UseMop"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "Mop",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["tool_use_properties"] = {
        ["allow_cancellation_partway_through_use"] = true,
        ["turn_on_visual_effects_when_used"] = true
    }
}
v2.mop = v9
local v10 = {
    ["name"] = "Dirty Plates",
    ["image"] = "rbxassetid://10607961446",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "PizzaShopDirtyPlates",
    ["temporary"] = true,
    ["tool"] = "PizzaShopDirtyPlates"
}
v2.pizza_shop_dirty_plates = v10
local v11 = {
    ["name"] = "Pizza Box",
    ["image"] = "rbxassetid://10795210948",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "PizzaShopEmptyBox",
    ["temporary"] = true,
    ["tool"] = "GenericTool"
}
v2.pizza_shop_empty_box = v11
local v12 = {
    ["name"] = "Plate",
    ["image"] = "rbxassetid://10795210684",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "PizzaShopEmptyPlate",
    ["temporary"] = true,
    ["tool"] = "GenericTool"
}
v2.pizza_shop_empty_plate = v12
local v13 = {
    ["name"] = "Pizza Shop Menu",
    ["image"] = "rbxassetid://10627498912",
    ["rarity"] = "common",
    ["donatable"] = true,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "HoldMenu"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "PizzaShopMenu",
    ["temporary"] = true,
    ["tool"] = "PizzaShopMenu"
}
v2.pizza_shop_menu = v13
local v14 = {
    ["name"] = "Scissors",
    ["image"] = "rbxassetid://9201970064",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CuttingHair"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "Scissors",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["tool_use_properties"] = {
        ["allow_cancellation_partway_through_use"] = true,
        ["turn_on_visual_effects_when_used"] = true
    }
}
v2.scissors = v14
local v15 = {
    ["name"] = "Notepad: Take Orders",
    ["image"] = "rbxassetid://10626472132",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["anims"] = {
        ["hold"] = "HoldNotepad",
        ["use"] = "UseNotepad"
    },
    ["is_roleplay_item"] = true,
    ["model_handle"] = "PizzaShopNotepad",
    ["temporary"] = true,
    ["tool"] = "WaitersNotepad",
    ["tool_use_properties"] = {
        ["turn_on_visual_effects_when_used"] = true
    }
}
v2.waiters_notepad = v15
return v1(v2)