--// ReplicatedStorage.CmdrClient.Commands.print (ModuleScript)

local v_u_1 = {
    ["data"] = true,
    ["log"] = true
}
local v2 = {
    ["Name"] = "print",
    ["Aliases"] = {},
    ["Description"] = "Prints a debug value",
    ["Group"] = "Debug"
}
local v3 = {}
local function v_u_5(p4)
    return {
        ["Type"] = p4.Cmdr.Util.MakeEnumType("Machine", { "server", "client" }),
        ["Name"] = "Machine",
        ["Description"] = "Server or client"
    }
end
local function v_u_6()
    return {
        ["Type"] = "player",
        ["Name"] = "Player",
        ["Description"] = "Player to view the data of"
    }
end
__set_list(v3, 1, {function(p7)
    return {
        ["Type"] = p7.Cmdr.Util.MakeEnumType("Type", {
            "data",
            "house",
            "outfit",
            "fps",
            "stddevfps",
            "allfps",
            "log",
            "fsyslog",
            "children",
            "hatShopStock"
        }),
        ["Name"] = "Value name",
        ["Description"] = "The name of the value you want to view."
    }
end, function(p8)
    if v_u_1[p8.Arguments[1]:GetValue()] then
        return v_u_5(p8)
    end
end, function(p9)
    if v_u_1[p9.Arguments[1]:GetValue()] then
        return v_u_6(p9)
    end
end, function(p10)
    if p10.Arguments[1]:GetValue() == "data" then
        return {
            ["Type"] = "string",
            ["Name"] = "key",
            ["Description"] = "Key to print"
        }
    end
end})
v2.Args = v3
return v2