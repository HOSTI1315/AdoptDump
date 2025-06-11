--// ReplicatedStorage.SharedModules.PlayerProfiles.PlayerProfileHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.new.modules.Utf8Tools)
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v_u_2("SharedConstants")
local v_u_3 = v_u_2("PlayerProfileWidgetsDB")
local v_u_4 = v_u_2("package:Promise")
local v_u_5 = v_u_2("package:Sift")
local v_u_6 = game:GetService("RunService")
local v_u_34 = {
    ["get_neighboring_index"] = function(p7)
        if p7 % 2 == 0 then
            return p7 - 1
        else
            return p7 + 1
        end
    end,
    ["limit_textbox_length"] = function(p_u_8, p_u_9)
        local v_u_10 = p_u_8.Text
        local v_u_11 = false
        p_u_8.MaxVisibleGraphemes = p_u_9
        p_u_8:GetPropertyChangedSignal("Text"):Connect(function()
            if v_u_11 then
                return
            else
                local v12 = {
                    ["limit_graphemes"] = p_u_9
                }
                local v13, v14, _ = v_u_1.sanitize_and_check_length(p_u_8.Text, v12)
                if v13 then
                    v_u_10 = v14
                else
                    v_u_2("UIManager").apps.HintApp:hint({
                        ["text"] = "Your text is too long",
                        ["overridable"] = true,
                        ["length"] = 2.5,
                        ["yields"] = false
                    })
                    v_u_11 = true
                    p_u_8.Text = v_u_10
                    v_u_11 = false
                end
            end
        end)
    end,
    ["filter_text_promise"] = function(p_u_15)
        local v16 = v_u_6:IsClient()
        assert(v16, "This API can only be called on the client.")
        return v_u_4.try(function()
            if p_u_15 ~= nil then
                return v_u_2("RouterClient").get("PlayerProfileAPI/FilterText"):InvokeServer(p_u_15)
            end
        end)
    end,
    ["get_widget_entry"] = function(p17)
        if p17 then
            p17 = v_u_3[p17]
        end
        return p17
    end,
    ["get_widget_entry_from_slot_data"] = function(p18)
        if p18 then
            p18 = v_u_34.get_widget_entry(p18.widget_kind)
        end
        return p18
    end,
    ["is_slot_expandable"] = function(p19)
        local v20 = v_u_34.get_widget_entry_from_slot_data(p19)
        if v20 then
            v20 = v20.expandable
        end
        return v20 == true
    end,
    ["modify_slot_data"] = function(p21, p22, p23, p24, p25)
        local v26 = v_u_6:IsServer()
        assert(v26, "This API can only be called on the server.")
        assert(p21, "No player arg passed")
        if p24 == nil then
            return
        end
        local v27 = v_u_34.get_widget_entry_from_slot_data(p24)
        if not v27 then
            return
        end
        if p24.widget_data and v27.server_modifier then
            local v28 = v_u_2("DataM").get_store(p21):get("player_profile") or {}
            local v29 = nil
            for _, v30 in v28 and v28.pages or {} do
                if v30.page_index == p22 then
                    for _, v31 in v30.widgets or {} do
                        if v31.slot == p23 then
                            v29 = v31.data
                            if v29 then
                                v29 = v31.data.widget_data
                            end
                            break
                        end
                    end
                    break
                end
            end
            p24.widget_data = v27.server_modifier(p24.widget_data, p21, p25, v29)
        end
        return p24
    end,
    ["validate_slot_data"] = function(p32)
        if p32 == nil then
            return true
        else
            local v33 = v_u_34.get_widget_entry_from_slot_data(p32)
            if v33 then
                if p32.widget_data and (v33.validate_properties and not v33.validate_properties(p32.widget_data)) then
                    return false, "could not validate save properties"
                else
                    return true
                end
            else
                return false, "invalid widget entry"
            end
        end
    end
}
local function v_u_42(p35)
    local v36 = {}
    for v37, v38 in p35 do
        if v37 ~= "unique_id" and v37 ~= "properties" then
            v36[v37] = v38
        end
    end
    local v39 = {
        ["flyable"] = "boolean",
        ["rideable"] = "boolean",
        ["neon"] = "boolean",
        ["mega_neon"] = "boolean",
        ["age"] = "number"
    }
    if p35.properties then
        v36.properties = {}
        for v40, v41 in p35.properties do
            if v41 and typeof(v41) == v39[v40] then
                v36.properties[v40] = v41
            end
        end
    end
    return v36
end
function v_u_34.trim_trade_record(p43, p44)
    local v45 = {}
    local v46 = {}
    for v47, v48 in p43.sender_items do
        v45[v47] = v_u_42(v48)
    end
    for v49, v50 in p43.recipient_items do
        v46[v49] = v_u_42(v50)
    end
    local v51 = {
        ["trade_id"] = p43.trade_id,
        ["sender_items"] = v_u_5.Dictionary.copyDeep(v45),
        ["recipient_items"] = v_u_5.Dictionary.copyDeep(v46)
    }
    local v52
    if p44.Name == p43.sender_name then
        v52 = p43.sender_name
    else
        v52 = nil
    end
    v51.sender_name = v52
    local v53
    if p44.Name == p43.recipient_name then
        v53 = p43.recipient_name
    else
        v53 = nil
    end
    v51.recipient_name = v53
    return v51
end
return v_u_34