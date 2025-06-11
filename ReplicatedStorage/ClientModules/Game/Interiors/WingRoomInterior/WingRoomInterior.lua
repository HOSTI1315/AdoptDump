--// ReplicatedStorage.ClientModules.Game.Interiors.WingRoomInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("PublicLootBoxRewards")
local v_u_3 = v_u_1("TweenPromise")
local v_u_4 = v_u_1("InventoryDB")
local v5 = game:GetService("Players")
local v_u_6 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v5.LocalPlayer)
local v_u_7 = {}
return {
    ["render"] = function(p8, _)
        v_u_1("LootboxRewardsDisplay").render(p8)
        local v9 = Random.new()
        for v10, v11 in p8.Floating:GetChildren() do
            local v12 = v11:GetAttribute("AnimateTime")
            local v13 = v11:GetAttribute("MoveDistance")
            local v14 = v9:NextNumber(v12.Min, v12.Max)
            local v15 = v9:NextNumber(v13.Min, v13.Max)
            local v16 = TweenInfo.new(v14, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)
            local v17 = {}
            local v18 = v11.Position.X
            local v19 = v11.Position.Y + v15
            local v20 = v11.Position.Z
            v17.Position = Vector3.new(v18, v19, v20)
            v_u_7[v10] = v_u_3.new(v11, v16, v17)
        end
        local v21 = v_u_2.request():expect()
        for _, v22 in p8.Signs:GetChildren() do
            local v23 = v_u_4.gifts[v22.Name]
            local v24 = v21[v22.Name]
            local v25 = v_u_6:Translate(workspace, v23.name)
            local v26 = v_u_2.convert_rarity_chances_to_human_readable(v24)
            v22.SignFace.SurfaceGui.Label.AutoLocalize = false
            v22.SignFace.SurfaceGui.Label.Text = v25 .. "\n" .. v26
        end
    end,
    ["cleanup"] = function(p27, p28)
        v_u_1("LootboxRewardsDisplay").cleanup(p27, p28)
        for _, v29 in v_u_7 do
            v29:cancel()
        end
    end
}