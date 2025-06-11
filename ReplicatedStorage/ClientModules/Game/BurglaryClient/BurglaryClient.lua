--// ReplicatedStorage.ClientModules.Game.BurglaryClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("CharWrapperClient")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("Music")
local v_u_5 = v1("SoundDB")
local v_u_6 = game:GetService("Players")
local v_u_15 = {
    ["get_is_in_house"] = function()
        local v7 = v_u_2.get(v_u_6.LocalPlayer.Character)
        if not v7 then
            return false
        end
        local v8 = v7.location
        if v8 then
            v8 = v7.location.destination_id == "housing"
        end
        return v8
    end,
    ["is_criminal"] = function(p9)
        local v10 = v_u_3.get_server(p9, "roleplay_role")
        if v10 then
            v10 = v10.building_id == "criminal_base"
        end
        return v10
    end,
    ["get_is_in_burglary"] = function()
        if v_u_15.get_is_in_house() then
            local v11 = v_u_2.get(v_u_6.LocalPlayer.Character)
            local v12 = {}
            for _, v13 in pairs(v_u_2.get_all_char_wrappers()) do
                if v_u_2.is_in_same_location(v11, v13) and v_u_15.is_criminal(v13.player) then
                    local v14 = v13.player
                    table.insert(v12, v14)
                end
            end
            if #v12 == 1 then
                return v11.location.house_owner ~= v12[1]
            else
                return #v12 > 0
            end
        else
            return false
        end
    end,
    ["init"] = function()
        task.spawn(function()
            while true do
                if v_u_15.get_is_in_burglary() then
                    v_u_4.play(100, v_u_5.BurglarMusic)
                else
                    v_u_4.stop(100, v_u_5.BurglarMusic)
                end
                task.wait(2.5)
            end
        end)
    end
}
return v_u_15