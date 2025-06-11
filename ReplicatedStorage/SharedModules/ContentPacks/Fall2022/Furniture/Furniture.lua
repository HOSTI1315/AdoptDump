--// ReplicatedStorage.SharedModules.ContentPacks.Fall2022.Furniture (ModuleScript)

local v1 = {
    ["fall_2022_badger"] = {
        ["name"] = "Badger",
        ["model_name"] = "Fall2022Badger"
    },
    ["fall_2022_shop_badger"] = {
        ["name"] = "Fall2022ShopBadger",
        ["model_name"] = "Fall2022ShopBadger"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)