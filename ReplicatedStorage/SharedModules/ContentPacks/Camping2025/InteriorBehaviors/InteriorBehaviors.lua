--// ReplicatedStorage.SharedModules.ContentPacks.Camping2025.InteriorBehaviors (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v_u_3 = v1("InventoryDB")
local v_u_4 = v1("PublicLootBoxRewards")
local v_u_5 = v1("MooseAdoption")
local v_u_6 = v1("TranslationHelper")
local v16 = {
    ["CampingShop"] = {
        ["render"] = function(p7, p8)
            local v9 = v_u_2.new()
            p8.camping_shop_maid = v9
            if p7.Ambience then
                p7.Ambience:Play()
            end
            v_u_5.start(p7)
            local v10 = v_u_6.translate(game, v_u_3.food.camping_2025_maple_leaf_treat.name)
            local v11 = v_u_6.translate(game, "Tame a Moose with a %s!"):format(v10)
            local v_u_12 = p7.RaritySign.Sign.SurfaceGui.Frame
            v_u_12.Title.Text = v11
            v9.sign_request_promise = v_u_4.request():andThen(function(p13)
                v_u_12.Odds.Text = v_u_4.convert_to_human_readable(p13.camping_2025_maple_leaf_treat)
            end)
        end,
        ["cleanup"] = function(p14, p15)
            p15.camping_shop_maid:DoCleaning()
            v_u_5.cleanup()
            if p14.Ambience then
                p14.Ambience:Stop()
            end
        end
    }
}
return v16