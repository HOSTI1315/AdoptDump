--// ReplicatedStorage.SharedModules.ContentPacks.IceCreamRefresh2022.Furniture (ModuleScript)

local v1 = {
    ["ice_cream_refresh_2022_king_penguin"] = {
        ["name"] = "King Penguin",
        ["model_name"] = "IceCreamRefresh2022KingPenguin"
    },
    ["ice_cream_refresh_2022_golden_king_penguin"] = {
        ["name"] = "Golden King Penguin",
        ["model_name"] = "IceCreamRefresh2022GoldenKingPenguin"
    },
    ["ice_cream_refresh_2022_diamond_king_penguin"] = {
        ["name"] = "Diamond King Penguin",
        ["model_name"] = "IceCreamRefresh2022DiamondKingPenguin"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)