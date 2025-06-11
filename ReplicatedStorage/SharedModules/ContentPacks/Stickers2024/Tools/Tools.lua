--// ReplicatedStorage.SharedModules.ContentPacks.Stickers2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ToolDBHelper")
local v_u_3 = v_u_1("SoundPlayer")
local function v_u_7(p4)
    local v5 = game.ReplicatedStorage.Resources.Particles.PridePinPoof:Clone()
    local v6 = Instance.new("Attachment")
    v5.Parent = v6
    v6.Position = p4
    v6.Parent = workspace.Terrain
    v5:Emit(10)
    game:GetService("Debris"):AddItem(v6, 10)
end
local v14 = {
    ["StickerPackTool"] = {
        ["client_use"] = function(p8, _, p9)
            local v10 = v_u_1("UIManager")
            local v11 = v_u_1("RouterClient")
            if not v_u_2.confirm_use(p8, {
                ["text"] = ("Are you sure you want to unwrap this %*?"):format(p8.name)
            }) then
                return false
            end
            local v12 = p9.tool
            if v12 then
                v12 = p9.tool:GetPivot().Position
            end
            local v13 = v11.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer(p8.kind, p9.item_data.unique)
            if not v13 then
                return false
            end
            if v12 then
                v_u_3.FX:play("StickerPackSmokePuff")
                v_u_7(v12)
            end
            v10.apps.StickerRewardsApp:show_rewards(p8, v13)
            return true
        end
    }
}
return v14