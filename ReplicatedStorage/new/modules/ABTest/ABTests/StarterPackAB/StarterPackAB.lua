--// ReplicatedStorage.new.modules.ABTest.ABTests.StarterPackAB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("SharedConstants")
local v2 = require(script.Parent.Parent).new
local v3 = {
    ["key"] = "alt_starter_packs",
    ["default_values"] = {
        ["limited_time"] = true,
        ["show_starter_pack"] = true,
        ["asset_kind"] = "Default",
        ["product_key"] = v1.ftue_starter_pack.product_key
    }
}
local v4 = {
    ["no_starter_pack"] = {
        ["show_starter_pack"] = false
    },
    ["royal_palace_spaniel"] = {
        ["asset_kind"] = "RoyalSpaniel",
        ["product_key"] = "tutorial_2025_royal_palace_spaniel"
    },
    ["pets_certificate"] = {
        ["asset_kind"] = "Certificate",
        ["product_key"] = "tutorial_2025_2x_pet_certificate"
    },
    ["winged_horse"] = {
        ["limited_time"] = false,
        ["asset_kind"] = "WingedHorse",
        ["product_key"] = "random_pets_2022_winged_horse"
    }
}
v3.groups = v4
return v2(v3)