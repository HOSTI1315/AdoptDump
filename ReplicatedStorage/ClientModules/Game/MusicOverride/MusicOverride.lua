--// ReplicatedStorage.ClientModules.Game.MusicOverride (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = v_u_1("SimpleEvents")
local v_u_4 = game:GetService("Players")
local v_u_5 = {}
return {
    ["register_sound"] = function(p6)
        v_u_2:AddTag(p6, "SoundOverride")
    end,
    ["init"] = function()
        local v_u_7 = v_u_1("Music")
        local v_u_8 = v_u_1("SoundDB")
        v_u_3.foreach_tagged_including_new("SoundOverride", function(p9)
            local v10 = v_u_5
            table.insert(v10, p9)
        end)
        v_u_2:GetInstanceRemovedSignal("SoundOverride"):connect(function(p11)
            for v12, v13 in pairs(v_u_5) do
                if v13 == p11 then
                    table.remove(v_u_5, v12)
                    return
                end
            end
        end)
        local v_u_14 = nil
        spawn(function()
            while true do
                while not workspace.CurrentCamera do

                end
                local v15 = (1 / 0)
                local v16 = nil
                for _, v17 in ipairs(v_u_5) do
                    local v18 = v17:FindFirstAncestorWhichIsA("BasePart")
                    if v18 and v18:IsDescendantOf(workspace) then
                        local v19
                        if v17:GetAttribute("ShouldFollowCharacter") and v_u_4.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            v19 = v_u_4.LocalPlayer.Character.HumanoidRootPart.CFrame.Position
                        else
                            v19 = workspace.CurrentCamera.CFrame.Position
                        end
                        local v20 = (v18.Position - v19).Magnitude
                        if v20 < v17.RollOffMaxDistance and v20 < v15 then
                            v16 = v17
                            v15 = v20
                        end
                    end
                end
                local v21 = nil
                if v16 then
                    local v22 = v16:FindFirstChild("SoundDBEntry")
                    if v22 then
                        v21 = v22.Value
                    end
                end
                if v21 then
                    if v_u_14 ~= v21 then
                        v_u_7.stop(1002, v_u_8[v_u_14])
                    end
                    v_u_7.play(1002, v_u_8[v21])
                    v_u_14 = v21
                else
                    if v_u_14 then
                        v_u_7.stop(1002, v_u_8[v_u_14])
                        v_u_14 = nil
                    end
                    if v16 then
                        v_u_7.play(1001, v_u_8.Silence)
                    else
                        v_u_7.stop(1001, v_u_8.Silence)
                    end
                end
                wait(0.2)
            end
        end)
    end
}