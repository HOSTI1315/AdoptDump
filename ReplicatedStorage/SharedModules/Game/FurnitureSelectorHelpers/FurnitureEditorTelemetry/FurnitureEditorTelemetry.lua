--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureEditorTelemetry (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("RunService")
local v_u_4 = game:GetService("HttpService")
local v5 = {}
if not v3:IsServer() then
    local v_u_6 = v_u_1("RouterClient")
    local function v_u_9()
        local v7 = v_u_1("FurnitureXRay")
        local v8 = v_u_1("UIManager").apps.FurnitureSelectorApp
        return {
            ["xray"] = v7.is_enabled(),
            ["grid_size"] = v8:get_placement_grid_size(),
            ["handle_mode"] = v8:get_flag("handle_mode")
        }
    end
    function v5.begin_log_edit_session()
        local v10 = {}
        local v11 = v_u_1("HouseClient")
        local v12 = v_u_1("FriendsClient")
        local v13 = v11.get_current_house_owner()
        v10.house_type = v13 == v_u_2.LocalPlayer and "mine" or (v12.promise_get_is_friends_with(v13.UserId):expect() and "friend" or "stranger")
        v_u_6.get("HousingAPI/SendHousingOnePointOneLog"):FireServer("edit_state_entered", v10)
    end
    function v5.reconcile_log_edit_session()
        v_u_6.get("HousingAPI/SendHousingOnePointOneLog"):FireServer("edit_state_exited", {})
    end
    function v5.log_billboard_button_click(p14)
        v_u_6.get("HousingAPI/SendHousingOnePointOneLog"):FireServer("button_clicked", {
            ["button_name"] = p14,
            ["button_type"] = "billboard"
        })
    end
    function v5.log_nav_bar_button_click(p15)
        v_u_6.get("HousingAPI/SendHousingOnePointOneLog"):FireServer("button_clicked", {
            ["button_name"] = p15,
            ["button_type"] = "navbar"
        })
    end
    function v5.log_tool_toggled_changes(p16)
        local v17 = v_u_9()
        p16()
        local v18 = v_u_9()
        local v19 = 0
        local v20 = {}
        for v21, v22 in v18 do
            if v17[v21] ~= v22 then
                v19 = v19 + 1
                v20[v21] = v17[v21]
            end
        end
        if v19 == 1 then
            local v23 = {}
            for v24, v25 in v18 do
                v23["snapshot_" .. v24] = v25
            end
            local v26, _ = next(v20)
            v23.what_was_changed = v26
            v23.prev_value = v17[v26]
            v23.now_value = v18[v26]
            v_u_6.get("HousingAPI/SendHousingOnePointOneLog"):FireServer("edit_tool_changed", v23)
        elseif v19 > 1 then
            warn("Housing tool toggled changes: Too many changed values found", v20)
        end
    end
    return v5
end
local v_u_27 = v_u_1("package:Sift")
local v_u_28 = v_u_1("package:Stash")
local v_u_29 = {}
local function v_u_33(p30, _)
    local v31 = v_u_29[p30]
    if v31 then
        local v32 = {
            ["edit_session_id"] = v31.guid,
            ["time_in_edit_mode"] = workspace:GetServerTimeNow() - v31.timestamp,
            ["compressed"] = nil
        }
        v_u_28:log("housing_edit_state_exited", v_u_27.Dictionary.merge(v32, {
            ["user_id"] = p30.UserId,
            ["version"] = 1.1
        }))
    end
    v_u_29[p30] = nil
end
local function v_u_38(p34, p35)
    v_u_33(p34, {})
    local v36 = {
        ["guid"] = v_u_4:GenerateGUID(false),
        ["timestamp"] = workspace:GetServerTimeNow(),
        ["received_logs"] = {}
    }
    local v37 = {
        ["edit_session_id"] = v36.guid,
        ["house_type"] = p35.house_type
    }
    v_u_28:log("housing_edit_state_entered", v_u_27.Dictionary.merge(v37, {
        ["user_id"] = p34.UserId,
        ["version"] = 1.1
    }))
    v_u_29[p34] = v36
end
local function v_u_44(p39, p40, p41)
    local v42 = v_u_29[p39]
    if v42 then
        local v43 = v_u_27.Dictionary.merge(p41, {
            ["edit_session_id"] = v42.guid
        })
        v_u_28:log("housing_" .. p40, v_u_27.Dictionary.merge(v43, {
            ["user_id"] = p39.UserId,
            ["version"] = 1.1
        }))
    end
end
function v5.receive_log(p45, p46, p47)
    if p46 == "edit_state_entered" then
        v_u_38(p45, p47)
        return
    elseif p46 == "edit_state_exited" then
        v_u_33(p45, p47)
    else
        v_u_44(p45, p46, p47)
    end
end
function v5.init()
    v_u_2.PlayerRemoving:Connect(function(p48)
        v_u_33(p48, {})
    end)
end
return v5