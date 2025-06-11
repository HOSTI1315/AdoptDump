--// ReplicatedStorage.CmdrClient.Commands.debugaccessorytesting (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("DebugAccessoryTestingDB")
local v_u_3 = v_u_1("package:Sift")
local v_u_4 = game:GetService("RunService")
return {
    ["Name"] = "debugaccessorytesting",
    ["Aliases"] = {},
    ["Description"] = "Enables debug accessory testing. Debug accessory testing cannot be disabled.",
    ["Group"] = "Debug",
    ["Args"] = { function(p5)
            local v6
            if v_u_4:IsClient() then
                v6 = v_u_1("ClientData").get("debug_accessory_testing_enabled")
            else
                v6 = v_u_1("DebugAccessoryTesting").get_enabled()
            end
            return v6 and {
                ["Type"] = p5.Cmdr.Util.MakeEnumType("Action", {
                    "warp",
                    "set_mode",
                    "set_enabled",
                    "set_debug",
                    "animation_speed"
                }),
                ["Name"] = "Action",
                ["Description"] = "Action"
            } or {
                ["Type"] = p5.Cmdr.Util.MakeEnumType("Action", { "set_enabled" }),
                ["Name"] = "Action",
                ["Description"] = "Action"
            }
        end, function(p7)
            local v8 = p7.Arguments[1]:GetValue()
            if v8 ~= "warp" then
                if v8 == "set_mode" then
                    return {
                        ["Type"] = p7.Cmdr.Util.MakeEnumType("Mode", v_u_3.Dictionary.keys(v_u_2)),
                        ["Name"] = "Mode",
                        ["Description"] = "Debug Mode to set it to."
                    }
                end
                if v8 == "set_enabled" then
                    return {
                        ["Type"] = "boolean",
                        ["Name"] = "Enabled",
                        ["Description"] = "Enable or disable debug accessory testing."
                    }
                end
                if v8 == "set_debug" then
                    local v9
                    if v_u_4:IsClient() then
                        v9 = v_u_1("ClientData").get("debug_accessory_testing_mode")
                    else
                        v9 = v_u_1("DebugAccessoryTesting").get_mode()
                    end
                    return {
                        ["Type"] = v_u_2[v9].get_cmdr_debug_option_enum(p7),
                        ["Name"] = "Debug Option",
                        ["Description"] = "Debug Option in current mode to set/activate."
                    }
                end
                if v8 == "animation_speed" then
                    return {
                        ["Type"] = "number",
                        ["Name"] = "Animation Speed",
                        ["Description"] = "Speed of pet animation (default = 1)."
                    }
                end
            end
        end, function(p10)
            local v11
            if v_u_4:IsClient() then
                v11 = v_u_1("ClientData").get("debug_accessory_testing_mode")
            else
                v11 = v_u_1("DebugAccessoryTesting").get_mode()
            end
            if v11 then
                if p10.Arguments[1]:GetValue() == "set_debug" then
                    local v12 = p10.Arguments[2]:GetValue()
                    return v_u_2[v11].get_cmdr_debug_option_arg(p10, v12)
                end
            end
        end }
}