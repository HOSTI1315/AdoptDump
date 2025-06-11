--// ReplicatedStorage.CmdrClient.Commands.focuspet (ModuleScript)

return {
    ["Name"] = "focuspet",
    ["Description"] = "Edit a pet\'s focus position.",
    ["Group"] = "Debug",
    ["Args"] = { function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeListableType(p1.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind("pets")),
                ["Name"] = "Kind",
                ["Description"] = "The pet to edit."
            }
        end },
    ["ClientRun"] = function(_, p2)
        local v3 = require(game.ReplicatedStorage.Fsys).load
        local v4 = v3("DownloadClient")
        local v5 = v3("InventoryDB")
        local v_u_6 = v3("PetEntityManager")
        local v7 = v3("UIManager")
        local v8 = v3("package:Promise")
        local v9 = v7.apps.MockFocusPetApp:get_finished_signal()
        for _, v10 in p2 do
            local v11 = v5.pets[v10]
            if not (v11.permanently_delete_all_copies_of_this_item_from_the_game or v11.permanently_delete_all_copies_of_this_item_when_db_entry_is_nil) then
                local v12, v_u_13 = v4.promise_download_copy("Pets", v10):await()
                if v12 then
                    local v14 = game.Players.LocalPlayer.Character
                    local v15 = v14.Humanoid.HipHeight + v14.HumanoidRootPart.Size.Y * 0.5
                    local v16 = v_u_13.Humanoid.HipHeight + v_u_13.HumanoidRootPart.Size.Y * 0.5
                    v_u_13:PivotTo(v14.HumanoidRootPart.CFrame + Vector3.new(0, 1, 0) * (v16 - v15))
                    v_u_13.Parent = workspace
                    local v_u_17 = v_u_6.create_pet_entity(v_u_13, v11)
                    v7.apps.MockFocusPetApp:capture_focus(v_u_17, {
                        ["pet_id"] = v10,
                        ["is_pet"] = true,
                        ["char"] = v_u_13
                    })
                    v8.fromEvent(v9):andThen(function()
                        v_u_6.remove_pet_entity_by_entity(v_u_17)
                        v_u_13:Destroy()
                    end):await()
                else
                    warn(v_u_13)
                end
            end
        end
        return "Done"
    end
}