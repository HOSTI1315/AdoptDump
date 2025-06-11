--// ReplicatedStorage.SharedModules.EquippedPets (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("LocalizationService")
local v_u_3 = require(game.ReplicatedStorage.Fsys).load
local v_u_4 = v_u_3("KindDB")
local v_u_5 = v_u_3("package:Sift")
local v_u_6 = game.Players.LocalPlayer
local v_u_7 = v_u_1:IsClient()
local v_u_116 = {
    ["is_primary_char_wrapper"] = function(p8, p9)
        local v10 = p9 or p8.player
        return v_u_116.get_equipped_char_wrappers(v10)[1] == p8
    end,
    ["is_equipped"] = function(p11, p12)
        if p11 == nil then
            return false
        end
        local v13
        if v_u_7 then
            local v14 = p12 == nil and true or p12 == v_u_6
            assert(v14, "EquippedPets.is_equipped() can only check for local player!")
            v13 = v_u_116.get_my_equipped() or {}
        else
            v13 = v_u_116.get_equipped(p12) or {}
        end
        for _, v15 in v13 do
            if v15.unique == p11.unique then
                return true
            end
        end
        return false
    end,
    ["is_wrapper_equipped"] = function(p16, p17)
        local v18 = p17 or v_u_6
        if p16 == nil or p16.player ~= v18 then
            return false
        end
        local v19 = v_u_116.get_item_from_wrapper(p16)
        return v_u_116.is_equipped(v19, v18)
    end,
    ["get_equipped"] = function(p20, p21)
        local v22 = v_u_1:IsServer()
        assert(v22, "EquippedPets.get_equipped() can only be run on the server.")
        assert(p20, "Missing player argument!")
        local v23 = v_u_3("DataM").get_store(p20)
        if v23 then
            v23 = v23:get("equip_manager")
        end
        if v23 then
            v23 = v23:get_equipped()
        end
        local v24 = v23 and v23.pets or {}
        if p21 then
            v24 = {}
            for _, v25 in v24 do
                if p21(v25) then
                    table.insert(v24, v25)
                end
            end
        end
        return v24
    end,
    ["get_equipped_char_wrappers"] = function(p26)
        if v_u_7 then
            return v_u_3("ClientData").get_server(p26 or v_u_6, "pet_char_wrappers") or {}
        end
        assert(p26, "Missing player argument!")
        local v27 = v_u_3("DataM").get_store(p26)
        if v27 then
            v27 = v27:get("pet_char_wrappers")
        end
        return v_u_5.List.copy(v27 and v27.wrappers or {})
    end,
    ["get_controlled_char_wrappers"] = function(p_u_28)
        if not v_u_7 then
            local v29 = v_u_3("CharacterWrapper")
            return v_u_5.List.filter(v29.get_all_char_wrappers(), function(p30)
                local v31
                if p30:get_property("entity_controller") == p_u_28 then
                    v31 = p30:is_non_player()
                else
                    v31 = false
                end
                return v31
            end)
        end
        local v32 = v_u_3("CharWrapperClient")
        assert(not p_u_28, "EquippedPets.get_controlled_char_wrappers only works on the local player on the client.")
        return v_u_5.List.filter(v32.get_all_char_wrappers(), function(p33)
            return p33.client_has_control
        end)
    end,
    ["get_item_from_wrapper"] = function(p34)
        if p34 == nil then
            return nil
        elseif v_u_7 then
            for _, v35 in (v_u_3("ClientData").get_server(p34.player, "equip_manager") or {}).pets or {} do
                if p34.pet_unique == v35.unique then
                    return v35
                end
            end
            return nil
        else
            if p34 then
                p34 = p34.pet_inventory_item
            end
            return p34
        end
    end,
    ["get_wrapper_from_item"] = function(p36)
        if p36 == nil then
            return nil
        end
        if v_u_7 then
            for _, v37 in v_u_116.get_equipped_char_wrappers() do
                if v37.pet_unique == p36.unique then
                    return v37
                end
            end
        else
            local v38 = p36.inventory
            if v38 then
                v38 = p36.inventory.player
            end
            if not v38 then
                return
            end
            for _, v39 in v_u_116.get_equipped_char_wrappers(v38) do
                if v39.properties.pet_unique == p36.unique then
                    return v39
                end
            end
        end
        return nil
    end,
    ["get_item_from_unique"] = function(p40, p41)
        for _, v42 in v_u_116.get_equipped(p41) do
            if v42.unique == p40 then
                return v42
            end
        end
        return nil
    end,
    ["get_wrapper_from_unique"] = function(p43, p44)
        if v_u_7 then
            for _, v45 in v_u_116.get_equipped_char_wrappers(p44) do
                if v45.pet_unique == p43 then
                    return v45
                end
            end
            return nil
        end
        if not p44 then
            for _, v46 in v_u_3("CharacterWrapper").get_all_char_wrappers() do
                if v46.is_pet and v46:get_property("pet_unique") == p43 then
                    return v46
                end
            end
            return nil
        end
        local v47 = v_u_116.get_item_from_unique(p43, p44)
        if v47 then
            v47 = v_u_116.get_wrapper_from_item(v47)
        end
        return v47
    end,
    ["get_controlled_wrapper_from_unique"] = function(p48, p49)
        local v50 = v_u_116.get_wrapper_from_unique(p48, p49)
        if v50 then
            return v50
        elseif v_u_7 then
            for _, v51 in v_u_116.get_controlled_char_wrappers() do
                if v51.pet_unique == p48 then
                    return v51
                end
            end
            return nil
        else
            for _, v52 in v_u_116.get_controlled_char_wrappers(p49) do
                if v52:get_property("pet_unique") == p48 then
                    return v52
                end
            end
            return nil
        end
    end,
    ["callback"] = function(p53, p54)
        return p53(v_u_116.get_equipped(p54))
    end,
    ["get_max_equip_count"] = function(p55)
        local v56
        if v_u_7 then
            v56 = v_u_3("ClientData").get("equipped_pets_allowed")
        else
            assert(p55, "Missing player argument!")
            v56 = v_u_3("DataM").get_store(p55)
            if v56 then
                v56 = v56:get("equipped_pets_allowed")
            end
        end
        return v56 or 1
    end,
    ["get_name"] = function(p57, p58)
        local v59
        if p57 then
            v59 = v_u_4[p57.kind]
        else
            v59 = p57
        end
        assert(v59, "Invalid pet_item provided!")
        local v60 = v_u_116.get_wrapper_from_item(p57)
        return v_u_116.get_name_from_wrapper(v60, p58)
    end,
    ["get_name_from_wrapper"] = function(p61, p62)
        assert(p61, "Missing wrapper")
        local v63, v64
        if v_u_7 then
            if p61 then
                v63 = p61.rp_name
            else
                v63 = p61
            end
            v64 = v_u_6
        else
            if p61 then
                v63 = p61:get_property("rp_name")
            else
                v63 = p61
            end
            v64 = p62 or p61.player
        end
        local v65 = p61.char
        if v65 then
            v65 = p61.char.Name
        end
        if v63 and v63:gsub(" ", "") ~= "" then
            if string.len(v63) > 20 then
                return string.sub(v63, 1, 17) .. "..."
            end
        else
            v63 = v_u_2:GetTranslatorForPlayer(v64):Translate(workspace, v65)
        end
        return v63
    end,
    ["choose_equipped"] = function(p66)
        local v67 = v_u_7
        assert(v67, "EquippedPets.choose_equipped() can only be run on the client.")
        local v68 = v_u_116.get_my_equipped(p66)
        if #v68 == 0 then
            return nil
        elseif #v68 == 1 then
            return v68[1]
        else
            local v69 = v_u_3("UIManager")
            local v70 = {}
            for v71, v72 in v68 do
                v70[v71] = {
                    ["text"] = "(" .. v71 .. ") " .. v_u_116.get_name(v72),
                    ["layout_order"] = v71
                }
            end
            local v73 = v69.apps.DialogApp:dialog({
                ["dialog_type"] = "ScrollingButtonsDialog",
                ["header"] = "Choose Pet:",
                ["buttons"] = v70,
                ["cancelable"] = true,
                ["cells_per_row"] = 2,
                ["padding"] = 10,
                ["vertical_alignment"] = Enum.VerticalAlignment.Center
            })
            if v73 then
                return v68[v73]
            else
                return nil
            end
        end
    end,
    ["choose_wrapper"] = function()
        local v74 = v_u_116.choose_equipped()
        return v_u_116.get_wrapper_from_item(v74)
    end,
    ["get_my_equipped"] = function(p75)
        local v76 = v_u_7
        assert(v76, "EquippedPets.get_all_my_equipped() can only be run on the client.")
        local v77 = (v_u_3("ClientData").get("equip_manager") or {}).pets or {}
        if not p75 then
            return v_u_5.List.copy(v77)
        end
        local v78 = {}
        for _, v79 in v77 do
            if p75(v79) then
                table.insert(v78, v79)
            end
        end
        return v78
    end,
    ["get_my_equipped_char_wrappers"] = function()
        local v80 = v_u_7
        assert(v80, "EquippedPets.get_my_equipped_char_wrappers() can only be run on the client.")
        return v_u_116.get_equipped_char_wrappers()
    end,
    ["refresh_follow_distance"] = function(p_u_81, p82)
        local v83 = v_u_1:IsServer()
        assert(v83, "EquippedPets.refresh_follow_distance() can only be run on the server.")
        local v84 = v_u_3("CharacterWrapper")
        local v85 = Vector3.new(3.5, 0, 0)
        local v86 = v_u_116.get_controlled_char_wrappers(p_u_81)
        if p82 then
            local v87 = v84.get(p82)
            if v87 and not table.find(v86, v87) then
                table.insert(v86, v87)
            end
        end
        table.sort(v86, function(p88, p89)
            local function v91(p90)
                return v_u_116.is_primary_char_wrapper(p90, p_u_81)
            end
            local function v93(p92, _)
                return p92
            end
            local v94 = v91(p88)
            local v95 = v91(p89)
            local v96
            if v94 == v95 then
                v96 = nil
            else
                v96 = v93(v94, v95)
            end
            if v96 == nil then
                local function v98(p97)
                    return p97.player == p_u_81
                end
                local function v100(p99, _)
                    return p99
                end
                local v101 = v98(p88)
                local v102 = v98(p89)
                local v103
                if v101 == v102 then
                    v103 = nil
                else
                    v103 = v100(v101, v102)
                end
                if v103 == nil then
                    local function v105(p104)
                        return p104:get_property("unique")
                    end
                    local function v108(p106, p107)
                        return p106 < p107
                    end
                    local v109 = v105(p88)
                    local v110 = v105(p89)
                    if v109 == v110 then
                        return nil
                    else
                        return v108(v109, v110)
                    end
                else
                    return v103
                end
            else
                return v96
            end
        end)
        for v111, v112 in v86 do
            if v112.char then
                local v113
                if v111 == 1 then
                    v113 = Vector3.new(3.5, 0, 0)
                elseif v111 == 2 then
                    v113 = Vector3.new(-3.5, 0, 0)
                else
                    local v114 = 3.5 * (v111 - 1)
                    v113 = Vector3.new(0, 0, v114)
                end
                local v115 = v_u_4[v112:get_property("pet_id")]
                if v115.follow_offset_scale then
                    v113 = v113 * v115.follow_offset_scale
                end
                v112.char:SetAttribute("FollowOffset", v113)
                if v112.char == p82 then
                    v85 = v113
                end
            end
        end
        return v85
    end
}
return v_u_116