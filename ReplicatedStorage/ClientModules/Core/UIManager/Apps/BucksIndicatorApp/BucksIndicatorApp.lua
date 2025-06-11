--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BucksIndicatorApp (ModuleScript)

game:GetService("ProximityPromptService")
local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("CurrencyIndicatorBaseApp")
local v4 = v2("BucksIndicatorApp", v_u_3)
local v_u_5 = v1("TimeZoneHelper")
local v_u_6 = v1("FriendsClient")
local v_u_7 = v1("CloudValues")
local v_u_8 = v1("LiveOpsTime")
local v_u_9 = v1("package:Sift")
function v4.set_multiplier(p10, p11, p12)
    local v13 = p10.instance.CurrencyIndicator.Container.Multiplier
    v13.Visible = p12 > 0
    local v14 = v13.MultiplierType
    local v15 = v13.Amount
    v14.ImageId = p11
    v15.Text = ("%*x"):format(p12)
end
function v4.is_multiplier_active(_)
    local v16 = v_u_7:getValue("friend_multiplier", "enabled")
    if v16 then
        v16 = v_u_7:getValue("friend_multiplier", "schedule")
    end
    local v17 = v_u_8.now()
    if not v16 then
        return false
    end
    local v18 = v16.start_time
    local v19 = v16.expiration_time
    local v20 = v_u_5.from_timezone_datetime("PST", v18.year, v18.month, v18.day, v18.hour, v18.minute).UnixTimestamp
    local v21 = v_u_5.from_timezone_datetime("PST", v19.year, v19.month, v19.day, v19.hour, v19.minute).UnixTimestamp
    local v22
    if v20 < v17 then
        v22 = v17 < v21
    else
        v22 = false
    end
    return v22
end
function v4.set_multiplier_visible(p23, p24)
    p23.instance.CurrencyIndicator.Container.Multiplier.Visible = p24
end
function v4.start(p_u_25)
    v_u_3.start(p_u_25, "money", "%s")
    local v26 = p_u_25.instance.CurrencyIndicator
    v26.LayoutOrder = 1000
    p_u_25.UIManager.apps.SharedLayoutsApp:register_to_topbar(v26, {
        ["padding_top"] = UDim.new(0, -5),
        ["on_press"] = function()
            v_u_3.on_click(p_u_25)
        end
    })
    local function v_u_32()
        local v27 = v_u_9.Dictionary.count(v_u_6.get_friends():expect().server)
        local v28 = v_u_7:getValue("friend_multiplier", "friend_count_required")
        local v29 = p_u_25:is_multiplier_active()
        local v30 = v28 <= v27
        p_u_25:set_multiplier_visible(v29 and v30)
        local v31 = p_u_25.UIManager.apps.FriendMultiplierApp
        if v29 then
            v29 = not v30
        end
        v31:set_visibility(v29)
    end
    v_u_6.get_friends_in_server_changed_signal():Connect(v_u_32)
    v_u_7:onChange(v_u_32)
    task.defer(function()
        while true do
            v_u_32()
            task.wait(1)
        end
    end)
end
return v4