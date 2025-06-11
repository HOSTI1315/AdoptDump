--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerChooserApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
v1("PlatformM")
v1("RouterClient")
local v_u_3 = v1("XboxSupport")
local v4 = v1("Class")
local v_u_5 = v1("TableUtil")
local v_u_6 = v1("Set")
local v_u_7 = v1("package:Promise")
local v_u_8 = game:GetService("Players")
local v9 = v4("PlayerChooserApp", v1("UIBaseApp"))
local v_u_10 = {}
local v_u_12 = v_u_7.promisify(function(p11)
    if p11 > 0 then
        return v_u_8:GetNameFromUserIdAsync(p11)
    else
        return "USER_ID_" .. tostring(p11)
    end
end)
local v_u_14 = v_u_7.promisify(function(p13)
    return v_u_8.LocalPlayer:IsFriendsWith(p13)
end)
local function v_u_17(p_u_15)
    if typeof(p_u_15) == "Instance" then
        return {
            ["type"] = "player",
            ["user_id"] = p_u_15.UserId,
            ["name"] = p_u_15.Name
        }
    end
    if typeof(p_u_15) == "number" then
        if not v_u_10[p_u_15] then
            local v16 = v_u_12(p_u_15)
            v16:catch(function(_)
                v_u_10[p_u_15] = nil
            end)
            v_u_10[p_u_15] = v16
        end
        return {
            ["type"] = "player",
            ["user_id"] = p_u_15,
            ["name_promise"] = v_u_10[p_u_15]:timeout(5)
        }
    end
    error("Unknown type " .. typeof(p_u_15) .. " to new_player_entry(player), expected Player or number")
end
local function v_u_24(p18, p19, p20)
    local v21 = {}
    for _, v22 in ipairs(p19) do
        if not p20 or p20(v22) then
            local v23 = v_u_17
            table.insert(v21, v23(v22))
        end
    end
    return {
        ["name"] = p18,
        ["players"] = v21
    }
end
local function v_u_29(p25)
    local v26 = {}
    for v27, v28 in ipairs(p25) do
        if typeof(v28) == "Instance" then
            v26[v27] = v28.UserId
        else
            v26[v27] = v28
        end
    end
    return v26
end
local v_u_52 = {
    ["family"] = function(p30)
        local v31 = v_u_2.get("family_list") or {}
        local v32 = v_u_5.shallow_copy(v31)
        table.sort(v32, function(p33, p34)
            return p33.Name < p34.Name
        end)
        return v_u_24("Family", v32, p30)
    end,
    ["playing_friends"] = function(p_u_35)
        local v36 = v_u_8:GetPlayers()
        table.sort(v36, function(p37, p38)
            return p37.Name < p38.Name
        end)
        local v_u_39 = {}
        local v40 = {}
        for _, v_u_41 in ipairs(v36) do
            local v44 = v_u_14(v_u_41.UserId):timeout(5):andThen(function(p42)
                v_u_39[v_u_41] = p42
            end):catch(function(p43)
                warn("LocalPlayer:IsFriendsWith(", v_u_41.UserId, ") failed because", p43)
            end)
            table.insert(v40, v44)
        end
        v_u_7.all(v40):await()
        return v_u_24("Friends", v36, function(p45)
            if p_u_35(p45) then
                return v_u_39[p45]
            else
                return false
            end
        end)
    end,
    ["all"] = function(p46)
        local v47 = v_u_8:GetPlayers()
        table.sort(v47, function(p48, p49)
            return p48.Name < p49.Name
        end)
        return v_u_24("Everyone", v47, p46)
    end,
    ["custom"] = function(p50, p51)
        return v_u_24(p51.name, p51.players, p50)
    end
}
function v9._render_player_row(p_u_53, p_u_54)
    local v55 = p_u_53.entry_template:Clone()
    v55.Name = "PlayerEntry"
    v55.Player.Text = p_u_54.name
    v55.LayoutOrder = #p_u_53.content:GetChildren()
    v55.Button.Size = UDim2.new(0, 150, 1, -4)
    v55.AvatarPic.Image = "https://www.roblox.com/headshot-thumbnail/image?width=60&height=60&format=png&userid=" .. p_u_54.user_id
    v55.Parent = p_u_53.content
    local v56 = p_u_53.UIManager.wrap(v55.Button, "DepthButton")
    v55.Button.Face.TextLabel.Text = p_u_53.options.button_text or "CHOOSE"
    v56:start({
        ["mouse_button1_click"] = function()
            p_u_53.return_value = p_u_54.user_id
            p_u_53.UIManager.set_app_visibility(p_u_53.ClassName, false)
        end
    })
end
function v9._render_header_row(p57, p58)
    local v59 = p57.header_template:Clone()
    v59.Name = "HeaderEntry"
    v59.TextLabel.Text = p58
    v59.LayoutOrder = #p57.content:GetChildren()
    v59.Parent = p57.content
end
function v9._set_scrolling_frame_canvas_size(p60)
    local v61 = p60.content.UIListLayout.AbsoluteContentSize.Y + 20
    p60.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, v61)
