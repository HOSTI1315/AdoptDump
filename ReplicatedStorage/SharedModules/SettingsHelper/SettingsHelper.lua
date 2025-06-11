--// ReplicatedStorage.SharedModules.SettingsHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("SettingsDB")
local v_u_3 = v_u_1("Signal")
local v4 = v_u_1("package:t")
local v_u_5 = v_u_1("package:Sift")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = game:GetService("RunService")
local v_u_8 = v_u_3.new()
local v_u_9 = v4.strictInterface({
    ["player"] = v4.optional(v4.instanceIsA("Player")),
    ["setting_id"] = v4.string,
    ["use_default"] = v4.optional(v4.boolean),
    ["use_transform"] = v4.optional(v4.boolean)
})
local v_u_10 = v4.strictInterface({
    ["player"] = v4.instanceIsA("Player"),
    ["setting_id"] = v4.string,
    ["use_default"] = v4.optional(v4.boolean),
    ["use_transform"] = v4.optional(v4.boolean)
})
local v_u_11 = v4.strictInterface({
    ["setting_id"] = v4.string,
    ["value"] = v4.any
})
local v_u_12 = {
    ["use_default"] = true,
    ["use_transform"] = true
}
local v_u_44 = {
    ["get_setting_server"] = function(p13)
        local v14 = v_u_5.Dictionary.merge(v_u_12, p13)
        if v_u_7:IsServer() then
            local v15 = v_u_10(v14)
            assert(v15, "Invalid options passed for get setting server.")
            local v16 = v_u_2.by_id[v14.setting_id]
            local v17 = v14.setting_id
            assert(v16, ("%s does not have a valid entry in the settings DB"):format(v17))
            local v18 = v_u_1("DataM").get_store(v14.player)
            if v18 then
                local v19 = (v18:get("settings_2021") or {})[v16.id]
                if v19 == nil and v14.use_default or v14.use_default == nil then
                    v19 = v16.default
                end
                if v14.use_transform then
                    return true, v16.transform(v19)
                else
                    return true, v19
                end
            else
                return false, nil
            end
        else
            local v20 = v_u_9(v14)
            assert(v20, "Invalid options passed for get setting server.")
            local v21 = v_u_2.by_id[v14.setting_id]
            local v22 = v14.setting_id
            assert(v21, ("%s does not have a valid entry in the settings DB"):format(v22))
            local v23 = v_u_1("ClientData")
            local v24
            if v14.player and v21.replicate_to_all_clients then
                v24 = (v23.get_server(v14.player, "replicated_settings_2021") or {})[v21.id]
            else
                v24 = (v23.get("settings_2021") or {})[v21.id]
            end
            if v24 == nil and v14.use_default or v14.use_default == nil then
                v24 = v21.default
            end
            if v14.use_transform then
                return v21.transform(v24)
            else
                return v24
            end
        end
    end,
    ["get_setting_client"] = function(p25)
        if v_u_7:IsServer() then
            error("This function cannot be called on the server", 2)
        end
        if p25.type == "Hidden" then
            return v_u_44.get_setting_server(p25)
        else
            local v26 = v_u_5.Dictionary.merge(v_u_12, p25)
            local v27 = v_u_9(v26)
            assert(v27, "Invalid options passed for get setting client.")
            local v28 = v_u_2.by_id[v26.setting_id]
            local v29 = v26.setting_id
            assert(v28, ("%s does not have a valid entry in the settings DB"):format(v29))
            local v30 = v_u_1("UIManager").apps.SettingsApp:get_setting(v28.id)
            if v30 == nil and v26.use_default or v26.use_default == nil then
                v30 = v28.default
            end
            if v26.use_transform then
                return v28.transform(v30)
            else
                return v30
            end
        end
    end,
    ["set_setting_client"] = function(p31)
        if v_u_7:IsServer() then
            error("This function can only be called on the client", 2)
        end
        local v32 = p31.type ~= "Hidden"
        assert(v32, "Hidden settings cannot be set through SettingsHelper, use SettingsAPI.SetSetting instead")
        local v33 = v_u_11(p31)
        assert(v33, "Invalid options passed for set setting client.")
        v_u_1("UIManager").apps.SettingsApp:set_setting(p31.setting_id, p31.value)
    end,
    ["promise_setting_changed_signal"] = function(p_u_34)
        if not v_u_7:IsServer() then
            return v_u_6.new(function(p35)
                local v36 = v_u_1("UIManager")
                v36.wait_for_initialization()
                p35(v36.apps.SettingsApp:_get_setting_updated_signal(p_u_34))
            end)
        end
        local v_u_37 = v_u_3.new()
        v_u_8:Connect(function(p38, p39, p40)
            if p39 == p_u_34 then
                v_u_37:Fire(p38, p40)
            end
        end)
        return v_u_6.resolve(v_u_37)
    end,
    ["on_server_setting_changed"] = function(p41, p42, p43)
        v_u_8:Fire(p41, p42, p43)
    end
}
return v_u_44