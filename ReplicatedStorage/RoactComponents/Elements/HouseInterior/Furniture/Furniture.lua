--// ReplicatedStorage.RoactComponents.Elements.HouseInterior.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Roact")
local v_u_3 = v1("DownloadClient")
local v_u_4 = v1("CriticalSection")
local v_u_5 = v1("FurnitureDB")
local v_u_6 = v1("UIManager")
local v_u_7 = v1("ClientStore")
local v_u_8 = v1("FurnitureUseDB")
local v_u_9 = v1("Debug")
local v_u_10 = v1("InteractionsEngine")
local v_u_11 = v1("RouterClient")
local v_u_12 = v1("ClientData")
local v_u_13 = v1("PlatformM")
local v_u_14 = v1("TableUtil")
local v_u_15 = v1("CaregiverAssistHelper")
local v_u_16 = v1("RoleplayDB")
local v_u_17 = v1("AnimationScale")
local v_u_18 = v1("FurniturePlacer")
local v_u_19 = v1("CharWrapperClient")
local v_u_20 = v1("FurnitureColors")
local v_u_21 = v1("FurnitureRegistry")
local v_u_22 = v1("FurnitureBlockerHelper")
local v_u_23 = v1("PlaceableToolHelper")
local v_u_24 = v1("new:StreamingHelper")
local v_u_25 = v1("package:Promise")
local v_u_26 = game:GetService("CollectionService")
local v_u_27 = v_u_13.get_platform()
local v28 = {}
local v_u_29 = v_u_2.createElement
local v_u_30 = v_u_2.Component:extend("Furniture")
function v_u_30.delete(p_u_31, p32)
    local v_u_33 = p32 or p_u_31.props
    if p_u_31.furniture then
        v_u_33 = v_u_33
        local v_u_34
        if v_u_33 then
            v_u_34 = v_u_33.furniture_data
        else
            v_u_34 = v_u_33
        end
        if v_u_34 and (v_u_34.id and v_u_33.unique) then
            local v_u_35 = v_u_8[v_u_34.id]
            if v_u_35 and v_u_35.unrender then
                v_u_9.pcall_print_error(function()
                    v_u_35.unrender(v_u_34, p_u_31.furniture, v_u_33.unique, p_u_31)
                end)
            end
        end
        p_u_31.furniture:Destroy()
    end
    if p_u_31.promised_characters then
        for _, v36 in p_u_31.promised_characters do
            v36:cancel()
        end
    end
    if p_u_31.interactions then
        for _, v37 in pairs(p_u_31.interactions) do
            v37:destroy()
        end
        p_u_31.interactions = {}
    end
    if p_u_31.baby_should_use_furniture_connection then
        p_u_31.baby_should_use_furniture_connection:Disconnect()
    end
end
local function v_u_41(p38)
    if p38 == nil then
        return {}
    end
    local v39 = {}
    for _, v40 in pairs(p38:GetChildren()) do
        v39[v40.Name] = v40.Value
    end
    return v39
end
local function v_u_44(p42)
    if p42 then
        local v43 = v_u_12.get("roleplay_role") or {}
        if p42.building_id and p42.building_id ~= v43.building_id then
            return false
        else
            return (not p42.role_id or p42.role_id == v43.role_id) and true or false
        end
    else
        return true
    end
end
function v_u_30.activate_async(p45, p46, p47, p48)
    if not p46 then
        local v49 = p45.furniture:FindFirstChild("UseBlocks") and (p45.furniture.UseBlocks:GetChildren() or {}) or {}
        local v50 = #v49 > 0
        assert(v50, "No use_blocks found.")
        local v51 = #v49 == 1
        assert(v51, "There are multiple use_blocks. Must specifiy which one to activate.")
        p46 = v49[1].Name
    end
    local v52 = p45.use_block_name_mapped_to_get_on_selected_callback[p46]
    local v53 = "Can\'t find get_on_selected_callback for use_block_name = " .. tostring(p46)
    assert(v52, v53)
    return v52(game.Players.LocalPlayer.Character, p48)(p47 and {
        ["is_override_payload"] = true,
        ["data"] = p47
    } or nil)
