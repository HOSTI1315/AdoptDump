--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfile (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v3 = v1("Class")
local v_u_4 = v1("ClientData")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("ColorThemeManager")
local v_u_7 = v1("PlayerProfileHelper")
local v_u_8 = v1("package:Sift")
local v_u_9 = v1("package:Promise")
local v_u_10 = game:GetService("UserService")
local v_u_11 = game:GetService("Players")
local v12 = v3("PlayerProfile")
function v12.__init(p_u_13, p14, p15, p16)
    p_u_13.maid = v_u_2.new()
    p_u_13.app = p15
    p_u_13.user_id = p14
    p_u_13.snapshot = p16
    local v17
    if p_u_13.snapshot then
        v17 = nil
    else
        v17 = v_u_11:GetPlayerByUserId(p14)
    end
    p_u_13.player = v17
    p_u_13.is_my_profile = p_u_13.player == v_u_11.LocalPlayer
    p_u_13.loading = true
    p_u_13:_refresh_profile_data()
    p_u_13:_load_profile_pic()
    p_u_13:_load_user_info()
    if p_u_13.is_my_profile then
        p_u_13:_save_properties({
            ["color"] = v_u_6.get_theme_color()
        })
        p_u_13.app:update_theme_color()
        p_u_13.maid:GiveTask(v_u_6.get_theme_changed_signal():Connect(function()
            p_u_13:_save_properties({
                ["color"] = v_u_6.get_theme_color()
            })
            if p_u_13.app then
                p_u_13.app:update_theme_color()
            end
        end))
    end
end
function v12._load_user_info(p_u_18)
    if p_u_18.player then
        p_u_18.username = p_u_18.player.Name
        p_u_18.display_name = p_u_18.player.DisplayName
        p_u_18.app:set_header_info({
            ["username"] = p_u_18.username,
            ["in_trade"] = v_u_4.get_server(p_u_18.player, "in_active_trade")
        })
    else
        local v_u_22 = v_u_9.try(function()
            local v19, v20 = pcall(function()
                return v_u_10:GetUserInfosByUserIdsAsync({ p_u_18.user_id })
            end)
            if not v19 then
                return {}
            end
            if v20 then
                v20 = v20[1]
            end
            return v20
        end):andThen(function(p21)
            if p_u_18.app.player_profile == p_u_18 then
                p_u_18.username = p21.Username
                p_u_18.display_name = p21.DisplayName
                p_u_18.app:set_header_info({
                    ["username"] = p_u_18.username
                })
            end
        end)
        p_u_18.maid:GiveTask(function()
            v_u_22:cancel()
        end)
    end
end
function v12._load_profile_pic(p_u_23)
    local v_u_27 = v_u_9.try(function()
        if not p_u_23.user_id or p_u_23.user_id < 0 then
            return ""
        end
        while true do
            local v24, v25 = game.Players:GetUserThumbnailAsync(p_u_23.user_id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
            if v25 then
                break
            end
            task.wait(2)
        end
        return v24
    end):andThen(function(p26)
        p_u_23.image_id = p26
        if p_u_23.app.player_profile == p_u_23 then
            p_u_23.app:set_header_info({
                ["profile_icon"] = p_u_23.image_id
            })
        end
    end)
    p_u_23.maid:GiveTask(function()
        v_u_27:cancel()
    end)
end
function v12._refresh_profile_data(p_u_28)
    p_u_28.loading = true
    local v_u_35 = v_u_9.try(function()
        if p_u_28.snapshot then
            return p_u_28.snapshot
        else
            return p_u_28.player and v_u_4.get_server(p_u_28.player, "player_profile") or v_u_5.get("PlayerProfileAPI/FetchProfile"):InvokeServer(p_u_28.user_id)
        end
    end):andThen(function(p29)
        if p29 then
            local v30 = {
                ["pages"] = {},
                ["stickers"] = {},
                ["properties"] = p29.properties or {}
            }
            for _, v31 in p29.pages or {} do
                local v32 = v31.page_index
                v30.stickers[v32] = v31.stickers
                local v33 = v30.pages[v32] or {}
                for _, v34 in v31.widgets do
                    v33[v34.slot] = v34.data
                end
                v30.pages[v32] = v33
            end
            p_u_28.profile_data = v30
        else
            p_u_28.profile_data = p_u_28.profile_data or {}
        end
    end):finally(function()
        p_u_28.loading = false
        if not p_u_28.app.player_profile or p_u_28.app.player_profile == p_u_28 then
            p_u_28.app:on_load_complete()
        end
    end)
    p_u_28.maid:GiveTask(function()
        v_u_35:cancel()
    end)
end
function v12._save_slot(p36, p37, p38)
    if p36.player == game.Players.LocalPlayer then
        if p37 and p38 then
            local v39 = p36:get_slot_data(p37, p38)
            if v39 then
                v39.temp_data = nil
            end
            v_u_5.get("PlayerProfileAPI/SaveProfileSlot"):FireServer(p37, p38, v39)
        end
    end
end
function v12._save_properties(p40, p41)
    if p40.player == game.Players.LocalPlayer then
        for v42, v43 in p41 do
            p40.profile_data.properties[v42] = v43
        end
        v_u_5.get("PlayerProfileAPI/UpdateProfileProperties"):FireServer(p41)
    end
end
function v12.is_page_empty(p44, p45)
    local v46 = p44.profile_data and p44.profile_data.pages
    if v46 then
        v46 = p44.profile_data.pages[p45]
    end
    if v46 then
        for _, v47 in v46 do
            if next(v47) then
                return false
            end
        end
    end
    local v48 = p44.profile_data.stickers
    return not (v48 and (v48[p45] and next(v48[p45])))
end
function v12.get_sticker_data(p49)
    local v50 = p49.profile_data
    if v50 then
        v50 = p49.profile_data.stickers
    end
    return v50
end
function v12.get_property(p51, p52)
    if p51.profile_data and p51.profile_data.properties then
        return p51.profile_data.properties[p52]
    else
        return nil
    end
end
function v12.render_slot(p53, p54, p55)
    if p53.app:get_page() == p54 then
        if p53.app.player_profile == p53 then
            local v56 = p53:get_slot_data(p54, p55)
            p53.app:load_slot(v56, p55)
        end
    else
        return
    end
end
function v12.update_slot_data(p57, p58, p59, p60, p61)
    if p57.player == game.Players.LocalPlayer or p61 then
        if p58 then
            p58 = v_u_8.Dictionary.copyDeep(p58)
        end
        if not p61 then
            local v62
            if p58 then
                v62 = p58.temp_data
            else
                v62 = p58
            end
            if p58 then
                p58.temp_data = nil
            end
            local v63, v64 = v_u_7.validate_slot_data(p58)
            if not v63 then
                warn(v64, p59, p60, p58)
                p57:render_slot(p59, p60)
                return
            end
            if p58 then
                p58.temp_data = v62
            end
        end
        p57.profile_data = p57.profile_data or {}
        p57.profile_data.pages = p57.profile_data.pages or {}
        p57.profile_data.pages[p59] = p57.profile_data.pages[p59] or {}
        p57.profile_data.pages[p59][p60] = p58
        if not p61 then
            p57:_save_slot(p59, p60)
        end
    end
end
function v12.get_slot_data(p65, p66, p67)
    local v68 = p65.profile_data and p65.profile_data.pages
    if v68 then
        v68 = p65.profile_data.pages[p66]
    end
    if v68 then
        v68 = v68[p67]
    end
    if v68 then
        return v_u_8.Dictionary.copyDeep(v68)
    else
        return nil
    end
end
function v12.remove_widget(p69, p70, p71)
    p69:update_slot_data(nil, p70, p71)
    p69:render_slot(p70, p71)
end
function v12.swap_slots(p72, p73, p74, p75, p76, p77)
    local v78 = p72.app.editing_slot
    local v79 = p72:get_slot_data(p73, p74)
    local v80 = p72:get_slot_data(p75, p76)
    local v81
    if v79 then
        v81 = v79.expanded
    else
        v81 = v79
    end
    local v82
    if v80 then
        v82 = v80.expanded
    else
        v82 = v80
    end
    p72:update_slot_data(v80, p73, p74)
    p72:update_slot_data(v79, p75, p76)
    p72:render_slot(p73, p74)
    p72:render_slot(p75, p76)
    if not p77 or p77.keep_expansion ~= true then
        p72:set_slot_expanded(p73, p74, v81, {
            ["no_tween"] = true
        })
        p72:set_slot_expanded(p75, p76, v82, {
            ["no_tween"] = true
        })
    end
    if p72.app:get_page() == p73 and p73 == p75 then
        if v78 == p74 then
            p72.app:edit_widget(p76, p72.app.is_editing_profile)
        elseif v78 == p76 then
            p72.app:edit_widget(p74, p72.app.is_editing_profile)
        end
    else
        return
    end
end
function v12.set_slot_expanded(p83, p84, p85, p86, p87)
    local v88 = p83:get_slot_data(p84, p85)
    if v88 ~= nil then
        local v89 = v_u_7.is_slot_expandable(v88) and p86 and p86 or nil
        if v89 ~= v88.expanded then
            v88.expanded = v89
            p83:update_slot_data(v88, p84, p85)
            if p83.app:get_page() ~= p84 then
                return
            end
            p83.app:set_slot_expanded(p85, p86, p87)
        end
    end
end
function v12.save_sticker_data(p90, p91, p92, p93)
    if p90.player == game.Players.LocalPlayer then
        p90.profile_data = p90.profile_data or {}
        p90.profile_data.stickers = p90.profile_data.stickers or {}
        p90.profile_data.stickers[p91] = p90.profile_data.stickers[p91] or {}
        p90.profile_data.stickers[p91][p92] = p93
        v_u_5.get("PlayerProfileAPI/UpdateProfileStickers"):FireServer(p91, p92, p93)
    end
end
function v12.destroy(p94)
    p94.maid:Destroy()
end
return v12