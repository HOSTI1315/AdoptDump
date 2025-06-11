--// ReplicatedStorage.SharedModules.ContentPacks.UGCRefresh2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "African Wild Dog",
    ["image"] = "rbxassetid://13810870050",
    ["model"] = "UGCRefresh2023AfricanWildDog",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "UGCRefresh2023AfricanWildDogBeingHeldDouble",
        ["eating"] = "UGCRefresh2023AfricanWildDogEat",
        ["flying"] = "UGCRefresh2023AfricanWildDogRun",
        ["hold"] = "UGCRefresh2023AfricanWildDogBeingHeldSingle",
        ["idle"] = "UGCRefresh2023AfricanWildDogIdle",
        ["running"] = "UGCRefresh2023AfricanWildDogRun",
        ["sit"] = "UGCRefresh2023AfricanWildDogSit",
        ["sleep"] = "UGCRefresh2023AfricanWildDogSleep"
    },
    ["tricks"] = {
        { "Sit", "UGCRefresh2023AfricanWildDogSit" },
        { "Joyful", "UGCRefresh2023AfricanWildDogJoyful" },
        { "Beg", "UGCRefresh2023AfricanWildDogBeg" },
        { "Jump", "UGCRefresh2023AfricanWildDogJump" },
        { "Trick 1", "UGCRefresh2023AfricanWildDogTrick1" },
        { "Trick 2", "UGCRefresh2023AfricanWildDogTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot"] = Color3.fromRGB(117, 186, 44),
        ["FrontRightFoot"] = Color3.fromRGB(117, 186, 44),
        ["LeftEar2"] = Color3.fromRGB(117, 186, 44),
        ["LeftEar3"] = Color3.fromRGB(117, 186, 44),
        ["RightEar2"] = Color3.fromRGB(117, 186, 44),
        ["RightEar3"] = Color3.fromRGB(117, 186, 44),
        ["Tail3"] = Color3.fromRGB(117, 186, 44),
        ["Torso3"] = Color3.fromRGB(117, 186, 44)
    },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.ugc_refresh_2023_african_wild_dog = v3
