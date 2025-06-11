--// ReplicatedStorage.CmdrClient.Commands.simulateStickerPackOpening (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("package:Sift")
local v_u_4 = nil
local v14 = {
    ["Name"] = "simulate_sticker_pack_opening",
    ["Aliases"] = {},
    ["Description"] = "Simulate opening a sticker pack with the given sticker",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p5)
            if not v_u_4 then
                v_u_4 = p5.Cmdr.Util.MakeEnumType("Sticker Packs", v_u_3.Dictionary.keys(v_u_3.Dictionary.filter(v_u_2.gifts, function(p6)
                    return p6.grid_category == "sticker_packs"
                end)))
            end
            return {
                ["Type"] = v_u_4,
                ["Name"] = "Sticker Pack",
                ["Description"] = "The sticker pack to open."
            }
        end,
        function(p7)
            return {
                ["Type"] = p7.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind("stickers"),
                ["Name"] = "Sticker",
                ["Description"] = "The sticker to guarantee is in the pack."
            }
        end,
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "Amount of cards",
            ["Default"] = 10
        }
    },
    ["ClientRun"] = function(_, p8, p9, p10)
        local v11 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
        local v12 = v_u_2.gifts[p8]
        local v13 = {}
        for _ = 1, p10 do
            table.insert(v13, {
                ["kind"] = p9,
                ["category"] = "stickers"
            })
        end
        v11.apps.StickerRewardsApp:show_rewards(v12, v13)
        return "Simulating open.."
    end
}
return v14