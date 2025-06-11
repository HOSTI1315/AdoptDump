--// ReplicatedStorage.SharedModules.EquipPermissions (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("InventoryDB")
local v_u_3 = v_u_1("HouseDB")
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("RunService")
local v6 = v_u_1("ContentPackHelper")
local v7 = v_u_1("package:Sift")
local function v8(_, _, _)
    return true
end
local v_u_11 = {
    ["MainMap"] = v8,
    ["Neighborhood"] = v8,
    ["housing!sandbox_island"] = v8,
    ["housing!castle_house"] = v8,
    ["housing!cozy_cabin"] = function(_, _, p9)
        return p9.kind == "ice_skates"
    end,
    ["IceCream"] = function(_, _, p10)
        return p10.kind == "ice_skates"
    end,
    ["housing!racetrack_house"] = v8
}
local v_u_13 = {
    ["SEATimePortal"] = function(_, _, p12)
        return p12.kind ~= "crab", {
            ["message_type"] = "Dialog",
            ["message"] = "The other crabs here are bad influences! Keep your Crab in your backpack!"
        }
    end,
    ["HalloweenTimePortal"] = function(_, _, _)
        return false, {
            ["message_type"] = "Dialog",
            ["message"] = "You can\'t spawn a pet here."
        }
    end
}
local v14 = {}
local v_u_15 = {}
local function v_u_22(p16)
    local v17 = nil
    local v18
    if v_u_5:IsServer() then
        local v19 = v_u_1("DataM").get_store(p16)
        if v19 then
            v18 = v19:get("char_wrapper")
        else
            v18 = v19
        end
        if v18 then
            v18 = v18:get_property("location")
        end
        if v18 then
            v18 = v18.destination_id
        end
        if v18 == "housing" then
            v17 = v_u_3[((v19:get("house_interior") or {}).house or {}).building_type]
        end
    else
        local v20 = v_u_1("InteriorsM")
        local v21 = v_u_1("ClientData")
        v18 = v20.get_current_location()
        if v18 then
            v18 = v18.destination_id
        end
        if v18 == "housing" then
            v17 = v_u_3[(v21.get("house_interior") or {}).building_type]
        end
    end
    return v18, v17
end
local function v_u_26(p23, p24)
    local v25 = {
        ["text"] = p24,
        ["yields"] = false,
        ["overridable"] = true,
        ["length"] = 3.5
    }
    if v_u_5:IsServer() then
        v_u_1("MsgBridge").hint(p23, v25)
    else
        v_u_1("UIManager").apps.HintApp:hint(v25)
    end
end
local function v_u_30(p27, p28)
    local v29 = {
        ["text"] = p28,
        ["button"] = "Okay",
        ["yields"] = false
    }
    if v_u_5:IsServer() then
        v_u_1("MsgBridge").dialog(p27, v29)
    else
        v_u_1("UIManager").apps.DialogApp:dialog(v29)
    end
end
v_u_15.minigame = {
    ["order"] = 4,
    ["client"] = function(_, p31, _)
        if v_u_1("MinigameForcedState").can_equip(p31) then
            return true
        else
            return false, {
                ["message_type"] = "Hint",
                ["message"] = "You can\'t equip that while in the Minigame!"
            }
        end
    end
}
v_u_15.afk_zone = {
    ["order"] = 2,
    ["shared"] = function(p32, _, p33)
        local v34, v35 = v_u_22(p32)
        if v35 then
            v34 = v34 .. "!" .. v35.id
        end
        local v36 = v34 ~= "AFKZone" and true or p33.category == "pets"
        return v36, not v36 and {
            ["message_type"] = "Dialog",
            ["message"] = "You can only equip pets here."
        } or nil
    end
}
v_u_15.vehicle_blockers = {
    ["order"] = 3,
    ["client"] = function(_, _, p37)
        if p37.category == "transport" then
            local v38 = v_u_1("VehicleBlockerHelper")
            if p37.is_roller_skates or not v38.is_near_vehicle_blocker() then
                if p37.is_train and not v38.has_room_for_train() then
                    return false, {
                        ["message_type"] = "Dialog",
                        ["message"] = "There\'s not enough room to spawn a train here."
                    }
                else
                    return true
                end
            else
                return false, {
                    ["message_type"] = "Dialog",
                    ["message"] = "You can\'t spawn a vehicle here."
                }
            end
        else
            return true
        end
    end
}
v_u_15.transport_interior = {
    ["order"] = 1,
    ["shared"] = function(p39, p40, p41)
        if p41.category ~= "transport" then
            return true
        end
        local v42, v43 = v_u_22(p39)
        if v43 then
            v42 = v42 .. "!" .. v43.id
        end
        local v44 = false
        local v45 = nil
        if v42 then
            v42 = v_u_11[v42]
        end
        if v42 then
            v44 = v42(p39, p40, p41)
        end
        if not v44 then
            v45 = {
                ["message_type"] = "Dialog",
                ["message"] = "You can\'t spawn a vehicle here."
            }
        end
        return v44, v45
    end
}
v_u_15.item_hider = {
    ["order"] = 5,
    ["shared"] = function(p46, _, p47)
        local v48 = v_u_1("ItemHider")
        if v48.is_item_equippable(p47) then
            return true
        end
        local v49 = v48.get_equippable_timestamp(p47)
        if not v49 or v_u_1("LiveOpsTime").has_happened(v49) then
            return false, {
                ["message_type"] = "Dialog",
                ["message"] = "This item is currently not equippable."
            }
        end
        local v50 = game:GetService("LocalizationService"):GetTranslatorForPlayer(p46)
        local v51 = DateTime.fromUnixTimestamp(v49)
        return false, {
            ["message_type"] = "Dialog",
            ["message"] = ("Cannot be equipped until %s on %s."):format(v51:FormatLocalTime("LT", v50.LocaleId), (v51:FormatLocalTime("ll", v50.LocaleId)))
        }
    end
}
v_u_15.pet_interior = {
    ["order"] = 6,
    ["shared"] = function(p52, p53, p54)
        if p54.category ~= "pets" then
            return true
        end
        local v55, v56 = v_u_22(p52)
        if v56 then
            v55 = v55 .. "!" .. v56.id
        end
        local v57 = nil
        if v55 then
            v55 = v_u_13[v55]
        end
        local v58
        if v55 then
            v58, v57 = v55(p52, p53, p54)
        else
            v58 = true
        end
        return v58, v57
    end
}
v6.merge("EquipPerms", {
    ["transport_interiors"] = v_u_11,
    ["special_pet_interiors"] = v_u_13,
    ["rules"] = v_u_15
}, true)
local v_u_59 = v7.Dictionary.keys(v_u_15)
table.sort(v_u_59, function(p60, p61)
    return v_u_15[p60].order < v_u_15[p61].order
end)
local function v_u_74(p62, p63, p64, p65)
    local v66 = v_u_5:IsServer() and "server" or "client"
    for _, v67 in p65 do
        local v68 = v_u_15[v67][v66]
        if v68 then
            local v69, v70 = v68(p62, p63, p64)
            if not v69 then
                return false, v70
            end
        end
        local v71 = v_u_15[v67].shared
        if v71 then
            local v72, v73 = v71(p62, p63, p64)
            if not v72 then
                return false, v73
            end
        end
    end
    return true
