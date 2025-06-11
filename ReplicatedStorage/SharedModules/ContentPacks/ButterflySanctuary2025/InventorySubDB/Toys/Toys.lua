--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.InventorySubDB.Toys (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.SharedPackages.Sift)
return require(v1.ClientDB.Inventory.EntryHelper).toys(v2.Dictionary.map({
    ["butterfly_2025_black_pogo"] = "rbxassetid://90822031467267",
    ["butterfly_2025_brown_pogo"] = "rbxassetid://95574266679551",
    ["butterfly_2025_red_pogo"] = "rbxassetid://105418175872460",
    ["butterfly_2025_orange_pogo"] = "rbxassetid://80885368099814",
    ["butterfly_2025_yellow_pogo"] = "rbxassetid://125014299811625",
    ["butterfly_2025_green_pogo"] = "rbxassetid://126621541192703",
    ["butterfly_2025_blue_pogo"] = "rbxassetid://125751336095458",
    ["butterfly_2025_violet_pogo"] = "rbxassetid://129017845255939",
    ["butterfly_2025_light_blue_pogo"] = "rbxassetid://128099558358174",
    ["butterfly_2025_white_pogo"] = "rbxassetid://124915139417139",
    ["butterfly_2025_pink_pogo"] = "rbxassetid://82883038213199"
}, function(p3, p4)
    local v7 = p4:gmatch("butterfly_2025_(.*)_pogo")():gsub("_", " "):gsub("(%l)([%l]*)", function(p5, p6)
        return ("%*%*"):format(p5:upper(), p6)
    end)
    local v8 = {
        ["name"] = ("%* Pogostick"):format(v7),
        ["image"] = p3,
        ["rarity"] = "common",
        ["cost"] = 100,
        ["anims"] = {
            ["hold"] = "PogoMove"
        },
        ["model_handle"] = ("Butterfly2025%*Pogo"):format((v7:gsub(" ", ""))),
        ["tool"] = "PogoTool"
    }
    return v8, p4
end))