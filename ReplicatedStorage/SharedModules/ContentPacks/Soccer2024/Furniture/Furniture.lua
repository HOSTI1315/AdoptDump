--// ReplicatedStorage.SharedModules.ContentPacks.Soccer2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = {
    ["soccer_2024_shower_bench"] = {
        ["name"] = "Shower Bench",
        ["cost"] = 77,
        ["model_name"] = "Soccer2024ShowerBench",
        ["image_id"] = 18295855834
    },
    ["soccer_2024_clothes_rack"] = {
        ["name"] = "Clothes Rack",
        ["cost"] = 230,
        ["model_name"] = "Soccer2024ClothesRack",
        ["image_id"] = 18295855991
    },
    ["soccer_2024_gym_barbell"] = {
        ["name"] = "Gym Barbell",
        ["cost"] = 55,
        ["model_name"] = "Soccer2024GymBarbell",
        ["image_id"] = 18295881180
    },
    ["soccer_2024_gym_dumbbell"] = {
        ["name"] = "Gym Dumbbell",
        ["cost"] = 35,
        ["model_name"] = "Soccer2024GymDumbbell",
        ["image_id"] = 18295880870
    },
    ["soccer_2024_dumbbell_rack"] = {
        ["name"] = "Dumbbell Rack",
        ["cost"] = 175,
        ["model_name"] = "Soccer2024DumbbellRack",
        ["image_id"] = 18295880772
    },
    ["soccer_2024_exercise_ball"] = {
        ["name"] = "Exercise Ball",
        ["cost"] = 65,
        ["model_name"] = "Soccer2024ExerciseBall",
        ["image_id"] = 18295909339
    },
    ["soccer_2024_soap_dispenser"] = {
        ["name"] = "Soap Dispenser",
        ["cost"] = 19,
        ["model_name"] = "Soccer2024SoapDispenser",
        ["image_id"] = 18291728980
    },
    ["soccer_2024_lifting_bench"] = {
        ["name"] = "Lifting Bench",
        ["cost"] = 65,
        ["model_name"] = "Soccer2024LiftingBench",
        ["image_id"] = 18295881003
    },
    ["soccer_2024_shampoo_bottle"] = {
        ["name"] = "Shampoo Bottle",
        ["cost"] = 27,
        ["model_name"] = "Soccer2024ShampooBottle",
        ["image_id"] = 18291728777
    },
    ["soccer_2024_shower_shelf"] = {
        ["name"] = "Shower Shelf",
        ["cost"] = 44,
        ["model_name"] = "Soccer2024ShowerShelf",
        ["image_id"] = 18295856123
    },
    ["soccer_2024_gym_shower"] = {
        ["name"] = "Gym Shower",
        ["cost"] = 153,
        ["model_name"] = "Soccer2024GymShower",
        ["image_id"] = 18428865129,
        ["behavior"] = v1("FurnitureUseHelperDB").SHOWER_WITH_FADING_DOOR()
    },
    ["soccer_2024_shower_gel_bottle"] = {
        ["name"] = "Shower Gel Bottle",
        ["cost"] = 27,
        ["model_name"] = "Soccer2024ShowerGelBottle",
        ["image_id"] = 18291728887
    },
    ["soccer_2024_gym_wall_sign"] = {
        ["name"] = "Gym Wall Sign",
        ["cost"] = 120,
        ["model_name"] = "Soccer2024GymWallSign",
        ["image_id"] = 18428975339
    },
    ["soccer_2024_soap_tray"] = {
        ["name"] = "Soap Tray",
        ["cost"] = 15,
        ["model_name"] = "Soccer2024SoapTray",
        ["image_id"] = 18291728658
    },
    ["soccer_2024_stool"] = {
        ["name"] = "Stool",
        ["cost"] = 45,
        ["model_name"] = "Soccer2024Stool",
        ["image_id"] = 18291728374
    },
    ["soccer_2024_towel_rack"] = {
        ["name"] = "Towel Rack",
        ["cost"] = 55,
        ["model_name"] = "Soccer2024TowelRack",
        ["image_id"] = 18295856277
    }
}
local v6 = {
    ["name"] = "Treadmill",
    ["cost"] = 450,
    ["model_name"] = "Soccer2024Treadmill",
    ["image_id"] = 18295881100,
    ["behavior"] = {
        ["render"] = function(_, p4)
            local v5 = p4.Treadmill2024.TreadmillMover
            v5.Velocity = v5.CFrame.LookVector * 15
        end
    }
}
v3.soccer_2024_treadmill = v6
v3.soccer_2024_dumbbell_wall_decal = {
    ["name"] = "Dumbbell Wall Decal",
    ["cost"] = 140,
    ["model_name"] = "Soccer2024DumbbellWallDecal",
    ["image_id"] = 18295856469
}
v3.soccer_2024_yoga_mat = {
    ["name"] = "Yoga Mat",
    ["cost"] = 40,
    ["model_name"] = "Soccer2024YogaMat",
    ["image_id"] = 18295881256
}
for _, v7 in v3 do
    v7.tags = { "Soccer2024" }
end
return v2.furniture(v3)