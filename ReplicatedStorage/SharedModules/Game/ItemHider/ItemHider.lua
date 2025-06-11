--// ReplicatedStorage.SharedModules.Game.ItemHider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("EggEvent")
local v_u_3 = v1("ContentPackHelper")
local v_u_4 = v1("LiveOpsTime")
local v_u_5 = v1("CloudValues")
local v_u_6 = v1("package:t")
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = {}
local v13 = {}
local function v_u_14()
    v_u_10 = v_u_5:getValue("item_control", "non_tradeable_items") or {}
    v_u_11 = v_u_5:getValue("item_control", "non_equippable_items") or {}
    v_u_12 = v_u_5:getValue("item_control", "non_useable_items") or {}
end
local function v_u_17(p15, p16)
    if v_u_6.boolean(p15) then
        return p15
    elseif v_u_6.number(p15) then
        return not v_u_4.has_happened(p15)
    elseif v_u_6.callback(p15) then
        return p15(p16)
    else
        return false
    end
end
function v13.is_item_hidden(p18)
    if v_u_2.is_item_hidden(p18.category, p18.kind) then
        return true
    else
        local v19 = v_u_7[p18.kind]
        if v19 then
            return v_u_17(v19, p18.kind)
        else
            return false
        end
    end
end
function v13.is_item_tradeable(p20, p21)
    local v22 = not v_u_10[p20.kind]
    local v23 = v_u_8[p20.kind]
    if v23 then
        if v22 then
            v22 = not v_u_17(v23, p20.kind)
        end
    end
    local v24 = p21 and p21.properties
    if v24 then
        v24 = p21.properties.tradeable_timestamp
    end
    if v24 then
        if v22 then
            v22 = not v_u_17(v24, p20.kind)
        end
    end
    if p20.donatable ~= nil then
        if v22 then
            v22 = p20.donatable
        end
    end
    return v22
end
function v13.is_item_useable(p25)
    return not v_u_12[p25.kind]
end
function v13.is_item_equippable(p26)
    if v_u_11[p26.kind] then
        return false
    end
    local v27 = v_u_9[p26.kind]
    return not v27 and true or not v_u_17(v27, p26.kind)
end
function v13.get_visible_timestamp(p28)
    local v29 = v_u_7[p28.kind]
    if v29 and v_u_6.integer(v29) then
        return v29
    else
        return nil
    end
end
function v13.get_tradeable_timestamp(p30, p31)
    local v32 = v_u_8[p30.kind]
    if v32 and v_u_6.integer(v32) then
        return v32
    end
    local v33 = p31 and p31.properties
    if v33 then
        v33 = p31.properties.tradeable_timestamp
    end
    return v33 or nil
end
function v13.get_equippable_timestamp(p34)
    local v35 = v_u_9[p34.kind]
    if v35 and v_u_6.integer(v35) then
        return v35
    else
        return nil
    end
end
function v13.init()
    local v36 = {
        ["hidden_items"] = v_u_7,
        ["non_tradeable_items"] = v_u_8,
        ["non_equippable_items"] = v_u_9
    }
    v_u_3.merge("HiddenItems", v36, true)
    v_u_14()
    v_u_5:onChange(function()
        v_u_14()
    end)
end
return v13