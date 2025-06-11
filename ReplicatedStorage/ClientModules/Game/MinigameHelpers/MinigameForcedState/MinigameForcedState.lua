--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameForcedState (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("InteractionsEngine")
local v3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("StateManagerClient")
local v_u_5 = v_u_1("ClientToolManager")
local v_u_6 = v_u_1("RouterClient")
local v_u_7 = v_u_1("ClientData")
local v_u_8 = v_u_1("UIManager")
local v_u_9 = game:GetService("Players")
local v10 = v_u_1("package:t")
local v_u_11 = v_u_1("package:Sift")
local v_u_12 = {}
local v_u_13 = {
    ["gravity"] = 196.2,
    ["walk_speed"] = 16,
    ["jump_power"] = 50
}
local v_u_14 = {
    "DialogApp",
    "HintApp",
    "SpeechBubbleApp",
    "PlayerNameApp",
    "ExtraButtonsApp",
    "MinigameInGameApp",
    "InteractionsApp",
    "TesterWatermarkApp"
}
local v_u_15 = false
local v_u_16 = true
local v_u_17 = true
local v_u_18 = true
local v_u_19 = true
local v_u_20 = true
local v_u_21 = true
local v_u_22 = true
local v_u_23 = true
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = false
local v_u_27 = {}
local v_u_28 = nil
local v_u_29 = {
    ["disable_interactions"] = false,
    ["disable_interactions_with_me"] = false,
    ["disable_pet_mounting"] = false,
    ["can_edit_avatars"] = true,
    ["can_change_age"] = true,
    ["can_toggle_edit_avatars"] = true,
    ["can_click_tap_owned_characters"] = true,
    ["can_receive_invites"] = true,
    ["can_use_potions"] = true,
    ["can_enter_doors"] = true,
    ["forced_equips"] = {},
    ["filter_equips"] = nil,
    ["tool_app_lock"] = false,
    ["tool_app_world_tap_enabled"] = true,
    ["tool_app_hotbar"] = nil,
    ["only_show_minigame_above_char_stack"] = false,
    ["allow_charhider_above_char_stack"] = false,
    ["hide_age_bar"] = false,
    ["hide_ailments"] = false,
    ["app_visibility"] = {
        ["type"] = "exclude",
        ["app_names"] = {}
    }
}
local v31 = {
    ["disable_interactions"] = true,
    ["disable_interactions_with_me"] = true,
    ["disable_pet_mounting"] = true,
    ["can_change_age"] = false,
    ["can_toggle_edit_avatars"] = false,
    ["can_click_tap_owned_characters"] = false,
    ["can_edit_avatars"] = false,
    ["can_receive_invites"] = false,
    ["can_use_potions"] = false,
    ["can_enter_doors"] = false,
    ["forced_equips"] = v_u_11.Dictionary.map(v3, function(_, p30)
        return {}, p30
    end),
    ["filter_equips"] = nil,
    ["tool_app_lock"] = true,
    ["tool_app_world_tap_enabled"] = false,
    ["tool_app_hotbar"] = nil,
    ["only_show_minigame_above_char_stack"] = false,
    ["allow_charhider_above_char_stack"] = false,
    ["hide_age_bar"] = true,
    ["hide_ailments"] = true,
    ["app_visibility"] = {
        ["type"] = "include",
        ["app_names"] = {},
        ["include_essential"] = true
    }
}
local v32 = v10.strictInterface
local v33 = {
    ["disable_interactions"] = v10.optional(v10.boolean),
    ["disable_interactions_with_me"] = v10.optional(v10.boolean),
    ["disable_pet_mounting"] = v10.optional(v10.boolean),
    ["can_edit_avatars"] = v10.optional(v10.boolean),
    ["can_change_age"] = v10.optional(v10.boolean),
    ["can_toggle_edit_avatars"] = v10.optional(v10.boolean),
    ["can_click_tap_owned_characters"] = v10.optional(v10.boolean),
    ["can_receive_invites"] = v10.optional(v10.boolean),
    ["can_use_potions"] = v10.optional(v10.boolean),
    ["can_enter_doors"] = v10.optional(v10.boolean),
    ["forced_equips"] = v10.optional(v10.map(v10.string, v10.array(v10.string))),
    ["filter_equips"] = v10.optional(v10.callback),
    ["tool_app_lock"] = v10.optional(v10.boolean),
    ["tool_app_world_tap_enabled"] = v10.optional(v10.boolean)
}
local v34 = v10.optional
local v35 = v10.strictInterface
local v36 = {
    ["hide_empty_slots"] = v10.optional(v10.boolean),
    ["slots"] = v10.array(v10.strictInterface({
        ["category"] = v10.string,
        ["kind"] = v10.string,
        ["properties"] = v10.optional(v10.map(v10.string, v10.any)),
        ["unique"] = v10.optional(v10.string)
    }))
}
v33.tool_app_hotbar = v34(v35(v36))
v33.only_show_minigame_above_char_stack = v10.optional(v10.boolean)
v33.allow_charhider_above_char_stack = v10.optional(v10.boolean)
v33.hide_age_bar = v10.optional(v10.boolean)
v33.hide_ailments = v10.optional(v10.boolean)
v33.app_visibility = v10.optional(v10.strictInterface({
    ["type"] = v10.literal("include", "exclude"),
    ["app_names"] = v10.array(v10.string),
    ["include_essential"] = v10.optional(v10.boolean)
}))
local v_u_37 = v32(v33)
local function v_u_40()
    if v_u_24 or v_u_25 then
        for _, v38 in v_u_7.get("equip_manager") or {} do
            for _, v39 in v38 do
                if not v_u_12.can_equip(v39) then
                    v_u_5.unequip(v39)
                end
            end
        end
    end
end
local function v_u_47()
    local v41 = v_u_9.LocalPlayer.Character
    if v41 then
        v41 = v41:FindFirstChild("Humanoid")
    end
    if v41 then
        local v_u_42 = 0
        for _, v43 in v_u_28 do
            local v44 = v43.priority or 0
            v_u_42 = math.max(v44, v_u_42)
        end
        local v46 = v_u_11.List.findWhereLast(v_u_28, function(p45)
            return (p45.priority or 0) == v_u_42
        end)
        if v46 then
            v46 = v_u_28[v46]
        end
        workspace.Gravity = v46 and v46.gravity or v_u_13.gravity
        v41.WalkSpeed = v46 and v46.walk_speed or v_u_13.walk_speed
        v41.JumpPower = v46 and v46.jump_power or v_u_13.jump_power
    end
end
local function v_u_54(p48)
    if p48 then
        if p48.type == "include" then
            local v49 = {}
            if p48.include_essential then
                for _, v50 in v_u_14 do
                    v49[v50] = true
                end
            end
            for _, v51 in p48.app_names do
                v49[v51] = true
            end
            return v_u_11.Dictionary.keys(v49)
        end
        if p48.type == "exclude" then
            local v52 = v_u_11.Set.fromList(v_u_11.Dictionary.keys(v_u_8.apps))
            for _, v53 in p48.app_names do
                v52[v53] = nil
            end
            return v_u_11.Dictionary.keys(v52)
        end
    end
    return nil
end
local function v_u_61(p55)
    if p55.tool_app_hotbar then
        p55.tool_app_hotbar.slots = v_u_11.List.map(p55.tool_app_hotbar.slots, function(p56)
            return not p56.hotbar_properties and {
                ["hotbar_properties"] = p56
            } or p56
        end)
        p55.tool_app_lock = false
        local v57 = p55.forced_equips
        if v57 then
            for _, v58 in p55.tool_app_hotbar.slots do
                local v59 = v58.hotbar_properties
                if v57[v59.category] and not v_u_11.List.find(v57[v59.category], v59.kind) then
                    v57[v59.category] = v_u_11.List.append(v57[v59.category], v59.kind)
                end
            end
        end
        local v60 = p55.app_visibility
        if v60 then
            if v60.type == "include" and not v_u_11.List.find(v60.app_names, "ToolApp") then
                v60.app_names = v_u_11.List.append(v60.app_names, "ToolApp")
                return
            end
            if v60.type == "exclude" and v_u_11.List.find(v60.app_names, "ToolApp") then
                v60.app_names = v_u_11.List.removeValue(v60.app_names, "ToolApp")
            end
        end
    end
end
v_u_12.RESTRICT_ALL = v31
function v_u_12.is_enabled()
    return v_u_15
end
function v_u_12.can_equip(p62)
    if not v_u_15 then
        return true
    end
    if v_u_25 and not v_u_25(p62) then
        return false
    end
    if not v_u_24 then
        return true
    end
    local v63 = v_u_24[p62.category]
    return not v63 and true or (v63[p62.kind] and true or false)
end
function v_u_12.are_ailments_hidden()
    local v64 = v_u_15
    if v64 then
        v64 = v_u_26
    end
    return v64
end
function v_u_12.can_receive_invites()
    return not v_u_15 or v_u_21
end
function v_u_12.can_mount_pet()
    return not v_u_15 or v_u_16
end
function v_u_12.can_edit_avatars()
    return not v_u_15 or v_u_17
end
function v_u_12.can_change_age()
    return not v_u_15 or v_u_18
end
function v_u_12.can_toggle_edit_avatars()
    return not v_u_15 or v_u_19
end
function v_u_12.can_click_tap_owned_characters()
    return not v_u_15 or v_u_20
end
function v_u_12.can_use_potions()
    return not v_u_15 or v_u_22
end
function v_u_12.can_enter_doors()
    return not v_u_15 or v_u_23
end
function v_u_12.get_buff(p_u_65)
    if v_u_28 then
        local v67 = v_u_11.List.findWhere(v_u_28, function(p66)
            return p66.key == p_u_65
        end)
        if v67 then
            return v_u_28[v67]
        else
            return nil
        end
    else
        return nil
    end
end
function v_u_12.add_buff(p_u_68, p69)
    if v_u_28 then
        if v_u_11.List.findWhere(v_u_28, function(p70)
            return p70.key == p_u_68
        end) then
            error(("MinigameForcedState buff already exists at key %s."):format(p_u_68))
        end
        local v71 = v_u_28
        local v72 = v_u_11.Dictionary.join
        table.insert(v71, v72(p69, {
            ["key"] = p_u_68
        }))
        v_u_47()
    end
end
function v_u_12.remove_buff(p_u_73)
    if v_u_28 then
        local v75 = v_u_11.List.findWhere(v_u_28, function(p74)
            return p74.key == p_u_73
        end)
        if v75 then
            v_u_28 = v_u_11.List.removeIndex(v_u_28, v75)
        end
        v_u_47()
    end
end
function v_u_12.disable_character_buffs()
    local v_u_76 = v_u_9.LocalPlayer.Character
    v_u_76 = v_u_76
    local v_u_77
    if v_u_76 then
        v_u_77 = v_u_76:FindFirstChild("Humanoid")
    else
        v_u_77 = v_u_76
    end
    if not v_u_77 then
        return function() end
    end
    local v_u_78 = {
        ["gravity"] = workspace.Gravity,
        ["walk_speed"] = v_u_77.WalkSpeed,
        ["jump_power"] = v_u_77.JumpPower
    }
    workspace.Gravity = v_u_13.gravity
    v_u_77.WalkSpeed = v_u_13.walk_speed
    v_u_77.JumpPower = v_u_13.jump_power
    return function()
        if not (v_u_76 and (v_u_76.Parent and (v_u_77 and v_u_77.Parent))) then
            v_u_76 = v_u_9.LocalPlayer.Character
            local v79 = v_u_76
            if v79 then
                v79 = v_u_76:FindFirstChild("Humanoid")
            end
            v_u_77 = v79
            if not v_u_77 then
                return
            end
        end
        workspace.Gravity = v_u_78.gravity
        v_u_77.WalkSpeed = v_u_78.walk_speed
        v_u_77.JumpPower = v_u_78.jump_power
    end
end
function v_u_12.enable(p80)
    local v81 = v_u_37
    assert(v81(p80))
    local v82 = v_u_11.Dictionary.merge(v_u_29, p80)
    v_u_61(v82)
    if not v_u_15 then
        if v82.disable_interactions then
            v_u_2:set_tag_exclusive("MinigameForcedStateOverride", true)
        end
        if v82.disable_interactions_with_me and not v_u_7.get("disable_interactions_with_me") then
            v_u_6.get("InteractablesAPI/DisableInteractionWithMe"):FireServer(true)
        end
        v_u_4.exit_seat_states()
        v_u_6.get("AdoptAPI/EjectAllHeldBabies"):FireServer()
        v_u_16 = not v82.disable_pet_mounting
        v_u_17 = v82.can_edit_avatars and true or false
        v_u_18 = v82.can_change_age and true or false
        v_u_19 = v82.can_toggle_edit_avatars and true or false
        v_u_20 = v82.can_click_tap_owned_characters and true or false
        v_u_21 = v82.can_receive_invites and true or false
        v_u_22 = v82.can_use_potions and true or false
        v_u_23 = v82.can_enter_doors and true or false
        v_u_24 = {}
        v_u_25 = v82.filter_equips
        v_u_26 = v82.hide_ailments
        v_u_28 = {}
        local v83 = v_u_54(v82.app_visibility)
        v_u_8.apps.HideGuiApp:hide_all("MinigameForcedStateOverride", v83)
        v_u_8.apps.PlayerNameApp:set_only_display_minigame_components(v82.only_show_minigame_above_char_stack)
        v_u_8.apps.PlayerNameApp:set_allow_charhider_components(v82.allow_charhider_above_char_stack)
        v_u_8.apps.PlayerNameApp:set_hide_age_bar(v82.hide_age_bar)
        local v84 = v_u_7.get("equip_manager") or {}
        v_u_27 = v_u_11.Dictionary.copy(v84)
        for v85, v86 in v82.forced_equips do
            local v87 = v_u_11.List.toSet(v86)
            for _, v88 in v84[v85] or {} do
                if v88 and not v87[v88.kind] then
                    v_u_5.unequip(v88)
                end
            end
            v_u_24[v85] = v87
        end
        if v82.tool_app_lock then
            v_u_8.apps.ToolApp:set_minigame_locked(true)
        end
        if v82.tool_app_hotbar then
            v_u_8.apps.ToolApp:set_minigame_hotbar(v82.tool_app_hotbar)
        end
        if not v82.tool_app_world_tap_enabled then
            v_u_8.apps.ToolApp:set_minigame_world_tap_enabled(false)
        end
        v_u_15 = true
        v_u_8.refresh_all_apps()
        if v_u_26 then
            v_u_1("new:AilmentsClient").on_ailments_hidden_changed()
        end
    end
end
function v_u_12.disable()
    if v_u_15 then
        v_u_24 = nil
        v_u_28 = nil
        v_u_8.apps.HideGuiApp:unhide_all("MinigameForcedStateOverride")
        v_u_8.apps.PlayerNameApp:set_only_display_minigame_components(false)
        v_u_8.apps.PlayerNameApp:set_allow_charhider_components(false)
        v_u_8.apps.PlayerNameApp:set_hide_age_bar(false)
        v_u_2:set_tag_exclusive("MinigameForcedStateOverride", false)
        v_u_8.apps.ToolApp:set_minigame_locked(false)
        v_u_8.apps.ToolApp:set_minigame_hotbar(nil)
        v_u_8.apps.ToolApp:set_minigame_world_tap_enabled(true)
        if v_u_7.get("disable_interactions_with_me") then
            v_u_6.get("InteractablesAPI/DisableInteractionWithMe"):FireServer(false)
        end
        v_u_15 = false
        v_u_8.refresh_all_apps()
        if v_u_26 then
            v_u_1("new:AilmentsClient").on_ailments_hidden_changed()
        end
    end
end
function v_u_12.restore_equipped(p89)
    for _, v90 in v_u_5.get_equipped_by_category("pets") do
        v_u_5.unequip(v90)
    end
    for _, v91 in p89 do
        local v92
        if v91 == "pets" then
            v92 = {
                ["equip_as_last"] = true
            }
        else
            v92 = nil
        end
        if v_u_27[v91] then
            for _, v93 in v_u_27[v91] do
                v_u_5.equip(v93, v92)
            end
        end
    end
end
function v_u_12.init()
    v_u_7.register_callback_plus_existing("equip_manager", function(_)
        v_u_40()
    end)
    local function v96(p94)
        if p94 then
            p94 = p94:FindFirstChild("Humanoid")
        end
        if p94 then
            p94.Changed:Connect(function(p95)
                if v_u_15 then
                    if p95 == "WalkSpeed" or p95 == "JumpPower" then
                        v_u_47()
                    end
                end
            end)
        end
    end
    local v97 = v_u_9.LocalPlayer.Character
    if v97 then
        v97 = v97:FindFirstChild("Humanoid")
    end
    if v97 then
        v97.Changed:Connect(function(p98)
            if v_u_15 then
                if p98 == "WalkSpeed" or p98 == "JumpPower" then
                    v_u_47()
                end
            end
        end)
    end
    v_u_9.LocalPlayer.CharacterAdded:Connect(v96)
end
return v_u_12