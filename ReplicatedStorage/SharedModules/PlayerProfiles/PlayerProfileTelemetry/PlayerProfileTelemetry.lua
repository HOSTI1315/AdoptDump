--// ReplicatedStorage.SharedModules.PlayerProfiles.PlayerProfileTelemetry (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("RunService")
local v_u_4 = game:GetService("HttpService")
local v5 = {}
if v3:IsServer() then
    local v_u_6 = v_u_1("package:Sift")
    local v_u_7 = v_u_1("package:Stash")
    local v_u_8 = {}
    local function v_u_15(p9, _)
        local v10 = v_u_8[p9]
        if v10 then
            local v11 = 0
            for _, v12 in v10.viewed_pages do
                if v12 then
                    v11 = v11 + 1
                end
            end
            local v13 = v_u_8[p9]
            if v13 and v13.sticker_timestamp then
                v13.sticker_duration = (v13.sticker_duration or 0) + workspace:GetServerTimeNow() - v13.sticker_timestamp
                v13.sticker_timestamp = nil
            end
            local v14 = {
                ["profile_session_id"] = v10.guid,
                ["sticker_time"] = v10.sticker_duration,
                ["edit_time"] = v10.edit_duration,
                ["time_spent"] = workspace:GetServerTimeNow() - v10.timestamp,
                ["pages_viewed"] = v11
            }
            v_u_7:log("profile_closed", v_u_6.Dictionary.merge(v14, {
                ["user_id"] = p9.UserId
            }))
        end
        v_u_8[p9] = nil
    end
    local function v_u_20(p16, p17)
        v_u_15(p16, {})
        local v18 = {
            ["guid"] = v_u_4:GenerateGUID(false),
            ["timestamp"] = workspace:GetServerTimeNow(),
            ["received_logs"] = {},
            ["viewed_pages"] = {}
        }
        local v19 = {
            ["profile_session_id"] = v18.guid,
            ["profile_owner_user_id"] = p17.profile_owner_user_id,
            ["profile_type"] = p17.profile_type
        }
        v_u_7:log("profile_opened", v_u_6.Dictionary.merge(v19, {
            ["user_id"] = p16.UserId
        }))
        v_u_8[p16] = v18
    end
    function v5.receive_log(p21, p22, p23)
        if p22 == "opened" then
            v_u_20(p21, p23)
            return
        elseif p22 == "closed" then
            v_u_15(p21, p23)
        elseif p22 == "toggle_sticker_editing" then
            local v24 = p23.editing
            local v25 = v_u_8[p21]
            if not v25 then
                return
            end
            if v24 then
                v25.sticker_timestamp = v25.sticker_timestamp or workspace:GetServerTimeNow()
                return
            end
            if v25.sticker_timestamp then
                v25.sticker_duration = (v25.sticker_duration or 0) + workspace:GetServerTimeNow() - v25.sticker_timestamp
                v25.sticker_timestamp = nil
                return
            end
        elseif p22 == "toggle_editing" then
            local v26 = p23.editing
            local v27 = v_u_8[p21]
            if not v27 then
                return
            end
            if v26 then
                v27.edit_timestamp = v27.edit_timestamp or workspace:GetServerTimeNow()
                return
            end
            if v27.edit_timestamp then
                v27.edit_duration = (v27.edit_duration or 0) + workspace:GetServerTimeNow() - v27.edit_timestamp
                v27.edit_timestamp = nil
                return
            end
        else
            if p22 == "viewed_page" then
                local v28 = p23.page
                local v29 = v_u_8[p21]
                if v29 then
                    v29.viewed_pages[v28] = true
                end
            end
            local v30 = v_u_8[p21]
            if v30 then
                local v31 = v_u_6.Dictionary.merge(p23, {
                    ["profile_session_id"] = v30.guid
                })
                v_u_7:log("profile_" .. p22, v_u_6.Dictionary.merge(v31, {
                    ["user_id"] = p21.UserId
                }))
            end
        end
    end
    function v5.init()
        v_u_2.PlayerRemoving:Connect(function(p32)
            v_u_15(p32, {})
        end)
    end
    return v5
end
local v_u_33 = v_u_1("RouterClient")
local v_u_34 = v_u_1("package:Sift")
function v5.begin_log_session(p35)
    local v36 = {
        ["profile_owner_user_id"] = p35
    }
    local v37 = v_u_1("FriendsClient")
    v36.profile_type = p35 == v_u_2.LocalPlayer.UserId and "mine" or (v37.promise_get_is_friends_with(p35):expect() and "friend" or "stranger")
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer("opened", v36)
end
function v5.reconcile_log_session()
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer("closed", {})
end
function v5.toggle_sticker_editing(p38)
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer("toggle_sticker_editing", {
        ["editing"] = p38
    })
end
function v5.toggle_editing(p39)
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer("toggle_editing", {
        ["editing"] = p39
    })
end
function v5.trade_initiated(p40)
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer("trade_initiated", {
        ["recipient"] = p40
    })
end
function v5.viewed_page(p41)
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer("viewed_page", {
        ["page"] = p41
    })
end
function v5.log_widget_edited(p42, p43, p44)
    local v45 = {
        ["widget_kind"] = p42.kind or p42.entry.kind,
        ["page"] = p42.page,
        ["slot"] = p42.slot
    }
    if p44 then
        v45 = v_u_34.Dictionary.merge(v45, p44)
    end
    local v46 = "widget_" .. p43
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer(v46, v45)
end
function v5.log_sticker_edited(p47, p48, p49)
    local v50 = {
        ["unique_id"] = p47.unique,
        ["kind"] = p47.kind,
        ["page"] = p48
    }
    if p49 == "edited" then
        v50 = v_u_34.Dictionary.merge(v50, p47)
        v50.last_edit = nil
        v50.unique = nil
    end
    local v51 = "sticker_" .. p49
    v_u_33.get("PlayerProfileAPI/SendPlayerLog"):FireServer(v51, v50)
end
return v5