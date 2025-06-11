--// ReplicatedStorage.SharedModules.ContentPacks.Subscriptions2024.DeveloperProducts (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = {
    ["subscription_2024_2x_pet_certificate"] = {
        ["name"] = "Pet Handler Pro Certificate",
        ["description"] = "Used to equip 2x pets for 30 days!",
        ["cost"] = 250,
        ["product_id"] = 1915069546,
        ["callback"] = v_u_1("DeveloperProductCallbacks").add_item("gifts", "subscription_2024_2x_pet_certificate", true),
        ["should_hide"] = function()
            return not v_u_1("ClientDeveloperProductHelper").should_hide("tutorial_2025_2x_pet_certificate")
        end
    }
}
return v2