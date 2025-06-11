--// ReplicatedStorage.CmdrClient.Types.location (ModuleScript)

local v1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v_u_2("LiveOpsMapSwap")
local v_u_4 = v_u_2("package:Sift")
local v_u_5
if v1:IsClient() then
    v_u_5 = v_u_2("RouterClient").get("LocationAPI/GetLocations"):InvokeServer()
else
    v_u_5 = v_u_2("LocationAPI").GetLocations()
end
return function(p_u_6)
    local v_u_11 = v_u_4.List.map(v_u_5, function(p_u_7)
        local v10 = {
            ["Go"] = function(p8, p9)
                v_u_2("ServerRouter").get("LocationAPI/TeleToLocation"):FireClient(p8, p_u_7.Area, "MainDoor", {
                    ["spawn_cframe"] = p_u_7.CFrame,
                    ["house_owner"] = p9
                })
            end
        }
        return v_u_4.Dictionary.merge(p_u_7, v10)
    end)
    p_u_6:RegisterType("location", p_u_6.Cmdr.Util.MakeEnumType("Location", v_u_11))
    p_u_6:GetStore("InstancedArgTypes").availableLocations = function()
        local v_u_12 = v_u_3.get_current_map_type()
        local v14 = v_u_4.List.filter(v_u_11, function(p13)
            return not (v_u_3.is_a_swappable_interior_name(p13.Area) and p13.LiveOpsMapType) and true or p13.LiveOpsMapType == v_u_12
        end)
        return p_u_6.Cmdr.Util.MakeEnumType("Location", v14)
    end
end