end
function v_u_30.register_interaction(p_u_54, p_u_55, p_u_56, p_u_57)
    local v_u_58 = p_u_54.props.player
    local v_u_59 = p_u_54.props.unique
    local v_u_60 = p_u_54.props.listed_for_trade
    if p_u_57.occupied then
        local v61 = p_u_57.occupied
        if typeof(v61) ~= "table" or p_u_57.occupied[p_u_55.Name] then
            return
        end
    end
    local function v70(p_u_62, p_u_63)
        return function(p_u_64)
            local v_u_65 = p_u_62 == game.Players.LocalPlayer.Character
            local v_u_66
            if p_u_56.server_use then
                v_u_66 = false
                task.spawn(function()
                    local v67
                    if p_u_56.client_get_data_for_server_use then
                        v67 = p_u_56.client_get_data_for_server_use(p_u_57, v_u_59, p_u_54.furniture, v_u_58, p_u_55, p_u_54, p_u_63)
                        if v67 == nil then
                            v_u_66 = true
                            return
                        end
                    else
                        v67 = nil
                    end
                    local v68 = p_u_64
                    if typeof(v68) == "table" and p_u_64.is_override_payload then
                        v67 = p_u_64.data
                    end
                    if v_u_65 then
                        p_u_62 = game.Players.LocalPlayer.Character
                    end
                    local v69
                    if p_u_54.props.placeable then
                        v69 = v_u_23.get_house_owner(p_u_62)
                    else
                        v69 = v_u_58
                    end
                    if v69 then
                        v_u_11.get("HousingAPI/ActivateFurniture"):InvokeServer(v69, v_u_59, p_u_55.Name, v67, p_u_62)
                    else
                        v_u_11.get("HousingAPI/ActivateInteriorFurniture"):InvokeServer(v_u_59, p_u_55.Name, v67, p_u_62)
                    end
                    v_u_66 = true
                end)
            else
                v_u_66 = true
            end
            if p_u_56.client_use then
                p_u_56.client_use(p_u_57, v_u_59, p_u_54.furniture, p_u_62, p_u_55.name, p_u_54)
            end
            task.wait(0.3)
            repeat
                task.wait(0.1)
            until v_u_66
        end
    end
    p_u_54.use_block_name_mapped_to_get_on_selected_callback[p_u_55.Name] = v70
    local function v_u_72(p_u_71)
        return function()
            v_u_11.get("InteractablesAPI/MakeBabyUseFurniture"):FireServer(p_u_71, v_u_59, p_u_55.Name)
        end
    end
    local v73 = p_u_56.on_interaction_shown and function(...)
        p_u_56.on_interaction_shown(p_u_57, ...)
    end or nil
    local v74 = v_u_5[p_u_57.id]
    local v75 = v_u_41(p_u_55:FindFirstChild("Configuration"))
    local v76 = nil
    if p_u_56.interaction_tags and p_u_56.interaction_tags[p_u_55.Name] then
        v76 = p_u_56.interaction_tags[p_u_55.Name]
    elseif p_u_56.interaction_tag then
        v76 = p_u_56.interaction_tag
    elseif p_u_56.ailment_to_boost then
        v76 = p_u_56.ailment_to_boost[1]
    end
    local v77 = v_u_10
    local v80 = {
        ["text"] = function()
            local v78 = p_u_56.use_text
            local v79 = typeof(v78)
            if v79 == "string" or v79 == "table" then
                return p_u_56.use_text
            else
                return p_u_56.use_text(p_u_57, p_u_54.furniture, p_u_55, p_u_54)
            end
        end,
        ["part"] = p_u_55,
        ["tag"] = v76,
        ["offset"] = v74.small_model_interaction_anti_occlusion and Vector3.new(0, 3, 0) or nil
    }
    local v81
    if v74.small_model_interaction_anti_occlusion then
        v81 = p_u_54.furniture
    else
        v81 = nil
    end
    v80.anti_occlusion_mode_model = v81
    v80.horizontal_dist = v75.interaction_horizontal_dist or (v_u_27 == v_u_13.platform.phone and 6 or 10)
    function v80.on_selected(_, p_u_82)
        if v_u_6.is_visible("TradeApp") then
            return
        end
        local v83 = p_u_56.interaction_locking or {}
        local v84 = v83.is_locked
        local v85 = v83.on_attempt_locked_interaction
        if v84 and v84(p_u_57) then
            if v85 then
                v85()
            end
            return
        end
        local v_u_86 = p_u_56.roleplay_role_requirements
        if typeof(v_u_86) == "function" then
            v_u_86 = v_u_86(p_u_57, v_u_59, p_u_54.furniture)
        end
        if v_u_44(v_u_86) then
            local function v_u_102(p_u_87)
                local v88 = v_u_15.get_choices
                local v89 = {}
                local v90
                if p_u_87 then
                    v90 = false
                else
                    v90 = p_u_56.caregiver_assist
                end
                v89.caregiver_assist = v90
                v89.team_whitelist = p_u_56.team_whitelist
                v89.force_player = p_u_56.force_player
                v89.override_char_wrapper = p_u_82
                function v89.get_on_selected_callback(p91)
                    local v_u_92 = p91
                    local v_u_93 = p_u_87
                    return function(p_u_94)
                        local v_u_95 = v_u_92 == game.Players.LocalPlayer.Character
                        local v_u_96
                        if p_u_56.server_use then
                            v_u_96 = false
                            task.spawn(function()
                                local v97
                                if p_u_56.client_get_data_for_server_use then
                                    v97 = p_u_56.client_get_data_for_server_use(p_u_57, v_u_59, p_u_54.furniture, v_u_58, p_u_55, p_u_54, v_u_93)
                                    if v97 == nil then
                                        v_u_96 = true
                                        return
                                    end
                                else
                                    v97 = nil
                                end
                                local v98 = p_u_94
                                if typeof(v98) == "table" and p_u_94.is_override_payload then
                                    v97 = p_u_94.data
                                end
                                if v_u_95 then
                                    v_u_92 = game.Players.LocalPlayer.Character
                                end
                                local v99
                                if p_u_54.props.placeable then
                                    v99 = v_u_23.get_house_owner(v_u_92)
                                else
                                    v99 = v_u_58
                                end
                                if v99 then
                                    v_u_11.get("HousingAPI/ActivateFurniture"):InvokeServer(v99, v_u_59, p_u_55.Name, v97, v_u_92)
                                else
                                    v_u_11.get("HousingAPI/ActivateInteriorFurniture"):InvokeServer(v_u_59, p_u_55.Name, v97, v_u_92)
                                end
                                v_u_96 = true
                            end)
                        else
                            v_u_96 = true
                        end
                        if p_u_56.client_use then
                            p_u_56.client_use(p_u_57, v_u_59, p_u_54.furniture, v_u_92, p_u_55.name, p_u_54)
                        end
                        task.wait(0.3)
                        repeat
                            task.wait(0.1)
                        until v_u_96
                    end
                end
                v89.get_passive_on_selected_callback = v_u_72
                local v100, v101 = v88(v89)
                if #v100 == 0 and p_u_56.team_whitelist then
                    v_u_6.apps.HintApp:hint({
                        ["text"] = v101,
                        ["length"] = 4,
                        ["overridable"] = true,
                        ["yields"] = false
                    })
                end
                if #v100 == 1 then
                    return v100[1].on_selected
                else
                    return v100
                end
            end
            local v103 = {}
            local v104 = {}
            local v105 = p_u_56.use_text
            local v106 = typeof(v105)
            local v107
            if v106 == "string" or v106 == "table" then
                v107 = p_u_56.use_text
            else
                v107 = p_u_56.use_text(p_u_57, p_u_54.furniture, p_u_55, p_u_54)
            end
            v104.text = v107
            function v104.on_selected()
                return v_u_102(nil)
            end
            __set_list(v103, 1, {v104})
            if p_u_56.get_additional_choices then
                for _, v108 in p_u_56.get_additional_choices(v_u_102, v_u_58) do
                    table.insert(v103, v108)
                end
            end
            if #v103 == 1 then
                v103 = v103[1].on_selected
            end
            return v103
        end
        local v_u_109 = nil
        if v_u_86.building_id and v_u_86.role_id == nil then
            v_u_109 = v_u_16[v_u_86.building_id].roles
        elseif v_u_86.building_id and v_u_86.role_id then
            v_u_109 = { v_u_16[v_u_86.building_id].roles[v_u_86.role_id] }
        elseif v_u_86.building_id == nil and v_u_86.role_id then
            for _, v110 in v_u_16 do
                for v111, v112 in v110.roles do
                    if v111 == v_u_86.role_id then
                        v_u_109 = { v112 }
                        break
                    end
                end
            end
        else
            error("roleplay_role_requirements not supported. May need to specify both role_id and building_id.")
        end
        task.spawn(function()
            v_u_6.apps.MissingRoleApp:show_missing_roles(v_u_109, v_u_86.preferred_role_id)
        end)
        task.wait(0.5)
    end
    function v80.icon_replacement()
        local v113 = (p_u_56.interaction_locking or {}).is_locked
        if v113 and v113(p_u_57) then
            return "rbxassetid://9129583033"
        end
        local v114 = p_u_56.roleplay_role_requirements
        if typeof(v114) == "function" then
            v114 = v114(p_u_57, v_u_59, p_u_54.furniture)
        end
        return not v_u_44(v114) and "rbxassetid://9129583033" or nil
    end
    function v80.is_visible()
        local v115 = p_u_56.use_text
        local v116
        if typeof(v115) == "function" then
            v116 = p_u_56.use_text(p_u_57, p_u_54.furniture, p_u_55, p_u_54)
        else
            v116 = p_u_56.use_text
        end
        if not v116 then
            return false
        end
        local v117 = not p_u_56 or (not p_u_56.use_text or (v_u_58 == game.Players.LocalPlayer or (p_u_56.use_permissions == "EVERYONE" or not v_u_58)))
        if not v117 then
            if p_u_56.use_permissions == "FAMILY" then
                local v118 = v_u_58
                local v119 = v_u_12.get("family_list") or {}
                v117 = v_u_14.is_member(v119, v118)
                if v117 then
                    goto l7
                end
            end
            if p_u_56.use_permissions == "HOUSE_OWNER" then
                v117 = v_u_58 == game.Players.LocalPlayer
            else
                v117 = false
            end
        end
        ::l7::
        if not v117 then
            return false
        end
        if v_u_6.is_visible("TradeApp") then
            return false
        end
        local v120 = v_u_7.store:getState().house_editor_state
        local v121 = v_u_6.apps.FurnitureSelectorApp:is_selecting()
        if not (v_u_60 and p_u_56.hide_interaction_when_listed_for_trade) then
            local v122 = v120 ~= "Main" and v120 ~= "Disabled" and (v120 ~= "ViewingListedHouse" and not v121)
            if v122 then
                if v_u_27 == v_u_13.platform.phone then
                    v122 = false
                else
                    v122 = v_u_27 ~= v_u_13.platform.tablet
                end
            end
            return v122
        end
    end
    v80.closeness_priority = v75.interaction_closeness_priority
    v80.on_interaction_shown = v73
    local v123 = v77:register(v80)
    if p_u_56.is_critical then
        v_u_22.protect_critical_interaction(v123)
    elseif p_u_56.protect_interaction then
        v_u_22.protect_interaction(v123)
    end
    local v124 = p_u_54.interactions
    table.insert(v124, v123)
    return v70
