--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("NPCHelper")
v1("package:Promise")
v1("LiveOpsTime")
local v2 = {
    ["ice_dimension_2025_placeable_snowperson"] = {
        ["name"] = "Placeable Snowperson",
        ["model_name"] = "IceDimension2025PlaceableSnowperson"
    }
}
return v1("EntryHelper").furniture(v2)