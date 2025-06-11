--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.ExplainerSignHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("TableUtil")
local v_u_3 = v1("package:Promise")
local v_u_4 = game:GetService("TweenService")
return {
    ["start"] = function(p5)
        local v_u_6 = p5.ExplainerBoard.BoardPart.ExplainerGUI.Background
        local v_u_7 = 1
        local v_u_8 = {}
        local v_u_9 = {}
        local v_u_10 = { 1.5, 0.25, 1.5 }
        v_u_8["2"] = function(p_u_11)
            local function v14(p12, p13)
                p12.Visible = true
                v_u_4:Create(p12, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.new(0, p13, 0, p13)
                }):Play()
            end
            local function v16(p15)
                v_u_4:Create(p15, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 60, 0, 60),
                    ["Position"] = p_u_11.RetiredEgg.Position
                }):Play()
            end
            v14(p_u_11.BasicEgg, 100)
            task.wait(0.1)
            v14(p_u_11.CrackedEgg, 100)
            task.wait(0.1)
            v14(p_u_11.RoyalEgg, 100)
            task.wait(0.1)
            v14(p_u_11.RetiredEgg, 140)
            task.wait(1)
            v16(p_u_11.RoyalEgg)
            task.wait(0.1)
            v16(p_u_11.CrackedEgg)
            task.wait(0.1)
            v16(p_u_11.BasicEgg)
            task.wait(1)
            local v17 = TweenInfo.new(1, Enum.EasingStyle.Linear)
            local v18 = v_u_4:Create(p_u_11.Message, v17, {
                ["TextTransparency"] = 0
            })
            v18:Play()
            v18.Completed:wait()
        end
        v_u_8["3"] = function(p_u_19)
            local v20 = {
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14
            }
            v_u_2.shuffle(v20)
            local function v25(p_u_21)
                p_u_21.Visible = true
                local v_u_22 = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                local v_u_23 = {
                    ["Size"] = UDim2.new(0, 80, 0, 80)
                }
                local v_u_24 = v_u_4:Create(p_u_21, v_u_22, v_u_23)
                v_u_24:Play()
                task.spawn(function()
                    v_u_24.Completed:wait()
                    v_u_22 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
                    v_u_23 = {
                        ["Size"] = UDim2.new(0, 50, 0, 50),
                        ["Position"] = p_u_19.Egg.Position
                    }
                    v_u_24 = v_u_4:Create(p_u_21, v_u_22, v_u_23)
                    v_u_24:Play()
                end)
            end
            for v26 = 1, 14 do
                local v27 = p_u_19.Pets
                local v28 = v20[v26]
                local v29 = v27[tostring(v28)]:Clone()
                v29.Parent = p_u_19.TweenedPets
                v25(v29)
                task.wait(0.15)
            end
            task.wait(1)
            local v30 = TweenInfo.new(1, Enum.EasingStyle.Linear)
            local v31 = v_u_4:Create(p_u_19.Message, v30, {
                ["TextTransparency"] = 0
            })
            v31:Play()
            v31.Completed:wait()
        end
        v_u_9["2"] = function(p32)
            local v33 = p32.BasicEgg
            local v34 = UDim2.new(0.15, 0, 0.25, 0)
            v33.Size = UDim2.new(0, 1, 0, 1)
            v33.Position = v34
            v33.Visible = false
            local v35 = p32.CrackedEgg
            local v36 = UDim2.new(0.15, 0, 0.75, 0)
            v35.Size = UDim2.new(0, 1, 0, 1)
            v35.Position = v36
            v35.Visible = false
            local v37 = p32.RoyalEgg
            local v38 = UDim2.new(0.35, 0, 0.5, 0)
            v37.Size = UDim2.new(0, 1, 0, 1)
            v37.Position = v38
            v37.Visible = false
            local v39 = p32.RetiredEgg
            local v40 = UDim2.new(0.75, 0, 0.5, 0)
            v39.Size = UDim2.new(0, 1, 0, 1)
            v39.Position = v40
            v39.Visible = false
            p32.Message.TextTransparency = 1
        end
        v_u_9["3"] = function(p41)
            p41.TweenedPets:ClearAllChildren()
            p41.Message.TextTransparency = 1
        end
        local function v_u_45(p42)
            local v43 = v_u_4:Create(p42, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(-1, 0, 0, 0)
            })
            v43:Play()
            v43.Completed:wait()
            p42.Visible = false
            local v44 = v_u_9[p42.Name]
            if v44 then
                v44(p42)
            end
        end
        local function v_u_49(p46)
            p46.Visible = true
            local v47 = v_u_4:Create(p46, TweenInfo.new(v_u_10[v_u_7], Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ["Position"] = UDim2.new(0, 0, 0, 0)
            })
            v47:Play()
            v47.Completed:wait()
            local v48 = v_u_8[p46.Name]
            if v48 then
                v48(p46)
            end
        end
        local function v_u_53()
            local v50 = v_u_7
            v_u_45(v_u_6[tostring(v50)])
            if v_u_7 == 3 then
                v_u_7 = 1
            else
                v_u_7 = v_u_7 + 1
            end
            local v51 = v_u_7
            local v52 = v_u_6[tostring(v51)]
            v52.Position = UDim2.new(1, 0, 0, 0)
            v_u_49(v52)
        end
        return v_u_3.new(function(_, _, p54)
            task.wait(8)
            while not p54() do
                v_u_53()
                for _, v55 in pairs(v_u_6:GetChildren()) do
                    local v56 = v_u_7
                    if v55.Name == tostring(v56) then
                        v55.Visible = true
                    elseif v55.Name ~= "UIPadding" then
                        v55.Visible = false
                    end
                end
                task.wait(4)
            end
        end)
    end
}