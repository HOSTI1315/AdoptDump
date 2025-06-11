--// ReplicatedStorage.ClientModules.Core.ClientStore (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Rodux")
local v_u_3 = v1("TableUtil")
local v_u_4 = v1("ClientData")
v1("Signal")
local v_u_5 = v1("WindowDB")
v1("Debug").create_log()
local v_u_6 = v1("FurnitureEditorTelemetry")
local v_u_7 = {}
local v_u_32 = {
    ["set_window_visibility"] = function(p8, p9)
        local v10 = v_u_3.deep_copy(p8.window_visibility or {})
        v10[p9.window_name] = p9.visible
        return v_u_3.merge(p8, {
            ["window_visibility"] = v10
        })
    end,
    ["map_server_data_to_client_store"] = function(p11, p12)
        return v_u_3.merge(p11, {
            [p12.key] = p12.value
        })
    end,
    ["anticipate_map_server_data_to_client_store"] = function(p13, p14)
        return v_u_3.merge(p13, {
            [p14.key] = p14.value
        })
    end,
    ["update_loaded_plots"] = function(p15, p16)
        local v17 = {}
        for _, v18 in pairs(p16.plots) do
            v17[v18.Name] = v18
        end
        return v_u_3.merge(p15, {
            ["loaded_plots"] = v17
        })
    end,
    ["set_house_edit_mode"] = function(p19, p20)
        local v21 = v_u_3.merge(p19, {
            ["house_editor_state"] = p20.value
        })
        if p20.value ~= "Edit" then
            v21.hide_confirmation_menu = nil
            v21.texture_preview = nil
        end
        if p19.house_editor_state == "Edit" or v21.house_editor_state ~= "Edit" then
            if p19.house_editor_state == "Edit" and v21.house_editor_state ~= "Edit" then
                v_u_6.reconcile_log_edit_session()
            end
            return v21
        else
            v_u_6.begin_log_edit_session()
            return v21
        end
    end,
    ["set_house_editor_hidden"] = function(p22, p23)
        return v_u_3.merge(p22, {
            ["house_editor_hidden"] = p23.value
        })
    end,
    ["set_texture_preview"] = function(p24, p25)
        local v26 = p25.value
        local v27 = p25.hide_confirmation_menu
        if v27 == nil then
            v27 = false
        end
        local v28 = v_u_3.merge(p24, {})
        if v26 == "NONE" then
            v28.texture_preview = nil
        elseif v26 then
            v28.texture_preview = v26
        end
        v28.hide_confirmation_menu = v27
        return v28
    end,
    ["set_spotlight"] = function(p29, p30)
        local v31 = v_u_3.merge(p29, {})
        v31.spotlight = p30.value
        return v31
    end
}
local function v_u_35(p33, p34)
    if v_u_32[p34.type] then
        return v_u_32[p34.type](p33, p34)
    else
        return p33
    end
end
function v_u_7.init()
    local v36 = {}
    for v37, v38 in pairs(v_u_5.windows) do
        v36[v37] = v38.visible
    end
    v_u_7.store = v_u_2.Store.new(v_u_35, {
        ["window_visibility"] = v36
    })
    v_u_4.DataChangedEvent:connect(function(p39, p40)
        v_u_7.store:dispatch({
            ["type"] = "map_server_data_to_client_store",
            ["key"] = p39,
            ["value"] = p40
        })
    end)
    for v41, v42 in pairs(v_u_4.get_data()[game.Players.LocalPlayer.Name]) do
        v_u_7.store:dispatch({
            ["type"] = "map_server_data_to_client_store",
            ["key"] = v41,
            ["value"] = v42
        })
    end
end
return v_u_7