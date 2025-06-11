--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("AnimationManager")
local v_u_3 = v_u_1("package:Sift")
local v_u_4 = game:GetService("ContentProvider")
local v27 = {
    ["CapuchinBoxTool"] = {
        ["equipped"] = function(p5)
            v_u_1("PetBoxHelper").preload_animations(p5.anims.box_opening)
        end,
        ["client_use"] = function(p6, _, p7)
            local v_u_8 = v_u_1("UIManager")
            local v9 = v_u_1("PetBoxHelper")
            local v_u_10 = v_u_1("SoundPlayer")
            local v_u_11 = v_u_1("RouterClient")
            local v12 = v9.exchange_box_with_animation
            local v17 = {
                ["box_entry"] = p6,
                ["tool_state"] = p7,
                ["rig_model_name"] = p6.model_handle .. "Rig",
                ["finish_at_marker"] = "Finished",
                ["animations"] = p6.anims.box_opening,
                ["box_spawn_offset"] = CFrame.fromEulerAnglesYXZ(0, 3.141592653589793, 0),
                ["dont_play_default_opened_sound"] = true,
                ["marker_reached_callbacks"] = {
                    ["Opened"] = function(p13)
                        p13.PrimaryPart.OpenedParticleAttachment.OpenedParticle:Emit(20)
                        v_u_10.FX:play("MagicExplosion")
                    end
                },
                ["exchange_callback"] = function(p14, p15)
                    v_u_8.apps.JackboxRewardApp:show_rewards(p14)
                    for _, v16 in p14 do
                        if v16.category == "pets" then
                            v_u_11.get("ToolAPI/Equip"):InvokeServer(v16.unique, {
                                ["spawn_cframe"] = p15
                            })
                            return
                        end
                    end
                end
            }
            v12(v17)
        end
    },
    ["WhipGrapplingHookTool"] = {
        ["equipped"] = function(_, p_u_18)
            local v_u_19 = v_u_1("GrapplingHook")
            v_u_4:PreloadAsync((v_u_3.List.map({
                "Capuchin2024WhipGrapplingHookHumanoidUse",
                "Capuchin2024WhipGrapplingHookHumanoidHolding",
                "Capuchin2024WhipGrapplingHookUse",
                "Capuchin2024WhipGrapplingHookIdle",
                "Capuchin2024WhipGrapplingHookHolding"
            }, function(p20)
                return v_u_2.get_track(p20)
            end)))
            local v21 = game.Players.LocalPlayer.Character.Humanoid
            local v22 = p_u_18.tool.ModelHandle.AnimationController
            p_u_18.animation_tracks = {
                ["humanoid_use"] = v21:LoadAnimation((v_u_2.get_track("Capuchin2024WhipGrapplingHookHumanoidUse"))),
                ["humanoid_holding"] = v22:LoadAnimation((v_u_2.get_track("Capuchin2024WhipGrapplingHookHumanoidHolding"))),
                ["whip_use"] = v22:LoadAnimation((v_u_2.get_track("Capuchin2024WhipGrapplingHookUse"))),
                ["whip_idle"] = v22:LoadAnimation((v_u_2.get_track("Capuchin2024WhipGrapplingHookIdle"))),
                ["whip_holding"] = v22:LoadAnimation((v_u_2.get_track("Capuchin2024WhipGrapplingHookHolding")))
            }
            p_u_18.animation_tracks.whip_use:GetMarkerReachedSignal("PauseAnim"):Connect(function()
                p_u_18.animation_tracks.whip_use:Stop()
                p_u_18.animation_tracks.whip_holding:Play(0)
                p_u_18.animation_tracks.whip_holding:AdjustSpeed(0)
                p_u_18.animation_tracks.humanoid_use:Stop()
                p_u_18.animation_tracks.humanoid_holding:Play(0)
                p_u_18.animation_tracks.humanoid_holding:AdjustSpeed(0)
                v_u_19.use(p_u_18)
            end)
            p_u_18.animation_tracks.whip_idle:Play()
            v_u_19.equipped(p_u_18)
            v_u_19.get_cancel_signal(p_u_18):Connect(function()
                p_u_18.animation_tracks.whip_holding:Stop()
                p_u_18.animation_tracks.humanoid_holding:Stop()
            end)
            p_u_18.whip_is_equipped = true
        end,
        ["client_use"] = function(_, _, p23)
            if p23.whip_is_equipped then
                p23.animation_tracks.whip_holding:Stop()
                p23.animation_tracks.humanoid_holding:Stop()
                p23.animation_tracks.humanoid_use:Play()
                p23.animation_tracks.whip_use:Play()
            end
        end,
        ["unequipped"] = function(_, p24)
            local v25 = v_u_1("GrapplingHook")
            for _, v26 in p24.animation_tracks do
                v26:Stop()
                v26:Destroy()
            end
            p24.animation_tracks = {}
            p24.whip_is_equipped = nil
            v25.unequipped(p24)
        end
    }
}
return v27