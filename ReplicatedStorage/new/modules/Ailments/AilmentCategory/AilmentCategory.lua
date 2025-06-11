--// ReplicatedStorage.new.modules.Ailments.AilmentCategory (ModuleScript)

local v1 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v3 = {
    ["DEFAULT"] = {
        ["colors"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("00D6FF")), ColorSequenceKeypoint.new(1, Color3.fromHex("009DFF")) })
    },
    ["GOLDEN"] = {
        ["colors"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("FFC127")), ColorSequenceKeypoint.new(1, Color3.fromHex("F9810E")) })
    },
    ["SPECIAL"] = {
        ["colors"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("FF19FB")), ColorSequenceKeypoint.new(1, Color3.fromHex("9D00FF")) })
    },
    ["THEME"] = {
        ["colors"] = function()
            local v2 = require(script.Parent.Parent.LegacyLoad)("ColorThemeManager")
            return ColorSequence.new({ ColorSequenceKeypoint.new(0, v2.lookup("medium_light")), ColorSequenceKeypoint.new(1, v2.lookup("saturated")) })
        end
    }
}
return v1.Dictionary.freezeDeep(v3)