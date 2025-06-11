--// ReplicatedStorage.CmdrClient.Types.plot (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2
if game:GetService("RunService"):IsClient() then
    v_u_2 = v1("RouterClient").get("HousingAPI/GetPlotsSerialized"):InvokeServer()
else
    v_u_2 = v1("HousingAPI").GetPlotsSerialized()
end
return function(p3)
    table.sort(v_u_2, function(p4, p5)
        if p4.is_premium == p5.is_premium then
            return p4.index < p5.index
        else
            return p4.is_premium and true or false
        end
    end)
    local v6 = {}
    for _, v7 in v_u_2 do
        local v8 = v7.id
        table.insert(v6, v8)
    end
    p3:RegisterType("plot", p3.Cmdr.Util.MakeEnumType("Interior", v6))
end