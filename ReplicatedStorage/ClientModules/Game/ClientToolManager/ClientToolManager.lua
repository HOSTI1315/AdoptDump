--// ReplicatedStorage.ClientModules.Game.ClientToolManager (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("EquipPermissions")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("ClientData")
local v6 = v1("LeakyBucket")
local v7 = v1("Signal")
local v_u_8 = v1("new:TutorialHelper")
local v_u_9 = v1("package:Promise")
local v_u_10 = game:GetService("Players")
local v_u_11 = {}
local v_u_12 = 0
local v_u_13 = v7.new()
local v_u_14 = v6.new(1, 15)
local v_u_15 = v6.new(1, 15)
local function v_u_22(p16, p17, p18)
    local v19 = v_u_5.get("equip_manager") or {}
    local v20 = table.clone(v19)
    local v21 = v_u_11.get_equipped_by_category(p16)
    if p18 and p18.equip_as_last then
        table.insert(v21, p17)
    else
        table.insert(v21, 1, p17)
    end
    v20[p16] = v21
    v_u_5.predict("equip_manager", v20)
end
local function v_u_30(p23, p24)
    local v25 = v_u_5.get("equip_manager") or {}
    local v26 = table.clone(v25)
    if p24 then
        local v27 = v_u_11.get_equipped_by_category(p23)
        for v28, v29 in v27 do
            if v29.unique == p24 then
                table.remove(v27, v28)
            end
        end
        v26[p23] = v27
        v_u_5.predict("equip_manager", v26)
    end
end
function v_u_11.get_equipped_changed()
    return v_u_13
end
function v_u_11.is_equipped(p31)
    for _, v32 in v_u_11.get_equipped_by_category(p31.category) do
        if v32.unique == p31.unique then
            return true
        end
    end
    return false
end
function v_u_11.is_kind_equipped(p33)
    for _, v34 in v_u_11.get_equipped_by_category(p33.category) do
        if v34.kind == p33.kind then
            return true
        end
    end
    return false
end
function v_u_11.get_equipped_by_category(p35)
    local v36 = (v_u_5.get("equip_manager") or {})[p35] or {}
    return table.clone(v36)
end
function v_u_11.get_all_equipped()
    local v37 = v_u_5.get("equip_manager") or {}
    return table.clone(v37)
end
function v_u_11.backpack_equip(p38, p39)
    local v40 = v_u_11.is_equipped(p38)
    local v41
    if p39 then
        v41 = p39.forced_action
    else
        v41 = p39
    end
    local v42
    if v41 and (v41 == "equip" or v41 == "unequip") then
        v42 = v41 ~= "equip"
        if v42 ~= v40 then
            local v43, v44 = v_u_11.backpack_equip(p38)
            if not v43 then
                return v43, v44
            end
        end
    else
        v42 = v40
    end
    local v45, v46, v47
    if v42 then
        v45, v46 = v_u_11.unequip(p38, p39)
        v47 = "Unequip"
    else
        v45, v46 = v_u_11.equip(p38, p39)
        v47 = "Equip"
    end
    if v45 then
        if p38.category ~= "pets" then
            if p39 then
                p39 = p39.use_sound_delay
            end
            local v_u_48 = "Item" .. v47
            if p39 and true or false then
                task.delay(0.08, function()
                    v_u_2.Interface:play("Items/" .. v_u_48)
                end)
                return v45, v46
            end
            v_u_2.Interface:play("Items/" .. v_u_48)
        end
    else
        if p39 then
            p39 = p39.suppress_fail_message
        end
        if v46 and (not (v46.is_server or p39) and true or false) then
            v_u_3.display_fail_message(v_u_10.LocalPlayer, v46)
            return v45, v46
        end
    end
    return v45, v46
end
function v_u_11.equip(p49, p50)
    local v51, v52 = v_u_3.can_equip_client(p49)
    if v51 then
        local v53 = v_u_14:reserve_fill()
        if not v53 then
            return false, {
                ["action"] = "equip",
                ["is_server"] = false,
                ["message"] = "You are equipping items too quickly!",
                ["message_type"] = "Hint"
            }
        end
        if v_u_12 == 0 then
            v_u_22(p49.category, p49, p50)
        end
        v_u_12 = v_u_12 + 1
        v51, v52 = v_u_4.get("ToolAPI/Equip"):InvokeServer(p49.unique, p50 or {})
        if not v51 then
            v_u_5.rollback_prediction("equip_manager")
        end
        v_u_12 = v_u_12 - 1
        v53()
    end
    return v51, v52
end
function v_u_11.unequip(p54, p55)
    local v56, v57 = v_u_3.can_unequip_client(p54)
    if v56 then
        local v58 = v_u_15:reserve_fill()
        if not v58 then
            return false, {
                ["action"] = "equip",
                ["is_server"] = false,
                ["message"] = "You are unequipping items too quickly!",
                ["message_type"] = "Hint"
            }
        end
        if v_u_12 == 0 then
            v_u_30(p54.category, p54.unique)
        end
        v_u_12 = v_u_12 + 1
        v56, v57 = v_u_4.get("ToolAPI/Unequip"):InvokeServer(p54.unique, p55)
        if not v56 then
            v_u_5.rollback_prediction("equip_manager")
        end
        v_u_12 = v_u_12 - 1
        v58()
        if v_u_8.is_new_tutorial_running() then
            v_u_8.get_unequipped_signal():Fire(p54, p55)
        end
    end
    return v56, v57
end
function v_u_11.get_equip_manager_changed_promise(p59)
    return v_u_9.fromEvent(v_u_13, p59)
end
function v_u_11.init()
    v_u_5.register_callback("equip_manager", function(_, p60, p61)
        v_u_13:Fire(p60, p61)
    end)
end
return v_u_11