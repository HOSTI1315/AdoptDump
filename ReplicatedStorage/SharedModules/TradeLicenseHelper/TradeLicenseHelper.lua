--// ReplicatedStorage.SharedModules.TradeLicenseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("InventoryDB")
local v_u_3 = v_u_1("package:Sift")
local v_u_4 = game:GetService("RunService")
local v_u_12 = {
    ["FAILURE_MESSAGE"] = "You need a Trading License to trade Ultra-Rare or Legendary items!",
    ["HOUSE_FAILURE_MESSAGE"] = "You need a Trading License to trade houses!",
    ["inventory_has_trade_license"] = function(p5)
        if v_u_4:IsServer() then
            return #p5:get_items_with_id("trade_license") > 0
        else
            return v_u_3.Dictionary.some(p5.toys, function(p6)
                return p6.kind == "trade_license"
            end)
        end
    end,
    ["player_has_trade_license"] = function(p7)
        local v8
        if v_u_4:IsServer() then
            v8 = v_u_1("DataM").get_store(p7):get("inventory")
        else
            local _ = p7 or game.Players.LocalPlayer
            v8 = v_u_1("ClientData").get("inventory")
        end
        return v_u_12.inventory_has_trade_license(v8)
    end,
    ["entry_requires_trade_license"] = function(p9)
        return p9.rarity == "ultra_rare" and true or p9.rarity == "legendary"
    end,
    ["item_requires_trade_license"] = function(p10)
        local v11 = v_u_2[p10.category][p10.kind]
        return v_u_12.entry_requires_trade_license(v11)
    end
}
return v_u_12