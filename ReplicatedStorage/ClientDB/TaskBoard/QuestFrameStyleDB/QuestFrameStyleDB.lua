--// ReplicatedStorage.ClientDB.TaskBoard.QuestFrameStyleDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("ContentPackHelper")
local v3 = v1("package:t")
local v4 = v3.strictInterface
local v5 = {
    ["background_image"] = v3.string,
    ["background_color"] = v3.optional(v3.Color3),
    ["squiggle_image"] = v3.string,
    ["squiggle_color"] = v3.optional(v3.Color3),
    ["title_stroke_color"] = v3.optional(v3.Color3),
    ["push_pin"] = v3.interface({
        ["image"] = v3.string,
        ["size"] = v3.UDim2
    })
}
local v6 = v4(v5)
local v7 = {}
local v8 = {
    ["background_color"] = Color3.fromRGB(255, 255, 255),
    ["squiggle_image"] = "rbxassetid://7683874113",
    ["squiggle_color"] = Color3.fromRGB(255, 93, 211),
    ["push_pin"] = {
        ["image"] = "rbxassetid://7720119159",
        ["size"] = UDim2.new(0, 41, 0, 40)
    }
}
v7.daily_misc = v8
local v9 = {
    ["squiggle_image"] = "rbxassetid://8508274090",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509140094",
        ["size"] = UDim2.new(0, 32, 0, 40)
    }
}
v7.daily_building = v9
local v10 = {
    ["background_color"] = Color3.fromRGB(212, 241, 246),
    ["squiggle_image"] = "rbxassetid://8508274492",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509140269",
        ["size"] = UDim2.new(0, 41, 0, 39)
    }
}
v7.daily_egg = v10
local v11 = {
    ["squiggle_image"] = "rbxassetid://8508274212",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509140389",
        ["size"] = UDim2.new(0, 45, 0, 39)
    }
}
v7.daily_fashion = v11
local v12 = {
    ["squiggle_image"] = "rbxassetid://8508274352",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509140491",
        ["size"] = UDim2.new(0, 33, 0, 39)
    }
}
v7.daily_journal = v12
local v13 = {
    ["squiggle_image"] = "rbxassetid://8508274602",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509140593",
        ["size"] = UDim2.new(0, 41, 0, 41)
    }
}
v7.daily_party = v13
local v14 = {
    ["background_color"] = Color3.fromRGB(255, 207, 215),
    ["squiggle_image"] = "rbxassetid://8508274731",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509140762",
        ["size"] = UDim2.new(0, 44, 0, 41)
    }
}
v7.daily_pets = v14
local v15 = {
    ["background_color"] = Color3.fromRGB(204, 237, 190),
    ["squiggle_image"] = "rbxassetid://8508274838",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509141028",
        ["size"] = UDim2.new(0, 43, 0, 44)
    }
}
v7.daily_potion = v15
local v16 = {
    ["background_color"] = Color3.fromRGB(255, 226, 207),
    ["squiggle_image"] = "rbxassetid://8508274911",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509141211",
        ["size"] = UDim2.new(0, 40, 0, 41)
    }
}
v7.daily_time = v16
local v17 = {
    ["background_color"] = Color3.fromRGB(212, 214, 255),
    ["squiggle_image"] = "rbxassetid://8508275024",
    ["push_pin"] = {
        ["image"] = "rbxassetid://8509139969",
        ["size"] = UDim2.new(0, 44, 0, 40)
    }
}
v7.daily_trading = v17
local v18 = {
    ["background_color"] = Color3.fromRGB(255, 226, 199),
    ["squiggle_image"] = "rbxassetid://8145373871",
    ["squiggle_color"] = Color3.fromRGB(255, 103, 43),
    ["push_pin"] = {
        ["image"] = "rbxassetid://8145373767",
        ["size"] = UDim2.new(0, 37, 0, 46)
    }
}
v7.daily_hard = v18
local v19 = {
    ["background_color"] = Color3.fromRGB(209, 242, 255),
    ["squiggle_image"] = "rbxassetid://9831487930",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://9861915985",
        ["size"] = UDim2.new(0, 45, 0, 46)
    }
}
v7.pride = v19
local v20 = {
    ["background_color"] = Color3.fromRGB(244, 204, 215),
    ["squiggle_image"] = "rbxassetid://10640094848",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://10640094177",
        ["size"] = UDim2.new(0, 45, 0, 46)
    }
}
v7.japan = v20
local v21 = {
    ["background_color"] = Color3.fromRGB(250, 185, 205),
    ["squiggle_image"] = "rbxassetid://10383949668",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://10383947790",
        ["size"] = UDim2.new(0, 50, 0, 45)
    }
}
v7.birthday = v21
local v22 = {
    ["background_color"] = Color3.fromRGB(200, 206, 255),
    ["squiggle_image"] = "rbxassetid://11113060661",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://11113060753",
        ["size"] = UDim2.new(0, 47, 0, 41)
    }
}
v7.halloween = v22
local v23 = {
    ["background_color"] = Color3.fromRGB(255, 188, 188),
    ["squiggle_image"] = "rbxassetid://11834497854",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://11834515240",
        ["size"] = UDim2.new(0, 47, 0, 41)
    }
}
v7.lunar_new_year = v23
local v24 = {
    ["background_color"] = Color3.fromRGB(162, 244, 214),
    ["squiggle_image"] = "rbxassetid://12576631139",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://12576312879",
        ["size"] = UDim2.new(0, 47, 0, 41)
    }
}
v7.seasia_2023 = v24
local v25 = {
    ["background_color"] = Color3.fromHex("CBE2FC"),
    ["squiggle_image"] = "rbxassetid://12585769121",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://12596284408",
        ["size"] = UDim2.new(0, 38, 0, 41)
    }
}
v7.gorilla_fairground = v25
local v26 = {
    ["background_color"] = Color3.fromHex("FFBDCB"),
    ["squiggle_image"] = "rbxassetid://12790232844",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://12790231984",
        ["size"] = UDim2.new(0, 45, 0, 43)
    }
}
v7.springfest_2023 = v26
local v27 = {
    ["background_color"] = Color3.fromHex("FFBDCB"),
    ["squiggle_image"] = "rbxassetid://13660856912",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://13660860268",
        ["size"] = UDim2.new(0, 44, 0, 45)
    }
}
v7.summerfest_2023 = v27
local v28 = {
    ["background_color"] = Color3.fromRGB(255, 255, 255),
    ["squiggle_image"] = "rbxassetid://7683874113",
    ["squiggle_color"] = Color3.fromRGB(255, 93, 211),
    ["push_pin"] = {
        ["image"] = "rbxassetid://7720119159",
        ["size"] = UDim2.new(0, 41, 0, 40)
    }
}
v7.kiwi_2023 = v28
local v29 = {
    ["background_color"] = Color3.fromHex("#C0E6F6"),
    ["squiggle_image"] = "rbxasset://14556725601",
    ["squiggle_color"] = Color3.fromRGB(255, 255, 255),
    ["push_pin"] = {
        ["image"] = "rbxassetid://14556726459",
        ["size"] = UDim2.new(0, 45, 0, 49)
    }
}
v7.lures_2023_daily = v29
v2.merge("QuestFrameStyles", v7)
for v30, v31 in pairs(v7) do
    v31.background_image = v31.background_image or "rbxassetid://8145373961"
    local v32 = v6(v31)
    local v33 = "Frame validation failed for " .. v30
    assert(v32, v33)
end
return v7