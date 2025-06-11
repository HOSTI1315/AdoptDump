--// ReplicatedStorage.SharedModules.ContentPacks.AilmentsRefresh2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("EntryHelper")
local v3 = v1("SharedConstants")
local v_u_4 = v1("package:Sift")
local v_u_5 = game:GetService("CollectionService")
local v6 = {}
local v12 = {
    ["name"] = "Fire Hydrant",
    ["model_name"] = "AilmentsRefresh2024FireHydrant",
    ["behavior"] = {
        ["ailment_to_boost"] = { "toilet", v3.full_toilet_duration },
        ["init"] = function(p_u_7)
            local v8 = workspace.StaticMap:FindFirstChild("FireHydrants")
            if not v8 then
                v8 = Instance.new("Folder")
                v8.Name = "FireHydrants"
                v8.Parent = workspace.StaticMap
            end
            if not v_u_4.List.some(v8:GetChildren(), function(p9)
                return p9.CFrame == p_u_7.cframe
            end) then
                local v10 = Instance.new("Part")
                v10.Name = "FireHydrant"
                v10.CFrame = p_u_7.cframe
                v10.CollisionGroup = "no_collisions"
                v10.CanCollide = false
                v10.CanTouch = false
                v10.CanQuery = false
                v10.Anchored = true
                v10.Transparency = 1
                v10.Size = Vector3.new(1, 1, 1)
                v10:AddTag("FireHydrantServer")
                v10.Parent = v8
            end
        end,
        ["render"] = function(_, p11)
            v_u_5:AddTag(p11, "FireHydrant")
        end
    }
}
v6.ailments_refresh_2024_fire_hydrant = v12
v6.ailments_refresh_2024_cheap_food_bowl = {
    ["name"] = "Cheap Food Bowl",
    ["cost"] = 7,
    ["model_name"] = "AilmentsRefresh2024CheapFoodBowl",
    ["image_id"] = 108379148600169,
    ["tags"] = { "AilmentsRefresh2024", "PetNeeds" }
}
v6.ailments_refresh_2024_cheap_water_bowl = {
    ["name"] = "Cheap Water Bowl",
    ["cost"] = 7,
    ["model_name"] = "AilmentsRefresh2024CheapWaterBowl",
    ["image_id"] = 137028088870176,
    ["tags"] = { "AilmentsRefresh2024", "PetNeeds" }
}
v6.ailments_refresh_2024_litter_box = {
    ["name"] = "Litter Box",
    ["cost"] = 5,
    ["model_name"] = "AilmentsRefresh2024LitterBox",
    ["image_id"] = 82343537484019,
    ["tags"] = { "AilmentsRefresh2024", "PetNeeds" }
}
return v2.furniture(v6)