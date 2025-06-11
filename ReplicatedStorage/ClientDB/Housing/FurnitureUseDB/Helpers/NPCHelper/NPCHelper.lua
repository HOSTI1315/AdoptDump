--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.NPCHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("NPCDB")
local v_u_3 = v_u_1("new:HumanoidPerformanceHelper")
local v_u_4 = v_u_1("package:Promise")
local v_u_5 = v_u_1("package:Sift")
local v_u_6 = {
    ["hide_my_character"] = false,
    ["hide_my_pet"] = false,
    ["hide_other_characters"] = false,
    ["hide_other_pets"] = false
}
local v_u_41 = {
    ["NPC"] = function(p_u_7, p8)
        local v_u_9 = p8 or {}
        local v_u_10 = nil
        local v_u_17 = {
            ["take_focus"] = function(p11, p_u_12)
                if v_u_10 then
                    v_u_1("NPCManager").take_focus(v_u_10, v_u_5.Dictionary.merge(v_u_6, p11), function()
                        local v13 = v_u_10:play_animation({
                            ["looped"] = true,
                            ["animation_name"] = v_u_9.talking_to_anim or "NPCWaveIdle",
                            ["priority"] = Enum.AnimationPriority.Action
                        })
                        v_u_4.try(p_u_12, v_u_10):catch(warn):await()
                        v13:cancel()
                    end)
                end
            end,
            ["play_focused_dialog"] = function(p_u_14, p_u_15)
                v_u_17.take_focus({}, function(p16)
                    p16:play_speech({
                        ["dialog"] = p_u_14,
                        ["bubble_options"] = p_u_15
                    }):expect()
                end)
            end
        }
        return {
            ["interaction_tag"] = v_u_9.interaction_tag,
            ["is_critical"] = true,
            ["use_text"] = function(_)
                return "Talk"
            end,
            ["render"] = function(p18, p19)
                local v20 = v_u_1("UIManager")
                local v21 = v_u_1("NPCManager")
                v20.apps.PlayerNameApp:add_npc_id(p19.NPC, p_u_7.name, v_u_9)
                local v22 = p19.NPC
                local v23 = v22:FindFirstChild("HumanoidRootPart") or v22:FindFirstChild("RootPart")
                local v24 = v22:FindFirstChild("CameraOrigin") and v22.CameraOrigin.Position or v23.CFrame * Vector3.new(0, 5, -8.8)
                local v25 = v22:FindFirstChild("CameraTarget") and v22.CameraTarget.Position or v23.CFrame * Vector3.new(0, 3.6, 0)
                v_u_10 = v21.create({
                    ["model"] = v22,
                    ["speech_bubble_part"] = v22.Head,
                    ["speech_focus_positions"] = {
                        ["camera_origin"] = v24,
                        ["camera_target"] = v25
                    }
                })
                p18.npc = v_u_10
                p19.NPC.HumanoidRootPart.Anchored = true
                v_u_3.optimize_deferred(v22)
            end,
            ["post_render"] = function(_, _)
                v_u_10:play_animation({
                    ["looped"] = true,
                    ["animation_name"] = v_u_9.idle_anim or "NPCWave",
                    ["priority"] = Enum.AnimationPriority.Core
                })
            end,
            ["unrender"] = function(p26)
                if v_u_10 then
                    v_u_10:cancel_actions()
                    v_u_10 = nil
                    p26.npc = nil
                end
            end
        }, v_u_17
    end,
    ["NPC_SIMPLE"] = function(p27, p28)
        local v_u_29 = 0
        local v_u_30 = v_u_2[p27]
        local v_u_31 = v_u_5.Dictionary.merge(v_u_30.animations or {}, p28)
        local v32, v_u_33 = v_u_41.NPC(v_u_30, v_u_31)
        function v32.client_use()
            if v_u_30.dialogs then
                v_u_29 = v_u_29 % #v_u_30.dialogs + 1
                v_u_33.play_focused_dialog(v_u_30.dialogs[v_u_29])
                if v_u_31.finished_dialog_callback then
                    v_u_31.finished_dialog_callback()
                end
            end
        end
        return v32
    end,
    ["format_npc_dialogue"] = function(p34)
        local v35 = {}
        for v36, v37 in p34 do
            local v38 = {}
            for v39 = 1, #v37, 2 do
                local v40 = {
                    ["text"] = v37[v39],
                    ["length"] = v37[v39 + 1]
                }
                table.insert(v38, v40)
            end
            v35[v36] = v38
        end
        return v35
    end
}
return v_u_41