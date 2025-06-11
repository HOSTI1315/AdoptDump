--// ReplicatedStorage.ClientDB.InputIconsDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Sift")
local v2 = {
    ["enter"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 50,
        ["x_size"] = 92,
        ["y_size"] = 85
    },
    ["key"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 201,
        ["x_size"] = 76,
        ["y_size"] = 72
    },
    ["mouse"] = {
        ["x_pos"] = 164,
        ["y_pos"] = 0,
        ["x_size"] = 68,
        ["y_size"] = 92
    },
    ["mouse_left"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 144,
        ["x_size"] = 68,
        ["y_size"] = 92
    },
    ["mouse_middle"] = {
        ["x_pos"] = 164,
        ["y_pos"] = 94,
        ["x_size"] = 68,
        ["y_size"] = 92
    },
    ["mouse_right"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 50,
        ["x_size"] = 68,
        ["y_size"] = 92
    },
    ["super_wide"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 0,
        ["x_size"] = 96,
        ["y_size"] = 48
    },
    ["tall"] = {
        ["x_pos"] = 164,
        ["y_pos"] = 188,
        ["x_size"] = 54,
        ["y_size"] = 94
    },
    ["wide"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 137,
        ["x_size"] = 92,
        ["y_size"] = 62
    }
}
local v3 = {
    ["d_pad"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 188,
        ["x_size"] = 92,
        ["y_size"] = 92
    },
    ["d_pad_down"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 282,
        ["x_size"] = 92,
        ["y_size"] = 92
    },
    ["d_pad_left"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 376,
        ["x_size"] = 92,
        ["y_size"] = 92
    },
    ["d_pad_right"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 0,
        ["x_size"] = 92,
        ["y_size"] = 92
    },
    ["d_pad_up"] = {
        ["x_pos"] = 0,
        ["y_pos"] = 94,
        ["x_size"] = 92,
        ["y_size"] = 92
    },
    ["button_start"] = {
        ["x_pos"] = 354,
        ["y_pos"] = 247,
        ["x_size"] = 78,
        ["y_size"] = 77
    },
    ["button_select"] = {
        ["x_pos"] = 354,
        ["y_pos"] = 168,
        ["x_size"] = 78,
        ["y_size"] = 77
    },
    ["button_l3"] = {
        ["x_pos"] = 186,
        ["y_pos"] = 0,
        ["x_size"] = 86,
        ["y_size"] = 89
    },
    ["button_r3"] = {
        ["x_pos"] = 186,
        ["y_pos"] = 91,
        ["x_size"] = 86,
        ["y_size"] = 89
    },
    ["thumbstick1"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 286,
        ["x_size"] = 90,
        ["y_size"] = 89
    },
    ["thumbstick2"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 195,
        ["x_size"] = 90,
        ["y_size"] = 89
    }
}
local v4 = {
    ["button_a"] = {
        ["x_pos"] = 186,
        ["y_pos"] = 182,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_b"] = {
        ["x_pos"] = 270,
        ["y_pos"] = 350,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_x"] = {
        ["x_pos"] = 270,
        ["y_pos"] = 182,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_y"] = {
        ["x_pos"] = 186,
        ["y_pos"] = 266,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_l1"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 65,
        ["x_size"] = 90,
        ["y_size"] = 63
    },
    ["button_l2"] = {
        ["x_pos"] = 430,
        ["y_pos"] = 326,
        ["x_size"] = 74,
        ["y_size"] = 85
    },
    ["button_r1"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 377,
        ["x_size"] = 90,
        ["y_size"] = 63
    },
    ["button_r2"] = {
        ["x_pos"] = 354,
        ["y_pos"] = 326,
        ["x_size"] = 74,
        ["y_size"] = 85
    }
}
local v5 = v1.Dictionary.merge(v4, v3)
local v6 = {
    ["button_a"] = {
        ["x_pos"] = 274,
        ["y_pos"] = 0,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_b"] = {
        ["x_pos"] = 274,
        ["y_pos"] = 84,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_x"] = {
        ["x_pos"] = 186,
        ["y_pos"] = 350,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_y"] = {
        ["x_pos"] = 270,
        ["y_pos"] = 266,
        ["x_size"] = 82,
        ["y_size"] = 82
    },
    ["button_l1"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 130,
        ["x_size"] = 90,
        ["y_size"] = 63
    },
    ["button_l2"] = {
        ["x_pos"] = 358,
        ["y_pos"] = 0,
        ["x_size"] = 74,
        ["y_size"] = 85
    },
    ["button_r1"] = {
        ["x_pos"] = 94,
        ["y_pos"] = 0,
        ["x_size"] = 90,
        ["y_size"] = 63
    },
    ["button_r2"] = {
        ["x_pos"] = 354,
        ["y_pos"] = 413,
        ["x_size"] = 74,
        ["y_size"] = 85
    }
}
local v7 = v1.Dictionary.merge(v6, v3)
local v8 = {
    [Enum.KeyCode.LeftAlt] = "wide",
    [Enum.KeyCode.RightAlt] = "wide",
    [Enum.KeyCode.Backspace] = "wide",
    [Enum.KeyCode.CapsLock] = "wide",
    [Enum.KeyCode.LeftControl] = "wide",
    [Enum.KeyCode.RightControl] = "wide",
    [Enum.KeyCode.Return] = "enter",
    [Enum.KeyCode.KeypadEnter] = "enter",
    [Enum.KeyCode.KeypadPlus] = "tall",
    [Enum.KeyCode.LeftShift] = "super_wide",
    [Enum.KeyCode.RightShift] = "wide",
    [Enum.KeyCode.Space] = "super_wide",
    [Enum.KeyCode.Tab] = "wide"
}
local v9 = {
    ["enter"] = {
        ["x_pos"] = 0.5,
        ["y_pos"] = 0.8352941176470589,
        ["x_size"] = 0.6956521739130435,
        ["y_size"] = 0.4235294117647059,
        ["anchor"] = Vector2.new(0.5, 1)
    },
    ["key"] = {
        ["x_pos"] = 0.5,
        ["y_pos"] = 0.5,
        ["x_size"] = 0.6052631578947368,
        ["y_size"] = 0.6111111111111112,
        ["anchor"] = Vector2.new(0.5, 0.5)
    },
    ["super_wide"] = {
        ["x_pos"] = 0.5,
        ["y_pos"] = 0.5,
        ["x_size"] = 0.7708333333333334,
        ["y_size"] = 0.5416666666666666,
        ["anchor"] = Vector2.new(0.5, 0.5)
    },
    ["tall"] = {
        ["x_pos"] = 0.5,
        ["y_pos"] = 0.5,
        ["x_size"] = 0.5555555555555556,
        ["y_size"] = 0.723404255319149,
        ["anchor"] = Vector2.new(0.5, 0.5)
    },
    ["wide"] = {
        ["x_pos"] = 0.5,
        ["y_pos"] = 0.5,
        ["x_size"] = 0.6956521739130435,
        ["y_size"] = 0.5806451612903226,
        ["anchor"] = Vector2.new(0.5, 0.5)
    }
}
local v10 = {}
local v11 = {
    ["keyboard_mouse"] = v2,
    ["xbox_controller"] = {
        ["dark"] = v5,
        ["light"] = v7
    }
}
v10.sprite_dimensions = v11
local v12 = {
    ["xbox_controller"] = "rbxassetid://6841256751",
    ["keyboard_mouse"] = {
        ["dark"] = "rbxassetid://6841196177",
        ["light"] = "rbxassetid://6844854316"
    }
}
v10.images = v12
v10.key_types = {
    ["by_enum"] = v8,
    ["text_dimensions"] = v9
}
return v10