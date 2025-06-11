--// ReplicatedStorage.CmdrClient.Commands.debugpetsstresstest (ModuleScript)

local v_u_1 = game:GetService("Players")
local v30 = {
    ["Name"] = "debugPetsStressTest",
    ["Description"] = "Spawns pets to stress test pet performance. (pets are only spawned locally)",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "The amount to spawn",
            ["Default"] = 10
        },
        function(p2)
            return {
                ["Type"] = p2.Cmdr.Util.MakeListableType(p2.Cmdr.Util.MakeEnumType("Preset", {
                    "client_owned",
                    "not_client_owned",
                    "anchored",
                    "not_anchored"
                })),
                ["Name"] = "Presets",
                ["Description"] = "Settings Preset",
                ["Default"] = { "client_owned", "anchored" }
            }
        end
    },
    ["ClientRun"] = function(_, p3, p4)
        local v5 = require(game.ReplicatedStorage.Fsys).load
        local v6 = v5("DownloadClient")
        local v7 = v5("InventoryDB")
        local v8 = v5("PetEntityManager")
        local v9 = v5("PetEntityHelper")
        local v10 = v5("PetPerformanceName")
        local v11 = v5("PetMovementTarget")
        local v12 = v7.pets.dog
        local v13 = v6.promise_download_copy("Pets", v12.kind):expect()
        local v14 = 0
        local v15 = 1
        local v16 = 0
        for _ = 1, p3 do
            local v17 = CFrame.Angles(0, v14 * 3.141592653589793 / 2, 0)
            local v18 = CFrame.new
            local v19 = v15 / 2
            local v20 = -v15 / 2 + v16
            local v21 = v17 * v18(Vector3.new(v19, 0, v20) * 4)
            local v22 = CFrame.new(v21.Position)
            v16 = v16 + 1
            if v16 == v15 then
                v16 = 0
                v14 = v14 + 1
                if v14 == 4 then
                    v15 = v15 + 2
                    v14 = 0
                end
            end
            local v23 = v13:Clone()
            v23:SetPrimaryPartCFrame(v_u_1.LocalPlayer.Character.PrimaryPart.CFrame * v22)
            v23.Parent = workspace
            local v24 = v8.create_pet_entity(v23, v12)
            if table.find(p4, "not_client_owned") then
                v24.debug_override_client_has_control = false
            end
            if not table.find(p4, "not_anchored") then
                local v25 = v9.stage_performance
                local v26 = {
                    ["name"] = v10.TargetProvider
                }
                local v27 = {
                    ["movement_target"] = v11.new({
                        ["target"] = v23.PrimaryPart.CFrame
                    }),
                    ["rotation_target"] = v11.new({
                        ["target"] = v23.PrimaryPart.CFrame
                    })
                }
                v26.options = v27
                v25(v24, v26)
                local v28 = v9.stage_performance
                local v29 = {
                    ["name"] = v10.AnimationProvider,
                    ["options"] = {
                        ["anim_name"] = v12.anims.idle
                    }
                }
                v28(v24, v29)
            end
        end
    end
}
return v30