local v4 = {
    ["name"] = "Lion Cub",
    ["image"] = "rbxassetid://13665143675",
    ["model"] = "UGCRefresh2023LionCub",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "UGCRefresh2023LionCubBeingHeldDouble",
        ["eating"] = "UGCRefresh2023LionCubEat",
        ["flying"] = "UGCRefresh2023LionCubRun",
        ["hold"] = "UGCRefresh2023LionCubBeingHeldSingle",
        ["idle"] = "UGCRefresh2023LionCubIdle",
        ["running"] = "UGCRefresh2023LionCubRun",
        ["sit"] = "UGCRefresh2023LionCubSit",
        ["sleep"] = "UGCRefresh2023LionCubSleep"
    },
    ["tricks"] = {
        { "Sit", "UGCRefresh2023LionCubSit" },
        { "Joyful", "UGCRefresh2023LionCubJoyful" },
        { "Beg", "UGCRefresh2023LionCubBeg" },
        { "Jump", "UGCRefresh2023LionCubJump" },
        { "Trick 1", "UGCRefresh2023LionCubTrick1" },
        { "Trick 2", "UGCRefresh2023LionCubTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(184, 92, 0),
        ["Hair10"] = Color3.fromRGB(184, 92, 0),
        ["Hair12"] = Color3.fromRGB(184, 92, 0),
        ["Hair2"] = Color3.fromRGB(184, 92, 0),
        ["Hair3"] = Color3.fromRGB(184, 92, 0),
        ["Hair4"] = Color3.fromRGB(184, 92, 0),
        ["Hair6"] = Color3.fromRGB(184, 92, 0),
        ["Hair7"] = Color3.fromRGB(184, 92, 0),
        ["Hair8"] = Color3.fromRGB(184, 92, 0),
        ["Hair9"] = Color3.fromRGB(184, 92, 0),
        ["Head2"] = Color3.fromRGB(184, 92, 0),
        ["LeftBackFoot"] = Color3.fromRGB(184, 92, 0),
        ["LeftEar2"] = Color3.fromRGB(184, 92, 0),
        ["LeftFrontFoot"] = Color3.fromRGB(184, 92, 0),
        ["Nose"] = Color3.fromRGB(184, 92, 0),
        ["RightBackFoot"] = Color3.fromRGB(184, 92, 0),
        ["RightEar2"] = Color3.fromRGB(184, 92, 0),
        ["RightFrontFoot"] = Color3.fromRGB(184, 92, 0),
        ["Torso2"] = Color3.fromRGB(184, 92, 0),
        ["Whiskers"] = Color3.fromRGB(184, 92, 0),
        ["whisker_L_01"] = Color3.fromRGB(184, 92, 0),
        ["whisker_L_02"] = Color3.fromRGB(184, 92, 0),
        ["whisker_R_01"] = Color3.fromRGB(184, 92, 0),
        ["whisker_R_02"] = Color3.fromRGB(184, 92, 0)
    },
    ["minimum_fly_anim_speed"] = 0.5,
    ["minimum_run_anim_speed"] = 1.5
}
v2.ugc_refresh_2023_lion_cub = v4
local v5 = {
    ["name"] = "Ostrich",
    ["image"] = "rbxassetid://13664716167",
    ["model"] = "UGCRefresh2023Ostrich",
    ["rarity"] = "rare",
    ["cost"] = 1300,
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "UGCRefresh2023OstrichBeingHeldDouble",
        ["eating"] = "UGCRefresh2023OstrichEat",
        ["flying"] = "UGCRefresh2023OstrichRun",
        ["hold"] = "UGCRefresh2023OstrichBeingHeldSingle",
        ["idle"] = "UGCRefresh2023OstrichIdle",
        ["running"] = "UGCRefresh2023OstrichRun",
        ["sit"] = "UGCRefresh2023OstrichSit",
        ["sleep"] = "UGCRefresh2023OstrichSleep"
    },
    ["tricks"] = {
        { "Sit", "UGCRefresh2023OstrichSit" },
        { "Joyful", "UGCRefresh2023OstrichJoyful" },
        { "Beg", "UGCRefresh2023OstrichBeg" },
        { "Jump", "UGCRefresh2023OstrichJump" },
        { "Trick 1", "UGCRefresh2023OstrichTrick1" },
        { "Trick 2", "UGCRefresh2023OstrichTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(98, 37, 209),
        ["Feathers"] = Color3.fromRGB(98, 37, 209),
        ["LeftFoot"] = Color3.fromRGB(98, 37, 209),
        ["LeftWing2"] = Color3.fromRGB(98, 37, 209),
        ["RightFoot"] = Color3.fromRGB(98, 37, 209),
        ["RightWing2"] = Color3.fromRGB(98, 37, 209),
        ["Tail2"] = Color3.fromRGB(98, 37, 209)
    },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.ugc_refresh_2023_ostrich = v5
local v6 = {
    ["name"] = "Warthog",
    ["image"] = "rbxassetid://13665210525",
    ["model"] = "UGCRefresh2023Warthog",
    ["rarity"] = "uncommon",
    ["cost"] = 600,
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "UGCRefresh2023WarthogBeingHeldDouble",
        ["eating"] = "UGCRefresh2023WarthogEat",
        ["flying"] = "UGCRefresh2023WarthogRun",
        ["hold"] = "UGCRefresh2023WarthogBeingHeldSingle",
        ["idle"] = "UGCRefresh2023WarthogIdle",
        ["running"] = "UGCRefresh2023WarthogRun",
        ["sit"] = "UGCRefresh2023WarthogSit",
        ["sleep"] = "UGCRefresh2023WarthogSleep"
    },
    ["tricks"] = {
        { "Sit", "UGCRefresh2023WarthogSit" },
        { "Joyful", "UGCRefresh2023WarthogJoyful" },
        { "Beg", "UGCRefresh2023WarthogBeg" },
        { "Jump", "UGCRefresh2023WarthogJump" },
        { "Trick 1", "UGCRefresh2023WarthogTrick1" },
        { "Trick 2", "UGCRefresh2023WarthogTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(91, 154, 76),
        ["Hair10"] = Color3.fromRGB(91, 154, 76),
        ["Hair11"] = Color3.fromRGB(91, 154, 76),
        ["Hair12"] = Color3.fromRGB(91, 154, 76),
        ["Hair2"] = Color3.fromRGB(91, 154, 76),
        ["Hair3"] = Color3.fromRGB(91, 154, 76),
        ["Hair4"] = Color3.fromRGB(91, 154, 76),
        ["Hair5"] = Color3.fromRGB(91, 154, 76),
        ["Hair6"] = Color3.fromRGB(91, 154, 76),
        ["Hair7"] = Color3.fromRGB(91, 154, 76),
        ["Hair8"] = Color3.fromRGB(91, 154, 76),
        ["Hair9"] = Color3.fromRGB(91, 154, 76),
        ["LeftFrontFoot"] = Color3.fromRGB(91, 154, 76),
        ["RightBackFoot"] = Color3.fromRGB(91, 154, 76),
        ["RightFrontFoot"] = Color3.fromRGB(91, 154, 76),
        ["RightLeftFoot"] = Color3.fromRGB(91, 154, 76),
        ["Tail2"] = Color3.fromRGB(91, 154, 76),
        ["Tusks"] = Color3.fromRGB(91, 154, 76)
    },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.ugc_refresh_2023_warthog = v6
return v1(v2)