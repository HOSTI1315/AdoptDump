--// ReplicatedStorage.ClientModules.Game.Interiors.FallShopInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("PheasantAdoption")
local v_u_3 = v_u_1("LiveOpsMapSwap")
return {
    ["render"] = function(p_u_4, p5)
        local v_u_6 = v_u_1("PublicLootBoxRewards")
        local v_u_7 = v_u_1("InteriorsM")
        p5.kick_player_out = v_u_3.map_type_changed:Connect(function()
            if v_u_3.get_current_map_type() ~= "Fall" then
                v_u_7.enter_smooth("MainMap", "Neighborhood!MainDoor")
            end
        end)
        v_u_2.start(p_u_4, p5)
        v_u_6.request():andThen(function(p8)
            p_u_4.SignBoard.MainFace.SurfaceGui.Odds.Text = v_u_6.convert_to_human_readable(p8.fall_2022_golden_wheat_stalk)
        end)
        local v9 = p_u_4.Interactables.TimerSign.SignFace.SurfaceGui.Timer
        local v10
        if v9 then
            v10 = v_u_1("LiveOpsShopSignHelper").update_promise("Fall", v9)
        else
            v10 = nil
        end
        p5.sign_timer = v10
    end,
    ["cleanup"] = function(p11, p12)
        p12.kick_player_out:Disconnect()
        p12.kick_player_out = nil
        p12.sign_timer:cancel()
        p12.sign_timer = nil
        v_u_2.stop(p11)
    end,
    ["interactions"] = function(p13)
        local v14 = {}
        for _, v15 in pairs(p13.AdoptablePets:GetChildren()) do
            local v16 = v_u_2.add_dialog(v15)
            table.insert(v14, v16)
        end
        return v14
    end
}