--// ReplicatedStorage.CmdrClient.Commands.abgroupoverride (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("package:AB")
local v_u_3 = v1("package:Sift")
local v_u_4 = v1("CloudValues")
local v_u_5 = v1("LocalizationCommon")
local function v_u_10()
    local v6 = v_u_3.Dictionary.values(v_u_2.getTestNames())
    for v7, _ in v_u_4:getValue("localization_ab", "disabledLanguages") do
        local v8 = v_u_5.normalize_locale_roblox(v7)
        local v9 = "language_" .. v_u_5.locale_as_underscore_lowercase(v8)
        table.insert(v6, v9)
    end
    return v6
end
local function v_u_15(p11)
    if not p11 then
        return {}
    end
    if p11:match("^language_") then
        return { "off", "on" }
    end
    local v12 = {}
    for _, v13 in v_u_2.getTest(p11).groups do
        local v14 = v13.name
        table.insert(v12, v14)
    end
    return v12
end
local v20 = {
    ["Name"] = "abgroupoverride",
    ["Aliases"] = {},
    ["Description"] = "Override an AB test group or view overridden AB test groups.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "Players to affect"
        },
        function(p16)
            return {
                ["Type"] = p16.Cmdr.Util.MakeEnumType("ABTest", (v_u_10())),
                ["Name"] = "AB Test",
                ["Description"] = "The AB test to override.\nLeave empty to view AB overrides for selected players.",
                ["Optional"] = true
            }
        end,
        function(p17)
            local v18
            if p17.Arguments[2] then
                v18 = p17.Arguments[2]:GetValue()
            else
                v18 = nil
            end
            local v19 = v_u_15(v18)
            table.insert(v19, "[clear]")
            return {
                ["Type"] = p17.Cmdr.Util.MakeEnumType("Group Override", v19),
                ["Name"] = "Test Group",
                ["Description"] = "The test group to be assigned.",
                ["Optional"] = true
            }
        end,
        {
            ["Type"] = "boolean",
            ["Name"] = "Save",
            ["Description"] = "Save the override for future sessions",
            ["Optional"] = true
        }
    }
}
return v20