--// ReplicatedStorage.SharedModules.SharedDB.AltCurrencyDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("package:t")
local v2 = v1.strictInterface
local v3 = {
    ["human_readable"] = v1.string,
    ["interaction_format"] = v1.string,
    ["buy_icon"] = v1.string,
    ["shop_image"] = v1.string,
    ["shop_text"] = v1.string,
    ["shop_gradient_color"] = v1.Color3,
    ["minigame_rewards_image"] = v1.strictInterface({
        ["phone"] = v1.string,
        ["desktop"] = v1.string
    }),
    ["indicator_backing"] = v1.string,
    ["indicator_color"] = v1.Color3,
    ["purchase_app_icon"] = v1.string,
    ["developer_products"] = v1.array(v1.strictInterface({
        ["reward_amount"] = v1.integer,
        ["cost"] = v1.integer,
        ["product_id"] = v1.integer,
        ["image_id"] = v1.optional(v1.integer)
    }))
}
local v4 = v2(v3)
local v5 = {}
local v6 = {
    ["human_readable"] = "Beach Balls",
    ["interaction_format"] = "%d \240\159\143\144",
    ["buy_icon"] = "rbxassetid://13682622092",
    ["shop_image"] = "rbxassetid://13673396202",
    ["shop_text"] = "BUY BEACH BALLS",
    ["shop_gradient_color"] = Color3.fromHex("7146C4"),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://13602641492",
        ["desktop"] = "rbxassetid://13602642151"
    },
    ["indicator_backing"] = "rbxassetid://13682467766",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://13690200024",
    ["developer_products"] = {
        {
            ["reward_amount"] = 200,
            ["cost"] = 7,
            ["product_id"] = 1546861034,
            ["image_id"] = 13682622092
        },
        {
            ["reward_amount"] = 800,
            ["cost"] = 28,
            ["product_id"] = 1546861115,
            ["image_id"] = 13682628376
        },
        {
            ["reward_amount"] = 3000,
            ["cost"] = 105,
            ["product_id"] = 1546861161,
            ["image_id"] = 13682640479
        },
        {
            ["reward_amount"] = 7500,
            ["cost"] = 210,
            ["product_id"] = 1546861210,
            ["image_id"] = 13682646227
        },
        {
            ["reward_amount"] = 16000,
            ["cost"] = 420,
            ["product_id"] = 1546861238,
            ["image_id"] = 13682650293
        },
        {
            ["reward_amount"] = 50000,
            ["cost"] = 1225,
            ["product_id"] = 1546861283,
            ["image_id"] = 13682654283
        }
    }
}
v5.beachballs = v6
local v7 = {
    ["human_readable"] = "Candy",
    ["interaction_format"] = "%d \240\159\141\172",
    ["buy_icon"] = "rbxassetid://14845052425",
    ["shop_image"] = "rbxassetid://5865714516",
    ["shop_text"] = "BUY CANDY",
    ["shop_gradient_color"] = Color3.fromHex("7146C4"),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://5852117599",
        ["desktop"] = "rbxassetid://5852117837"
    },
    ["indicator_backing"] = "rbxassetid://5865214349",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://4149469268",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 1319076371,
            ["image_id"] = 5865710943
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 1319076549,
            ["image_id"] = 5865711471
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 1319076654,
            ["image_id"] = 5865711744
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 1319076815,
            ["image_id"] = 5865712063
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 1319077062,
            ["image_id"] = 10979947182
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 1319077176,
            ["image_id"] = 5865713276
        }
    }
}
v5.candy = v7
local v8 = {
    ["human_readable"] = "Eggs",
    ["interaction_format"] = "%d \240\159\165\154",
    ["buy_icon"] = "rbxassetid://16725730324",
    ["shop_image"] = "rbxassetid://12790274692",
    ["shop_text"] = "BUY EGGS",
    ["shop_gradient_color"] = Color3.fromHex("7146C4"),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://12739543504",
        ["desktop"] = "rbxassetid://12739543504"
    },
    ["indicator_backing"] = "rbxassetid://12920177170",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://9281808894",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 1501323377,
            ["image_id"] = 9281667602
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 1501323495,
            ["image_id"] = 9281667704
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 1501323618,
            ["image_id"] = 9281667807
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 1501323686,
            ["image_id"] = 9281667928
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 1501323744,
            ["image_id"] = 9281668036
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 1501323813,
            ["image_id"] = 9281673267
        }
    }
}
v5.eggs = v8
local v9 = {
    ["human_readable"] = "Gingerbread",
    ["interaction_format"] = "%d Gingerbread",
    ["buy_icon"] = "rbxassetid://15431878046",
    ["shop_image"] = "rbxassetid://6048693211",
    ["shop_text"] = "BUY GINGERBREAD",
    ["shop_gradient_color"] = Color3.fromHex("7146C4"),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://6040957938",
        ["desktop"] = "rbxassetid://6040958164"
    },
    ["indicator_backing"] = "rbxassetid://6048692831",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://4506300100",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 1334951327,
            ["image_id"] = 6048722192
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 1334951598,
            ["image_id"] = 6048722443
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 1334951720,
            ["image_id"] = 6048722865
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 1334951940,
            ["image_id"] = 6048723099
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 1334952075,
            ["image_id"] = 6048723369
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 1334952170,
            ["image_id"] = 6048724179
        }
    }
}
v5.gingerbread = v9
local v10 = {
    ["human_readable"] = "Lanterns",
    ["interaction_format"] = "%d Lanterns",
    ["buy_icon"] = "rbxassetid://11779651672",
    ["shop_image"] = "rbxassetid://11865012109",
    ["shop_text"] = "BUY LANTERNS",
    ["shop_gradient_color"] = Color3.fromRGB(255, 0, 0),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://12114155516",
        ["desktop"] = "rbxassetid://12114155309"
    },
    ["indicator_backing"] = "rbxassetid://11815061831",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://11779651576",
    ["developer_products"] = {
        {
            ["reward_amount"] = 75,
            ["cost"] = 30,
            ["product_id"] = 1345955299,
            ["image_id"] = 11779651672
        },
        {
            ["reward_amount"] = 150,
            ["cost"] = 60,
            ["product_id"] = 1345955450,
            ["image_id"] = 11814876322
        },
        {
            ["reward_amount"] = 300,
            ["cost"] = 120,
            ["product_id"] = 1345955492,
            ["image_id"] = 11814876377
        },
        {
            ["reward_amount"] = 1000,
            ["cost"] = 320,
            ["product_id"] = 1345955540,
            ["image_id"] = 11814876411
        },
        {
            ["reward_amount"] = 3000,
            ["cost"] = 800,
            ["product_id"] = 1345955585,
            ["image_id"] = 11814876462
        },
        {
            ["reward_amount"] = 10000,
            ["cost"] = 2400,
            ["product_id"] = 1345955627,
            ["image_id"] = 11814876514
        }
    }
}
v5.lanterns = v10
local v11 = {
    ["human_readable"] = "Yakgwa",
    ["interaction_format"] = "%d Yakgwa",
    ["buy_icon"] = "rbxassetid://16101765735",
    ["shop_image"] = "rbxassetid://16100061800",
    ["shop_text"] = "BUY YAKGWA",
    ["shop_gradient_color"] = Color3.fromRGB(133, 0, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://16100617840",
        ["desktop"] = "rbxassetid://16100620769"
    },
    ["indicator_backing"] = "rbxassetid://16100107990",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://16100156573",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 1739761890,
            ["image_id"] = 16100131394
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 1739762694,
            ["image_id"] = 16100134840
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 1739762961,
            ["image_id"] = 16100125252
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 1739763092,
            ["image_id"] = 16100121713
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 1739763220,
            ["image_id"] = 16100128265
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 1739763373,
            ["image_id"] = 16100118431
        }
    }
}
v5.yakgwa = v11
local v12 = {
    ["human_readable"] = "Tickets",
    ["interaction_format"] = "%d Tickets",
    ["buy_icon"] = "rbxassetid://17665605243",
    ["shop_image"] = "rbxassetid://17665605144",
    ["shop_text"] = "BUY TICKETS",
    ["shop_gradient_color"] = Color3.fromRGB(133, 0, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://17665614552",
        ["desktop"] = "rbxassetid://17665614626"
    },
    ["indicator_backing"] = "rbxassetid://17665605096",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://17665605191",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 1838189758,
            ["image_id"] = 17665605297
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 1838189860,
            ["image_id"] = 17665605348
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 1838189943,
            ["image_id"] = 17665614488
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 1838190018,
            ["image_id"] = 17665787361
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 1838190089,
            ["image_id"] = 17665787504
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 1838190175,
            ["image_id"] = 17665614852
        }
    }
}
v5.tickets = v12
local v13 = {
    ["human_readable"] = "Galactic Shards",
    ["interaction_format"] = "%d Galactic Shards",
    ["buy_icon"] = "rbxassetid://18740501948",
    ["shop_image"] = "rbxassetid://18740227722",
    ["shop_text"] = "BUY GALACTIC SHARDS",
    ["shop_gradient_color"] = Color3.fromRGB(133, 0, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://17665614552",
        ["desktop"] = "rbxassetid://17665614626"
    },
    ["indicator_backing"] = "rbxassetid://18740123163",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://18740566804",
    ["developer_products"] = {
        {
            ["reward_amount"] = 5,
            ["cost"] = 40,
            ["product_id"] = 1893668497,
            ["image_id"] = 18740595529
        },
        {
            ["reward_amount"] = 10,
            ["cost"] = 80,
            ["product_id"] = 1893668612,
            ["image_id"] = 18740601922
        },
        {
            ["reward_amount"] = 40,
            ["cost"] = 300,
            ["product_id"] = 1893668750,
            ["image_id"] = 18740605548
        },
        {
            ["reward_amount"] = 80,
            ["cost"] = 600,
            ["product_id"] = 1893668885,
            ["image_id"] = 18740609034
        },
        {
            ["reward_amount"] = 175,
            ["cost"] = 1000,
            ["product_id"] = 1893669097,
            ["image_id"] = 18740612270
        },
        {
            ["reward_amount"] = 700,
            ["cost"] = 3500,
            ["product_id"] = 1893669261,
            ["image_id"] = 18740616463
        }
    }
}
v5.galactic_shards = v13
local v14 = {
    ["human_readable"] = "Cranky Coins",
    ["interaction_format"] = "%d Cranky Coins",
    ["buy_icon"] = "rbxassetid://106476163873922",
    ["shop_image"] = "rbxassetid://110824764263777",
    ["shop_text"] = "BUY CRANKY COINS",
    ["shop_gradient_color"] = Color3.fromRGB(133, 0, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://107069217746117",
        ["desktop"] = "rbxassetid://107069217746117"
    },
    ["indicator_backing"] = "rbxassetid://139125625829259",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://121759618426572",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 1929963784,
            ["image_id"] = 136861311743052
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 1929963957,
            ["image_id"] = 108321300768960
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 1929964064,
            ["image_id"] = 89362570817759
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 1929964214,
            ["image_id"] = 96333725463077
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 1929964332,
            ["image_id"] = 99212723250022
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 1929964444,
            ["image_id"] = 109300147737690
        }
    }
}
v5.cranky_coins = v14
local v15 = {
    ["human_readable"] = "Shooting Stars",
    ["interaction_format"] = "%d Shooting Stars",
    ["buy_icon"] = "rbxassetid://93049075958493",
    ["shop_image"] = "rbxassetid://114986196565950",
    ["shop_text"] = "BUY SHOOTING STARS",
    ["shop_gradient_color"] = Color3.fromRGB(0, 127, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://93049075958493",
        ["desktop"] = "rbxassetid://93049075958493"
    },
    ["indicator_backing"] = "rbxassetid://80184394321521",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://78721193306219",
    ["developer_products"] = {
        {
            ["reward_amount"] = 10,
            ["cost"] = 50,
            ["product_id"] = 2705953386,
            ["image_id"] = 100584668990343
        },
        {
            ["reward_amount"] = 40,
            ["cost"] = 180,
            ["product_id"] = 2705953473,
            ["image_id"] = 124355003414950
        },
        {
            ["reward_amount"] = 75,
            ["cost"] = 300,
            ["product_id"] = 2705953568,
            ["image_id"] = 89178611713363
        },
        {
            ["reward_amount"] = 170,
            ["cost"] = 600,
            ["product_id"] = 2705953649,
            ["image_id"] = 138851957733294
        },
        {
            ["reward_amount"] = 325,
            ["cost"] = 1000,
            ["product_id"] = 2705953709,
            ["image_id"] = 97490098961792
        },
        {
            ["reward_amount"] = 1300,
            ["cost"] = 3500,
            ["product_id"] = 2705953793,
            ["image_id"] = 117231745929252
        }
    }
}
v5.shooting_stars = v15
local v16 = {
    ["human_readable"] = "Hearts",
    ["interaction_format"] = "%d Hearts",
    ["buy_icon"] = "rbxassetid://99811996749893",
    ["shop_image"] = "rbxassetid://122357108544133",
    ["shop_text"] = "BUY CUPID HEARTS",
    ["shop_gradient_color"] = Color3.fromRGB(133, 0, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://107069217746117",
        ["desktop"] = "rbxassetid://107069217746117"
    },
    ["indicator_backing"] = "rbxassetid://86091048492397",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://121759618426572",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 1929963784,
            ["image_id"] = 114658489818837
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 1929963957,
            ["image_id"] = 107733068437187
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 1929964064,
            ["image_id"] = 108127111410577
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 1929964214,
            ["image_id"] = 139231162606674
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 1929964332,
            ["image_id"] = 124474435650914
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 1929964444,
            ["image_id"] = 115779870430843
        }
    }
}
v5.cupid_hearts = v16
local v17 = {
    ["human_readable"] = "Ice Shards",
    ["interaction_format"] = "%d Ice Shards",
    ["buy_icon"] = "rbxassetid://115377323084134",
    ["shop_image"] = "rbxassetid://122357108544133",
    ["shop_text"] = "BUY ICE SHARDS",
    ["shop_gradient_color"] = Color3.fromRGB(133, 0, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://108636438959378",
        ["desktop"] = "rbxassetid://108636438959378"
    },
    ["indicator_backing"] = "rbxassetid://106495507831851",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://121759618426572",
    ["developer_products"] = {}
}
v5.ice_shards = v17
local v18 = {
    ["human_readable"] = "Cherry Blossoms",
    ["interaction_format"] = "%d Cherry Blossoms",
    ["buy_icon"] = "rbxassetid://89351838406825",
    ["shop_image"] = "rbxassetid://117499961489013",
    ["shop_text"] = "BUY CHERRY BLOSSOMS",
    ["shop_gradient_color"] = Color3.fromRGB(133, 0, 212),
    ["minigame_rewards_image"] = {
        ["phone"] = "rbxassetid://77209675250676",
        ["desktop"] = "rbxassetid://77209675250676"
    },
    ["indicator_backing"] = "rbxassetid://85161010184505",
    ["indicator_color"] = Color3.fromRGB(244, 40, 40),
    ["purchase_app_icon"] = "rbxassetid://73214358581272",
    ["developer_products"] = {
        {
            ["reward_amount"] = 300,
            ["cost"] = 7,
            ["product_id"] = 2704722692,
            ["image_id"] = 94763858472956
        },
        {
            ["reward_amount"] = 1750,
            ["cost"] = 40,
            ["product_id"] = 2704722820,
            ["image_id"] = 119393228078404
        },
        {
            ["reward_amount"] = 4400,
            ["cost"] = 100,
            ["product_id"] = 2704722938,
            ["image_id"] = 90416381442552
        },
        {
            ["reward_amount"] = 11500,
            ["cost"] = 250,
            ["product_id"] = 2704723040,
            ["image_id"] = 98092048905271
        },
        {
            ["reward_amount"] = 31250,
            ["cost"] = 625,
            ["product_id"] = 2704723128,
            ["image_id"] = 95907042121218
        },
        {
            ["reward_amount"] = 70000,
            ["cost"] = 1250,
            ["product_id"] = 2704723242,
            ["image_id"] = 101203887164274
        }
    }
}
v5.cherry_blossoms = v18
for _, v19 in v5 do
    assert(v4(v19))
end
return v5