end
function v9.refresh_content(p62)
    p62.is_refreshing = true
    p62.refresh_id = p62.refresh_id + 1
    local v63 = p62.refresh_id
    local v64 = p62.options.categories or { "family", "playing_friends", "all" }
    for _, v65 in pairs(p62.content:GetChildren()) do
        if v65.Name == "PlayerEntry" or v65.Name == "HeaderEntry" then
            v65:Destroy()
        end
    end
    p62.loading.Parent = p62.content
    local v_u_66 = nil
    local v_u_67 = nil
    if p62.options.whitelist then
        v_u_66 = v_u_6.new((v_u_29(p62.options.whitelist)))
    elseif p62.options.blacklist then
        v_u_67 = v_u_6.new((v_u_29(p62.options.blacklist)))
    end
    local function v70(p68)
        if typeof(p68) == "Instance" then
            p68 = p68.UserId
        end
        local v69 = not v_u_66 or v_u_66[p68]
        if v69 then
            v69 = not (v_u_67 and v_u_67[p68])
        end
        return v69
    end
    local v71 = {}
    for _, v72 in ipairs(v64) do
        local v73 = nil
        if typeof(v72) == "string" then
            local v74 = v_u_52[v72]
            local v75 = "Unknown category name " .. tostring(v72) .. " to PlayerChooserApp"
            assert(v74, v75)
            if v74 then
                v73 = v74(v70)
            end
        elseif typeof(v72) == "table" then
            v73 = v_u_52.custom(v70, v72)
        end
        if v73 and #v73.players ~= 0 then
            for _, v76 in ipairs(v73.players) do
                if not v76.name then
                    v76.name = "Player"
                    if v76.name_promise then
                        local v77, v78 = v76.name_promise:await()
                        if v77 then
                            v76.name = v78
                        else
                            warn("Failed to get player name from UserId", v76.user_id, "because", v78)
                        end
                    end
                end
            end
            table.insert(v71, v73)
        end
    end
    if p62.refresh_id == v63 then
        if #v71 == 0 then
            p62:_render_header_row("No one found")
        else
            for _, v79 in ipairs(v71) do
                if #v71 > 1 and v79.name then
                    p62:_render_header_row(v79.name)
                end
                for _, v80 in ipairs(v79.players) do
                    p62:_render_player_row(v80)
                end
            end
        end
        if p62.options.bottom_button_text then
            p62.bottom_button.Face.TextLabel.Text = p62.options.bottom_button_text
            p62.bottom_button.Visible = true
            local v81 = p62.body.UIPadding.PaddingTop.Offset
            local v82 = p62.bottom_button.Size.Y.Offset
            local v83 = v81 * 2 + v82
            p62.instance.Frame.Size = p62.frame_size + UDim2.fromOffset(0, v83)
            p62.scrolling_frame.Size = p62.scrolling_frame_size - UDim2.fromOffset(0, v82 + v81)
        else
            p62.scrolling_frame.Size = p62.scrolling_frame_size
            p62.instance.Frame.Size = p62.frame_size
            p62.bottom_button.Visible = false
        end
        p62.loading.Parent = nil
        p62:_set_scrolling_frame_canvas_size()
        p62.is_refreshing = false
    end
end
function v9.choose_player_dialog(p_u_84, p85)
    local v86 = typeof(p85) == "table"
    assert(v86, "Bad type to PlayerChooserApp:choose_player_dialog(options): expected table")
    p_u_84.title_label.Text = p85.title_text or "CHOOSE"
    p_u_84.options = p85
    p_u_84.return_value = nil
    p_u_84.current_coroutine = coroutine.running()
    coroutine.wrap(function()
        p_u_84.UIManager.set_app_visibility(p_u_84.ClassName, true)
    end)()
    return coroutine.yield()
end
function v9._return_value(p87)
    if p87.current_coroutine then
        local v88 = p87.current_coroutine
        p87.current_coroutine = nil
        coroutine.resume(v88, p87.return_value)
    end
end
function v9.show(p89)
    p89.instance.Frame.Visible = true
    p89:refresh_content()
end
function v9.hide(p90)
    p90.instance.Frame.Visible = false
    for _, v91 in pairs(p90.content:GetChildren()) do
        if v91.Name == "PlayerEntry" or v91.Name == "HeaderEntry" then
            v91:Destroy()
        end
    end
    p90:_return_value()
end
function v9.start(p_u_92)
    p_u_92.is_refreshing = false
    p_u_92.refresh_id = 0
    p_u_92.options = {}
    p_u_92.return_value = nil
    p_u_92.scrolling_frame = p_u_92.instance.Frame.Body.ScrollComplex.ScrollingFrame
    p_u_92.content = p_u_92.scrolling_frame.Content
    p_u_92.title_label = p_u_92.instance.Frame.Header.TitleLabel
    p_u_92.entry_template = p_u_92.scrolling_frame.Content.EntryTemplate
    p_u_92.header_template = p_u_92.scrolling_frame.Content.HeaderTemplate
    p_u_92.loading = p_u_92.scrolling_frame.Content.Loading
    p_u_92.entry_template.Parent = nil
    p_u_92.header_template.Parent = nil
    p_u_92.loading.Parent = nil
    p_u_92.exit_button = p_u_92.instance.Frame.Header.ExitButton
    p_u_92.body = p_u_92.instance.Frame.Body
    p_u_92.bottom_button = p_u_92.instance.Frame.Body.BottomButton
    p_u_92.scrolling_frame_size = p_u_92.scrolling_frame.Size
    p_u_92.frame_size = p_u_92.instance.Frame.Size
    p_u_92.UIManager.wrap(p_u_92.bottom_button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_92.return_value = p_u_92.options.bottom_button_text
            p_u_92.UIManager.set_app_visibility(p_u_92.ClassName, false)
        end
    })
    p_u_92.UIManager.wrap(p_u_92.exit_button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_92.UIManager.set_app_visibility(p_u_92.ClassName, false)
        end
    })
    v_u_3.quick_watch({
        ["selection_parent"] = p_u_92.instance.Frame,
        ["default_selection"] = p_u_92.title_label,
        ["app_name"] = p_u_92.ClassName
    })
end
return v9