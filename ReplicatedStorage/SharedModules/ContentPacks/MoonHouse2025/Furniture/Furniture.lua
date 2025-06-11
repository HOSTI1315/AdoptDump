--// ReplicatedStorage.SharedModules.ContentPacks.MoonHouse2025.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("RunService")
local v5 = v1("EntryHelper")
local v_u_6 = 0
local v_u_7 = nil
local v_u_8 = 0
local v_u_9 = nil
local function v27()
    return {
        ["render"] = function()
            v_u_6 = v_u_6 + 1
            if v_u_6 > 0 and v_u_7 == nil then
                local v_u_10 = {}
                v_u_7 = v_u_4.PreSimulation:Connect(function(p11)
                    local v12 = v_u_3.LocalPlayer.Character
                    if v12 == nil then
                        return
                    else
                        local v13 = v12:FindFirstChild("Humanoid")
                        if v13 == nil then
                            return
                        else
                            local v14 = v13.RootPart
                            if v14 == nil then
                                return
                            else
                                local v15 = v14:FindFirstChild("VectorForce")
                                local v16 = workspace.Gravity
                                local v17
                                if math.floor(v16) == 196 then
                                    v17 = v15 == nil and true or v15.Force == Vector3.new(0, 0, 0)
                                else
                                    v17 = false
                                end
                                local v18 = v17 and 130 or 75
                                local v19 = v_u_2:GetTagged("MoonHouse2025Geyser")
                                if next(v19) ~= nil then
                                    local v20 = OverlapParams.new()
                                    v20.FilterType = Enum.RaycastFilterType.Include
                                    v20.MaxParts = 4
                                    v20.FilterDescendantsInstances = v19
                                    for v21, v22 in v_u_10 do
                                        if v22 >= 0.5 then
                                            v_u_10[v21] = nil
                                        else
                                            local v23 = v_u_10
                                            v23[v21] = v23[v21] + p11
                                        end
                                    end
                                    local v24 = v13.HipHeight + v14.Size.Y / 2 + 1
                                    local v25 = Vector3.new(0, 0, 0)
                                    for _, v26 in workspace:GetPartBoundsInRadius(v14.Position, v24, v20) do
                                        if v_u_10[v26] == nil then
                                            v_u_10[v26] = 0
                                            v25 = v25 + v26.CFrame.UpVector * v18
                                        end
                                    end
                                    v14:ApplyImpulse(v14.AssemblyMass * v25)
                                end
                            end
                        end
                    end
                end)
            end
        end,
        ["unrender"] = function()
            v_u_6 = v_u_6 - 1
            if v_u_6 <= 0 and v_u_7 ~= nil then
                v_u_7:Disconnect()
                v_u_7 = nil
            end
        end
    }
end
local function v30()
    return {
        ["render"] = function()
            v_u_8 = v_u_8 + 1
            if v_u_8 > 0 and v_u_9 == nil then
                v_u_9 = v_u_4.PreSimulation:Connect(function(p28)
                    for _, v29 in v_u_2:GetTagged("MoonHouse2025Asteroid") do
                        v29:PivotTo(v29.CFrame * CFrame.Angles(0.3 * p28, 0.3 * p28, 0.3 * p28))
                    end
                end)
            end
        end,
        ["unrender"] = function()
            v_u_8 = v_u_8 - 1
            if v_u_8 <= 0 and v_u_9 ~= nil then
                v_u_9:Disconnect()
                v_u_9 = nil
            end
        end
    }
end
local v31 = v5.furniture
local v32 = {
    ["moon_house_2025_space_asteroid"] = {
        ["name"] = "Asteroid",
        ["cost"] = 18,
        ["model_name"] = "MoonHouse2025SpaceAsteroid",
        ["image_id"] = 116380791321576,
        ["tags"] = { "MoonHouse2025", "Moon2025" },
        ["behavior"] = v30()
    },
    ["moon_house_2025_space_asteroids"] = {
        ["name"] = "Asteroid Cluster",
        ["cost"] = 42,
        ["model_name"] = "MoonHouse2025SpaceAsteroids",
        ["image_id"] = 118945412548304,
        ["tags"] = { "MoonHouse2025", "Moon2025" },
        ["behavior"] = v30()
    },
    ["moon_house_2025_space_bush"] = {
        ["name"] = "Space Bush",
        ["cost"] = 29,
        ["image_id"] = 98832335485642,
        ["model_name"] = "MoonHouse2025PottedSpaceBush",
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_potted_space_bush"] = {
        ["name"] = "Potted Space Bush",
        ["model_name"] = "MoonHouse2025SpaceBush",
        ["image_id"] = 70509501249371,
        ["cost"] = 37,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_crater"] = {
        ["name"] = "Crater",
        ["cost"] = 105,
        ["model_name"] = "MoonHouse2025SpaceCrater",
        ["image_id"] = 83180311942344,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_flower"] = {
        ["name"] = "Space Flower",
        ["cost"] = 12,
        ["model_name"] = "MoonHouse2025SpaceFlower",
        ["image_id"] = 129741653097845,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_geyser"] = {
        ["name"] = "Moon Geyser",
        ["cost"] = 275,
        ["model_name"] = "MoonHouse2025SpaceGeyser",
        ["image_id"] = 104633798638360,
        ["tags"] = { "MoonHouse2025", "Moon2025" },
        ["behavior"] = v27()
    },
    ["moon_house_2025_space_mist"] = {
        ["name"] = "Space Mist",
        ["cost"] = 49,
        ["model_name"] = "MoonHouse2025SpaceMist",
        ["image_id"] = 120112817741924,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_mountain"] = {
        ["name"] = "Moon Mountain",
        ["cost"] = 135,
        ["model_name"] = "MoonHouse2025SpaceMountain",
        ["image_id"] = 88945508235236,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_planet_1"] = {
        ["name"] = "Planet Earth",
        ["cost"] = 300,
        ["model_name"] = "MoonHouse2025SpacePlanet1",
        ["image_id"] = 96129957144819,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_planet_2"] = {
        ["name"] = "Planet",
        ["cost"] = 300,
        ["model_name"] = "MoonHouse2025SpacePlanet2",
        ["image_id"] = 125984914255743,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_planet_ring"] = {
        ["name"] = "Planet Ring",
        ["cost"] = 150,
        ["model_name"] = "MoonHouse2025SpacePlanetRing",
        ["image_id"] = 131831140364891,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_stars"] = {
        ["name"] = "Space Stars",
        ["cost"] = 425,
        ["model_name"] = "MoonHouse2025SpaceStars",
        ["image_id"] = 111335545610164,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_space_tree"] = {
        ["name"] = "Space Tree",
        ["cost"] = 55,
        ["model_name"] = "MoonHouse2025SpaceTree1",
        ["image_id"] = 76468548872694,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    },
    ["moon_house_2025_spaceship"] = {
        ["name"] = "Spaceship",
        ["cost"] = 500,
        ["model_name"] = "MoonHouse2025Spaceship",
        ["image_id"] = 74101192301371,
        ["tags"] = { "MoonHouse2025", "Moon2025" }
    }
}
return v31(v32)