--// ReplicatedStorage.RoactComponents.Apps.HouseInteriorApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Roact")
local v_u_3 = v1("RoactRodux")
local v_u_4 = v1("UI")
v1("ClientStore")
v1("HouseDB")
v1("DownloadClient")
local v5 = {}
local v_u_6 = v_u_2.createElement
local v_u_14 = v_u_3.connect(function(p7)
    local v8 = p7:getState()
    return {
        ["house_interior"] = v8.house_interior,
        ["texture_preview"] = v8.texture_preview
    }
end)(function(p9)
    local v10 = p9.house_interior or {}
    local v11 = p9.texture_preview
    local v12 = {}
    local v13 = v10.building_type ~= nil
    v12.blueprint = v_u_6(v_u_4.Blueprint, {
        ["building_type"] = v10.building_type,
        ["player"] = v10.player,
        ["house_pos"] = v10.house_pos,
        ["textures"] = v10.textures,
        ["textures_hash"] = v10.textures_hash,
        ["texture_preview"] = v11,
        ["active_addons"] = v10.active_addons,
        ["house_id"] = v10.house_id
    })
    v12.furniture = v_u_6(v_u_4.AllFurniture, {
        ["furniture"] = v10.furniture,
        ["house_pos"] = v10.house_pos,
        ["player"] = v10.player,
        ["house_id"] = v10.house_id,
        ["interior_name"] = v10.interior_name,
        ["is_house"] = v13,
        ["listed_for_trade"] = v10.listed_for_trade
    })
    return v_u_6("Folder", {}, v12)
end)
function v5.init(p15)
    local v16 = v_u_6(v_u_3.StoreProvider, {
        ["store"] = p15
    }, {
        ["app"] = v_u_6(v_u_14)
    })
    v_u_2.mount(v16, workspace, "HouseInteriors")
end
return v5