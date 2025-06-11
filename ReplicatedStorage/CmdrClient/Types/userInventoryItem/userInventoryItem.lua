--// ReplicatedStorage.CmdrClient.Types.userInventoryItem (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage.Fsys).load
local v_u_3 = v_u_2("package:Promise")
local v_u_4 = nil
local function v_u_9(p_u_5)
    if v_u_4 and (v_u_4.player_id == p_u_5 and os.clock() < v_u_4.expiry) then
        return v_u_4.promise
    end
    local v_u_6 = nil
    v_u_6 = v_u_3.try(function()
        local v7 = v_u_2("RouterClient").get("AdminAPI/GetCmdrPlayerInventoryItems"):InvokeServer(p_u_5)
        assert(v7, "No items returned")
        return v7
    end):andThen(function(...)
        if v_u_4 and v_u_4.promise == v_u_6 then
            v_u_4.expiry = os.clock() + 10
        end
        return ...
    end, function(p8)
        if v_u_4 and v_u_4.promise == v_u_6 then
            v_u_4 = nil
        end
        error(p8)
    end)
    v_u_4 = {
        ["player_id"] = p_u_5,
        ["promise"] = v_u_6,
        ["expiry"] = os.clock() + 60
    }
    return v_u_6
end
return function(p10)
    p10:GetStore("InstancedArgTypes").userInventoryItem = function(p_u_11)
        return {
            ["DisplayName"] = "userInventoryItem",
            ["Transform"] = function(p12)
                return p12, p12:match("^(%S*)")
            end,
            ["Autocomplete"] = function(p13, _)
                if not v_u_1:IsServer() then
                    if p_u_11 then
                        local v14 = v_u_9(p_u_11):expect()
                        local v15 = {}
                        for _, v16 in ipairs(v14) do
                            if v16:lower():find(p13:lower(), 1, true) then
                                table.insert(v15, v16)
                            end
                        end
                        return v15
                    end
                end
            end,
            ["Parse"] = function(_, p17)
                return p17
            end
        }
    end
end