end
function v14.can_equip_client(p75)
    local v76 = v_u_5:IsClient()
    assert(v76, "This API can only be used on the client")
    local v77 = p75.category
    if v77 then
        v77 = p75.kind
    end
    assert(v77, "Invalid inventory item provided")
    local v78 = false
    local v79 = nil
    local v80 = v_u_2[p75.category]
    if v80 then
        v80 = v_u_2[p75.category][p75.kind]
    end
    if v80 then
        v78, v79 = v_u_74(v_u_4.LocalPlayer, p75, v80, v_u_59)
    end
    if v79 then
        v79.action = "equip"
        v79.is_server = false
    end
    return v78, v79
end
function v14.can_equip_server(p81, p82)
    local v83 = v_u_5:IsServer()
    assert(v83, "This API can only be used on the server")
    local v84
    if p81 then
        v84 = p81:IsA("Player")
    else
        v84 = p81
    end
    assert(v84, "No player specified")
    local v85 = p82.category
    if v85 then
        v85 = p82.kind
    end
    assert(v85, "Invalid inventory item provided")
    local v86 = false
    local v87 = nil
    local v88 = v_u_2[p82.category]
    if v88 then
        v88 = v_u_2[p82.category][p82.kind]
    end
    if v88 then
        v86, v87 = v_u_74(p81, p82, v88, v_u_59)
    end
    if v87 then
        v87.action = "equip"
        v87.is_server = true
    end
    return v86, v87
end
function v14.can_unequip_client(p89)
    local v90 = v_u_5:IsClient()
    assert(v90, "This API can only be used on the client")
    local v91 = p89.category
    if v91 then
        v91 = p89.kind
    end
    assert(v91, "Invalid inventory item provided")
    return true
end
function v14.can_unequip_server(p92, p93)
    local v94 = v_u_5:IsServer()
    assert(v94, "This API can only be used on the server")
    if p92 then
        p92 = p92:IsA("Player")
    end
    assert(p92, "No player specified")
    local v95 = p93.category
    if v95 then
        v95 = p93.kind
    end
    assert(v95, "Invalid inventory item provided")
    return true
end
function v14.display_fail_message(p96, p97)
    local v98 = p97.message_type
    local v99 = p97.message
    if v98 == "None" then
        v99 = ("You can\'t %s that right now"):format(p97.action)
        v98 = "Hint"
    end
    if v98 == "Hint" then
        v_u_26(p96, v99)
    elseif v98 == "Dialog" then
        v_u_30(p96, v99)
    end
end
function v14.init()
    if v_u_5:IsServer() then
        local v_u_100 = v_u_1("DataM")
        v_u_1("CharacterWrapper").get_location_changed_signal():Connect(function(p101)
            if not p101.is_pet then
                local v102 = v_u_100.get_store(p101.player)
                if v102 then
                    v102 = v102:get("equip_manager")
                end
                if v102 then
                    v102:unequip_failed_permissions()
                end
            end
        end)
    end
end
return v14