end
local function v_u_128(p125, p126)
    if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        for _, v127 in ipairs(p125) do
            if v127.Name == p126 then
                return (v127.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 150
            end
        end
        return false
    end
end
function v_u_30.register_take_down_interaction(p_u_129)
    local v130 = p_u_129.furniture.PlacementBlock
    local v131 = v130.CFrame.LookVector * v130.Size.Z / 2 + Vector3.new(0, 1, 0)
    local v132 = v_u_10:register({
        ["text"] = "Take Down",
        ["part"] = v130,
        ["horizontal_dist"] = v_u_27 == v_u_13.platform.phone and 6 or 10,
        ["on_selected"] = function()
            if not v_u_6.is_visible("TradeApp") then
                v_u_11.get("ToolAPI/TakeDownToyFurniture"):InvokeServer(p_u_129.props.unique)
            end
        end,
        ["offset"] = v131,
        ["is_visible"] = function()
            return not v_u_6.is_visible("TradeApp")
        end
    })
    local v133 = p_u_129.interactions
    table.insert(v133, v132)
end
function v_u_30.make_usable(p_u_134, p135)
    p_u_134.interactions = p_u_134.interactions or {}
    p_u_134.last_on_selected_callback = nil
    local v136 = p135.player_that_placed_user_id
    if v136 and game.Players.LocalPlayer.UserId == v136 then
        p_u_134:register_take_down_interaction()
    end
    local v_u_137 = p_u_134.furniture:FindFirstChild("UseBlocks") and (p_u_134.furniture.UseBlocks:GetChildren() or {}) or {}
    if #v_u_137 ~= 0 then
        local v_u_138 = {}
        for _, v139 in pairs(v_u_137) do
            local v140 = v_u_41(v139:FindFirstChild("Configuration"))
            local v141 = v_u_8[p135.id] or v_u_8[v140.use_id]
            p_u_134.use_entry = v141
            local v142 = {}
            if v141 then
                if v141.use_text then
                    v142.default = v141
                else
                    for v143, v144 in pairs(v141) do
                        v142[v143] = v144
                    end
                end
                if v141.temp_init then
                    v141.temp_init(p135, p_u_134.furniture)
                end
            end
            local v145 = v142[v139.Name] or v142.default
            if v145 then
                local v146 = p_u_134:register_interaction(v139, v145, p135)
                v_u_138[v139.Name] = v146
                p_u_134.last_on_selected_callback = v146
            end
        end
        p_u_134.baby_should_use_furniture_connection = v_u_11.get("InteractablesAPI/BabyShouldUseFurniture").OnClientEvent:connect(function(p147, p148, p149)
            local v150 = v_u_24.await(p147, 5)
            if v150 then
                if p148 == p_u_134.props.unique then
                    if not v_u_128(v_u_137, p149) then
                        return
                    end
                    local v151 = v_u_138[p149]
                    if not v151 then
                        return
                    end
                    v151(v150)()
                end
            end
        end)
    end
end
function v_u_30.set_local_temp_state(p152, p153, p154)
    assert(p153, "No key provided")
    p152.temporary_client_data[p153] = p154
end
function v_u_30.get_local_temp_state(p155, p156)
    return p155.temporary_client_data[p156]
end
function v_u_30.use(p157, p158)
    if p157.last_on_selected_callback then
        p157.last_on_selected_callback(p158)()
    end
end
function v_u_30.get_house_owner(p159)
    return p159.props.player
end
local function v_u_165(p160, p161)
    if v_u_8[p160] then
        return v_u_8[p160]
    end
    local v162 = p161:FindFirstChild("UseBlocks") and p161.UseBlocks:GetChildren() or {}
    for _, v163 in pairs(v162) do
        local v164 = v_u_8[v_u_41(v163:FindFirstChild("Configuration")).use_id]
        if v164 then
            return v164
        end
    end
end
function v_u_30.update_furniture(p_u_166, p_u_167)
    local v_u_168 = p_u_166.props.furniture_data
    local v_u_169 = nil
    local v170 = p_u_167 and p_u_167.furniture_data
    if v170 then
        if p_u_167.furniture_data.player == v_u_168.player and p_u_167.house_id == p_u_166.props.house_id then
            v170 = p_u_167.interior_name == p_u_166.props.interior_name
        else
            v170 = false
        end
    end
    if v170 then
        v_u_169 = p_u_167.furniture_data
    end
    local v_u_171 = p_u_166.props.house_pos or Vector3.new()
    local v_u_172 = v_u_5[v_u_168.id]
    local v173 = v_u_168.id
    assert(v_u_172, ("FurnitureDB entry for %s does not exist. Maybe the static furniture was named incorrectly?"):format(v173))
    local v_u_174 = p_u_166.props.unique
    local _ = p_u_166.props.player
    local v_u_175 = p_u_166.props.is_house
    coroutine.wrap(function()
        p_u_166.update_furniture_crit:wait()
        p_u_166:delete(p_u_167)
        p_u_166.furniture = v_u_3.download("Furniture", v_u_172.model_name):clone()
        p_u_166.download_name = v_u_172.model_name
        p_u_166.furniture:SetAttribute("furniture_unique", v_u_174)
        p_u_166.furniture:SetAttribute("furniture_kind", v_u_168.id)
        v_u_9.pcall_print_error(function()
            p_u_166.furniture.PlacementBlock.CanCollide = false
            p_u_166.furniture.PlacementBlock.Transparency = 1
            local v176 = p_u_166.furniture:FindFirstChild("SnapSurfaces")
            if v176 then
                for _, v177 in v176:GetChildren() do
                    v177.CanCollide = false
                    v177.Transparency = 1
                end
            end
            local v178 = p_u_166.furniture:FindFirstChild("PlacementTops")
            if v178 then
                for _, v179 in pairs(v178:GetChildren()) do
                    v179.Transparency = 1
                    v179.CanCollide = false
                end
            end
            if v_u_168.colors then
                v_u_20.recolor_from_array(p_u_166.furniture, v_u_168.colors, true)
            end
            p_u_166.furniture.PrimaryPart = p_u_166.furniture.PlacementBlock
            if v_u_168.scale ~= nil and v_u_168.scale ~= 1 then
                v_u_18.get_scale_furniture_callback({
                    ["primary_furniture_model"] = p_u_166.furniture,
                    ["other_furniture_models"] = {}
                })(v_u_168.scale)
                v_u_17.register_model(p_u_166.furniture, v_u_168.scale)
            end
            if v_u_175 then
                p_u_166.furniture:PivotTo(CFrame.new(v_u_171) * v_u_168.cframe)
            else
                p_u_166.furniture:PivotTo(v_u_168.cframe)
            end
            local v180 = v_u_165(v_u_168.id, p_u_166.furniture)
            if v180 and v180.render then
                v180.render(v_u_168, p_u_166.furniture, v_u_174, v_u_169, p_u_166)
            end
            p_u_166.furniture.Parent = p_u_166.folder
            if v180 and v180.post_render then
                v180.post_render(v_u_168, p_u_166.furniture, v_u_174, v_u_169, p_u_166)
            end
            if v_u_168.animated_seats then
                p_u_166:render_animated_seats(v_u_168)
            end
            p_u_166:make_usable(v_u_168)
            v_u_21.register_furniture(v_u_174, p_u_166.furniture, v_u_168)
        end)
        p_u_166.update_furniture_crit:signal()
    end)()
end
function v_u_30.render_animated_seats(p_u_181, p_u_182)
    local function v_u_194(p183, p184)
        local v185 = p_u_181.furniture.UseBlocks:FindFirstChild(p184)
        local v186 = v185:FindFirstChild("SeatWeld")
        if v186 then
            v186:Destroy()
        end
        local v187 = v_u_19.get_team(p183)
        local v188 = v187 == "Pets" and p183.PetModel.PrimaryPart or p183.HumanoidRootPart
        local v189 = nil
        local v190 = p_u_182.char_offset
        if typeof(v190) == "CFrame" then
            v189 = p_u_182.char_offset
        else
            local v191 = p_u_182.char_offset
            if typeof(v191) == "table" then
                v189 = p_u_182.char_offset[v187]
            end
        end
        p183.HumanoidRootPart.Anchored = false
        local v192 = Instance.new("ObjectValue")
        v192.Name = "CharacterReference"
        v192.Value = p183
        local v193 = Instance.new("Weld")
        v193.Name = "SeatWeld"
        v193.C0 = v185.CFrame:inverse() * v185.PlayerCFrame.WorldCFrame * (v189 or CFrame.new())
        v188.CFrame = v193.C0 * v185.CFrame
        v193.Part0 = v185
        v193.Part1 = v188
        v192.Parent = v193
        v_u_26:AddTag(v193, "AnimatedSeatWeld")
        v193.Parent = v185
    end
    if p_u_181.promised_characters then
        for _, v195 in p_u_181.promised_characters do
            v195:cancel()
        end
    end
    p_u_181.promised_characters = {}
    local v196 = p_u_181.furniture.RootPart.CFrame
    for v_u_197, v198 in p_u_182.animated_seats do
        local v_u_199 = v_u_24.get_instance_by_id(v198)
        if v_u_199 then
            if v_u_199:IsDescendantOf(workspace) then
                v_u_194(v_u_199, v_u_197)
            else
                local v200 = p_u_181.promised_characters
                local v201 = v_u_25.fromEvent(v_u_199:GetPropertyChangedSignal("Parent"), function()
                    return v_u_199:IsDescendantOf(workspace)
                end)
                table.insert(v200, v201:andThen(function()
                    v_u_194(v_u_199, v_u_197)
                end))
            end
        end
    end
    v_u_25.all(p_u_181.promised_characters):andThen(function()
        return v_u_25.delay(0.2)
    end):await()
    if p_u_181.furniture then
        p_u_181.furniture.RootPart.CFrame = v196
    end
end
function v_u_30.shouldUpdate(p202, p203, _)
    return (p202.props.furniture_data.hash ~= p203.furniture_data.hash or (p202.props.player ~= p203.player or (p202.props.house_id ~= p203.house_id or p202.props.interior_name ~= p203.interior_name))) and true or p202.props.listed_for_trade ~= p203.listed_for_trade
end
function v_u_30.init(p204)
    p204.update_furniture_crit = v_u_4.new()
    p204.temporary_client_data = {}
    p204.use_block_name_mapped_to_get_on_selected_callback = {}
end
v_u_30.didUpdate = v_u_30.update_furniture
v_u_30.didMount = v_u_30.update_furniture
function v_u_30.willUnmount(p_u_205)
    spawn(function()
        p_u_205.update_furniture_crit:wait()
        p_u_205:delete()
        if p_u_205.download_name then
            v_u_3.release("Furniture", p_u_205.download_name)
        end
        p_u_205.update_furniture_crit:destroy()
    end)
end
function v_u_30.render(p_u_206)
    local _ = p_u_206.props
    return v_u_29("Folder", {
        [v_u_2.Ref] = function(p207)
            p_u_206.folder = p207
        end
    })
end
v28.AllFurniture = v_u_2.PureComponent:extend("AllFurniture")
function v28.AllFurniture.render(p208)
    local v209 = p208.props
    local v210 = v209.furniture or {}
    local v211 = v209.house_pos
    local v212 = v209.house_id
    local v213 = v209.interior_name
    local v214 = v209.player
    local v215 = v209.is_house
    local v216 = v209.listed_for_trade
    local v217 = {}
    for v218, v219 in pairs(v210) do
        local v220 = string.format("%s/%s/%s/%s/%s", tostring(v214), tostring(v212), tostring(v213), tostring(v215), (tostring(v218)))
        local v221 = v_u_29
        local v222 = v_u_30
        local v223 = {
            ["unique"] = v218,
            ["furniture_data"] = v219,
            ["house_pos"] = v211,
            ["house_id"] = v212,
            ["interior_name"] = v213,
            ["is_house"] = v215,
            ["listed_for_trade"] = v216,
            ["placeable"] = v219.placeable
        }
        local v224
        if v219.placeable then
            v224 = v219.player
        else
            v224 = v214
        end
        v223.player = v224
        v217[v220] = v221(v222, v223)
    end
    return v_u_29("Folder", {}, v217)
end
return v28