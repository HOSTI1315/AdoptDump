--// ReplicatedStorage.new.modules.ABTest.ABTests.SoapAB (ModuleScript)

local v1 = require(script.Parent.Parent).new
local v2 = {
    ["key"] = "soap_item",
    ["studio_debug_group"] = "has_soap_item",
    ["default_values"] = {
        ["give_soap"] = false
    }
}
local v3 = {
    ["has_soap_item"] = {
        ["give_soap"] = true
    }
}
v2.groups = v3
return v1(v2)