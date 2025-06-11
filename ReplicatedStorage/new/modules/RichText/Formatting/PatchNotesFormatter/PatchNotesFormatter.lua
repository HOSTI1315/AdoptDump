--// ReplicatedStorage.new.modules.RichText.Formatting.PatchNotesFormatter (ModuleScript)

local v_u_1 = require(script.Parent.CreateFormatter)
local v_u_2 = require(script.Parent.Parent.Parent.LegacyLoad)("ColorThemeManager")
return {
    ["new"] = function()
        local v3 = v_u_2.lookup("saturated")
        local v4 = v_u_1
        local v5 = {
            ["heading_1"] = {
                ["font_face"] = Enum.Font.FredokaOne,
                ["font_size"] = 36,
                ["font_color"] = v3,
                ["uppercase"] = true
            },
            ["heading_2"] = {
                ["font_face"] = Enum.Font.FredokaOne,
                ["font_size"] = 36,
                ["font_color"] = v3
            },
            ["heading_3"] = {
                ["font_face"] = Enum.Font.FredokaOne,
                ["font_size"] = 32,
                ["font_color"] = v3
            },
            ["heading_4"] = {
                ["font_face"] = Enum.Font.FredokaOne,
                ["font_size"] = 28,
                ["font_color"] = v3
            },
            ["heading_5"] = {
                ["font_face"] = Enum.Font.FredokaOne,
                ["font_size"] = 24,
                ["font_color"] = v3
            },
            ["heading_6"] = {
                ["font_face"] = Enum.Font.FredokaOne,
                ["font_size"] = 20,
                ["font_color"] = v3
            }
        }
        local v6 = {
            ["font_face"] = Enum.Font.Code,
            ["font_color"] = Color3.new(),
            ["mark"] = {
                ["color"] = Color3.new(0.9, 0.9, 0.9)
            }
        }
        v5.code = v6
        return v4(true, v5)
    end
}