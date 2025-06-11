--// ReplicatedStorage.ClientModules.Game.Interiors.SkyCastleInterior (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteriorsM")
local v_u_3 = v1("TweenPromise")
local v_u_4 = v1("LootboxRewardsDisplay")
local v_u_5 = {}
local v_u_6 = v1("Maid").new()
return {
    ["render"] = function(p7, _)
        local v8 = Random.new()
        for v9, v10 in p7.Floating:GetChildren() do
            local v11 = v10:GetAttribute("AnimateTime")
            local v12 = v10:GetAttribute("MoveDistance")
            local v13 = v8:NextNumber(v11.Min, v11.Max)
            local v14 = v8:NextNumber(v12.Min, v12.Max)
            local v15 = TweenInfo.new(v13, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)
            local v16 = {}
            local v17 = v10.Position.X
            local v18 = v10.Position.Y + v14
            local v19 = v10.Position.Z
            v16.Position = Vector3.new(v17, v18, v19)
            v_u_5[v9] = v_u_3.new(v10, v15, v16)
        end
        v_u_4.render(p7)
        local v20 = p7.DeathPlane
        local v_u_21 = false
        v_u_6:GiveTask((v20.Touched:Connect(function(p22)
            if p22.Parent:FindFirstChild("HumanoidRootPart") then
                if not v_u_21 then
                    v_u_21 = true
                    v_u_2.enter_smooth("SkyCastle", "WingCaveRespawnDoor", {
                        ["anchor_char_immediately"] = true,
                        ["post_character_anchored_wait"] = true
                    })
                end
            else
                return
            end
        end)))
    end,
    ["cleanup"] = function(_, _)
        v_u_4.cleanup()
        for _, v23 in v_u_5 do
            v23:cancel()
        end
        v_u_6:DoCleaning()
    end
}