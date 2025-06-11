--// ReplicatedStorage.ClientDB.ColorThemeDB (ModuleScript)

local v1 = {}
local v2 = {
    ["pink"] = {
        ["background"] = Color3.fromRGB(255, 229, 248),
        ["background_light"] = Color3.fromRGB(255, 239, 250),
        ["saturated"] = Color3.fromRGB(255, 93, 211),
        ["medium_light"] = Color3.fromRGB(255, 154, 228),
        ["medium_dark"] = Color3.fromRGB(255, 135, 222)
    },
    ["purple"] = {
        ["background"] = Color3.fromRGB(228, 224, 255),
        ["background_light"] = Color3.fromRGB(242, 240, 255),
        ["saturated"] = Color3.fromRGB(143, 74, 255),
        ["medium_light"] = Color3.fromRGB(154, 107, 255),
        ["medium_dark"] = Color3.fromRGB(149, 97, 254)
    },
    ["blue"] = {
        ["background"] = Color3.fromRGB(179, 239, 255),
        ["background_light"] = Color3.fromRGB(229, 249, 255),
        ["saturated"] = Color3.fromRGB(41, 171, 226),
        ["medium_light"] = Color3.fromRGB(74, 199, 243),
        ["medium_dark"] = Color3.fromRGB(64, 190, 237)
    },
    ["red"] = {
        ["background"] = Color3.fromRGB(255, 226, 227),
        ["background_light"] = Color3.fromRGB(255, 245, 245),
        ["saturated"] = Color3.fromRGB(247, 44, 44),
        ["medium_light"] = Color3.fromRGB(254, 82, 82),
        ["medium_dark"] = Color3.fromRGB(252, 71, 71)
    },
    ["green"] = {
        ["background"] = Color3.fromRGB(204, 255, 230),
        ["background_light"] = Color3.fromRGB(235, 255, 245),
        ["saturated"] = Color3.fromRGB(34, 181, 115),
        ["medium_light"] = Color3.fromRGB(57, 210, 136),
        ["medium_dark"] = Color3.fromRGB(50, 201, 130)
    },
    ["yellow"] = {
        ["background"] = Color3.fromRGB(255, 241, 212),
        ["background_light"] = Color3.fromRGB(255, 250, 240),
        ["saturated"] = Color3.fromRGB(255, 169, 67),
        ["medium_light"] = Color3.fromRGB(255, 219, 146),
        ["medium_dark"] = Color3.fromRGB(254, 202, 122)
    },
    ["black"] = {
        ["background"] = Color3.fromRGB(179, 179, 179),
        ["background_light"] = Color3.fromRGB(204, 204, 204),
        ["saturated"] = Color3.fromRGB(51, 51, 51),
        ["medium_light"] = Color3.fromRGB(107, 107, 107),
        ["medium_dark"] = Color3.fromRGB(77, 77, 77)
    }
}
v1.themes = v2
v1.ordered_themes = {
    "pink",
    "blue",
    "purple",
    "green",
    "red",
    "yellow",
    "black"
}
return v1