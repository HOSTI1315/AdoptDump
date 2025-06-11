--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("package:Promise")
local v_u_3 = v_u_1("Maid")
local v14 = {
    ["ParagliderTool"] = {
        ["equipped"] = function(p4, p_u_5)
            local v6 = v_u_1("BlossomParagliderClient")
            local v7 = v_u_1("RenderUpdateScheduler")
            local v_u_8 = v_u_1("ObbyM")
            p_u_5.cleanup = v_u_3.new()
            p_u_5.paraglider_client = v6.new({
                ["paraglider_model_id"] = p4.model_handle,
                ["is_toy"] = true,
                ["rely_on_humanoid_states"] = true,
                ["whitelist_non_cancollide_objects"] = true,
                ["exclude_takeoff_checks"] = true,
                ["exclude_skid_forces"] = true
            })
            p_u_5.update_scheduler = v7.new()
            p_u_5.update_scheduler:register_in_scheduler("ParagliderTool", {
                ["interval"] = 0,
                ["on_update"] = function(p9)
                    if v_u_8.is_in_obby() then
                        p_u_5.paraglider_client:stop_flight(true)
                    end
                    p_u_5.paraglider_client:update(p9)
                end
            })
            p_u_5.cleanup:GiveTask(p_u_5.paraglider_client.flight_started:connect(function()
                if p_u_5.track then
                    p_u_5.track:Stop()
                    p_u_5.paraglider_client.flight_cleanup:GiveTask(function()
                        p_u_5.track:Play()
                    end)
                end
            end))
            p_u_5.update_scheduler:start_update_scheduler()
            p_u_5.cleanup:GiveTask(p_u_5.paraglider_client)
        end,
        ["client_use"] = function(_, _, p10, _, _, p11, p12)
            if not v_u_1("ObbyM").is_in_obby() then
                return v_u_2.any({ p10.paraglider_client:updraft_push(2, 1.5), v_u_2.fromEvent(p12), v_u_2.fromEvent(p11) }):andThenReturn(false):expect()
            end
        end,
        ["unequipped"] = function(_, p_u_13)
            if p_u_13.track then
                task.defer(function()
                    p_u_13.track:Stop()
                end)
            end
            p_u_13.cleanup:DoCleaning()
            p_u_13.update_scheduler:cleanup()
        end
    }
}
return v14