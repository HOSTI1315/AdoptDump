--// ReplicatedStorage.ClientModules.Game.Interiors.VIPInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ChowChowAdoption")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = v_u_1("package:Promise")
local v_u_5 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game:GetService("Players").LocalPlayer)
local function v_u_25(p6, p7)
    local v_u_8 = Random.new()
    local v_u_9 = p6.Disco.DiscoFloor:GetChildren()
    p7.disco_floor = v_u_4.new(function(_, _, p10)
        while not p10() do
            for _, v11 in pairs(v_u_9) do
                local v12 = v_u_3
                local v13 = TweenInfo.new(0.5)
                local v14 = {}
                local v15 = v_u_8:NextNumber(0.3, 0.5)
                local v16 = v_u_8:NextNumber(0.3, 0.5)
                local v17 = v_u_8:NextNumber(0.3, 0.5)
                v14.Color = Color3.new(v15, v16, v17)
                v12:Create(v11, v13, v14):Play()
                if v11:FindFirstChild("PointLight") then
                    local v18 = v_u_3
                    local v19 = v11.PointLight
                    local v20 = TweenInfo.new(0.5)
                    local v21 = {}
                    local v22 = v_u_8:NextNumber(0.5, 1)
                    local v23 = v_u_8:NextNumber(0.5, 1)
                    local v24 = v_u_8:NextNumber(0.5, 1)
                    v21.Color = Color3.new(v22, v23, v24)
                    v18:Create(v19, v20, v21):Play()
                end
            end
            v_u_4.delay(0.5):await()
        end
    end)
end
local function v_u_30(p26)
    local v27 = {}
    for _, v28 in pairs(p26.AdoptablePets:GetChildren()) do
        local v29 = v_u_2.add_dialog
        table.insert(v27, v29(v28))
    end
    return v27
end
return {
    ["interactions"] = function(p31)
        return not v_u_1("ClientData").get_server(game.Players.LocalPlayer, "is_vip") and {} or v_u_30(p31)
    end,
    ["render"] = function(p_u_32, p33)
        local v_u_34 = v_u_1("PublicLootBoxRewards")
        v_u_2.start(p_u_32)
        v_u_34.request():andThen(function(p35)
            local v36 = p_u_32.RaritySign.Sign.SurfaceGui
            local v37 = v_u_5:Translate(workspace, "Tame a Chow-Chow with a Golden Bone!")
            v36.Frame.TextLabel.Text = v37 .. "\n" .. v_u_34.convert_to_human_readable(p35.vip_2022_golden_bone)
        end)
        v_u_25(p_u_32, p33)
    end,
    ["cleanup"] = function(p38, p39)
        p39.disco_floor:cancel()
        p39.disco_floor = nil
        v_u_2.stop(p38)
    end
}