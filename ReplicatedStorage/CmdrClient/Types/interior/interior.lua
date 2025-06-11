--// ReplicatedStorage.CmdrClient.Types.interior (ModuleScript)

local v1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4, v_u_5
if v1:IsClient() then
    local v6 = v_u_2("RouterClient")
    v_u_4 = v6.get("LocationAPI/GetInteriors"):InvokeServer()
    v_u_5 = v6.get("GuideArrowAPI/GetGraph"):InvokeServer()
else
    local v7 = v_u_2("LocationAPI")
    local v8 = v_u_2("DoorLinker")
    v_u_4 = v7.GetInteriors()
    v_u_5 = v8.get_connected_graph()
end
local v_u_9 = {
    ["MainMap"] = 0,
    ["Obbies"] = 100,
    ["Garden2024ChaseMap1"] = 201,
    ["Garden2024ChaseMap2"] = 202,
    ["Garden2024ChaseMap3"] = 203,
    ["Garden2024ChaseMap4"] = 204,
    ["Garden2024ChaseMap5"] = 205,
    ["Garden2024ChaseMap6"] = 206,
    ["Garden2024ChaseMap7"] = 207,
    ["Garden2024ChaseMap8"] = 208
}
(function()
    local v10 = { "MainMap", "Obbies" }
    while #v10 ~= 0 do
        local v11 = table.remove(v10, 1)
        local v12 = v_u_9[v11]
        for _, v13 in v_u_5[v11] do
            if not v_u_9[v13] then
                v_u_9[v13] = v12 + 1
                table.insert(v10, v13)
            end
        end
    end
end)()
return function(p14)
    local v_u_15 = {}
    for _, v16 in v_u_2("HouseDB") do
        v_u_15[v16.model_name] = true
    end
    local v19 = v_u_3.Array.filter(v_u_4, function(p17)
        local v18
        if v_u_9[p17] == nil then
            v18 = false
        else
            v18 = v_u_15[p17] == nil
        end
        return v18
    end)
    table.sort(v19, function(p20, p21)
        return (v_u_9[p20] or (1 / 0)) < (v_u_9[p21] or (1 / 0))
    end)
    table.freeze(v19)
    p14:RegisterType("interior", p14.Cmdr.Util.MakeEnumType("Interior", v19))
    p14:GetStore("StaticData").interiors = v19
end