--// ReplicatedStorage.new.modules.ABTest.ABTests.ChooseSpawnAB (ModuleScript)

local v1 = require(script.Parent.Parent).new
local v2 = {
    ["key"] = "choose_spawn",
    ["studio_debug_group"] = "show_dialog",
    ["default_values"] = {
        ["show_dialog"] = false
    }
}
local v3 = {
    ["show_dialog"] = {
        ["show_dialog"] = true
    }
}
v2.groups = v3
return v1(v2)