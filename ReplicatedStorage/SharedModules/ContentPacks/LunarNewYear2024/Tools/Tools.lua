--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = game:GetService("TweenService")
local v_u_3 = v_u_1("ToolDBHelper")
v_u_1("CloudValues")
local v_u_4 = game:GetService("Players")
local v18 = {
    ["KiteTool"] = {
        ["server_render"] = function(p5, p6)
            local v7 = v_u_1("DataM").get_store(p5.inventory.player):get("team") == "Babies" and 1 or 0
            local v8 = p6.Kiteend.BeamEnd
            v8.CFrame = v8.CFrame + Vector3.new(0, 0, v7)
            local v9 = math.random(20, 40) / 10
            local v10 = TweenInfo.new(v9, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut, -1, true)
            local v11 = p6.Kite.Attachment0
            v_u_2:Create(v11, v10, {
                ["Rotation"] = v11:GetAttribute("Rotation")
            }):Play()
        end
    },
    ["SilkBagTool"] = {
        ["client_use"] = function(p12, _, p13, _, _)
            local v_u_14 = v_u_1("UIManager")
            local v15 = v_u_1("RouterClient")
            if not v_u_3.confirm_use(p12, {
                ["text"] = "Are you sure you want to open this to receive 1000 bucks?"
            }) then
                return false
            end
            local v16 = v15.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer("lunar_2024_silk_bag", p13.item_data.unique)
            if not v16 then
                return false
            end
            local v17 = v16[1]
            v_u_14.apps.HintApp:hint({
                ["text"] = "You received " .. v17.amount .. " Bucks from the bag!",
                ["length"] = 4,
                ["yields"] = false
            })
            task.spawn(function()
                v_u_14.apps.SpecialEffectsApp:sprout_currency(v_u_4.LocalPlayer, "small")
            end)
            return true
        end
    }
}
return v18