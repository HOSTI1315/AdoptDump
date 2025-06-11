--// ReplicatedStorage.SharedModules.Game.AvatarEditorHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_7 = {
    ["get_accessory_item_by_unique_client"] = function(p2)
        return v_u_1("ClientData").get("inventory").pet_accessories[p2] or nil
    end,
    ["get_asset_struct_property"] = function(p3, p4)
        if typeof(p4) == "table" and p4.properties ~= nil then
            return p4.properties[p3]
        else
            return nil
        end
    end,
    ["get_asset_id"] = function(p5)
        if typeof(p5) == "table" then
            return p5.asset_id
        else
            return p5
        end
    end,
    ["get_bundle_id"] = function(p6)
        return v_u_7.get_asset_struct_property("bundle_id", p6)
    end
}
return v_u_7